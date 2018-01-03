#pragma once

#include "ofMain.h"

const int maxNumOfFingers = 12;

const int middleAlpha = 120;
const int scaleAlpha = 120;
const int otherAlpha = 60;

struct Finger {

    float x; float y;
    bool state;
};

class ofFretboard {

  public:
	
	ofFretboard( void );
    
    void setSize( float lb, float hb, float ns ); // set size of the fretboard
    void setNoteOffset( float note ); // set note offset for diagram shifting
    void setBgColor( ofColor bg ); // set background color (diagram also)
    
	void getRightMostTouch( float *x, float *y ); // get the rightmost touch event
	void registerTouch( float x, float y, int fid ); // register a new finger touch
	void unregisterTouch( int fid ); // unregister the finger touch with FID=fid
    
    void drawFret( float position, int alpha );
	void draw( void );
    
  protected:
    
    // state of the finger touch
    Finger finger[maxNumOfFingers];
    
    // diagram
    float LowBound;
    float HighBound;
    float nOfSemitones;
    float semitoneWidth;
	float halfWidth;

    // diagram motion
	float diagramShift;
    float noteOffset;
    
    // fret color
    ofColor fColor;
};
