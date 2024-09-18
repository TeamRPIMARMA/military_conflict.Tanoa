// AI Skill

// INFANTRY SKILL
_BANDITS_INFskill = [
0.20, // aimingAccuracy
0.15, // aimingShake
0.40, // aimingSpeed
0.30, // spotDistance
0.50, // spotTime
0.40, // courage
0.40, // reloadSpeed
0.30, // commanding
0.50 // general
];

// ARMOUR SKILL
_BANDITS_ARMskill = [
0.60, // aimingAccuracy
0.30, // aimingShake
0.50, // aimingSpeed
1, // spotDistance
0.50, // spotTime
0.90, // courage
0.60, // reloadSpeed
1, // commanding
1  // general
];

// LIGHT VEHICLE skill
_BANDITS_LIGskill = [
0.30, // aimingAccuracy
0.25, // aimingShake
0.40, // aimingSpeed
0.40, // spotDistance
0.40, // spotTime
0.60, // courage
0.60, // reloadSpeed
0.70, // commanding
0.60  // general
];

// AIR SKILL
_BANDITS_AIRskill = [
0.70, // aimingAccuracy
0.60, // aimingShake
0.80, // aimingSpeed
1, // spotDistance
0.90, // spotTime
1, // courage
0.80, // reloadSpeed
1, // commanding
1  // general
];

// STATIC SKILL
_BANDITS_STAskill = [
0.40, // aimingAccuracy
0.70, // aimingShake
0.80, // aimingSpeed
0.60, // spotDistance
0.60, // spotTime
0.50, // courage
0.80, // reloadSpeed
1, // commanding
1  // general
];

BANDITS_INFskill = _BANDITS_INFskill;
publicVariableServer "BANDITS_INFskill";

BANDITS_ARMskill = _BANDITS_ARMskill;
publicVariableServer "BANDITS_ARMskill";

BANDITS_LIGskill = _BANDITS_LIGskill;
publicVariableServer "BANDITS_LIGskill";

BANDITS_AIRskill = _BANDITS_AIRskill;
publicVariableServer "BANDITS_AIRskill";

BANDITS_STAskill = _BANDITS_STAskill;
publicVariableServer "BANDITS_STAskill";




/*
BANDITS_INFskill = _BANDITS_INFskill;
publicVariable "BANDITS_INFskill";

BANDITS_ARMskill = _BANDITS_ARMskill;
publicVariable "BANDITS_ARMskill";

BANDITS_LIGskill = _BANDITS_LIGskill;
publicVariable "BANDITS_LIGskill";

BANDITS_AIRskill = _BANDITS_AIRskill;
publicVariable "BANDITS_AIRskill";

BANDITS_STAskill = _BANDITS_STAskill;
publicVariable "BANDITS_STAskill";

server setvariable ["BANDITS_INFskill",_BANDITS_INFskill];
server setvariable ["BANDITS_ARMskill",_BANDITS_ARMskill];
server setvariable ["BANDITS_LIGskill",_BANDITS_LIGskill];
server setvariable ["BANDITS_AIRskill",_BANDITS_AIRskill];
server setvariable ["BANDITS_STAskill",_BANDITS_STAskill];