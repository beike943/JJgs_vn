Include("\\script\\missions\\bw\\bwhead.lua")

function main()

local MapTab = {}
local nHundredMapID = 0;
local nMapIndex = 0;
local nNpcIndex = 0;

	for i=1,getn(MultiMapTab) do
		if MultiMapTab[i][2] == 300 then
			OldWorld = SubWorld
			SubWorld = SubWorldID2Idx(MultiMapTab[i][1])
			if SubWorld ~= -1 then
				if GetMissionV(MULTIMAP_STATE) == 0 then
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
	nHundredMapID = MultiMapTab[nMapIndex][1];
	
		if SubWorldID2Idx(nHundredMapID) ~= -1 then
			OldWorld = SubWorld;
			SubWorld = SubWorldID2Idx(nHundredMapID);
			
			if SubWorld <= 0 then
				WriteLog("[QuÇn hïng chiÕn]QuÇn hïng chiÕn b¸o lçi! nHundredMapID lµ"..nHundredMapID..". Kh«ng thÓ tiÕn hµnh thi ®Êu!");
				SubWorld = OldWorld;
				return 0
			end
			
			OpenMission(MULIT_MISSION_ID);
			SetMissionV(GAME_TYPE,2);
			StartMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID2, MULTI_TIMER_2);
			nNpcIndex = CreateNpc("Chñ cÇm ®å Trung Nguyªn","§¹i ChÝ C­êng",MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][6],MultiMapTab[nMapIndex][7]);--Ìí¼ÓÒ»¸ö´«ËÍ³ö³¡µØÓÃµÄNpc
  		SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\multimap_npc.lua")
  		SetMissionV(MULTIMAP_NPC_INDEX,nNpcIndex);
  		SubWorld = OldWorld
		end
	
	Msg2SubWorld("§¹i ChÝ C­êng thay mÆt chñ nh©n tæ chøc QuÇn hïng chiÕn t¹i l«i ®µi Thµnh §«! Hoan nghªnh c¸c anh hïng h¶o h¸n ®Õn b¸o danh!");
	AddGlobalNews("§¹i ChÝ C­êng thay mÆt chñ nh©n tæ chøc QuÇn hïng chiÕn t¹i l«i ®µi Thµnh §«! Hoan nghªnh c¸c anh hïng h¶o h¸n ®Õn b¸o danh!");
	
end