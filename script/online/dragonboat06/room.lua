--File name:room.lua
--Describe:±ÈÈü·¿¼äÀàÀà½Å±¾
--Create Date:2006-4-18
--Author:yanjun
Include("\\script\\class\\mem.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
--========================================================================================
KSRoom = {
--==========³ÉÔ±±äÁ¿================
m_MapID = 0,
m_OldSubWorld = 0,
m_SubWorld = 0,--MissionËù¶ÔÓ¦µÄµØÍ¼Ë÷Òı
--==========³ÉÔ±º¯Êı=================
--¹¹Ôìº¯Êı£¬ÓÃÀ´ÉèÖÃMissionËù¶ÔÓ¦µÄ³¡µØµÄ
__new = function(self,arg)
	self.m_MapID = arg[1];
	self.m_OldSubWorld = SubWorld;
	local MapID = GetWorldPos();
	if MapID == 100 then
		MapID = 300;
	elseif MapID == 300 then
		MapID = 100;
	end;
	self.m_SubWorld = SubWorldID2Idx(MapID*10+70+arg[1]-1);
end,
--µÃµ½µ±Ç°³¡µØÀïÃæµÄÍæ¼ÒÊı
GetPlayerNum = function(self)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("Lçi t×m b¶n ®å","Lçi nµy sÏ lµm server t¹m ngõng vËn hµnh, rÊt nguy hiÓm, mau t×m nguyªn nh©n! ! ! TrŞ h­íng dÉn tra cøu ®Şa ®å:"..self.m_SubWorld);
		return 0;
	end;
	local nPlayerNum = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER);
	SubWorld = self.m_OldSubWorld;
	return nPlayerNum;
end,
--±ÈÈüÍæ¼Ò½øÈë³¡µØ
AddPlayer = function(self)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("Lçi t×m b¶n ®å","Lçi nµy sÏ lµm server t¹m ngõng vËn hµnh, rÊt nguy hiÓm, mau t×m nguyªn nh©n! ! ! TrŞ h­íng dÉn tra cøu ®Şa ®å:"..self.m_SubWorld);
		return 0;
	end;
	local nPlayerNum = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER)
	if GetMissionV(MV_ROOMSTATE) <= MS_STATE_WAITSIGNUP then
		if GetMissionV(MV_ROOMSTATE) == MS_STATE_IDLE then	--µÚÒ»¸ö½øÈ¥
			Msg2Player("Chµo mõng b¹n vµo tr­êng ®Êu, xin h·y ®îi tuyÓn thñ kh¸c vµo.");
			OpenMission(MISSION_ID);
		elseif nPlayerNum == MAXPLAYER-1 then	--×îºóÒ»¸ö½øÈ¥
			StopMissionTimer(MISSION_ID,READY_TIMER_ID);
			SetMissionV(MV_TIMELEFT,WAITSTART_TIMER_LOOP);
			SetMissionV(MV_ROOMSTATE,MS_STATE_WAITSTART);
			StartMissionTimer(MISSION_ID,WAITSTART_TIMER_ID,WAITSTART_TIME);
		end;
		SetMissionV(MV_ENTERORDER,GetMissionV(MV_ENTERORDER)+1);
		SetTask(ENTERORDER,GetMissionV(MV_ENTERORDER));	--¼ÇÂ¼½ø³¡Ë³Ğò
		local MapID = GetWorldPos();
		local MapID = GetWorldPos();
		if MapID == 100 then
			MapID = 300;
		elseif MapID == 300 then
			MapID = 100;
		end;
		CleanInteractive();
		NewWorld(MapID*10+70+self.m_MapID-1,2051,3257);
		JoinMission(MISSION_ID,CAMP_PLAYER);	--È«²¿¼Óµ½ÕóÓª2
		SetTask(CURMAP,self.m_MapID);
		Msg2MSAll(MISSION_ID,"TuyÓn thñ "..GetName().." §· vµo tr­êng ®Êu. HiÖn trong tr­êng ®Êu cã tÊt c¶ "..(nPlayerNum+1).." ng­êi");
		if nPlayerNum == MAXPLAYER-1 then
			Msg2MSAll(MISSION_ID,"Th«ng b¸o c¸c tuyÓn thñ chuÈn bŞ, 30 gi©y sau chİnh thøc thi ®Êu.");
		end;
	end;
	SubWorld = self.m_OldSubWorld;
end,
--µÃµ½µ±Ç°³¡µØµÄ×´Ì¬
GetRoomState = function(self)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("Lçi t×m b¶n ®å","Lçi nµy sÏ lµm server t¹m ngõng vËn hµnh, rÊt nguy hiÓm, mau t×m nguyªn nh©n! ! ! TrŞ h­íng dÉn tra cøu ®Şa ®å:"..self.m_SubWorld);
		return 0;
	end;
	local nState = GetMissionV(MV_ROOMSTATE);
	SubWorld = self.m_OldSubWorld;
	return nState;
end,
--ÉèÖÃµ±Ç°³¡µØµÄ×´Ì¬
SetRoomState = function(self,State)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("Lçi t×m b¶n ®å","Lçi nµy sÏ lµm server t¹m ngõng vËn hµnh, rÊt nguy hiÓm, mau t×m nguyªn nh©n! ! ! TrŞ h­íng dÉn tra cøu ®Şa ®å:"..self.m_SubWorld);
		return 0;
	end;
	SetMissionV(MV_ROOMSTATE,State);
	SubWorld = self.m_OldSubWorld;
end,

}

function Init_Room()	--Ö»ÒªÊ¹ÓÃµ½KSRoomµÄµØ·½¶¼ÒªÓĞÕâ¸ö³õÊ¼»¯
	local RoomTab = {};
	for i=1,g_TotalRoomNum do			
		RoomTab[i] = new(KSRoom,i);
	end;
	return RoomTab;
end;