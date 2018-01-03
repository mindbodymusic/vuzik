#include "ofColorMap.h"

ofColorMap::ofColorMap( void ) {
    
    map.push_back( 315.0f ); // PINK ( podIndex = 0 )
    map.push_back( 000.0f ); // RED ( podIndex = 1 )
    map.push_back( 025.0f ); // ORANGE ( podIndex = 2 )
    map.push_back( 058.0f ); // YELLOW ( podIndex = 3 )
    map.push_back( 140.0f ); // GREEN ( podIndex = 4 )
    map.push_back( 195.0f ); // BLUE ( podIndex = 5 )
    map.push_back( 240.0f ); // NAVY ( podIndex = 6 )
    map.push_back( -10.0f ); // GRAY ( podIndex = 7 )
}

float ofColorMap::get( int index ) {

    return( ( map[index]/365.0f ) * 255.0f );
}
