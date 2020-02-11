Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\string.lua")
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

Include("\\script\\online_activites\\head\\activity_normal_head.lua")

SZ_THIS_BOXES_SCRIPT = "\\script\\missions\\taiyi\\box\\boxes.lua"
T_BOX = {
	--award_type(1 dice 2 dice 3 card),award,consume,
	--award
	[1] = {"tongbaoxiang", "R­¬ng §ång", 1,"YXTY_tong1",},
	[2] = {"tongbaoxiang", "R­¬ng §ång", 1,"YXTY_tong2",},
	[3] = {"tongbaoxiang", "R­¬ng §ång", 1,"YXTY_tong3",},
	--award, consume
	[11] = {"yinbaoxiang", "R­¬ng B¹c", 2,"YXTY_yin", "csm_2_tianjiaoling",},
	--free_award, ib_award,ib_consume,t_ib_consmue_ui,mapId
	[21] = {"jinbaoxiang", "Kim R­¬ng", 3,"YXTY_jin1_free", "YXTY_jin1_IB", "csm_2_tianjiaoling",{2,97,236,2},6075,},
	[22] = {"jinbaoxiang", "Kim R­¬ng", 3,"YXTY_jin2_free", "YXTY_jin2_IB", "csm_2_tianjiaoling",{2,97,236,2},6075,},
}

NPC_TEMP_BOX_ID = 1 --idx of T_BOX
NPC_TEMP_DAYE_IDX = 2 --who  is the daye
NPC_TEMP_AWARD_ID = 3 --

T_BOX_IDX = {}
function create_box(id,m,x,y)
	SendScript2VM(SZ_THIS_BOXES_SCRIPT, format("_create_box(%d,%d,%d,%d)", id,m,x,y))
end
function _create_box(id,m,x,y)
	local tBox = T_BOX[id]
	if not tBox then return end
	local x2, y2 = x + random(-5, 5), y + random(-5, 5)
	local npc = CreateNpc(tBox[1], tBox[2], m, x2, y2)
	if npc and npc > 0 then
		T_BOX_IDX[npc] = 1
		--print("create box", npc)
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, SZ_THIS_BOXES_SCRIPT);
		SetNpcTempData(npc, NPC_TEMP_BOX_ID, id)
		SetNpcTempData(npc, NPC_TEMP_DAYE_IDX, 0)
    	SetNpcTempData(npc, NPC_TEMP_AWARD_ID, 0)
	else
		print("create box fail")
	end
end

function remove_boxes(npcIndex)
	SendScript2VM(SZ_THIS_BOXES_SCRIPT, format("_remove_boxes(%s)", Val2Str(npcIndex)))
end

function _remove_boxes(npcIndex)
	--print("remove box begin", npcIndex)
	if npcIndex then
		--if T_BOX_IDX[npcIndex] then
			T_BOX_IDX[npcIndex] = nil
			--print("remove box", npcIndex)
			local id = GetNpcTempData(npcIndex, NPC_TEMP_BOX_ID)
			local daye = GetNpcTempData(npcIndex, NPC_TEMP_DAYE_IDX)
			local award = GetNpcTempData(npcIndex, NPC_TEMP_AWARD_ID)
    		local tBox = T_BOX[id]
    		if not tBox then return end
    		if tBox[2] == GetNpcName(npcIndex) and daye==0 and award==0  then
    			SetNpcTempData(npcIndex, NPC_TEMP_BOX_ID, 0)
    			SetNpcTempData(npcIndex, NPC_TEMP_DAYE_IDX, 0)
    			SetNpcTempData(npcIndex, NPC_TEMP_AWARD_ID, 0)
    			SetNpcLifeTime(npcIndex, 0)
    		end
		--end
	else
		for i,v in T_BOX_IDX do
    		if i then
    			remove_boxes(i)
    		end
    	end
		T_BOX_IDX = {}
	end
end

function main()
	local npcIndex = GetTargetNpc() or 0
	--print(npcIndex, T_BOX_IDX[npcIndex])
	--if T_BOX_IDX[npcIndex] then
		local id = GetNpcTempData(npcIndex, NPC_TEMP_BOX_ID)
    	local tBox = T_BOX[id]
    	--print(id,tBox)
    	if tBox then
    		local nType = tBox[3]
    		--print("nType",nType)
    		if nType == 1 then
    			_on_open_box_tong(tBox, npcIndex)
    		elseif nType == 2 then
    			_on_open_box_yin(tBox, npcIndex)
    		elseif nType == 3 then
    			_on_open_box_jin(tBox, npcIndex)
    		end
    	else
    		print(format("boxid %d error", id))
    	end
	--end
end

function _on_open_box_tong(tBox, npcIndex)
	local szAward = tBox[4] or ""
	local nRetIndex = CustomAwardSelectOne(szAward)
	--print(nRetIndex, szAward)
	if nRetIndex > 0 then
		local ntype, tItem = CustomAwardGetAwardInfo2(nRetIndex)
		--print(ntype, tItem, tItem[1], tItem[2], tItem[3], tItem[4], tItem[5], tItem[6], tItem[7])
		if ntype == 3 then--item
			gf_ThrowDice(tItem, nil, nil, nil, nil, npcIndex)
		end
		_remove_boxes(npcIndex or 0) --É¾³ýÏä×Ó
		vaf_award_api("tTYTTongBox_H");
	else
		local szLog = format("custom award %s fail from box %s fail",szAward, tBox[2])
		--print(szLog)
		WriteLog(szLog)
	end
