#pragma once

#include "ofMain.h"
#include <vector>
#include <cmath>

const int nOfAVals = 100;
const int nOfGfMem = 3;

struct FormType {

    double Freq;
    double Ampl;
    double Band;
};

class ofVoiceSynth {
    
  public:
    
    ofVoiceSynth( void );
    void setAudioProperties( int _srate, int _tick );
    void tick( float *buffer );
    
    // --- INTERFACE PARAMETERS ---
    double BaseFreq; // base frequency
    double Note; // # of added semitones
    double Tenseness; // GF tenseness
    double Volume; // GF volume
    
    vector<FormType> Formant;
    
  private:
    
    inline double getA( double Am ); // compute a = f(Am)
    inline void shiftGlottalBuffers( void ); // shift GF buffers
    
    std::vector<double> aFunc; // pre-processed table for a=f(Am)
    double t; // circular / incremental time index for the period
    
    double Fo; // instantaneous pitch value
    double Oq; // glottal source open quotient
    double Am; // glottal source asymetry coefficient
    double Tl; // glottal source spectral tilt (dB)
    
    std::vector<float> gFlow;
    std::vector<float> gDeri;
    std::vector<float> gTilt;
    
    std::vector<float> gFor1;
    std::vector<float> gFor2;
    std::vector<float> gFor3;
    std::vector<float> gFor4;
    
    int audioSampleRate;
    int tickBufferSize;
};
