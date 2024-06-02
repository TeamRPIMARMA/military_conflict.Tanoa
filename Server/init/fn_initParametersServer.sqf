if (CTI_POPO_TOWN_Units_Georgetown_ENABLED isEqualTo 1) then 
{
    [independent_Units, 400, "marker_0", 400] call POPO_fnc_SpawnUnitRandomBuilding;
    } else {
    ["marker_0","[independent_Units, 400, 'marker_0', 400] call POPO_fnc_SpawnUnitRandomBuilding","WEST","PRESENT"] call POPO_fnc_CreateTriggerGetMarker;
};
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format [CTI_POPO_TOWN_Units_Georgetown_ENABLED];};