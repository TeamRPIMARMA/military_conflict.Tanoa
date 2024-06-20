/*
  # HEADER #
	Script: 		Common\Functions\fn_addInterference.sqf
	Alias:			
	Description:			      
          FR = La fonction permet de rajouter certains items simulant un système de brouillage.
          
          
          EN = The function allows you to add certain items simulating a jamming system.
          
	Author: 		Popo
	Creation Date:	14-06-2024
	Revision Date:	14-06-2024
	
  # PARAMETERS #
  
  # RETURNED VALUE #

  # SYNTAX #
    call POPO_fnc_addInterference;

  # DEPENDENCIES # 

  # EXAMPLE # 
    call POPO_fnc_addInterference;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
private _players = allPlayers - entities "HeadlessClient_F";
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["Retourne, %1", _players];};

{ 

    _x addItem "TFAR_anprc152";
    _x addItem "ItemRadio";
    _x addItem "B_UavTerminal";
    _x addItem "ACE_microDAGR";
    _x addItem "ItemMap";

    _x assignItem "TFAR_anprc152";
    _x assignItem "ItemRadio";
    _x assignItem "B_UavTerminal";
    _x assignItem "ACE_microDAGR";
    _x assignItem "ItemMap";

} forEach _players;
*/
player addItem "TFAR_anprc152";
player addItem "ItemRadio";
player addItem "B_UavTerminal";
player addItem "ACE_microDAGR";
player addItem "ItemMap";

player assignItem "TFAR_anprc152";
player assignItem "ItemRadio";
player assignItem "B_UavTerminal";
player assignItem "ACE_microDAGR";
player assignItem "ItemMap";

playSound3D ["lxRF\sounds_rf\radio\radio_on.wss", player, true, getPosASL player,1,1,0];

if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["Retourne, %1", player];};