end

function _on_open_box_yin(tBox, npcIndex)
	if GetNpcTempData(npcIndex, NPC_TEMP_DAYE_IDX) == 0 then
		local szConsume = tBox[5]
		local szConsumeDesc = CustomAwardGroupDesc(szConsume)
		local szTitle = format("Më [%s] cÇn [%s]",tBox[2], szConsumeDesc)
		Say(szTitle,
			2, 
			format("\n%s/#_box_yin_imdaye(%d)", "X¸c nhËn më", npcIndex),
			format("\n%s/nothing", "Hñy më")
			)
		return
	else
		_box_yin_spe_loot(tBox, npcIndex);
	end
end

--´óÒ¯´ò¿ªÒø±¦Ïä
function _box_yin_imdaye(npcIndex)
	local daye = GetNpcTempData(npcIndex, NPC_TEMP_DAYE_IDX);
	if 0 ~= daye then
		Talk(1, "", "§· cã ng­êi më r­¬ng nµy råi")
		return 0
	end
	
	local id = GetNpcTempData(npcIndex, NPC_TEMP_BOX_ID)
  local tBox = T_BOX[id]
  local szConsume = tBox[5]
  if not szConsume or 1~=CustomAwardCheckAndConsumeGroup(szConsume,1) then
		return 0
	end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2, 97, 236, 2})
	if 11 == id then
		AddRuntimeStat(18, 5, GetMissionV(2)-1, 2);
	end
	
	SetNpcTempData(npcIndex, NPC_TEMP_DAYE_IDX, PlayerIndex)
	vaf_award_api("tTYTYinBox_H");
	_box_yin_spe_loot(tBox, npcIndex)
	return 1
end

function _box_yin_spe_loot(tBox, npcIndex)
	local daye = GetNpcTempData(npcIndex, NPC_TEMP_DAYE_IDX)
	if daye == 0 then
		return 0;
	end
	local tSel = {
		"KÕt thóc ®èi tho¹i/nothing",
	}
	local OldPlayerIndex = PlayerIndex
	if daye == PlayerIndex then
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= OldPlayerIndex then
				player_name = GetName();
				player_name = gf_FilterName(player_name,"/","-")
				player_name = gf_FilterName(player_name,"|","-")
				player_name = gf_FilterName(player_name,":","-")
				tinsert(tSel, 1, format("%s%s/#_box_yin_loot_other(%d,%d)", "Ta cÇn mang phÇn th­ëng ph©n cho ",player_name, PlayerIndex, npcIndex))
			end
		end
		PlayerIndex = OldPlayerIndex
		tinsert(tSel, 1, format("%s/#_box_yin_loot_award(%d,%d)", "Ta muèn nhËn phÇn th­ëng", PlayerIndex, npcIndex))
	end

	local nLootAwardId = GetNpcTempData(npcIndex, NPC_TEMP_AWARD_ID)
	if nLootAwardId == 0 then
		local szAward = tBox[4] or ""
		nLootAwardId = CustomAwardSelectOne(szAward)
		SetNpcTempData(npcIndex, NPC_TEMP_AWARD_ID, nLootAwardId)
		--print("LootAwardId", szAward, nLootAwardId)
	end
	
	if nLootAwardId > 0 then
		local ntype, g,d,p,n,name = CustomAwardGetAwardInfo(nLootAwardId)
    	local msg = ""
    	if n > 0 then
    		msg = format("<color=yellow>[%s]x%d<color>", name, n)
    	end
    	Say("<color=green>B¶o r­¬ng<color>: ë ®©y cã"..msg, getn(tSel), tSel)
	else
		print("_box_yin_spe_loot fail",tBox[4],nLootAwardId)
	end
end

function _box_yin_loot_other(player_index, npcIndex)
	local player_index_save = PlayerIndex
	--ÅÐ¶Ï¸ÃË÷ÒýÊÇ·ñ»¹ÊÇÔÚ¸Ã¶ÓÎéÖÐ
	local index_chg_chk_flag = 0
	local team_size = GetTeamSize()
	if team_size ~= 0 then
		index_chg_chk_flag = gf_IsInTeam(player_index);
	else
		index_chg_chk_flag = 1
	end
	if index_chg_chk_flag ~= 1 then
		Talk(1,"","<color=green>Chó ý<color>: Xin mêi h·y kiÓm tra l¹i nh÷ng ng­êi mµ b¹n ph©n chia cã ph¶i cã cïng <color=yellow>tæ ®éi<color> víi b¹n!")
		return
	end
	--·ÖÅä¶ÔÏóµÄ¿Õ¼ä¸ºÖØ¼ì²â
