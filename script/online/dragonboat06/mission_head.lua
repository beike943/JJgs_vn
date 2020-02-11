--File name:mission_head.lua
--Describe:mission½Å±¾Í·ÎÄ¼þ
--Create Date:2006-4-18
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\shinynight_head.lua");
--============================================================================
MISSION_ID = 22;
--=========================Mission Timer======================================
READY_TIMER_ID = 41;
READY_TIME = 30*18;	--±¨ÃûµÈ´ýÊ±¼ä£º£´·Ö£³£°Ãë£¬£³£°Ãë±¨Ê±Ò»´Î
READY_TIMER_LOOP = 8;	--¹²±¨

WAITSTART_TIMER_ID = 42;
WAITSTART_TIME = 5*18;	--µÈ´ý¿ªÊ¼Ê±¼ä£ºÃ¿£µÃë±¨Ê±Ò»´Î£¬¹²£³£°Ãë
WAITSTART_TIMER_LOOP = 5;	--¹²±¨£µ´Î

MATCH_TIMER_ID = 43
MATCH_TIME = 30*18;	--±ÈÈüÊ±¼ä£ºÃ¿£³£°Ãë±¨Ê±Ò»´Î£¬¹²10·ÖÖÓ
MATCH_TIMER_LOOP = 19;	--¹²±¨£±£¹´Î

WAITSTOP_TIMER_ID = 44;
WAITSTOP_TIME = 10*18;	--¾ö³öµÚÒ»ÃûºóµÈ´ýÊ±¼ä£ºÃ¿£±£°Ãë±¨Ê±Ò»´Î£¬¹²£±·ÖÖÓ
WAITSTOP_TIMER_LOOP = 5;	--¹²±¨£µ´Î

WAITOUT_TIMER_ID = 45;
WAITOUT_TIME = 30*18;	--¹«²¼³É¼¨ºóµÈ´ý´«ËÍ³öÈ¥µÄÊ±¼ä£º£³£°Ãë
--============================================================================
MAXPLAYER = 8;	--±ÈÈüÖ§³ÖµÄ×î´óÍæ¼ÒÊý
LEASTPLAYER = 2; --±ÈÈüÖ§³ÖµÄ×îÐ¡Íæ¼ÒÊý
--========================MissionValue========================================
MV_ROOMSTATE = 1;	--¼ÇÂ¼·¿¼äµ±Ç°Ëù´¦µÄ×´Ì¬£¬£°±íÊ¾³¡ÄÚÃ»ÓÐÍæ¼Ò£¬£±±íÊ¾´¦ÓÚ±¨Ãû½×¶Î£¨ÓÐÍæ¼Ò£©
					--£²±íÊ¾±ÈÈü¿ªÊ¼Ç°µÄµ¹¼ÆÊ±½×¶Î£¬£³±íÊ¾±ÈÈüÖÐ£¬£´±íÊ¾¾ö³öÁËµÚÒ»Ãû
					--£µ±íÊ¾¹«²¼±ÈÈü½á¹û£¬µÈ´ýÀë³¡
