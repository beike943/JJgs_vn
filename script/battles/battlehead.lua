IncludeLib("FILESYS");
Include("\\script\\battles\\emulation_battle.lua")
Include("\\script\\shinynight_head.lua")

		PL_TOTALPOINT = 1	--40¼¶Õ½³¡µÄµ±Ç°Õ½¹¦
		PL_KILLPLAYER = 2
		PL_KILLNPC = 3
		PL_BEKILLED = 4
		PL_SNAPFLAG = 5
		PL_KILLRANK1 = 6
		PL_KILLRANK2 = 7
		PL_KILLRANK3 = 8
		PL_KILLRANK4 = 9
		PL_KILLRANK5 = 10
		PL_KILLRANK6 = 11
		PL_KILLRANK7 = 12
		PL_MAXSERIESKILL = 13		--Íæ¼ÒÕû¸öÕ½¾ÖµÄ×î´óÁ¬Õ¶Êý
		PL_SERIESKILL = 14			--Íæ¼Òµ±Ç°µÄÁ¬Õ¶Êý
		PL_FINISHGOAL = 15
		PL_1VS1 = 16
		PL_GETITEM = 17
		PL_WINSIDE = 18
		PL_PRISEGRADE = 19	
		PL_AVERAGEGRADE = 20
		PL_WINGRADE = 21	
		PL_PARAM1 = 22
		PL_PARAM2 = 23
		PL_PARAM3 = 24
		PL_PARAM4 = 25
		PL_PARAM5 = 26
		PL_CURRANK = 27	-- =PL_PARAM6 = 27 ±íÊ¾Íæ¼Òµ±Ç°µÄ¹ÙÖ°£¬Ä¿Ç°Ê¹ÓÃµÚ6ºÅ²ÎÊý
		
		PL_BATTLEID=41
		PL_RULEID=42
		PL_BATTLECAMP = 43
		PL_BATTLESERIES = 44 --¼ÇÂ¼Íæ¼ÒÉÏÒ»´Î²Î¼ÓÕ½ÒÛµÄÕ½ÒÛÁ÷Ë®ºÅ
		PL_KEYNUMBER = 45
		PL_LASTDEATHTIME = 46
		PL_BATTLEPOINT = 47	--¼ÇÂ¼Íæ¼Ò±¾Õ½ÒÛµÄ×ÜÕ½¹¦£¬×ÜÕ½¹¦ÊÇÍæ¼ÒËù²Î¼ÓµÄ¸÷³¡Õ½¾ÖµÄÕ½¹¦×ÜºÍ, E(PL_TOTALPOINT1 + PL_TOTALPOINT2+ ...)
		PL_ROUND = 48
		
		PL_LEAVETIME = 28			--ÖÐÍ¾ÍË³öÕ½³¡µÄÊ±¼ä
		
		GAME_KEY = 1
		GAME_BATTLEID = 2
		GAME_RULEID = 3
		GAME_MAPID = 4	
		GAME_CAMP1 = 5
		GAME_CAMP2 = 6
		GAME_MAPICONID = 7
		GAME_RESTTIME = 8
		GAME_LEVEL = 9 
		GAME_MODE = 10
		GAME_CAMP1AREA= 11
		GAME_CAMP2AREA= 12
		GAME_BATTLESERIES = 13
		GAME_ROUND = 14
		
		tbRANKNAME={"Binh sÜ", "HiÖu óy", "Thèng LÜnh", "Phã T­íng", "§¹i T­íng" , "Nguyªn So¸i"}
		
		
		MS_STATE = 1
		
		MS_TRANK1_S = 30; --ËÎ1¼¶NpcµÄÄ£°åIDµÄMissionV ID
		MS_TRANK1_J = MS_TRANK1_S + 6; --ÁÉ·½1¼¶NpcµÄÄ£°åIDµÄMissionV ID
		MS_RANK1LVL_S = MS_TRANK1_J + 6;--ËÎ·½1¼¶NpcµÄµÈ¼¶ MissionV ID
		MS_RANK1LVL_J = MS_RANK1LVL_S + 6;--ÁÉ·½1¼¶NpcµÄµÈ¼¶ MissionV ID
		MS_NPCCOUNT1_S = MS_RANK1LVL_J + 6;
		MS_NPCCOUNT1_J = MS_NPCCOUNT1_S + 6;
		MS_CALLNPCCOUNT_S = MS_NPCCOUNT1_J + 6 --¼ÇÂ¼ËÎ·½ÕÙ»½NpcµÄ´ÎÊý
		MS_CALLNPCCOUNT_J = MS_CALLNPCCOUNT_S + 1 --¼ÇÂ¼ÁÉ·½ÕÙ»½NpcµÄ´ÎÊý
	
		MAX_CALLNPCCOUNT = 10;	
		GLB_BATTLESTATE = 30
		GLB_FORBIDBATTLE = 31;--µ±¸ÃÖµ1Ê±±íÊ¾Í£Ö¹Õ½ÒÛµÄÆô¶¯
	--Èý¸öµÈ¼¶±¨ÃûµãµÄ×ø±ê
	S_SIGNUPTAB = {};


	BONUS_KILLPLAYER = 2
	BONUS_SNAPFLAG = 600
	BONUS_KILLNPC = 1
	BONUS_KILLRANK1 = 5
	BONUS_KILLRANK2 = 30
	BONUS_KILLRANK3 = 150
	BONUS_KILLRANK4 = 250
	BONUS_KILLRANK5 = 500
	BONUS_KILLRANK6 = 1000
	BONUS_MAXSERIESKILL = 10
	BONUS_GETITEM = 50
	BONUS_1VS1 = 400
	
	RA_KILL_PL_RANK = {7, 2.334, 0.934, 0.84, 0.56, 0.35}	
 	--7 Íæ¼ÒÊ¿±ø	--7/3 Íæ¼ÒÐ£Î¾	--14/15 Íæ¼ÒÍ³Áì	--21/25 Íæ¼Ò¸±½«	--14/25 Íæ¼Ò´ó½«	--7/20 Íæ¼ÒÔªË§
	
	TITLE_BONUSRANK1 = 0		--³ÉÎªÏàÓ¦Í·ÏÎËùÐèÕ½¹¦Öµ
	TITLE_BONUSRANK2 = 10000
	TITLE_BONUSRANK3 = 20000
	TITLE_BONUSRANK4 = 40000
	TITLE_BONUSRANK5 = 60000
	TITLE_BONUSRANK6 = 80000

	TITLE_PL2RANK1_N = 400		--ÏàÓ¦Í·ÏÎµÄÍæ¼Ò×î´óÈËÊý
	TITLE_PL2RANK2_N = 60
	TITLE_PL2RANK3_N = 25
	TITLE_PL2RANK4_N = 10
	TITLE_PL2RANK5_N = 5
	TITLE_PL2RANK6_N = 1

	MS_PL2RANK1_S = 70		--µ±Ç°mission£¬ËÎ·½ÖÐÒÑ¾­³ÉÎª"Ê¿±ø"Í·ÏÎµÄÈËÊý
	MS_PL2RANK2_S = 71
	MS_PL2RANK3_S = 72
	MS_PL2RANK4_S = 73
	MS_PL2RANK5_S = 74
	MS_PL2RANK6_S = 75

	MS_PL2RANK1_J = 76		--µ±Ç°mission£¬ÁÉ·½ÖÐÒÑ¾­³ÉÎª"Ê¿±ø"Í·ÏÎµÄÈËÊý
	MS_PL2RANK2_J = 77		--Ð£Î¾
	MS_PL2RANK3_J = 78		--Í³Áì
	MS_PL2RANK4_J = 79		--¸±½«
	MS_PL2RANK5_J = 80		--´ó½«
	MS_PL2RANK6_J = 81		--ÔªË§

	
	tbGAME_SIGNMAP = {806, 808} --¼ÇÂ¼¸÷µÈ¼¶±¨ÃûµãµÄµØÍ¼IDºÅ £¬µÈ¼¶°´µÍ¼¶Ïò¸ß¼¶ÅÅ²¼
	tbSIGNMAP_POS = {{1748,3060} , {1635,3192}}
	szGAME_GAMELEVEL = {"Khu vùc s¬ cÊp", "Khu vùc cao cÊp"}
	
	tbBATTLEMAP = {807, 809};--ËùÓÐÕ½ÒÛÓÃµ½µÄµØÍ¼ÁÐ±í
	tbNPCPOS = {"npcpos1", "npcpos2"}
	TNPC_DOCTOR1 = 55;--¾üÒ½µÄNpcÄ£°åIDºÅ
	TNPC_DOCTOR2 = 49;
	TNPC_SYMBOL1 = 629;
	TNPC_SYMBOL2 = 630;
	TNPC_DEPOSIT1 = 625;
	TNPC_DEPOSIT2 = 999;
	
	TNPC_FLAG0 = 626;
	TNPC_FLAG1 = 628;
	TNPC_FLAG2 = 627;
	
	tbTNPC_SOLDIER = {{631,632,633,634,635,636}, {637, 638, 639, 640, 641, 642}}