--	PlayerIndex = player_index
--	local s_palyer_name = GetName()
--	if GetFreeItemRoom() < SLT_NEED_ROOM then
--		Talk(1,"","<color=green>ÌáÊ¾<color>£ºÄúµÄ<color=yellow>°ü¹ü<color>¿Õ¼ä²»×ã£¡")
--		PlayerIndex = player_index_save
--		Talk(1,"","<color=green>ÌáÊ¾<color>£º<color=green>"..s_palyer_name.."<color>µÄ<color=yellow>°ü¹ü<color>¿Õ¼ä²»×ã£¬ÎÞ·¨½øÐÐ·ÖÅä£¡")
--		return
--	end

	PlayerIndex = player_index_save
	_box_yin_loot_award(player_index, npcIndex)
end

function _box_yin_loot_award(player_index, npcIndex)
	local id = GetNpcTempData(npcIndex, NPC_TEMP_BOX_ID)
	local nLootAwardId = GetNpcTempData(npcIndex, NPC_TEMP_AWARD_ID);
    local tBox = T_BOX[id]
    if not tBox then
    	print("_box_yin_loot_award error", player_index,npcIndex, id, tBox, nLootItemId)
    end
	local player_index_save = PlayerIndex
	--¸ø½±Àø
	PlayerIndex = player_index;
	--if gf_JudgeRoomWeight(SLT_NEED_ROOM, 100, "") ~= 1 then return end
	if nLootAwardId == 0 then
		local szAward = tBox[4] or ""
		nLootAwardId = CustomAwardSelectOne(szAward)
		--print("LootAwardId2", szAward, nLootAwardId)
		--print(nLootAwardId, szAward, CustomAwardSelectOne(szAward), CustomAwardSelectOne("YXTY_yin"),player_index, PlayerIndex)
	end
	if nLootAwardId > 0 then
		CustomAwardGiveOne(nLootAwardId);
		SetNpcTempData(npcIndex, NPC_TEMP_DAYE_IDX, 0)
		SetNpcTempData(npcIndex, NPC_TEMP_AWARD_ID, 0)
		_remove_boxes(npcIndex or 0)--É¾Ïä×Ó
	else
		print("get award fail", npcIndex, tBox[4], nLootAwardId)
	end

	PlayerIndex = player_index_save
end

function _on_open_box_jin(tBox, npcIndex)
	--¸ø½±Àø
	local tRequire = {}
	local tNeedView = tBox[7]
	for i = 1, 8 do
		tinsert(tRequire, {tNeedView[1],tNeedView[2],tNeedView[3], tNeedView[4]})
	end
	local box_id = GetNpcTempData(npcIndex, NPC_TEMP_BOX_ID)
	MA_Team_OpenUI(SZ_THIS_BOXES_SCRIPT, format("__on_open_box_jin_card_%d", box_id), tRequire)
	_remove_boxes(npcIndex or 0)--É¾Ïä×Ó
	vaf_award_api("tTYTJinBox_H");
end

function __on_open_box_jin_card_21(id)
	__on_open_box_jin_card(21,id)
end
function __on_open_box_jin_card_22(id)
	__on_open_box_jin_card(22,id)
end

function __on_open_box_jin_card(box_id,id)
	local tBox = T_BOX[box_id]
	local nRequireMap = tBox[8]
	local nMapId = GetWorldPos();
	--print(nRequireMap, nMapId,GetMapTemplate(nMapId))
	if nMapId<=65535 then --or nRequireMap~=GetMapTemplate(nMapId) then
		SendScript2Client('Open([[ma]])')	--¹Ø±Õ·­ÅÆ½çÃæ
		return 0;
	end
	
	if gf_Judge_Room_Weight(2, 20, "") ~= 1 then
		return 0;
	end
	
	local szAwardFree = tBox[4]
	local szAwardIB = tBox[5]
	local szRequireIB = tBox[6]
	local g, d, p, n;
	if id < 8 then
		local nAwardIndex = CustomAwardSelectOne(szAwardFree);
		if nAwardIndex > 0 then
			CustomAwardGiveOne(nAwardIndex);
			_,g,d,p,n = CustomAwardGetAwardInfo(nAwardIndex);
			MA_Team_SyncItem(id, g, d, p, n, GetName());
		end
	else
		if not szRequireIB or 1~=CustomAwardCheckAndConsumeGroup(szRequireIB,1) then
			return 0
		end
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2, 97, 236, 2})
		if 21==box_id or 22==box_id then
			AddRuntimeStat(18, 5, GetMissionV(2)-1, 2);
		end
--		local tItem = MA_GetRequire(id);
--		if DelItem(tItem[1], tItem[2], tItem[3], tItem[4]) ~= 1 then
--			Talk(1, "", "ÄúÉíÉÏµÄ"..SLT_OPEN_NEED[1].."²»¹»£¡");
--			return 0;
--		end		
		local nAwardIndex = CustomAwardSelectOne(szAwardIB)
		if nAwardIndex > 0 then
			CustomAwardGiveOne(nAwardIndex);
			_,g,d,p,n = CustomAwardGetAwardInfo(nAwardIndex)
			MA_Team_SyncItem(id, g, d, p, n, GetName())
		end
	end
end

