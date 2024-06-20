/*
  # HEADER #
	Script: 		Common\Functions\fn_removeInterference.sqf
	Alias:			
	Description:			      
          FR = La fonction permet d'enelever certains items simulant un système de brouillage.
          
          
          EN = The function allows you to remove certain items simulating a jamming system.
          
	Author: 		Popo
	Creation Date:	14-06-2024
	Revision Date:	14-06-2024
	
  # PARAMETERS #
  
  # RETURNED VALUE #

  # SYNTAX #
    call POPO_fnc_removeInterference;

  # DEPENDENCIES # 

  # EXAMPLE # 
    call POPO_fnc_removeInterference;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
private _players = allPlayers - entities "HeadlessClient_F";
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["Retourne, %1", _players];};

{ 

    _x removeItem "TFAR_anprc152";
    _x removeItem "ItemRadio";
    _x removeItem "B_UavTerminal"; 
    _x removeItem "ACE_microDAGR";  
    _x removeItem "ItemMap";

    _x unassignItem "TFAR_anprc152";
    _x unassignItem "ItemRadio";
    _x unassignItem "B_UavTerminal"; 
    _x unassignItem "ACE_microDAGR";  
    _x unassignItem "ItemMap";  

    _x removeItemFromUniform "B_UavTerminal";
    _x removeItemFromVest "B_UavTerminal";
    _x removeItemFromBackpack "B_UavTerminal";


} forEach _players;
*/
player removeItem "TFAR_anprc152";
player removeItem "ItemRadio";
player removeItem "B_UavTerminal"; 
player removeItem "ACE_microDAGR";  
player removeItem "ItemMap";

player unassignItem "TFAR_anprc152";
player unassignItem "ItemRadio";
player unassignItem "B_UavTerminal"; 
player unassignItem "ACE_microDAGR";  
player unassignItem "ItemMap";  

player removeItemFromUniform "B_UavTerminal";
player removeItemFromVest "B_UavTerminal";
player removeItemFromBackpack "B_UavTerminal";

playSound3D ["lxRF\sounds_rf\radio\radio_off.wss", player, true, getPosASL player,1,1,0];

if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["Retourne, %1", player];};





