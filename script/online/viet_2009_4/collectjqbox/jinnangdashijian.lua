--=============================================
--create by baiyun 2009.4.13
--describe:Ô½ÄÏ°æ4ÔÂ·İ½ğĞÇĞÇÒøĞÇĞÇ»î¶¯ ½õÄÒ´óÊÂ¼ş
--=============================================

Include("\\script\\online\\viet_2009_4\\gsstars\\gsstars_head.lua")
Include("\\script\\online\\viet_2009_4\\collectjqbox\\tianjilaoren.lua")

function OnUse()

	----¼ì²é»î¶¯Ê±¼ä
	if JQ_CheckEventDate() ~= 1 then
		Talk(1, "", "Thêi gian ho¹t ®éng ®· hÕt.");
		return 0;
	end
	
	Say(
			"Ho¹t ®éng chµo mõng sù kiÖn 30/4 diÔn ra trong kho¶ng 24-04-2009 ®Õn 24:00 ngµy 31-05-2009.:",
			5,
			"T¹i h¹ muèn n©ng cÊp Lam Kú (CÇn 3 Lam Kú vµ 10 b¹c)/JQ_LevelBToRFlag",
			"T¹i h¹ cÇn ghĞp Hång Kú víi Hoµng Kim Th¹ch (nhËn ®­îc Hoµng Kim Kú hoÆc B¹ch Kim Kú)/JQ_GroupRedAndStone",
			"NhËn Ng«i Sao B¹c (nhËn tõ 18h – 19h, tõ thø hai ®Õn thø s¸u hµng tuÇn)./JQ_GetSilverStar",
			"T×m hiÓu th«ng tin sù kiÖn/JQ_GetInfo",
			"KÕt thóc ®èi tho¹i/JQ_DoNothing"
		)
end

--------------------------------------
--JQ_GetSilverStar()
--ÁìÈ¡ÒøĞÇĞÇ
--------------------------------------
function JQ_GetSilverStar()

	-----ÅĞ¶ÏµÈ¼¶----------------------------------------------------
	if GetLevel() < GSSTARS_ROLE_LEVEL_LIMIT then
		Talk(1, "", "VÉn ch­a ®¹t ®Õn cÊp <color=yellow>" .. GSSTARS_ROLE_LEVEL_LIMIT .. "<color>, kh«ng thÓ tham gia ho¹t ®éng.");
		return 0;
	end
	
	--¼ì²éµ±Ç°Ê±¼äÊÇ·ñ¿ÉÒÔÁìÈ¡ÒøĞÇĞÇ£¨´Ó18£º00 - 19:00,´ÓÖÜ1µ½ÖÜ5Ã¿ÖÜ£©
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDay == 0 or nDay == 6 then
		Talk(1, "", "B©y giê kh«ng thÓ nhËn ng«i sao vµng");
		return 0;
	end
	if nHour ~= 18 and nHour ~= 19 then
		Talk(1, "", "B©y giê kh«ng thÓ nhËn ng«i sao vµng");
		return 0;
	end
	--¼ì²é½ñÌìÊÇ·ñÓĞµÃµ½ÒøĞÇĞÇ
	--¼ì²éµÃµ½µÄÒøĞÇĞÇµÄ´ÎÊıÊÇ·ñµ½´ïÃ¿Ìì¿ÉÒÔµÃµ½µÄÉÏÏŞ
	local nDate = tonumber(date("%y%m%d"));
	
	if GetTask(GSSTARS_TASK_GET_SSTARS_DATE) < nDate then --Èç¹û½ñÌìµÚÒ»´Î»ñµÃÒøĞÇĞÇ
		SetTask(GSSTARS_TASK_GET_SSTARS_COUNT, 0);
	end;
	
	--ÅĞ¶ÏÁìÈ¡ÒøĞÇĞÇÊÇ·ñÒÑµ½×î´óÊıÁ¿
	if GetTask(GSSTARS_TASK_GET_SSTARS_COUNT) >= GSSTARS_GET_SSTAR_MAX_TIME then 
		Talk(1, "", "H«m nay ®· nhËn <color=yellow>".. GetTask(GSSTARS_TASK_GET_SSTARS_DATE) .." lÇn<color> ng«i sao b¹c, ®îi ngµy mai h½ng ®Õn l¹i nhĞ.");
			return 0;
	end
	
	--ÅĞ¶ÏÓëÉÏ´ÎÁìÈ¡ÒøĞÇĞÇµÄÊ±¼ä¼ä¸ô
		if GetTime() - GetTask(GSSTARS_TASK_GET_SSTARS_TIME) < GSSTARS_GET_SSTARS_INTERVAL then
			Talk(1, "", "Thêi gian gi·n c¸ch hai lÇn nhËn ng«i sao b¹c lµ <color=yellow>" .. GSSTARS_GET_SSTARS_INTERVAL .. " gi©y.");
			return 0;
		end
	
	-----ÅĞ¶Ï±³°üºÍ¸ºÖØ------------------------
	if gf_Judge_Room_Weight(1, 0, "Xin lçi, ") == 0 then
		return 0;
	end
	
	--ÅĞ¶ÏÍæ¼Ò¿ÉÒÔµÃµ½¼¸¸öÒøĞÇĞÇ
	local nSilverStarCount = GSSTARS_PARAM[floor(GetLevel() / 10)][2];
	--¿ÉÒÔ¸øÒøĞÇĞÇÁË
	if AddItem(2, 1, 30077, nSilverStarCount) == 1 then
				Msg2Player("B¹n nhËn ®­îc " .. nSilverStarCount .. "c¸i" .. "Ng«i Sao b¹c");
				WriteLog("[Ho¹t ®éng ng«i sao vµng ng«i sao b¹c th¸ng 4]:" .. GetName() .. "NhËn ®­îc" .. "!!" .. nSilverStarCount .. "c¸i" .. "Ng«i Sao b¹c");
			--¸øÍêÒøĞÇĞÇºó£¬¸üĞÂÏÂÁĞÖµ£º
			SetTask(GSSTARS_TASK_GET_SSTARS_DATE, nDate);
			SetTask(GSSTARS_TASK_GET_SSTARS_TIME, GetTime());
			SetTask(GSSTARS_TASK_GET_SSTARS_COUNT, GetTask(GSSTARS_TASK_GET_SSTARS_COUNT) + 1);
	end

