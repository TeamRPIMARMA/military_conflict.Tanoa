class POPO {

    class Common
	{
        // init
        class initCommon                    {file = "Common\Init\fn_initCommon.sqf";};
        class initCommonConstants           {file = "Common\Init\fn_initCommonConstants.sqf";}; 
        class initParametersCommon          {file = "Common\Init\fn_initParametersCommon.sqf";};
        // Functions
		class 3DSound                       {file = "Common\Functions\fn_3DSound.sqf";};
    	class EscortHostage                 {file = "Common\Functions\fn_EscortHostage.sqf";};
        class StopEscortHostage             {file = "Common\Functions\fn_StopEscortHostage.sqf";};
        class FreeHostage                   {file = "Common\Functions\fn_FreeHostage.sqf";};
        class Loop                          {file = "Common\Functions\fn_Loop.sqf";};
        class SpawnHostageRandom            {file = "Common\Functions\fn_SpawnHostageRandom.sqf";}; 
// problem with this function -- class SpawnHostageRandomBuilding    {file = "Common\Functions\fn_SpawnHostageRandomBuilding.sqf";};
        class CreateTriggerGetMarker        {file = "Common\Functions\fn_CreateTriggerGetMarker.sqf";};
    };

    class Server
    {
        // init
        class initParametersServer          {file = "Server\Init\fn_initParametersServer.sqf";};
        // Functions
        class SpawnUnitRandomBuilding       {file = "Server\Functions\fn_SpawnUnitRandomBuilding.sqf";};
        class SkillSet                      {file = "Server\Functions\fn_SkillSet.sqf";};
        class reinforcementVehicle          {file = "Server\Functions\fn_reinforcementVehicle.sqf";};
        class reinforcementInfantry         {file = "Server\Functions\fn_reinforcementInfantry.sqf";};
    };
};

