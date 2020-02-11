Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\award\\feature_award.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua")

szLogTitle = "Phao hoa CNDSK 2013"

tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[29] = 1176,
				[30] = 1229,
}

YANHUO_TABLE = {
--	{"XÝch M¹c Háa DiÖm", 801, 10, 2, 1, 191},
--	{"Tranh M¹c Háa DiÖm", 802, 10, 2, 1, 193},
--	{"Lam M¹c Háa DiÖm", 805, 10, 2, 1, 192},
	{"Tranh S¾c Yªn Hoa", 820, 3, 2, 1, 189},
	{"Lam S¾c Yªn Hoa", 823, 3, 2, 1, 190},
	{""		   , 808, 5, 2, 1, 194},	--ÉñÃØÑÌ»¨
	{""		   , 811, 5, 2, 1, 194},
--	{""		   , 813, 10, 2, 1, 194},
--	{""		   , 814, 10, 2, 1, 194},
--	{""		   , 817, 10, 2, 1, 194},
	{""		   , 832, 3, 2, 1, 194},
	{""		   , 835, 3, 2, 1, 194},
	{""		   , 838, 1, 2, 1, 194},
	{""        , 841, 1, 2, 1, 194}
};

function use_firework(nItemIndex, nType)
	VietResetDate()
	local nDate = tonumber( date( "%y%m%d" ) ) --101116

	-- hai sè cuèi cña task FIREWORK_CNDSK_USE lµ sè lÇn sö dông trong ngµy
	local nCurDate = VNG_GetTaskPos(FIREWORK_CNDSK_USE, 9, 4)	--floor ( GetTask( FIREWORK_CNDSK_USE ) / 1000 ) -- lÊy 6 sè ®Çu tiªn
		
	
	-- thùc hiÖn reset sè lÇn sö dông trong ngµy vµ thêi gian gi·n c¸ch sö dông . nÕu kh«ng ph¶i lµ ngµy hiÖn t¹i
	if nCurDate ~= nDate then
		VNG_SetTaskPos(FIREWORK_CNDSK_USE, nDate, 9, 4)		--Reset ngµy sö dông--SetTask ( FIREWORK_CNDSK_USE, nDate * 1000 )
		SetTask ( FIREWORK_CNDSK_TIME, 0 )
		VNG_SetTaskPos(FIREWORK_CNDSK_USE, 0, 2, 1)		--Reset sè lÇn sö dông trong ngµy
--		VNG_SetTaskPos(FIREWORK_CNDSK_USE, 0, 3, 3) 	--Reset gi¸ trÞ x¸c ®Þnh x2 kinh nghiÖm tèn 139 vµng
	end
	
	local nCheck_kichhoat = VNG_GetTaskPos(FIREWORK_CNDSK_USE, 3, 3)		
	if nType == 1 then
		if nCheck_kichhoat ~= 1 then
			if GetCash() < 1390000 then
				Talk(1, "", "§¹i hiÖp kh«ng cã ®ñ 139 vµng ®Ó thùc hiÖn nh©n ®«i ®iÓm kinh nghiÖm !!!!")
				return
			end
			Pay(1390000)
			VNG_SetTaskPos(FIREWORK_CNDSK_USE, 1, 3, 3) 	--Set gi¸ trÞ x¸c ®Þnh x2 kinh nghiÖm tèn 139 vµng
			Msg2Player("§¹i hiÖp tiªu hao 139 vµng ®Ó ®­îc nh©n ®«i ®iÓm kinh nghiÖm khi ®èt ph¸o hoa")
			gf_WriteLogEx(szLogTitle, "thµnh c«ng", 1, "Tiªu 139 vµng ®­îc x2 kinh nghiÖm")	
		end	
	elseif nType == 2 then
		VNG_SetTaskPos(FIREWORK_CNDSK_USE, 2, 3, 3) 	--Set gi¸ trÞ x¸c ®Þnh kh«ng x2 kinh nghiÖm 
	end			
	-- Giíi h¹n ph¸o hoa sö dông ë mét sè map
	-- local nPos = GetWorldPos()
	-- if nPos ~= 100 and nPos ~= 150 and nPos ~= 606 and nPos ~= 885 and nPos ~= 884 then
	--	Talk ( 1, "", "ChØ cã thÓ sö dông ph¸o hoa t¹i TuyÒn Ch©u, D­¬ng Ch©u, chiÕn tr­êng Nh¹n M«n Quan, S¸t Thñ §­êng vµ trong Tµi Nguyªn ChiÕn!" )
	--	return
	-- end
	
	-- kiÓm tra lev nh©n vËt >=73
	if GetLevel () < 73 then
		Talk ( 1, "", "§¼ng cÊp 73 trë lªn míi cã thÓ ®èt ph¸o hoa!" )
		return
	end
	
	-- kiÓm tra nh©n vËt cã gia nhËp m«n ph¸i ch­a