MV_COMPLETENUM = 2;	--¼ÇÂ¼³åÏßµÄÈËÊý
MV_TIMELEFT = 3;	--Timer±¨Ê±´ÎÊý
MV_ENTERORDER = 4; 	--¼ÇÂ¼±ÈÈü¿ªÊ¼Ç°ÓÐ¶àÉÙÍæ¼Ò½øÈë¹ý³¡µØ
MV_GAMELOOP = 5 --¼ÇÂ¼ÓÎÏ·¿ªÊ¼Ê±µÄÑ­»·Ö¡Êý
MV_GAMEID = 6 --¼ÇÂ¼±ÈÈüµÄID
--============================================================================
--========================Mission Match State=================================
MS_STATE_IDLE = 0;		--µÈ´ý±¨Ãû£¨»¹Ã»ÓÐÍæ¼Ò½ø³¡£©
MS_STATE_WAITSIGNUP = 1;--µÈ´ý±¨Ãû£¨ÓÐÍæ¼Ò½ø³¡ÁË£©
MS_STATE_WAITSTART = 2;	--±¨Ãû½ØÖ¹£¬µÈ´ý±ÈÈü¿ªÊ¼
MS_STATE_STARTED = 3;	--±ÈÈüÒÑ¾­¿ªÊ¼
MS_STATE_WAITCOMPLETE = 4	--µÈ´ýÍæ¼ÒÍê³É±ÈÈü£¨Éú²úµÚÒ»ÃûÖ®ºó£©
MS_STATE_WAITOUT = 5;	--ËùÓÐÍæ¼Ò¶¼Íê³É±ÈÈü»òÕß±ÈÈü½áÊøÊ±¼äÒÑµ½
--============================================================================
CAMP_ALL = 0;	--È«²¿ÕóÓª
CAMP_AUDIENCE = 1;
CAMP_PLAYER = 2;	--Íæ¼Ò¼ÓÈëµÄMissionÕóÓª
--============================================================================
LOOPCOUNT = 1;
TRAPCOUNT = 49*LOOPCOUNT;	--TRAPµãÊýÄ¿¡£Ò»È¦ÓÐ49¸ö
--============================================================================
BonusTab = {
		[1] = {1},
		[2] = {1,0},
		[3] = {2,1,0},
		[4] = {2,1,1,0},
		[5] = {3,2,1,0,0},
		[6] = {3,2,1,1,0,0},
		[7] = {4,3,2,1,1,0,0},
		[8] = {5,4,3,2,1,1,0,0},
		}
