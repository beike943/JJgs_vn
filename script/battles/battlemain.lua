
Include("\\script\\battles\\butcher\\head.lua")

function main()
	openbattlemain(1, 807, 20, 1, 1)
	openbattlemain(1, 809, 20, 2, 1)
end

function openbattlemain(battleid, mapid, ruleid, level, seriesid)

	oldSubWorld = SubWorld
	if (GetGlbValue(GLB_FORBIDBATTLE) == 1) then 
		print("any battle would be forbided, so this battle is ignored.");
		return
	end

	SetGlbValue(GLB_BATTLESTATE, 1) --ÉèÖÃ¸ÃÈ«¾Ö±äÁ¿Îª1£¬±êÖ¾µ±Ç°·şÎñÆ÷Õı´¦ÓÚËÎ½ğÕ½ÒÛ½×¶Î£¬´ËÊ±ÏåÑô»òÖìÏÉÕòµÄ³ö¿Úµã×Ô¶¯ÉèÔÚËÎ½ğÕ½ÒÛµÄ±¨Ãûµã£¬·ñÔòÔòÉèÔÚÔ­ËÎ½ğÕ½³¡µØÍ¼
	idx = SubWorldID2Idx(mapid);
	if (idx == -1) then 
		return
	end;
	if (level < 1 or level > 2) then
		print("battle level must 1 to 2, but now is "..level..", so it is error!");
		return
	end;
	battlekey = date("%m%d") * 100000 + random(100000)
	signidx = SubWorldID2Idx(tbGAME_SIGNMAP[level]);

	SubWorld = idx
	OpenMission(ruleid)

--	bt_setnormaltask2type()
	BT_SetView(PL_TOTALPOINT);--ÏÔÊ¾ÓëÍ³¼Æ×ÜÕ½¹¦
	BT_SetView(PL_KILLPLAYER);--É±Íæ¼ÒÊıÄ¿
	BT_SetView(PL_BEKILLED);--±¾Íæ¼Ò±»É±´ÎÊı
	BT_SetView(PL_MAXSERIESKILL);--Á¬Õ¶´ÎÊı
	
	BT_SetGameData(GAME_CAMP1, 0) --ÉèÖÃµ±Ç°ËÎ·½ÈËÊı
	BT_SetGameData(GAME_CAMP2, 0) --ÉèÖÃµ±Ç°ÁÉ·½ÈËÊı
	
	round = BT_GetGameData(GAME_ROUND)

	--ÉèÖÃ¸ÃÕ½¾ÖµÄÊı¾İ
	BT_SetGameData(GAME_KEY, battlekey) --´æ·Å±¾´ÎÕ½ÒÛµÄKeyºÅ
	BT_SetGameData(GAME_BATTLEID, battleid);
	BT_SetGameData(GAME_MAPID, mapid);
	BT_SetGameData(GAME_RULEID, ruleid);
	BT_SetGameData(GAME_LEVEL, level)
	BT_SetGameData(GAME_BATTLESERIES, seriesid)
	BT_SetGameData(GAME_ROUND, round)
	
	level = BT_GetGameData(GAME_LEVEL);
	
	if (level <= 0) then
		print("Error!!!can not start battle because battlelevel <= 0")
		return
	end

	subworldid = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(subworldid);	
	ClearMapTrap(subworldid); 
	ClearMapObj(subworldid);
		
	--»ñµÃµØÍ¼Ïà¶ÔÓ¦µÄÉè¶¨ÎÄ¼şÃû
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	
	--µÃµ½¸ÃµØÍ¼ÓĞ¼¸¸öÇøÓò
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
		print("battle"..BT_GetGameData(GAME_RULEID).." error! areacount <= 1");
		return
	end
	
	--Ëæ»ú´ÓËùÓĞÇøÓòÖĞ³éÈ¡Á½¸ö£¬×÷ÎªË«·½µÄÖ÷ÇøÓò
	s_area, j_area = bt_autoselectmaparea(mapfile,areacount)

	BT_SetGameData(GAME_CAMP1AREA, s_area);
	BT_SetGameData(GAME_CAMP2AREA, j_area);
	
	area_section1 = "Area_"..s_area;
	area_section2 = "Area_"..j_area;
-------------------------------------------------------------------------
--¶ÁÈ¡Á½¸öÇøÓòµÄ´óÓªÄÚµã×ø±ê
	--´Ó´óÓªµ½ºóÓªÊ±µÄ×ø±êµã
    file = GetIniFileData(mapfile, area_section1 , "centertohomepos")
    x,y =bt_getadata(file)
	SetMissionV(MS_HOMEIN_X1, floor(x/32))
	SetMissionV(MS_HOMEIN_Y1, floor(y/32))

	file = GetIniFileData(mapfile, area_section2 , "centertohomepos")
    x,y = bt_getadata(file)
	SetMissionV(MS_HOMEIN_X2, floor(x/32))
	SetMissionV(MS_HOMEIN_Y2, floor(y/32))
	
	--´ÓºóÓªµ½´óÓªµÄ×ø±êµã
	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos")
	SetMissionS(1, file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X1, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y1, floor(y/32))

 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos")
	SetMissionS(2,file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X2, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y2, floor(y/32))
	
	--ºóÓªµ½Ç°ÓªµÄ×ø±êµã
 	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos2")
	SetMissionS(3,file)
	x,y = bt_getadata(file)
	
 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos2")
	SetMissionS(4,file)
	x,y = bt_getadata(file)
