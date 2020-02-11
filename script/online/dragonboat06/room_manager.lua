--File name:room_manager_CD.lua
--Describe:ÁúÖÛÈü±¨Ãû´¦NPC½Å±¾
--Create Date:2006-4-18
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
Include("\\script\\online\\dragonboat06\\room.lua");

function main()
	do return end
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(ATTENDCOUNTPERDAY2) < nDate then
		SetTask(ATTENDCOUNTPERDAY1,0);
		SetTask(ATTENDCOUNTPERDAY3,0);
	end;
	SetTask(STATUS,0);	--ÉèÖÃÍæ¼ÒµÄÉí·İ
	SetTask(POSITION,0);
	SetTask(RANK,MAXPLAYER);	--×îºóÒ»Ãû
	SetTask(FINISHTIME,0);
	SetTask(FLAG_COLOR,0);
	SetTask(ENTERORDER,0);	--ÉÏÃæµÄ²Ù×÷¶¼ÊÇÎªÁËÊ¹×´Ì¬³ö´íµÄÍæ¼Ò¿ÉÒÔÕı³£½øĞĞÓÎÏ·
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	local bOnBoat = 0;
	if nGenre == 0 and nDetail ==105 then
		for i=25,31 do
			if nParticular == i then
				bOnBoat = 1;
				break;
			end;
		end;
	end;
	if bOnBoat == 1 then
		UnEquipAtPosition(10);
	end;
	local selTab = {
			"Ta muèn tham gia thi ®Êu/selectroom",
			"Ta muèn ®ãng thuyÒn Rång/wantboat",
			"Thi ®Êu nªn biÕt/knowdetail",
--			"ÎÒÒªÁìÈ¡ôÕ×ÓºÍ½­ºşĞÄµÃ/wantzongzi",
			"Ta muèn l·nh chØ nam thi thuyÒn Rång/wantzhinan",
--			"ÎÒÒªÓÃ»ı·Ö»»½±Àø/seebonus",
			"KÕt thóc ®èi tho¹i/nothing",
			};
	if Get_DragonBoatDay_State() == 0 then
		Talk(1,"","TÕt §oan Ngä ®· ®Õn. Chóc mäi ng­êi mét c¸i TÕt vui vÎ.");
		return 0;
	end;
	if Get_DragonBoatDay_State() == 1 then
		Talk(1,"","Ho¹t ®éng tÕt §oan Ngä ®· kÕt thóc. B¹n ¨n tÕt vui vÎ chø?");
		return 0;
	end;
	local sContent = "TÕt §oan Ngä ®· ®Õn, mäi ng­êi h·y tham gia thi ®Êu thuyÒn Rång!";
	if Get_DragonBoatDay_State() == 2 then
		for i=1,5 do
			tremove(selTab,1);
		end;
		sContent = "§· kÕt thóc thi ®Êu thuyÒn Rång, mêi b¹n l·nh phÇn th­ëng tr­íc <color=yellow>6/7<color>.";
	end;
	if nDate <= 071021 then
		tinsert(selTab,7,"Ta muèn nhËn båi th­êng/get_compensation");
	end;
	Say(sContent,getn(selTab),selTab);
end;

function get_compensation()
	if GetCreateTime() > 1192032000 then	--MkTimeºÍGmTimeÕâÁ½¸öÖ¸Áî²»ÊÇ¶Ô³ÆµÄ£¬ÔÎ
		Talk(1,"","ChØ nh÷ng nh©n vËt ®¨ng kı tr­íc <color=yellow>ngµy 11 th¸ng 10 n¨m 2007<color> míi ®­îc nhËn båi th­êng.");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ng­êi kh«ng nhËp m«n ph¸i kh«ng ®­îc nhËn båi th­êng ®ua thuyÒn. ");
		return 0;
	end;
	if GetLevel() <= 10 then
		Talk(1,"","§¼ng cÊp cña b¹n qu¸ thÊp, ph¶i ®¹t cÊp <color=yellow>10<color> trë lªn (kh«ng bao gåm cÊp 10) míi cã thÓ nhËn båi th­êng.");
		return 0;
	end;
	if GetTask(1898) ~= 0 then
		Talk(1,"","Ng­¬i ®· lÜnh phÇn båi th­êng råi! Mçi ng­êi chØ ®­îc l·nh båi th­êng 1 lÇn th«i!");
		return 0;
	end;
	if GetTask(BONUSPOINT) < 10 then
		Talk(1,"","§iÓm tİch lòy ®ua thuyÒn rång cña ng­¬i İt qu¸! Muèn l·nh ph¶i cã tõ <color=yellow>10 ®iÓm trë lªn<color>!");
		return 0;
	end;
	if GetFreeItemRoom() <= 3 or GetMaxItemWeight()-GetCurItemWeight() <= 60 then
		Talk(1,"main","Xin kiÓm tra kho¶ng trèng hµnh trang vµ søc lùc!");
		return 0;
	end;
	AddItem(2,1,967,30);
	Msg2Player("B¹n nhËn ®­îc 30 T©m ®¾c giang hå");
	AddItem(2,1,394,20);
	Msg2Player("B¹n nhËn ®­îc 20 B¸nh İt g¹o nÕp");
	SetTask(1898,1);
end;

