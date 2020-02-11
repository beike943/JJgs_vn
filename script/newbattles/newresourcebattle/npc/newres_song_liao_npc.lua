-- Created by TuanNA5
-- 31/05/2010
-- Tµi nguyªn chiÕn
DOUBLE_EXP_TIME = 7200

Include("\\script\\online\\qixi06\\mission_head.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\online_activites\\treasure_box\\head.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include ("\\script\\meridian\\meridian_award_zhenqi.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\award\\feature_award.lua");

function newres_general()
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Gia nhËp m«n ph¸i míi cã thÓ tham gia chiÕn dÞch!")
		return 0
	end	
	if GetLevel() < 77 then
		Talk(1,"",szNpcName.."§¼ng cÊp 77 trë lªn míi cã thÓ tham gia chiÕn dÞch!")
		return 0
	end	
	if abs(GetTask(701)) < 15000 then
		Talk(1,"",szNpcName.."§iÓm c«ng tr¹ng ph¶i ®¹t 15000 trë lªn míi cã thÓ tham gia chiÕn dÞch!")
		return 0
	end
	if abs(GetTask(704)) < 2 then
		Talk(1,"",szNpcName.."Qu©n hµm HiÖu óy trë lªn míi cã thÓ tham gia chiÕn dÞch!")
		return 0
	end
	if GetPKFlag() == 0 or GetFightState() == 0 then
		Talk(1,"",szNpcName.."D¹ng thøc luyÖn c«ng kh«ng thÓ tham gia chiÕn dÞch!")
		return 0
	end
--	if BT_GetCurCamp() ~= nCurCamp then
--		Talk(1,"",szNpcName.."Ng­¬i kh«ng cïng phe, kh«ng thÓ tham gia chiÕn dÞch!")
--		return 0
--	end

	BT_ResetTask()
	local nState =gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) 
	local nDoneCount = gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE)
	local nPoint = GetTask(TSK_NEWRES_POINT)
	local nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_SONG)
	local szState = "ch­a nhËn nhiÖm vô"
	local szDoubleExp = "ch­a kÝch ho¹t nh©n ®«i kinh nghiÖm"
	
	if nState == 1 then
		szState = "®ang nhËn nhiÖm vô"
	elseif nState == 2 then
		szState = "®· hoµn thµnh nhiÖm vô"
	end
	
	if nCurCamp == 2 then
		nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_LIAO)
	end
	
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < DOUBLE_EXP_TIME then
			local nTimeRemain = nDoubeExpTime + DOUBLE_EXP_TIME - GetTime()
			local nHour, nMin, nSec = BT_ShowTime(nTimeRemain)
			szDoubleExp = format("thêi gian nh©n ®«i kinh nghiÖm cßn %d giê %d phót %d gi©y",nHour,nMin,nSec)			
		end	
	end
	
	local szSay = format("T­íng sÜ phe ta kh«ng ph©n biÖt tuæi t¸c, chØ cÇn ®oµn kÕt ®¸nh ®uæi ngo¹i x©m lµ ®­îc! <color=yellow>Ng­¬i hiÖn t¹i %s, sè ®iÓm tÝch lòy thu thËp: %d ®iÓm, sè lÇn hoµn thµnh nhiÖm vô trong ngµy h«m nay: %d lÇn. Nguyªn So¸i kÝch ho¹t nh©n ®«i: %s.<color>",szState,nPoint,nDoneCount,szDoubleExp)
	
	local tSay = {		
--		"Hç trî tèc ®é ®µo tµi nguyªn/support_daotainguyen",
--		"N©ng cao tèc ®é (x2) thu thËp tµi nguyªn (tiªu hao 29 xu vËt phÈm)/#collect_res(1)",
--		"N©ng cao tèc ®é (x3) thu thËp tµi nguyªn (tiªu hao 59 xu vËt phÈm)/#collect_res(2)",
		"NhËn nhiÖm vô Thu ThËp Tµi Nguyªn/get_newres_task",
		"Hoµn thµnh nhiÖm vô Thu ThËp Tµi Nguyªn hµng ngµy/finish_newres_task",
--		"Hoµn thµnh thªm 1 nhiÖm vô Thu ThËp Tµi Nguyªn/finish_newres_task_more",
		"NhËn d­îc phÈm chiÕn tr­êng/get_medicine",
		"Bæn So¸i muèn kÝch ho¹t nh©n ®«i kinh nghiÖm/double_exp_kick_off",
		"Ta muèn quay vÒ T­¬ng D­¬ng (tèn 10 b¹c)/ask_reason",
		"Ta muèn tiÕn vµo khu vùc thu thËp (tèn 5 b¹c)/go_gather",
		"Kh«ng cã g×/gf_DoNothing",	
	}
	Say(szNpcName..szSay,getn(tSay),tSay);
