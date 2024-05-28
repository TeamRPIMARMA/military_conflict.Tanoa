//--- Params //////////////////////////////////////////////////////////
//Generates a variable for each parameter based on the parameters class name:
for "_i" from 0 to (count paramsArray - 1) do
{
	missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i), paramsArray select _i];
};

call POPO_fnc_initCommonConstants;
call POPO_fnc_initParametersCommon;
call POPO_fnc_initParametersServer;