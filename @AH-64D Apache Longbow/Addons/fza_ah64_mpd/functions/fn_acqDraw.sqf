 /* ----------------------------------------------------------------------------
Function: fza_mpd_fnc_acqDraw

Description:
    Draw the acquisition source details

Parameters:
    _heli - the apache to show the correct values for.
    _mpdIndex - the MPD 

Returns:
    Nothing

Author:
    mattysmith22
---------------------------------------------------------------------------- */
#include "\fza_ah64_mpd\headers\mfdConstants.h"
params ["_heli", "_mpdIndex", "_floatIndex", "_stringIndex"];

private _acq = "FXD";

_heli setUserMFDText [MFD_INDEX_OFFSET(_stringIndex), _acq];
_heli setUserMFDValue [MFD_INDEX_OFFSET(_floatIndex), count _acq];
