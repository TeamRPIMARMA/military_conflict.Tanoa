/*
  # HEADER #
	Script: 		Common\Functions\fn_ParachuteSupport.sqf
	Alias:			
	Description:			      
          FR = La fonction permet de faire parachuter des véhicules compatible vehicle in vehicle. 
          
          EN = The function allows vehicles compatible with vehicle in vehicle to parachute.
	Author: 		Popo
	Creation Date:	04-06-2024
	Revision Date:	05-06-2024
	
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

  # EXAMPLE #
  For slingload
  [spawn_inAirDelivery_1,"B_Heli_Transport_03_F","B_T_LSV_01_unarmed_F",200] call POPO_fnc_ParachuteSupport;
  For paradrop vehicle
  [spawn_inAirDelivery_1,"B_T_VTOL_01_Vehicle_F_Kimi","B_T_LSV_01_unarmed_F",200] call POPO_fnc_ParachuteSupport;
  For paradrop ammobox
  [spawn_inAirDelivery_1,"B_T_VTOL_01_Vehicle_F_Kimi","B_supplyCrate_F",200] call POPO_fnc_ParachuteSupport;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_spawn", "_typeAirVehicle", "_typeCargoVehicle","_altitude"];
//private "_AirVehicleCreated";
//private "_CargoVehicleCreated";
/*
// For SlingLoad
if (_typeAirVehicle isEqualTo "B_Heli_Transport_03_F") then 
{
  _DirSpawn = getDir _spawn; 
  CargoCH47Created = createVehicle [_typeCargoVehicle,_spawn,[],0,"NONE"];
  CH47Created = createVehicle [_typeAirVehicle,_spawn,[],0,"FLY"]; 
  _pilot = createVehicleCrew CH47Created;
  CH47Created setDir _DirSpawn;
  CH47Created setPosATL [getPosATL CH47Created select 0, getPosATL CH47Created select 1, _altitude];
  CH47Created flyInHeight _altitude;
  CargoCH47Created setDir _DirSpawn;
  CH47Created setSlingLoad CargoCH47Created;

  _pilot setCombatMode "YELLOW"; 
  _wp1 = _pilot addWaypoint [getPosASL player, -1]; 
  _wp1 setWaypointType "Unhook";  
  _wp1 setWaypointSpeed "NORMAL";   
  _wp1 setWaypointBehaviour "AWARE";   
    

  _wp2 = _pilot addWaypoint [getPosASL spawn_outChopperDelivery_1, -1];  
  _wp2 setWaypointType "MOVE";  
  _wp2 setWaypointSpeed "FULL";   
  _wp2 setWaypointBehaviour "AWARE";   
  _wp2 setWaypointStatements ["true", "deleteVehicleCrew CH47Created;{ CH47Created deleteVehicleCrew _x } forEach crew CH47Created"];
};
*/

  
// For paradrop
if ( _typeAirVehicle isEqualTo "B_T_VTOL_01_Vehicle_F_Kimi") then 
  {
  _DirSpawn = getDir _spawn; 
  CargoV44Created = createVehicle [_typeCargoVehicle,_spawn,[],0,"NONE"];
  if (typeof CargoV44Created isEqualTo "B_supplyCrate_F") then {[CargoV44Created] call POPO_fnc_BLUFORAmmobox;}; 
  V44Created = createVehicle [_typeAirVehicle,_spawn,[],0,"FLY"]; 
  _pilot = createVehicleCrew V44Created;
  V44Created setDir _DirSpawn;
  V44Created setPosATL [getPosATL V44Created select 0, getPosATL V44Created select 1, _altitude];
  V44Created flyInHeight _altitude;
  CargoV44Created setDir _DirSpawn;
  V44Created setVehicleCargo CargoV44Created;
  
  _pilot setCombatMode "YELLOW"; 
  _wp1 = _pilot addWaypoint [getPosASL player, -1]; 
  _wp1 setWaypointType "MOVE";  
  _wp1 setWaypointSpeed "NORMAL";   
  _wp1 setWaypointBehaviour "AWARE";
  _wp1 setWaypointStatements ["true", "objNull setVehicleCargo CargoV44Created;[CargoV44Created] spawn POPO_fnc_MarkerTracker;[west, 'AirBase'] sideChat localize 'STR_CTI_POPO_HQ_MESSAGE_DROPPING_AMMOBOX';"]; 

  _wp2 = _pilot addWaypoint [getPosASL spawn_outChopperDelivery_1, -1];  
  _wp2 setWaypointType "MOVE";  
  _wp2 setWaypointSpeed "FULL";   
  _wp2 setWaypointBehaviour "AWARE";   
  _wp2 setWaypointStatements ["true", "deleteVehicleCrew V44Created;{ V44Created deleteVehicleCrew _x } forEach crew V44Created;[west, 'AirBase'] sideChat localize 'STR_CTI_POPO_HQ_MESSAGE_PARADROP_RETURN_BASE';playsound 'RadioReturnBase';"];

  } else {
	hint "mettre la bonne classe 'B_T_VTOL_01_Vehicle_F_Kimi'";
};

true  

