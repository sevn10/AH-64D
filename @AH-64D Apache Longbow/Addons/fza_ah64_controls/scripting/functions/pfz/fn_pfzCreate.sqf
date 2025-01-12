/* ----------------------------------------------------------------------------
Function: fza_fnc_pfzCreate

Description:
    Runs the in-map user interface that is used for selecting PFZs. Generates the 
    PFZ for the given helicopter and puts all relevant targets inside it.
    
Parameters:
    _heli - the helicopter to create the PFZ on
    _pfznum - the index of the PFZ (in range 1 - 8 inclusive)

Returns:
    Nothing
    
Examples:
    [_heli] spawn fza_fnc_pfzCreate;
    
Author:
---------------------------------------------------------------------------- */
_heli = _this select 0;
_pfznum = _this select 1;
_pfz = [];
fza_ah64_pfz_counter = 0;
fza_ah64_curpfzarea = [];

if (_heli getVariable "fza_ah64_pfz_count" == 0) exitwith {
    _heli vehiclechat "PFZ is not selected!";
};

_markerarea = "fza_ah64_pfz" + format["%1", _pfznum] + "m";
_markername = "fza_ah64_pfz" + format["%1", _pfznum] + "n";

deleteMarkerLocal _markerarea;
deleteMarkerLocal _markername;

_heli vehiclechat format["PFZ%1 ACTIVE", _pfznum];

onMapSingleClick "fza_ah64_curpfzarea = fza_ah64_curpfzarea + [_pos]; fza_ah64_pfz_counter = fza_ah64_pfz_counter + 1; true;";

waituntil {
    fza_ah64_pfz_counter == 2;
};

onMapSingleClick "";

_heli vehiclechat format["PFZ%1 CREATED", _pfznum];

_xsize = [(fza_ah64_curpfzarea select 0) select 0, 0, 0] distance[(fza_ah64_curpfzarea select 1) select 0, 0, 0];
_ysize = [(fza_ah64_curpfzarea select 0) select 1, 0, 0] distance[(fza_ah64_curpfzarea select 1) select 1, 0, 0];

_radius = _xsize;

if (_ysize > _xsize) then {
    _radius = _ysize;
};

_xpos = (_xsize * 0.5) + ((fza_ah64_curpfzarea select 0) select 0);
_ypos = (_ysize * 0.5) + ((fza_ah64_curpfzarea select 0) select 1);
_xgreat = 0;
_ygreat = 0;

if (((fza_ah64_curpfzarea select 1) select 0) < ((fza_ah64_curpfzarea select 0) select 0)) then {
    _xpos = (_xsize * 0.5) + ((fza_ah64_curpfzarea select 1) select 0);
    _xgreat = 1;
};

if (((fza_ah64_curpfzarea select 1) select 1) < ((fza_ah64_curpfzarea select 0) select 1)) then {
    _ypos = (_ysize * 0.5) + ((fza_ah64_curpfzarea select 1) select 1);
    _ygreat = 1;
};

createmarkerlocal[_markerarea, [_xpos, _ypos]];
_markerarea setMarkerShapeLocal "RECTANGLE";
_markerarea setMarkerSizeLocal[_xsize * 0.5, _ysize * 0.5];
_markerarea setMarkerColorLocal "ColorWhite";
_markerarea setMarkerAlphaLocal 0.4;

createmarkerlocal[_markername, [_xpos, _ypos]];
_markername setMarkerShapeLocal "ICON";
_markername setMarkerTypeLocal "mil_dot";
_markername setMarkerTextLocal "PFZ" + format["%1", _pfznum];
_markername setMarkerColorLocal "ColorBlack";


assert (1 <= _pfznum && _pfznum <= 8);
(_heli getVariable "fza_ah64_pfzs") set [_pfznum - 1, _pfz];
_heli setVariable ["fza_ah64_pfzs", _heli getVariable "fza_ah64_pfzs", true];