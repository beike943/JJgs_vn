Include("\\script\\missions\\bw\\bwhead.lua");

function OnDeath(Launcher)

local news_str = "";
local nMurderName = "";
local nDecedentName = GetName();
local nMurderIndex = NpcIdx2PIdx(Launcher);
local nDecedentIndex = PlayerIndex;
	
	OldPlayer = PlayerIndex;
	PlayerIndex = nMurderIndex;
	if PlayerIndex > 0 then
		nMurderName = GetName();
	end
	PlayerIndex = OldPlayer;
	
	news_str = nMurderName.."  Æ∑ gi’t  "..nDecedentName;
	Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
	
	return -1
	
end