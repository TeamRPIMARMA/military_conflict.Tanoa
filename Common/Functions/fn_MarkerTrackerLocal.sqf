/*
  # HEADER #
	Script: 		Common\Functions\fn_MarkerTrackerLocal.sqf
	Alias:			
	Description:			      
          FR = Fonction qui simule un tracker GPS local. 
          
          EN = Function that simulates a GPS tracker local.
	Author: 		Popo
	Creation Date:	22-06-2024
	Revision Date:	22-06-2024
	
  # PARAMETERS #
  0	[String]: loop condition

  # RETURNED VALUE #

  # SYNTAX #
	["_object"] spawn POPO_fnc_MarkerTrackerLocal;

  # DEPENDENCIES #

  # EXAMPLE #
  [CargoV44Created] spawn POPO_fnc_MarkerTrackerLocal;
  
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_object"];

trackerGPSLocal = true;
publicVariable "trackerGPSLocal";

while {alive _object && trackerGPSLocal isEqualTo true} do
{
  _marker1 = createMarkerLocal ["markerT_1", _object];
  _marker1 setMarkerShapeLocal "ICON";
  _marker1 setMarkerColorLocal "ColorYellow";
  _marker1 setMarkerTypeLocal "mil_dot";
  _marker1 setMarkerPosLocal getpos _object;
  _marker1 setMarkerTextLocal "";
  sleep 1;
  deleteMarkerLocal _marker1;
  _marker2 = createMarkerLocal ["markerT_2", _object];
  _marker2 setMarkerShapeLocal "";
  _marker2 setMarkerAlphaLocal 0;
  _marker2 setMarkerTypeLocal "";
  _marker2 setMarkerPosLocal getpos _object;
  _marker2 setMarkerTextLocal "";
  deleteMarkerLocal _marker2;
  sleep 1;
  if (trackerGPSLocal isEqualTo false) exitWith 
		{
			hint Localize "STR_CTI_POPO_HELP_MESSAGE_BEACON_OFF";
		};
};

deleteMarkerLocal _marker1;
deleteMarkerLocal _marker2;

true

