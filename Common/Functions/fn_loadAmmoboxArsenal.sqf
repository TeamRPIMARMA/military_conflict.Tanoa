/*
  # HEADER #
	Script: 		Common\Functions\fn_loadAmmoboxArsenal.sqf;
	Alias:			
	Description:			      
          FR = Fonction qui permet de charger la caisse dans la bene. 
          
          EN = Function that allows you to load the arsenal crate into the dumpster.
	Author: 		Popo
	Creation Date:	04-07-2024
	Revision Date:	05-07-2024
	
  # PARAMETERS #
  0	[Object]: vehicle to load
  1 [Object]: box to load
  
  # RETURNED VALUE #

  # SYNTAX #
	["_vehicle","_ammoBox"] call POPO_fnc_loadAmmoboxArsenal;

  # DEPENDENCIES #

  # EXAMPLE #
  ["_vehicle","_ammoBox"] call POPO_fnc_loadAmmoboxArsenal;
  
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_vehicle","_ammoBox"];

if (_ammoBox distance _vehicle < 10) then 
{
  _ammoBox attachTo [_vehicle, [0, -1.8, -0.3]];
  _ammoBox setDir 90;
  _vehicle lockCargo [3, true];
	_vehicle lockCargo [4, true];
	_vehicle lockCargo [5, true];
	_vehicle lockCargo [6, true];
  } else {
  hint "la caisse est trop loin";
};

_ammoBox addEventHandler ["Killed", {
	params ["_ammoBox"];
  detach _ammoBox;
  Popo_Vehicle_AttachTo lockCargo [3, false];
	Popo_Vehicle_AttachTo lockCargo [4, false];
	Popo_Vehicle_AttachTo lockCargo [5, false];
	Popo_Vehicle_AttachTo lockCargo [6, false];
}];

true

