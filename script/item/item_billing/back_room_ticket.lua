--×÷Õß£ºÑÏ¾ü
--´´½¨ÈÕÆÚ£º08Äê2ÔÂ18ÈÕ16:20
--Ê¦ÃÅ¹Ø¿¨¹«¹²º¯Êı½Å±¾ÎÄ¼ş
Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szInforHeader = "<color=green>TruyÒn phï mËt thÊt<color>:";
g_szThisFile = "\\script\\item\\item_billing\\back_room_ticket.lua";
g_nFaction = 0;	--ÃÅÅÉ
g_nBackRoomEntryType = 2;	--Èë¿ÚÀàĞÍ£¬·ÖÁ½ÖÖ¡£1±íÊ¾´ÓÊ¦¸µ´¦½øÈë£¬2±íÊ¾´ÓµÀ¾ß´¦½øÈë

function OnUse(nItemIdx)
	if BR_CheckCityMapID() ~= 1 then
		Talk(1,"","ChØ cã thÓ dïng vËt nµy trong thµnh.");
		return 0;
	end;
	backroom_main();
end;