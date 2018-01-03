#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"

#include "ofxXmlSettings.h"
#include "ofxOsc.h"

#include "ofFretboard.h"
#include "ofVoiceSynth.h"
#include "ofColorMap.h"

enum {
    
    BASS, TENOR,
    ALTO, SOPRANO
};

const int nOfShift = 3;
const int nOfThift = 20;

const string oscTag = "/bpf";

const int audioSampleRate = 44100;
const int tickBufferSize = 512;

class testApp : public ofxiPhoneApp {

  public:
    
    void setup( void );
    void exit( void );
    
    void update( void );
    void draw( void );
	
    void touchDown( ofTouchEventArgs &touch );
    void touchMoved( ofTouchEventArgs &touch );
    void touchUp( ofTouchEventArgs &touch );
    
    void touchDoubleTap( ofTouchEventArgs & touch );
    void touchCancelled( ofTouchEventArgs & touch );
    
    void audioOut( float *outBuf, int bufferSize, int nChan );

    void deviceOrientationChanged( int ori );
    void gotMemoryWarning( void );
    
    void lostFocus( void );
    void gotFocus( void );
    
    void setPod( int pidx );
    
  protected:
    
    void sendOscMessage( void );
    
    ofxXmlSettings XML;
    
    ofColorMap colorMap;
    ofColor bgColor;
    
    ofFretboard fretboard;
    float lowBound, highBound;
    float touchX, touchY;
    float noteShift;
    
    deque<float> shiftSmooth;
    float oscPitch; float thPitch;
    
    deque<float> xTiltSmooth;
    deque<float> yTiltSmooth;
    float tiltX; float tiltY;
    
    ofxOscReceiver Receiver;
    ofxOscMessage Message;
    ofxOscSender Sender;
    bool isSenderOn;
    
    vector<FormType> aVow;
    vector<FormType> eVow;
    float formShift;
    
    float sBuffer[tickBufferSize];
    ofVoiceSynth voiceSynth;
    
    int podIndex;
};
