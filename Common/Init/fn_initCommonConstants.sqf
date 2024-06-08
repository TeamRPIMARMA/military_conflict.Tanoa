//Random_Spawn_House = ["Land_Slum_03_F","Land_House_Small_02_F","Land_House_Small_06_F"];

independent_ReinforcementPlane = ["I_Plane_Fighter_04_F","I_Plane_Fighter_03_dynamicLoadout_F"/*,"I_UAV_02_dynamicLoadout_F"*/];

independent_ReinforcementChopper = ["I_Heli_light_03_dynamicLoadout_F","I_E_Heli_light_03_dynamicLoadout_RF"];

// Init Variables
call POPO_fnc_factionCivilian;
call POPO_fnc_factionOpfor;
call POPO_fnc_opforAISkill;

// Faction independent
call POPO_fnc_InfantryTCN;
call POPO_fnc_LightVehicleTCN;
call POPO_fnc_ShipTCN;
call POPO_fnc_StaticWeaponTCN;

// Skill independent
call POPO_fnc_independantAISkill;

// spawn
independent_Random_Spawn_Mortar = [Spawn_Mortar_1,Spawn_Mortar_2,Spawn_Mortar_3];

independent_Random_Spawn_vehicle = [Spawn_vehicle_1,Spawn_vehicle_2,Spawn_vehicle_3,Spawn_vehicle_4,Spawn_vehicle_5,Spawn_vehicle_6];

Random_Spawn_Hostage = [Spawn_Hostage_1,Spawn_Hostage_2,Spawn_Hostage_3,Spawn_Hostage_4,Spawn_Hostage_5,Spawn_Hostage_6,Spawn_Hostage_7,Spawn_Hostage_8,Spawn_Hostage_9,Spawn_Hostage_10,Spawn_Hostage_11,Spawn_Hostage_12];