--============================================================================
--Íæ¼Ò½øÈë±ÈÈü³¡µØÊ±ÐèÒª½øÐÐÒÔÏÂ²Ù×÷
function Set_Player_State()
	LeaveTeam();	--Àë¿ª¶ÓÎé
	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊÐÖØÉúµã
	SetDeathPunish(0);	--ÎÞËÀÍö³Í·£
	SetCreateTeam(1);	--¹Ø±Õ×é½¨¶ÓÎé(ÏÂÏßºó»á±»Çåµô)
	ForbitTrade(1);	--½ûÖ¹½»Ò×
	InteractiveEnable(0);	--¹Ø±Õ½»»¥	±ØÐëÔÚNewWorldÖ®ºóÖ´ÐÐ²ÅÓÐÐ§
	StallEnable(0);	--½ûÖ¹°ÚÌ¯(ÏÂÏßºó»á±»Çåµô)
	UseScrollEnable(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	SetPKFlag(0,0);	--ÉèÖÃÎªÁ·¼¶×´Ì¬
	RemoveRevivals();	--É¾³ý£µ¶¾±¦±¦
	ForbidChangePK(1);	--½ûÖ¹¸Ä±äPK×´Ì¬
	RemvoeTempEffect();	--Çå³ýËùÓÐÁÙÊ±×´Ì¬£¬ÈçÁ÷Ë®£¬ÔÎ£¬»ìÂÒµÈ
	CastState("state_ignore_poison_damage",100,15*60*18,1,2000);
	SetTask(STATUS,CAMP_PLAYER);--ÉèÖÃÉí·ÝÎª²ÎÈüÑ¡ÊÖ
	SetTask(FINISHTIME,999999999);
	SetDeathScript("\\script\\online\\dragonboat06\\playerdeath.lua");	
end;
--Íæ¼ÒÀë¿ª±ÈÈü³¡µØÊ±ÐèÒª½øÐÐÒÔÏÂ²Ù×÷
function Restore_Player_State()
	SetLogoutRV(0);	--ÉèÖÃµÇÂ½µãÎªÏÂÏßµã
	SetDeathPunish(1);	--ÓÐËÀÍö³Í·£
	SetCreateTeam(0);	--¿ÉÒÔ´´½¨¶ÓÎé
	ForbitTrade(0);	--ÔÊÐí½»Ò×
	InteractiveEnable(1);	--¿ÉÒÔ½øÐÐ½»»¥
	StallEnable(1);	--ÔÊÐí°ÚÌ¯
	UseScrollEnable(1);	--¿ÉÒÔÊ¹ÓÃ»Ø³Ç·û
	SetFightState(0);	--ÉèÖÃÎªºÍÆ½×´Ì¬
	ForbidChangePK(0);	--ÔÊÐí¸Ä±äPK×´Ì¬
	SetPKFlag(0,0);	--ÉèÖÃPKÎªÁ·¹¦×´Ì¬
	--ÒÔÏÂÊÇÉèÖÃÈÎÎñ±äÁ¿
	SetTask(STATUS,0);
	SetTask(POSITION,0);
	SetTask(RANK,MAXPLAYER);	--×îºóÒ»Ãû
	SetTask(ENTERORDER,0);
	SetTask(FLAG_COLOR,0);
	SetTask(FINISHTIME,999999999);	--ÉèÖÃÒ»¸ö´óÊý±íÊ¾Ã»ÓÐÊ±¼ä
	RemvoeTempEffect();	--Çå³ýËùÓÐÁÙÊ±×´Ì¬£¬ÈçÁ÷Ë®£¬ÔÎ£¬»ìÂÒµÈ
	for i=FLAG_BEGIN,FLAG_END do	--Çå³ýÔø´©¹ýµÄÆì×ÓµÄ¼ÇÂ¼
		SetTask(i,0);
	end;
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	local bOnIBBoat = 0;
	if nGenre == 0 and nDetail ==105 then	--ÅÐ¶ÏÊÇ²»ÊÇÔÚIBÁúÖÛ
		for i=26,31 do
			if nParticular ~= 29 and nParticular == i then
				bOnIBBoat = 1;	--ÊÇ
				break;
			end;
		end;
	end;
	if bOnIBBoat == 1 then	--Èç¹ûÔÚIBÁúÖÛ¾ÍÉ¾µôËü
		local nItemIdx = GetPlayerEquipIndex(10);
		local nState = GetMissionV(MV_ROOMSTATE);
		--ÒÔÏÂ×´Ì¬²Å¿ÛÁúÖÛ
		if nState == MS_STATE_STARTED or nState == MS_STATE_WAITCOMPLETE or nState == MS_STATE_WAITOUT then
			DelItemByIndex(nItemIdx,-1)
		end;
	end;
	local RetCode = UnEquipAtPosition(10);
	if RetCode == 0 then
		Write_Log("Lçi lÊy trang bÞ",GetName().."UnEquipAtPosition trÞ hµm sè quay l¹i 0");
	elseif RetCode == 2 then
		Msg2Player("Do khi rêi khái tr­êng ®Êu hµnh trang b¹n kh«ng cßn kho¶ng trèng hoÆc v¸c qu¸ nÆng, thuyÒn Rång cña b¹n ®µnh ph¶i bá xuèng ®Êt.")
	end;
	for i=854,859 do
		if HaveLearnedSkill(i) == 1 then
			RemoveSkill(i);
		end
	end;
	CastState("state_ignore_poison_damage",0,15*60*18,1,2000);
	SetDeathScript("");
end;
--°´Ãû´Î·¢½±
function Give_Award()
	local rankTab = Get_Rank();
	local nDate = tonumber(date("%y%m%d"));
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER);

	-- »Ô»ÍÖ®Ò¹»ý·Ö·­±¶µÄ±¶ÂÊ
	local multiple = get_reward_multiple(SYS_DRAGONBOAT)
	if Get_Multiple_Status() == 1 then
		multiple = multiple*MULTIPLE;	--¶à±¶½±Àø¡£ÕâÀï³ËÒÔ»Ô»ÍÖ®Ò¹µÄ±¶ÂÊ¾ÍÐÐÁË
	end;
	for i=1,getn(rankTab) do
		PlayerIndex = rankTab[i];
		if PlayerIndex > 0 then
			SetTask(ATTENDCOUNT,GetTask(ATTENDCOUNT)+1);	--¼ÇÂ¼ÄÃ½±µÄ´ÎÊý
			SetTask(ATTENDCOUNTPERDAY1,GetTask(ATTENDCOUNTPERDAY1)+1);	--µ±ÌìÄÃ½±´ÎÊý
			-- Ê¦Í½ÈÎÎñ£¨ÁúÖÛ£©
			local nChance, nMaxChance = CustomDataRead("mp_longzhou")
			if nChance ~= nil then
				nChance = nChance + 1
				if nChance < nMaxChance then
					CustomDataSave("mp_longzhou", "dd", nChance, nMaxChance)
					Msg2Player("NhiÖm vô S­ ®å-ThuyÒn rång hoµn thµnh nhiÖm vô:"..nChance.."/"..nMaxChance)
				else
					PrenticeCompleteTask()
				end
			end
			SetTask(ATTENDCOUNTPERDAY2,nDate);	--¼ÇÂ¼ÈÕÆÚ
			-- »Ô»ÍÖ®Ò¹»ý·Ö·­±¶
			local score = BonusTab[nPlayerCount][i] * multiple
			SetTask(BONUSPOINT,GetTask(BONUSPOINT)+score);	--½±Àø»ý·Ö
			Write_Log("Ho¹t ®éng tÕt §oan Ngä"," "..GetAccount().."\t"..GetName().."\t".."obtain "..score.." score.");
		else
			Write_Log("Ho¹t ®éng §oan Ngä sai sãt","mission_head.lua,Give_Award() hµm sè rankTab ng­êi ch¬i nhá h¬n hoÆc b»ng 0");
		end;
	end;
