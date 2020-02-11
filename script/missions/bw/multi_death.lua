Include("\\script\\missions\\bw\\bwhead.lua");

function OnDeath(Launcher)

local nTopMurderIndex = 0;
local news_str = "";
local nMurderName = "";
local nDecedentName = GetName();
local nMurderIndex = NpcIdx2PIdx(Launcher);
local nDecedentIndex = PlayerIndex;
 
 	PlayerIndex = nMurderIndex;
	nMurderName = GetName();
	SetTaskTemp(TOTAL_KILL_NUM,GetTaskTemp(TOTAL_KILL_NUM)+1);
	if GetMissionV(GAME_TYPE) == 2 then
		Earn(10000);
		news_str = nMurderName.."   gi誸  "..nDecedentName..", nh薾 頲 1 ti襫 v祅g. Hi謓  nh b筰"..GetTaskTemp(TOTAL_KILL_NUM).." ngi.";
	else
		news_str = nMurderName.."   gi誸  "..nDecedentName..". Hi謓  nh b筰"..GetTaskTemp(TOTAL_KILL_NUM).." ngi.";
	end
	PlayerIndex = nDecedentIndex;
	--发奖励给死者
	if GetMissionV(GAME_TYPE) == 1 then
		PayAward(1);
	end
	Msg2MSAll(MULIT_MISSION_ID,news_str);
	ShowTopKillNumPlayer() -- 以PK阵营1标识当前杀人对多的玩家
	DelMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
	SetMissionV(DECEDEND_NUM,GetMissionV(DECEDEND_NUM)+1);
	
	return 1
	
end
