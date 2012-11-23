////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#ifndef __LANL_OUTPUT_H_h
#define __LANL_OUTPUT_H_h

////////////////////////////////////////////////////////////////////////////////

// system included
#include <stdexcept>
#include <sstream>

// local includes
#include "XOUT.h"                                 // <--- this is the super class
#include <arpa/inet.h>                            // net to host and host to net functions

// get the namespace
namespace xdaq
{

    // the class definition
    class LANLOutput: public XOUT
    {
        public:

            // constructor
            LANLOutput();

            // destructor
            virtual ~LANLOutput() {}

            // commands
            void writeRecordXOUT( const XPulseRec &PulseRec );
            void writeHeaderXOUT( XPulseRec PR );

        private:

    };                                            // end of class def

}                                                 // end of name space


////////////////////////////////////////////////////////////////////////////////
#endif

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
