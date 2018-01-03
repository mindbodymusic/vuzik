#include "ofFretboard.h"

ofFretboard::ofFretboard( void ) {
	
    noteOffset = 0.0;
    
	// start with no fingers on the board
	for( int k=0; k<maxNumOfFingers; k++ ) {
		
		finger[k].state = false;
	}
}

void ofFretboard::setSize( float lb, float hb, float ns ) {
    
    LowBound = lb; HighBound = hb;
    nOfSemitones = ns;
}

void ofFretboard::setNoteOffset( float note ) {

    noteOffset = note;
}

void ofFretboard::setBgColor( ofColor bg ) {

    fColor = bg; fColor.setBrightness( 150 );
}

void ofFretboard::getRightMostTouch( float *x, float *y ) {
	
	// start left-down corner
	float rightMostY = HighBound;
	float rightMostX = ofGetWidth();
	
	// look for bigger Y values
	for( int k=0; k<maxNumOfFingers; k++ ) {
		
		// on current touches
		if( finger[k].state == true ) {
			
			// if found = update
			if( finger[k].x < rightMostX ) {
				
				rightMostY = finger[k].y;
				rightMostX = finger[k].x;
			}
		}
	}
	
	// adjust mapping
	*x = ofMap( rightMostX, 0.0, ofGetWidth(), nOfSemitones, -nOfSemitones, true );
	*y = ofMap( rightMostY, LowBound, HighBound, 1.0, 0.0, true );
}

void ofFretboard::registerTouch( float x, float y, int fid ) {
	
    finger[fid].x = x; finger[fid].y = y;
	finger[fid].state = true;
}

void ofFretboard::unregisterTouch( int fid ) {
	
	finger[fid].state = false;
}

void ofFretboard::drawFret( float position, int alpha ) {
	
	// left reflection
	ofSetColor( fColor, alpha-20 );
    ofLine( position-1, LowBound, position-1, HighBound );
	
	// right reflection
	ofSetColor( fColor, alpha-10 );
    ofLine( position+1, LowBound, position+1, HighBound );
	
	// main line
	ofSetColor( fColor, alpha );
    ofLine( position, LowBound, position, HighBound );
}

void ofFretboard::draw( void ) {
    
    int km; int fAlpha;
    
    // get width of a semitone
    halfWidth = ofGetWidth() / 2.0;
    semitoneWidth = halfWidth / nOfSemitones;
    
    // clip note offset to +/- 3 octaves
    if( noteOffset > 48.0 ) noteOffset = 48.0;
    if( noteOffset < -48.0 ) noteOffset = -48.0;
    
    // compute the shift of the diagram
    diagramShift = noteOffset * semitoneWidth;
    
    // --- upper notes ---
    for( int k=0; k<48; k++ ) {
        
        km = k%12;
        
        // select upper notes of the major scale
        if( km == 0 || km == 2 || km == 4 || km == 5 || km == 7
        || km == 9 || km == 11 ) fAlpha = scaleAlpha;
        else fAlpha = otherAlpha;
        
        // draw upper lines
        drawFret( halfWidth+(k*semitoneWidth)
        +diagramShift, fAlpha );
    }
    
    // --- lower notes ---
    for( int k=1; k<48; k++ ) {
        
        km = k%12;
        
        // select lower notes of the major scale
        if( km == 1 || km == 3 || km == 5 || km == 7 ||
        km == 8 || km == 10 ) fAlpha = scaleAlpha;
        else fAlpha = otherAlpha;
        
        // draw lower lines
        drawFret( halfWidth-(k*semitoneWidth)
        +diagramShift, fAlpha );
    }
    
    drawFret( halfWidth, middleAlpha );
}