-------------------------------------------------------------------------
	
	--°Ú·ÅTrapµã
	--°Ú·ÅË«·½ºóÓªµÄTrapµã

	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap")
	bt_addtrap(hometrapfile, FILE_HOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap");
	bt_addtrap(hometrapfile, FILE_HOMETRAP2)


	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertohometrap")
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertohometrap");
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP2)
	
	
	--°Ú·ÅË«·½¾üÓªµÄtrapµã

	centertrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	centertrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	
	--°Ú·ÅË«·½ºóÓªµ½Ç°ÓªµÄtrapµã
	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap2");
	bt_addtrap(hometrapfile, FILE_HOME2CENTERTRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap2");
	bt_addtrap(hometrapfile, FILE_HOME2CENTERTRAP2)

	--°Ú·Å¶Ô»°ÀàĞÍNpc
	--¾üÒ½µÄ°Ú·Å
	doctorxy = GetIniFileData(mapfile, "Area_"..s_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x * 32 ,y * 32 , "Tèng Nhu quan");


	doctorxy = GetIniFileData(mapfile, "Area_"..j_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR2, TNPC_DOCTOR2, x * 32, y * 32, "Liªu Nhu quan");
	
	
	--Ë§ÆìµÄ°Ú·Å
--	symbolnpcfile = GetIniFileData(mapfile, "Area_"..s_area, "symbolnpc");
--	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL1, " ");
--	symbolnpcfile = GetIniFileData(mapfile, "Area_"..j_area, "symbolnpc");
--	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL2, " ");
	
	
	--ÖüÎïÏäµÄ°Ú·Å
	depositxy = GetIniFileData(mapfile, "Area_"..s_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT1, x * 32,y * 32, "Thñ khè_Tèng");
	

	
	depositxy = GetIniFileData(mapfile, "Area_"..j_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT2, x * 32, y * 32, "Thñ khè Liªu");
	
	
	StartMissionTimer(MISSIONID, 40, TIMER_2);
	--Ëæ»úÄ£ÊÁÉèÒª´ò¿ªÃ¿X·ÖÖÓ´¥·¢Ò»´ÎµÄ´¥·¢Æ÷£¬ÒÔ²úÉúĞÂÆì
	StartMissionTimer(MISSIONID, 39, TIMER_1);
	
	SetMissionV(MS_STATE, 1);--ÔÊĞí±¨ÃûÁË
	
	if (level == 1) then
		lvlstr = "Khu vùc s¬ cÊp"
		lvllimit = 40
	else
		lvlstr = "Khu vùc cao cÊp"
		lvllimit = 70
	end
	
	RestMin, RestSec = GetMinAndSec(900);
	local str1 = lvlstr.."Thiªn M«n trËn t¹i Nh¹n M«n quan hiÖn ®ang trong giai ®o¹n b¸o danh. C¸c t­íng sÜ mau chãng mang Anh hïng lÖnh ®Õn Nh¹n M«n quan b¸o danh tham chiÕn! Thêi gian b¸o danh cßn:"..RestMin.." phót. §iÒu kiÖn tham chiÕn: §¼ng cÊp tõ"..lvllimit.." trë lªn.";
	
	AddGlobalNews(str1);
	Msg2Global(str1)
	CreateChannel("Tèng"..szGAME_GAMELEVEL[level].."D¹ng thøc cõu s¸t", 9)
	CreateChannel("Liªu"..szGAME_GAMELEVEL[level].."D¹ng thøc cõu s¸t", 10)

	BT_SetMissionName("D¹ng thøc cõu s¸t")
	BT_SetMissionDesc("Bèi c¶nh: N¨m 1160 C«ng nguyªn, Liªu chñ Hoµn Nhan L­îng tËp hîp qu©n lùc, quyÕt ®Şnh Nam h¹, tiªu diÖt Tèng triÒu. T­¬ng D­¬ng lµ trë ng¹i ®Çu tiªn cña qu©n Liªu, Thµnh T­¬ng D­¬ng s¾p ngËp ch×m trong khãi löa binh ®ao! <enter><enter><color=yellow>D¹ng thøc Cõu s¸t: Trªn chiÕn tr­êng, tiªu diÖt cµng nhiÒu qu©n ®Şch cµng nhËn ®­îc nhiÒu phÇn th­ëng ®iÓm chiÕn c«ng cho phe m×nh. Phe nµo nhiÒu ®iÓm chiÕn c«ng sÏ giµnh chiÕn th¾ng chung cuéc. <enter> Ng­êi ch¬i kh«ng ®­îc ë l¹i hËu doanh qu¸ 2 phót. Trong chiÕn tr­êng kh«ng cã NPC chiÕn ®Êu.")


	if (signidx >= 0) then
		SubWorld = signidx
	end

	local logstr_d = "Battle Start battleid\t"..battleid.."\trule\t"..ruleid.."\tIssue"..seriesid;
	print(logstr_d);
	WriteLog(logstr_d,"NhËt kı Tèng Liªu");
	SubWorld = oldSubWorld
end;