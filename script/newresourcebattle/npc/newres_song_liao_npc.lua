-- Created by TuanNA5
-- 31/05/2010
-- Tµi nguyªn chiÕn

Include("\\script\\online\\qixi06\\mission_head.lua");

function newres_general()
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Gia nhËp m«n ph¸i míi cã thÓ tham gia chiÕn dŞch!")
		return 0
	end	
	if GetLevel() < 77 then
		Talk(1,"",szNpcName.."§¼ng cÊp 77 trë lªn míi cã thÓ tham gia chiÕn dŞch!")
		return 0
	end	
	if abs(GetTask(701)) < 15000 then
		Talk(1,"",szNpcName.."§iÓm c«ng tr¹ng ph¶i ®¹t 15000 trë lªn míi cã thÓ tham gia chiÕn dŞch!")
		return 0
	end
	if abs(GetTask(704)) < 2 then
		Talk(1,"",szNpcName.."Qu©n hµm HiÖu óy trë lªn míi cã thÓ tham gia chiÕn dŞch!")
		return 0
	end
	if GetPKFlag() == 0 or GetFightState() == 0 then
		Talk(1,"",szNpcName.."D¹ng thøc luyÖn c«ng kh«ng thÓ tham gia chiÕn dŞch!")
		return 0
	end
	if BT_GetCurCamp() ~= nCurCamp then
		Talk(1,"",szNpcName.."Ng­¬i kh«ng cïng phe, kh«ng thÓ tham gia chiÕn dŞch!")
		return 0
	end

	BT_ResetTask()
	local nState =gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) 
	local nDoneCount = gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE)
	local nPoint = GetTask(TSK_NEWRES_POINT)
	local nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_SONG)
	local szState = "ch­a nhËn nhiÖm vô"
	local szDoubleExp = "ch­a kİch ho¹t nh©n ®«i kinh nghiÖm"
	
	if nState == 1 then
		szState = "®ang nhËn nhiÖm vô"
	elseif nState == 2 then
		szState = "®· hoµn thµnh nhiÖm vô"
	end
	
	if nCurCamp == 2 then
		nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_LIAO)
	end
	
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < 3600 then
			local nTimeRemain = nDoubeExpTime + 3600 - GetTime()
			local nHour, nMin, nSec = BT_ShowTime(nTimeRemain)
			szDoubleExp = format("thêi gian nh©n ®«i kinh nghiÖm cßn %d phót %d gi©y",nMin,nSec)			
		end	
	end
	
	local szSay = format("T­íng sÜ phe ta kh«ng ph©n biÖt tuæi t¸c, chØ cÇn ®oµn kÕt ®¸nh ®uæi ngo¹i x©m lµ ®­îc! <color=yellow>Ng­¬i hiÖn t¹i %s, sè ®iÓm tİch lòy thu thËp: %d ®iÓm, sè lÇn hoµn thµnh nhiÖm vô trong ngµy h«m nay: %d lÇn. Nguyªn So¸i kİch ho¹t nh©n ®«i: %s.<color>",szState,nPoint,nDoneCount,szDoubleExp)
	
	local tSay = {		
		"NhËn nhiÖm vô Thu ThËp Tµi Nguyªn/get_newres_task",
		"Hoµn thµnh nhiÖm vô Thu ThËp Tµi Nguyªn/finish_newres_task",
		"NhËn d­îc phÈm chiÕn tr­êng/get_medicine",
		"Bæn So¸i muèn kİch ho¹t nh©n ®«i kinh nghiÖm/double_exp_kick_off",
		"Ta muèn quay vÒ T­¬ng D­¬ng (tèn 10 b¹c)/ask_reason",
		"Ta muèn tiÕn vµo khu vùc thu thËp (tèn 5 b¹c)/go_gather",
		"Kh«ng cã g×/gf_DoNothing",	
	}
	Say(szNpcName..szSay,getn(tSay),tSay);
end

function get_info()
end

function get_newres_task()	
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
		SetTask(TSK_NEWRES_POINT,0)
		TaskTip("B¹n ®· nhËn 1 nhiÖm vô thu thËp tµi nguyªn. H·y ®i thu thËp ®ñ 2000 tµi nguyªn ®Ó l·nh th­ëng.")
		Talk(1,"",szNpcName.."Ng­¬i ®· nhËn 1 nhiÖm vô thu thËp! H·y cè g¾ng hoµn thµnh!")
		WriteLogEx("TL TNChien","NhËn nhiÖm vô")
	end
end

