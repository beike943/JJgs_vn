Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	nItem = tonumber(nItem);
	local nTime = tonumber(date("%Y%m%d"));
	
	if nTime < CC_UPGRADE_DATE then
		Talk(1, "", "§¹i hiÖp t¹m thêi ng­¬i kh«ng thÓ më lÔ bao nµy, lÔ bao n©ng cÊp nµy chØ cã thÓ më sau khi <color=red> m«n ph¸i míi ®· s¸ng lËp <color> míi ®­îc.");
		return 0;
	end
	
	if 1 ~= gf_CheckPlayerRoute() then
		Talk(1, "", "ChØ cã nh÷ng ng­êi ch¬i gia nhËp l­u ph¸i míi cã thÓ më!");
		return 0;
	end
	
	if GetLevel() < CC_LEVEL_LIMIT then
		Talk(1,"",format("ChØ cã nh÷ng ng­êi ch¬i cã ®¼ng cÊp ®¹t ®Õn %d míi më ®­îc", CC_LEVEL_LIMIT));
		return 0;
	end
	
	local strTab = {
		format("Ta muèn më lÔ bao n©ng cÊp/#OnUse_1(%d)", nItem),
		"§Ó ta suy nghÜ/nothing",
	};
	Say("<color=green> LÔ Bao N©ng CÊp: <color> x¸c nhËn më LÔ Bao N©ng CÊp nµy kh«ng?", getn(strTab), strTab);
end

function OnUse_1(nItem)
	local tSay = {
		"Ta muèn ®æi trang bÞ míi ( tiªu hao 2 LÔ Bao N©ng CÊp)/exchange_new_equip",
	}
	local  nRoute = GetPlayerRoute();
	if nRoute == 23 or nRoute == 29 or nRoute == 30 then
		tinsert(tSay, getn(tSay), format("Ta muèn ®æi vò khÝ bé s­ m«n thø 4 ( tiªu hao %d LÔ Bao N©ng CÊp)/#exchange_shimen_equip(%d,%d)",2,1,2));
		tinsert(tSay, getn(tSay), format("Ta muèn ®æi ®Çu kh«i bé s­ m«n thø 4 ( tiªu hao %d LÔ Bao N©ng CÊp)/#exchange_shimen_equip(%d,%d)",1,2,1));
		tinsert(tSay, getn(tSay), format("Ta muèn ®æi y phôc bé s­ m«n thø 4 ( tiªu hao %d LÔ Bao N©ng CÊp)/#exchange_shimen_equip(%d,%d)",1,3,1));
		tinsert(tSay, getn(tSay), format("Ta muèn ®æi quÇn bé s­ m«n thø 4 ( tiªu hao %d LÔ Bao N©ng CÊp)/#exchange_shimen_equip(%d,%d)",1,4,1));
		tinsert(tSay, getn(tSay), format("Ta muèn ®æi ngäc béi bé s­ m«n thø 4 ( tiªu hao %d LÔ Bao N©ng CÊp)/#exchange_shimen_equip(%d,%d)",1,5,1));
		tinsert(tSay, getn(tSay), format("Ta muèn ®æi nhÉn bé s­ m«n thø 4 ( tiªu hao %d LÔ Bao N©ng CÊp)/#exchange_shimen_equip(%d,%d)",1,6,1));
	end
	Say("§¹i hiÖp ng­¬i muèn ®æi trang bÞ nh­ thÕ nµo? <color=red> ( ®æi trang bÞ s­ m«n hÖ thèng tù ®éng t¨ng ®iÓm danh väng lªn ®Õn 12000 ®iÓm) <color>",getn(tSay), tSay);
end

function exchange_new_equip()
	local tAward = {
		{1, 60, "Giµy V¶i Th«", {0, 154, 1, 1}, 0},
		{1, 30, "Tinh TrÝ Bè Hµi", {0, 154, 2, 1}, 0},
		{1, 10, "Bè ChÕ Cao §ång Ngoa", {0, 154, 3, 1}, 0},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	if GetItemCount(2, 1, 30541) < 2 then
		Talk(1,"",format("CÇn cã %d LÔ Bao N©ng CÊp Phiªn B¶n Míi míi cã thÓ ®æi trang bÞ nµy", 2));
		return 0;
	end
	if DelItem(2, 1, 30541, 2) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, CC_LOG_TITLE, "LÔ Bao N©ng CÊp Phiªn B¶n Míi ®æi trang bÞ míi");
	end
end

function exchange_shimen_equip(nKind, nCost)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	if nRoute ~= 23 and nRoute ~= 29 and nRoute ~= 30 then
		return 0;
	end
	local tAwardTable = CC_SHIMEN_EQUIP[nRoute];
	if not tAwardTable then return 0; end
	local nBody = GetBody();
	local tAwardTableSub = tAwardTable[nBody];
	if not tAwardTableSub then return 0; end
	local tAwardList = tAwardTableSub[nKind];
	if not tAwardList then return 0; end
	if GetItemCount(2, 1, 30541) < tonumber(nCost) then
		Talk(1,"",format("CÇn cã %d LÔ Bao N©ng CÊp Phiªn B¶n Míi míi cã thÓ ®æi trang bÞ nµy", tonumber(nCost)));
		return 0;
	end
	if DelItem(2, 1, 30541, tonumber(nCost)) == 1 then
		--¸øÊ¦ÃÅ×°±¸
		gf_AddItemEx2({tAwardList[2][1], tAwardList[2][2], tAwardList[2][3], 1, 1, -1, -1, -1, -1, -1, -1, 0}, tAwardList[1], CC_LOG_TITLE, "LÔ Bao N©ng CÊp Phiªn B¶n Míi ®æi trang bÞ s­ m«n", 0, 1);
		--Msg2Player(format("Äã»ñµÃÊ¦ÃÅ4Ì××°±¸[%s]", tAwardList[1]));
		--¸øÊ¦ÃÅ¹±Ï×¶È
		local nCurrentRepu = GetTask(336);
		if nCurrentRepu < CC_TMGL_UPGRADE_POP then
			SetTask(336, CC_TMGL_UPGRADE_POP);
			Msg2Player(format("Ng­¬i nhËn ®­îc %d ®iÓm danh väng, ®iÓm danh väng hiÖn t¹i lµ %d.", CC_TMGL_UPGRADE_POP - nCurrentRepu, CC_TMGL_UPGRADE_POP));
		end
	end
end


