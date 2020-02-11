Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201211_DECORATE_TREE_TASK = TaskManager:Create(7,4)
VET_201211_DECORATE_TREE_TASK.DaySeq = 1;
VET_201211_DECORATE_TREE_TASK.UseTime = 2;
VET_201211_DECORATE_TREE_TASK.npcIndex = 3;
VET_201211_DECORATE_TREE_TASK.CreateTime = 4;
VET_201211_DECORATE_TREE_TASK.AwardTag = 5;

VET_201211_USETIME_MAX = 10;

VET_201211_NEED_LUSHUI = 5;

VET_201211_TREENPC_NAME = {
	{"C©y Gi¸ng sinh 2d", "C©y th«ng noel cÊp 1"},
	{"C©y Gi¸ng sinh 2c", "C©y th«ng Noel cÊp 2"},
	{"C©y Gi¸ng sinh 1c", "C©y th«ng Noel cÊp 3"},
	{"C©y Gi¸ng sinh 1b", "C©y th«ng Noel cÊp 4"},
	{"C©y Gi¸ng sinh 1a", "C©y th«ng Noel cÊp 5"},
}

function find_christmas_tree(strName)
	for i = 1, getn(VET_201211_TREENPC_NAME) do
		if VET_201211_TREENPC_NAME[i][2] == strName then
			return i;
		end
	end
	return 0;
end

--Ê¹ÓÃÊ¥µ®Ê÷µÀ¾ß
function OnUse(nItem)
	if gf_CheckBaseCondition(79) ~= 1 then
		return
	end
	if VET_201211_DECORATE_TREE_TASK:GetTask(VET_201211_DECORATE_TREE_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201211_DECORATE_TREE_TASK:SetTask(VET_201211_DECORATE_TREE_TASK.DaySeq, zgc_pub_day_turn());
		VET_201211_DECORATE_TREE_TASK:SetTask(VET_201211_DECORATE_TREE_TASK.UseTime, 0);
	end
	if VET_201211_DECORATE_TREE_TASK:GetTask(VET_201211_DECORATE_TREE_TASK.UseTime) >= 10 then
		Talk(1,"",format("Mçi ngµy mçi nh©n vËt vËt chØ ®­îc trang trÝ <color=red>%d<color> c©y th«ng Noel", VET_201211_USETIME_MAX));
		return
	end
	local nMapId, nX, nY = GetWorldPos();
	if gf_MapIsAllow({100,150,200,300,350,400,500},nMapId) ~= 1 then
		Talk(1,"","§¹o cô kh«ng thÓ sö dông t¹i khu vùc nµy");
		return
	end
	if GetItemCount(2, 0, 351) < VET_201211_NEED_LUSHUI then
		Talk(1,"","Kh«ng ®ñ lé thñy");
		return
	end
	local nNpcTempIndex = VET_201211_DECORATE_TREE_TASK:GetTask(VET_201211_DECORATE_TREE_TASK.npcIndex);
	if find_christmas_tree(GetNpcName(nNpcTempIndex)) ~= 0 then
		Talk(1,"","ThiÕu hiÖp ®· ®Æt xuèng 1 c©y th«ng noel.") 
		return
	end
	if DelItem(2,1,30471,1) == 1 and DelItem(2, 0, 351, VET_201211_NEED_LUSHUI) == 1 then
		local npcIndex = CreateNpc(VET_201211_TREENPC_NAME[1][1], VET_201211_TREENPC_NAME[1][2], nMapId, nX, nY);
		SetNpcScript(npcIndex, "\\script\\online_activites\\201211\\npc_decorate.lua");
		SetNpcLifeTime(npcIndex, 3 * 60);
		VET_201211_DECORATE_TREE_TASK:SetTask(VET_201211_DECORATE_TREE_TASK.npcIndex, npcIndex);
		VET_201211_DECORATE_TREE_TASK:SetTask(VET_201211_DECORATE_TREE_TASK.CreateTime, GetTime());
		VET_201211_DECORATE_TREE_TASK:SetTask(VET_201211_DECORATE_TREE_TASK.UseTime, VET_201211_DECORATE_TREE_TASK:GetTask(VET_201211_DECORATE_TREE_TASK.UseTime) + 1);
		gf_Modify("Exp", 600000);
	end
end