//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", 		"date '+%a %d-%m-%Y %I:%M'",				5,			0},
	{";", 		"$HOME/src/dwmblocks/scripts/pack_updates.sh",		360,			0},
	{"", 		"$HOME/src/dwmblocks/scripts/cpu.sh",			2,			0},
	{"", 		"$HOME/src/dwmblocks/scripts/temp.sh",			2,			0},
	{"", 		"$HOME/src/dwmblocks/scripts/ram.sh",			2,			0},
	{"", 		"$HOME/src/dwmblocks/scripts/volume.sh",		1,			10},
	{"", 		"$HOME/src/dwmblocks/scripts/ethernet.sh",		10,			0},
	{"", 		"$HOME/src/dwmblocks/scripts/wifi.sh",			10,			0},
	{"", 		"$HOME/src/dwmblocks/scripts/battery.sh",		5,			0},
	{"", 		"$HOME/src/dwmblocks/scripts/backgroud-apps.sh",	5,			0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "\0";
static unsigned int delimLen = 5;
