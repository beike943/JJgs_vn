-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");

Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szThisFile = "\\script\\Î÷±±Çø\\À¥ÂØ\\npc\\³Â²»Îª.lua";	--Ä¬ÈÏÖµ
g_szInforHeader = "<color=green>TrÇn BÊt Vi<color>:";	--Ä¬ÈÏÖµ
g_nBackRoomEntryType = 1;	--Èë¿ÚÀàĞÍ£¬·ÖÁ½ÖÖ¡£1±íÊ¾´ÓÊ¦¸µ´¦½øÈë£¬2±íÊ¾´ÓµÀ¾ß´¦½øÈë

function main()
	--backroom_main();
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"TrÇn BÊt Vi: LÇn tr­íc ta du ngo¹n B¸ch ViÖt ®óng lµ vui kh«ng t¶ næi."},
		{"TrÇn BÊt Vi: Mçi lÇn du ngo¹n ta ®Òu tiÖn tay thu phôc yªu ma trªn ®­êng, mçi lÇn ta ®Òu bŞ th­¬ng nhÑ. Kh«ng ph¶i v× ta kĞm cái mµ khu«n mÆt cña Mai s­ muéi trong lóc trŞ th­¬ng lµm ta khã quªn. "},
		{"V©n phiªu t¸n thÆng h¹ ca dao, tiªu diªu tø ph­¬ng…"},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
end