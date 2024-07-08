/*
  # HEADER #
	Script: 		Common\Functions\fn_AllClearInventory.sqf
	Alias:			
	Description:			      
		        FR = La fonction permet de vider tout l'inventaire. 
          
            EN = The function allows you to empty the entire inventory.
          
	Author: 		Popo
	Creation Date:	07-05-2024
	Revision Date:	07-06-2024
	
  # PARAMETERS #
  0	[objet]: Ammobox

  # RETURNED VALUE #

  # SYNTAX #
    ["_AmmoBox"] call POPO_fnc_AllClearInventory;

  # DEPENDENCIES # 

  # EXAMPLE # 
    ["B_supplyCrate_F"] call POPO_fnc_AllClearInventory;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
params ["_AmmoBox"];  
      
// clear crate - leaves medkits in place. add clearItemCargoGlobal _AmmoBox; to remove medkits
clearWeaponCargoGlobal _AmmoBox;
clearMagazineCargoGlobal _AmmoBox;
clearItemCargoGlobal _AmmoBox;
clearBackpackCargoGlobal _AmmoBox;

true