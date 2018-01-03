#include "testApp.h"
#include "ofConfigView.h"

ofConfigView *configView;

void testApp::setup( void ) {
	
	ofxAccelerometer.setup(); ofRegisterTouchEvents( this );
	iPhoneSetOrientation( OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT );
    
    configView	= [ [ofConfigView alloc] initWithNibName:@"ofConfigView" bundle:nil ];
	[ ofxiPhoneGetGLParentView() addSubview:configView.view ]; //-------------------
    
    configView.view.hidden = YES;
    
    ofEnableSmoothing(); ofSetFrameRate( 50 );
    ofSetLogLevel( OF_LOG_ERROR );
    
    Receiver.setup( 7000 );
    isSenderOn = false;
    
    lowBound = ofGetHeight(); highBound = 0;
    
    fretboard.setSize( lowBound, highBound, 5.5 );
    fretboard.getRightMostTouch( &touchX, &touchY );
        
    shiftSmooth.resize( nOfShift, 0.0 );
    xTiltSmooth.resize( nOfThift, 0.0 );
    yTiltSmooth.resize( nOfThift, 0.0 );
    
    oscPitch = 52.0f; thPitch = -4.0f;
    
    aVow.resize( 4 ); eVow.resize( 4 );
    
    aVow[0].Freq = 609; aVow[0].Ampl = 2; aVow[0].Band = 80;
    aVow[1].Freq = 1000; aVow[1].Ampl = -3; aVow[1].Band = 90;
    aVow[2].Freq = 2450; aVow[2].Ampl = -8; aVow[2].Band = 90;
    aVow[3].Freq = 2700; aVow[3].Ampl = -6; aVow[3].Band = 100;
    
    eVow[0].Freq = 400; eVow[0].Ampl = 0; eVow[0].Band = 83;
    eVow[1].Freq = 1700; eVow[1].Ampl = -7; eVow[1].Band = 92;
    eVow[2].Freq = 2300; eVow[2].Ampl = -6; eVow[2].Band = 94;
    eVow[3].Freq = 2900; eVow[3].Ampl = -8; eVow[3].Band = 110;
    
    voiceSynth.setAudioProperties( audioSampleRate, tickBufferSize );
    memset( sBuffer, 0, tickBufferSize ); // init audio properties
    
    if( !XML.loadFile( ofxiPhoneGetDocumentsDirectory() + "data.xml" ) ) {
        
        XML.loadFile( "data.xml" ); // get the XML file from whereever
    }
    
    setPod( XML.getValue( "PRESET:POD", 0 ) );
    
    // JOHNTY: the two first values here set the number of outputs and
    // the number of inputs. I guess you need to have 2 and 2 here ----
    ofSoundStreamSetup( 1, 0, this, audioSampleRate, tickBufferSize, 4 );
}

void testApp::exit( void ) {
    
    XML.setValue( "PRESET:POD", podIndex ); // saving the value
    XML.saveFile( ofxiPhoneGetDocumentsDirectory() + "data.xml" );
}

void testApp::update( void ) {
    
    while( Receiver.hasWaitingMessages() ) {
        
        Message.clear();
        Receiver.getNextMessage( &Message );
        
        if( Message.getAddress() == oscTag &&
        Message.getArgAsInt32( 1 ) == podIndex ) {
            
            oscPitch = Message.getArgAsFloat( 2 );
            thPitch = oscPitch - 56.0f;
        }
        
        if( Message.getAddress() == "/server/connect" ) {
            
            if( !isSenderOn ) {
                
                Sender.setup( Message.getArgAsString( 0 ), 8000 );
                isSenderOn = true; // set server with sent IP
            }
        }
    }
    
    // this is smoothing the note shift ------------------------------------
    noteShift = 0.0; shiftSmooth.push_front( thPitch ); shiftSmooth.pop_back();
    for( int k=0; k<shiftSmooth.size(); k++ ) noteShift += shiftSmooth[k];
    noteShift /= shiftSmooth.size(); fretboard.setNoteOffset( noteShift );
    
    // this is smoothing the x-tilt shift ----------------------------------------------------
    tiltX = 0.0; xTiltSmooth.push_front( ofxAccelerometer.getForce().x ); xTiltSmooth.pop_back();
    for( int k=0; k<xTiltSmooth.size(); k++ ) tiltX += xTiltSmooth[k]; tiltX /= xTiltSmooth.size();
    
    // this is smoothing the y-tilt shift ----------------------------------------------------
    tiltY = 0.0; yTiltSmooth.push_front( ofxAccelerometer.getForce().y ); yTiltSmooth.pop_back();
    for( int k=0; k<yTiltSmooth.size(); k++ ) tiltY += yTiltSmooth[k]; tiltY /= yTiltSmooth.size();
    
    if( isSenderOn ) sendOscMessage();
    
    float vowInterp = ofMap( tiltX, -0.8, -0.2, 0.0, 1.0, true );
    
    voiceSynth.Formant[0].Freq = formShift*(vowInterp*eVow[0].Freq + (1-vowInterp)*aVow[0].Freq);
    voiceSynth.Formant[0].Ampl = vowInterp*eVow[0].Ampl + (1-vowInterp)*aVow[0].Ampl;
    voiceSynth.Formant[0].Band = vowInterp*eVow[0].Band + (1-vowInterp)*aVow[0].Band;
    
    voiceSynth.Formant[1].Freq = formShift*(vowInterp*eVow[1].Freq + (1-vowInterp)*aVow[1].Freq);
    voiceSynth.Formant[1].Ampl = vowInterp*eVow[1].Ampl + (1-vowInterp)*aVow[1].Ampl;
    voiceSynth.Formant[1].Band = vowInterp*eVow[1].Band + (1-vowInterp)*aVow[1].Band;
    
    voiceSynth.Formant[2].Freq = formShift*(vowInterp*eVow[2].Freq + (1-vowInterp)*aVow[2].Freq);
    voiceSynth.Formant[2].Ampl = vowInterp*eVow[2].Ampl + (1-vowInterp)*aVow[2].Ampl;
    voiceSynth.Formant[2].Band = vowInterp*eVow[2].Band + (1-vowInterp)*aVow[2].Band;
    
    voiceSynth.Formant[3].Freq = formShift*(vowInterp*eVow[3].Freq + (1-vowInterp)*aVow[3].Freq);
    voiceSynth.Formant[3].Ampl = vowInterp*eVow[3].Ampl + (1-vowInterp)*aVow[3].Ampl;
    voiceSynth.Formant[3].Band = vowInterp*eVow[3].Band + (1-vowInterp)*aVow[3].Band;
    
    voiceSynth.Note = 36.0f+noteShift+touchX;
    voiceSynth.Tenseness = touchY;
    voiceSynth.Volume = touchY;
}

