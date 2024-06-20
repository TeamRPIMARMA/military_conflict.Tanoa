if (CTI_POPO_TOWN_Hostages_Georgetown_ENABLED isEqualTo 1) then 
{
    [Hostage,Random_Spawn_Hostage,10] spawn POPO_fnc_SpawnHostageRandom;
    } else {
    ["marker_area_0","[Hostage,Random_Spawn_Hostage,10] spawn POPO_fnc_SpawnHostageRandom","WEST","PRESENT","","this",false,""] call POPO_fnc_CreateTriggerGetMarker;
};
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format [CTI_POPO_TOWN_Hostages_Georgetown_ENABLED];};