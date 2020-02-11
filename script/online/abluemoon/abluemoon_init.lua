--随机生成兔小丫NPC脚本,顺便打开一个MISSION
tMap = {
	{"泉州", 100, 1459, 2811},
	{"汴京", 200, 1169, 2845},
	{"成都", 300, 1653, 3559},
	{"襄阳", 350, 1436, 2808},
	{"扬州", 150, 1680, 3118},
	{"大理", 400, 1485, 3018},
}

function abluemoon_init(nMapID)
	SubWorld = SubWorldID2Idx(tMap[nMapID][2]);
	AddGlobalNews("科考官兔小丫已经在"..tMap[nMapID][1].."设下考场，大家赶快前去参加剑网2第一届科举考试！")
	Msg2Global("科考官兔小丫已经在"..tMap[nMapID][1].."设下考场，大家赶快前去参加剑网2第一届科举考试！")	
	if SubWorld >= 0 then
		OpenMission(33);  
		npcIndex = CreateNpc("兔小丫","兔小丫",tMap[nMapID][2],tMap[nMapID][3],tMap[nMapID][4]);
		SetNpcLifeTime(npcIndex,1*60*60);  --NPC生存时间1小时
		SetNpcScript(npcIndex,"\\script\\online\\abluemoon\\abluemoon_npc.lua");
		SetMissionV(10,npcIndex)
	end
end