end

--------------------------------------
--JQ_GetInfo()
--ÁË½â»î¶¯ĞÅÏ¢
--------------------------------------
function JQ_GetInfo()
	Say(
			"Sù kiÖn 30/4 n¨m nay bao gåm c¸c ho¹t ®éng sau ®©y::",
			4,
			"Sù kiÖn 30 th¸ng 4/#JQ_EventDetail(1)",
			"Trång c©y 1 th¸ng 5/#JQ_EventDetail(2)",
			"Ng«i Sao Vµng/#JQ_EventDetail(3)",
			"KÕt thóc ®èi tho¹i/JQ_DoNothing"
		)
end

--------------------------------------
--JQ_GetInfo()
--ÁË½â»î¶¯ĞÅÏ¢
--------------------------------------
function JQ_EventDetail(nType)
	if nType == 1 then
		Talk(1,"JQ_GetInfo","Ho¹t ®éng chµo mõng sù kiÖn 30/4 diÔn ra trong kho¶ng 24-04-2009 ®Õn 24:00 ngµy 31-05-2009. Trong thêi gian sù kiÖn, c¸c h¹ cã thÓ thu thËp R­¬ng HiÖu Kú  th«ng qua nhiÖm vô S­ M«n,Tµng KiÕm S¬n Trang, trång C©y B¸t Nh·. Më R­¬ng HiÖu Kú sÏ thu ®­îc Lam Kú, n©ng cÊp Lam Kú thµnh Hång Kú (qu¸ tr×nh n©ng cÊp cã thÓ sÏ cã thÊt b¹i, thÊt b¹i b¹n chØ nhËn l¹i ®­îc 2 Lam Kú), kÕt hîp Hång Kú víi Hoµng Kim Kú Th¹ch sÏ thu ®­îc Hoµng Kim Kú , nÕu may m¾n b¹n sÏ nhËn ®­îc B¹ch Kim Kú víi nh÷ng phÇn th­ëng cùc kú hÊp dÉn."	)
	elseif nType == 2 then
		Talk(1,"JQ_GetInfo","Ho¹t ®éng trång c©y diÔn ra trong kho¶ng 24-04-2009 ®Õn 24:00 31-05-2009. Trong thêi gian sù kiÖn, c¸c h¹ cã thÓ mua H¹t Gièng tõ Ngù C¸c. Cã thÓ gieo h¹t gièng t¹i 6 §¹i Thµnh ThŞ. Khi gieo h¹t gièng sÏ ngÉu nhiªn nhËn ®­¬c c¸c lo¹i c©y kh¸c nhau nh­: C©y HĞo óa, C©y BÊt Tö, C©y B¹ch Ng©n, C©y Hoµng Kim, C©y B¹ch Kim. Qu¸ tr×nh trång c©y diÔn ra nh­ sau:- Gi©y thø 1 ®Õn gi©y thø 45: gieo h¹t, nhËn ®­îc lo¹i c©y ngÉu nhiªn\n- Gi©y thø 46 ®Õn gi©y thø 240: lµ giai ®o¹n ng­êi ch¬i sö dông lé thñy ®Ó ch¨m sãc cho c©y. §èi víi lo¹i c©y BÊt Tö th× kh«ng cÇn dïng Lé Thñy ®Ó ch¨m sãc\n- Gi©y thø 241 ®Õn gi©y thø 300: giai ®o¹n thu ho¹ch phÇn th­ëng, phÇn th­ëng sÏ t­¬ng øng víi mçi lo¹i c©y kh¸c nhau ")	
	else
		Talk(1,"JQ_GetInfo","Ho¹t ®éng Ng«i Sao Vµng – Ng«i Sao B¹c diÔn ra trong kho¶ng 24-04-2009 24:00 31-05-2009. Vµo c¸c thêi gian 18 giê ®Õn 19 giê, tõ thø hai ®Õn thø s¸u hµng tuÇn, c¸c h¹ cã thÓ  thu thËp miÔn phİ Ng«i Sao B¹c t¹i CÈm Nang §¹i Sù KiÖn. \n- Tïy theo cÊp ®é cña nh©n vËt mµ sÏ nhËn ®­îc sè l­¬ng Ng«i Sao B¹c kh¸c nhau\n- Thêi gian gi÷a 2 lÇn nhËn Ng«i Sao B¹c liªn tiÕp lµ 5 phót\n- C¸c h¹ dïng Ng«i Sao B¹c ®Ó n©ng cÊp thµnh Ng«i Sao Vµng t¹i NPC Phi YÕn Tiªn Tö.\n- Tõ thø b¶y ®Õn chñ nhËt hµng tuÇn, c¸c h¹ dïng Ng«i Sao Vµng ®Ó ®æi lÊy phÇn th­ëng t¹i NPC Phi YÕn Tiªn Tö."	)	
	end	
end