//--- Params //////////////////////////////////////////////////////////
//Generates a variable for each parameter based on the parameters class name:
for "_i" from 0 to (count paramsArray - 1) do
{
	missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i), paramsArray select _i];
};

//call POPO_fnc_initCommon;
call POPO_fnc_initCommonConstants;
call POPO_fnc_initParametersCommon;
call POPO_fnc_initParametersServer;

["marker_0","['marker_0',Units_Resistance ,4] call POPO_fnc_reinforcementInfantry","WEST","GUER D"] call POPO_fnc_CreateTriggerGetMarker;
["marker_0","['marker_2',Popo_Reinforcement ,2] call POPO_fnc_reinforcementVehicle","WEST","GUER D"] call POPO_fnc_CreateTriggerGetMarker;