void testApp::draw( void ) {
    
    fretboard.draw();
}

void testApp::touchDown( ofTouchEventArgs & touch ) {
    
    fretboard.registerTouch( touch.x, touch.y, touch.id );
    fretboard.getRightMostTouch( &touchX, &touchY );
}

void testApp::touchMoved( ofTouchEventArgs & touch ) {
    
    fretboard.registerTouch( touch.x, touch.y, touch.id );
    fretboard.getRightMostTouch( &touchX, &touchY );
}

void testApp::touchUp( ofTouchEventArgs & touch ) {
    
    fretboard.unregisterTouch( touch.id );
    fretboard.getRightMostTouch( &touchX, &touchY );
}

void testApp::touchDoubleTap( ofTouchEventArgs & touch ) {
    
    if( tiltX > -0.2 && tiltX < 0.2 && tiltY < -0.9 ) {
        
        if( configView.view.hidden == YES ) {
            
            configView.view.hidden = NO;
        }
    }
}

void testApp::touchCancelled( ofTouchEventArgs & touch ) {
    
    
}

// JOHNTY: here are the audio callbacks. *outBuf will give you interlaced
// channels to write into so to output your audio. Create an equivalent
// audioIn() callback with *inBuf to access to 2 interlaced audio in

void testApp::audioOut( float *outBuf, int bufferSize, int nChan ) {

    voiceSynth.tick( outBuf ); // ticking
}

void testApp::deviceOrientationChanged( int ori ) {
    
    
}

void testApp::gotMemoryWarning( void ) {
    
    
}

void testApp::lostFocus( void ) {

    
}

void testApp::gotFocus( void ) {

    
}

void testApp::sendOscMessage( void ) {
    
    Message.clear();
    
    Message.setAddress( "/ipod" );
    Message.addIntArg( podIndex );
    
    Message.addFloatArg( touchX );
    Message.addFloatArg( touchY );
    
    Message.addFloatArg( tiltX );
    Message.addFloatArg( tiltY );
    
    Sender.sendMessage( Message );
}

void testApp::setPod( int pidx ) {
    
    podIndex = pidx; // change podIndex for OSC stuff
    
    if( podIndex == 7 ) bgColor.setHsb( 0, 0, 255 ); // gray
    else bgColor.setHsb( colorMap.get( podIndex ), 255, 255 );
    
    fretboard.setBgColor( bgColor ); // transfer bg color
    ofBackground( bgColor ); // set background color
    
    switch ( podIndex ) {
            
        case BASS:
            
            voiceSynth.BaseFreq = 55.0f;
            formShift = 0.86f;
            break;
            
        case TENOR:
            
            voiceSynth.BaseFreq = 110.0f;
            formShift = 1.0f;
            break;
            
        case ALTO:
            
            voiceSynth.BaseFreq = 110.0f;
            formShift = 1.19f;
            break;
            
        case SOPRANO:
            
            voiceSynth.BaseFreq = 110.0f;
            formShift = 1.32f;
            break;
            
        default:
            
            voiceSynth.BaseFreq = 110.0f;
            formShift = 1.0f;
            break;
    }
}
