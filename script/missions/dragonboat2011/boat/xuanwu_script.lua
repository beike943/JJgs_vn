--ÐþÎäÁúÖÛ½Å±¾
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnEquip(item)
	--print("OnEquip called!!")
	--Ñ§Ï°¼¼ÄÜ
	if LearnSkill(30107) == nil then
		OnUnEquip(item)
	end
	if LearnSkill(30108) == nil then
		OnUnEquip(item)
	end
	if LearnSkill(30109) == nil then
		OnUnEquip(item)
	end
	local nLifeValue = GetMaxLife()
	CastState("state_life_max_point_add",XUANWU_LFTE-nLifeValue,18*CONTINUE_TIME,0,201107)
	CastState("state_ignore_defence",100,18*CONTINUE_TIME,0,201102)
	CastState("state_ignore_dodge",100,18*CONTINUE_TIME,0,201110)
	RestoreAll()
	SetFightState(1)
	KillFollower() 	--É¾³ý¸ú°à
	Msg2Player(tSRING_SYS_MSG[3])
	return 0
end

function OnUnEquip(item)
	--print("OnUnEquip called!!")
	--É¾³ý¼¼ÄÜ
	if RemoveSkill(30107) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30107))
		WriteLog(format(tSTRING_MISSION_LOG[6],30107))
	end
	if RemoveSkill(30108) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30108))
		WriteLog(format(tSTRING_MISSION_LOG[6],30108))
	end
	if RemoveSkill(30109) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30109))
		WriteLog(format(tSTRING_MISSION_LOG[6],30109))
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