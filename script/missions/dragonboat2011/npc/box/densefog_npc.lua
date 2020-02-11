--迷雾NPC脚本
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnDeath(launcher)
	SetNpcLifeTime(launcher,0)
	--播放音效
	PlaySound("\\sound\\vn\\effect\\effect_dispearA.WAV")
	--设置特效
	SetCurrentNpcSFX(PIdx2NpcIdx(),966,2,0)
	--魔法属性设置
	CastState("state_illusion_latent",0,18*CONTINUE_TIME,1,201134)
	Msg2Player(tSTRING_FLOAT_BOX[4])	
end