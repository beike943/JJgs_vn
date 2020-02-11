Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
g_tbItem = 
{
	[1] = {2,0,1166,"紫玫瑰花"},
	[2] = {2,0,1165,"蓝玫瑰花"},
}

g_tbSentece = 
{
	[1] = {
			[1] = "如果爱上你是一个错，我宁愿这是世界上最美丽的错，我宁愿错一生",
			[2] = "我告诉你：第一是我爱你，第二还是我爱你，第三仍是我爱你……我爱你……",
			[3] = "海可以枯，石可以烂，我对你的爱，永不会变",
		  },
	[2] = {
			[1] = "我心里有个小秘密你想不想知道？让风悄悄告诉你，我喜欢你，真的好喜欢……",
			[2] = "如果你快乐，我给你祝福；如果你寂寞，我给你幸福",
			[3] = "宝贝宝贝我爱你，就像老鼠爱大米；你是天上的凤凰飞呀飞，我是地上的土狗追呀追",
		  },
}

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d%H"));

	if GetLevel() < 50 then
		Talk(1,"","不好意思，等级小于<color=yellow>50<color>级的不能种玫瑰花。");
		return 0;
	end;
	if GetSex() ~= 1 then
		Talk(1,"","不好意思，玫瑰花种子只能由<color=yellow>男方<color>种下。");
		return 0;
	end;
	local nType = get_seed_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","你这粒种子并不是玫瑰花的种子。");
		return 0;
	end;
	local selTab = {};
	tinsert(selTab,"是的/#select_sentece("..nItemIdx..","..nType..")");
	tinsert(selTab,"让我考虑一下/nothing");
	Say("种紫色玫瑰，你将被贬为<color=yellow>进士<color>，种蓝色玫瑰，你将被贬为<color=yellow>学士<color>。你确定为完成心爱的人的愿望而让自己经受前所未有的考验吗？",getn(selTab),selTab);
end;

function select_sentece(nItemIdx,nType)
	local selTab = {};
	for i=1,getn(g_tbSentece[nType]) do
		tinsert(selTab,g_tbSentece[nType][i].."/#plant("..nItemIdx..","..nType..","..i..")");
	end;
	tinsert(selTab,"让我考虑一下/nothing");
	Say("请选择你爱的告白：",getn(selTab),selTab);
end;

function plant(nItemIdx,nType,nIdx)
	local flag,nTime = GetAntiEnthrallmentInfo()
	if nTime >= 10800 and flag ==1 then
		Talk(1,"","请在健康游戏时间再来种玫瑰吧！")
		return 0;
	end
	if check_team() == 0 then
		return 0;
	end;
	if GetItemCount(2,0,351) == 0 then
		Talk(1,"","你身上并没带有露水啊，露水在<color=yellow>药店<color>有得卖。");
		return 0
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nPoint = GetTask(ABLUEMOON_JIFEN);
		DelItem(2,0,351,1);
		local szFemaleName = get_partner_name();
		local szMaleName = GetName();
		local nNpcIdx = CreateNpc("玫瑰花小苗","为"..szFemaleName.."种的玫瑰花苗",GetWorldPos())
		SetNpcScript(nNpcIdx,"\\script\\online\\abluemoon\\rose_npc.lua");
		Msg2Global(szMaleName.."为心爱的"..szFemaleName.."种下了世间罕见的"..g_tbItem[nType][4].."，并对"..szFemaleName.."说："..g_tbSentece[nType][nIdx]);
		AddGlobalCountNews("<color=red>"..szMaleName.."<color>为心爱的<color=red>"..szFemaleName.."<color>种下了世间罕见的"..g_tbItem[nType][4].."，并对<color=red>"..szFemaleName.."<color>说："..g_tbSentece[nType][nIdx],2);
		local nOldPoint = GetTask(ABLUEMOON_JIFEN);
		if nType == 1 then
			jifen_reduce(nOldPoint - 1000)
			--SetTask(ABLUEMOON_JIFEN,1000);
			Msg2Player("目前你的科考积分是1000分");
		elseif nType == 2 and nPoint > 1500 then
			jifen_reduce(nOldPoint - 1500)
			--SetTask(ABLUEMOON_JIFEN,1500);
			Msg2Player("目前你的科考积分是1500分");
		end;
		local nOldIdx = PlayerIndex;
		local nRand = random(1,10000);
		for i=1,2 do
			PlayerIndex = GetTeamMember(i);
			SetTask(ABLUEMOON_ROSE_ID,UnsignedHash(szMaleName..szMaleName)..nRand);	--男女名字再加一个随机数作为ID
			SetTask(ABLUEMOON_GROW_TYPE,10+nType);
			SetTask(ABLUEMOON_ROSE_INDEX,nNpcIdx);
			SetTask(ABLUEMOON_PLANT_TIME,GetTime());
			Say("请注意：如果女方在还没摘取这朵玫瑰花前和别的玩家种了另一朵玫瑰，那么女方将不能摘取这朵玫瑰，同样地，如果男方中途和别的玩家种了另一朵玫瑰，那么这朵玫瑰也将不能摘取。",0);
		end;
		PlayerIndex = nOldIdx;
		WriteLog("[兔小丫玫瑰]:"..GetName().."为"..szFemaleName.."种下了玫瑰，nType:"..nType.."，old point:"..nOldPoint);
	end;
end;

function get_seed_type(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(g_tbItem) do
		if nID1 == g_tbItem[i][1] and nID2 == g_tbItem[i][2] and nID3 == g_tbItem[i][3] then
			return i;
		end;	
	end;
	return 0;
end;

function check_team()
	if check_partner_sex() == 0 then
		Talk(1,"","必须<color=yellow>男女两人组队<color>才可以种玫瑰花。");
		return 0;
	end;
	if check_partner_level() == 0 then
		Talk(1,"","男女双方等级必须<color=yellow>大于或等于50级<color>才可以种玫瑰花。");
		return 0;
	end;
	return 1;
end;

function get_partner_name()
	if GetTeamSize() ~= 2 then
		return 0;
	end;
	local nOldIdx = PlayerIndex;
	for i=1,2 do
		PlayerIndex = GetTeamMember(i);
		if GetSex() == 2 then
			local szName = GetName();
			PlayerIndex = nOldIdx;
			return szName;
		end;
	end;
	return 0;
end;

function check_partner_sex()
	if GetTeamSize() ~= 2 then
		return 0;
	end;
	local nSex1,nSex2 = 0,0;
	local nOldIdx = PlayerIndex;
	PlayerIndex = GetTeamMember(1);
	nSex1 = GetSex();
	PlayerIndex = GetTeamMember(2);
	nSex2 = GetSex();
	PlayerIndex = nOldIdx;
	if nSex1 ~= nSex2 then
		return 1;
	else
		return 0;
	end;
end;

function check_partner_level()
	local nLevel1,nLevel2 = 0,0;
	local nOldIdx = PlayerIndex;
	PlayerIndex = GetTeamMember(1);
	nLevel1 = GetLevel();
	PlayerIndex = GetTeamMember(2);
	nLevel2 = GetLevel();
	PlayerIndex = nOldIdx;
	if nLevel1 < 50 or nLevel2 < 50 then
		return 0;
	else
		return 1;
	end;
end;

function nothing()

end;