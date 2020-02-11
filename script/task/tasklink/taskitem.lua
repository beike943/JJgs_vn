--ÈÕ³£ÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\richangrenwu\\head.lua");
tTaskItemName = 
{
	{"B¾c Lôc L©m lÖnh",2,0,399},
	{"Trôc ¶nh Th­¬ng",2,0,400},
	{"TuyÖt T×nh Th¹ch",2,0,401},
	{"LÖnh bµi tæng qu¶n ngo¹i viÖn",2,0,402},
	{"LÖnh bµi tæng qu¶n néi viÖn",2,0,403},
	{"ViÖt N÷ kiÕm",2,0,404},
	{"Trang chñ kim Ên",2,0,405},
	{"Tr­ëng L·o ChØ Hoµn",2,0,406},
}

function main()
	local npcIndex,npcModel,npcName = GetTriggeringUnit();
	if npcIndex == 0 then
		return 0;
	end;
     --ÊÇ·ñÍê³ÉÍÅ¶ÓÈÕ³£ÈÎÎñ
	local nDate = tonumber(date("%y%m%d"));
    	if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        	SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        	SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    	end
     local nTeamTask = GetGlbValue(DAILY_TASK_0912_TEAM_TASK);
	local nTaskValue = GetTask(345);
--	if nTaskValue == 0 and  nTeamTask == 0 and GetTask(DAILY_TASK_0912_TEAM_TASK_ID) == 0 then
--		return 0;
--	end;
	if nTaskValue > 0 then		
		if tTaskItemName[nTaskValue][1] ~= npcName  then
			Talk(1,"","VËt phÈm nµy kh«ng ®óng!");
			return 0;
		end;
	elseif nTeamTask > 0 and GetTask(DAILY_TASK_0912_TEAM_TASK_ID) > 0 then
		if DALIY_TASK_0912_TEAM_TASK_LIST[nTeamTask][3] ~= npcName then
			Talk(1,"","VËt phÈm nµy kh«ng ®óng!");
			return 0;			
		end
		nTaskValue = nTeamTask
--	NhiÖm vô chuyÓn sinh theo TaskTrans
	elseif GetTask(1537) == 11 or GetTask(1537) == 17 or GetTask(1537) == 29 then
		if npcName == "B¾c Lôc L©m lÖnh" then
			nTaskValue = 1
		elseif npcName == "Trôc ¶nh Th­¬ng" then
			nTaskValue = 2
		elseif npcName == "TuyÖt T×nh Th¹ch" then
			nTaskValue = 3
		else
			return 0;
		end
	else
		return 0;
	end		
		
	local selTab = {
			"LËp tøc nhÆt lªn!/#pickup("..npcIndex..","..nTaskValue..")",
			"§Ó ta suy nghÜ!/nothing",
			}
	Say("§©y lµ thø s­ phô muèn ta ®em vÒ sao??",getn(selTab),selTab);
end;

function pickup(npcIndex,ItemNum)	
	local npcName = GetNpcName(npcIndex) or ""	
	if npcName == nil or  npcName == "" then
		Talk(1,"","VËt phÈm ®· bŞ ng­êi kh¸c nhÆt mÊt råi!");
		return 0;
	end
	SetNpcLifeTime(npcIndex,0);
	SetNpcScript(npcIndex,"");
	local nRetCode = AddItem(tTaskItemName[ItemNum][2],tTaskItemName[ItemNum][3],tTaskItemName[ItemNum][4],1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc "..tTaskItemName[ItemNum][1])
	end;
	if DAILY_TASK_0912_SWITCH == 1 then
            is_he_finish_the_team_task(npcName);
     end
	WriteLog("[NhiÖm vô lËp l¹i s­ m«n]:"..GetName().."nhËn ®­îc"..tTaskItemName[ItemNum][1]..". AddItem trŞ quay l¹i lµ:"..nRetCode);
end;

function nothing()

end;