--护甲架NPC脚本
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnDeath(launcher)
	SetNpcLifeTime(launcher,0)
	--播放音效
	PlaySound("\\sound\\vn\\effect\\effect_arm.WAV")
	--设置特效
	SetCurrentNpcSFX(PIdx2NpcIdx(),969,2,0)
	--魔法属性设置
	CastState("state_receive_half_damage",100,18*30,1,201132)
	Msg2Player(tSTRING_FLOAT_BOX[2])	
end