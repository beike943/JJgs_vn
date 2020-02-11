Include("\\script\\newbattles\\resourcebattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\resourcebattle\\position.lua");
		
MAX_RESOURCE_COUNT = 110;
		
BATTLE_TYPE = RESOURCE_ID;	--Õ½³¡ÀàÐÍ

ENTRANCE_POINT = 	--½øÈëµã
{
	[SONG_ID] = {MAPID_SONG,1572,3555},
	[LIAO_ID] = {MAPID_LIAO,1766,3182},
};

DIGGING_ACTION_ID = 890;	--ÍÚÁ¸²Ý¶¯×÷ID

DEATH_SCRIPT = "\\script\\newbattles\\resourcebattle\\playerdeath.lua";

CATERAN_GROUP_SONG = 23;	--É½ÔôNPCÈÎÎñ×é
CATERAN_GROUP_LIAO = 24;

CATERAN_COUNT = getn(tCateranSong);

TOE_MAX_USE_TIMES = 45;	--³úÍ·×î´óÊ¹ÓÃ´ÎÊý

--µÃµ½Ëæ»ú×ÊÔ´
function Get_Random_Resource(nMultiple)
	if nMultiple == nil then
		nMultiple = 1;
	end;
	local nCamp = BT_GetCamp();
	local nRandomNum = random(1,100);
	if nRandomNum <= 60 then
		Get_Resource(1,nMultiple);	--³õ¼¶Á¸²Ý
	elseif nRandomNum <= 80 then
		Get_Resource(2,nMultiple);	--ÖÐ¼¶Á¸²Ý
	elseif nRandomNum <= 90 then
		Msg2MSGroup(MISSION_ID,"Ng­êi ch¬i"..GetName().."t¹i Nh¹n M«n Quan-Th¶o cèc chiÕn ®µo bíi bõa b·i ¶nh h­ëng ®Õn m«i tr­êng nªn bÞ thæ d©n truy ®uæi, chê t­íng sÜ ®Õn gi¶i cøu.",nCamp);
		local npcIndex = CreateNpc("Hoµn tr­êng Thæ d©n","Thæ d©n hé rõng",GetWorldPos());
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\resourcebattle\\environmentalist_death.lua");
	else
		Msg2Player("Ng­¬i vÊt v¶ ®µo bíi vÉn kh«ng t×m ®­îc g×");
	end;
end;
--µÃµ½Ä³ÖÖ¹Ì¶¨×ÊÔ´
function Get_Resource(nType,nMultiple)
	if nMultiple == nil then
		nMultiple = 1;
	end;
	AddItem(tBattleItem[nType][2],tBattleItem[nType][3],tBattleItem[nType][4],nMultiple);
	Msg2Player("B¹n nhËn ®­îc "..nMultiple.." phÇn"..tBattleItem[nType][1]);
end;
--Á¸²ÝÔö¼Ó
function Add_Resource(nCamp,nResNum)
	SetMissionV(MV_RESOURCE_SONG+nCamp-1,GetMissionV(MV_RESOURCE_SONG+nCamp-1)+nResNum);
end;
--Á¸²Ý¼õÉÙ
function Dec_Resource(nCamp,nResNum)
	SetMissionV(MV_RESOURCE_SONG+nCamp-1,GetMissionV(MV_RESOURCE_SONG+nCamp-1)-nResNum);
	if GetMissionV(MV_RESOURCE_SONG+nCamp-1) < 0 then
		SetMissionV(MV_RESOURCE_SONG+nCamp-1,0);
	end;
end;
--µÃµ½Á¸²ÝµÄÊýÁ¿
function Get_ResCount(nCamp)
	return GetMissionV(MV_RESOURCE_SONG+nCamp-1);
end;
--ÓÉÁ¸²ÝNPC×ø±êµÃµ½Á¸²ÝNPCµÄÎ»ÖÃË÷Òý
--function Get_ResIndex_ByPos2(nMapX,nMapY)	
--	local nX = ceil(floor(abs((abs(nMapX-1605)-1))/7)/2);	--Õâ¾ÍÊÇÃ»ÓÐºÃºÃ·ÖÎöÎÊÌâËùµ¼ÖÂµÄ¸´ÔÓ¹«Ê½
--	local nY = ceil(floor(abs((abs(nMapY-3240)-1))/13)/2);
--	return 11*nX+nY+1;
--end;
--ÓÉÁ¸²ÝNPC×ø±êµÃµ½Á¸²ÝNPCµÄÎ»ÖÃË÷Òý
function Get_ResIndex_ByPos(nMapX,nMapY)
	local nX = floor((nMapX-1598)/14);	--Õâ¸ö¹«Ê½¼òµ¥Ã÷ÁË
	local nY = floor((nMapY-3227)/26);
	return 11*nX+nY+1;
end;
--ÓÉÁ¸²ÝNPCµÄÎ»ÖÃË÷ÒýµÃµ½Á¸²ÝNPCµÄ×ø±ê
function Get_ResPos_ByIndex(nIndex)
	local nMapX,nMapY = 0,0;	
	nMapX = floor((nIndex-1)/10)*14+1605;
	nMapY = mod((nIndex-1),10)*26+3240;
	return nMapX,nMapY;
end;
--Ë¢ÐÂÁ¸²ÝÇøÓò
function Reflash_Res()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return
	end;
	local nGroup,nBit = 0,0;
	for i=1,MAX_RESOURCE_COUNT do
		nGroup = floor(i/32);
		nBit = mod((i-1),32)+1;
		if GetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit) == 1 then
			SetMissionV(MV_RESOURCE_POS_BEGIN+nGroup,SetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit,0));
		end;
	end;