end

function get_info()
end

function get_newres_task()	
	local nPhongHam = abs(GetTask(704))	
	if nPhongHam == 6 then
		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DOUBLE_EXP) < 1 then
			Talk(1,"",szNpcName.."Nguyªn So¸i ph¶i kÝch ho¹t x2 Ýt nhÊt 1 lÇn trong ngµy th× míi nhËn nhiÖm vô ®­îc!")
			return
		end	
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 1 then
		Talk(1,"",szNpcName.."Ng­¬i ®· nhËn 1 nhiÖm vô råi. H·y hoµn thµnh ®i råi nhËn nhiÖm vô kÕ tiÕp!")
		return
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 2 then
		Talk(1,"",szNpcName.."Ng­¬i ch­a nhËn th­ëng nhiÖm vô lÇn tr­íc!")
		return
	end
	if  gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE)  == 0 then
		gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,1)	
		--SetTask(TSK_NEWRES_POINT,0)
		local nTypeDouble = floor(GetTask(TSK_NEWRES_POINT)/10000)
		SetTask(TSK_NEWRES_POINT,nTypeDouble * 10000)
		TaskTip("B¹n ®· nhËn 1 nhiÖm vô thu thËp tµi nguyªn. H·y ®i thu thËp ®ñ 2500 tµi nguyªn ®Ó l·nh th­ëng.")
		Talk(1,"",szNpcName.."Ng­¬i ®· nhËn 1 nhiÖm vô thu thËp! H·y cè g¾ng hoµn thµnh!")
		WriteLogEx("TL TNChien","NhËn nhiÖm vô")
		gf_WriteLogEx("TAI NGUYEN CHIEN NEW LOG", "nhËn nhiÖm vô", 1, "NhËn nhiÖm vô")
	end
end

function finish_newres_task()
	CalcBattleRank()
	UpdateBattleMaxRank()
	if gf_Judge_Room_Weight(3, 300, "") ~= 1 then
		return
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) ~= 2 then
		Talk(1,"",szNpcName.."Mau ®i thu thËp tµi nguyªn råi h·y l·nh th­ëng!")
		return
	end
	local nQuest = 3
	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--	local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	if nPetLevel >= 1 then
		nQuest = 4
	end
--	if nIsPS >= 1 then
--		nQuest = 5
--	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= nQuest then
		Talk(1,"",szNpcName.."Mçi ngµy chØ cã thÓ l·nh th­ëng "..nQuest.." lÇn!")
		return
	end
	local nExpAward,nJunGongAward = 0,0
	local nCurRank = abs(GetTask(704))	
	nExpAward,nJunGongAward  = tAwardRank[nCurRank][1], tAwardRank[nCurRank][2]
	local tSay = {
		"Sö dông Qu©n C«ng Ch­¬ng/#use_jungong(1)",
		"Sö dông Qu©n C«ng §¹i/#use_jungong(2)",
		"Sö dông Qu©n C«ng Huy Hoµng/#use_jungong(3)",
		"Sö dông Qu©n C«ng Vinh Dù/use_VIP_tainguyenchien",
		"Kh«ng muèn sö dông qu©n c«ng/#confirm_use_jungong(4)",
		"Ch­a muèn nhËn th­ëng/gd_DoNothing",	
	}
	--local szSay = szNpcName.."PhÇn th­ëng kinh nghiÖm b¹n nhËn ®­îc lµ <color=yellow>"..nExpAward.." ®iÓm<color>, phÇn th­ëng tÝch lòy lµ <color=yellow>"..nJunGongAward.." ®iÓm<color> tÝch lòy. <color=yellow>B¹n cã thÓ dïng qu©n c«ng ch­¬ng ®Ó nh©n ®«i phÇn th­ëng qu©n c«ng vµ phÇn th­ëng kinh nghiÖm<color>.";
	local szSay = szNpcName.."Tham gia Tµi Nguyªn ChiÕn cã thÓ nhËn ®­îc rÊt nhiÒu ®iÓm kinh nghiÖm vµ ®iÓm qu©n c«ng"
	Say(szSay,getn(tSay),tSay)
