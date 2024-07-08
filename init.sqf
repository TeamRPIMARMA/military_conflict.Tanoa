//--- Params //////////////////////////////////////////////////////////
//Generates a variable for each parameter based on the parameters class name:
for "_i" from 0 to (count paramsArray - 1) do
{
	missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i), paramsArray select _i];
};

// Set friendly/enemy sides
EAST setFriend [WEST, 0];
WEST setFriend [EAST, 0];
RESISTANCE setFriend [WEST, 0];
RESISTANCE setFriend [EAST, 1];
EAST setFriend [RESISTANCE, 1];
WEST setFriend [RESISTANCE, 0];

//call POPO_fnc_initCommon;
call POPO_fnc_initCommonConstants;
call POPO_fnc_initParametersCommon;
call POPO_fnc_initParametersServer;

// Create a trigger for reinforcement
["marker_area_0","['marker_area_0',I_TCN_BANDITS_INFANTRY ,4] call POPO_fnc_reinforcementInfantry","WEST","GUER D","","this",false,""] call POPO_fnc_CreateTriggerGetMarker;
["marker_area_0","[independent_Random_Spawn_vehicle,I_TCN_LIGHT_VEHICLE ,2] call POPO_fnc_reinforcementVehicle","WEST","GUER D","","this",false,""] call POPO_fnc_CreateTriggerGetMarker;

Popo_ParaDrop_Player = true;
publicVariable "Popo_ParaDrop_Player";

// Intro
/*
if (time < 10) then
{
titleCut ["", "BLACK FADED", 999];
sleep 5;
[] Spawn {
	waitUntil{!(isNil "BIS_fnc_init")};

	// Info text
	[("Insertion ...")] spawn BIS_fnc_infoText;

	playMusic "LeadTrack02_F_EPC";

	sleep 15;

	[str("île de Tanoa") , str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("By 1er-RPIMA")] spawn BIS_fnc_infoText;

	sleep 10;

	titleCut ["", "BLACK IN", 4]

	};
};
*/