Include("\\script\\missions\\bw\\bwhead.lua");

function OnDeath(Launcher)

local nTopMurderIndex = 0;
local news_str = "";
local nMurderName = "";
local nDecedentName = GetName();
local nMurderIndex = NpcIdx2PIdx(Launcher);
local nDecedentIndex = PlayerIndex;
local nKillNum = 0;
local nDeadNum = 0;
 
 	--…±»À ˝ƒøÕ≥º∆
 	PlayerIndex = nMurderIndex;
	nMurderName = GetName();
	SetTaskTemp(TOTAL_KILL_NUM,GetTaskTemp(TOTAL_KILL_NUM)+1);
	for i=1,gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if PlayerIndex > 0 then
			nKillNum = nKillNum + GetTaskTemp(TOTAL_KILL_NUM);
		end
	end
	news_str = nMurderName.."  Æ∑ gi’t  "..nDecedentName..", sË ng≠Íi ÆÈi nµy Æ∏nh bπi hi÷n lµ:"..nKillNum..".";
	PlayerIndex = nDecedentIndex;
	
	Msg2MSAll(TEAM_MISSION_ID,news_str);
	ShowTopKillTeamPlayer() -- “‘PK’Û”™1±Í ∂µ±«∞…±»À∂‘∂‡µƒ∂”ŒÈ
	
	SetMissionV(DECEDEND_NUM,GetMissionV(DECEDEND_NUM)+1);
	
	return -1
	
end