end
function finish_newres_task_more()
	CalcBattleRank()
	UpdateBattleMaxRank()
	if gf_Judge_Room_Weight(3, 300, "") ~= 1 then
		return
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) ~= 2 then
		Talk(1,"",szNpcName.."Mau ®i thu thËp tµi nguyªn råi h·y l·nh th­ëng!")
		return
	end
	if GetCash() < 2030000 then
		Talk(1,"",szNpcName.."§¹i hiÖp kh«ng mang theo ®ñ vµng ®Ó l·nh th­ëng!")
		return
	end
	local nQuest = 4
	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--	local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	
	if nPetLevel >= 1 then
		nQuest = 5
	end
--	if nIsPS >= 1 then
--		nQuest = 6
--	end
	if nPetLevel < 1 then
		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) < 3 then
			Talk(1,"",szNpcName.."§¹i hiÖp ch­a nhËn th­ëng hÕt 3 lÇn hµng ngµy !!!!")
			return
		end
	else	
		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) < 4 then
			Talk(1,"",szNpcName.."§¹i hiÖp ch­a nhËn th­ëng hÕt 4 lÇn hµng ngµy !!!!")
			return
		end
--		if nIsPS >= 1 then
--			if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) < 5 then
--				Talk(1,"",szNpcName.."§¹i hiÖp ch­a nhËn th­ëng hÕt 4 lÇn hµng ngµy !!!!")
--				return
--			end
--		end
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= nQuest then
		Talk(1,"",szNpcName.."Mçi ngµy chØ cã thÓ l·nh th­ëng "..nQuest.." lÇn!")
		return
	end
	local nExpAward,nJunGongAward = 0,0
	local nCurRank = abs(GetTask(704))	
	nExpAward,nJunGongAward  = tAwardRank[nCurRank][1], tAwardRank[nCurRank][2]
	local tSay = {
		"Sö dông Qu©n C«ng Ch­¬ng/#use_jungong(1)",
		"Sö dông Qu©n C«ng §¹i/#use_jungong(2)",
		"Sö dông Qu©n C«ng Huy Hoµng/#use_jungong(3)",
		"Sö dông Qu©n C«ng Vinh Dù/use_VIP_tainguyenchien",
		"Kh«ng muèn sö dông qu©n c«ng/#confirm_use_jungong(4)",
		"Ch­a muèn nhËn th­ëng/gd_DoNothing",	
	}
	--local szSay = szNpcName.."PhÇn th­ëng kinh nghiÖm b¹n nhËn ®­îc lµ <color=yellow>"..nExpAward.." ®iÓm<color>, phÇn th­ëng tÝch lòy lµ <color=yellow>"..nJunGongAward.." ®iÓm<color> tÝch lòy. <color=yellow>B¹n cã thÓ dïng qu©n c«ng ch­¬ng ®Ó nh©n ®«i phÇn th­ëng qu©n c«ng vµ phÇn th­ëng kinh nghiÖm<color>.";
	local szSay = szNpcName.."Tham gia Tµi Nguyªn ChiÕn cã thÓ nhËn ®­îc rÊt nhiÒu ®iÓm kinh nghiÖm vµ ®iÓm qu©n c«ng"
	Say(szSay,getn(tSay),tSay)
end
function use_VIP_tainguyenchien()
	if gf_Judge_Room_Weight(4,50," ") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ ®Ó nhËn thªm nguyªn liÖu event, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if GetItemCount(2,1,30642) < 1 then
		Talk(1,"","C¸c h¹ chän nhËn th­ëng d¹ng VIP mµ kh«ng cã qu©n c«ng ch­¬ng Vinh Dù");
		return 0;
	end
	if DelItem(2,1,30642,1) ~= 1 then
		return 0
	end