--¸ù¾Ý±¨ÃûµØÍ¼µÄid£¬»ñµÃËùÊôµÄÕ½ÒÛµÈ¼¶
function bt_map2battlelevel(mapid)
	for i = 1, getn(tbGAME_SIGNMAP) do 
		if (mapid == tbGAME_SIGNMAP[i])	then
			return i
		end
	end
	return 0
end

--»ñµÃÄ³¸öµÈ¼¶±¨ÃûµãµÄ×ø±ê
function bt_getsignpos(camp)
	if (camp <= 0 or camp > 2) then
		camp = 1
	end
	
	level = GetLevel();
	
	if (level < 70)  then
		return tbGAME_SIGNMAP[1], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
	else
		return tbGAME_SIGNMAP[2], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
	end
end;
		
		
--¸ù¾ÝtrapfileµÄÎÄ¼þµÄ×ø±ê¼¯ºÏ±í£¬²úÉúËùÓÐµÄtrapµã£¬²¢¹ØÁªscriptfileµÄ½Å±¾		
function bt_addtrap(trapfile, scriptfile)
	local count = GetTabFileHeight(trapfile);
--	scriptid = FileName2Id(scriptfile);
	
	ID = SubWorldIdx2ID(SubWorld);
	
	for i = 1, count - 1 do
		x = GetTabFileData(trapfile, i + 1, 1);
		y = GetTabFileData(trapfile, i + 1, 2);
		AddMapTrap(ID, x,y, scriptfile);
	end;
