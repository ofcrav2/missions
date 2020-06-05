if (hasInterface) then {
	
	doNothing = {
		// empty
	};

	if (!isDedicated) then {
		{_x setMarkerAlphaLocal 0} forEach ["tracker","tracker_redfor"];
		waitUntil {!isNull player};
		switch (side player) do
		{
			/*case WEST:
			{
				{_x setMarkerAlphaLocal 1} forEach ["spawnus","mkus","mkus1","mkus2"];
			};
			case EAST:
			{
				{_x setMarkerAlphaLocal 1} forEach ["spawnru","mkru","mkru1","mkru2"];
			};*/
			case independent:
			{
				{_x setMarkerAlphaLocal 1} forEach ["tracker"];
				{_x setMarkerAlphaLocal 0} forEach ["marker_4","marker_5"];
			};
		};
	};



	if ((side player) == independent) then {
		[] spawn {
			while{not isnull harold} do {"tracker" setmarkerpos getpos harold; sleep 0.4;};
		};
	};
	
	if (side player == EAST) then {
		[
		red_computer_1,											// Object the action is attached to
		"Get HVT position on map for 15 seconds",									// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 3",						// Condition for the action to be shown
		"_caller distance _target < 3",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{ _this call MY_fnc_hackingCompleted_red },				// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		7,													// Action duration [s]
		0,													// Priority
		false,												// Remove on completion
		false												// Show in unconscious state 
	] remoteExec ["BIS_fnc_holdActionAdd", 0, red_computer_1];	// MP compatible implementation	
	};
	MY_fnc_hackingCompleted_red = {
		if (side player == EAST) then {
		"tracker_redfor" setmarkerpos getpos harold;
		"tracker_redfor" setMarkerAlphaLocal 1;
		hint "Marker position updated";
		sleep 15;
		"tracker_redfor" setMarkerAlphaLocal 0;
		};
	};
	if (side player == WEST) then {
		[
		red_computer_1,											// Object the action is attached to
		"Get HVT position on map for 15 seconds",									// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 3",						// Condition for the action to be shown
		"_caller distance _target < 3",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{ _this call MY_fnc_hackingCompleted_blue },				// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		7,													// Action duration [s]
		0,													// Priority
		false,												// Remove on completion
		false												// Show in unconscious state 
	] remoteExec ["BIS_fnc_holdActionAdd", 0, red_computer_1];	// MP compatible implementation	
	};
	MY_fnc_hackingCompleted_blue = {
		if (side player == WEST) then {
		"tracker_redfor" setmarkerpos getpos harold;
		"tracker_redfor" setMarkerAlphaLocal 1;
		hint "Marker position updated";
		sleep 15;
		"tracker_redfor" setMarkerAlphaLocal 0;
		};
	};
	[
		computer_warehouse,											// Object the action is attached to
		"Get PMC locations",									// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 7",						// Condition for the action to be shown
		"_caller distance _target < 7",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{ _this call MY_fnc_hackingCompleted_warehouse },				// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		25,													// Action duration [s]
		0,													// Priority
		false,												// Remove on completion
		false												// Show in unconscious state 
	] remoteExec ["BIS_fnc_holdActionAdd", 0, computer_warehouse];	// MP compatible implementation	
	MY_fnc_hackingCompleted_warehouse = {
		hint parseText "<img image='images\pmc1.paa' size=16 /> <br /> That was pointless... ";
	};
	
/* Hereafter an example to manage Flag value
	doSomethingThenSetFlagsValue = {
		hint "The object location is GRID#XXX-YYY";
		[1, true] call omtk_setFlagResult; // set flag 1 to true
		[2, false] call omtk_setFlagResult; // set flag 2 to false
	};
*/

/* Hereafter an example to take the control of an IA
	takeHostageControl = {
		_hostage = missionNamespace getVariable ["hostage", objNull];
		if (!isNil "_hostage") then {
			_hostage enableAI "MOVE";
			_hostage allowDamage true;
			(group _hostage) setCombatMode "BLUE";
		
			_groupToJoin = group player;
			_freeId = (count units _groupToJoin);
			_hostage joinAs [_groupToJoin, _freeId];
		};
	};

	if (side player == EAST) then {
		_hostage = missionNamespace getVariable ["hostage", objNull];
		_txt = "<t color='#0000FF'>Add the hostage to your group</t>";
		_action = _hostage addAction[_txt, {call takeHostageControl;}, []];
	};
*/

/* Hereafter an example to manage the drop of an item inside a specific cargo, ammo box etc...
	insertObject = {
		_container = _this select 0;
		_item = _this select 1;
		if ( (_container == "container_name") && (_item == "item_class") ) then {
			[1, true] call omtk_setFlagResult;
		};
	};

	if (side player == West) then {
		player addEventHandler ["Put", {[str (_this select 1), _this select 2] call insertObject;}];
	};
*/

};
