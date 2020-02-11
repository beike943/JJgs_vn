Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

SF_FILE = "\\script\\missions\\liangshan\\npc\\box.lua"
--ÁºÉ½±¦Ïä½±Àø
tClause4 = {
	{{"TiÓu B¹ch C©u hoµn"          	,{2,1,30307,1}},       5.00*100 ,7},
	{{"TiÓu Tam Thanh Hoµn"          	,{2,1,30308,1}},       5.00*100 ,7},
	{{"TiÓu Lôc ThÇn Hoµn"          	,{2,1,30309,1}},       5.00*100 ,7},
	{{"TruyÒn C«ng §¬n"         	 	,{2,1,30313,1}},       5.00*100 ,7},
	{{"Tói mËt tŞch s­ m«n cao cÊp"      ,{2,1,30627,1}},        2.80*100 ,7},
--	{{"½ğ¸Õ°ãÈô¾­"          ,{0,107,166,1}},      	0.16*100 },
--	{{"Ç±Áú¼ÅÃğ¾­"          ,{0,107,167,1}},      	0.16*100 },
--	{{"ÎŞ³¾ÆĞÌá¾­"          ,{0,107,168,1}},      	0.16*100 },
--	{{"ÌìÂŞÁ¬ÖéÂ¼"          ,{0,107,169,1}},      	0.16*100 },
--	{{"ÈçÒâ½ğ¶¥ÃØ¼®"        ,{0,107,170,1}},      	0.16*100 },
--	{{"±Ìº£¾øÒôÆ×"          ,{0,107,171,1}},      	0.16*100 },
--	{{"»ìãçÕòÔÀÃØ¼®"        ,{0,107,172,1}},      	0.16*100 },
--	{{"ŞñÌìÓÎÁúÃØ¼®"        ,{0,107,173,1}},      	0.16*100 },
--	{{"»ÃÓ°ÃÔ×ÙÃØ¼®"        ,{0,107,174,1}},      	0.16*100 },
--	{{"¾ı×Ó½Ø·çÃØ¼®"        ,{0,107,175,1}},      	0.16*100 },
--	{{"Õò¾ü·ÉÁúÇ¹Æ×"        ,{0,107,176,1}},      	0.16*100 },
--	{{"´©ÔÆÂäºçÃØ¼®"        ,{0,107,177,1}},      	0.16*100 },
--	{{"ÓÄÚ¤·âÄ§Â¼"          ,{0,107,178,1}},      	0.16*100 },
--	{{"Áé¹Æ»ÃĞ°Â¼"          ,{0,107,179,1}},      	0.16*100 },
--	{{"¾ÅÌì·çÀ×¾÷"        ,{0,107,198,1}},      	0.16*100 },
--	{{"ºì³¾×íÃÎÆ×"          ,{0,107,202,1}},      	0.16*100 },
--	{{"·ç»¨Ç§Ò¶Æ×"          ,{0,107,203,1}},      	0.16*100 },
	--{{"ÎåĞĞĞşÊ¯"         	,{2,1,30302,2}},  	 	10.00*100 },
	--{{"ÎåĞĞ±¦Ïä"         	,{2,1,30320,1}},   	3.00*100 },
	{{"Tiªu KiÕp t¸n"         		,{2,0,141,1}},   		3.00*100 ,30},
	{{"b¸nh İt B¸c B¶o"         	,{2,1,1125,1}},   		5.00*100 },
	{{"§Æc s¶n L­¬ng S¬n"         	,{2,1,30310,1}},   	14.20*100 },
	{{"Båi Nguyªn §¬n"         		,{2,1,30351,1}},   	10.00*100},
	
	{{"Thiªn HuyÔn Kh¾c B¶n cÊp 1 "       	,{2,1,30406,1}},    	0.50*100 ,30},
	{{"Ma §ao Th¹ch cÊp 1"       	,{2,1,30428,1}},    	0.50*100 ,7},
	
	{{"Hu©n ch­¬ng dòng sÜ"       	,{2,1,30498,1}},    	10*100},
	{{"ThiÕt Tinh cÊp 1"       	,{2,1,30533,1}},    	10*100},
	{{"ThiÕt Tinh cÊp 2"       	,{2,1,30534,1}},    	5*100},
	{{"Thiªn Lı TruyÒn ¢m Phï ChØ"       	,{2,1,3508,1}},    	10*100},
	{{"TÈy TrÇn §an"       	,{2,1,30613,1}},    	4*100},
	{{"Tø Linh Quy Nguyªn §¬n"       	,{2,1,30352,1}},    5.00*100},
}
tClause5 = {
	{{"Vâ l©m b¸o míi"         	,{2,1,30314,1}},       20.00*100,7},
	{{"Th¸nh VËt S­ M«n"         	,{2,1,30311,1}},      	20.00*100,7},
	{{"TiÓu truyÒn c«ng ®¬n"          	,{2,1,30312,1}},      	18.00*100,7},
	{{"M¶nh Tu Ch©n YÕu QuyÕt"        ,{2,1,30315,1}},      	10.00*100,7},
--	{{"½ğ¸Õ·üÄ§¾­"			,{0,107,1,1}},			0.10*100},
--	{{"½ğ¸Õ·üÄ§ĞÄ·¨"		,{0,107,2,1}},			0.10*100},
--	{{"Ç±ÁúÃØ¼®"			,{0,107,3,1}},			0.10*100},
--	{{"Ç±ÁúĞÄ·¨"			,{0,107,4,1}},			0.10*100},
--	{{"ÎŞ³¾ÃØ¼®"			,{0,107,5,1}},			0.10*100},
--	{{"ÎŞ³¾ĞÄ·¨"			,{0,107,6,1}},			0.10*100},
--	{{"ÌìÂŞÃØ¼®"			,{0,107,7,1}},			0.10*100},
--	{{"ÌìÂŞĞÄ·¨"			,{0,107,8,1}},			0.10*100},
--	{{"ÈçÒâÃØ¼®"			,{0,107,9,1}},			0.10*100},
--	{{"ÈçÒâĞÄ·¨"			,{0,107,10,1}},			0.10*100},
--	{{"±Ìº£Æ×"				,{0,107,11,1}},			0.10*100},
--	{{"±Ìº£ĞÄ·¨"			,{0,107,12,1}},			0.10*100},
--	{{"»ìãçÃØ¼®"			,{0,107,13,1}},			0.10*100},
--	{{"»ìãçĞÄ·¨"			,{0,107,14,1}},			0.10*100},
--	{{"ŞñÌìÃØ¼®"			,{0,107,15,1}},			0.10*100},
--	{{"ŞñÌìĞÄ·¨"			,{0,107,16,1}},			0.10*100},
--	{{"»ÃÓ°ÃØ¼®"			,{0,107,17,1}},			0.10*100},
--	{{"»ÃÓ°ĞÄ·¨"			,{0,107,18,1}},			0.10*100},
--	{{"¾ı×ÓÃØ¼®"			,{0,107,19,1}},			0.10*100},
--	{{"¾ı×ÓĞÄ·¨"			,{0,107,20,1}},			0.10*100},
--	{{"Õò¾üÃØ¼®"			,{0,107,21,1}},			0.10*100},
--	{{"Õò¾üĞÄ·¨"			,{0,107,22,1}},			0.10*100},
--	{{"´©ÔÆÃØ¼®"			,{0,107,23,1}},			0.10*100},
--	{{"´©ÔÆĞÄ·¨"			,{0,107,24,1}},			0.10*100},
--	{{"ÓÄÚ¤¹íÂ¼"			,{0,107,25,1}},			0.10*100},
--	{{"ÓÄÚ¤ĞÄ·¨"			,{0,107,26,1}},			0.10*100},
--	{{"Áé¹ÆÃØ¼®"			,{0,107,27,1}},			0.10*100},
--	{{"Áé¹ÆĞÄ·¨"			,{0,107,28,1}},			0.10*100},
--	{{"¾ª·çÃØ¼®"			,{0,107,180,1}},			0.10*100},
--	{{"¾ª·çĞÄ·¨"			,{0,107,181,1}},			0.10*100},
--	{{"×íÃÎÃØ¼®"			,{0,107,188,1}},			0.10*100},
--	{{"×íÃÎĞÄ·¨"			,{0,107,189,1}},			0.10*100},
--	{{"·±»¨ÃØ¼®"			,{0,107,190,1}},			0.10*100},
--	{{"·±»¨ĞÄ·¨"			,{0,107,191,1}},			0.10*100},
--	{{"ÎåĞĞĞşÊ¯"         	,{2,1,30302,1}},          9.00*100},
--	{{"ÎåĞĞ±¦Ïä"         	,{2,1,30320,1}},   	0.70*100},
--	{{"ÅàÔªµ¤"         		,{2,1,30351,1}},   	2.50*100, 2},
	
	{{"Hu©n ch­¬ng dòng sÜ"       	,{2,1,30498,1}},    	4.80*100},
	{{"ThiÕt Tinh cÊp 1"       	,{2,1,30533,1}},    	9*100},
	{{"ThiÕt Tinh cÊp 2"       	,{2,1,30534,1}},    	0.70*100},
	{{"TÈy TrÇn §an"       	,{2,1,30613,1}},    	5*100},
	{{"Thiªn Lı TruyÒn ¢m Phï ChØ"       	,{2,1,3508,1}},    	8*100},
	{{"Tø Linh Quy Nguyªn §¬n"       	,{2,1,30352,1}},    2.00*100},
	{{"Båi Nguyªn §¬n"         		,{2,1,30351,1}},		2.50*100},
}
function getLootSeting(bossLv, bIB)
	if bossLv == 5 then
		tClause = tClause5;
	elseif bossLv == 4 then
		tClause	= tClause4;
	end
	local t = {nil, nil, nil, tClause4,tClause5}
	tClause = t[bossLv];

	if not tClause then
		print(format("[getLootSeting] [error bossLv] [bossLv=%s]", tostring(bossLv)));
		assert()
	end
	return tClause;
