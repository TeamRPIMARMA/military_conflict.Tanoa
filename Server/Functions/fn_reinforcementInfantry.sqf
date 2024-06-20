// Run on HeadlessClient if HeadlessClient
//HCPresent = if (isNil "Any_HC_present") then {False} else {True};

//if ((!isServer && hasInterface) || (HCPresent && isServer)) exitWith{};
/*
  # HEADER #
	Script: 		Server\Functions\fn_reinforcementInfantry.sqf
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

  # EXAMPLE # 
    pas plus de 2 groupes sinon les unités ne bouge plus !!!
    ["marker_area_0",I_TCN_BANDITS_INFANTRY,2] call POPO_fnc_reinforcementInfantry;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_marker", "_type", "_number"];

for "_i" from 1 to _number do 
{
    _spawnPos = [markerPos _marker, 0, (RANDOM 360)] call BIS_fnc_relPos; 
    _spawnPos = [_spawnPos, 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos;             
    _grpCeated = [_spawnPos, Independent, _type,[],[],[0.10,0.25]] call BIS_fnc_spawnGroup;
    [_grpCeated,SYNDIKAT_INFskill,independent] call POPO_fnc_SkillSet;
    _grpCeated setCombatMode "RED";
    _wp = _grpCeated addWaypoint [getPosASL player, -1];  
    _wp setWaypointType "SAD";   
    _wp setWaypointSpeed "FULL";   
    _wp setWaypointBehaviour "AWARE";   
    _wp setWaypointFormation "WEDGE";   
    _wp setWaypointCompletionRadius 50;
    if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["%1", _i];};
};

true