end;	

--"123,234" -> 123 , 234,½«Ò»¸ö×Ö·û´®Ð´³ÉµÄ×ø±êÊý¾Ý×ª»¯³ÉÁ½¸öÊý×Ö±äÁ¿
function bt_str2xydata(str)
	m = strfind(str,",")
	x = tonumber(strsub(str,0,m-1))
	y = tonumber(strsub(str,m+1))
	return x,y
end

--´Ó×ø±êÎÄ¼þÖÐËæ»ú»ñµÃÒ»¸ö×ø±ê
function bt_getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

--¸ù¾ÝnpcfileµÄÎÄ¼þµÄ×ø±ê¼¯ºÏ±í£¬²úÉúËùÓÐµÄnpcÄ£°åºÅÎªtnpcidµÄ¶Ô»°npc£¬²¢¹ØÁªscriptfileµÄ½Å±¾		
function bt_adddiagnpc(npcfile, scriptfile, tnpcid, name)
	addcount = 0;
	local count = GetTabFileHeight(npcfile);
	
	for i = 1, count - 1 do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1, name)			
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y);
		end

		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	
function bt_add_a_diagnpc(scriptfile, tnpcid, x, y, name)
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1 , name);
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y )
		end
		
		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
		return npcidx
end

--¸ù¾ÝnpcfileµÄÎÄ¼þµÄ×ø±ê¼¯ºÏ±í£¬²úÉúËùÓÐµÄnpcÄ£°åºÅÎªtnpcidµÄÕ½¶·ÀàÐÍnpc
function bt_addfightnpc (npcfile, tnpcid, level, camp, removewhendeath, name, boss)
	addcount = 0;
	local count = GetTabFileHeight(npcfile) - 1;
	
	l_removedeath = 1;
	l_name = "";
	l_boss = 0;
	
	if (removewhendeath ~= nil) then
		l_removedeath = removewhendeath
	end;
	
	if (name ~= nil or name ~= "" ) then
		l_name = name
	end
	
	if (boss ~= nil) then
		l_boss = boss
	end
	
	for i = 1, count  do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		npcidx = AddNpc(tnpcid, level, SubWorld, x, y, l_removedeath, l_name, l_boss);
		if (npcidx > 0) then
			SetNpcCurCamp(npcidx, camp)
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add fight npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	