end

function getLootItem(bossLv, bIB)
	local tClause = getLootSeting(bossLv, bIB);

	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i,tClause[i][1],tClause[i][3];
		end
	end
	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
	assert();
end

function main()
	local nNpcIdx = GetTargetNpc();
    local nStage = GetMissionV(MV_STAGE_LEVEL);
    local bossId = GetUnitCurStates(nNpcIdx, 5)
    if bossId == 0 then
    	bossId = GetMissionV(MV_CUR_BOSS_ID);
    end
	local bossLv = tMission:getBossLv(bossId);

	normalLoot(nNpcIdx, bossLv);
end

function normalLoot(nNpcIdx, bossLv)
	local dwId = GetUnitCurStates(nNpcIdx, 3)
	if dwId == 0 then
		local nRet = ApplyItemDice(1, 100, 30, SF_FILE, "GD_Time_Over", GetTeamSize())
		dwId = nRet;
		local _, tLootItem,nExpireDay = getLootItem(bossLv);
		WriteLog(format("[liangshan:box] [CreateItem:%s]", tLootItem[1]));
		local nItemIndex = AddDiceItemInfo(dwId, gf_UnPack(tLootItem[2]))
		if nExpireDay then
			SetItemExpireTime(nItemIndex,nExpireDay*DAY_SECOND_NUM)
		end
		AddUnitStates(nNpcIdx, 3, dwId);
		local nPlayerOld = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if IsPlayerDeath() == 0 then
				RollItem(dwId)
				--Observer:onEvent(OE_LIANGSHAN_BOX);
			end
		end
		PlayerIndex = nPlayerOld
		return
	end

	local nState = GetItemDiceState(dwId)
	if nState == 0 then
		Msg2Player(LSMsgToPlayer[2])
	elseif nState == 1 then
		local n, szItem = DiceLootItem(dwId)
		if n == 0 then
			local szMsg = GetName()..LSMsgToPlayer[4]..szItem
			MU_Msg2Team(szMsg)
		elseif n == 1 then
			Msg2Player(LSMsgToPlayer[3])
		end
	elseif nState == 2 then
		Msg2Player(LSMsgToPlayer[5])
	end
end

function GD_Time_Over(dwId)
	local t, nSize, szItem = GetItemDiceRollInfo(dwId)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1]..format(LSMsgToPlayer[8],value[2])
		if value[3] == 0 then
			str = value[1]..LSMsgToPlayer[9]
		elseif value[3] == 1 then
			str = str.."("..LSMsgToPlayer[10]..")"
			if value[4] == 1 then
				str = str.." -- "..LSMsgToPlayer[11]..szItem
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.."("..LSMsgToPlayer[12]..")"
			if value[4] == 1 then
				str = str.." -- "..LSMsgToPlayer[11]..szItem
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player(LSMsgToPlayer[6])
	elseif nSize ~= getn(t) then
		Msg2Player(LSMsgToPlayer[7])
	end
end
