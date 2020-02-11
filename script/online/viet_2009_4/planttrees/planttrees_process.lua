--=============================================
--create by baiyun 2009.4.9
--describe:Ô½ÄÏ°æ4ÔÂ·İÖÖÊ÷»î¶¯
--=============================================
Include("\\script\\online\\viet_2009_4\\planttrees\\planttrees_head.lua")

-----------------------------------------------
--OnUse()
--µã»÷Ê÷ÖÖ´¥·¢ÊÂ¼ş
-----------------------------------------------
function OnUse()
-----¼ì²éÊÇ·ñ·ûºÏÖÖÊ÷µÄÌõ¼ş
	if checkEventDate() == 0 then
		Talk(1, "", "Thêi gian ho¹t ®éng ®· hÕt.");
		return 0;
	end
	if checkEventTime() == 0 then
		Talk(1, "", "Thêi gian trång c©y lµ 0:00 - 12:00 vµ 17:00 - 0:00");
		return 0;
	end
	
	if GetLevel() < PLANT_TREE_ROLE_LEVEL_LIMIT then
		Talk(1, "", "VÉn ch­a ®¹t ®Õn cÊp <color=yellow>" .. PLANT_TREE_ROLE_LEVEL_LIMIT .. "<color> cÊp kh«ng thÓ trång c©y");
		return 0;
	end
	if checkPlaceMainCity() == 0 then
		Talk(1, "", "§Şa ®iÓm trång c©y kh«ng thİch hîp");
		return 0;
	end
-----ÖÖÊ÷µÄÈÕÆÚ¼ì²é£¬Èç¹û½ñÌìµÚÒ»´ÎÖÖÊ÷£¬±íÊ¾ÏÖÔÚ¿ÉÒÔÖÖÊ÷ÁË£¬ÔòÇå¿ÕÈÎÎñ±äÁ¿-----
-----½«ÖÖÊ÷µÄÊıÁ¿ÉèÎª0£¬ÖÖÊ÷ÈÕÆÚÉèÎª½ñÌì£¬ÖÖÏÂÊ÷µÄÊ±¼äºÍ½½Ë®Ê±¼äÉèÎªÏÖÔÚ--------
	local nDate = tonumber(date("%y%m%d"));
--Èç¹û½ñÌì»¹Ã»ÓĞÖÖÊ÷£¬Ôò±íÊ¾¿ÉÒÔÖÖÊ÷
	if GetTask(TASK_PLANT_TREE_DATE) < nDate then 
		SetTask(TASK_PLANT_TREE_COUNT, 0);
		SetTask(TASK_WATER_TREE_TIME, 0);
		SetTask(TASK_PLANT_TREE_TIME, 0);
	else
-----¼ì²é½ñÌìÖÖµÄÊ÷ÊÇ·ñÒÑ¾­µ½ÔÊĞíµÄ×î´óÊıÁ¿--------------------------------------
		if GetTask(TASK_PLANT_TREE_COUNT) >= PLANT_TREE_LIMIT then
			Talk(1, "", "H«m nay b¹n ®· trång <color=yellow>".. GetTask(TASK_PLANT_TREE_COUNT) .."<color> c©y råi, ®îi ngay mai h·y tiÕp tôc nhĞ.");
			return 0;
		end
-----¼ì²éÊÇ·ñÒÑ¾­ÖÖÏÂÒ»¿ÃÊ÷ÁË----------------------------------------------------
		for i = 1, 6 do
			if GetTask(TASK_TREE_GROW) == i and GetTime() - GetTask(TASK_PLANT_TREE_TIME) < TREE_PARAM[i][2] and GetTask(TASK_WATER_TREE_TIME) ~= 0 then
				Talk(1, "", "§¹i hiÖp ®· trång 1 c©y råi");
				return 0;
			end
		end
-----¼ì²éÀëÉÏ´ÎÖÖÊ÷ÊÇ·ñÒÑ¾­¹ıÁËPLANT_TREE_INTERVALÕâÃ´³¤Ê±¼ä---------------------
		local nTreeType = GetTask(TASK_PLANT_TREE_TYPE)
		if nTreeType == 2 then
			if GetTime() - GetTask(TASK_PLANT_TREE_TIME) < PLANT_TREE_INTERVAL * 2  then
				Talk(1, "", "Thêi gian gi·n c¸ch gi÷a hai lÇn trång c©y lµ <color=yellow>" .. PLANT_TREE_INTERVAL * 2 .. " gi©y.");
				return 0;
			end
		else			
			if GetTime() - GetTask(TASK_PLANT_TREE_TIME) < PLANT_TREE_INTERVAL then
				Talk(1, "", "Thêi gian gi·n c¸ch gi÷a hai lÇn trång c©y lµ <color=yellow>" .. PLANT_TREE_INTERVAL .. " gi©y.");
				return 0;
			end
		end
	end