function selectroom()
	local nHour = tonumber(date("%H"));
	if nHour < 19 or nHour > 22 and nHour ~= 12 and nHour ~= 13 then
		Talk(1,"main","Khu vùc thi ®Êu ®ang chuÈn bŞ, tõ <color=yellow>12h ®Õn 14h<color> vµ <color=yellow>19h ®Õn 23h<color> sÏ më. Nhí ®Õn tham gia nhĞ!");
		return 0;
	end;
	local MapID = GetWorldPos();
	local RoomIndex = 0;
	if MapID == 100 then
		RoomIndex = 0;
	elseif MapID == 200 then
		RoomIndex = g_TotalRoomNum;
	elseif MapID == 300 then
		RoomIndex = g_TotalRoomNum*2;
	else
		Write_Log("Ho¹t ®éng tÕt §oan Ngä sai sãt","Khi nhÊn vµo NPC b¸o danh, sè ID b¶n ®å nhËn ®­îc sai, tªn nh©n vËt:"..GetName());
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"main","Xin lçi! Ng­êi v« m«n v« ph¸i kh«ng ®­îc tham gia thi ®Êu thuyÒn Rång.");
		return 0;
	end;
	local RoomTab = Init_Room();
	local selTab = {};
	local statTab = {
				"§ang tiÕn hµnh thi ®Êu, kh«ng thÓ vµo trong!",
				"§ang trong giai ®o¹n b¸o danh, kh«ng thÓ vµo trong",
				"Cã thÓ vµo trong"
				}
	local nIndex = 1;
	local nNeedRoom = 0;
	local nIdelRoomCount,nReadyRoomCount,nMatchingRoomCount = Get_Room_Count_Info();

	if nIdelRoomCount == g_TotalRoomNum then
		for i=1,2 do
			selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[3]..")/#joinconfirm("..i..")";
			nIndex = nIndex + 1;	
		end;
	elseif nReadyRoomCount >= 1 then
		for i=1,g_TotalRoomNum do
			if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSIGNUP then
				local state = RoomTab[i]:GetRoomState();
				if state == MS_STATE_WAITSIGNUP then
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[2].." Sè ng­êi hiÖn cã:"..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";
				else
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[1].." Sè ng­êi hiÖn cã:"..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";			
				end;
				nIndex = nIndex + 1;
			end;	
		end;
	elseif nMatchingRoomCount ~= 0 and nMatchingRoomCount == g_TotalRoomNum - nIdelRoomCount then
		local bDisplayIdelRoom = 0;
		for i=1,g_TotalRoomNum do
			if bDisplayIdelRoom ~= 1 then
				if RoomTab[i]:GetRoomState() == MS_STATE_IDLE then
					bDisplayIdelRoom = 1;
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[3]..")/#joinconfirm("..i..")";
					nIndex = nIndex + 1;	
				end;
			end;
			if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSTART then
				selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[1].." Sè ng­êi hiÖn cã:"..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";			
				nIndex = nIndex + 1;	
			end;
		end;	
	end;
	selTab[getn(selTab)+1] = "Quay l¹i ®èi tho¹i chİnh./main";
	selTab[getn(selTab)+1] = "Rêi khái/nothing";
	Say("B¹n muèn vµo tr­êng ®Êu nµo?",getn(selTab),selTab);
end;

function joinconfirm(RoomID)
	if GetPlayerRoute() == 20 then --Îå¶¾Ğ°ÏÀ
		local selTab = {
				"§óng vËy!/#join("..RoomID..")",
				"§Ó ta suy nghÜ l¹i/main",
				}
		Say("B¹n muèn vµo thi ®Êu?",getn(selTab),selTab)
	else
		join(RoomID);
	end;
end;

function join(RoomID)
	if RoomID < 1 or RoomID > g_TotalRoomNum then
		Msg2Player("Lçi m· sè phßng, xin thö l¹i");
		return 0;
	end;
	if checkboat() == 0 then
		Talk(1,"","Xin lçi! Muèn tham gia thi ®Êu b¹n ph¶i cã mét chiÕc thuyÒn Rång.");
		return 0;		
	end;
	if checkequipment() == 0 then
		Talk(1,"","§Ó c«ng b»ng, tr­íc khi vµo tr­êng ®Êu xin b¹n h·y bá <color=yellow>c¸c trang bŞ trõ ngo¹i trang<color> ra ®Ó tr¸nh tæn thÊt ngoµi ı muèn. Xin x¸c nhËn <color=yellow>hµnh trang cßn chç trèng<color>.");
		return 0;
	end;
	local MapID = GetWorldPos();
	local RoomIndex = 0;
	if MapID == 100 then
		RoomIndex = 0;
	elseif MapID == 200 then
		RoomIndex = g_TotalRoomNum;
	elseif MapID == 300 then
		RoomIndex = g_TotalRoomNum*2;
	else
		Write_Log("Ho¹t ®éng tÕt §oan Ngä sai sãt","Khi nhÊn vµo NPC b¸o danh, sè ID b¶n ®å nhËn ®­îc sai, tªn nh©n vËt:"..GetName());
	end;
	local RoomTab = Init_Room();
	if RoomTab[RoomID]:GetRoomState() <= MS_STATE_WAITSIGNUP then
		RoomTab[RoomID]:AddPlayer();
		WriteLog("[Ho¹t ®éng tÕt §oan Ngä]\t"..GetAccount().."\t"..GetName().."\t tham gia ®ua thuyÒn Rång.")
	else
		Talk(1,"selectroom","Xin lçi! §­êng ®ua b¹n chän <color=yellow>"..RoomName[RoomID+RoomIndex].."<color>®· chuÈn bŞ b¾t ®Çu thi ®Êu hoÆc ®ang thi ®Êu kh«ng thÓ vµo ®­îc.");
	end;
end;

function seebonus()
	local selTab = {
			"Ta muèn dïng ®iÓm ®æi th­ëng/wantaward",
			"ThuyÕt minh ®æi th­ëng/knowaward",
			"Quay l¹i ®èi tho¹i chİnh./main",
			"KÕt thóc ®èi tho¹i/nothing",
			}
	Say("<enter>Sè lÇn tham gia thi ®Êu cña b¹n lµ:<color=yellow>"..GetTask(ATTENDCOUNT).."<color><enter>§iÓm tİch lòy cña b¹n:<color=yellow>"..GetTask(BONUSPOINT).."<color>",getn(selTab),selTab);
