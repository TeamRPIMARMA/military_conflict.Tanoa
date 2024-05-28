//--- Server
if (CTI_POPO_TOWN_Units_Georgetown_ENABLED isEqualTo 1) then {[Units_Resistance, 400, "marker_0", 400] call POPO_fnc_SpawnUnitRandomBuilding;};
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format [CTI_POPO_TOWN_Units_Georgetown_ENABLED];};