end;
--·µ»ØÅÅºÃÃûµÄÊý×é£¬Êý×éÔªËØÎªÍæ¼ÒË÷Òý
function Get_Rank()
	local TotalPlayerCount = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER);	
	local IDTab = {};	
	local msidx = 0;
	local sidx = 0;
	for i=1,TotalPlayerCount do
		msidx,sidx = GetNextPlayer(MISSION_ID,msidx,CAMP_PLAYER);
		if sidx > 0 then
			IDTab[i] = sidx;
		end
	end
	if TotalPlayerCount ~= getn(IDTab) then
		Write_Log("Ho¹t ®éng §oan Ngä sai sãt","trong hµm sè Get_Rank, lçi khi liÖt ra tÊt c¶ ng­êi ch¬i.");
	end;
	local SortedTab = Sort_By_Rank(IDTab);
	if TotalPlayerCount ~= getn(SortedTab) then
		Write_Log("Ho¹t ®éng §oan Ngä sai sãt","Get_Rank trong hµm sè Sort_By_Rank ng­êi ch¬i cã hµm sè quay l¹i table b¸o lçi.");
	end;
	return SortedTab;
end;
--ÒÔÍæ¼ÒµÄË÷ÒýÊý×é×÷ÎªÊäÈë²ÎÊý£¬°´ÕÕÒ»¶¨µÄ¹æÔòÀ´ÅÅÐò
--¹æÔòÎª£ºÏÈ°´µ½´ïÖÕµãµÄÏÈºóÅÅÐò¡£Èç¹ûÃ»µ½ÖÕµãµÄ¾Í¼ÆËãµ±Ç°Î»ÖÃ£¬Èç¹ûÎ»ÖÃÏàÍ¬Ôò¼ÆËã»ý·Ö£¬
--»ý·ÖÉÙµÄÅÅÇ°Ãæ£¬Èç¹û»ý·ÖÒ²ÏàÍ¬°´±¨ÃûÏÈºóÅÅÐò¡£
function Sort_By_Rank(TempTab)
	local tempIndex;
	local OldPlayerIndex = PlayerIndex;
	for i=1,getn(TempTab)-1 do
		local bXChanged = 0; 
		for i=1,getn(TempTab)-1 do
			local nTime1,nTime2 = 0,0;
			PlayerIndex = TempTab[i];
			nTime1 = GetTask(FINISHTIME);
			PlayerIndex = TempTab[i+1];
			nTime2 = GetTask(FINISHTIME);
			if nTime1 > nTime2 then	--Èç¹ûÊ±¼ä1±ÈÊ±¼ä2´óµÄ»°£¬¾Í½»»»
				tempIndex = TempTab[i+1];
				TempTab[i+1] = TempTab[i];
				TempTab[i] = tempIndex;
				bXChanged = 1;			
			elseif nTime1 == nTime2 then
				local nPos1,nPos2 = 0,0;
				PlayerIndex = TempTab[i];
				nPos1 = GetTask(POSITION);
				PlayerIndex = TempTab[i+1];
				nPos2 = GetTask(POSITION);
				if nPos1 < nPos2 then	--Èç¹ûÎ»ÖÃ1±ÈÎ»ÖÃ2Ð¡µÄ»°£¬¾Í½»»»
					tempIndex = TempTab[i+1];
					TempTab[i+1] = TempTab[i];
					TempTab[i] = tempIndex;
					bXChanged = 1;	
				elseif nPos1 == nPos2 then
					local nBonus1,nBonus2 = 0,0;
					PlayerIndex = TempTab[i];
					nBonus1 = GetTask(BONUSPOINT);
					PlayerIndex = TempTab[i+1];
					nBonus2 = GetTask(BONUSPOINT);
					if nBonus1 > nBonus2 then	--Èç¹û»ý·Ö1±È»ý·Ö2´óµÄ»°£¬¾Í½»»»
						tempIndex = TempTab[i+1];
						TempTab[i+1] = TempTab[i];
						TempTab[i] = tempIndex;
						bXChanged = 1;						
					elseif nBonus1 == nBonus2 then
						local nEnter1,nEnter2 = 0,0;
						PlayerIndex = TempTab[i];
						nEnter1 = GetTask(ENTERORDER);
						PlayerIndex = TempTab[i+1];
						nEnter2 = GetTask(ENTERORDER);
						if nEnter1 > nEnter2 then	--Èç¹û½øÈë³¡µØµÄÐòºÅ1±ÈÐòºÅ2´óµÄ»°£¬¾Í½»»»
							tempIndex = TempTab[i+1];
							TempTab[i+1] = TempTab[i];
							TempTab[i] = tempIndex;
							bXChanged = 1;							
						end;						
					end;
				end;
			end;
		end;
		if bXChanged == 0 then
			break;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
	return TempTab;
