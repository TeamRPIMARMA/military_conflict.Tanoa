/*
  # HEADER #
	Script: 		Common\Functions\fn_SlingLoadSupport.sqf
	Alias:			
	Description:			      
          FR = La fonction permet de ramener du support par hélitreuillage. 
          
          EN = The function allows support to be brought back by helicopter.
	Author: 		Popo
	Creation Date:	19-07-2024
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
  For slingload
  [spawn_inAirDelivery_1,"B_Heli_Transport_03_F","B_T_LSV_01_unarmed_F",200,10] call POPO_fnc_ParachuteSupport;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_spawn", "_typeAirVehicle", "_typeCargoVehicle","_altitude","_reloadtime"];

_Time = _reloadtime * 60;

if (Popo_SlingLoad_Player isEqualTo true && _typeAirVehicle isEqualTo "B_Heli_Transport_03_F") then 
  {

  [west, "HQ"] sideChat localize "STR_CTI_POPO_HQ_MESSAGE_PARADROP";playsound "RadioBackOnPosition";

  Popo_SlingLoad_Player = false;
	publicVariable "Popo_SlingLoad_Player";

  _DirSpawn = getDir _spawn; 
  CargoCH47Created = createVehicle [_typeCargoVehicle,_spawn,[],0,"NONE"];
  // HoldAction disable Tracker GPS
  //[CargoCH47Created] call POPO_fnc_holdActionAdd;
  if (Typeof CargoCH47Created isEqualTo "B_supplyCrate_F") then {[CargoCH47Created] call POPO_fnc_BLUFORAmmobox;}; 
  if (typeOf CargoCH47Created isEqualTo "maestro_B_T_Pickup_Comms_rf_cage") then {_ammoBoxArsenal = "B_supplyCrate_F" createVehicle position CargoCH47Created;[_ammoBoxArsenal] call POPO_fnc_BLUFORAmmobox;[ CargoCH47Created, _ammoBoxArsenal] call POPO_fnc_loadAmmoboxArsenal;Popo_AmmoBoxArsenal_AttachTo = _ammoBoxArsenal;publicVariable "Popo_mortarAmmoBox_AttachTo";[ CargoCH47Created] call POPO_fnc_holdActionUnloadAmmoboxArsenal;[ CargoCH47Created] call POPO_fnc_holdActionLoadAmmoboxArsenal;Popo_Vehicle_AttachTo = CargoCH47Created;publicVariable "Popo_Vehicle_AttachTo";_mortarAmmoBox = "Box_Syndicate_WpsLaunch_F" createVehicle position CargoCH47Created;[_mortarAmmoBox] call POPO_fnc_AllClearInventory;[ CargoCH47Created, _mortarAmmoBox] call POPO_fnc_loadmortarAmmoBox;Popo_mortarAmmoBox_AttachTo = _mortarAmmoBox;publicVariable "Popo_mortarAmmoBox_AttachTo";[ CargoCH47Created] call POPO_fnc_holdActionLoadMotarAmmobox;[ CargoCH47Created] call POPO_fnc_holdActionUnloadMotarAmmobox;};
  CH47Created = createVehicle [_typeAirVehicle,_spawn,[],0,"FLY"]; 
  _pilot = createVehicleCrew CH47Created;
  CH47Created setDir _DirSpawn;
  CH47Created setPosATL [getPosATL _V44Created select 0, getPosATL _V44Created select 1, _altitude];
  CH47Created flyInHeight _altitude;
  CargoCH47Created setDir _DirSpawn;
  CH47Created setSlingLoad CargoCH47Created;
  
  _pilot setCombatMode "BLUE"; 
  _wp1 = _pilot addWaypoint [getPosASL player, -1]; 
  _wp1 setWaypointType "Unhook";  
  _wp1 setWaypointSpeed "NORMAL";   
  _wp1 setWaypointBehaviour "AWARE"; 
  _wp1 setWaypointStatements ["true", "Popo_SlingLoadOK = true"]; 

  waitUntil {Popo_SlingLoadOK isEqualTo true};
  [CargoV44Created] spawn POPO_fnc_MarkerTracker;[west, 'HQ'] sideChat localize 'STR_CTI_POPO_HQ_MESSAGE_DROPPING_AMMOBOX';
  Popo_SlingLoadOK = false;

  _wp2 = _pilot addWaypoint [getPosASL spawn_outChopperDelivery_1, -1];  
  _wp2 setWaypointType "MOVE";  
  _wp2 setWaypointSpeed "FULL";   
  _wp2 setWaypointBehaviour "AWARE";   
  _wp2 setWaypointStatements ["true", "Popo_returnBaseSlingLoadOK = true"];

  waitUntil {Popo_returnBaseSlingLoadOK isEqualTo true};
  deleteVehicleCrew CH47Created;{ CH47Created deleteVehicleCrew _x } forEach crew CH47Created;[west, 'HQ'] sideChat localize 'STR_CTI_POPO_HQ_MESSAGE_PARADROP_RETURN_BASE';playsound 'RadioReturnBase';
  Popo_returnBaseSlingLoadOK = false;

  if (typeOf CargoCH47Created isEqualTo "maestro_B_T_Pickup_Comms_rf_cage") then {[west, Popo_Vehicle_AttachTo, "MHQ"] call BIS_fnc_addRespawnPosition;};

  } else {
	hint format [Localize "STR_CTI_POPO_HELP_MESSAGE_DROP_NOT_AVAIBLE"];
};

sleep _Time;

trackerGPS = false;

sleep 5;

hint format [Localize "STR_CTI_POPO_HELP_MESSAGE_DROP_AVAIBLE"];

Popo_SlingLoad_Player = true;
publicVariable "Popo_SlingLoad_Player";

true  

 
