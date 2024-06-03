// Run on HeadlessClient if HeadlessClient
//HCPresent = if (isNil "Any_HC_present") then {False} else {True};

//if ((!isServer && hasInterface) || (HCPresent && isServer)) exitWith{};
/*
  # HEADER #
	Script: 		Server\Functions\fn_reinforcementVehicle.sqf
	Alias:			
	Description:			      
		        FR = La fonction permet de créée des renforts qui vont sur la dernière position connue du joueur. 
          
            EN = The function allows you to create reinforcements which go to the last known position of the player.
          
	Author: 		Popo
	Creation Date:	29-05-2024
	Revision Date:	02-06-2024
	
  # PARAMETERS #
  0	[string]: the position of spawn
  1	[array]: my units choose
  2	[number]: the number of groups
  
  # RETURNED VALUE #

  # SYNTAX #
    ["_marker", "_type", "_number"] call POPO_fnc_reinforcementInfantry;

  # DEPENDENCIES # 
    call POPO_fnc_SkillSet

  # EXAMPLE # 
    ["marker_0",independent_Units,3] call POPO_fnc_reinforcementInfantry;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_marker", "_type", "_number"];

for '_i' from 1 to _number do {// -- On répète X fois le code pour X groupes
    _spawnPos = [markerPos [_marker], 0, (RANDOM 360)] call BIS_fnc_relPos; 
    _spawnPos = [_spawnPos, 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos;             
    _grp = [_spawnPos, Independent, _type] call BIS_fnc_spawnGroup;
    [_grp,SYNDIKAT_INFskill] call POPO_fnc_SkillSet;
    _grp setCombatMode "RED";
    _wp = _grp addWaypoint [getPosASL player, -1];  
    _wp setWaypointType "SAD";   
    _wp setWaypointSpeed "FULL";   
    _wp setWaypointBehaviour "AWARE";   
    _wp setWaypointFormation "WEDGE";   
    _wp setWaypointCompletionRadius 50;
};

true