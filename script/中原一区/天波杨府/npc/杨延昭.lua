Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szThisFile = "\\script\\中原一区\\天波杨府\\npc\\杨延昭.lua";	--默认值
g_szInforHeader = "<color=green>Dng Di猲 Chi猽<color>:";	--默认值
g_nBackRoomEntryType = 1;	--入口类型，分两种。1表示从师傅处进入，2表示从道具处进入

function main()
	backroom_main();
end
