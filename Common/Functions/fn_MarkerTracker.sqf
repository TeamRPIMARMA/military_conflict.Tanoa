/*
  # HEADER #
	Script: 		Common\Functions\fn_MarkerTracker.sqf
	Alias:			
	Description:			      
          FR = Fonction qui simule un tracker GPS Global. 
          
          EN = Function that simulates a GPS tracker Global.
	Author: 		Popo
	Creation Date:	10-06-2024
	Revision Date:	22-06-2024
	
  # PARAMETERS #
  0	[String]: loop condition

  # RETURNED VALUE #

  # SYNTAX #
	["_object"] spawn POPO_fnc_MarkerTracker;

  # DEPENDENCIES #

  # EXAMPLE #
  [CargoV44Created] spawn POPO_fnc_MarkerTracker;
  
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_object"];

trackerGPS = true;
publicVariable "trackerGPS";

_markerNumber = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
_resultNumberRandom = selectRandom _markerNumber;
private _marker = format["markerT_%1",_resultNumberRandom];
private _marker2 = format["markerTAlpha_%1",_resultNumberRandom];
_markerNumber deleteAt (_markerNumber find _markerNumber);

if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["%1", _marker];};
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["%1", _marker2];};

while {alive _object && trackerGPS isEqualTo true} do
{
  _marker = createMarker ["_marker", _object];
  _marker setMarkerShape "ICON";
  _marker setMarkerColor "ColorYellow";
  _marker setMarkerType "mil_dot";
  _marker setMarkerPos getpos _object;
  _marker setMarkerText "";
  sleep 1;
  deleteMarker _marker;
  _marker2 = createMarker ["_marker2", _object];
  _marker2 setMarkerShape "";
  _marker2 setMarkerAlpha 0;
  _marker2 setMarkerType "";
  _marker2 setMarkerPos getpos _object;
  _marker2 setMarkerText "";
  deleteMarker _marker2;
  sleep 1;
  if (trackerGPS isEqualTo false) exitWith 
		{
			hint "TRACKER GPS OFF";
		};
};

deleteMarker _marker;
deleteMarker _marker2;

true