end;
--´´½¨Á¸²ÝNPC
function Create_Res_Npc(nCount)
	if nCount <= 0 then
		return
	end;
	if nCount == nil then
		nCount = 1;
	end;
	for i=1,nCount do
		local nRandPos = random(1,MAX_RESOURCE_COUNT);	
		local nMapX,nMapY = Get_ResPos_ByIndex(nRandPos);
		local npcIndex = CreateNpc("Khu vùc l­¬ng th¶o cao cÊp","L­¬ng th¶o",MAPID,nMapX,nMapY,-1,1,1,20);
		SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\resource_npc.lua");
	end;
end;
--´´½¨¾üÐè¹Ù
function Create_QuarterMaster()
	local sCampName1,sCampName2 = "Mé L­¬ng Quan-Tèng","Mé l­¬ng quan phe Liªu";
	if GetGlbValue(RANDOM_PLACE) == 1 then
		sCampName1 = "Mé l­¬ng quan phe Liªu";
		sCampName2 = "Mé L­¬ng Quan-Tèng";
	end;
	local npcIndex = CreateNpc("V­¬ng An Th¹ch",sCampName1,MAPID,1607,3494);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\quartermaster_npc.lua");
 	npcIndex = CreateNpc("V­¬ng An Th¹ch",sCampName2,MAPID,1720,3248);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\quartermaster_npc.lua");
end;
--´¥·¢Ò»´ÎÉ½Ôô½ÙºóÓªÊÂ¼þ
function Create_Cateran_Even()
	local nSongStone = GetMissionV(MV_STONE_COUNT_SONG);
	local nLiaoStone = GetMissionV(MV_STONE_COUNT_LIAO);
	if nSongStone > nLiaoStone then
		Msg2MSAll(MISSION_ID,"HuyÒn thiÕt kho¸ng th¹ch ®«i bªn giao nép vßng nµy lµ: Tèng"..nSongStone.." , Liªu "..nLiaoStone..", hËu doanh Liªu xuÊt hiÖn ®¸m s¬n tÆc ®ang c­íp bãc l­¬ng th¶o.");
		Create_Cateran(SONG_ID,CATERAN_COUNT);
	elseif nSongStone < nLiaoStone then
		Msg2MSAll(MISSION_ID,"HuyÒn thiÕt kho¸ng th¹ch ®«i bªn giao nép vßng nµy lµ: Tèng"..nSongStone.." , Liªu "..nLiaoStone..", hËu doanh Tèng xuÊt hiÖn ®¸m s¬n tÆc ®ang c­íp bãc l­¬ng th¶o.");
		Create_Cateran(LIAO_ID,CATERAN_COUNT);
	else
		Msg2MSAll(MISSION_ID,"HuyÒn thiÕt kho¸ng th¹ch ®«i bªn giao nép vßng nµy ®Òu lµ"..nSongStone..", ®¸m s¬n tÆc d­êng nh­ ch­a cã ®éng tÜnh");
	end;
	SetMissionV(MV_STONE_COUNT_SONG,0);
	SetMissionV(MV_STONE_COUNT_LIAO,0);
	SetMissionV(MV_CHANGEDRUMLEFT_SONG,DRUM_COUNT)	--³õÊ¼»¯Õ½¹ÄÊýÁ¿
	SetMissionV(MV_CHANGEDRUMLEFT_LIAO,DRUM_COUNT)	--³õÊ¼»¯Õ½¹ÄÊýÁ¿
end;
--´´½¨ºóÓªÉ½Ôô
function Create_Cateran(nCamp,nCount)
	local tPosTable = {tCateranSong,tCateranLiao};
	local nEnemyCamp = 3 - nCamp;
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tPos = tPosTable[3-nCampPlace];
	if nCount > getn(tPos) then
		BT_ShowDebugInfor("Create_Cateran b¸o lçi, tham sè nCount phi ph¸p");
		return 0;
	end;
	local nNpcIndex = 0;
	for i=1,nCount do
		nNpcIndex = CreateNpc("S¬n tÆc l©u la","S¬n tÆc ("..tCampNameZ[nCamp]..")",MAPID,tPos[i][1],tPos[i][2]);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\resourcebattle\\cateran_death.lua");
		AddGroupUnit(CATERAN_GROUP_SONG+nCamp-1,nNpcIndex);
	end;
	SetMissionV(MV_SP_TIMER_LOOP,CATERAN_TIMER_LOOP);	--60ÃëÌØÊâÊÂ¼þ
	SetMissionV(MV_SP_TIMER_STATE,TM_STATE_CATERAN_SONG+nCamp-1);
	StartMissionTimer(MISSION_ID,CATERAN_TIMER_ID,CATERAN_TIME);
	Msg2MSGroup(MISSION_ID,"T×nh huèng khÈn cÊp: HËu doanh phe ta xuÊt hiÖn nhiÒu s¬n tÆc, nÕu kh«ng kÞp thêi ng¨n chÆn, 15 gi©y sau kho l­¬ng sÏ bÞ tæn thÊt nghiªm träng.",nEnemyCamp);
end;

function Use_Hoe()
	BT_SetData(PTNC_USE_HOE_TIMES,BT_GetData(PTNC_USE_HOE_TIMES)+1);
	if BT_GetData(PTNC_USE_HOE_TIMES) >= TOE_MAX_USE_TIMES then
		DelItem(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4],1);
		Msg2Player("Cuèc cña b¹n ®· háng!");
		return 1;	--ÒÑËð»µ
	end;
	Msg2Player("Cuèc cña b¹n cßn sö dông ®­îc "..(TOE_MAX_USE_TIMES-BT_GetData(PTNC_USE_HOE_TIMES)).." lÇn");
	return 0;	--»¹¿ÉÒÔÓÃ
end;