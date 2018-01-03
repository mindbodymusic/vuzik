#include "ofVoiceSynth.h"

ofVoiceSynth::ofVoiceSynth( void ) {
    
    // hard-coded function for computing a = f(Am)
    double _a[ nOfAVals ] = { 0.0, 0.0019, 0.0075, 0.0163, 0.0283, 0.0432,
    0.0608, 0.0810, 0.1036, 0.1284, 0.1555, 0.1847, 0.2159, 0.2490, 0.2841,
    0.3209, 0.3596, 0.4000, 0.4420, 0.4858, 0.5313, 0.5783, 0.6270, 0.6773,
    0.7293, 0.7828, 0.8379, 0.8947, 0.9531, 1.0132, 1.0749, 1.1384, 1.2035,
    1.2704, 1.3391, 1.4097, 1.4821, 1.5564, 1.6328, 1.7112, 1.7917, 1.8744,
    1.9593, 2.0466, 2.1364, 2.2287, 2.3237, 2.4215, 2.5222, 2.6260, 2.7329,
    2.8433, 2.9572, 3.0750, 3.1967, 3.3226, 3.4531, 3.5883, 3.7286, 3.8744,
    4.0261, 4.1840, 4.3487, 4.5206, 4.7004, 4.8887, 5.0862, 5.2938, 5.5124,
    5.7430, 5.9869, 6.2453, 6.5200, 6.8126, 7.1252, 7.4603, 7.8206, 8.2096,
    8.6310,  9.0897,  9.5912,  10.1423, 10.7515, 11.4289, 12.1876, 13.0437,
    14.0185, 15.1392, 16.4427, 17.9787, 19.8174, 22.0597, 24.8570, 28.4477,
    33.2284, 39.9134, 49.9315, 66.6158, 99.9664, 199.9834 };
	aFunc.insert( aFunc.begin(), _a, _a+nOfAVals );
	
	gFlow.resize( nOfGfMem, 0.0 );
    gDeri.resize( nOfGfMem, 0.0 );
    gTilt.resize( nOfGfMem, 0.0 );
    
    gFor1.resize( nOfGfMem, 0.0 );
    gFor2.resize( nOfGfMem, 0.0 );
    gFor3.resize( nOfGfMem, 0.0 );
    gFor4.resize( nOfGfMem, 0.0 );
    
    // initialize interface parameters
    BaseFreq = 110.0; Note = 0.0; Volume = 0.0; Tenseness = 0.6;
	
    // initialize source parameters
    Fo = 110.0; Oq = 0.8; Am = 0.7; Tl = 3.0;
    
    // formants
    Formant.resize( 4 );
    
    // set formant frequencies, amplitudes and bandwidths
    Formant[0].Freq = 609.0; Formant[0].Ampl = 0.0; Formant[0].Band = 80.0;
    Formant[1].Freq = 1000.0; Formant[1].Ampl = -5.0; Formant[1].Band = 90.0;
    Formant[2].Freq = 2450.0; Formant[2].Ampl = -10.0; Formant[2].Band = 90.0;
    Formant[3].Freq = 2700.0; Formant[3].Ampl = -8.0; Formant[3].Band = 100.0;
    
    t = 0.0; // initialize time
}

void ofVoiceSynth::setAudioProperties( int _srate, int _tick ) {
    
    audioSampleRate = _srate;
    tickBufferSize = _tick;
}

