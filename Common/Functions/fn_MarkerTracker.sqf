/*
  # HEADER #
	Script: 		Common\Functions\fn_MarkerTracker.sqf
	Alias:			
	Description:			      
          FR = Fonction d'avoir un marker tracker. 
          
          EN = Function that allows you to make a marker tracker.
	Author: 		Popo
	Creation Date:	10-06-2024
	Revision Date:	10-06-2024
	
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

_marker = createMarker ["tracker", _object];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerTypeLocal "mil_dot";

while {alive _object} do
{
_marker setmarkerpos getpos _object;
sleep 3;
};

deletemarker _marker;

true