/*
 Basic fishing script for exile by JackFrost, modify by Serveratze [Fishing Boat]
*/

diag_log format['A Player starting fishing'];

private["_fisharray", "_randomFish"];

if (ExileClientPlayerIsInCombat) exitWith
{
	[
	    "ErrorTitleAndText", 
	    ["Fishing Info", "You are in combat!"]
	] call ExileClient_gui_toaster_addTemplateToast;
};
if (ExilePlayerInSafezone) exitWith
{
 	[
	    "ErrorTitleAndText", 
	    ["Fishing Info", "Please leave the safezone first!"]
	] call ExileClient_gui_toaster_addTemplateToast;	
};
if (speed vehicle player >= 5) exitwith
{ 
    [
	    "ErrorTitleAndText",
	    ["Fishing Info", "You move too fast to eject your net!"]
	] call ExileClient_gui_toaster_addTemplateToast;	
};
if (speed vehicle player <= -5) exitwith
{ 
    [
	    "ErrorTitleAndText",
		["Fishing Info", "You move too fast to eject your net!"]
	] call ExileClient_gui_toaster_addTemplateToast;	
};
if !("Exile_Item_BurlapSack" in magazines player) exitwith
{ 
    [
	    "ErrorTitleAndText",
		["Fishing Info", "You need a burlap sack to be able to fish!"]
    ] call ExileClient_gui_toaster_addTemplateToast;	
};
if !(vehicle player isKindOf "Ship") exitwith
{ 
    [
	    "ErrorTitleAndText",
	    ["Fishing Info", "You must be in a boat to fish!"]
	] call ExileClient_gui_toaster_addTemplateToast;
};
if ("Exile_Item_BurlapSack" in magazines player) then {
		disableUserInput true;
		["The net was ejected!"] spawn ExileClient_gui_baguette_show;
		     uisleep 12;
		    _randomFish = random 1;
    if (_randomFish > 0.85) then {
	        _fisharray =[
	                        "Exile_Item_Catsharkfilet_Raw",
	                        "Exile_Item_MackerelFilet_Raw",
	                        "Exile_Item_MulletFilet_Raw",
	                        "Exile_Item_OrnateFilet_Raw",
	                        "Exile_Item_TunaFilet_Raw",
	                        "Exile_Item_SalemaFilet_Raw",
	                        "Exile_Item_TurtleFilet_Raw"
	                    ] call BIS_fnc_selectRandom;
	player addItem _fisharray;
	["YOU HAVE FISHED!"] spawn ExileClient_gui_baguette_show;
	}
	else
	{
	["They did not catch anything."] spawn ExileClient_gui_baguette_show;
	};
};

uisleep 1;	
disableUserInput false;