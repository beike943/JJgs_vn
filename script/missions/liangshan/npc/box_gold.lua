Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_GOLD_BoxScript = {
	nil,
	nil,
	nil,
	"\\script\\missions\\liangshan\\npc\\box_gold4.lua",
	nil,
	nil,
	nil,
	"\\script\\missions\\liangshan\\npc\\box_gold8.lua",
}

T_GOLD_BOX_IDX = {}
function remove_gold_box()
	for i,v in T_GOLD_BOX_IDX do
		if GetNpcName(i) == "Kim R­¬ng" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_GOLD_BOX_IDX = {}
end

function create_box_gold(m,x,y, nStage)
	if not T_GOLD_BoxScript[nStage] then
		return
	end
	--local m, x, y = GetNpcWorldPos(nNpcIdx);
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("jinbaoxiang", "Kim R­¬ng", m, x2, y2);
	if npc and npc > 0 then
		T_GOLD_BOX_IDX[npc] = npc
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_GOLD_BoxScript[nStage]);
	else
		print("create jinbaoxiang fail")
	end
end

function box_gold_create_ib_card_require()
	local tRequire = {};
	for i = 1,8 do
		tinsert(tRequire,{2, 97, 236,1});
	end
	return tRequire;
end

function on_open_box_gold_card_stage4(nId)
	on_open_gold_box_card(4,nId)
end
function on_open_box_gold_card_stage8(nId)
	on_open_gold_box_card(8,nId)
end

function on_open_gold_box_card(nStage, nId)
	local m = GetWorldPos();
	if m < 65537 then
		SendScript2Client('Open([[ma]])');
		return 0;
	end
	local nRet = MissionAward_RandAward(nStage, nId, t_card_award, nil);
	
	if nRet == 1 then
		if nId < 8 then
		--_stat_when_open_free_card()
	else
		--_stat_when_open_ib_card()
		--_gold_box_stat_when_ib_consume(1)--IBÏûºÄÍ³¼Æ
  	end
	end
end

function on_open_box_gold(nStage)
	local szFunc = format("on_open_box_gold_card_stage%d", nStage)
	MA_Mission_OpenUI(MISSION_ID,0, T_GOLD_BoxScript[nStage], szFunc, box_gold_create_ib_card_require());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tLiangShanJinBox") --2XU»î¶¯
end

