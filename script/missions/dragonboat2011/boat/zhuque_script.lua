--ÖìÈ¸ÁúÖÛ½Å±¾
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnEquip(item)
	--print("OnEquip called!!")
	--Ñ§Ï°¼¼ÄÜ
	if LearnSkill(30113) == nil then
		OnUnEquip(item)
	end
	if LearnSkill(30114) == nil then
		OnUnEquip(item)
	end
	if LearnSkill(30115) == nil then
		OnUnEquip(item)
	end
	local nLifeValue = GetMaxLife()
	CastState("state_life_max_point_add",ZHUQUE_LFTE-nLifeValue,18*CONTINUE_TIME,0,201112)
	CastState("state_ignore_defence",100,18*CONTINUE_TIME,0,201103)
	CastState("state_ignore_dodge",100,18*CONTINUE_TIME,0,201111)
	RestoreAll()
	SetFightState(1)
	KillFollower() 	--É¾³ý¸ú°à
	Msg2Player(tSRING_SYS_MSG[3])
	return 0
end

function OnUnEquip(item)
	--print("OnUnEquip called!!")
	--É¾³ý¼¼ÄÜ
	if RemoveSkill(30113) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30113))
		WriteLog(format(tSTRING_MISSION_LOG[6],30113))
	end
	if RemoveSkill(30114) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30114))
		WriteLog(format(tSTRING_MISSION_LOG[6],30114))
	end
	if RemoveSkill(30115) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30115))
		WriteLog(format(tSTRING_MISSION_LOG[6],30115))
	end
	return 0
end

function OnUse()
	--print("OnUse called!!")
	return 0
end

function CanEquip()
	--print("CanEquip called!!")
	return 0
end