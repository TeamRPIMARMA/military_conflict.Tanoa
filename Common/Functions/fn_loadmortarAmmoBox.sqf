/*
  # HEADER #
	Script: 		Common\Functions\fn_loadmortarAmmoBox.sqf;
	Alias:			
	Description:			      
          FR = Fonction qui permet de charger la caisse sur la galerie du toit et si celle-ci est détruite elle se détache. 
          
          EN = Function which allows the box to be loaded onto the roof rack and if it is destroyed it detaches.
	Author: 		Popo
	Creation Date:	07-07-2024
	Revision Date:	07-07-2024
	
  # PARAMETERS #
  0	[Object]: vehicle to load
  1 [Object]: box to load
  
  # RETURNED VALUE #

  # SYNTAX #
	["_vehicle","_ammoBox"] call POPO_fnc_loadmortarAmmoBox;

  # DEPENDENCIES #

  # EXAMPLE #
  ["_vehicle","_ammoBox"] call POPO_fnc_loadmortarAmmoBox;
  
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_vehicle","_ammoBox"];

if (_ammoBox distance _vehicle < 10) then 
{
  _ammoBox attachTo [_vehicle, [-0.08, -0.5, 0.2]];
  } else {
  hint Localize "STR_CTI_POPO_HELP_MESSAGE_THE_BOX_IS_TOO_FAR";
};

_ammoBox addEventHandler ["Killed", {
	params ["_ammoBox"];
  detach _ammoBox;
}];

true