--¸ù¾ÝnpcfileµÄÎÄ¼þµÄ×ø±ê¼¯ºÏ±í£¬ Ëæ»úµÄ²úÉúÒÔnpcÄ£°åºÅÎªtnpcidµÄÕ½¶·ÀàÐÍnpc
function bt_addrandfightnpc(npcfile, tnpcid, level, camp,count, deathscript, removewhendeath, name, boss)
	addcount = 0;
	
	if (count <= 0) then
		return
	end
	
	local totalcount = GetTabFileHeight(npcfile) - 1;
	if (totalcount <= 0 ) then
		return
	end
	
	l_removedeath = 1;
	l_name = "";
	l_boss = 0;
	
	if (removewhendeath ~= nil) then
		l_removedeath = removewhendeath
	end;
	
	if (name ~= nil or name ~= "" ) then
		l_name = name
	end
	
	if (boss ~= nil) then
		l_boss = boss
	end

	for i = 1, count do
		id = random(totalcount)
		x = GetTabFileData(npcfile, id + 1, 1);
		y = GetTabFileData(npcfile, id + 1, 2);
		npcidx = AddNpc(tnpcid, level, SubWorld, x, y, l_removedeath, l_name, l_boss);
		if (npcidx > 0) then
			SetNpcCurCamp(npcidx, camp)
			SetNpcDeathScript(npcidx, deathscript) 
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add fight npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	

function delnpcsafe(nNpcIndex)
if (nNpcIndex <= 0 )  then
	return
end

PIdx = NpcIdx2PIdx(nNpcIndex);
if (PIdx > 0) then 
	WriteLog("B¸o lçi! ! ! DelNpc muèn xãa bá ng­êi ch¬i nµo ®ã");
	return
end;

DelNpc(nNpcIndex)
end;


-------------------------------------------------------------------------
--Camp±íÊ¾¶Ô»°µÄÖ÷¹ÜÊÇÄÄ·½µÄ£¬1ÎªËÎ£¬2ÎªÁÉ·½
--Èç¹ûµÈÓÚ1 ±íÊ¾ÒÑ¾­ÔÚ±¾³¡Õ½¾ÖÖÐ±¨¹ýÃûÁË£¬²¢ÇÒÊôÓÚÕâ¸öÕóÓª
--Èç¹ûµÈÓÚ2 ±íÊ¾ÒÑ¾­ÔÚ±¾³¡Õ½¾ÖÖÐ±¨¹ýÃûÁË£¬µ«ÊÇ²»ÊôÓÚÕâ¸öÕóÓª
--Èç¹ûµÈÓÚ0 ±íÊ¾ÉÐÎ´±¨Ãû¡£

function bt_checklastbattle(Camp)

local MKey = BT_GetGameData(GAME_KEY); --µ±Ç°Õ½ÒÛµÄÎ¨Ò»KeyÂë
local BattleId = BT_GetGameData(GAME_BATTLEID); --¸ÃÕ½ÒÛÀàÐÍµÄID
local RuleId = BT_GetGameData(GAME_RULEID);

if ( MKey == BT_GetData(PL_KEYNUMBER) and BattleId == BT_GetData(PL_BATTLEID) and BT_GetData(PL_ROUND) == BT_GetGameData(GAME_ROUND) ) then
	if (Camp == BT_GetData(PL_BATTLECAMP)) then
		return 1
	else
		return 2
	end
else
	return 0
end;

end
-------------------------------------------------------------------------
function bt_setnormaltask2type()
--701ÒÑ¾­±»Õ¼ÓÃ£¬ËùÒÔ¸ü»»µ½751
BT_SetType2Task(1, 751)
for i = 2, 50 do 
	BT_SetType2Task(i, 700 + i);
end
end
--------------------------------------------------------------------------
-- ½«×Ö·û´®°´·Ö¸î·û·Ö¸î£¬·µ»Ø¸÷·Ö¸î¶Î×é³ÉµÄÊý×é
-- Àý1£ºstrsplit( "abc,bcd,efg", "," ) -> { "abc", "bcd", "efg" }
-- Àý2£ºstrsplit( ",abc,,bcd,,,efg,,", ",," ) -> { ",abc", "bcd", ",efg" }
function strsplit( strText, strSeparator )
	local arySlice = {};
	local nSliceCount = 0;
	local nStartIdx, nEndIdx;
	while( 1 ) do
		nStartIdx, nEndIdx = strfind( strText, strSeparator, 1, 1 );
		if( nStartIdx == nil ) then
			break
		end
		if( nStartIdx > 1 ) then
			nSliceCount = nSliceCount + 1;
			arySlice[nSliceCount] = strsub( strText, 1, nStartIdx - 1 );
		end
		strText = strsub( strText, nEndIdx + 1 );
	end
	if( strlen( strText ) > 0 ) then
		arySlice[nSliceCount+1] = strText;
	end
	return arySlice;