void ofVoiceSynth::tick( float *buffer ) {
    
    double tOq; // squeezed time index
	double a = getA(Am); // get the current a=f(Am) value
	double Eta, Nu, aTl, bTl; // spectral tilt parameters
    double R, A, G; // formant filtering parameters
    
    for( int k=0; k<tickBufferSize; k++ ) {
		
		tOq = t/Oq;
		
        gFlow[0] = (float)((1.0 + exp(a*tOq)*(a*(Am/M_PI)*
        sin((M_PI*tOq)/Am) - cos((M_PI*tOq)/Am))) / (1.0 + exp(a*Am)));
		if( gFlow[0] < 0 ) gFlow[0] = 0.0; // equations for GF
        gDeri[0] = gFlow[0] - gFlow[1]; // derivation
        
        Tl = 20.0 - ( 16.0 * Tenseness ); // tenseness -> Tl
        
        Eta = ((1.0/(exp((-(Tl)/10.0) * (log(10.0))))) - 1.0) /
        ((cos(2.0*M_PI*( 3000.0 / (double)audioSampleRate ))) - 1.0);
        Nu  = 1.0 - ( 1.0 / Eta ); aTl = Nu - sqrt( ( Nu*Nu ) - 1.0 );
		bTl = 1.0 - aTl; // computer filter parameters for sp. tilt
        
        // apply spectral tilt filtering on GFD
        gTilt[0] = ((float)bTl) * gDeri[0] + ((float)aTl) * gTilt[1];
        
        float corrForFreq = 0.0;
        if( Fo > Formant[0].Freq ) corrForFreq = Fo - 30;
        else corrForFreq = Formant[0].Freq;
        
        // FORMANT 1: compute pole position and gain
        R = exp( ( -M_PI*Formant[0].Band ) / audioSampleRate );
        A = ( 2.0*M_PI*corrForFreq ) / audioSampleRate;
        G = powf( 10.0, ( Formant[0].Ampl / 20.0 ) );
        
        // FORMANT 1: filter GFD signal
        gFor1[0] = G * ( (1.0-R*R)/2.0 ) * ( gTilt[0] - gTilt[2] )
		+ ( 2.0*R*cos( A ) ) * gFor1[1] - ( R*R ) * gFor1[2];
        
        // FORMANT 2: compute pole position and gain
        R = exp( ( -M_PI*Formant[1].Band ) / audioSampleRate );
        A = ( 2.0*M_PI*Formant[1].Freq ) / audioSampleRate;
        G = powf( 10.0, ( Formant[1].Ampl / 20.0 ) );
        
        // FORMANT 2: filter GFD signal
        gFor2[0] = G * ( (1.0-R*R)/2.0 ) * ( gTilt[0] - gTilt[2] )
		+ ( 2.0*R*cos( A ) ) * gFor2[1] - ( R*R ) * gFor2[2];
        
        // FORMANT 3: compute pole position and gain
        R = exp( ( -M_PI*Formant[2].Band ) / audioSampleRate );
        A = ( 2.0*M_PI*Formant[2].Freq ) / audioSampleRate;
        G = powf( 10.0, ( Formant[2].Ampl / 20.0 ) );
        
        // FORMANT 3: filter GFD signal
        gFor3[0] = G * ( (1.0-R*R)/2.0 ) * ( gTilt[0] - gTilt[2] )
		+ ( 2.0*R*cos( A ) ) * gFor3[1] - ( R*R ) * gFor3[2];
        
        // FORMANT 4: compute pole position and gain
        R = exp( ( -M_PI*Formant[3].Band ) / audioSampleRate );
        A = ( 2.0*M_PI*Formant[3].Freq ) / audioSampleRate;
        G = powf( 10.0, ( Formant[3].Ampl / 20.0 ) );
        
        // FORMANT 4: filter GFD signal
        gFor4[0] = G * ( (1.0-R*R)/2.0 ) * ( gTilt[0] - gTilt[2] )
		+ ( 2.0*R*cos( A ) ) * gFor4[1] - ( R*R ) * gFor4[2];
         
        buffer[k] = Volume * 10.0f * ( gFor1[0] + gFor2[0] + gFor3[0] + gFor4[0] );
        shiftGlottalBuffers();
        
        t = t + ( Fo / (double)audioSampleRate );
		
        if( t > 1.0 ) {
            
            t = t - 1.0;
            
            Fo = BaseFreq * exp( 0.057762265 * Note );
            
            Oq = 1.0 - ( 0.4 * Tenseness );
            Am = 0.5 + ( 0.25 * Tenseness );
        }
    }
}

double ofVoiceSynth::getA( double Am ) {
    
    int aIdx;
    float aIdxAll, aIdxDec;
    float a;
	
    // find index in the table and intep. factor
    aIdxAll = ((float)(nOfAVals-1)/0.5)*(Am - 0.5);
    aIdx = (int)(aIdxAll); // <float_idx> = <int_idx> . <interp_factor>
    aIdxDec = aIdxAll - (float)(aIdx);
	
    // interpolate the 2 closest
    if (aIdx == nOfAVals-1) a = aFunc[nOfAVals-1];
    else a = (1.0-aIdxDec)*(aFunc[aIdx]) + aIdxDec*(aFunc[aIdx+1]);
	
    return a;
}

void ofVoiceSynth::shiftGlottalBuffers( void ) {
    
    int k = nOfGfMem-1;
	
    while ( k > 0 ) {
		
        gFlow[k] = gFlow[k-1];
        gDeri[k] = gDeri[k-1];
        gTilt[k] = gTilt[k-1];
        
        gFor1[k] = gFor1[k-1];
        gFor2[k] = gFor2[k-1];
        gFor3[k] = gFor3[k-1];
        gFor4[k] = gFor4[k-1];
        
        k--;
    }
}
