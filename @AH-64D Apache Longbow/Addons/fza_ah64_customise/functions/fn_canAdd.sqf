/* ----------------------------------------------------------------------------
Function: fza_customise_fnc_canAdd

Description:
    Can you add the relevent component

Parameters:
    _heli - The apache
    _player - The player
    _targetcomp - desired component to add

Returns:
    Bool: if it can add the component
    
Examples:

Author:
    Rosd6(Dryden)
---------------------------------------------------------------------------- */
params ["_heli","_player","_targetComp"];

private _return = false;

if (_targetComp == "FCR") then {
    if (!("ToolKit" in (items _player))) exitWith {};
    if (_heli animationPhase "fcr_enable" == 1) exitWith {};
    private _nearestObject = nearestObject [_player, "fza_ah64_FireControlRadar"];
    if (isNull _nearestObject || (_player distance _nearestObject > 10)) exitWith {};
    _return = true;
};
if (_targetComp == "IAFS") then {
    if (!("ToolKit" in (items _player))) exitWith {};
    if (_heli animationPhase "magazine_set_1200" == 0) exitwith {};
    private _nearestObject = nearestObject [_player, "fza_ah64_IAFS"];
    if (isNull _nearestObject || (_player distance _nearestObject > 10)) exitWith {};
    _return = true;
};
if (_targetComp == "MAG") then {
    if (!("ToolKit" in (items _player))) exitWith {};
    if (_heli animationPhase "magazine_set_1200" == 1) exitWith {};
    private _nearestObject = nearestObject [_player, "fza_ah64_1200Magazine"];
    if (isNull _nearestObject || (_player distance _nearestObject > 10)) exitWith {};
    _return = true;
};
_return;