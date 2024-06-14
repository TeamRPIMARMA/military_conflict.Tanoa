if (side player == west)  then 
{ 
 [   
   brouilleur,              
   "désactiver le brouillage",             
   "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",    
   "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",    
   "player distance _target < 10",         
   "player distance _target < 10",         
   {},                
   {},                
   {brouilleur animateSource ["Progress_source",0,false];deleteVehicle declencheur_brouilleur_1;call POPO_fnc_addInterference;call POPO_fnc_holdActionAddParachuteSupport;},       
   {},                
   [],                
   10,                
   9,                
   true,               
   false               
 ] remoteExec ["BIS_fnc_holdActionAdd", 0, brouilleur]; 
};