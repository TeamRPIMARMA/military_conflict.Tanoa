/*
  # HEADER #
	Script: 		Common\Functions\fn_ParachuteSupport.sqf
	Alias:			
	Description:			      
          FR = La fonction permet de faire parachuter des véhicules ou matériels compatible (vehicle in vehicle). 
          
          EN = The function allows compatible vehicles or equipment to be parachuted with (vehicle in vehicle).
	Author: 		Popo
	Creation Date:	04-06-2024
	Revision Date:	19-07-2024
	
  # PARAMETERS #
  0	[array]: of spawn
  1	[array]: of Air vehicle
  2	[array]: of vehicle delivery 
  3	[number]: of altitude

  # RETURNED VALUE #

  # SYNTAX #
	["_spawn", "_typeAirVehicle", "_typeCargoVehicle","_altitude"] call POPO_fnc_ParachuteSupport;

  # DEPENDENCIES #
  Common\Config\Faction\BLUFOR\Logistics_Support\fn_BLUFORAmmobox.sqf
  Common\Functions\fn_MarkerTracker.sqf
  Client\holdActionAdd\fn_holdActionAdd.sqf

  # EXAMPLE #
  For paradrop vehicle
  [spawn_inAirDelivery_1,"B_T_VTOL_01_Vehicle_F_Kimi","B_T_LSV_01_unarmed_F",200,30] call POPO_fnc_ParachuteSupport;
  For paradrop ammobox
  [spawn_inAirDelivery_1,"B_T_VTOL_01_Vehicle_F_Kimi","B_supplyCrate_F",200,60] call POPO_fnc_ParachuteSupport;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_spawn", "_typeAirVehicle", "_typeCargoVehicle","_altitude","_reloadtime"];

_Time = _reloadtime * 60;

if (Popo_ParaDrop_Player isEqualTo true && _typeAirVehicle isEqualTo "B_T_VTOL_01_Vehicle_F_Kimi") then 
  {

  [west, "HQ"] sideChat localize "STR_CTI_POPO_HQ_MESSAGE_PARADROP";playsound "RadioBackOnPosition";

  Popo_ParaDrop_Player = false;
	publicVariable "Popo_ParaDrop_Player";

  _DirSpawn = getDir _spawn; 
  _CargoV44Created = createVehicle [_typeCargoVehicle,_spawn,[],0,"NONE"];
  // HoldAction disable Tracker GPS
  //[_CargoV44Created] call POPO_fnc_holdActionAdd;
  if (Typeof _CargoV44Created isEqualTo "B_supplyCrate_F") then {[_CargoV44Created] call POPO_fnc_BLUFORAmmobox;}; 
  if (typeOf _CargoV44Created isEqualTo "maestro_B_T_Pickup_Comms_rf_cage") then {_ammoBoxArsenal = "B_supplyCrate_F" createVehicle position _CargoV44Created;[_ammoBoxArsenal] call POPO_fnc_BLUFORAmmobox;[ _CargoV44Created, _ammoBoxArsenal] call POPO_fnc_loadAmmoboxArsenal;Popo_AmmoBoxArsenal_AttachTo = _ammoBoxArsenal;publicVariable "Popo_mortarAmmoBox_AttachTo";[ _CargoV44Created] call POPO_fnc_holdActionUnloadAmmoboxArsenal;[ _CargoV44Created] call POPO_fnc_holdActionLoadAmmoboxArsenal;Popo_Vehicle_AttachTo = _CargoV44Created;publicVariable "Popo_Vehicle_AttachTo";_mortarAmmoBox = "Box_Syndicate_WpsLaunch_F" createVehicle position _CargoV44Created;[_mortarAmmoBox] call POPO_fnc_AllClearInventory;[ _CargoV44Created, _mortarAmmoBox] call POPO_fnc_loadmortarAmmoBox;Popo_mortarAmmoBox_AttachTo = _mortarAmmoBox;publicVariable "Popo_mortarAmmoBox_AttachTo";[ _CargoV44Created] call POPO_fnc_holdActionLoadMotarAmmobox;[ _CargoV44Created] call POPO_fnc_holdActionUnloadMotarAmmobox;};
  _V44Created = createVehicle [_typeAirVehicle,_spawn,[],0,"FLY"]; 
  _pilot = createVehicleCrew _V44Created;
  _V44Created setDir _DirSpawn;
  _V44Created setPosATL [getPosATL _V44Created select 0, getPosATL _V44Created select 1, _altitude];
  _V44Created flyInHeight _altitude;
  _CargoV44Created setDir _DirSpawn;
  _V44Created setVehicleCargo _CargoV44Created;
  
  _pilot setCombatMode "BLUE"; 
  _wp1 = _pilot addWaypoint [getPosASL player, -1]; 
  _wp1 setWaypointType "MOVE";  
  _wp1 setWaypointSpeed "NORMAL";   
  _wp1 setWaypointBehaviour "AWARE";
  _wp1 setWaypointStatements ["true", "Popo_paradropOK = true"]; 

  waitUntil {Popo_paradropOK isEqualTo true};
  objNull setVehicleCargo _CargoV44Created;[_CargoV44Created] spawn POPO_fnc_MarkerTracker;[west, 'HQ'] sideChat localize 'STR_CTI_POPO_HQ_MESSAGE_DROPPING_AMMOBOX';
  Popo_paradropOK = false;

  _wp2 = _pilot addWaypoint [getPosASL spawn_outChopperDelivery_1, -1];  
  _wp2 setWaypointType "MOVE";  
  _wp2 setWaypointSpeed "FULL";   
  _wp2 setWaypointBehaviour "AWARE";   
  _wp2 setWaypointStatements ["true", "Popo_returnBaseOK = true"];

  waitUntil {Popo_returnBaseOK isEqualTo true};
  deleteVehicleCrew _V44Created;{ _V44Created deleteVehicleCrew _x } forEach crew _V44Created;[west, 'HQ'] sideChat localize 'STR_CTI_POPO_HQ_MESSAGE_PARADROP_RETURN_BASE';playsound 'RadioReturnBase';
  Popo_returnBaseOK = false;

  if (typeOf _CargoV44Created isEqualTo "maestro_B_T_Pickup_Comms_rf_cage") then {[west, Popo_Vehicle_AttachTo, "MHQ"] call BIS_fnc_addRespawnPosition;};

  } else {
	hint format [Localize "STR_CTI_POPO_HELP_MESSAGE_DROP_NOT_AVAIBLE"];
};

sleep _Time;

trackerGPS = false;

sleep 5;

hint format [Localize "STR_CTI_POPO_HELP_MESSAGE_DROP_AVAIBLE"];

Popo_ParaDrop_Player = true;
publicVariable "Popo_ParaDrop_Player";

true  

 