--	if ( GetPlayerRoute() == 0 )  then
--		Talk ( 1, "" , "ThiÕu hiÖp ch­a v« m«n ph¸i nªn kh«ng thÓ sö dông ph¸o hoa" )
--		return
--	end
--	
--	-- kiÓm tra nh©n vËt ph¶i cã skill 55
--	if gf_Check55HaveSkill() == 0 then
--		Talk(1, "", "Ph¶i cã kü n¨ng cÊp 55 míi cã thÓ tham gia ho¹t ®éng nµy!")
--		return
--	end
	
	-- Vuît qu¸ sè lÇn sö dông --> tho¸t 	
	local nCount = mod ( GetTask(FIREWORK_CNDSK_USE), 100 ) 
	
	local nMaxDay = 60
	if nCount >= nMaxDay then
		Talk(1, "", "H«m nay thiÕu hiÖp ®· dïng qu¸ nhiÒu ph¸o hoa råi, ch¼ng cßn ph¸o cho thiÕu hiÖp n÷a ®©u. H·y quay l¹i vµo ngµy mai!")
		return
	end
	
	-- Thêi gian gi·n c¸ch ®èt ph¸o hoa 90 gi©y
	local nDif = 90 - ( GetTime() - GetTask ( FIREWORK_CNDSK_TIME ) )
	
	if nDif > 0 then
		Talk(1, "", "ThiÕu hiÖp ph¶i chê "..nDif.." gi©y n÷a míi cã thÓ tiÕp tôc ®èt ph¸o hoa!")
		return
	end
	
	if gf_JudgeRoomWeight(3, 50) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i tr­íc!");
		return 0
	end
	
	local nExp = 300000
	local nWeek = tonumber ( date ("%w") ) -- tr¶ vÒ ngµy trong tuÇn
	
	-- ChØ tÆng 600.000 exp khi vµo c¸c ngµy thø 6,7, CN  trong c¶ 3 mèc thêi gian
	if nWeek == 0 or nWeek == 5 or nWeek == 6  then 
		nExp = 600000
	end
				
	-- Thø 5, 6, 7, CN tÆng Vâ L©m B¶o H¹p
	if nDate <= 101226 and (nWeek == 0 or nWeek ==4 or nWeek == 5 or nWeek == 6) and mod(nCount, 2) == 1 then
		gf_AddItemEx2({2, 1, 30132, 1}, "Vâ L©m B¶o H¹p", "Vo Lam Bao Hap", "®èt ph¸o hoa nhËn th­ëng")
	end

	if nItemIndex ~= nil then
		if DelItemByIndex(nItemIndex,1) ~= 1 then
			return
		end
	end
--	local nExpChanKhi = 15
--	if nCount == 39 or nCount == 79 or nCount == 119 then
--		AwardGenuineQi(nExpChanKhi)
--		--Msg2Player("NhËn ®­îc "..nExpChanKhi.." ®iÓm ch©n khÝ")
--		gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nExpChanKhi, "®iÓm ch©n khÝ ph¸o hoa")		
--	end

	if VNG_GetTaskPos(FIREWORK_CNDSK_USE, 3, 3) == 1 then -- x2 kinh nghiÖm khi kick ho¹t x2
		nExp = nExp * 2
	end
	ModifyExp(nExp)
	Msg2Player("NhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm")
	--- §iÓm VËn May
--	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--	local nExpVM = (nPointVM - 100)/100*nExp
--	ModifyExp(nExpVM)
--	if nExpVM > 0 then
--		Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--	else
--		Msg2Player("B¹n bÞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--	end
	-----------------------Chuçi nhiÖm vô §ång Hµnh
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 21 then
			if DongHanh_GetMissionPart() > 0 then
				DongHanh_SetMissionPart()
				if DongHanh_GetMissionPart() == 0 then
					DongHanh_SetStatus()
				end
			end
		end
	end
	---------		
	Use_Award_PhaoHoa()
	--SetTask(336, GetTask(336) + 4)
	--Msg2Player("NhËn ®­îc 4 ®iÓm S­ M«n")
	--ModifyReputation(4, 0)
	--Msg2Player("NhËn ®­îc 4 ®iÓm Danh Väng")
	
	--WriteLogEx(szLogTitle, "Sö dông ph¸o hoa thµnh c«ng")
	if nCount == 99 then
		gf_WriteLogEx(szLogTitle, "kick ho¹t thµnh c«ng", 1, "Sö dông MAX ph¸o hoa")
	end
	gf_WriteLogEx(szLogTitle, "kick ho¹t thµnh c«ng", 1, "Sö dông ph¸o hoa thµnh c«ng")
	
	-- l­u task FIREWORK_CNDSK_USE (sè lÇn sö dông ph¸o hoa trong mét ngµy) 
	-- 10111500 --> ngµy 15-11-2010 , ch­a sö dông
	-- 10111602 --> ngµy 16-11-2010 , sö dông 2 lÇn	
	SetTask(FIREWORK_CNDSK_USE, GetTask(FIREWORK_CNDSK_USE) + 1)
	
	-- l­u l¹i lÇn sö dông ph¸o hoa hiÖn t¹i
	SetTask(FIREWORK_CNDSK_TIME, GetTime())
	
	--set d¹ng sö dông ph¸o hoa
--	if GetTask(TSK_ACTIVE_VIP_PHAOHOA) == 0 then
--		SetTask(TSK_ACTIVE_VIP_PHAOHOA, 2)
--	end
	-- khi sö dông ph¸o hoa sÏ xuÊt hiÖn h×nh ph¸o hoa
	local nIndex = random ( 1, getn(YANHUO_TABLE) )	
	DoFireworks ( YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3] )
	
	-- HiÖn thanh progress bar 1 phót 30 gi©y sau khi sö dông ph¸o hoa míi cã thÓ sö dông l¹i lÇn n÷a
	StartTimeGuage ("Ph¸o hoa", 90,0,1 )
end