function finish_newres_task()
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) ~= 2 then
		Talk(1,"",szNpcName.."Mau ®i thu thËp tµi nguyªn råi h·y l·nh th­ëng!")
		return
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= 3 then
		Talk(1,"",szNpcName.."Mçi ngµy chØ cã thÓ l·nh th­ëng 3 lÇn!")
		return
	end
	local nExpAward,nJunGongAward = 0,0
	local nCurRank = abs(GetTask(704))	
	nExpAward,nJunGongAward  = tAwardRank[nCurRank][1], tAwardRank[nCurRank][2]
	local tSay = {
		"Sö dông Qu©n C«ng Ch­¬ng (kinh nghiÖm gÊp 1,5 lÇn, ®iÓm qu©n c«ng gÊp 2 lÇn)/#use_jungong(1)",
		"Sö dông Qu©n C«ng §¹i (kinh nghiÖm gÊp 2 lÇn, ®iÓm qu©n c«ng gÊp 5 lÇn)/#use_jungong(2)",
		"Sö dông Qu©n C«ng Huy Hoµng (kinh nghiÖm gÊp 2,5 lÇn, ®iÓm qu©n c«ng gÊp 10 lÇn)/#use_jungong(3)",
		"Kh«ng muèn sö dông qu©n c«ng/no_jungong",
		"Ch­a muèn nhËn th­ëng/gd_DoNothing",	
	}
	local szSay = szNpcName.."PhÇn th­ëng kinh nghiÖm b¹n nhËn ®­îc lµ <color=yellow>"..nExpAward.." ®iÓm<color>, phÇn th­ëng tİch lòy lµ <color=yellow>"..nJunGongAward.." ®iÓm<color> tİch lòy. <color=yellow>B¹n cã thÓ dïng qu©n c«ng ch­¬ng ®Ó nh©n ®«i phÇn th­ëng qu©n c«ng vµ phÇn th­ëng kinh nghiÖm<color>.";
	Say(szSay,getn(tSay),tSay)
end

function use_jungong(nType)
	local szType = "Qu©n C«ng Ch­¬ng"
	if nType == 2 then 
		szType = "Qu©n C«ng §¹i"
	elseif nType == 3 then
		szType = "Qu©n C«ng Huy Hoµng"
	end
	Say(szNpcName.."Ng­¬i muèn sö dông <color=yellow>"..szType.." nhËn phÇn th­ëng. NÕu hoµn thµnh nhiÖm vô trong thêi gian Nguyªn So¸i kİch ho¹t thu thËp tµi nguyªn sÏ ®­îc nh©n ®«i kinh nghiÖm.",2,format("§ång ı/#confirm_use_jungong(%d)",nType),"Ta ch­a muèn nhËn th­ëng/gf_DoNothing")
end

function no_jungong()
	Say(szNpcName.."X¸c nhËn kh«ng sö dông qu©n c«ng?",2,"Sö dông qu©n c«ng/finish_newres_task","Ta kh«ng sö dông qu©n c«ng/#confirm_use_jungong(4)")
end

