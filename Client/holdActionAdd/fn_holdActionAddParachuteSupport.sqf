actionIDSlot1 = if (side player == west && alive player)  then
{
	[  
		 player,             
		 "Parachutage de munitions",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",     
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {[west, "AirBase"] sideChat localize "STR_CTI_POPO_HQ_MESSAGE_PARADROP";},               
		 {},               
		 {[spawn_inAirDelivery_1,"B_T_VTOL_01_Vehicle_F_Kimi","B_supplyCrate_F",200] call POPO_fnc_ParachuteSupport;},      
		 {},               
		 [],               
		 1,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};