------------- Trõ vµng cho lÇn nhËn th­ëng thªm
--	local nQuest = 4
--	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--	if nPetLevel >= 2 then
--		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= 4 then
--			Pay(2030000)
--		end
--	else
--		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) == 3 then
--			Pay(2030000)
--		end
--	end
-------------	
	local nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_SONG)		
	local nDoubleExpFlag = 1	
	if nCurCamp == 2 then
		nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_LIAO)
	end		
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < DOUBLE_EXP_TIME then
			nDoubleExpFlag = 2
		end	
	end	
	local nPhongHam = abs(GetTask(704))	
	local tAward_VIP = {
		[2] = {18000000,5600},
		[3] = {30000000,5600},
		[4] = {36000000,5600},
		[5] = {45000000,5600},
		[6] = {60000000,5600},
	}	
	local nExpVIPTNC = tAward_VIP[nPhongHam][1]* nDoubleExpFlag
	ModifyExp(nExpVIPTNC)	
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + tAward_VIP[nPhongHam][2])
	else
		SetTask(701,GetTask(701) - tAward_VIP[nPhongHam][2])
	end
	Msg2Player("B¹n nhËn ®­îc "..tAward_VIP[nPhongHam][1]*nDoubleExpFlag.." ®iÓm kinh nghiÖm")
	Msg2Player("B¹n nhËn ®­îc "..tAward_VIP[nPhongHam][2].." ®iÓm c«ng tr¹ng")
	gf_WriteLogEx("TAI NGUYEN CHIEN NEW LOG", "nhËn th­ëng thµnh c«ng", 1, "NhËn th­ëng lo¹i VIP")
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130919 and nDate <=131013 then	
		gf_AddItemEx2({2,1,30567 ,500}, "Nguyªn liÖu Event VIP TNC", "Hoat dong thang 08 nam 2013", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn VIP")
		Msg2Player("B¹n nhËn ®­îc 500 Nguyªn LiÖu Event")
	end
	gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,0)	
	gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE,gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) + 1)
	--SetTask(TSK_NEWRES_POINT,0)	
	local nTypeDouble = floor(GetTask(TSK_NEWRES_POINT)/10000)
	SetTask(TSK_NEWRES_POINT,nTypeDouble * 10000)
	TaiNguyenChien_NhanThuong(5)
end
function use_jungong(nType)
	local szType = "Qu©n C«ng Ch­¬ng"
	if nType == 2 then 
		szType = "Qu©n C«ng §¹i"
	elseif nType == 3 then
		szType = "Qu©n C«ng Huy Hoµng"
	end
	Say(szNpcName.."Ng­¬i muèn sö dông <color=yellow>"..szType.." nhËn phÇn th­ëng. NÕu hoµn thµnh nhiÖm vô trong thêi gian Nguyªn So¸i kÝch ho¹t thu thËp tµi nguyªn sÏ ®­îc nh©n ®«i kinh nghiÖm.",2,format("§ång ý/#confirm_use_jungong(%d)",nType),"Ta ch­a muèn nhËn th­ëng/gf_DoNothing")
end

function no_jungong()
	Say(szNpcName.."X¸c nhËn kh«ng sö dông qu©n c«ng?",2,"Sö dông qu©n c«ng/finish_newres_task","Ta kh«ng sö dông qu©n c«ng/#confirm_use_jungong(4)")
end