_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg, {nNeedRoom, nNeedWeight}}
        --{{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg, {nNeedRoom, nNeedWeight}}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
	},
	--------------------------------------------
	t_equip_group = --ÔÓÎï×é
	{
	},
};
_t_free_award_stage =
{
	[4] =
		{
			n_equip_group_rate = 0,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 0,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_other_group = --×°±¸×é
        	{
        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
                { {"C©y B¸t Nh· nhá", {2,0,504,1,4}, 7,nil, {1, 100}}, 600},
                { {"C©y B¸t Nh·", {2,0,398,1,4}, 7,nil, {1, 100}}, 600},
                { {"C©y Tø Linh", {2,1,30269,1,4}, 7,nil, {1, 100}}, 600},
                { {"TruyÒn C«ng §¬n", {2,1,30313,1,4}, 7,nil, {1, 100}}, 600},
                { {"Tu Ch©n YÕu QuyÕt", {2,0,554,1,4}, 7,nil, {1, 100}}, 600},
                { {"Thiªn Lý TruyÒn ¢m Phï ChØ", {2,1,3508,1,4}, nil,nil, {1, 100}}, 300},
                { {"Tø Linh Quy Nguyªn §¬n", {2,1,30352,1,4}, 7,nil, {1, 100}}, 500},
                { {"Båi Nguyªn §¬n", {2,1,30351,1,4}, 7,nil, {1, 100}}, 600},
                { {"B¨ng Tinh Th¹ch", {2,1,30554,1,4}, nil,nil, {1, 100}}, 500},
                { {"B¹ch C©u Hoµn", {2,1,270,1,4}, 7,nil, {1, 100}}, 500},
                { {"TÈy T©m Th¹ch Kho¸ng", {2,1,30536,1}, nil,nil, {1, 100}}, 300},
                { {"LuyÖn L« ThiÕt Kho¸ng", {2,1,30537,1}, nil,nil, {1, 100}}, 300},
                { {"§Æc s¶n L­¬ng S¬n", {2,1,30310,1,4}, nil,nil, {1, 100}}, 500},
                { {"ThiÕt Tinh cÊp 1", {2,1,30533,1,4}, nil,nil, {1, 100}}, 500},
                { {"ThiÕt Tinh cÊp 2", {2,1,30534,1,4}, nil,nil, {1, 100}}, 550},
                { {"ThiÕt Tinh cÊp 3", {2,1,30535,1,4}, nil,nil, {1, 100}}, 347},
                { {"Huy Ch­¬ng §ång ChÕ", {0,153,1,1}, nil,nil, {1, 100}}, 600},
                { {"Huy Ch­¬ng ThiÕt ChÕ", {0,153,2,1}, nil,nil, {1, 100}}, 600},
                { {"Huy Ch­¬ng Ngäc ChÕ", {0,153,3,1}, nil,nil, {1, 100}}, 600},
                { {"Huy Ch­¬ng Kim ChÕ ngò hµnh", {0,153,4,1}, nil,nil, {1, 100}}, 50},
                { {"Huy Ch­¬ng Méc ChÕ ngò hµnh", {0,153,5,1}, nil,nil, {1, 100}}, 50},
                { {"Huy Ch­¬ng Thñy ChÕ ngò hµnh", {0,153,6,1}, nil,nil, {1, 100}}, 50},
                { {"Huy Ch­¬ng Háa ChÕ ngò hµnh", {0,153,7,1}, nil,nil, {1, 100}}, 50},
                { {"Huy Ch­¬ng Thæ ChÕ ngò hµnh", {0,153,8,1}, nil,nil, {1, 100}}, 50},
                { {"Huy Ch­¬ng ¢m ChÕ ngò hµnh", {0,153,9,1}, nil,nil, {1, 100}}, 50},
                { {"Huy Ch­¬ng Du HiÖp", {0,153,26,1}, nil,1, {1, 100}}, 1},
                { {"Huy Ch­¬ng ThiÕt HuyÕt", {0,153,27,1}, nil,1, {1, 100}}, 1},
                { {"Huy Ch­¬ng V©n Du", {0,153,28,1}, nil,1, {1, 100}}, 1},
        	},
		},
	[8] =
		{
			n_equip_group_rate = 0,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
			n_daibi_group_rate = 0,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
        	t_other_group = --×°±¸×é
        	{
                { {"C©y B¸t Nh· nhá", {2,0,504,1,4}, 7,nil, {1, 100}}, 600},
                { {"C©y B¸t Nh·", {2,0,398,1,4}, 7,nil, {1, 100}}, 600},
                { {"C©y Tø Linh", {2,1,30269,1,4}, 7,nil, {1, 100}}, 600},
                { {"TruyÒn C«ng §¬n", {2,1,30313,1,4}, 7,nil, {1, 100}}, 600},
                { {"Tu Ch©n YÕu QuyÕt", {2,0,554,1,4}, 7,nil, {1, 100}}, 600},
                { {"Thiªn Lý TruyÒn ¢m Phï ChØ", {2,1,3508,1,4}, nil,nil, {1, 100}}, 300},
                { {"Tø Linh Quy Nguyªn §¬n", {2,1,30352,1,4}, 7,nil, {1, 100}}, 500},
                { {"Båi Nguyªn §¬n", {2,1,30351,1,4}, 7,nil, {1, 100}}, 600},
                { {"B¨ng Tinh Th¹ch", {2,1,30554,1,4}, nil,nil, {1, 100}}, 500},
                { {"B¹ch C©u Hoµn", {2,1,270,1,4}, 7,nil, {1, 100}}, 500},
                { {"TÈy T©m Th¹ch Kho¸ng", {2,1,30536,1,4}, nil,nil, {1, 100}}, 300},
                { {"LuyÖn L« ThiÕt Kho¸ng", {2,1,30537,1}, nil,nil, {1, 100}}, 300},
                { {"§Æc s¶n L­¬ng S¬n", {2,1,30310,1}, nil,nil, {1, 100}}, 500},
                { {"ThiÕt Tinh cÊp 1", {2,1,30533,1,4}, nil,nil, {1, 100}}, 500},
                { {"ThiÕt Tinh cÊp 2", {2,1,30534,1,4}, nil,nil, {1, 100}}, 1000},
                { {"ThiÕt Tinh cÊp 3", {2,1,30535,1,4}, nil,nil, {1, 100}}, 347},
                { {"Huy Ch­¬ng §ång ChÕ", {0,153,1,1}, nil,nil, {1, 100}}, 500},
                { {"Huy Ch­¬ng ThiÕt ChÕ", {0,153,2,1}, nil,nil, {1, 100}}, 500},
                { {"Huy Ch­¬ng Ngäc ChÕ", {0,153,3,1}, nil,nil, {1, 100}}, 500},
                { {"Huy Ch­¬ng Kim ChÕ ngò hµnh", {0,153,4,1}, nil,nil, {1, 100}}, 25},
                { {"Huy Ch­¬ng Méc ChÕ ngò hµnh", {0,153,5,1}, nil,nil, {1, 100}}, 25},
                { {"Huy Ch­¬ng Thñy ChÕ ngò hµnh", {0,153,6,1}, nil,nil, {1, 100}}, 25},
                { {"Huy Ch­¬ng Háa ChÕ ngò hµnh", {0,153,7,1}, nil,nil, {1, 100}}, 25},
                { {"Huy Ch­¬ng Thæ ChÕ ngò hµnh", {0,153,8,1}, nil,nil, {1, 100}}, 25},
                { {"Huy Ch­¬ng ¢m ChÕ ngò hµnh", {0,153,9,1}, nil,nil, {1, 100}}, 25},
                { {"Huy Ch­¬ng Du HiÖp", {0,153,26,1}, nil,1, {1, 100}}, 1},
                { {"Huy Ch­¬ng ThiÕt HuyÕt", {0,153,27,1}, nil,1, {1, 100}}, 1},
                { {"Huy Ch­¬ng V©n Du", {0,153,28,1}, nil,1, {1, 100}}, 1},
        	},
		},
}