end
--------------------------------------------------------------------------------
function getNpcInfo( strNpcInfo )
	local arystrInfo = strsplit( strNpcInfo, "," );
	return tonumber( arystrInfo[1] ), tonumber( arystrInfo[2] ), tonumber( arystrInfo[3] );
end
---------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
function sf_callnpc(usedtime, totaltime) 
	if (usedtime > totaltime) then
		return
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	for i = 2, 6 do 
		if (GetMissionV(MS_NPCCOUNT1_S + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			nowadd = npccount - prenpccount;
			if (nowadd > 0) then
				print("call song npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S + i - 1), GetMissionV(MS_RANK1LVL_S + i - 1), 1, nowadd, tabFILE_NPCDEATH[i], 1)
				if (i == 6) then
					Msg2MSAll(MISSIONID, "Tèng Liªu chiÕn b¸o: Nguyªn So¸i phe Tèng ®· xuÊt hiÖn!");
				end
			end
		end
	end
	
	for i = 2, 6 do 
		if (GetMissionV(MS_NPCCOUNT1_J + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			nowadd = npccount - prenpccount
			if (nowadd > 0) then
				print("call jing npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J + i - 1), GetMissionV(MS_RANK1LVL_J + i - 1), 2, nowadd, tabFILE_NPCDEATH[i], 1)
				if (i == 6) then
					Msg2MSAll(MISSIONID, "Tèng Liªu chiÕn b¸o: Nguyªn So¸i phe Liªu ®· xuÊt hiÖn!");
				end
			end
		end
	end
end;
---------------------------------------------------------------------------------------------------------
function test_callnpc(count, time)
t = 0;

for i = 1, time do
	last = floor((i - 1) / time * count )
	now = floor(i / time * count )
	c = now - last
	t = t + c
	print(c)
end;

print("total:"..t)
end;
------------------------------------------------------------------------------------------------------------
function sf_buildfightnpcdata()
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	
	for i = 1, 6 do 
		str = BT_GetBattleParam(i);
		tnpcid, level, count = getNpcInfo(str);
		SetMissionV(MS_TRANK1_S + i - 1, tnpcid);
		SetMissionV(MS_RANK1LVL_S + i - 1, level);
		SetMissionV(MS_NPCCOUNT1_S + i - 1, count)
	end
	
	for i = 1, 6 do 
		str = BT_GetBattleParam(i + 6 );
		tnpcid, level, count = getNpcInfo(str);
		SetMissionV(MS_TRANK1_J + i - 1, tnpcid);
		SetMissionV(MS_RANK1LVL_J + i - 1, level);
		SetMissionV(MS_NPCCOUNT1_J + i - 1, count)
	end
	
	--¿ªÊ¼Ê±Ê¿±øÒ»´ÎÈ«²¿³öÏÖ¡ª¡ª¡ª¡ªËÎ
	npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[2]);
	bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S), GetMissionV(MS_RANK1LVL_S), 1, GetMissionV(MS_NPCCOUNT1_S), tabFILE_NPCDEATH[1], 0)
	
	--¿ªÊ¼Ê±Ê¿±øÒ»´ÎÈ«²¿³öÏÖ¡ª¡ª¡ª¡ªÁÉ
	npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[2]);
	bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J), GetMissionV(MS_RANK1LVL_J), 2, GetMissionV(MS_NPCCOUNT1_J), tabFILE_NPCDEATH[1], 0)

end
------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end
TabFile_GetCell=TabFile_GetData

function bt_addtotalpoint(point)
	if (point == 0) then
		return
	end
	
	-- ½±Àø·­±¶
	point = multiple_reward(SYS_BATTLE, point)
	
	BT_SetData(PL_TOTALPOINT, BT_GetData(PL_TOTALPOINT) + point)
	BT_SetData(PL_BATTLEPOINT, BT_GetData(PL_BATTLEPOINT) + point)
