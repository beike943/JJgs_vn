--速度靴子NPC脚本
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnDeath(launcher)
	SetNpcLifeTime(launcher,0)
	--播放音效
	PlaySound("\\sound\\vn\\effect\\effect_speed.WAV")
	--设置特效
	SetCurrentNpcSFX(PIdx2NpcIdx(),968,2,0)
	--魔法属性设置
	CastState("state_move_speed_percent_add",100,18*30,1,201133)
	Msg2Player(tSTRING_FLOAT_BOX[3])
end