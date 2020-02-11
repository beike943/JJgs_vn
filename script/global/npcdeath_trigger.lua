--角色上线创建的kill触发器
--打死npc都会触发
--一直存在不会删除

Include("\\script\\online_activites\\award.lua")
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")
Include("\\script\\function\\lucky_box\\lb_head.lua")

function OnNpcDeath()
	local npcIdx, sTempName, sName, bIsPlayer = GetTriggeringUnit();
	if npcIdx <= 0 then
		return 0;
	end
	--是野怪
	if bIsPlayer == 0 then
		trigger_killnpc_drop();
		--201401副活动2
		trigger_killnpc_wildpig(sName);
		--201401副活动3
		trigger_killnpc_tuzi(sName);
		--201401副活动4
		trigger_killnpc_wildpig2(sName);
		--201402副活动2
		Vet_201402_KillNpc1(sName);
		Vet_201402_KillNpc2(sName);
		--通用活动
		trigger_killnpc_common(sName);
		--幸运大宝箱
		lb_OnKiller(sName);
	end
	--是玩家
	if bIsPlayer == 1 then
		--nothing
	end
end