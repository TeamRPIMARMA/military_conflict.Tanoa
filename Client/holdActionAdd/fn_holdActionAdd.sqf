params ["_object"];

if (alive _object) then
{
	[  
		 _object,             
   		"désactiver le GPS",             
   		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",    
   		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",    
   		"player distance _target < 3",         
   		"player distance _target < 3",        
		 {},               
		 {},               
		 {trackerGPS = false;trackerGPSLocal = false;},      
		 {},               
		 [],               
		 1,               
		 0,               
		 true,              
		 false              
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _object];
};