end

function bt_assignrank(camp)
	camptab={}
	--Çå³ýµ±Ç°µÄ¹ÙÎ»Êý¾Ý
	for tt = 70 , 81 do 
		SetMissionV(tt,0)
	end
		
	idx = 0
	pidx = 0
	
	count = 1
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, camp);
 		
 		if (pidx > 0) then
	 		camptab[count] = pidx;
	 		count = count + 1
	 	end;
	 	if (idx == 0) then 
	 		break
	 	end;
	end;

	for tj = 1, getn(camptab) do 
		
		nTopData = 0
		nTopPlayer = 0;
		nTopIndex = 0
		for i = 1, getn(camptab) do 
			if (camptab[i] ~= 0) then
				PlayerIndex = camptab[i];
				if (BT_GetData(PL_BATTLEPOINT)>= nTopData) then
					nTopPlayer = PlayerIndex
					nTopData = BT_GetData(PL_BATTLEPOINT)
					nTopIndex = i
				end
			end
		end
		
		if (nTopData > 0) then
			PlayerIndex = nTopPlayer
			camptab[nTopIndex] = 0;
			if (camp == 1) then
				JudgePLAddTitle_S()
			else
				JudgePLAddTitle_J()
			end
		end
		
	end
end
--------------------------¼ÆËãÕ½¹¦ÏµÊý£¬ÖØÖÃÕ½¹¦---------------------------------------
function ResetBonus()
--	CAMP1CUN = GetMSPlayerCount(MISSIONID, 1)
--	CAMP2CUN = GetMSPlayerCount(MISSIONID, 2)
--	AVRCUN = (CAMP1CUN + CAMP2CUN)/2
	
--	if (AVRCUN == 0) then
		bonuscff1 = 1
		bonuscff2 = 1