function confirm_use_jungong(nType)
	local nNpcIdx = GetTargetNpc();
	local nNpcName = GetNpcName(nNpcIdx);	
	if nNpcName == "TriÖu Tè Quyªn" then
		if GetTask(704) < 0 then
			Talk(1, "", "Ng­¬i kh«ng ph¶i phe Tèng nªn kh«ng thÓ tr¶ nhiÖm vô ®­îc")
			return 0
		end
	end
	if nNpcName == "Tiªu ViÔn TuÊn" then
		if GetTask(704) > 0 then
			Talk(1, "", "Ng­¬i kh«ng ph¶i phe Liªu nªn kh«ng thÓ tr¶ nhiÖm vô ®­îc")
			return 0
		end
	end
	
	local nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_SONG)		
	local nDoubleExpFlag = 1	
	local nCurRank = abs(GetTask(704))
	local nExpAward,nJunGongAward = tAwardRank[nCurRank][1], tAwardRank[nCurRank][2]
	----------------------- Chuçi nhiÖm vô ChuyÓn Sinh §¬n, l­u sè thø 6 vµ 7 ®Çu bªn ph¶i
	local nCSD_TNC = floor(GetTask(TSK_CSD_COUNT_A) / 100000)
	local nNumBK = mod(GetTask(TSK_CSD_COUNT_A),100000)
	if mod(nCSD_TNC, 100) < 81 and GetTask(TSK_CSD) == 1 then
		nCSD_TNC = (nCSD_TNC + 1) * 100000 + nNumBK
		SetTask(TSK_CSD_COUNT_A, nCSD_TNC)
	end
	---------------------------------
	if nCurCamp == 2 then
		nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_LIAO)
	end		
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < DOUBLE_EXP_TIME then
			nDoubleExpFlag = 2
		end	
	end	
	if nType == 1 or nType == 2 or nType == 3 then
		if GetItemCount(tJungongItem[nType][2][1],tJungongItem[nType][2][2],tJungongItem[nType][2][3]) <= 0 then
			Talk(1,"",szNpcName.."Ng­¬i kh«ng mang theo huy hiÖu chiÕn c«ng trªn ng­êi!")
			return
		end
		DelItem(tJungongItem[nType][2][1],tJungongItem[nType][2][2],tJungongItem[nType][2][3],1)
	end
	
	gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,0)	
	gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE,gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) + 1)
	local nTypeDouble = floor(GetTask(TSK_NEWRES_POINT)/10000)
	SetTask(TSK_NEWRES_POINT,nTypeDouble * 10000)
	------------- Trõ vµng cho lÇn nhËn th­ëng thªm
--	local nQuest = 4
--	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--	if nPetLevel >= 2 then
--		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= 5 then
--			Pay(2030000)
--		end
--	else
--		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) == 4 then
--			Pay(2030000)
--		end
--	end
	-------------		
	nExpAward = floor(nExpAward * tJungongItem[nType][3]) * nDoubleExpFlag
	nJunGongAward = floor(nJunGongAward * tJungongItem[nType][4])
	
	AddMonthlyEventResourceAward(nType)
	
	local tRoseQuantity = 
	{
		[1] = 15,
		[2] = 60,
		[3] = 300,
	}
	-- Bang Héi Tinh Anh 6 Cuéc ChiÕn Hoa Hång
	if nType == 1 or nType == 2 or nType == 3 then
		if tonumber(date("%Y%m%d")) >= 20110930 and tonumber(date("%Y%m%d")) <= 20111023 then
           	gf_AddItemEx2({2, 0, 1164, tRoseQuantity[nType]}, "Hoa Hång PhÊn", "Bang Hoi Tinh Anh 6", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
           end
	end
	VietSongLiao(nType)
	AwardZhenQi_ResourceProtect(1)
	--get_award_woodenbox()
	--gf_AddItemEx2({2,1,30340,tJungongItem[nType][5]},"Méc R­¬ng lo¹i "..tJungongItem[nType][1],"ThÇn Tµi B¶o R­¬ng","Tµi nguyªn chiÕn",0,1)
	--Msg2Player("B¹n nhËn ®­îc "..tJungongItem[nType][5].." Méc R­¬ng")
	ModifyExp(nExpAward)	
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + nJunGongAward)
	else
		SetTask(701,GetTask(701) - nJunGongAward)
	end
	Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm")
	Msg2Player("B¹n nhËn ®­îc "..nJunGongAward.." ®iÓm c«ng tr¹ng")
	--- §iÓm VËn May
