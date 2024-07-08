/*
  # HEADER #
	Script: 		Common\Functions\fn_CreateTriggerGetMarker.sqf
	Alias:			
	Description:			      
          FR = La fonction permet de créée un déclencheur en se basant sur la taille du marqueur.
          
          
          EN = The function allows you to create a trigger based on the size of the marker.
          
	Author: 		Popo
	Creation Date:	27-05-2024
	Revision Date:	16-06-2024
	
  # PARAMETERS #
  0	[String]: name marker
  1	[String]: code to be executed on activation of the trigger
  2 [String]: side activation
  3 [String]: type activation
  4 [String]: code to be executed on desactivation of the trigger
  5 [String]: condition 
  6 [Bool]:   true for repeating the trigger || false for no repeating
  7 [String]: name variable of trigger

  # RETURNED VALUE #

  # SYNTAX #
	["_nameMarker","_onActivation","_sideActivation","_presenceOrDetection","_onDeactivation","_condition","_repeating","_nameTrigger"] call POPO_fnc_CreateTriggerGetMarker;

  # DEPENDENCIES # 

  # EXAMPLE # 
  ["marker_area_0","['marker_area_0',I_TCN_BANDITS_INFANTRY ,4] call POPO_fnc_reinforcementInfantry","WEST","GUER D","","this",false,""] call POPO_fnc_CreateTriggerGetMarker;
  ["marker_8","hint "Brouillage activé";[player,actionIDSlot1] call BIS_fnc_holdActionRemove;call POPO_fnc_removeInterference","WEST","PRESENT","hint "Brouillage désactivé";call POPO_fnc_holdActionAddParachuteSupport;call POPO_fnc_addInterference","this",true,""] call POPO_fnc_CreateTriggerGetMarker;
*/
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
params ["_nameMarker","_onActivation","_sideActivation","_presenceOrDetection","_onDeactivation","_condition","_repeating","_nameTrigger"];

_nameTrigger = createTrigger ["EmptyDetector", getMarkerPos _nameMarker, false]; // false = Local || true = Global 
_nameTrigger setTriggerArea [getMarkerSize _nameMarker # 0, getMarkerSize _nameMarker # 1, markerDir _nameMarker, false, 100]; 
_nameTrigger setTriggerActivation [ _sideActivation, _presenceOrDetection, _repeating]; 
_nameTrigger setTriggerStatements [ _condition, _onActivation, _onDeactivation];

if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["déclencheur créé"];};

true