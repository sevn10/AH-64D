#include "\fza_ah64_mpd\headers\mfdConstants.h"
#include "\fza_ah64_controls\headers\wcaConstants.h"
#include "\fza_ah64_controls\headers\systemConstants.h"
params ["_heli", "_mpdIndex"];

//Chaff
private _chaffState = BOOLTONUM(_heli getVariable "fza_ah64_ase_chaffState" == "safe");
_heli setUserMfdValue [MFD_INDEX_OFFSET(MFD_IND_ASE_CHAFF_STATE), _chaffState];
private _chaffCount = 0; //<-- this is duplicated in the WPN page!!
{
    _x params ["_className", "_turretPath", "_ammoCount"];
    if (_className == "60Rnd_CMFlareMagazine" && _turretPath isEqualTo [-1]) then {
        _chaffCount = _chaffCount + _ammoCount;
    };
} forEach magazinesAllTurrets _heli;
_heli setUserMfdText  [MFD_INDEX_OFFSET(MFD_TEXT_IND_WPN_CHAFF_QTY), _chaffCount toFixed 0];

//IR Jammer
private _irJamPwr   = BOOLTONUM(_heli getVariable "fza_ah64_ase_irJamPwr" == "off");
_heli setUserMfdValue [MFD_INDEX_OFFSET(MFD_IND_ASE_IRJAM_PWR), _irJamPwr];
private _irJamState = _heli getVariable "fza_ah64_ase_irJamState";
_heli setUserMfdValue [MFD_INDEX_OFFSET(MFD_IND_ASE_IRJAM_STATE), _irJamState];

//Autopage
private _autopage = _heli getVariable "fza_ah64_ase_autopage";
_heli setUserMfdValue [MFD_INDEX_OFFSET(MFD_IND_ASE_AUTOPAGE), _autopage];

//RLWR
private _rlwrPwr = BOOLTONUM(_heli getVariable "fza_ah64_ase_rlwrPwr" == "off");
_heli setUserMfdValue [MFD_INDEX_OFFSET(MFD_IND_ASE_RLWR_PWR), _rlwrPwr];
private _rlwrCount = _heli getVariable "fza_ah64_ase_rlwrCount";
_heli setUserMfdText  [MFD_INDEX_OFFSET(MFD_TEXT_IND_ASE_RLWR_COUNT), _rlwrCount toFixed 0];