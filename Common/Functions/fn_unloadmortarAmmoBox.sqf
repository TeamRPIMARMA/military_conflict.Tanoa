/*
  # HEADER #
	Script: 		Common\Functions\fn_unloadmortarAmmoBox.sqf
	Alias:			
	Description:			      
          FR = Fonction qui permet de décharger la caisse qui est sur la galerie du toit. 
          
          EN = Function which allows you to unload the box which is on the roof rack.
	Author: 		Popo
	Creation Date:	07-07-2024
	Revision Date:	07-07-2024
	
  # PARAMETERS #
  0	[Object]: vehicle to unload
  1 [Object]: box to unload
  
  # RETURNED VALUE #

  # SYNTAX #
	["_vehicle","_ammoBox"] call POPO_fnc_unloadmortarAmmoBox;

  # DEPENDENCIES #

  # EXAMPLE #
  ["_vehicle","_ammoBox"] call POPO_fnc_unloadmortarAmmoBox;
  
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_vehicle","_ammoBox"];

if (_ammoBox distance _vehicle < 10) then 
{
  _ammoBox attachTo [_vehicle, [0, -8, -0.8]];
  detach _ammoBox;
  } else {
  hint "la caisse est trop loin";
};

true

