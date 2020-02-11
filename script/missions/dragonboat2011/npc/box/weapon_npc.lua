--武器架NPC脚本
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnDeath(launcher)
	SetNpcLifeTime(launcher,0)
	--播放音效
	PlaySound("\\sound\\vn\\effect\\effect_weapon.WAV")
	--设置特效
	SetCurrentNpcSFX(PIdx2NpcIdx(),967,2,0)
	--魔法属性设置
	CastState("state_npc_event_2_magic",6553638,18*30,1,201131)
	Msg2Player(tSTRING_FLOAT_BOX[1])
end