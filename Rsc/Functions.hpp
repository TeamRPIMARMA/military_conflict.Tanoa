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
        class CreateTriggerGetMarker        {file = "Common\Functions\fn_CreateTriggerGetMarker.sqf";}; 
// problem with this function -- class SpawnHostageRandomBuilding    {file = "Common\Functions\fn_SpawnHostageRandomBuilding.sqf";};

        // Config
        class independantAISkill            {file = "Common\Config\AI_Skill\fn_independantAISkill.sqf";};
        class opforAISkill                  {file = "Common\Config\AI_Skill\fn_opforAISkill.sqf";};

        //Faction
        class factionCivilian               {file = "Common\Config\Faction\fn_factionCivilian.sqf";};
        class factionIndependent            {file = "Common\Config\Faction\fn_factionIndependent.sqf";};
        class factionOpfor                  {file = "Common\Config\Faction\fn_factionOpfor.sqf";};
    };

    class Server
    {
        // init
        class initParametersServer          {file = "Server\Init\fn_initParametersServer.sqf";};
        
        // Functions
        class SpawnUnitRandomBuilding       {file = "Server\Functions\fn_SpawnUnitRandomBuilding.sqf";};
        class SpawnMortarRandom             {file = "Server\Functions\fn_SpawnMortarRandom.sqf";};
        class SkillSet                      {file = "Server\Functions\fn_SkillSet.sqf";};
        class reinforcementInfantry         {file = "Server\Functions\fn_reinforcementInfantry.sqf";};
        class reinforcementVehicle          {file = "Server\Functions\fn_reinforcementVehicle.sqf";};
        class reinforcementTank             {file = "Server\Functions\fn_reinforcementTank.sqf";};
        class reinforcementPlane            {file = "Server\Functions\fn_reinforcementPlane.sqf";};
        class reinforcementChopper          {file = "Server\Functions\fn_reinforcementChopper.sqf";};
    };
};

