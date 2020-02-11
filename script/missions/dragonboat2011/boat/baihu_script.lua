--°×»¢ÁúÖÛ½Å±¾
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnEquip(item)
	--print("OnEquip called!!")
	--Ñ§Ï°¼¼ÄÜ
	if LearnSkill(30110) == nil then
		OnUnEquip(item)
	end
	if LearnSkill(30111) == nil then
		OnUnEquip(item)
	end
	if LearnSkill(30112) == nil then
		OnUnEquip(item)
	end
	local nLifeValue = GetMaxLife()
	CastState("state_life_max_point_add",BAIHU_LFTE-nLifeValue,18*CONTINUE_TIME,0,201104)
	CastState("state_ignore_defence",100,18*CONTINUE_TIME,0,201106)
	CastState("state_ignore_dodge",100,18*CONTINUE_TIME,0,201108)
	RestoreAll()
	SetFightState(1)
	KillFollower() 	--É¾³ý¸ú°à
	Msg2Player(tSRING_SYS_MSG[3])
	return 0
end

function OnUnEquip(item)
	--print("OnUnEquip called!!")
	--É¾³ý¼¼ÄÜ
	if RemoveSkill(30110) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30110))
		WriteLog(format(tSTRING_MISSION_LOG[6],30110))
	end
	if RemoveSkill(30111) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30111))
		WriteLog(format(tSTRING_MISSION_LOG[6],30111))
	end
	if RemoveSkill(30112) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30112))
		WriteLog(format(tSTRING_MISSION_LOG[6],30112))
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