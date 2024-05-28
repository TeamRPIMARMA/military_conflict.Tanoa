/*
//--- Params //////////////////////////////////////////////////////////
//Generates a variable for each parameter based on the parameters class name:
for "_i" from 0 to (count paramsArray - 1) do
{
	missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i), paramsArray select _i];
};

//--- Retrun the variable for params
// Spawn hostage Georgetown
if (CTI_POPO_TOWN_Hostages_Georgetown_ENABLED isEqualTo CTI_POPO_TOWN_Hostages_Georgetown_ENABLED) then {[Hostage,20,"hostages_marker_0", 400] spawn POPO_Common_fnc_SpawnRandomHostagesBuilding;};
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format [CTI_POPO_TOWN_Hostages_Georgetown_ENABLED];};

// Spawn unit enemy Georgetown
if (CTI_POPO_TOWN_Units_Georgetown_ENABLED isEqualTo 1) then {[Units_Resistance,400,"units_marker_0", 400] call POPO_Server_fnc_SpawnUnitRandomBuilding;};
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format [CTI_POPO_TOWN_Units_Georgetown_ENABLED];};
*/