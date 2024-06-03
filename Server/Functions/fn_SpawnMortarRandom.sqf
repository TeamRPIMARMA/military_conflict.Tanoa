/*
  # HEADER #
	Script: 		Server\Functions\fn_SpawnMortarRandom.sqf
	Alias:			
	Description:			      
          <FR = La fonction permet de créer des mortiers aléatoires avec un spawn aléatoire. 
          
          EN = The function allows you to create random mortar with a random spawn.
	Author: 		Popo
	Creation Date:	01-06-2024
	Revision Date:	01-06-2024
	
  # PARAMETERS #
  0	[array]: of spawn
  1	[array]: of vehicle 
  2	[number]: of vehicles

  # RETURNED VALUE #

  # SYNTAX #
	["_arraySpawn", "_type", "_number"] call POPO_fnc_SpawnMortarRandom;

  # DEPENDENCIES #

  # EXAMPLE #
  [independent_Mortar,independent_Random_Spawn_Mortar,1] call POPO_fnc_SpawnMortarRandom;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction spawn aléatoirement des Hostages captifs random avec les options 
params ["_arraySpawn", "_type", "_number"];
private "_MortarCreated";

for "_i" from 1 to _number do // a loop repeating X times
{
    _select_spawn = selectRandom _arraySpawn;
    _DirSpawn = getDir _select_spawn; 
    _MortarCreated = createVehicle [_type,_select_spawn,[],0,"NONE"]; 
    createVehicleCrew _MortarCreated;
    _arraySpawn deleteAt (_arraySpawn find _select_spawn);
    if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {hint format ["Retourne les spawn non utilisé, %1", _arraySpawn];};
    _MortarCreated setDir _DirSpawn;
    _MortarCreated attachTo [_select_spawn, [0, 0, 1]];
    detach _MortarCreated;
    [_MortarCreated] joinSilent independent_grp_units;
    if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["%1", _i];};
};

true  


