/*
  # HEADER #
	Script: 		Common\Functions\Config\Faction\BLUFOR\Logistics_Support\fn_BLUFORAmmobox.sqf
	Alias:			
	Description:			      
		        FR = La fonction permet de paramètrer le contenu de la caisse. 
          
            EN = The function allows you to configure the contents of the cash register.
          
	Author: 		Popo
	Creation Date:	05-05-2024
	Revision Date:	05-06-2024
	
  # PARAMETERS #
  0	[objet]: Ammobox

  # RETURNED VALUE #

  # SYNTAX #
    ["_AmmoBox"] call POPO_fnc_BLUFORAmmobox;

  # DEPENDENCIES # 

  # EXAMPLE # 
    ["B_supplyCrate_F"] call POPO_fnc_BLUFORAmmobox;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
params ["_AmmoBox"];  
      
// clear crate - leaves medkits in place. add clearItemCargoGlobal _AmmoBox; to remove medkits
clearWeaponCargoGlobal _AmmoBox;
clearMagazineCargoGlobal _AmmoBox;
clearItemCargoGlobal _AmmoBox;
clearBackpackCargoGlobal _AmmoBox;

// fill crate with our junk
_AmmoBox addWeaponCargoGlobal ["maestro_srifle_LRR_F", 1];	
_AmmoBox addItemCargoGlobal ["maestro_darter_B_UAV_Packed", 2];
_AmmoBox addItemCargoGlobal ["yo_usmr10_mod1_black", 1];
_AmmoBox addItemCargoGlobal ["optic_Nightstalker", 1];
_AmmoBox addItemCargoGlobal ["hlc_muzzle_300blk_KAC", 1];
		
//_AmmoBox addItemCargoGlobal ["ACE_splint", 20];
_AmmoBox addItemCargoGlobal ["ACE_epinephrine", 20];
_AmmoBox addItemCargoGlobal ["ACE_morphine", 20];
_AmmoBox addItemCargoGlobal ["ACE_packingBandage", 20];
_AmmoBox addItemCargoGlobal ["ACE_elasticBandage", 20];
_AmmoBox addItemCargoGlobal ["ACE_UAVBattery", 10];
_AmmoBox addItemCargoGlobal ["ACE_EarPlugs", 4];
//_AmmoBox addItemCargoGlobal ["ACE_tourniquet", 20];
_AmmoBox addItemCargoGlobal ["ACE_quikclot", 20];
//_AmmoBox addItemCargoGlobal ["ACE_fieldDressing", 20];
_AmmoBox addItemCargoGlobal ["ACE_CableTie", 20];	
_AmmoBox addItemCargoGlobal ["U_B_Wetsuit", 4];
_AmmoBox addItemCargoGlobal ["V_RebreatherB", 4];
_AmmoBox addItemCargoGlobal ["G_B_Diving", 4];
		
		
_AmmoBox addMagazineCargoGlobal ["maestro_224_SS109_75Rnd", 10];
_AmmoBox addMagazineCargoGlobal ["maestro_224_SS109_150Rnd", 10];
_AmmoBox addMagazineCargoGlobal ["maestro_224_SS109_200Rnd", 10];
_AmmoBox addMagazineCargoGlobal ["maestro_308_MK316_20Rnd", 20];
_AmmoBox addMagazineCargoGlobal ["maestro_224_MK318_30Rnd", 20];
_AmmoBox addMagazineCargoGlobal ["maestro_408_API_7Rnd", 10];
_AmmoBox addMagazineCargoGlobal ["maestro_408_HB_7Rnd", 10];
_AmmoBox addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 2];
_AmmoBox addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 4];
_AmmoBox addMagazineCargoGlobal ["ATMine_Range_Mag", 4];
_AmmoBox addMagazineCargoGlobal ["APERSMineDispenser_Mag", 4];
_AmmoBox addMagazineCargoGlobal ["MiniGrenade", 20];
_AmmoBox addMagazineCargoGlobal ["ACE_M84", 20];
_AmmoBox addMagazineCargoGlobal ["SmokeShell", 20];
_AmmoBox addMagazineCargoGlobal ["SmokeShellYellow", 10];
_AmmoBox addMagazineCargoGlobal ["ACE_Chemlight_HiYellow", 10];
_AmmoBox addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 20];
//_AmmoBox addMagazineCargoGlobal ["MRAWS_HEAT55_F", 5];
_AmmoBox addMagazineCargoGlobal ["1Rnd_RC40_shell_RF", 20];
_AmmoBox addMagazineCargoGlobal ["1Rnd_RC40_HE_shell_RF", 20];
_AmmoBox addMagazineCargoGlobal ["1Rnd_RC40_SmokeWhite_shell_RF", 20];
_AmmoBox addMagazineCargoGlobal ["Titan_AA", 4];
_AmmoBox addMagazineCargoGlobal ["Titan_AT", 2];
//_AmmoBox addMagazineCargoGlobal ["maestro_57_SS190_20Rnd", 10];
_AmmoBox addMagazineCargoGlobal ["maestro_9x19_JHP_19Rnd", 8];
_AmmoBox addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 5];

true