end;

function wantaward()
	local selTab = {
			"§æi 1 ®iÓm tİch lòy lÊy b¸nh İt thŞt quay/#askfornum(1)",	--ÎŞÏŞÁì
			"§æi 1 ®iÓm tİch lòy lÊy 1 ®iÓm danh väng/#askfornum(2)",	--×î¶à»»£±£°£°£°µã
			"Dïng 5 ®iÓm tİch lòy ®æi b¸nh İt x¸ xİu/#askfornum(3)",--Ã¿Ìì×î¶à£³´Î
			"Dïng 8 ®iÓm tİch lòy ®æi b¸nh İt thËp cÈm/#askfornum(4)",--ÎŞÏŞ
			"Dïng 8 ®iÓm tİch lòy ®æi b¸nh nh©n møt/#askfornum(5)",--ÎŞÏŞ
			--"ÓÃ15»ı·Ö»»È¡ÊÔÁ¶¹û×Ó/#askfornum(6)",--Ã¿Ìì×î¶à3´Î,×¢ÊÍÔ­Òò£ºIBÃ»ÓĞÊÔÁ·¹û
			"Xem trang sau/wantaward1",
			"Quay l¹i ®èi tho¹i chİnh./main",
			"KÕt thóc ®èi tho¹i/nothing",
			}
	Say("§iÓm tİch lòy thi ®Êu thuyÒn Rång cña b¹n lµ <color=yellow>"..GetTask(BONUSPOINT).."<color> ®iÓm, b¹n muèn ®æi phÇn th­ëng nµo?",getn(selTab),selTab);
end;

function wantaward1()
	local selTab = {
			"§æi 50 ®iÓm tİch lòy lÊy b¸nh İt Gia H­ng/#askfornum(7)",--Ã¿Ìì×î¶à3´Î
			"Dïng 100 ®iÓm tİch lòy ®æi tói b¸nh/#askfornum(8)",--Ã¿Ìì×î¶àÒ»´Î
			"§æi 500 ®iÓm tİch lòy lÊy bao l× x× b¸nh İt/#askfornum(9)",--×î¶à5´Î£¬Ã¿Ìì×î¶à3´Î
			"Dïng 1000 ®iÓm tİch lòy ®æi thñ th­ chÕ t¹o vò khİ/#askfornum(10)",--×î¶à2´Î£¬Ã¿Ìì×î¶à1´Î
			"§ïng 1500 ®iÓm tİch lòy ®æi Hèt L«i B¸c/#askfornum(11)",--×î¶à2´Î£¬Ã¿Ìì×î¶à1´Î
			"§æi 2000 ®iÓm tİch lòy lÊy KhuÊt Nguyªn Ngäc Béi/#askfornum(12)",--×î¶à1´Î
			"Xem trang tr­íc/wantaward",
			--"²é¿´ÏÂÒ»Ò³/wantaward2",
			"Quay l¹i ®èi tho¹i chİnh./main",
			"KÕt thóc ®èi tho¹i/nothing",
			}
	Say("§iÓm tİch lòy thi ®Êu thuyÒn Rång cña b¹n lµ <color=yellow>"..GetTask(BONUSPOINT).."<color> ®iÓm, b¹n muèn ®æi phÇn th­ëng nµo?",getn(selTab),selTab);
end;

function askfornum(nType)
	local selTab = {
				"1 nhãm/#giveaward("..nType..",1)",
				"2 nhãm/#giveaward("..nType..",2)",
				"5 nhãm/#giveaward("..nType..",5)",
				"10 nhãm/#giveaward("..nType..",10)",
				"20 nhãm/#giveaward("..nType..",20)",
				" 50 nhãm/#giveaward("..nType..",50)",
				"100 nhãm/#giveaward("..nType..",100)",
				"Ta suy nghÜ l¹i!/wantaward",
				"KÕt thóc ®èi tho¹i/nothing",
				};
	if nType > 6 then
		for i=1,6 do 
			tremove(selTab,2)
		end;
	end;
	Say("B¹n muèn ®æi bao nhiªu nhãm gi¶i th­ëng?",getn(selTab),selTab);
end;

function giveaward(nType,nNum)
	local DecBonusTab = {1,1,5,8,8,15,50,100,500,1000,1500,2000};
	local nRetCode = 0;		
	if GetTask(BONUSPOINT) < DecBonusTab[nType]*nNum then
		Talk(1,"wantaward","Xin lçi! §iÓm tİch lòy cña b¹n kh«ng ®ñ, kh«ng thÓ §æi phÇn th­ëng!");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nType == 1 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,388,nNum);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc b¸nh İt thŞt quay");
		end;
	elseif nType == 2 then
		if GetTask(AWARD_REPUTATION)+nNum > 1000 then
			Talk(1,"wantaward","Xin lçi! HiÖn giê b¹n chØ cã thÓ ®æi tèi ®a <color=yellow>"..(1000-GetTask(AWARD_REPUTATION)).." ®iÓm<color> danh väng.")
			return 0;
		end;
		ModifyReputation(nNum,0);
		Msg2Player("B¹n nhËn ®­îc "..nNum.." ®iÓm danh väng");
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_REPUTATION,GetTask(AWARD_REPUTATION)+nNum);
	elseif nType == 3 then
		if GetTask(AWARD_CSZZ2) < nDate then
			SetTask(AWARD_CSZZ1,0);
		end;
		if GetTask(AWARD_CSZZ1) >= 3 then
			Talk(1,"wantaward","Xin lçi! H«m nay b¹n kh«ng thÓ ®æi phÇn th­ëng, ngµy mai h·y quay l¹i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_CSZZ1,GetTask(AWARD_CSZZ1)+1);
		SetTask(AWARD_CSZZ2,nDate);
		nRetCode = AddItem(2,1,965,nNum)
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc "..nNum.." B¸nh İt x¸ xİu");
		end;
	elseif nType == 4 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,391,nNum)
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc "..nNum.." b¸nh İt thËp cÈm");
		end;
	elseif nType == 5 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,389,nNum)
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc "..nNum.." B¸nh nh©n møt");
		end;
	elseif nType == 6 then
