params ["_vehicle"];

if (alive _vehicle) then 
{ 
 [   
   _vehicle,              
   "charger la caisse dans la benne",             
   "\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa",    
   "\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa",    
   "player distance _target < 10",         
   "player distance _target < 10",         
   {},                
   {},                
   {[Popo_Vehicle_AttachTo, Popo_AmmoBoxArsenal_AttachTo] call POPO_fnc_loadAmmoboxArsenal;},       
   {},                
   [],                
   10,                
   9,                
   false,               
   false               
 ] remoteExec ["BIS_fnc_holdActionAdd", 0, _vehicle]; 
};