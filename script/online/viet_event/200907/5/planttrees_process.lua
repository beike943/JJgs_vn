--=============================================
--create by baiyun 2009.5.29
--describe:Ô½ÄÏ°æ7ÔÂ·İ»î¶¯Ö®ÎåÖÖÊ÷
--=============================================
Include("\\script\\online\\viet_event\\200907\\5\\planttrees_head.lua")
Include("\\script\\lib\\writelog.lua");
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")

-----------------------------------------------
--OnUse()
--µã»÷Ê÷ÖÖ´¥·¢ÊÂ¼ş
-----------------------------------------------

function OnUse(nItemIdx)
-----¼ì²éÊÇ·ñ·ûºÏÖÖÊ÷µÄÌõ¼ş
--	if checkEventDate() == 0 then
--		Talk(1, "", "Thêi gian ho¹t ®éng ®· hÕt.");
--		return 0;
--	end
--	if tonumber(date("%y%m%d%H")) >= 09082108 and  tonumber(date("%y%m%d%H")) < 09082118 then 
--		Msg2Player("HiÖn t¹i kh«ng thÓ sö dông ®­îc vËt phÉm nµy");
--		return
--	end
--	if checkEventTime() == 0 then
--		Talk(1, "", "ÖÖÊ÷Ê±¼äÎª00:00 ¨C 12:00ºÍ17:00 ¨C 00:00Á½¸öÊ±¼ä¶Î");
--		return 0;
--	end
	if GetFreeItemRoom() < 2 then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 2 « trèng, kh«ng thÓ trång c©y");
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
		if GetTask(TASK_PLANT_TREE_TYPE) == 2 and GetTime() - GetTask(TASK_PLANT_TREE_TIME) < 300 then--Èç¹ûÖÖÏÂ²»ËÀÊ÷£¬ÔòÔÚÃ»²¦Ö®Ç°£¬¶¼²»ÄÜÖÖ±ğµÄÊ÷
				Talk(1, "", "§¹i hiÖp ®· trång 1 c©y råi");
				return 0;
		end
-----¼ì²éÀëÉÏ´ÎÖÖÊ÷ÊÇ·ñÒÑ¾­¹ıÁËPLANT_TREE_INTERVALÕâÃ´³¤Ê±¼ä---------------------
		if GetTime() - GetTask(TASK_PLANT_TREE_TIME) < PLANT_TREE_INTERVAL then
			Talk(1, "", "Thêi gian gi·n c¸ch gi÷a hai lÇn trång c©y lµ <color=yellow>" .. PLANT_TREE_INTERVAL .. " gi©y.");
			return 0;
		end
	end
-----¿ÉÒÔÖÖÊ÷ÁË------------------------------------------------------------------
	local selTab = {
				"H·y mau trång c©y/#plantTree("..nItemIdx..")",
	 			"Sau nµy trång sÏ tèt h¬n!/doNothing"
	 		}
	Say("§¹i hiÖp muèn trång c©y?", getn(selTab), selTab);		 
end

---------------------------
--plantTree()
--ÖÖÊ÷²Ù×÷
---------------------------
function plantTree(nItemIdx)
	if checkPlaceMainCity() == 0 then
		Talk(1, "", "§Şa ®iÓm trång c©y kh«ng thİch hîp");
		return 0;
	end
	local nDate = tonumber(date("%y%m%d"));
