// Run on HeadlessClient if HeadlessClient
//HCPresent = if (isNil "Any_HC_present") then {False} else {True};

//if ((!isServer && hasInterface) || (HCPresent && isServer)) exitWith{};

/*
  # HEADER #
	Script: 		Server\Functions\fn_reinforcementTank.sqf
	Alias:			
	Description:			      
		        FR = La fonction permet de créée des renforts choisi aléatoirement qui vont sur la dernière position connue du joueur. 
          
            EN = The function allows you to create reinforcements chosen randomly which go to the last known position of the player.
          
	Author: 		Popo
	Creation Date:	29-05-2024
	Revision Date:	02-06-2024
	
  # PARAMETERS #
  0	[array]: of spawn
  1	[array]: of vehicle 
  2	[number]: the number of vehicles
  
  # RETURNED VALUE #

  # SYNTAX #
    ["_ArraySpawn", "_type", "_number"] call POPO_fnc_reinforcementTank;

  # DEPENDENCIES # 
    call POPO_fnc_SkillSet

  # EXAMPLE # 
    [independent_Random_Spawn_vehicle,independent_ReinforcementVehicle ,2] call POPO_fnc_reinforcementTank;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_ArraySpawn", "_type", "_number"];
private "_VehicleCreated";

for "_i" from 1 to _number do { // -- On répète X fois le code pour X véhicules
    _select_spawn = selectRandom _ArraySpawn;
    _DirSpawn = getDir _select_spawn;      
    _VehicleCreated = createVehicle [(selectRandom _type), _select_spawn,[],0,"NONE"];
    _crew = createVehicleCrew _VehicleCreated;
    _ArraySpawn deleteAt (_ArraySpawn find _select_spawn);
    if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {hint format ["Retourne les spawn non utilisé, %1", _ArraySpawn];};
    _VehicleCreated setDir _DirSpawn;
    _VehicleCreated attachTo [ _select_spawn, [0, 0, 2]];
    detach _VehicleCreated;
    [_crew,BANDITS_ARMskill,independent] call POPO_fnc_SkillSet;
    if (typeOf _VehicleCreated isEqualTo "O_T_MBT_04_command_F") then {[_VehicleCreated, ["Grey",1],["showCamonetHull",1,"showCamonetTurret",1]] call BIS_fnc_initVehicle;};
    if (typeOf _VehicleCreated isEqualTo "O_T_APC_Tracked_02_30mm_lxWS") then {[_VehicleCreated, ["Grey",1],["showTracks",0,"showCamonetHull",1,"showBags",0,"showSLATHull",0]] call BIS_fnc_initVehicle;};
    _crew setCombatMode "RED";  
    _wp = _crew addWaypoint [getPosASL player, -1];  
    _wp setWaypointType "SAD";  
    _wp setWaypointSpeed "FULL";   
    _wp setWaypointBehaviour "AWARE";   
    _wp setWaypointFormation "COLUMN";   
    _wp setWaypointCompletionRadius 0;
};

true

