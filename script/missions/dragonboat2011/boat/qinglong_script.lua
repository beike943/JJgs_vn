--青龙龙舟脚本
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnEquip(item)
	--print("OnEquip called!!")
	--学习技能
	if LearnSkill(30104) == nil then
		OnUnEquip(item)
	end
	if LearnSkill(30105) == nil then
		OnUnEquip(item)
	end
	if LearnSkill(30106) == nil then
		OnUnEquip(item)
	end	
	--加魔法属性
	local nLifeValue = GetMaxLife()
	CastState("state_life_max_point_add",QINGLONG_LIFE-nLifeValue,18*CONTINUE_TIME,0,201101)
	CastState("state_ignore_defence",100,18*CONTINUE_TIME,0,201105)
	CastState("state_ignore_dodge",100,18*CONTINUE_TIME,0,201109)
	RestoreAll()
	SetFightState(1)
	KillFollower() 	--删除跟班
	Msg2Player(tSRING_SYS_MSG[3])
	return 0
end

function OnUnEquip(item)
	--print("OnUnEquip called!!")
	--删除技能
	if RemoveSkill(30104) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30104))
		WriteLog(format(tSTRING_MISSION_LOG[6],30104))
	end
	if RemoveSkill(30105) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30105))
		WriteLog(format(tSTRING_MISSION_LOG[6],30105))
	end
	if RemoveSkill(30106) == nil then 
		--print(format(tSTRING_MISSION_LOG[6],30106))
		WriteLog(format(tSTRING_MISSION_LOG[6],30106))
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