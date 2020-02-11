Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
--Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")
--Include("\\script\\misc\\data_state\\state.lua")
--Include("\\script\\online_activites\\award.lua")
Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

msg = "Chóc mõng $n më r­¬ng V¹n KiÕm Tròng nhËn ®­îc $i";

MV_WHO_IS_DAYE = 24
MV_LOOT_ID = 25
TSK_SCRORE = 0
TSK_SCRORE_ACC_CODE=0
LOG_TITLE="liangshan yin box"
NEED_ROOM=2
OPEN_BOX_NEED = {"Thiªn Kiªu LÖnh",2, 97, 236,1}

T_YinBoxScript={
	"\\settings\\static_script\\missions\\cangjianshanzhuang\\npc\\box_yin.lua",
	"\\settings\\static_script\\missions\\cangjianshanzhuang\\npc\\box_yin.lua",
	"\\settings\\static_script\\missions\\cangjianshanzhuang\\npc\\box_yin.lua",
	nil,
}

T_YIN_BOX_IDX = {}
function remove_yin_box()
	for i,v in T_YIN_BOX_IDX do
		if GetNpcName(i) == "R­¬ng B¹c" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_YIN_BOX_IDX = {}
end

function create_box_yin(m,x,y, nStage)
	if not T_YinBoxScript[nStage] then
		return
	end
	--local m, x, y = GetNpcWorldPos(nNpcIdx);
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("yinbaoxiang", "R­¬ng B¹c", m, x2, y2);
	if npc and npc > 0 then
		T_YIN_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_YinBoxScript[nStage]);
	else
		print("create ls yinbaoxiang fail")
	end
end

tAward = {
	randMulti = 1,
	subclauses = {
        {{"C©y B¸t Nh· nhá"    ,{2,0,504,1},nil,{7*24*3600}},8000},
        {{"C©y B¸t Nh·"    ,{2,0,398,1},nil,{7*24*3600}},8000},
        {{"C©y Tø Linh"    ,{2,1,30269,1},nil,{7*24*3600}},8000},
        {{"B¹ch C©u Hoµn"    ,{2,1,270,1},nil,{7*24*3600}},8000},
        {{"§¹i B¹ch C©u hoµn"    ,{2,1,1007,1},nil,{7*24*3600}},8000},
        {{"B¹ch C©u Tiªn ®¬n"    ,{2,1,1008,1},nil,{7*24*3600}},8000},
        {{"§¹i Nh©n s©m"    ,{2,0,553,1},nil,{7*24*3600}},5000},
        {{"Hu©n ch­¬ng anh hïng"    ,{2,1,30499,1,4}},20500},
        {{"Hu©n ch­¬ng anh hïng"    ,{2,1,30499,2,4}},5000},
        {{"Hu©n ch­¬ng anh hïng"    ,{2,1,30499,4,4}},1000},
        {{"Hu©n ch­¬ng anh hïng"    ,{2,1,30499,10,4}},1230},
        {{"L«i Hæ Tinh Ph¸ch"    ,{2,1,30614,1},msg},1200},
        {{"L«i Hæ Tinh Ph¸ch"    ,{2,1,30614,2},msg},700},
        {{"L«i Hæ Tinh Ph¸ch"    ,{2,1,30614,4},msg},280},
        {{"Giµy V¶i Th«"    ,{0,154,1,1}},4000},
        {{"Tinh TrÝ Bè Hµi"    ,{0,154,2,1}},4000},
        {{"Bè ChÕ Cao §ång Ngoa"    ,{0,154,3,1}},3060},
        {{"ChiÕn Hµi Kim ChÕ ngò hµnh"    ,{0,154,4,1}},1000},
        {{"ChiÕn Hµi Méc ChÕ ngò hµnh"    ,{0,154,5,1}},1000},
        {{"ChiÕn Hµi Thñy ChÕ ngò hµnh"    ,{0,154,6,1}},1000},
        {{"ChiÕn Hµi Háa ChÕ ngò hµnh"    ,{0,154,7,1}},1000},
        {{"ChiÕn Hµi Thæ ChÕ ngò hµnh"    ,{0,154,8,1}},1000},
        {{"ChiÕn Hµi ¢m ChÕ ngò hµnh"    ,{0,154,9,1}},1000},
        {{"Tr­êng Hµi Du HiÖp"    ,{0,154,26,1},msg},10},
        {{"ChiÕn Hµi ThiÕt HuyÕt"    ,{0,154,27,1},msg},10},
        {{"§¹o Hµi V©n Du"    ,{0,154,28,1},msg},10},
	},
	giveClause = ClauseRandom.giveClause,
	give = ClauseRandom.giveClause,
}

--needItem = {T_TIANJIAOLING[4], {T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED}};

tTemp = {};

function main()
	local npcIdx = GetTargetNpc();
	if GetMissionV(MV_WHO_IS_DAYE) == 0 then
		Say("Më [R­¬ng B¹c] cÇn 1 [Thiªn Kiªu LÖnh] (Ngù C¸c cã b¸n).",
			2,
			"\n x¸c nhËn më/#IamDaye("..npcIdx..")",
			"\n hñy më/nothing");
		return
	else
		speLoot(npcIdx);
	end
end