--	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU, BYTE_POINT_LUCKY)	
--	local nExpVM = (nPointVM - 100)/100*nExpAward
--	ModifyExp(nExpVM)
--	if nExpVM > 0 then
--		Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--	else
--		Msg2Player("B¹n bÞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--	end
	---------	
	gf_WriteLogEx("TAI NGUYEN CHIEN NEW LOG", "nhËn th­ëng thµnh c«ng", 1, "NhËn th­ëng lo¹i "..tJungongItem[nType][1])
	WriteLogEx("TL TNChien","NhËn th­ëng "..tJungongItem[nType][1])
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= 2 then
		if GetTask(1537) == 9 then
			SetTask(1537,10)
			TaskTip("B¹n ®· hoµn thµnh nhiÖm vô 2 lÇn. Mau trë vÒ bÈm b¸o víi Minh Chñ Kim S¬n.")		
		end
	end
	
	-- NhiÖm vô ChuyÓn Sinh 3
	if GetTask(TRANSLIFE_MISSION_ID) == 19 and gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1) < 48 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK1, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1) == 48 then
			TaskTip("Hoµn thµnh yªu cÇu cña §¶o Chñ §µo Hoa §¶o 48 lÇn thu thËp thµnh c«ng Tµi Nguyªn ChiÕn")
		end
	end
	
	-- NhiÖm vô ChuyÓn Sinh 4
	if GetTask(TRANSLIFE_MISSION_ID) == 26 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK1) < 8 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK1, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1) == 10 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK1, 0)
			gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK1, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK1) +1)
		end
		if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK1) == 8 then
			TaskTip("Hoµn thµnh yªu cÇu cña B¹ch Tiªn Sinh 80 lÇn thu thËp thµnh c«ng Tµi Nguyªn ChiÕn")
		end
	end
	-----------------------Chuçi nhiÖm vô ChuyÓn Sinh 6
		local nCS6_TNN =  GetTask(TSK_CS6_COUNTC)
		--local nCS6_BNN_Num = mod(GetTask(TSK_CS6_COUNTC),10000)
		if mod(nCS6_TNN,100) < 20 and GetTask(TSK_CS6_TULINH) == 3 then
			nCS6_TNN = nCS6_TNN + 1
			SetTask(TSK_CS6_COUNTC, nCS6_TNN)
		end
	-----------------------Chuçi nhiÖm vô §ång Hµnh
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and (DongHanh_GetMission() == 1 or DongHanh_GetMission() == 2) then
			if DongHanh_GetMissionPart() > 0 then
				DongHanh_SetMissionPart()
				if DongHanh_GetMissionPart() == 0 then
					DongHanh_SetStatus()
				end
			end
		end
	end
	-----------------------------------	
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) == 3 then
		WriteLogEx("TL TNChien","Hoµn thµnh nhiÖm vô 3 lÇn")
	end
	TaiNguyenChien_NhanThuong(nType)
end

function get_medicine()
	local nCount = 6;
	local nCurMapID = GetWorldPos();
	if GetTask(TSK_GET_THUOC_TIME) ~= zgc_pub_day_turn() then
		SetTask(TSK_GET_THUOC_TIME,zgc_pub_day_turn())
		SetTask(TSK_GET_THUOC,0)
	end
	if mod(GetTask(TSK_GET_THUOC),10) >= 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn thuèc cho lÇn tham gia Tµi Nguyªn ChiÕn nµy råi.")
		return
	end
	
	if nCurMapID == MAP_ID then
		if gf_Judge_Room_Weight(3,300) == 1 then			
			AddItem(tBattleItem[9][2],tBattleItem[9][3],tBattleItem[9][4],nCount);
			Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..tBattleItem[9][1]);	
			AddItem(tBattleItem[10][2],tBattleItem[10][3],tBattleItem[10][4],nCount);
			Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..tBattleItem[10][1]);	
			AddItem(tBattleItem[11][2],tBattleItem[11][3],tBattleItem[11][4],nCount);
			Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..tBattleItem[11][1]);	
			SetTask(TSK_GET_THUOC,GetTask(TSK_GET_THUOC)+1)			
		else
			Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc cña ng­¬i kh«ng ®ñ, xin kiÓm tra l¹i tr­íc!");
		end
	end
end

