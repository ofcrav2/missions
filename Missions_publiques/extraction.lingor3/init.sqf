////// OMTK CONFIGURATION

// tactical_paradrop: area restriction (optional)
OMTK_TP_BLUEFOR_RESTRICTIONS = [
  //[x_coordinate, y_coordinate, radius_in_m],
];

OMTK_TP_REDFOR_RESTRICTIONS = [
  //[x_coordinate, y_coordinate, radius_in_m],
];

// tactical_paradrop: delay before enabling paradrop feature (optional)
OMTK_TP_BLUEFOR_DELAY = 0; // delay in seconds
OMTK_TP_REDFOR_DELAY = 0; // delay in seconds

// score_board: objectives and mission duration
// OMTK_SB_MISSION_DURATION_OVERRIDE = [0, 0, 0]; // [hours, minutes, seconds]

execVM "customScripts.sqf";

OMTK_SB_LIST_OBJECTIFS = [
  [5, "BLUEFOR", "INSIDE", "Harold is the US aircraft carrier", "carrier", ["LIST", ["harold"]] ],
  [5, "REDFOR", "INSIDE", "Harold is in the Lingor Army HQ", "office", ["LIST", ["harold"]] ],
  [3, "BLUEFOR+REDFOR", "INSIDE", "Capture the tower", "tower", ["DIFF", 1] ],
  [3, "BLUEFOR+REDFOR", "INSIDE", "Capture the Lingor Army HQ", "office", ["DIFF", 1] ],
  [2, "BLUEFOR", "DESTRUCTION", "Supremacy Bonus", ["REDFOR", 5] ],
  [2, "REDFOR", "DESTRUCTION", "Supremacy Bonus", ["BLUEFOR", 5] ] 
];

OMTK_LM_BLUEFOR_OB = [
];

OMTK_LM_REDFOR_OB = [
];

////// SPECIAL CONFIGURATION
setTerrainGrid 3.125;

OMTK_WARMUP_MENU = [
	["OMTK MENU", true],
	["Warmup: side is ready", [2], "", -5, [["expression", "[] call omtk_wu_set_ready;"]], "1", "1"]
];

OMTK_MARKERS_MENU = [
	["OMTK MENU", true],
	["Process markers", [2], "", -5, [["expression", "[] call omtk_ds_process_markers_mode;"]], "1", "1"]
];

// EXTERNAL ADDONS
RscSpectator_allowFreeCam = true;
//cutrsc ['RscSpectator','plain'];

[player, [missionNamespace, "OMTK_LOADOUT"]] call BIS_fnc_saveInventory;


//// OMTK EXECUTION
execVM "omtk\load_modules.sqf";
// Création briefing
execVM "omtk\briefing.sqf";
execVM "omtk\fn_inventoryBriefing.sqf";
execVM "omtk\fn_rosterBriefing.sqf";

// Logging des joueurs sur le serveur
onPlayerConnected {[ _name + " - " + _uid, "CONNECT", false] call omtk_log};
onPlayerDisconnected {[ _name + " - " + _uid, "DISCONNECT", false] call omtk_log};