-----¿ÉÒÔÖÖÊ÷ÁË------------------------------------------------------------------
	local selTab = {
				"H·y mau trång c©y/plantTree",
	 			"Sau nµy trång sÏ tèt h¬n!/doNothing"
	 		}
	Say("§¹i hiÖp muèn trång c©y?", getn(selTab), selTab);		 
end

---------------------------
--plantTree()
--ÖÖÊ÷²Ù×÷
---------------------------
function plantTree()
	local nDate = tonumber(date("%y%m%d"));
-----É¾³ıÉíÉÏµÄÒ»¸öÊ÷ÖÖ-------------------------------------------------------------------------
	if DelItem(2, 1, 30075, 1) == 1 then
		local nMapID, nMapX, nMapY = GetWorldPos();
-----´Ë´¦ÔËÓÃÊ÷³öÏÖµÄ¸ÅÂÊÀ´µÃµ½ÖÖÏÂÊ÷µÄÀàĞÍ-----------------------------------------------------
		local nRand = 0;
		local nTreeType = 0;
		local nMin = 0;
		
		nRand = random(1, 100);
		
		for i=1,getn(TREE_TYPE) do
			if nRand > nMin and nRand <=  TREE_TYPE[i][3] + nMin then
				nTreeType = i
				break
			end		
			nMin = nMin + TREE_TYPE[i][3]
		end
		
		local npcTreeIndex = CreateNpc(TREE_TYPE[nTreeType][1], GetName().." trång "..TREE_TYPE[nTreeType][2], nMapID, nMapX, nMapY);
		WriteLogEx("Hoat dong thang 4","trång c©y",1,TREE_TYPE[nTreeType][2])
		if npcTreeIndex == 0 then
			WriteLog("[Ho¹t ®éng trång c©y th¸ng 4  sai sãt]:"
								..GetName..
								"Trong lóc trång c©y, CreatNpc hµm sè trë vÒ 0. NhËp tham sè CreateNPC lµ:"
								 ..TREE_TYPE[nTreeType][1]..", " ..GetName().. " trång "
								  ..TREE_TYPE[nTreeType][2].. ", " ..nMapID.. "," ..nMapX.. "," ..nMapY);
		end

-----Èç¹û»ñµÃ°×½ğÊ÷£¬ÔòÏòÈ«ÊÀ½ç·¢¹«¸æ
		if nTreeType == 5 then
			AddGlobalNews("Chóc mõng  "..GetName().." §· nhËn ®­îc." .. "C©y B¹ch Kim" .. "T¹i".. CITY_NAME_ID[GetWorldPos()]);
		end
		
-----ÉèÖÃÊ÷µÄ´æ»îÊ±¼ä----------------------------------------------------------------------------		
		SetTask(TASK_PLANT_TREE_TYPE, nTreeType);
		if nTreeType == 2 then
			SetNpcLifeTime(npcTreeIndex, TREE_PARAM[6][2]);--Èç¹ûÊÇ²»ËÀÊ÷£¬²»ÓÃÂ¶Ë®½½¹à£¬Éú´æÊ±¼äÖ±½ÓÊÇ300Ãë
		else
			SetNpcLifeTime(npcTreeIndex, TREE_PARAM[1][2]);--¸ÕÖÖÏÂ¿Ï¶¨ÊÇµÚÒ»½×¶Î
		end
		SetTask(TASK_TREE_INDEX, npcTreeIndex);
		SetTask(TASK_TREE_GROW, 1);
		SetTask(TASK_WATER_TREE_TIME, GetTime());
		SetNpcScript(npcTreeIndex, "\\script\\online\\viet_2009_4\\planttrees\\tree_npc.lua");
		SetTask(TASK_PLANT_TREE_DATE, nDate);
		SetTask(TASK_PLANT_TREE_COUNT, GetTask(TASK_PLANT_TREE_COUNT) + 1);
		SetTask(TASK_PLANT_TREE_TIME, GetTime());
		Say("H«m nay, ®©y lµ lÇn thø <color=yellow>"..GetTask(TASK_PLANT_TREE_COUNT).."<color> lÇn trång c©y, h«m nay cßn cã thÓ trång <color=yellow>"..PLANT_TREE_LIMIT - GetTask(TASK_PLANT_TREE_COUNT).."<color> c©y. NÕu nh­ " .. TREE_PARAM[1][2] .. " gi©y kh«ng t­íi n­íc, c©y sÏ tù ®éng chÕt ®i.", 0);
	end
end