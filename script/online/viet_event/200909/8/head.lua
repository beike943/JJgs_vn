Include("\\script\\lib\\globalfunctions.lua");

GIVE_CAKE_ID = 2429

-- PhÇn th­ëng 3 em bÐ seed 1000
tXiaoAwardList = {
	{"30 vµng", 240, "Earn(%d)", 300000},
	{"30 ®iÓm danh väng", 100, "ModifyReputation(%d,0)",30},
	{"30 ®iÓm S­ M«n", 100, "SetTask(336, GetTask(336) + %d)",30},
	{"Tö Hµ mËt TÞch", 19, {0,107,65,1},0},
	{"Thiªn Hµ MËt TÞch", 20, {0,107,64,1},0},
	{"Chiªm Y Phæ",	10, {0,107,66,1},0},
	{"Tø Linh Tö ý Phæ", 20, {0,107,161,1},0},
	{"Tø Linh Thiªn ý Phæ", 20, {0,107,160,1},0},
	{"Tø Linh ChiÕn ý Phæ", 10, {0,107,159,1},0},
	{"§Êu Hån", 250, {2,1,1157,1},7*24*60*60},
	{"Qu©n c«ng ®¹i", 50, {2,1,9998,1},7*24*60*60},
	{"Thiªn Th¹ch Tinh Th¹ch", 60, {2,1,1009,1},0},
	{"Tiªu KiÕp T¸n", 100, {2,0,141,1},7*24*60*60},
	{"Thiªn Th¹ch Linh Th¹ch", 1, {2,1,1068,1},7*24*60*60},
}

function npc_xiao_talk()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20090928 or nDate > 20091025 then
		Say(szNpcName.."Ho¹t ®éng ®· kÕt thóc.",0)
		return
	end	
	local tSay ={
		"TÆng bÐ 10 B¸nh §Ëu Xanh/give_moon_cake",
		"Ta chØ ghÐ qua!/nothing";
	}	
	Say(szNpcName.."Trung Thu ®Õn råi, bÐ thÌm ¨n b¸nh qu¸! Cã ai tÆng bÐ <color=yellow>B¸nh §Ëu Xanh<color> kh«ng?",getn(tSay),tSay);	
end

function give_moon_cake()
	local nDate = tonumber(date("%d"))
	local nTaskVal = GetTask(GIVE_CAKE_ID)
	if GetLevel() < 50 then
		Say(szNpcName.."§¼ng cÊp ch­a ®ñ 50. H·y rÌn luyÖn thªm nha!",0)
		return
	end
	if GetPlayerRoute() == 0 then
		Say(szNpcName.."Ch­a gia nhËp m«n ph¸i bÐ kh«ng chÞu nhËn quµ ®©u!",0)
		return
	end
	if GetByte(nTaskVal, XIAO_BYTE_ID) == nDate then
		Say(szNpcName.."H«m nay ®· tÆng cho bÐ råi, mai tÆng n÷a nha!",0)
		return
	end
	if GetItemCount(2,1,30108) < 10 then
		Say(szNpcName.."G¹t bÐ h¶? Kh«ng ®ñ 10 B¸nh §Ëu Xanh!",0)
		return
	end	
	if gf_JudgeRoomWeight(1,10,szNpcName) == 0 then
		return
	end
	if DelItem(2,1,30108,10) == 1 then
		SetTask(GIVE_CAKE_ID, SetByte(nTaskVal,XIAO_BYTE_ID,nDate))
		ModifyExp(1500000)
		Msg2Player("B¹n nhËn ®­îc 1500000 ®iÓm kinh nghiÖm.")
		GiveAward()		
		Say(szNpcName.."C¸m ¬n nhiÒu nha!",0)
	else
		Say(szNpcName.."G¹t bÐ h¶? Kh«ng ®ñ 10 B¸nh §Ëu Xanh!",0)
		return
	end
end

function GiveAward()
	local nRand = gf_GetRandItemByTable(tXiaoAwardList,1000,1)
	if type(tXiaoAwardList[nRand][3]) == "table" then
		local nRetCode, nIndex = gf_AddItemEx(tXiaoAwardList[nRand][3], tXiaoAwardList[nRand][1]);
		if nRetCode == 1 then
			if tXiaoAwardList[nRand][4] ~= 0 then
				SetItemExpireTime(nIndex, tXiaoAwardList[nRand][4]);
			end
		end
	else
		dostring(format(tXiaoAwardList[nRand][3], tXiaoAwardList[nRand][4]));		
		Msg2Player("B¹n nhËn ®­îc "..tXiaoAwardList[nRand][1]);
	end	
	WriteLogEx("Hoat dong thang 10","tÆng b¸nh",1,tXiaoAwardList[nRand][1])
end

function nothing()
	Say(szNpcName.."Hu hu sao kh«ng ai tÆng b¸nh cho bÐ vËy?",0)
end