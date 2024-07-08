/*
  # HEADER #
	Script: 		Common\Functions\fn_unloadAmmoboxArsenal.sqf
	Alias:			
	Description:			      
          FR = Fonction qui permet de décharger la caisse dans la bene. 
          
          EN = Function which allows the box to be unloaded into the dumpster.
	Author: 		Popo
	Creation Date:	04-07-2024
	Revision Date:	07-07-2024
	
  # PARAMETERS #
  0	[Object]: vehicle to unload
  1 [Object]: box to unload
  
  # RETURNED VALUE #

  # SYNTAX #
	["_vehicle","_ammoBox"] call POPO_fnc_unloadAmmoboxArsenal;

  # DEPENDENCIES #

  # EXAMPLE #
  ["_vehicle","_ammoBox"] call POPO_fnc_unloadAmmoboxArsenal;
  
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_vehicle","_ammoBox"];

if (_ammoBox distance _vehicle < 10) then 
{
  _ammoBox attachTo [_vehicle, [0, -5, -0.4]];
  detach _ammoBox;
  _vehicle lockCargo [3, false];
	_vehicle lockCargo [4, false];
	_vehicle lockCargo [5, false];
	_vehicle lockCargo [6, false];
  } else {
  hint "la caisse est trop loin";
};

true

