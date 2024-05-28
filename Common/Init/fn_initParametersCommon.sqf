//--- Retrun the variable for params
if (CTI_POPO_TOWN_Hostages_Georgetown_ENABLED isEqualTo 1) then {[Hostage,Random_Spawn_Hostage,9] spawn POPO_fnc_SpawnHostageRandom;};
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format [CTI_POPO_TOWN_Hostages_Georgetown_ENABLED];};