/*
  # HEADER #
	Script: 		Common\Functions\fn_CreateTriggerGetMarker.sqf
	Alias:			
	Description:			      
          <FR = La fonction permet de créée un déclencheur en se basant sur la taille du marqueur.
          
          
          EN = The function allows you to create a trigger based on the size of the marker.
          
	Author: 		Popo
	Creation Date:	27-05-2024
	Revision Date:	29-05-2024
	
  # PARAMETERS #
  0	[String]: name marker
  1	[String]: code to be executed on activation of the trigger
  
  # RETURNED VALUE #

  # SYNTAX #
	["VARIABLE","CODE TO BE EXECUTED"] call POPO_fnc_CreateTriggerGetMarker;

  # DEPENDENCIES # 

  # EXAMPLE # 
  ["marker_0","[Units_Resistance, 400, 'marker_0', 400] call POPO_fnc_SpawnUnitRandomBuilding","WEST","PRESENT"] call POPO_fnc_CreateTriggerGetMarker;
*/
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
params ["_nameMarker","_onActivation","_sideActivation","_presenceordtection"];

_trg = createTrigger ["EmptyDetector", getMarkerPos _nameMarker, false]; 
_trg setTriggerArea [getMarkerSize _nameMarker # 0, getMarkerSize _nameMarker # 1, markerDir _nameMarker, false, 100]; 
_trg setTriggerActivation [_sideActivation, _presenceordtection, false]; 
_trg setTriggerStatements ["this", _onActivation, ""];
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["déclencheur créé"];};

true


