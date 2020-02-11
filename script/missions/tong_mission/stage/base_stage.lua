--create date:2007-07-10 
--author:yanjun
--describe:°ï»á¹Ø¿¨¡°»ùÀà¡±¡£ÔİÊ±Ö»Ö§³ÖÊ¹ÓÃMission¿ª·¢µÄ¹Ø¿¨£¬
--°ÑMissionÏà¹ØÖ¸Áî·Åµ½ÅÉÉúÀà¿ÉÒÔÖ§³Ö¸ü¹ã·ºµÄ¹Ø¿¨
HUGE_NUMBER = 9999999999;	--Ò»¸ö´óÊı
LEFT_REGION = -1;	--×ó±ßÇøÓò
MID_REGION = 0;	--ÖĞ¼äÇøÓò
RIGHT_REGION = 1;	--ÓÒ±ßÇøÓò

function OO_Inherit(base)	--¶¨ÒåÒ»¸ö¼Ì³Ğº¯Êı
	local derive = {};
	local foo = function(t,i)	--¶¨Òå"index"·½·¨
		return %base[i];
	end;
	settag(derive,newtag());
	settagmethod(tag(derive),"index",foo);
	return derive;
end;

CBASE_STAGE = 
{
--======»ùÀàÊôĞÔ============================================================================
	nStage = 0,	--µ±Ç°¹Ø¿¨
	tbTimerEven = {},	--Ê±¼äµãÊÂ¼ştable
	tbBossInfo = {},	--bossĞÅÏ¢
--======»ùÀàĞĞÎª============================================================================
	--³õÊ¼»¯¹Ø¿¨
	InitStage = function(self)
		SetMissionV(MV_STAGE,self.nStage);
		SetMissionV(MV_TIMER_LOOP,0);
		SetMissionV(MV_STAGE_OVER,0);
		SetMissionV(MV_CHECK_POINT,-1);	--ÎŞĞ§¼ì²éµã
		SetMissionV(MV_BOSS1,0);
		SetMissionV(MV_BOSS2,0);
		SetMissionV(MV_NPC_COUNT,0);
		SetMissionV(MV_FAC_NPC_COUNT,0);
		SetMissionV(MV_BOSS_COUNT,0);
		SetMissionV(MV_KILL_SUB_NPC,0);
		SetMissionV(MV_STAGE_STARTED,1);
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_SECOND);	--¿ªÊ¼Ò»¸öĞÂµÄ¼ÆÊ±Æ÷
		TM_StopTimeGuage(-2);
		self:OnCreateBoss();
		TM_CreateSubNpc(SUB_NPC_COUNT);
		TM_StartTimeGuage("Tæng thêi gian  ",30*60,0,0);
	end,
	--Ö´ĞĞÊ±¼äµãÊÂ¼ş£¬nStartSec±íÊ¾´Ó¹Ø¿¨¿ªÊ¼ºóµÄÄÄÒ»Ãë¿ªÊ¼Ö´ĞĞ,nIntervalSec±íÊ¾Ö´ĞĞµÄ¼ä¸ôÊ±¼ä
	--fEvenÊÇÒªÖ´ĞĞµÄ²Ù×÷º¯Êı
	ProcessTimerEven = function(self,nStartSec,nIntervalSec,funEven,tbArg)
		local nLoop = GetMissionV(MV_TIMER_LOOP);
		local nStartLoop = floor(nStartSec/STARTED_TIMER_INTERVAL);
		local nIntervalLoop = floor(nIntervalSec/STARTED_TIMER_INTERVAL);
		if nLoop < nStartLoop then
			return 0;
		end;
		if nIntervalLoop <= 0 then	--Èç¹ûnIntervalSecĞ¡ÓÚµÈÓÚ0,±íÊ¾Õâ¸öº¯ÊıÖ»Ö´ĞĞÒ»´Î£¬Òò´ËnIntervalLoopĞè¸³ÖµÒ»¸ö´óÊı
			nIntervalLoop = HUGE_NUMBER;
		end;
		local nElapseLoop = nLoop - nStartLoop;
		if mod(nElapseLoop,nIntervalLoop) == 0 then
			funEven(self,tbArg);	--ËäÈ»funEvenÊÇ³ÉÔ±º¯Êı£¬µ«ÓÉÓÚ²»ÊÇself:µ÷ÓÃ£¬ËùÒÔÒª´«self²ÎÊı
		end;
	end,
	--½áÊøÒ»¸ö¹Ø¿¨£¬Ä¬ÈÏÎª´³¹Ø³É¹¦
	EndStage = function(self,bWin)
		SetMissionV(MV_STAGE_OVER,1);
		SetMissionV(MV_VALUE9,0);	--Çå³ıÑ¡ÔñµÄÒªÉ¾³ıµÄÃÅÅÉ1
		SetMissionV(MV_VALUE10,0);	--Çå³ıÑ¡ÔñµÄÒªÉ¾³ıµÄÃÅÅÉ2
		StopMissionTimer(MISSION_ID,TIMER_ID);
		self:RemoveTimerTrigger();
		self:ClearBoss();
		self:ClearStageValue();
		TM_StopTimeGuage(-2);
		local nMapID = SubWorldIdx2ID(SubWorld);
		TM_CreateFieldNpc(nMapID);
		if bWin ~= nil and bWin ~= 1 then	--Èç¹û´³¹ØÊ§°ÜÔòÍË»ØÒ»¹Ø
			SetMissionV(MV_STAGE,self.nStage-1);	--ĞèÒª°Ñµ±Ç°¹Ø¿¨ÉèÖÃ»ØÉÏÒ»¹Ø
			Msg2MSAll(MISSION_ID,"V­ît ¶i thÊt b¹i!");
		else
			TM_AddStagePassTimes(self.nStage);	--¹ı¹Ø´ÎÊı¼Ó1
			TM_AddPoint(250,self.nStage);	--ËùÓĞÈË¼Ó250¹ı¹Ø»ı·Ö£¬¶îÍâ»ı·ÖÔÚTM_AddPointº¯ÊıÀïÃæÅĞ¶Ï
			TM_AddExpAward(self.nStage);	--¾­Ñé½±Àø
			TM_CreateBox(self.nStage);	--ÔÚBOSSÇøÖĞ¼ä´´½¨Ò»¸öÏä×ÓNPC
			Msg2MSAll(MISSION_ID,"Chóc mõng ®· v­ît ¶i "..self.nStage..".");
			self:SaveTongStage();	--±£´æ¹Ø¿¨½ø¶È
		end;
	end,
	--´¦Àí¼ÆÊ±Æ÷
	ProcessTimer = function(self)
		local nStartSec,nIntervalSec,funEven,tbArg = 0,0,nil,{};
		for i=1,getn(self.tbTimerEven) do
			nStartSec = self.tbTimerEven[i][1];
			nIntervalSec = self.tbTimerEven[i][2];
			funEven = self.tbTimerEven[i][3];
			tbArg = self.tbTimerEven[i][4];
			self:ProcessTimerEven(nStartSec,nIntervalSec,funEven,tbArg);
			if GetMissionV(MV_STAGE_OVER) == 1 then	--Èç¹ûÖ´ĞĞÍêÉÏÃæµÄº¯Êıºó¹Ø¿¨½áÊøÁË£¬ÄÇÃ´ºóÃæµÄ¾Í²»Ó¦¸Ã±»Ö´ĞĞÁË
				return 0;
			end;
		end;
		local nLoop = GetMissionV(MV_TIMER_LOOP);
		if nLoop == GetMissionV(MV_CHECK_POINT) then
			self:OnProcessCheckPoint();
		end;
	end,