-----É¾³ıÉíÉÏµÄÒ»¸öÊ÷ÖÖ-------------------------------------------------------------------------
	if DelItem(2, 1, 30086, 1) == 1 then
		----------------------- Chuçi nhiÖm vô ChuyÓn Sinh §¬n, l­u 3 sè ®Çu bªn ph¶i
		local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)
		if nCSD_HG < 300 and GetTask(TSK_CSD) == 1 then
			SetTask(TSK_CSD_COUNT_B, GetTask(TSK_CSD_COUNT_B) + 1)
		end
		----------------------- Chuçi nhiÖm vô M¶nh Thiªn Th¹ch, l­u 3 sè ®Çu bªn ph¶i
		local nMTT_HG = mod(GetTask(TSK_MTT_COUNT), 1000)
		local nMTT_HG_NV =  mod(floor(GetTask(TSK_MTT_COUNT) / 10000000),10)
		if nMTT_HG < 150 and nMTT_HG_NV == 1 then
			SetTask(TSK_MTT_COUNT, GetTask(TSK_MTT_COUNT) + 1)
		end
		------------------------Chuçi nhiÖm vô ChuyÓn Sinh 6
		local nCS6_HG =  floor(GetTask(TSK_CS6_COUNTA)/10000000)
		local nCS6_HG_Num = mod(GetTask(TSK_CS6_COUNTA),10000000)
		if mod(nCS6_HG,1000) < 150 and GetTask(TSK_CS6_TULINH) < 2 then
			nCS6_HG = (nCS6_HG + 1) * 10000000 + nCS6_HG_Num
			SetTask(TSK_CS6_COUNTA, nCS6_HG)
		end
		-----------------------------------------------------------------
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

		KichHoatHatGiong() -- phÇn thuëng khi kİch ho¹t
		--- §iÓm VËn May
--		local nBonusExp = 1200000
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nBonusExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--		else
--			Msg2Player("B¹n bŞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--		end
		---------			
		WriteLogEx("Hoat dong trong cay","Trång",1,TREE_TYPE[nTreeType][4])
		if npcTreeIndex == 0 then
			WriteLog("[Hoat dong trong cay loi]:"
								..GetName..
								"Trong lóc trång c©y, CreatNpc hµm sè trë vÒ 0. NhËp tham sè CreateNPC lµ:"
								 ..TREE_TYPE[nTreeType][1]..", " ..GetName().. " trång "
								  ..TREE_TYPE[nTreeType][2].. ", " ..nMapID.. "," ..nMapX.. "," ..nMapY);
		end

-----Èç¹û»ñµÃ°×½ğÊ÷£¬ÔòÏòÈ«ÊÀ½ç·¢¹«¸æ
		if nTreeType == 5 then
			AddGlobalNews("Chóc mõng  "..GetName().." §· nhËn ®­îc." .. "C©y B¹ch Kim" .. " T¹i ".. CITY_NAME_ID[GetWorldPos()]);
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
		SetNpcScript(npcTreeIndex, "\\script\\online\\viet_event\\200907\\5\\tree_npc.lua");
		SetTask(TASK_PLANT_TREE_DATE, nDate);
		SetTask(TASK_PLANT_TREE_COUNT, GetTask(TASK_PLANT_TREE_COUNT) + 1);
		SetTask(TASK_PLANT_TREE_TIME, GetTime());

		if nTreeType ~= 2 then
			StartTimeGuage("T­íi c©y",TREE_PARAM[GetTask(TASK_TREE_GROW)][3],0,1)
		else
			StartTimeGuage("Thu ho¹ch",240,0,1)
		end
		Say("H«m nay, ®©y lµ lÇn thø <color=yellow>"..GetTask(TASK_PLANT_TREE_COUNT).."<color> lÇn trång c©y, h«m nay cßn cã thÓ trång <color=yellow>"..PLANT_TREE_LIMIT - GetTask(TASK_PLANT_TREE_COUNT).."<color> c©y. NÕu nh­ " .. TREE_PARAM[1][2] .. " gi©y kh«ng t­íi n­íc, c©y sÏ tù ®éng chÕt ®i.", 0);

		--if GetTask(TASK_PLANT_TREE_COUNT) == PLANT_TREE_LIMIT and nDate <= 130120 then	
		if nDate >= 130214 and nDate <= 130228 then	
			gf_AddItemEx2({2,1,30357, 200}, "H¹t Ca Cao", "VALENTINE 2013", "H¹t ca cao")
		end	
	end
end
