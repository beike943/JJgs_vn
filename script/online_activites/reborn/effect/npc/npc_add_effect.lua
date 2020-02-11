----------------[»°Ëµ´úÂëÓ¦¸ÃÊÇÒ»ÖÖÒÕÊõ]----------------
--------------------------------------------------------
--½Å±¾Ãû³Æ:Áú¹âÕæÈËNPCÖ÷¶Ô»°½Å±¾                       |
--½Å±¾¹¦ÄÜ:Áú¹âÕæÈËNPC¹¦ÄÜÈë¿Ú                         |
--¹¦ÄÜ¿ª·¢ÈË:ÁõÓî±ó                                    |
--¹¦ÄÜ¿ª·¢Ê±¼ä£º2009-12-28                             |
--Ö÷ÒªĞŞ¸Ä¼ÇÂ¼£º                                       |
--------------------------------------------------------
Include("\\script\\online_activites\\reborn\\effect\\head.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_weapon.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_cloth.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\nhiemvudonghanh.lua")

-----------------------------------------npc½Å±¾Èë¿Ú-----------------------------------------
function main()
	local tbSays = {}
	if CFG_NhiemVuDongHanh == 1 then
		tinsert(tbSays, "NhiÖm vô ®ång hµnh/NhiemVuDongHanh_Menu")
	end
--	tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[0][2].."/weapon_effect")          --ÎäÆ÷ÔÌÁéÏà¹Ø
	tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[0][3].."/cloth_effect")           --Íâ×°ÔÌÁéÏà¹Ø
	tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[0][4].."/gf_DoNothing")            --¿Õº¯Êı

    Say(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[0][1], getn(tbSays), tbSays);
end