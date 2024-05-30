/*
  # HEADER #
	Script: 		Server\Functions\fn_SkillSet.sqf
	Alias:			
	Description:			      
          <FR = La fonction permet de paramètrer le skill de l'IA et de mettre un aléatoire.
          
          
          EN = The function allows you to configure the AI ​​skill and set a random.
          
	Author: 		Popo
	Creation Date:	29-05-2024
	Revision Date:	29-05-2024
	
  # PARAMETERS #
  0	[String]: The type of units to create
  1	[String]: AI Skill
  2	[String]: AISkill random +
  3	[String]: AISkill -
  

  # RETURNED VALUE #

  # SYNTAX #
	["_unit","_skillset","_aiskillrandom", "_aiskill"] call POPO_fnc_SkillSet;

  # DEPENDENCIES # 

  # EXAMPLE # 
  [_UnitsCreated,INFskill,0.2,0.2] call POPO_fnc_SkillSet;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
params ["_unit","_skillset","_aiskillrandom","_aiskill"];
_unit = _x;
{
	_skillvalue = (_skillset select _forEachIndex) + (random _aiskillrandom) - _aiskill;
	_unit setSkill [_x,_skillvalue];
} forEach ['aimingAccuracy','aimingShake','aimingSpeed','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];

true

