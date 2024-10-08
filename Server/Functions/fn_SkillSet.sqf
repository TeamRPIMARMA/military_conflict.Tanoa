/*
  # HEADER #
	Script: 		Server\Functions\fn_SkillSet.sqf
	Alias:			
	Description:			      
          FR = La fonction permet de paramètrer le skill de l'IA.
          
          
          EN = The function allows you to configure the AI ​​skill.
          
	Author: 		Popo
	Creation Date:	29-05-2024
	Revision Date:	11-07-2024
	
  # PARAMETERS #
  0	[array]: The type of units to create
  1	[array]: AI Skill
  
  # RETURNED VALUE #

  # SYNTAX #
	["_unit","_skillset","_side"] call POPO_fnc_SkillSet;

  # DEPENDENCIES # 

  # EXAMPLE # 
  [_pilot,BANDITS_AIRskill,independent] call POPO_fnc_SkillSet;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_unit","_skillset","_side"];
if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["retourne le tableau du skillSet, %1", _skillset];};

{
	_unit = _x;
	{
		_skillvalue = (_skillset select _forEachIndex) + (random 0.2) - (random 0.2);
		_unit setSkill [_x,_skillvalue];
	} forEach ['aimingAccuracy','aimingShake','aimingSpeed','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];

} forEach (units _side);
 
// return value
_skillaimingAccuracy = _unit skill "aimingAccuracy";
_skillaimingShake = _unit skill "aimingShake";
_skillaimingSpeed = _unit skill "aimingSpeed";
_skillspotDistance = _unit skill "spotDistance";
_skillspotTime = _unit skill "spotTime";
_skillcourage = _unit skill "courage";
_skillreloadSpeed = _unit skill "reloadSpeed";
_skillcommanding = _unit skill "commanding";
_skillgeneral = _unit skill "general";

if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {
	player globalChat format ["aimingAccuracy, %1", _skillaimingAccuracy];
	player globalChat format ["aimingShake, %1", _skillaimingShake];	
	player globalChat format ["aimingSpeed, %1", _skillaimingSpeed];
	player globalChat format ["spotDistance, %1", _skillspotDistance];
	player globalChat format ["spotTime, %1", _skillspotTime];
	player globalChat format ["courage, %1", _skillcourage];
	player globalChat format ["reloadSpeed, %1", _skillreloadSpeed];
	player globalChat format ["commanding, %1", _skillcommanding];
	player globalChat format ["general, %1", _skillgeneral];
};

true

