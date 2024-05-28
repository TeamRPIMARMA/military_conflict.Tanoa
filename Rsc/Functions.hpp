class POPO {

    class Common
	{
        // init
        //class initCommon                    {file = "Common\Init\fn_initCommon.sqf";};
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
    };

    class Server
    {
        // init
        class initParametersServer          {file = "Server\Init\fn_initParametersServer.sqf";};
        // Functions
        class SpawnUnitRandomBuilding       {file = "Server\Functions\fn_SpawnUnitRandomBuilding.sqf";};
    };
};