--	else
--		bonuscff1 = 1-(CAMP1CUN-AVRCUN)/AVRCUN
--		bonuscff2 = 1-(CAMP2CUN-AVRCUN)/AVRCUN
--	end
	
	BT_SetTypeBonus(PL_KILLPLAYER, 1, floor(BONUS_KILLPLAYER*bonuscff1))
	BT_SetTypeBonus(PL_SNAPFLAG, 1, floor(BONUS_SNAPFLAG*bonuscff1))
	BT_SetTypeBonus(PL_KILLNPC, 1, floor(BONUS_KILLNPC*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK1, 1, floor(BONUS_KILLRANK1*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK2, 1, floor(BONUS_KILLRANK2*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK3, 1, floor(BONUS_KILLRANK3*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK4, 1, floor(BONUS_KILLRANK4*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK5, 1, floor(BONUS_KILLRANK5*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK6, 1, floor(BONUS_KILLRANK6*bonuscff1))
	BT_SetTypeBonus(PL_MAXSERIESKILL, 1, floor(BONUS_MAXSERIESKILL*bonuscff1))
	BT_SetTypeBonus(PL_GETITEM, 1, floor(BONUS_GETITEM*bonuscff1))
	BT_SetTypeBonus(PL_1VS1, 1, floor(BONUS_1VS1*bonuscff1))

	BT_SetTypeBonus(PL_KILLPLAYER, 2, floor(BONUS_KILLPLAYER*bonuscff2))
	BT_SetTypeBonus(PL_SNAPFLAG, 2, floor(BONUS_SNAPFLAG*bonuscff2))
	BT_SetTypeBonus(PL_KILLNPC, 2, floor(BONUS_KILLNPC*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK1, 2, floor(BONUS_KILLRANK1*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK2, 2, floor(BONUS_KILLRANK2*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK3, 2, floor(BONUS_KILLRANK3*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK4, 2, floor(BONUS_KILLRANK4*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK5, 2, floor(BONUS_KILLRANK5*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK6, 2, floor(BONUS_KILLRANK6*bonuscff2))
	BT_SetTypeBonus(PL_MAXSERIESKILL, 2, floor(BONUS_MAXSERIESKILL*bonuscff2))
	BT_SetTypeBonus(PL_GETITEM, 2, floor(BONUS_GETITEM*bonuscff2))
	BT_SetTypeBonus(PL_1VS1, 2, floor(BONUS_1VS1*bonuscff2))
end
------------------------------------------------------------------------------------

---------------------½øÈëÕ½³¡Ê±¸³¸øÍæ¼ÒÏàÓ¦Í·ÏÎ BEGIN------------------------------------------
function JudgePLAddTitle_S()
	if (BT_GetData(PL_BATTLEPOINT) >= TITLE_BONUSRANK5 and GetMissionV(MS_PL2RANK5_S) < TITLE_PL2RANK5_N ) then
		Title_AddTitle(5, 0, 99999)
		Title_ActiveTitle(5)
		Msg2Player("B¹n ®­îc phong lµ §¹i T­íng l©m thêi phe Tèng!");
		BT_SetData(PL_CURRANK, 5);
		SetMissionV(MS_PL2RANK5_S, GetMissionV(MS_PL2RANK5_S) + 1)
		return
	elseif (BT_GetData(PL_BATTLEPOINT) >= TITLE_BONUSRANK4 and GetMissionV(MS_PL2RANK4_S) < TITLE_PL2RANK4_N ) then
		Title_AddTitle(4, 0, 99999)
		Title_ActiveTitle(4)
			BT_SetData(PL_CURRANK, 4);
		SetMissionV(MS_PL2RANK4_S, GetMissionV(MS_PL2RANK4_S) + 1)
		Msg2Player("B¹n ®­îc phong lµ Phã T­íng l©m thêi phe Tèng!");
		return
	elseif (BT_GetData(PL_BATTLEPOINT) >= TITLE_BONUSRANK3 and GetMissionV(MS_PL2RANK3_S) < TITLE_PL2RANK3_N ) then
		Title_AddTitle(3, 0, 99999)
		Title_ActiveTitle(3)
			BT_SetData(PL_CURRANK, 3);
		SetMissionV(MS_PL2RANK3_S, GetMissionV(MS_PL2RANK3_S) + 1)
		Msg2Player("B¹n ®­îc phong lµ Thèng LÜnh l©m thêi phe Tèng!");
		return
	elseif (BT_GetData(PL_BATTLEPOINT) >= TITLE_BONUSRANK2 and GetMissionV(MS_PL2RANK2_S) < TITLE_PL2RANK2_N ) then
		Title_AddTitle(2, 0, 99999)
		Title_ActiveTitle(2)
			BT_SetData(PL_CURRANK, 2);
		SetMissionV(MS_PL2RANK2_S, GetMissionV(MS_PL2RANK2_S) + 1)
		Msg2Player("B¹n ®­îc phong lµ HiÖu óy l©m thêi phe Tèng!");
		return
	elseif (GetMissionV(MS_PL2RANK1_S) < TITLE_PL2RANK1_N) then
		Title_AddTitle(1, 0, 99999)
		Title_ActiveTitle(1)
		BT_SetData(PL_CURRANK, 1);
		SetMissionV(MS_PL2RANK1_S, GetMissionV(MS_PL2RANK1_S) + 1)
		Msg2Player("B¹n ®­îc phong lµ Qu©n sÜ l©m thêi phe Tèng!");
		return
	end
end

function JudgePLAddTitle_J()
--	if (BT_GetData(PL_TOTALPOINT) >= TITLE_BONUSRANK6 and GetMissionV(MS_PL2RANK6_J) < TITLE_PL2RANK6_N ) then
--		AddTitle(6, 0, 99999)
--		SetMissionV(MS_PL2RANK6_J, GetMissionV(MS_PL2RANK6_J) + 1)
--		return
--	end

	if (BT_GetData(PL_BATTLEPOINT) >= TITLE_BONUSRANK5 and GetMissionV(MS_PL2RANK5_J) < TITLE_PL2RANK5_N ) then
		Title_AddTitle(5, 0, 99999)
		Title_ActiveTitle(5)
		SetMissionV(MS_PL2RANK5_J, GetMissionV(MS_PL2RANK5_J) + 1)
			BT_SetData(PL_CURRANK, 5);
		Msg2Player("B¹n ®­îc phong lµ §¹i T­íng l©m thêi phe Liªu!");
		return
	elseif (BT_GetData(PL_BATTLEPOINT) >= TITLE_BONUSRANK4 and GetMissionV(MS_PL2RANK4_J) < TITLE_PL2RANK4_N ) then
		Title_AddTitle(4, 0, 99999)
		Title_ActiveTitle(4)
		SetMissionV(MS_PL2RANK4_J, GetMissionV(MS_PL2RANK4_J) + 1)
			BT_SetData(PL_CURRANK, 4);
		Msg2Player("B¹n ®­îc phong lµ Phã T­íng l©m thêi phe Liªu!");
		return
	elseif (BT_GetData(PL_BATTLEPOINT) >= TITLE_BONUSRANK3 and GetMissionV(MS_PL2RANK3_J) < TITLE_PL2RANK3_N ) then
		Title_AddTitle(3, 0, 99999)
		Title_ActiveTitle(3)
		SetMissionV(MS_PL2RANK3_J, GetMissionV(MS_PL2RANK3_J) + 1)
			BT_SetData(PL_CURRANK, 3);
		Msg2Player("B¹n ®­îc phong lµ Thèng LÜnh l©m thêi phe Liªu!");
		return
	elseif (BT_GetData(PL_BATTLEPOINT) >= TITLE_BONUSRANK2 and GetMissionV(MS_PL2RANK2_J) < TITLE_PL2RANK2_N ) then
		Title_AddTitle(2, 0, 99999)
		Title_ActiveTitle(2)
		SetMissionV(MS_PL2RANK2_J, GetMissionV(MS_PL2RANK2_J) + 1)
			BT_SetData(PL_CURRANK, 2);
		Msg2Player("B¹n ®­îc phong lµ HiÖu óy l©m thêi phe Liªu!");
		return
	elseif (GetMissionV(MS_PL2RANK1_J) < TITLE_PL2RANK1_N) then
		Title_AddTitle(1, 0, 99999)
		Title_ActiveTitle(1)
		SetMissionV(MS_PL2RANK1_J, GetMissionV(MS_PL2RANK1_J) + 1)
			BT_SetData(PL_CURRANK, 1);
		Msg2Player("B¹n ®­îc phong lµ Qu©n sÜ l©m thêi phe Liªu!");
		return
	end
end

-------------------------½øÈëÕ½³¡Ê±¸³¸øÍæ¼ÒÏàÓ¦Í·ÏÎ ENDING----------------------------------


function bt_autoselectmaparea(mapfile,areacount)		--Ëæ»úÑ¡Ôñ³¡µØÖÐ£¬Ë«·½ËùÔÚµÄÕóÓªµØ
	local s_area = 0
	local j_area = 0
	local areatmp = random(areacount);
	local wwt = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
	if (wwt == 0 or wwt == 1) then
		s_area = areatmp
		while(j_area == 0) do 
			areatmp = random(areacount)
			if (areatmp ~= s_area) then
				wwt1 = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
				if (wwt1 == 0 or wwt1 == 2) then
					j_area = areatmp
				end
			end
		end
	else
		j_area = areatmp
		while(s_area == 0) do 
			areatmp = random(areacount)
			if (areatmp ~= j_area) then
				wwt1 = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
				if (wwt1 == 0 or wwt1 == 1) then
					s_area = areatmp
				end
			end
		end
	end
	return s_area,j_area
end


function bt_exchangeexp(level, mark)
		if (level < 40) then
			return 0
		end
		local base_exp = (( 700 + floor(( level - 40 ) / 5 ) * 100 ) * 60 * 7 / 3000 );	-- 1¸öÕ½¹¦µãµÄ»ù´¡¾­ÑéÖµ
		local bonus = floor( mark * base_exp )
		return bonus
end
-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;

function sl_clearplayerdata()	--Ã¿¾ÖÐÂ¿ªÊ¼Çå³ýÍæ¼ÒÉÏÒ»¾ÖµÄÐÅÏ¢£¬×ÜÕ½¹¦²»Çå³ý

	local MKey = BT_GetGameData(GAME_KEY); --µ±Ç°Õ½ÒÛµÄÎ¨Ò»KeyÂë
	local BattleId = BT_GetGameData(GAME_BATTLEID); --¸ÃÕ½ÒÛÀàÐÍµÄID
	
	if ( MKey ~= BT_GetData(PL_KEYNUMBER) or BattleId ~= BT_GetData(PL_BATTLEID) or BT_GetData(PL_ROUND) ~= BT_GetGameData(GAME_ROUND) ) then
		for i = 1, 28 do
			BT_SetData(i, 0)
		end
	end
end