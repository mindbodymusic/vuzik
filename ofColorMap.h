#pragma once

#include <vector>

class ofColorMap {

  public:
    
    ofColorMap( void );
    float get( int index );
    
  protected:
    
    std::vector<float> map;
};