function IamDaye(npcIdx)
	local daye = GetMissionV(MV_WHO_IS_DAYE);

	if 0 ~= daye then
		Talk(1, "", "§· cã ng­êi më r­¬ng nµy råi");
		return 0;
	end

	if DelItem(OPEN_BOX_NEED[2],OPEN_BOX_NEED[3],OPEN_BOX_NEED[4],OPEN_BOX_NEED[5]) == 1 then
		SetMissionV(MV_WHO_IS_DAYE, PlayerIndex);
		--SetMissionV(MV_LAO_ER_2, PlayerIndex);
		if TSK_SCRORE and TSK_SCRORE > 0 then
			gf_ModifyTask(TSK_SCRORE, OPEN_BOX_NEED[5], TSK_SCRORE_ACC_CODE);
		end
		speLoot(npcIdx);
		_stat_when_ib_consume(OPEN_BOX_NEED[5])--IBÏûºÄÍ³¼Æ
		--2Xu»î¶¯
		vaf_award_api("tWjzYinBox")
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {OPEN_BOX_NEED[2],OPEN_BOX_NEED[3],OPEN_BOX_NEED[4],OPEN_BOX_NEED[5]})
	else
		Talk(1, "", "Trªn ng­êi kh«ng cã [Thiªn Kiªu LÖnh], kh«ng thÓ më <color=green>R­¬ng B¹c<color>. [Thiªn Kiªu LÖnh] cã thÓ mua trong <color=yellow>Ngù C¸c<color>");
	end
end

function getLootSeting()
	return tAward.subclauses;
end

function getLootItem()
	local tClause = getLootSeting();

	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i, tClause[i][1];
		end
	end
	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
	assert();
end

function speLoot(npcIdx)
	local daye = GetMissionV(MV_WHO_IS_DAYE);
	if daye == 0 then
		return 0;
	end
	local tSel = {
			"KÕt thóc ®èi tho¹i/nothing",
		}
	local OldPlayerIndex = PlayerIndex;
	if daye == PlayerIndex then
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= OldPlayerIndex then
				player_name = GetName();
				player_name = zgc_pub_name_replace(player_name,"/","-");
				player_name = zgc_pub_name_replace(player_name,"|","-");
				player_name = zgc_pub_name_replace(player_name,":","-");
				tinsert(tSel, 1, "Ta cÇn mang phÇn th­ëng ph©n cho "..player_name.."/#lootAwardOther("..PlayerIndex..","..npcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "Ta muèn nhËn phÇn th­ëng/#lootAward("..PlayerIndex..","..npcIdx..")");
	end


	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem();
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end

	local tClause = getLootSeting();
	local tLootItem = tClause[nLootItemId][1];
	local nCount = 1;
	if tLootItem[2] and type(tLootItem[2]) == "table" then
		nCount = tLootItem[2][4];
	end
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>B¶o r­¬ng<color>: ë ®©y cã"..msg, getn(tSel), tSel);
end

function lootAwardOther(player_index, box_index)
	local player_index_save = PlayerIndex
	--ÅÐ¶Ï¸ÃË÷ÒýÊÇ·ñ»¹ÊÇÔÚ¸Ã¶ÓÎéÖÐ
	local index_chg_chk_flag = 0
	local team_size = GetTeamSize()
	if team_size ~= 0 then
		index_chg_chk_flag = zgc_pub_same_team_chk(player_index)
	else
		index_chg_chk_flag = 1
	end
	if index_chg_chk_flag ~= 1 then
		Talk(1,"","<color=green>Chó ý<color>: Xin mêi h·y kiÓm tra l¹i nh÷ng ng­êi mµ b¹n ph©n chia cã ph¶i cã cïng <color=yellow>tæ ®éi<color> víi b¹n!")
		return
	end
	--·ÖÅä¶ÔÏóµÄ¿Õ¼ä¸ºÖØ¼ì²â
	PlayerIndex = player_index
	local s_palyer_name = GetName()
	if GetFreeItemRoom()  < NEED_ROOM then
		Talk(1,"","<color=green>Th«ng b¸o<color>: <color=yellow>Hµnh trang<color> c¸c h¹ kh«ng ®ñ!")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>Th«ng b¸o<color>: : <color=green>"..s_palyer_name.."<color><color=yellow>Hµnh trang<color> ®· ®Çy, kh«ng thÓ ph©n phèi!")
		return
	end

	PlayerIndex = player_index_save
	lootAward(player_index, box_index)
end

function lootAward(player_index, box_index)
	local player_index_save = PlayerIndex

	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(NEED_ROOM, 100, "") ~= 1 then return end
	PlayerIndex = player_index_save;

	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem();
	end
	local tLoot = getLootSeting()[nLootItemId][1];
	SetMissionV(MV_LOOT_ID, 0);
	SetMissionV(MV_WHO_IS_DAYE, 0);
	--SetMissionV(MV_LAO_ER_2, 0);

	SetNpcLifeTime(box_index, 0);
	PlayerIndex = player_index;
	gf_SetLogCaption(LOG_TITLE);
	Clause3.giveClause(tLoot);
	gf_SetLogCaption("");
	
	if tLoot[1] == "Thiªn Cang LÖnh" then
		_stat_when_ib_produce(tLoot[2][4])--IBµÀ¾ß²ú³öÍ³¼Æ
	end
	
--	--Í³¼ÆµÀ¾ß
--	if tLoot[1] == "ÌìÃÅ½ðÁî" then
--		AddRuntimeStat(1,14,0,tLoot[2][4]);
--	elseif tLoot[1] == "3¼¶Á¶Â¯Ìú" then
--		AddRuntimeStat(1,16,0,tLoot[2][4]);
--	elseif tLoot[1] == "3¼¶Ï´ÐÄÊ¯" then
--		AddRuntimeStat(1,17,0,tLoot[2][4]);
--	elseif tLoot[1] == "ÃØÒø×ê" then
--		AddRuntimeStat(1,18,0,tLoot[2][4]);
--	elseif tLoot[1] == "ÃØÒø´¸" then
--		AddRuntimeStat(1,19,0,tLoot[2][4]);
--	end
	
	PlayerIndex = player_index_save;
end
