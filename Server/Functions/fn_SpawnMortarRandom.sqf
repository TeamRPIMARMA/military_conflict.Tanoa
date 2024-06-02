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
  0	[array]: The type of mortar to create
  1	[position]: The 2D/3D position as well as its direction where the unit must be created at
  2	[number]: number of mortar created

  # RETURNED VALUE #

  # SYNTAX #
	["_TypeMortar","_TypeSpawn_Mortar","_numberofMortar"] call POPO_fnc_SpawnMortarRandom;

  # DEPENDENCIES #

  # EXAMPLE #
  [Mortar_Resistance,Random_Spawn_Mortar,1] call POPO_fnc_SpawnMortarRandom;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction spawn aléatoirement des Hostages captifs random avec les options 
params ["_TypeMortar","_TypeSpawn_Mortar","_numberMortar"];
private "_MortarCreated";
for "_i" from 1 to _numberMortar do // a loop repeating X times
{
    _Spawn_Mortar = selectRandom _TypeSpawn_Mortar;
    _DirMortar = getDir _Spawn_Mortar; 
    _MortarCreated = createVehicle [_TypeMortar,_Spawn_Mortar,[],0,"NONE"]; 
    createVehicleCrew _MortarCreated;
    Random_Spawn_Mortar deleteAt (Random_Spawn_Mortar find _Spawn_Mortar);
    if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {hint format ["Retourne les spawn non utilisé, %1", Random_Spawn_Mortar];};
    _MortarCreated setDir _DirMortar;
    _MortarCreated attachTo [_Spawn_Mortar, [0, 0, 1]];
    detach _MortarCreated;
    [_MortarCreated] joinSilent independent_grp_units;
    if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["%1", _i];};
};

true  


