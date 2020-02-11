Include("\\script\\missions\\bw\\bwhead.lua")

function main()

local MapTab = {}
local nGemeTeamMapID = 0;
local nMapIndex = 0;
local nNpcIndex = 0;

	for i=1,getn(TeamMapTab) do
		if TeamMapTab[i][2] == 300 then
			OldWorld = SubWorld
			SubWorld = SubWorldID2Idx(TeamMapTab[i][1])
			if SubWorld ~= -1 then
				if GetMissionV(TEAM_GAME_STATE) == 0 then
					tinsert(MapTab,i)
				end
			end
			SubWorld = OldWorld
		end
	end
	
	if getn(MapTab) == 0 then
		WriteLog("[QuÇn hïng chiÕn]QuÇn hïng chiÕn b¸o lçi! Kh«ng t×m thÊy khu vùc môc tiªu! Xin kiÓm tra l¹i!");
		return 0
	end
	
	nMapIndex = MapTab[random(1,getn(MapTab))];
	nGemeTeamMapID = TeamMapTab[nMapIndex][1];
	
		if SubWorldID2Idx(nGemeTeamMapID) ~= -1 then
			OldWorld = SubWorld;
			SubWorld = SubWorldID2Idx(nGemeTeamMapID);
			
			if SubWorld <= 0 then
				WriteLog("[QuÇn hïng chiÕn]QuÇn hïng chiÕn b¸o lçi! nHundredMapID lµ"..nHundredMapID..". Kh«ng thÓ tiÕn hµnh thi ®Êu!");
				SubWorld = OldWorld;
				return 0
			end
			
			OpenMission(TEAM_MISSION_ID);
			SetMissionV(GAME_TYPE,3);
			StartMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID2,TEAM_TIMER_2);
			nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn","§¹i ChÝ C­êng",TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][6],TeamMapTab[nMapIndex][7]);--Ìí¼ÓÒ»¸ö´«ËÍ³ö³¡µØÓÃµÄNpc
  		SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\team_game_npc.lua")
  		SetMissionV(NPC_INDEX,nNpcIndex);
  		SubWorld = OldWorld
		end
	
	Msg2SubWorld("§¹i ChÝ C­êng thay mÆt chñ nh©n tæ chøc §éi chiÕn t¹i l«i ®µi Thµnh §«! Hoan nghªnh c¸c anh hïng h¶o h¸n ®Õn b¸o danh!");
	AddGlobalNews("§¹i ChÝ C­êng thay mÆt chñ nh©n tæ chøc §éi chiÕn t¹i l«i ®µi Thµnh §«! Hoan nghªnh c¸c anh hïng h¶o h¸n ®Õn b¸o danh!");
	
end