function double_exp_kick_off()
	local nDate = tonumber(date("%y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if nNation == 66 and nDate <= 110709 then
		Talk(1,"",szNpcName.."HiÖn t¹i chøc n¨ng nµy ®ang ®ãng, kh«ng thÓ kÝch ho¹t!")
		return 0
	end
	if nCurCamp == 1 and GetTask(704) == -6 then
		Talk(1,"",szNpcName.."Nguyªn So¸i kh¸c phe kh«ng thÓ kÝch ho¹t ®­îc!")	
		return
	end
	if nCurCamp == 2 and GetTask(704) == 6 then
		Talk(1,"",szNpcName.."Nguyªn So¸i kh¸c phe kh«ng thÓ kÝch ho¹t ®­îc!")	
		return
	end
	
	local nTime = tonumber(date("%H%M"))	
	local nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_SONG)	
	local nCamp = BT_GetCurCamp()
	local nCurRank = abs(GetTask(704))
	if nCurCamp == 2 then
		nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_LIAO)
	end

	if nCurRank ~= 6 then
		Talk(1,"",szNpcName.."TiÓu tèt nh­ ng­¬i mµ còng ®ßi ban lÖnh cho ta µ? Ng­êi ®©u! B¾t h¾n!")
		return 0
	end
	if (nTime < 830 or nTime > 1200) and (nTime < 1530 or nTime > 1830) and (nTime < 2030 or nTime > 2130) then
		Talk(1,"",szNpcName.."Thêi gian nµy kh«ng thÓ kÝch ho¹t. ChØ cã thÓ kÝch ho¹t nh©n ®«i trong kho¶ng 8:30 - 12:00, 15:30 - 18:30, 20:30 - 21:30.")
		return 0
	end
	if IsTitleExist(30, 6) <= 0 and IsTitleExist(30, 12) <= 0 then
		Talk(1,"",szNpcName.."Ph¶i cã danh hiÖu Nguyªn So¸i míi cã thÓ ph¸t lÖnh tÊn c«ng! Mêi Nguyªn So¸i kiÓm tra l¹i.")
		return 0
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DOUBLE_EXP) >= 3 then
		Talk(1,"",szNpcName.."Mçi ngµy chØ ®­îc kÝch ho¹t nh©n ®«i kinh nghiÖm 3 lÇn. Mêi Nguyªn So¸i quay l¹i sau!")
		return
	end	
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < DOUBLE_EXP_TIME then
			Talk(1,"",szNpcName.."HiÖn t¹i ®· kÝch ho¹t nh©n ®«i kinh nghiÖm. Mêi Nguyªn So¸i quay l¹i sau!")
			return
		end
	end
	if nCurCamp == 1 then
		SetGlbValue(GLB_TASK_NEWRES_SONG,GetTime())
	else
		SetGlbValue(GLB_TASK_NEWRES_LIAO,GetTime())
	end	
	gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DOUBLE_EXP,gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DOUBLE_EXP) + 1)
	AddGlobalNews(format("<color=yellow>%s Nguyªn So¸i<color><color=green> %s<color> ban lÖnh tæng tÊn c«ng <color=red>%s<color>. T­íng sÜ tham gia chiÕn tr­êng cïng phe sÏ ®­îc nh©n ®«i kinh nghiÖm!",tCamp[nCamp],GetName(),"Thiªn M«n TrËn-Tµi nguyªn chiÕn"))
	Msg2Global(format("%s Nguyªn So¸i %s ban lÖnh tæng tÊn c«ng %s. T­íng sÜ tham gia chiÕn tr­êng cïng phe sÏ ®­îc nh©n ®«i kinh nghiÖm!",tCamp[nCamp],GetName(),"Thiªn M«n TrËn-Tµi nguyªn chiÕn"))
end

function ask_reason()	
	AskClientForString("leave","NhÑ nhµng rêi khái...",1,32,"Sao ph¶i rêi khái?");
end;	

function leave(sLeaveMsg)
	if GetCash() < 1000 then
		Talk(1,"",szNpcName.."CÇn 10 b¹c ®Ó vÒ T­¬ng D­¬ng.")
		return
	end
	if Pay(1000) == 1 then
		DelMSPlayer(MISSION_ID,0);
		Msg2MSAll(MISSION_ID,GetName().." Rêi khái ®Ó l¹i tin nh¾n:"..sLeaveMsg);
	end
end;

function go_gather()
	if GetCash() < 500 then
		Talk(1,"",szNpcName.."TiÕn vµo khu vùc thu thËp cÇn 5 b¹c.")
		return
	end
	local tSay ={
		"Khu vùc B¾c Thiªn M«n/#go_to_pos(1)",
		--"§«ng lé Thiªn M«n/#go_to_pos(2)",
		--"Nam lé Thiªn M«n/#go_to_pos(3)",
		--"T©y lé Thiªn M«n/#go_to_pos(3)",
		"Khu vùc Nam Thiªn M«n/#go_to_pos(5)",
		"Trë l¹i trang ®Çu/newres_general",
		"Ta chØ ghÐ qua/gf_DoNothing",	
	}
	Say(szNpcName.."Ng­¬i muèn ®i ®©u?",getn(tSay),tSay)