--¼ì²âÍæ¼Òµ±Ç°Î»ÖÃ£¬ÔÚ×ó±ßÇøÓò·µ»Ø-1£¬ÔÚÖĞ¼äÇøÓò·µ»Ø0£¬ÔÚÓÒ±ßÇøÓò·µ»Ø1
	GetPlayerSection = function(self,nPlayerIdx)
		local nOldPlayerIdx = PlayerIndex
		if nPlayerIdx ~= nil then
			PlayerIndex = nPlayerIdx;
		end;
		local _,nMapX,nMapY = GetWorldPos();
		local tbPos = {
					--x1   y1	   x2	y2
					{{1583,3144},{1530,3198}},	--left line
					{{1604,3162},{1549,3219}},	--right line
					};
		--y=(x-x1)(y2-y1)/(x2-x1)+y1   Á½µãÊ½Ö±Ïß·½³Ì
		local nYLeft = floor((nMapX-tbPos[1][1][1])*(tbPos[1][2][2]-tbPos[1][1][2])/(tbPos[1][2][1]-tbPos[1][1][1])+tbPos[1][1][2]);
		local nYRight = floor((nMapX-tbPos[2][1][1])*(tbPos[2][2][2]-tbPos[2][1][2])/(tbPos[2][2][1]-tbPos[2][1][1])+tbPos[2][1][2]);
		PlayerIndex = nOldPlayerIdx;
		if nMapY > nYRight then
			return RIGHT_REGION;
		elseif nMapY < nYLeft then
			return LEFT_REGION;
		else
			return MID_REGION;
		end;
	end,
	--ÉèÖÃÒ»¸ö¸¨ÖúÊ±¼ä´¥·¢Æ÷£¬²ÎÊınSecÊÇ´¥·¢ËùĞèÒªµÄÊ±¼ä£¬±ÈÈçÊÇ10µÄ»°¾ÍÊÇ10Ãëºó´¥·¢
	--Ö´ĞĞµÄº¯ÊıÊÇOnTimerTriggerEven
	SetTimerTrigger = function(self,nSec)
		StartMissionTimer(MISSION_ID,ASSI_TIMER_ID,nSec*FRAME_PER_SECOND);	--¿ªÊ¼¸¨Öú¼ÆÊ±Æ÷
		SetMissionV(MV_TIMER_TRIGGER_STATE,1);
	end,
	--É¾³ı¸¨ÖúÊ±¼ä´¥·¢Æ÷
	RemoveTimerTrigger = function(self)
		StopMissionTimer(MISSION_ID,ASSI_TIMER_ID);
		SetMissionV(MV_TIMER_TRIGGER_STATE,0);
	end,
	--»ñÈ¡¸¨ÖúÊ±¼ä´¥·¢Æ÷µÄ×´Ì¬
	GetTimerTriggerState = function(self)
		return GetMissionV(MV_TIMER_TRIGGER_STATE);
	end,
	--¼ì²éÊÇ·ñÈ«²¿Í¨¹Ø
	CheckAllStagePass = function(self)
		local nCurStage = self.nStage;
		if nCurStage == MAX_STAGE then
			local nYearWeek = GetMissionV(MV_WEEK);
			local szTongName = GetMissionS(MS_TONG_NAME);
			StopMissionTimer(MISSION_ID,TIMER_ID);
			SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
			SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
			StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_SECOND);
			TM_SetRelayTongData(szTongName,KEY_WEEK,"d",nYearWeek);
			Msg2MSAll(MISSION_ID,"Chóc mõng c¸c vŞ ®¹i hiÖp ®· v­ît qua tÊt c¶ c¸c cöa ¶i!");
			Msg2Global(szTongName.."Bang héi ®· ®¸nh b¹i hai ®¹i thÇn thó Háa Vò vµ L­u Quang, th«ng qua tÊt c¶ c¸c kh¶o nghiÖm cña Tö Quang C¸c");
			AddGlobalNews("<color=yellow>"..szTongName.."<color>Bang héi ®¸nh b¹i hai ®¹i thÇn thó Háa Vò vµ L­u Quang, th«ng qua tÊt c¶ c¸c kh¶o nghiÖm cña Tö Quang C¸c");
			return 1;
		end;	
		return 0;	
	end,
	--Çå³ıBOSSºÍĞ¡¹Ö
	ClearBoss = function(self)
		local nMapID = SubWorldIdx2ID(SubWorld);
		ClearMapNpc(nMapID);
	end,
	--Çå³ı¹²ÓÃSTAGE±äÁ¿
	ClearStageValue = function(self)
		for i=MV_VALUE1,MV_VALUE10 do
			SetMissionV(i,0);
		end;
	end,
	--±£´æ¹Ø¿¨½ø¶È
	SaveTongStage = function(self)
		local szTongName = GetMissionS(MS_TONG_NAME);
		local nCurStage = self.nStage;
		TM_SetRelayTongData(szTongName,KEY_STAGE,"d",nCurStage);
		Msg2MSAll(MISSION_ID,"B¶o l­u tiÕn ®é: ¶i "..nCurStage..".");
		Msg2Global(szTongName.."Bang héi th«ng qua Tö Quang C¸c ¶i "..nCurStage.." cña kh¶o nghiÖm");
		WriteLog("[Bang héi v­ît ¶i]:"..szTongName.."Th«ng qua ¶i "..nCurStage..".");
	end,
	--ËùÓĞÍæ¼ÒËÀÍö
	AllDeath = function(self)
		local funDeath = function(tbArg)
			ModifyLife(0);	
		end;
		local tbNormalPlayer = TM_GetPlayerTable();
		gf_OperatePlayers(tbNormalPlayer,funDeath,tbArg);
	end,
	--Ğ¡¹ÖËÀÍöº¯Êı£¬ÓÉÓÚÃ¿¹ØµÄĞ¡¹ÖÓĞ¿ÉÄÜ²»Ò»Ñù£¬ËùÒÔÓĞĞ©¹Ø¿¨µÄOnNpcDeathĞèÒªÖØÔØ
	OnNpcDeath = function(self,szNpcIdx)
		local nNpcIdx = tonumber(szNpcIdx);
		local nNpcFaction = TM_GetNpcFaction(nNpcIdx);
		if nNpcFaction == 0 then	--²»ÊÇÃÅÅÉ¹Ö
			SetNpcLifeTime(nNpcIdx,0);
			return 0;
		end;
		if GetPlayerFaction() == nNpcFaction then	--Èç¹û´òËÀÏàÓ¦µÄÃÅÅÉ¹Ö
			SetNpcLifeTime(nNpcIdx,0);
			SetMissionV(MV_FAC_NPC_COUNT,GetMissionV(MV_FAC_NPC_COUNT)-1);
		end;
	end,
	--¼ì²éNPCÊıÁ¿ÊÇ·ñ³¬¹ıÄ³¸öÉÏÏŞÖµ£¬³¬¹ıµÄ»°·µ»Ø£±£¬·ñÔò·µ»Ø£°
	CheckNpcCount = function(self)
	local nNpcCount = GetMissionV(MV_FAC_NPC_COUNT);
		Msg2MSAll(MISSION_ID,"Sè bãng hé vÖ hiÖn t¹i:"..nNpcCount.."/"..self.nMaxNpcCount);
		if nNpcCount > self.nMaxNpcCount then
			return 1;
		else
			return 0;
		end;	
	end,
