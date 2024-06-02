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
	Revision Date:	31-05-2024
	
  # PARAMETERS #
  0	[position]: the position of spawn
  1	[array]: my air choose
  2	[number]: the number of air
  
  # RETURNED VALUE #

  # SYNTAX #
    ["_TypeSpawn_Air", "_typeofvehicle", "_numberofvehicle"] call POPO_fnc_reinforcementAir;

  # DEPENDENCIES # 
    call POPO_fnc_SkillSet

  # EXAMPLE # 
    [Spawn_Air_1,Popo_ReinforcmentAir ,1] call POPO_fnc_reinforcementAir;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_TypeSpawn_Air", "_typeofvehicle", "_numberofvehicle"];

for "_i" from 1 to _numberofvehicle do { // -- On répète X fois le code pour X véhicules
    //_Spawn_Air = selectRandom _TypeSpawn_Air;
    _DirAir = getDir _Spawn_Air;
    //Random_Spawn_Air deleteAt (Random_Spawn_Air find _Spawn_Air);
    //if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {hint format ["Retourne le spawn choisi, %1", Random_Spawn_Air];};    
    _AirCreated = createVehicle [(selectRandom _typeofvehicle), _TypeSpawn_Air,[],0,"NONE"];    
    //if (typeOf _veh isEqualTo "O_T_APC_Tracked_02_30mm_lxWS") then {[_veh, ["Grey",1],["showTracks",0,"showCamonetHull",1,"showBags",0,"showSLATHull",0]] call BIS_fnc_initVehicle;};
    _pilot = createVehicleCrew _AirCreated;
    if (typeOf _AirCreated isEqualTo "I_Heli_light_03_dynamicLoadout_F") then {_unitCargo = _pilot createUnit ["I_C_Soldier_Para_4_F", _pilot, [], 0, "NONE"];_unitCargo moveInCargo [_AirCreated, 1];_unitCargo = _pilot createUnit ["I_C_Soldier_Para_4_F", _pilot, [], 0, "NONE"];_unitCargo moveInCargo [_AirCreated, 7];[_unitCargo,INFskill,0,0.2] call POPO_fnc_SkillSet;};
    [_pilot,SYNDIKAT_AIRskill,0.2,0] call POPO_fnc_SkillSet;
    _AirCreated attachTo [_TypeSpawn_Air, [0, 0, 2]];
    _AirCreated setDir _DirAir;
    detach _AirCreated;
    _pilot setCombatMode "RED";  
    _wp = _pilot addWaypoint [getPosASL player, -1];  
    _wp setWaypointType "SAD";  
    _wp setWaypointSpeed "FULL";   
    _wp setWaypointBehaviour "AWARE";   
    _wp setWaypointFormation "COLUMN";   
    _wp setWaypointCompletionRadius 50;
};

true