_t_fix_award_stage =
{
}

function _gold_box_stat_when_ib_consume(nConsume)
	--SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + nConsume, TASK_ACCESS_CODE_DXG_MISSION);
	gf_ModifyTask(VET_MS_TASKID_JUYILING, nConsume);
	_stat_when_ib_consume(nConsume)
	--AddRunTimeStat(3,10,0,nConsume)
end

_t_ib_award_no_stage4 =
{
	t_cost = --ÏûºÄ
	{
		--{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}},
		{"Thiªn Kiªu LÖnh",{2, 97, 236,1},_gold_box_stat_when_ib_consume},
		
	},
	t_ib_award =--ib½±Àø
	{
                { {"C©y B¸t Nh· nhá", {2,0,504,1}, 7,nil, {1, 100}}, 600},
                { {"C©y B¸t Nh·", {2,0,398,1}, 7,nil, {1, 100}}, 600},
                { {"C©y Tø Linh", {2,1,30269,1}, 7,nil, {1, 100}}, 600},
                { {"B¹ch C©u Hoµn", {2,1,270,1}, 7,nil, {1, 100}}, 600},
                { {"§¹i B¹ch C©u hoµn", {2,1,1007,1}, 7,nil, {1, 100}}, 800},
                { {"B¹ch C©u Tiªn ®¬n", {2,1,1008,1}, 7,nil, {1, 100}}, 600},
                { {"§¹i Nh©n s©m", {2,0,553,1}, 7,nil, {1, 100}}, 500},
                { {"Hu©n ch­¬ng anh hïng", {2,1,30499,1,4}, nil,nil, {1, 100}}, 1500},
                { {"Hu©n ch­¬ng anh hïng", {2,1,30499,2,4}, nil,nil, {1, 100}}, 600},
                { {"Hu©n ch­¬ng anh hïng", {2,1,30499,4,4}, nil,nil, {1, 100}}, 200},
                { {"Hu©n ch­¬ng anh hïng", {2,1,30499,10,4}, nil,nil, {1, 100}}, 50},
                { {"M¶nh Thiªn Cang", {2,1,30390,10}, nil,nil, {1, 100}}, 1200},
                { {"M¶nh Thiªn Cang", {2,1,30390,20}, nil,nil, {1, 100}}, 391},
                { {"M¶nh Thiªn Cang", {2,1,30390,100}, nil,nil, {1, 100}}, 40},
                { {"Thiªn Cang LÖnh", {2,95,204,1}, nil,1, {1, 100}}, 10},
                { {"Huy Ch­¬ng §ång ChÕ", {0,153,1,1}, nil,nil, {1, 100}}, 400},
                { {"Huy Ch­¬ng ThiÕt ChÕ", {0,153,2,1}, nil,nil, {1, 100}}, 400},
                { {"Huy Ch­¬ng Ngäc ChÕ", {0,153,3,1}, nil,nil, {1, 100}}, 306},
                { {"Huy Ch­¬ng Kim ChÕ ngò hµnh", {0,153,4,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng Méc ChÕ ngò hµnh", {0,153,5,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng Thñy ChÕ ngò hµnh", {0,153,6,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng Háa ChÕ ngò hµnh", {0,153,7,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng Thæ ChÕ ngò hµnh", {0,153,8,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng ¢m ChÕ ngò hµnh", {0,153,9,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng Du HiÖp", {0,153,26,1}, nil,1, {1, 100}}, 1},
                { {"Huy Ch­¬ng ThiÕt HuyÕt", {0,153,27,1}, nil,1, {1, 100}}, 1},
                { {"Huy Ch­¬ng V©n Du", {0,153,28,1}, nil,1, {1, 100}}, 1},
	},
}

_t_ib_award_no_stage8 =
{
	t_cost = --ÏûºÄ
	{
		--{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}},
		{"Thiªn Kiªu LÖnh",{2, 97, 236,1},_gold_box_stat_when_ib_consume},
		
	},
	t_ib_award =--ib½±Àø
	{
                { {"C©y B¸t Nh· nhá", {2,0,504,1}, 7,nil, {1, 100}}, 600},
                { {"C©y B¸t Nh·", {2,0,398,1}, 7,nil, {1, 100}}, 600},
                { {"C©y Tø Linh", {2,1,30269,1}, 7,nil, {1, 100}}, 600},
                { {"B¹ch C©u Hoµn", {2,1,270,1}, 7,nil, {1, 100}}, 600},
                { {"§¹i B¹ch C©u hoµn", {2,1,1007,1}, 7,nil, {1, 100}}, 800},
                { {"B¹ch C©u Tiªn ®¬n", {2,1,1008,1}, 7,nil, {1, 100}}, 600},
                { {"§¹i Nh©n s©m", {2,0,553,1}, 7,nil, {1, 100}}, 500},
                { {"Hu©n ch­¬ng anh hïng", {2,1,30499,1,4}, nil,nil, {1, 100}}, 1500},
                { {"Hu©n ch­¬ng anh hïng", {2,1,30499,2,4}, nil,nil, {1, 100}}, 600},
                { {"Hu©n ch­¬ng anh hïng", {2,1,30499,4,4}, nil,nil, {1, 100}}, 200},
                { {"Hu©n ch­¬ng anh hïng", {2,1,30499,10,4}, nil,nil, {1, 100}}, 50},
                { {"M¶nh Thiªn Cang", {2,1,30390,10}, nil,nil, {1, 100}}, 1200},
                { {"M¶nh Thiªn Cang", {2,1,30390,20}, nil,nil, {1, 100}}, 391},
                { {"M¶nh Thiªn Cang", {2,1,30390,100}, nil,nil, {1, 100}}, 40},
                { {"Thiªn Cang LÖnh", {2,95,204,1}, nil,1, {1, 100}}, 10},
                { {"Huy Ch­¬ng §ång ChÕ", {0,153,1,1}, nil,nil, {1, 100}}, 400},
                { {"Huy Ch­¬ng ThiÕt ChÕ", {0,153,2,1}, nil,nil, {1, 100}}, 400},
                { {"Huy Ch­¬ng Ngäc ChÕ", {0,153,3,1}, nil,nil, {1, 100}}, 306},
                { {"Huy Ch­¬ng Kim ChÕ ngò hµnh", {0,153,4,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng Méc ChÕ ngò hµnh", {0,153,5,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng Thñy ChÕ ngò hµnh", {0,153,6,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng Háa ChÕ ngò hµnh", {0,153,7,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng Thæ ChÕ ngò hµnh", {0,153,8,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng ¢m ChÕ ngò hµnh", {0,153,9,1}, nil,nil, {1, 100}}, 100},
                { {"Huy Ch­¬ng Du HiÖp", {0,153,26,1}, nil,1, {1, 100}}, 1},
                { {"Huy Ch­¬ng ThiÕt HuyÕt", {0,153,27,1}, nil,1, {1, 100}}, 1},
                { {"Huy Ch­¬ng V©n Du", {0,153,28,1}, nil,1, {1, 100}}, 1},
	},
}

t_card_award = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "Khu lËt thÎ miÔn phÝ L­¬ng S¬n QuÇn Anh Héi",
		--¼¸´ÎÃ»ÓÐµÃµ½×°±¸Ê±±Ø³ö×°±¸
		t_equip_round = {},
		n_max_daibi_perday = 30,--Ò»Ìì×î¶à»ñµÃ¶àÉÙ´ú±Ò
		t_stage =
		{
			[4] = inherit(_t_free_award_no_stage, _t_free_award_stage[4]),
			[8] = inherit(_t_free_award_no_stage, _t_free_award_stage[8]),
		},
	},
	
	t_fix_award = 
	{
		sz_award_title = "PhÇn th­ëng cè ®Þnh ¶i L­¬ng S¬n QuÇn Anh Héi",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "Khu lËt thÎ thu phÝ L­¬ng S¬n QuÇn Anh Héi",
		t_stage = 
		{
			[4] = _t_ib_award_no_stage4,
			[8] = _t_ib_award_no_stage8,
		},
	},
}

_t_free_award_no_stage = nil
_t_free_award_stage = nil
_t_fix_award_stage = nil
_t_ib_award_no_stage1 = nil
_t_ib_award_no_stage2 = nil