--=======ÏÂÃæº¯ÊıÏàµ±ÓÚĞéº¯Êı£¬ÔÚ×ÓÀà±ØĞè¶¨ÒåµÄº¯Êı============================================
	--Ä¬ÈÏµÄCreateBossº¯Êı
	OnCreateBoss = function(self)
		gf_ShowDebugInfor("Ch­a ®Şnh nghÜa CreateBoss");
	end,
	--¸¨ÖúÊ±¼ä´¥·¢Æ÷µÄÖ´ĞĞº¯Êı
	OnTimerTriggerEven = function(self)
		gf_ShowDebugInfor("Ch­a ®Şnh nghÜa TimerTriggerEven");
	end,
	--BOSSËÀÍöº¯Êı£¬ÓÉÓÚÓĞĞ©¹ØÓĞÁ½¸öBOSS£¬ËùÒÔOnBossDeath¶¨ÒåÎªĞéº¯Êı£¬¾ßÌåÊµÏÖÔÚÅÉÉúÀà
	OnBossDeath = function(self)
		gf_ShowDebugInfor("Ch­a ®Şnh nghÜa  OnBossDeath");
	end,
	--¼ì²éµãº¯Êı¡£µ±Ç°Ñ­»·µãÖÁ¼ì²éµãÖ®¼ä×î¶àÖ»ÄÜÉèÖÃÒ»¸ö¼ì²éµã
	OnProcessCheckPoint = function(self)
		gf_ShowDebugInfor("Ch­a ®Şnh nghÜa OnProcessCheckPoint");
	end,
}