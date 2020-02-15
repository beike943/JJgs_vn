Include("\\script\\global\\mate_head.lua");

tChuHunGuo = 
{
	[1] = {2, 1, 555,"出魂果"},
	[2] = {2, 1, 545,"大出魂果"},
}

function OnUse(item)
	if GetFollower() ~= 0 then	--如果身后有跟随NPC，先确认删除
		local selTab = {
					"同意/#confirm_use("..item..")",
					"取消/nothing",
					}
		Say("在使用物品之前,<color=red>除了尸体，跟随的NPC也会消失。<color>你确定使用吗？",getn(selTab),selTab);
	else
		confirm_use(item);
	end;
end

function confirm_use(item)
	if check_state() == 0 then
		return 0;
	end;
	local nType = get_type(item);
	if nType == 0 then
		Talk(1,"","你使用的不是任何一种产品");
		return 0;
	end;
	KillFollower();
	local selTab = {
				"同意/#confirm_use_final("..item..")",
				"取消/nothing",
				}
	Say("当配偶不在线时可以使用<color=yellow>"..tChuHunGuo[nType][4].."<color>为对方积累经验,在<color=yellow>2<color>小时内生效.。在这两个小时内，所有积累的经验都将转化为相互关系,如果你把这个送给你的朋友,他们会产生共鸣的经验, 但是<color=red>如果你的朋友在你使用的时候登录游戏,它会立即失效。积累的经验将是相互关联的，<color>.<enter>如果重新登录，可能会失去共振, 但不影响积累的经验。<enter> "..tChuHunGuo[nType][4].."在使用过程中<color=green>应该留出一个空位<color>以便将结果联系起来，你确定要使用它吗？",getn(selTab),selTab);
end;

function confirm_use_final(item)
	local mate = GetMateName()
	if check_state() == 0 then
		return 0;
	end;
	local nType = get_type(item);
	if nType == 0 then
		Talk(1,"","你使用的不是任何一种产品");
		return 0;
	end;
	
	if DelItemByIndex(item, 1) == 1 then
		-- 使用替身娃娃
		local npc = SummonNpc("使用替身娃娃", mate)
		npc = GetFollower();	--就算上面创建失败了也给当前跟随NPC添加一个效果
		SetCurrentNpcSFX(npc, SFX_DOLL, 1, 1)
		ActivateDoll(1)
		-- 设置使用时间和出魂果类型
		SetTask(TASKVAR_DOLLTIME, DOLL_TIME + DOLL_TIME_LIMIT * nType)
		SetTask(TASKVAR_DOLLEXP, 0);	--经验清0
		SetTask(TASK_DOLL_ACTIVE,GetTime());
		WriteLog("[提示]:"..GetName().."你使用了一个出魂果");
	end;
end;

function check_state()
	if GetTask(TASK_LOVEGRADE) < 300 then
		Talk(1,"","你的伴侣积分太低了,暂时不能释放灵魂果.超过<color=yellow>300<color>个点就可以使用了。");
		return 0;
	end;
	local mate = GetMateName()
	if (mate == "") then
		Talk(1, "", "你还没结婚，不能使用出魂果。")
		return 0;
	end;
	if (GetMateOnlineStatus() == 1) then
		Talk(1, "", format("你的配偶<color=red>%s<color>还在线,不能使用出魂果。", mate))
		return 0;
	end;
	if (IsDollActive() == 1) then
		Talk(1, "", "你的释放效果还没有结束，不能继续使用。")
		return 0;
	end;
end;

function get_type(nItemIdx)
	for i=1,getn(tChuHunGuo) do
		local genre,detail,particular = GetItemInfoByIndex(nItemIdx);
		if genre == tChuHunGuo[i][1] and detail == tChuHunGuo[i][2] and particular == tChuHunGuo[i][3] then
			return i;
		end;
	end;
	return 0;
end;