end;
--ÏÔÊ¾ÅÅÃû
function Report_Result(RankTab)
	local sContent = "XÕp h¹ng cuèi cïng: <enter>";
	local OldPlayerIndex = PlayerIndex;
	local nPlayerCount = getn(RankTab);
	local nPlayerScored = nPlayerCount;
	local FinishTime = 0;
	local nMin = 0;
	local nSec = 0;
	local sResult = "";
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) ~= nPlayerCount then
		Write_Log("Ho¹t ®éng §oan Ngä sai sãt","Trong hµm sè Report_Result, tham sè RankTab nhËp vµo vµ sè tuyÓn thñ trong Mission kh«ng phï hîp");
	end;
	if nPlayerCount > 6 then 
		nPlayerScored = 6 
	end;
	for i=1,nPlayerScored do
		PlayerIndex = RankTab[i];
		if PlayerIndex > 0 then
			FinishTime = GetTask(FINISHTIME);
			if FinishTime == 999999999 then
				sResult = "Thi ®Êu ch­a kÕt thóc";
			else
				FinishTime = FinishTime/18;
				nMin = floor(FinishTime/60);
				nSec = format("%.2f",FinishTime - nMin*60);	--Ð¡ÊýµãºóÁ½Î»¾Í¹»ÁË
				sResult = ""..nMin.." Phót "..nSec.." Gi©y "
			end;
			if nPlayerCount > 0 and nPlayerCount <= MAXPLAYER then		
				local multiple = get_reward_multiple(SYS_DRAGONBOAT)
				if Get_Multiple_Status() == 1 then
					multiple = multiple*MULTIPLE;	--¶à±¶½±Àø¡£ÕâÀï³ËÒÔ»Ô»ÍÖ®Ò¹µÄ±¶ÂÊ¾ÍÐÐÁË
				end;
				local score = BonusTab[nPlayerCount][i] * multiple
				sContent = sContent.."h¹ng "..NumTab[i]..":<color=yellow> "..strsub(GetName(),1,10).." <color>thêi gian<color=red> "..sResult.." <color>®iÓm tÝch lòy<color=yellow> "..score.."<color><enter>";
				Msg2MSAll(MISSION_ID,"h¹ng "..NumTab[i].." Danh:"..GetName().." thêi gian sö dông:"..sResult);
			else
				Write_Log("Ho¹t ®éng §oan Ngä sai sãt","Trong hµm sè Report_Result, biÕn l­îng nPlayerCount sai");
			end;
		else
			Write_Log("Ho¹t ®éng §oan Ngä sai sãt","Nh©n tè ng­êi ch¬i trong mission_head.lua,Report_Result(), RankTab lín h¬n hoÆc = 0");
		end;
	end;
	for i=1,getn(RankTab) do
		PlayerIndex = RankTab[i];
		if PlayerIndex > 0 then
			SetTask(RANK,i);
			Talk(1,"",sContent);
		else
			Write_Log("Ho¹t ®éng §oan Ngä sai sãt","Nh©n tè ng­êi ch¬i trong mission_head.lua,Report_Result(), RankTab lín h¬n hoÆc = 0");
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--¶ÔMissionÖÐÄ³Ò»ÕóÓªÍæ¼Ò½øÐÐÍ³Ò»²Ù×÷
--Ê¹ÓÃ·½·¨£ºÏÈ¶¨ÒåÒ»¸öÖ´ÐÐº¯Êý£¬Õâ¸öº¯ÊýµÄÊäÈë²ÎÊýÎªÒ»table¡£
--È»ºó°ÑÕâ¸öº¯Êý×÷ÎªµÚÒ»¸öÊäÈë²ÎÊý¸øOP_AllMSPlayerº¯Êý¡£
--Í¨¹ý´«tableµÄ·½Ê½¿ÉÒÔ´«¶à¸ö²ÎÊý¸øÖ´ÐÐº¯Êý¡£
function OP_AllMSPlayer(func,tArg,Camp)
	local OldPlayerIndex = PlayerIndex;
	local TotalPlayerCount = GetMSPlayerCount(MISSION_ID,Camp);	--£°ÕóÓª±íÊ¾ËùÓÐÕóÓªµÄÍæ¼Ò
	local IDTab = {};	
	local msidx = 0;
	local sidx = 0;
	for i=1,TotalPlayerCount do
		msidx,sidx = GetNextPlayer(MISSION_ID,msidx,Camp);
		if sidx > 0 then
			IDTab[i] = sidx;
		end
	end
	for i=1,getn(IDTab) do
		PlayerIndex = IDTab[i];
		if PlayerIndex > 0 then
			func(tArg);
		else
			Write_Log("Ho¹t ®éng §oan Ngä sai sãt","Nh©n tè ng­êi ch¬i trong mission_head.lua,OP_AllMSPlayer(), IDTab lín h¬n hoÆc =0");
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--¸ù¾ÝÃû´ÎµÃµ½Íæ¼ÒË÷Òý
function Get_Player_By_Rank(nRank)
	local RankTab = Get_Rank();
	if nRank > getn(RankTab) or nRank <= 0 then
		if nRank ~= 0 then
			Write_Log("Ho¹t ®éng §oan Ngä sai sãt","Trong hµm sè Get_Player_By_Rank, tham sè nhËp vµo kh«ng ®óng, trÞ sè lµ:"..nRank);
		end;
		return 0;
	end;
	return RankTab[nRank];
end;
--µÃµ½×Ô¼ºµ±Ç°µÄÃû´Î
function Get_Self_Rank()
	local RankTab = Get_Rank();
	for i=1,getn(RankTab) do
		if PlayerIndex == RankTab[i] then
			return i;
		end;
	end;
	Write_Log("Ho¹t ®éng §oan Ngä sai sãt","Trong hµm sè Get_Self_Rank kh«ng t×m thÊy h­íng dÉn ng­êi ch¬i chÝnh x¸c");
	return 0;	--³ö´í
end;