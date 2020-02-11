Include("\\script\\missions\\tong_melee\\tm_head.lua")

function OnUse(nItem)
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local	tMapName = {
		[100] = "TuyÒn Ch©u",
		[150] = "D­¬ng Ch©u",
		[200] = "BiÖn Kinh",
		[300] = "Thµnh §«",
		[350] = "T­¬ng D­¬ng",
		[400] = "§¹i Lý",
		[500] = "Phông T­êng",
	}
	local nMapId, nX, nY = GetWorldPos();
	if gf_MapIsAllow({100,150,200,300,350,400,500}, nMapId) ~= 1 then
		Talk(1,"","ChØ cã thÓ sö dông ë 7 thµnh thÞ lín!");
		return 0;
	end
	if IsTongMember() <= 0 then
		Talk(1,"","Ng­¬i kh«ng ph¶i thµnh viªn cña bang héi!");
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local sTongName = GetTongName();
	local npcIndex = CreateNpc("QxTiexueqi", sTongName, nMapId, nX, nY);
	if npcIndex > 0 then
		SetNpcScript(npcIndex, "\\script\\missions\\tong_melee\\item\\siling_gaoji_tong_flag.lua");
		SetNpcLifeTime(npcIndex, 2*60*60);
		local msg = format("%s ®· ®­îc %s thµnh lËp %s, c¸c ®¹i hiÖp cã thÓ ®Õn nhËn th­ëng!",GetName(), tMapName[nMapId], "ChiÕn kú tø linh bang héi cao cÊp");
		Msg2Global(msg);
		AddLocalCountNews(msg, 2);
		Msg2Tong(msg);
	end
end

function main()
	local tSay = {};
	local sTongName = GetNpcName(GetTargetNpc());
	local msg = "<color=green> ChiÕn kú tø linh bang héi cao cÊp :<color>"..format("Bang héi <color=yellow>[%s]<color> trong lóc bang héi lo¹n chiÕn nhËn ®­îc thµnh tÝch v­ît tréi, c¸c thµnh viªn bang héi ®Òu cã thÓ ®èi tho¹i víi ta ®Ó nhËn phÇn th­ëng v­ît møc!", sTongName);
	if GetTongName() ~= sTongName then
		tinsert(tSay, "Ng­¬i kh«ng thuéc thµnh viªn bang héi nµy/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
	if gf_GetTaskByte(TM_TASKID_YINJUAN, 4) ~= 0 then
		tinsert(tSay, "Ng­¬i ®· nhËn th­ëng råi/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
	if GetTime() - GetJoinTongTime() < 24 * 3600 then
		tinsert(tSay, "Ng­¬i gia nhËp bang héi ch­a ®ñ 24 tiÕng/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
	if GetTongName() == sTongName then
		tinsert(tSay, "NhËn th­ëng ngay/get_award_now");
		tinsert(tSay, "§Ó ta suy nghÜ/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
end

function get_award_now()
	if gf_GetTaskByte(TM_TASKID_YINJUAN, 4) ~= 0 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	gf_SetTaskByte(TM_TASKID_YINJUAN, 4, 1, TASK_ACCESS_CODE_TONG_MELEE);
	local nLevel = GetLevel();
	gf_ModifyExp(nLevel*nLevel*nLevel*30);
	AwardGenuineQi(700);
	gf_EventGiveCustomAward(3, 250, 1);
	gf_EventGiveCustomAward(4, 300, 1);
	gf_AddItemEx2({2, 1, 30588, 30}, "M¶nh LÖnh Bµi Bang Héi", "Lo¹n chiÕn bang héi", "ChiÕn kú tø linh bang héi cao cÊp", 0, 1);
end

function nothing()
end