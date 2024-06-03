// Run on HeadlessClient if HeadlessClient
//HCPresent = if (isNil "Any_HC_present") then {False} else {True};

//if ((!isServer && hasInterface) || (HCPresent && isServer)) exitWith{};

/*
  # HEADER #
	Script: 		Server\Functions\fn_reinforcementAir.sqf
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
  2	[number]: of vehicles
  
  # RETURNED VALUE #

  # SYNTAX #
    ["_ArraySpawn", "_type", "_number"] call POPO_fnc_reinforcementChopper;

  # DEPENDENCIES # 
    call POPO_fnc_SkillSet

  # EXAMPLE # 
    [Spawn_Chopper_1,independent_ReinforcementChopper ,1] call POPO_fnc_reinforcementChopper;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_ArraySpawn", "_type", "_number"];
private "_ChopperCreated";
for "_i" from 1 to _number do { // -- On répète X fois le code pour X véhicules
    //_Spawn_Air = selectRandom _ArraySpawn;
    _DirSpawn = getDir _ArraySpawn;
    //_ArraySpawn deleteAt (_ArraySpawn find _Spawn_Air);
    //if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {hint format ["Retourne le spawn choisi, %1", _ArraySpawn];};    
    _ChopperCreated = createVehicle [(selectRandom _type), _ArraySpawn,[],0,"NONE"];    
    //if (typeOf _veh isEqualTo "O_T_APC_Tracked_02_30mm_lxWS") then {[_veh, ["Grey",1],["showTracks",0,"showCamonetHull",1,"showBags",0,"showSLATHull",0]] call BIS_fnc_initVehicle;};
    _pilot = createVehicleCrew _ChopperCreated;
    if (typeOf _ChopperCreated isEqualTo "I_Heli_light_03_dynamicLoadout_F") then {_unitCargo = _pilot createUnit ["I_C_Soldier_Para_4_F", _pilot, [], 0, "NONE"];_unitCargo moveInCargo [_ChopperCreated, 1];_unitCargo = _pilot createUnit ["I_C_Soldier_Para_4_F", _pilot, [], 0, "NONE"];_unitCargo moveInCargo [_ChopperCreated, 7];[_unitCargo,SYNDIKAT_INFskill,0,0.2] call POPO_fnc_SkillSet;};
    [_pilot,SYNDIKAT_AIRskill] call POPO_fnc_SkillSet;
    _ChopperCreated attachTo [_ArraySpawn, [0, 0, 2]];
    _ChopperCreated setDir _DirSpawn;
    detach _ChopperCreated;
    _pilot setCombatMode "RED";  
    _wp = _pilot addWaypoint [getPosASL player, -1];  
    _wp setWaypointType "SAD";  
    _wp setWaypointSpeed "FULL";   
    _wp setWaypointBehaviour "AWARE";   
    _wp setWaypointFormation "COLUMN";   
    _wp setWaypointCompletionRadius 50;
};

true







