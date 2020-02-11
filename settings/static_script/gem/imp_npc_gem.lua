Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\gem\\imp_item_gem_box.lua")

SZ_NPC_NAME = "Hoµn Nhan Hy Y "
function gem_OnServerStart()
	local npcIndex1 = CreateNpc("Gem_Npc", SZ_NPC_NAME, 350,1381,3017)
    SetNpcScript(npcIndex1, "\\script\\gem\\npc_gem.lua")
end

function gemNpcTalkMain()
	if IsGemSystemOpen(2) ~= 1 then
		return
	end
	
	local szTitle = format("%s", "Chç cña ta cã thÓ hoµn thµnh c¸c thao t¸c liªn quan vÒ ®¸ quý")
	local tbSay = {}

	tinsert(tbSay, format("%s/_open_gem_box_from_npc", "Më CÈm Nang §¸ Quý"))
	tinsert(tbSay, format("%s/_getGemBox", "NhËn CÈm Nang §¸ Quý"))
	tinsert(tbSay, format("%s/_gemOp_OpenHole", "§ôc lç trang bÞ"))
	tinsert(tbSay, format("%s/_gemOp_InsertGem", "Kh¶m ®¸ quý"))
	--tinsert(tbSay, format("%s/_gemOp_RemoveGem", "±¦Ê¯²ð½â"))
	--tinsert(tbSay, format("%s/_open_gem_shop", "±¦Ê¯ÉÌµê"))
	tinsert(tbSay, format("%s/_open_gem_lucky_box", "R­¬ng May M¾n §¸ Quý"))
	tinsert(tbSay, format("%s/nothing", "Ra khái"))

	Say(szTitle, getn(tbSay), tbSay)
end

function _open_gem_shop()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3046, "TiÖm §¸ Quý"));
end

function _open_gem_lucky_box()
	SendScript2Client("Open[[luckybox]]");	
end

function _open_gem_box_from_npc()
	OnOpen_GemBox_FromNpc()
end

function _getGemBox()
	local nG,nD,nP = 2, 1, 30699
	if BigGetItemCount(nG,nD,nP) ~= 0 then
		Talk(1, "", format("B¹n ®· cã [%s] råi", g_szItemNameGemBox));
		return
	end
	local nRetCode, nItem = AddItem(nG,nD,nP, 1);
	if nRetCode == 1 then
		Msg2Player(format("B¹n nhËn ®­îc 1 %s", g_szItemNameGemBox));
	end
end

function _gemOp_OpenHole()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 5));
end

function _gemOp_InsertGem()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 8));
end

function _gemOp_RemoveGem()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 11));
end

function nothing()
end