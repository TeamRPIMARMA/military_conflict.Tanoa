// Run on HeadlessClient if HeadlessClient
//HCPresent = if (isNil "Any_HC_present") then {False} else {True};

//if ((!isServer && hasInterface) || (HCPresent && isServer)) exitWith{};

/*
  # HEADER #
	Script: 		Server\Functions\fn_reinforcementVehicle.sqf
	Alias:			
	Description:			      
		        FR = La fonction permet de créée des renforts choisi aléatoirement qui vont sur la dernière position connue du joueur. 
          
                EN = The function allows you to create reinforcements chosen randomly which go to the last known position of the player.
          
	Author: 		Popo
	Creation Date:	29-05-2024
	Revision Date:	31-05-2024
	
  # PARAMETERS #
  0	[position]: the position of spawn
  1	[array]: my vehicles choose
  2	[number]: the number of vehicles
  
  # RETURNED VALUE #

  # SYNTAX #
    ["_marker", "_typeofvehicle", "_numberofvehicle"] call POPO_fnc_reinforcementVehicle;

  # DEPENDENCIES # 
    call POPO_fnc_SkillSet

  # EXAMPLE # 
    ["marker_0",Popo_Reinforcement_Prototype ,2] call POPO_fnc_reinforcementVehicle;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_marker", "_typeofvehicle", "_numberofvehicle"];

for "_i" from 1 to _numberofvehicle do { // -- On répète X fois le code pour X véhicules
    _spawnPos = [markerPos [_marker], 0, (RANDOM 360)] call BIS_fnc_relPos; 
    _spawnPos = [_spawnPos, 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos;      
    _veh = createVehicle [(selectRandom _typeofvehicle),_spawnPos,[],0,"NONE"];
    _crew = createVehicleCrew _veh;
    [_crew,SYNDIKAT_ARMskill,0.2,0] call POPO_fnc_SkillSet;
    if (typeOf _veh isEqualTo "O_T_MBT_04_command_F") then {[_veh, ["Grey",1],["showCamonetHull",1,"showCamonetTurret",1]] call BIS_fnc_initVehicle;};
    if (typeOf _veh isEqualTo "O_T_APC_Tracked_02_30mm_lxWS") then {[_veh, ["Grey",1],["showTracks",0,"showCamonetHull",1,"showBags",0,"showSLATHull",0]] call BIS_fnc_initVehicle;};
    _crew setCombatMode "RED";  
    _wp = _crew addWaypoint [getPosASL player, -1];  
    _wp setWaypointType "SAD";  
    _wp setWaypointSpeed "FULL";   
    _wp setWaypointBehaviour "AWARE";   
    _wp setWaypointFormation "COLUMN";   
    _wp setWaypointCompletionRadius 50;
};

true

