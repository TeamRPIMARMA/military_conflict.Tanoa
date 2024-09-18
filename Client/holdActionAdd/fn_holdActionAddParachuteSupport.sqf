actionIDSlot1 = if (side player == west && alive player)  then
{
	[  
		 player,             
		 localize "STR_CTI_POPO_PARADROP_AMMOBOX",            
		 "HoldActionsPAA\holdAction_container_ca.paa",   
		 "HoldActionsPAA\holdAction_container_ca.paa",     
		 "player distance _target < 1",        
		 "player distance _target < 1",        
		 {},               
		 {},               
		 {[spawn_inAirDelivery_1,"B_T_VTOL_01_Vehicle_F_Kimi","maestro_B_T_Pickup_Comms_rf_cage",300,1] spawn POPO_fnc_ParachuteSupport;},      
		 {},               
		 [],               
		 1,               
		 0,               
		 false,              
		 false              
	] call BIS_fnc_holdActionAdd;
};