function confirm_use_jungong(nType)
	local nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_SONG)		
	local nDoubleExpFlag = 1	
	local nCurRank = abs(GetTask(704))
	local nExpAward,nJunGongAward = tAwardRank[nCurRank][1], tAwardRank[nCurRank][2]
	
	if nCurCamp == 2 then
		nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_LIAO)
	end		
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < 3600 then
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
	SetTask(TSK_NEWRES_POINT,0)
	
	nExpAward = floor(nExpAward * tJungongItem[nType][3]) * nDoubleExpFlag
	nJunGongAward = floor(nJunGongAward * tJungongItem[nType][4])
	
	local tb_jun_gong_num =
	{
		[1] = 2,
		[2] = 3,
		[3] = 24,
		[4] = 1,
	}
	
	if tonumber(date("%y%m%d")) >= 100709 and tonumber(date("%y%m%d")) <= 100808 then
		gf_AddItemEx2({2,1,30205,80}, "Tói kho¸ng th¹ch", "Hoat dong thang 7 nam 2010", "Tµi Nguyªn ChiÕn")
	elseif tonumber(date("%y%m%d")) >= 100813 and tonumber(date("%y%m%d")) <= 100912 then
		gf_AddItemEx2({ 2, 1, 30225, 80}, "Nguyªn LiÖu Lµm B¸nh", "Hoat dong thang 8 nam 2010", "Tµi Nguyªn ChiÕn")
	elseif tonumber(date("%y%m%d")) >= 101029 and tonumber(date("%y%m%d")) <= 101205 then
		gf_AddItemEx2({ 2, 1, 30250, tb_jun_gong_num[nType] * 50}, "nguyªn liÖu event 201011", "Hoat dong thang 11 nam 2010", "Tµi Nguyªn ChiÕn")
	end
	
	local tRoseQuantity = 
	{
		[1] = 15,
		[2] = 60,
		[3] = 300,
	}
	if nType == 1 or nType == 2 or nType == 3 then
		if tonumber(date("%Y%m%d")) >= 20101001 and tonumber(date("%Y%m%d")) <= 20101025 then
           	gf_AddItemEx2({2, 0, 1162, tRoseQuantity[nType]}, "Hoa Hång ®á", "Bang Hoi Tinh Anh 4", "hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn")
           end
	end
	
	local nMaterial1009 = 0
	if nType == 1 then
		nMaterial1009 = 100
	elseif nType == 2 then
		nMaterial1009 = 150
	elseif nType == 3 then
		nMaterial1009 = 1200
	else
		nMaterial1009 = 50
	end
	if tonumber(date("%y%m%d")) >= 100929 and tonumber(date("%y%m%d")) <= 101024 then
		gf_AddItemEx2({ 2, 1, 30233, nMaterial1009}, "Bét M×", "Hoat dong thang 9 nam 2010", "Tµi Nguyªn ChiÕn")
	end
	
	ModifyExp(nExpAward)	
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + nJunGongAward)
	else
		SetTask(701,GetTask(701) - nJunGongAward)
	end
	Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm")
	Msg2Player("B¹n nhËn ®­îc "..nJunGongAward.." ®iÓm c«ng tr¹ng")
	WriteLogEx("TL TNChien","NhËn th­ëng "..tJungongItem[nType][1])
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= 2 then
		if GetTask(1537) == 9 then
			SetTask(1537,10)
			TaskTip("B¹n ®· hoµn thµnh nhiÖm vô 2 lÇn. Mau trë vÒ bÈm b¸o víi Minh Chñ Kim S¬n.")		
		end
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) == 3 then
		WriteLogEx("TL TNChien","Hoµn thµnh nhiÖm vô 3 lÇn")
	end	
end

function get_medicine()
	local nCount = 10;
	local nCurMapID = GetWorldPos();
	if nCurMapID == MAP_ID then
		if gf_Judge_Room_Weight(3,300) == 1 then			
			AddItem(tBattleItem[9][2],tBattleItem[9][3],tBattleItem[9][4],nCount);
			Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..tBattleItem[9][1]);	
			AddItem(tBattleItem[10][2],tBattleItem[10][3],tBattleItem[10][4],nCount);
			Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..tBattleItem[10][1]);	
			AddItem(tBattleItem[11][2],tBattleItem[11][3],tBattleItem[11][4],nCount);
			Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..tBattleItem[11][1]);	
		else
			Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc cña ng­¬i kh«ng ®ñ, xin kiÓm tra l¹i tr­íc!");
		end
	end
end

function double_exp_kick_off()
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
		Talk(1,"",szNpcName.."Thêi gian nµy kh«ng thÓ kİch ho¹t. ChØ cã thÓ kİch ho¹t nh©n ®«i trong kho¶ng 8:30 - 12:00, 15:30 - 18:30, 20:30 - 21:30.")
		return 0
	end
	if IsTitleExist(30, 6) <= 0 and IsTitleExist(30, 12) <= 0 then
		Talk(1,"",szNpcName.."Ph¶i cã danh hiÖu Nguyªn So¸i míi cã thÓ ph¸t lÖnh tÊn c«ng! Mêi Nguyªn So¸i kiÓm tra l¹i.")
		return 0
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DOUBLE_EXP) >= 3 then
		Talk(1,"",szNpcName.."Mçi ngµy chØ ®­îc kİch ho¹t nh©n ®«i kinh nghiÖm 3 lÇn. Mêi Nguyªn So¸i quay l¹i sau!")
		return
	end	
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < 3600 then
			Talk(1,"",szNpcName.."HiÖn t¹i ®· kİch ho¹t nh©n ®«i kinh nghiÖm. Mêi Nguyªn So¸i quay l¹i sau!")
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
		"B¾c lé Thiªn M«n/#go_to_pos(1)",
		"§«ng lé Thiªn M«n/#go_to_pos(2)",
		"Nam lé Thiªn M«n/#go_to_pos(3)",
		"T©y lé Thiªn M«n/#go_to_pos(3)",
		"Khu vùc Nam Thiªn M«n/#go_to_pos(5)",
		"Trë l¹i trang ®Çu/newres_general",
		"Ta chØ ghĞ qua/gf_DoNothing",	
	}
	Say(szNpcName.."Ng­¬i muèn ®i ®©u?",getn(tSay),tSay)
end

function go_to_pos(nPos)
	if Pay(500) == 1 then		
		SetPos(RES_POINT[nPos][1],RES_POINT[nPos][2])
		CastState("state_dispear",0,5*18);	
	end
end