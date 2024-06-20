if (CTI_POPO_TOWN_Units_Georgetown_ENABLED isEqualTo 1) then 
{
    [I_TCN_ELITE_INFANTRY_BUILDING, 400, "marker_area_0", 400] call POPO_fnc_SpawnUnitRandomBuilding;
    } else {
    ["marker_area_0","[I_TCN_ELITE_INFANTRY_BUILDING, 400, 'marker_area_0', 400] call POPO_fnc_SpawnUnitRandomBuilding","WEST","PRESENT","","this",false,""] call POPO_fnc_CreateTriggerGetMarker;
};
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format [CTI_POPO_TOWN_Units_Georgetown_ENABLED];};