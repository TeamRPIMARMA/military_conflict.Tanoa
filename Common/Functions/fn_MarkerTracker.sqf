/*
  # HEADER #
	Script: 		Common\Functions\fn_MarkerTracker.sqf
	Alias:			
	Description:			      
          FR = Fonction d'avoir un marker tracker. 
          
          EN = Function that allows you to make a marker tracker.
	Author: 		Popo
	Creation Date:	10-06-2024
	Revision Date:	20-06-2024
	
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

while {alive _object} do
{
  _marker = createMarker ["tracker", _object];
  _marker setMarkerShapeLocal "ICON";
  _marker setMarkerColorLocal "ColorYellow";
  _marker setMarkerTypeLocal "mil_dot";
  _marker setmarkerpos getpos _object;
  sleep 1;
  deletemarker _marker;
  _marker = createMarker ["tracker", _object];
  _marker setMarkerShapeLocal "ICON";
  _marker setMarkerColorLocal "ColorYellow";
  _marker setMarkerTypeLocal "mil_circle";
  _marker setmarkerpos getpos _object;
  sleep 1;
  deletemarker _marker;
};

deletemarker _marker;

true