end

function go_to_pos(nPos)
	if Pay(500) == 1 then		
		SetPos(RES_POINT[nPos][1],RES_POINT[nPos][2])
		CastState("state_dispear",0,5*18);	
	end
end

function AddMonthlyEventResourceAward(nType)
	local nDate = tonumber(date("%y%m%d"))
	local tb_jun_gong_num =
	{
		[1] = 3,
		[2] = 5,
		[3] = 7,
		[4] = 2,
	}
	
	if nDate >= 110225 and nDate <= 110327 then
		gf_AddItemEx2({2, 1, 30287, tb_jun_gong_num[nType] * 10}, "Nguyªn liÖu ", "Hoat dong thang 3 nam 2011", "Tµi Nguyªn ChiÕn")
	end
end

function support_daotainguyen()
	local tbSayDialog = {};
	local szSayHead = "Thùc hiÖn hç trî ®µo tµi nguyªn sÏ nhanh chãng hoµn thµnh nhiÖm vô"
	
	tinsert(tbSayDialog,"Xem thêi gian hç trî cßn l¹i/showTimeRemain")
	tinsert(tbSayDialog,"N©ng cao tèc ®é (x2) thu thËp tµi nguyªn (tiªu hao 29 xu vËt phÈm)/#collect_res(1)")
	tinsert(tbSayDialog,"N©ng cao tèc ®é (x3) thu thËp tµi nguyªn (tiªu hao 59 xu vËt phÈm)/#collect_res(2)")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/gf_DoNothing")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);		
end
function showTimeRemain()
	local nTypeCheck = floor(GetTask(TSK_NEWRES_POINT)/10000)
	local nTimeBegin = GetTask(TSK_TIME_KICHHOAT_TNC)
	local nRemain = GetTime() - nTimeBegin
	nRemain = 60 - floor(nRemain/60)
	if nRemain <= 0 then
		Talk(1,"","B¹n ch­a thùc hiÖn kÝch ho¹t hç trî ®µo tµi nguyªn")
	else
		Talk(1,"","Thêi gian hç trî cßn l¹i lµ: "..nRemain.." phót")
	end
	
end
function collect_res(nType)
	local tbCheck = {
			[1] = {29, 2},
			[2] = {59, 3},
		}
--	local nTypeCheck = floor(GetTask(TSK_NEWRES_POINT)/10000)
	local tbSayDialog = {};
	local szSayHead = "B¹n chän h×nh thøc kÝch ho¹t hç trî x"..tbCheck[nType][2].." tèc ®é ®µo tµi nguyªn tiªu hao: "..tbCheck[nType][1].." Xu vËt phÈm"
--	local nTimeBegin = GetTask(TSK_TIME_KICHHOAT)
--	local nRemain = GetTime - nTimeBegin

	tinsert(tbSayDialog,"§ång ý kÝch ho¹t/#confirm_collect_res("..nType..")"	)
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/gf_DoNothing")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_collect_res(nType)
	local nPoint = mod(GetTask(TSK_NEWRES_POINT),10000)
	local tbCheck = {
			[1] = {29, 2},
			[2] = {59, 3},
		}
	if GetItemCount(2,1,30230) < tbCheck[nType][1] then
		Talk(1,"","B¹n kh«ng mang ®ñ Xu vËt phÈm. Vui lßng kiÓm tra l¹i.")
		return
	end
	if DelItem(2,1,30230,tbCheck[nType][1]) == 1 then
		Talk(1,"","B¹n ®· kÝch ho¹t thµnh c«ng hç trî x"..tbCheck[nType][2].." tèc ®é ®µo nhanh tµi nguyªn")
		SetTask(2285, GetTime())	
		SetTask(TSK_NEWRES_POINT, tbCheck[nType][2]*10000 + nPoint)
		WriteLogEx("LOG XU VAT PHAM","Hç trî ®µo tµi nguyªn lo¹i "..tbCheck[nType][1].." xu")
	end
end