--		if GetTask(AWARD_SLGZ2) < nDate then
--			SetTask(AWARD_SLGZ1,0);
--		end;
--		if GetTask(AWARD_SLGZ1) >= 3 then
--			Talk(1,"wantaward","<color=green>ÈüÁúÖÛÊ¹Õß£º<color>²»ºÃÒâË¼£¬½ñÌìÄã²»ÄÜÔÙ»»È¡Õâ¸ö½±ÀøÁË£¬Äã¿ÉÒÔÃ÷ÌìÔÙ»»¡£");
--			return 0;
--		end;
--		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
--		SetTask(AWARD_SLGZ1,GetTask(AWARD_SLGZ1)+1);
--		SetTask(AWARD_SLGZ2,nDate);
--		nRetCode = AddItem(2,0,392,nNum)
--		if nRetCode == 1 then
--			Msg2Player("ÄúµÃµ½"..nNum.."¸öÊÔÁ¶¹û×Ó");
--			Write_Log("ÁúÖÛ»ı·Ö»»½±Àø",GetName().."µÃµ½ÊÔÁ¶¹û×Ó")
--		else
--			Write_Log("ÁúÖÛ»ı·Ö»»½±Àø´íÎó",GetName().."AddItem(2,0,392,nNum)Ê±·µ»ØÖµÎª:"..nRetCode)
--		end;	
	elseif nType == 7 then
		if GetTask(AWARD_JXZZ2) < nDate then
			SetTask(AWARD_JXZZ1,0);
		end;
		if GetTask(AWARD_JXZZ1) >= 3 then
			Talk(1,"wantaward","Xin lçi! H«m nay b¹n kh«ng thÓ ®æi phÇn th­ëng, ngµy mai h·y quay l¹i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_JXZZ1,GetTask(AWARD_JXZZ1)+1);
		SetTask(AWARD_JXZZ2,nDate);
		nRetCode = AddItem(2,1,392,nNum)
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc "..nNum.." b¸nh İt Gia H­ng");
			Write_Log("®iÓm tİch lòy ®ua thuyÒn ®æi phÇn th­ëng",GetName().."NhËn ®­îc b¸nh İt Gia H­ng")
		else
			Write_Log("®iÓm tİch lòy ®ua thuyÒn ®æi phÇn th­ëng cã sai sãt",GetName().."AddItem(2,1,392,nNum) trŞ quay l¹i:"..nRetCode)
		end;	
	elseif nType == 8 then			--ôÕ×ÓÀñ°ü
		if GetTask(AWARD_ZZLB) < nDate then
			SetTask(AWARD_ZZLB,0);
		end;
		if GetTask(AWARD_ZZLB) ~= 0 then
			Talk(1,"wantaward","Xin lçi! H«m nay b¹n kh«ng thÓ ®æi phÇn th­ëng, ngµy mai h·y quay l¹i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_ZZLB,nDate);
		nRetCode = AddItem(2,1,966,nNum)
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc "..nNum.." tói b¸nh");
		end;
	elseif nType == 9 then	--ôÕ×Ó´óÀñ°ü
		if GetTask(AWARD_ZZDLB3) < nDate then
			SetTask(AWARD_ZZDLB2,0);
		end;
		if GetTask(AWARD_ZZDLB1) >= 5 then
			Talk(1,"wantaward","Xin lçi! B¹n kh«ng thÓ ®æi phÇn th­ëng nµy, xin chän mãn kh¸c.");
			return 0;
		end;
		if GetTask(AWARD_ZZDLB2) >= 3 then
			Talk(1,"wantaward","Xin lçi! H«m nay b¹n kh«ng thÓ ®æi phÇn th­ëng, ngµy mai h·y quay l¹i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_ZZDLB1,GetTask(AWARD_ZZDLB1)+1);
		SetTask(AWARD_ZZDLB2,GetTask(AWARD_ZZDLB2)+1);
		SetTask(AWARD_ZZDLB3,nDate);
		nRetCode = AddItem(2,1,393,nNum)
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc "..nNum.." tói b¸nh lín");
			Write_Log("®iÓm tİch lòy ®ua thuyÒn ®æi phÇn th­ëng",GetName().."NhËn ®­îc bao l× x× b¸nh İt");
		else
			Write_Log("®iÓm tİch lòy ®ua thuyÒn ®æi phÇn th­ëng cã sai sãt",GetName().."AddItem(2,1,393,nNum) trŞ quay l¹i:"..nRetCode)
		end;	
	elseif nType == 10 then
		if GetTask(AWARD_DJSWQZZSC3) < nDate then
			SetTask(AWARD_DJSWQZZSC3,0);
		end;
		if GetTask(AWARD_DJSWQZZSC3) == 0 then
			SetTask(AWARD_DJSWQZZSC2,0);
		end;
		if GetTask(AWARD_DJSWQZZSC1) >= 2 then
			Talk(1,"wantaward","Xin lçi! B¹n kh«ng thÓ ®æi phÇn th­ëng nµy, xin chän mãn kh¸c.");
			return 0;
		end;
		if GetTask(AWARD_DJSWQZZSC2) >= 1 then
			Talk(1,"wantaward","Xin lçi! H«m nay b¹n kh«ng thÓ ®æi phÇn th­ëng, ngµy mai h·y quay l¹i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_DJSWQZZSC1,GetTask(AWARD_DJSWQZZSC1)+1);
		SetTask(AWARD_DJSWQZZSC2,GetTask(AWARD_DJSWQZZSC2)+1);
		SetTask(AWARD_DJSWQZZSC3,nDate);
		nRetCode = AddItem(2,0,397,nNum)
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc sæ tay cña bËc thÇy chÕ vò khİ");
			Write_Log("®iÓm tİch lòy ®ua thuyÒn ®æi phÇn th­ëng",GetName().."B¹n nhËn ®­îc sæ tay cña bËc thÇy chÕ vò khİ");
		else
			Write_Log("®iÓm tİch lòy ®ua thuyÒn ®æi phÇn th­ëng cã sai sãt",GetName().."AddItem(2,0,397,nNum) trŞ quay l¹i:"..nRetCode)
		end;	
	elseif nType == 11 then
		if GetTask(AWARD_HLB3) < nDate then
			SetTask(AWARD_HLB2,0);
		end;
		if GetTask(AWARD_HLB1) >= 1 then
			Talk(1,"wantaward","Xin lçi! B¹n kh«ng thÓ ®æi phÇn th­ëng nµy, xin chän mãn kh¸c.");
			return 0;
		end;
		if GetTask(AWARD_HLB2) >= 1 then
			Talk(1,"wantaward","Xin lçi! H«m nay b¹n kh«ng thÓ ®æi phÇn th­ëng, ngµy mai h·y quay l¹i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_HLB1,GetTask(AWARD_HLB1)+1);
		SetTask(AWARD_HLB2,GetTask(AWARD_HLB2)+1);
		SetTask(AWARD_HLB3,nDate);
		nRetCode = AddItem(0,105,12,nNum,1,-1,-1,-1,-1,-1,-1)
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc Hèt L«i B¸c");
			Write_Log("®iÓm tİch lòy ®ua thuyÒn ®æi phÇn th­ëng",GetName().."NhËn ®­îc Hèt L«i B¸c");
		else
			Write_Log("®iÓm tİch lòy ®ua thuyÒn ®æi phÇn th­ëng cã sai sãt",GetName().."AddItem(0,105,12,nNum) trŞ quay l¹i:"..nRetCode)
		end;
	elseif nType == 12 then
		if GetTask(AWARD_QYZP) == 1 then
			Talk(1,"wantaward","B¹n ®· ®æi qua phÇn th­ëng nµy, kh«ng thÓ ®æi n÷a. H·y chän phÇn th­ëng kh¸c.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_QYZP,1);
		nRetCode = AddItem(0,102,27,nNum,1,-1,-1,-1,-1,-1,-1);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc KhuÊt Nguyªn Ngäc Béi");
			Write_Log("®iÓm tİch lòy ®ua thuyÒn ®æi phÇn th­ëng",GetName().."NhËn ®­îc KhuÊt Nguyªn Ngäc Béi");
		else
			Write_Log("®iÓm tİch lòy ®ua thuyÒn ®æi phÇn th­ëng cã sai sãt",GetName().."AddItem(0,102,27,nNum) trŞ quay l¹i:"..nRetCode)
		end;
	else
		Write_Log("§æi phÇn th­ëng tÕt §oan Ngä cã sai sãt","Lo¹i h×nh gi¶i th­ëng cã sai sãt, trŞ sè lo¹i h×nh lµ:"..nType);
	end;
	wantaward();
end;

function knowaward()
	local selTab = {
			"sè lÇn giíi h¹n §æi phÇn th­ëng /seerestriction1",
			"Quay l¹i ®èi tho¹i trªn/seebonus",
			"KÕt thóc ®èi tho¹i/nothing",
			}
	Say("B¹n cã thÓ tham gia thi ®Êu thuyÒn Rång ®Ó nhËn ®iÓm tİch lòy, sau ®ã b¹n cã thÓ lÊy ®iÓm th­ëng ®æi phÇn th­ëng. Chó ı! Cã mét sè phÇn th­ëng kh«ng cã h¹n chÕ sè lÇn ®æi vµ ng­îc l¹i, còng cã mét sè phÇn th­ëng chØ cho ®æi tæng céng vµi lÇn, chi tiÕt xin tham kh¶o <color=yellow>sè lÇn h¹n chÕ ®æi phÇn th­ëng<color>.",getn(selTab),selTab);
end;

function seerestriction1()
	Talk(1,"seerestriction2","B¸nh İt nh©n thŞt: kh«ng h¹n chÕ sè lÇn ®æi<enter>Danh väng: tèi ®a cã thÓ ®æi <color=yellow>1000 ®iÓm<color><enter>B¸nh İt x¸ xİu: mçi ngµy ®­îc ®æi tèi ®a <color=yellow>3 lÇn<color><enter>B¸nh İt ThËp cÈm: kh«ng h¹n chÕ sè lÇn ®æi<enter>B¸nh İt nh©n møt: kh«ng h¹n chÕ sè lÇn ®æi<enter>B¸nh İt Gia H­ng: mçi ngµy ®æi t«i ®a <color=yellow>3 lÇn<color>");
end;

function seerestriction2()
	Talk(1,"seebonus","LÔ bao b¸nh İt: mçi ngµy ®æi tèi ®a <color=yellow>1 lÇn<color><enter>§¹i LÔ bao b¸nh İt: tèi ®a ®æi ®­îc <color=yellow>5 lÇn<color>, mçi ngµy ®æi tèi ®a <color=yellow>3 lÇn<color><enter>Sæ tay chÕ t¸c vò khİ §¹i T­îng s­: tèi ®a ®æi ®­îc <color=yellow>2 lÇn<color>, mçi ngµy ®æi tèi ®a <color=yellow>1 lÇn<color><enter>Hèt L«i B¸c: tèi ®a ®æi ®­îc <color=yellow>1 lÇn<color><enter>KhuÊt Nguyªn Béi: tèi ®a chØ ®æi ®­îc <color=yellow>1 lÇn<color>");
end;

function knowdetail()
	Talk(1,"knowdetail1","Mïng 5 th¸ng 5 ¢m lŞch lµ TÕt §oan Ngä truyÒn thèng. ThÕ giíi trong VLTK 2 còng sÏ ®Çy mµu s¾c nh­ tÕt §oan Ngä. §­¬ng nhiªn sÏ kh«ng thÓ thiÕu lÔ héi ®ua thuyÒn Rång vµ ¨n b¸nh İt.");
end;

function knowdetail1()
	Talk(1,"knowdetail2","Thêi gian ho¹t ®éng: <enter>Tõ <color=yellow>30 th¸ng: mçi ngµy cã hai trËn tõ 13h-15h vµ 19h-23h<color><enter>Yªu cÇu: kh«ng ph¶i lµ ng­êi ch¬i tªn ch÷ tr¾ng");
end;
function knowdetail2()
	Talk(1,"knowdetail3","<color=green>Ho¹t ®éng 1: B¸nh İt<color>:<enter>Mçi ngµy hoµn thµnh <color=yellow>3 trËn<color> thi ®Êu thuyÒn Rång cã thÓ ®Õn gÆp Long Chu sø gi¶ nhËn b¸nh İt nÕp, sö dông cã thÓ nhËn ®­îc ®iÓm kinh nghiÖm vµ 5 ®iÓm danh väng. Ngoµi ra cßn cã thÓ nhËn ®­îc sè b¸nh İt trøng muèi b»ng víi sè trËn tham gia, sö dông b¸nh İt trøng  muèi sÏ nhËn ®­îc phÇn th­ëng hoÆc hiÖu qu¶ ngÉu nhiªn");
end;
function knowdetail3()
	Talk(1,"knowdetail4","Ho¹t ®éng thø 2-§ua thuyÒn Rång: <enter>Thu thËp ®ñ nguyªn liÖu t×m Long Chu sø gi¶ chän chÕ t¹o thuyÒn Rång. Long Chu sø gi¶ sÏ lµm cho b¹n mét chiÕc thuyÒn Rång. Tû lÖ lµm ra thuyÒn Rång phæ th«ng lµ rÊt cao. Tr­íc tiªn chän tham gia thi ®Êu sau ®ã chän tr­êng ®Êu b¹n muèn vµo. 4 phót 30 gi©y sau khi ng­êi ®Çu tiªn vµo tr­êng ®Êu hoÆc sè ng­êi b¸o danh ®ñ 8 ng­êi sÏ chİnh thøc thi ®Êu. Khi ng­êi ch¬i b¸o danh yªu cÇu kh«ng mang vò khİ trang bŞ, nãn, ¸m khİ, ¸o, quÇn, nhÉn, mËt tŞch nh­ng cã thÓ trang bŞ ngo¹i trang ®ång thêi nhÊt ®Şnh ph¶i cã 1 chiÕc thuyÒn Rång trong hµnh trang.");
end;
function knowdetail4()
	Talk(1,"knowdetail5","Sau khi vµo tr­êng ®Êu, b¹n sÏ vµo khu vùc xuÊt ph¸t mÆc ®Şnh ®Ó chê xuÊt ph¸t. Sau khi cuéc thi chuÈn bŞ b¾t ®Çu sÏ cã 30 gi©y ®Ó chuÈn bŞ. Trong thêi gian chuÈn bŞ, tuyÓn thñ trang bŞ thuyÒn Rång ®Ó hÕt thêi gian chuÈn bŞ sÏ xuÊt ph¸t. Trong qu¸ tr×nh thi ®Êu tuyÓn thñ kh«ng thÓ trang bŞ bÊt cø trang bŞ vµ kh«ng thÓ ®æi thuyÒn Rång kh¸c hoÆc bá thuyÒn Rång. Sau khi vÒ ®İch tuyÓn thñ sÏ trë l¹i tr¹ng th¸i b×nh th­êng.");
end;
function knowdetail5()
	Talk(1,"knowdetail6","Trong qu¸ tr×nh thi ®Êu, tuyÓn thñ cã thÓ sö dông kü n¨ng mµ thuyÒn Rång cã. Trong khu vùc thi ®Êu cã c¸c cæng nhá ®­îc t¹o thµnh bëi c¸c c©y cê nhiÒu mµu s¾c, nÕu lÇn l­ît v­ît qua 2 cæng nhá th× cã thÓ nhËn ®­îc hiÖu qu¶ ®Æc ®Şnh. Xin chó ı: Kú m«n mµu Xanh, §á, Vµng lµ hiÖu qu¶ chİnh diÖn. Cßn cê mµu Cam vµ mµu Tİm nÕu v­ît qua sÏ bÊt lîi cho b¶n th©n. Trong khu vùc thi ®Êu sÏ xuÊt hiÖn ngÉu nhiªn 1 lo¹i b¶o r­¬ng, khi më b¶o r­¬ng sÏ nhËn ®­îc hiÖu qu¶ ngÉu nhiªn. Thi ®Êu thuyÒn Rång c¨n cø vµo thø tù c¸c tuyÓn thñ vÒ ®İch lµm kÕt qu¶.");
end;
function knowdetail6()
	Talk(1,"main","Quy t¾c thi ®Êu nh­ sau theo sè ng­êi nh­ sau, sè ®iÓm ®­îc th­ëng theo thø tù tõ cao ®Õn thÊp. <enter>Sè ng­êi thi ®Êu lµ 2: 1, 0. <enter>Sè ng­êi thi ®Êu lµ 3: 2, 1, 0. <enter>Sè ng­êi thi ®Êu lµ 4: 2, 1, 1, 0. <enter>Sè ng­êi thi ®Êu lµ 5: 3, 2, 1, 0, 0. <enter>Sè ng­êi thi ®Êu lµ 6: 3, 2, 1, 1, 0, 0. <enter>Sè ng­êi thi ®Êu lµ 7: 4, 3, 4, 1, 1, 0, 0. <enter>Sè ng­êi thi ®Êu lµ 8: 5, 4, 3, 2, 1, 1, 0, 0.");
end;

--¼ì²éÉíÉÏÊÇ·ñ×°ÓĞÍâ×°Ö®ÍâµÄ×°±¸
function checkequipment()
	for i=0,11 do
		if i~= 6 and i~= 7 and i~= 8 then
			local nGenre,nDetail,nParticular = GetPlayerEquipInfo(i);
			if nGenre ~= 0 or nDetail ~= 0 or nParticular ~= 0 then
				return 0;
			end;
		end;
	end;
	return 1;
end;
--¼ì²é±³°üÀïÃæÊÇ·ñÓĞÁúÖÛ
function checkboat()
	for i=25,31 do
		if GetItemCount(0,105,i) >= 1 then
			return 1;
		end;
	end;
	return 0;
end;

function wantboat()
	local selTab = {
			"ChÕ t¹o thuyÒn Rång/makeboat",
			"Giíi thiÖu thuyÒn Rång/knowboat",
			"Quay l¹i/main",
			"KÕt thóc ®èi tho¹i/nothing"
			}
	Say("Ng­¬i h·y gióp ta thu thËp <color=yellow>10 Chu Sa vµ 10 ®u«i Thá<color>, ta sÏ chÕ t¹o gióp ng­¬i 1 chiÕc thuyÒn Rång.",getn(selTab),selTab);
end;

function makeboat()
	if DelItem(2,2,30,10) == 1 and DelItem(2,1,2,10) == 1 then
		local nRandomNum = random(1,100);
		local nType = 0;
		if nRandomNum <= 50 then
			AddItem(0,105,25,1);
			nType = 1;
		else
			AddItem(0,105,29,1);
			nType = 5;
		end;
		Msg2Player("B¹n nhËn ®­îc 1 chiÕc"..BoatInfo[nType][1]);
	else
		Talk(1,"","Xin lçi! Ng­¬i kh«ng cã thø ta cÇn, ta kh«ng thÓ gióp ng­¬i lµm thuyÒn Rång.");
	end;
end;

function knowboat()
	local selTab = {};
	for i=1,getn(BoatInfo) do
		selTab[i] = BoatInfo[i][1].."/#knowboatdetail("..i..")";
	end;
	selTab[getn(selTab)+1] = "Quay l¹i ®èi tho¹i trªn/wantboat";
	selTab[getn(selTab)+1] = "KÕt thóc ®èi tho¹i/nothing";
	Say("Kh¸ch quan muèn t×m hiÓu lo¹i thuyÒn Rång nµo?",getn(selTab),selTab);
end;

function knowboatdetail(nType)
	local sContent = ""
	if nType > 7 or nType <= 0 then
		Write_Log("Ho¹t ®éng tÕt §oan Ngä sai sãt","Lo¹i thuyÒn rång sai! Tªn nh©n vËt:"..GetName())
		return 0;
	end;
	sConten = "<color=yellow>"..BoatInfo[nType][1].."<color>:"..BoatInfo[nType][2];
	Talk(1,"knowboat",sConten);
end;

function wantzongzi()
	local selTab = {
				"Ta muèn l·nh b¸nh İt trøng Æn/givexdzz",
				"Ta muèn l·nh b¸nh İt g¹o nÕp/givenmzz",
				"NhËn t©m ®¾c giang hå/givediary",
				"Ta sÏ quay l¹i sau/main",
				};
	local nCount = GetTask(ATTENDCOUNTPERDAY1);
	Say("Tæng céng b¹n ®· tham gia <color=yellow>"..GetTask(ATTENDCOUNT).."<color> trËn thi ®Êu, nhËn ®­îc <color=yellow>"..GetTask(GETXDZZCOUNT).."c¸i<color> b¸nh İt muèi mÆn, cßn cã thÓ l·nh <color=yellow>"..(GetTask(ATTENDCOUNT)-GetTask(GETXDZZCOUNT)).."<color> c¸i. H«m nay b¹n ®· tham gia thi ®Êu thuyÒn Rång <color=yellow>"..nCount.."<color> lÇn ®Êu thuyÒn rång, chØ cÇn <color=yellow>tham gia 3 trËn hoÆc nhiÒu h¬n<color> lµ cã thÓ nhËn b¸nh İt nÕp, <color=yellow>1 ngµy chØ nhËn ®­îc 1 lÇn<color>! Mçi lÇn tham gia ®Òu nhËn ®­îc 1 quyÓn t©m ®¾c giang hå, tèi ®a 4 quyÓn, nhËn chø?",getn(selTab),selTab);
end;

function givediary()
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","Xin kiÓm tra kho¶ng trèng hµnh trang vµ søc lùc!");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(AWARD_DIARY2) < nDate then
		SetTask(AWARD_DIARY1,0);
	end;
	if GetTask(AWARD_DIARY1) >= GetTask(ATTENDCOUNTPERDAY1) then
		Talk(1,"wantzongzi","Xin lçi! Sè lÇn tham gia thi ®Êu ngµy h«m nay kh«ng ®ñ ®Ó nhËn t©m ®¾c giang hå.");
		return 0;
	end;
	if GetTask(AWARD_DIARY1) >= 4 then
		Talk(1,"wantzongzi","Xin lçi! Ng­¬i ®· nhËn <color=yellow>4 quyÓn<color> t©m ®¾c giang hå, ngµy mai h·y quay l¹i!");
		return 0;
	end;
	SetTask(AWARD_DIARY1,GetTask(AWARD_DIARY1)+1);
	SetTask(AWARD_DIARY2,nDate);
	nRetCode = AddItem(2,1,967,1)
	if nRetCode == 1 then
--		Msg2Player("ÄúµÃµ½Ò»±¾½­ºşĞÄµÃ");
	end;	
end;

function givexdzz()
	if GetTask(GETXDZZCOUNT) >= GetTask(ATTENDCOUNT) then
		Talk(1,"wantzongzi","Xin lçi! Kh¸ch quan ®· l·nh hÕt b¸nh İt muèi mÆn! Hh·y tham gia thi ®Êu thuyÒn Rång tiÕp råi quay l¹i nhĞ!");
		return 0;
	end;
	local nZzLeft = GetTask(ATTENDCOUNT) - GetTask(GETXDZZCOUNT);
	local selTab = {
			"Ta muèn l·nh 1 b¸nh İt muèi mÆn/giveonexdzz",
			"Ta muèn l·nh toµn bé ("..nZzLeft.." c¸i) b¸nh İt muèi mÆn/giveallxdzz",
			"LÇn sau h·y l·nh/main",
			}
	Say("B¹n muèn l·nh bao nhiªu b¸nh İt muèi mÆn?",getn(selTab),selTab);
end;

function giveonexdzz()
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","Xin kiÓm tra kho¶ng trèng hµnh trang vµ søc lùc!");
		return 0;
	end;
	SetTask(GETXDZZCOUNT,GetTask(GETXDZZCOUNT)+1);
	if AddItem(2,1,390,1) == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 b¸nh İt muèi mÆn");
	end;
end;

function giveallxdzz()
	local nZzLeft = GetTask(ATTENDCOUNT) - GetTask(GETXDZZCOUNT);
	if GetFreeItemRoom() <= 2 or GetMaxItemWeight()-GetCurItemWeight() <= nZzLeft then
		Talk(1,"main","Xin kiÓm tra kho¶ng trèng hµnh trang vµ søc lùc!");
		return 0;
	end;
	SetTask(GETXDZZCOUNT,GetTask(ATTENDCOUNT));
	if AddItem(2,1,390,nZzLeft) == 1 then
		Msg2Player("B¹n nhËn ®­îc "..nZzLeft.." B¸nh İt muèi mÆn");
	end;
end;

function givenmzz()
	if GetTask(ATTENDCOUNTPERDAY3) ~= 0 then
		Talk(1,"main","H«m nay b¹n ®· l·nh b¸nh İt g¹o nÕp råi, ngµy mai h·y quay l¹i.");
		return 0;
	end;
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","Xin kiÓm tra kho¶ng trèng hµnh trang vµ søc lùc!");
		return 0;
	end;
	if GetTask(ATTENDCOUNTPERDAY1) >= 3 then
		SetTask(ATTENDCOUNTPERDAY3,1);
		local nRetCode = AddItem(2,1,394,1);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 b¸nh İt g¹o nÕp");
			Write_Log("NhËn b¸nh İt g¹o nÕp",GetName().."®· nhËn 1 b¸nh İt g¹o nÕp");
			Talk(1,"main","b¸nh İt g¹o nÕp míi ra lß ®©y, ®¹i hiÖp h·y nhËn lÊy.");
		elseif nRetCode == 2 then
			Write_Log("NhËn b¸nh İt g¹o nÕp",GetName().."Khi nhËn b¸nh İt g¹o nÕp, b¸nh İt g¹o nÕp r¬i xuèng ®Êt, cßn ¨n ®­îc kh«ng?");
		else
			Write_Log("Lçi nhËn b¸nh İt g¹o nÕp",GetName().."NhËn b¸nh İt g¹o nÕp thÊt b¹i");
		end;
	else
		Talk(1,"main","Xin lçi! Sè lÇn b¹n thi ®Êu thuyÒn Rång h«m nµy qu¸ İt, b¹n ph¶i tham gia İt nhÊt <color=yellow>3 trËn<color> míi cã thÓ nhËn b¸nh İt g¹o nÕp.");
	end;
end;

function wantzhinan()
	if GetItemCount(2,0,396) == 0 then
		AddItem(2,0,396,1);	--ÁúÖÛÈüÖ¸ÄÏ
		Msg2Player("B¹n nhËn ®­îc 1 quyÓn h­íng dÉn thi ®Êu thuyÒn Rång");
	else
		Talk(1,"main","Kh«ng ph¶i b¹n cã quyÓn h­íng dÉn thi ®Êu thuyÒn Rång?");
	end;
end;

function Get_Room_Count_Info()
	local RoomTab = Init_Room();
	local nIdelCounter,nReadyCounte,nMatchingCounter = 0,0,0;
	for i=1,g_TotalRoomNum do
		if RoomTab[i]:GetRoomState() == MS_STATE_IDLE then
			nIdelCounter = nIdelCounter + 1;
		end;
		if RoomTab[i]:GetRoomState() == MS_STATE_WAITSIGNUP then
			nReadyCounte = nReadyCounte + 1;
		end;
		if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSTART then
			nMatchingCounter = nMatchingCounter + 1;
		end;
	end;
	return nIdelCounter,nReadyCounte,nMatchingCounter;
end;
