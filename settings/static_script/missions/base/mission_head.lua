----------------------------------------------------
-- missin base define
-- by windle
-- 2010-2-25 12:09
----------------------------------------------------
Include("\\script\\class\\mem.lua")

MV_STAGE 		= 99		-- µ±Ç°´¦ÓÚµÚ¼¸¹Ø
MV_PHASE		= 98		-- µ±Ç°´¦ÓÚµÚ¼¸½×¶Î
MV_MAP_ID		= 97		-- µØÍ¼id, Èç¹ûÊÇ¶¯Ì¬µØÍ¼¾ÍÊÇ¶¯Ì¬µØÍ¼id (KQueuing.cpp define too)
MV_MAP_INDEX	= 96		-- µØÍ¼index (KQueuing.cpp define too)
MV_MISSION_STATUS = 95	-- ¹Ø¿¨×´Ì¬, Ö÷ÒªÓÃÀ´¼ÇÂ¼ÊÇ·ñÍê³É¹Ø¿¨
MV_RETURN_MAP_ID = 94	-- Àë¿ª×ø±ê±ê¼Ç (KQueuing.cpp define too)
MV_MISSION_OPEN_STATE = 93 --¹Ø¿¨¿ªÆô×´Ì¬

MV_TIMER_STEP 	= 80		-- Ê±¼ä´¥·¢Æ÷ÀÛ¼ÓÆ÷
MV_TIMER_STEP_MAX = 89
MV_TIMER_SECOND = 70  --Ê±¼ä´¥·¢Æ÷Ã¿ÃëÀÛ¼ÓÆ÷
MV_TIMER_SECOND_MAX = 79
MV_PHASE_LEVEL	= 60
MV_PHASE_LEVEL_MAX	= 69

CUSTOM_MV_BEGIN = 10
MV_CUSTOM_BEGIN = CUSTOM_MV_BEGIN
MV_CUSTOM_END	= 59

CampPlayer = "camp_player"; 		--ÎäÁÖÁªÃËÕóÓªÀàĞÍ£¬°üÀ¨npc
CampEnemy = "camp_enemy";  		--ÎäÁÖÅÑÍ½ÕóÓªÀàĞÍ£¬°üÀ¨npc
CampNeutral = "camp_evil";		--ÖĞÁ¢npcÕóÓªÀàĞÍ

-----------------------------------------------------------------------------
missionHead = {
	missionID = nil,
	realMapID = nil,
	dynamicMap = 0,
	
	name = "mission",
}
function missionHead:Create()
	local oldMapID = GetWorldPos();
	local realMapID = self:getRealMapID()
	local mapID, mapIdx = realMapID, 0;
	if self.dynamicMap ~= 0 then
		mapID, mapIdx = DynamicLoadMap(realMapID);
	end
	if not mapID or mapID < 1 then 
		self:log(format("[T¶i Map hoÆc Map chuyÓn ®éng thÊt b¹i] [realMapID=%d, dynamicMap=%d, mapID=%s, mapIdx=%s]", 
			realMapID, self.dynamicMap, tostring(mapID), tostring(mapIdx)));
		return
	end
	self:setMap(mapID);
	local ret = OpenMission(self.missionID);
--	if ret ~= 1 then
--		self:log(format("[´´½¨MissionÊ§°Ü] [missionID=%d, retCode=%s]",self.missionID, tostring(ret)))
--		return
--	end
	self:log(format("[CreateMission] [name=%s, missionID=%d, mapID=%d]", self.name, self.missionID, mapID));
	SetMissionV(MV_MAP_ID, mapID);
	SetMissionV(MV_MAP_INDEX,mapIdx);
	SetMissionV(MV_RETURN_MAP_ID, oldMapID);
--	StartMissionTimer(self.missionID, self.timerID, self.frequecy);
	self:resetMap();
	return mapID, mapIdx;
end

function missionHead:getRealMapID()
	return self.realMapID;
end

function missionHead:Enter(mapID, nCamp)
	self:setMap(mapID);
	SendScript2VM(thisFile, format("this:_Enter(%d)", nCamp));
	self:resetMap();
end

function missionHead:TeamEnter(mapID, nCamp)
	self:setMap(mapID);
	SendScript2VM(thisFile, format("this:_TeamEnter(%d)", nCamp));
	self:resetMap();
end

function missionHead:setMap(mapID)
	if self.oldSubWorld then
		print("[Error] [tMissionBase:setSubWorld] [set vµ reset kh«ng t­¬ng thİch !!!]");
		return
	end

	local newSubWorld = SubWorldID2Idx(mapID);
	if newSubWorld < 0 then
		print(format("[Error] [tMissionBase:setSubWorld] [mapID=%s bŞ lçi]", tostring(mapID)));
		return
	end;

	self.oldSubWorld = SubWorld;
	SubWorld = newSubWorld;
end

function missionHead:resetMap()
	SubWorld = self.oldSubWorld;
	self.oldSubWorld = nil;
end

function missionHead:log(msg)
	print("MISSIONLOG:",msg);
end