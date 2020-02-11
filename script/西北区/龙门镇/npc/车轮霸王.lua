-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÁúÃÅÕòNPC³µÂÖ°ÔÍõScript
-- By StarryNight
-- 2007/06/13 AM 10:38

-- »ÄÎßµÄÊÀ½ç£¬ÎÒÃÇ»¹ÄÜÕÒµ½Ê²Ã´£¿

-- ======================================================

-- ÒýÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- Î÷±±ÈÎÎñ05³Â²Ö°µ¶È----------------------------------
	
	--Óë³µÂÖ¶Ô»°ÁìÈ¡05³Â²Ö°µ¶ÈÈÎÎñ
	if nStep_XBTask == 16 then
		task_005_01_0();
		return
	end
	
	--Î´ÓëÅ·Ñô»­¶Ô»°Ñ¯ÎÊ¼àÀÎÎ»ÖÃ(»ñµÃÒ»Æ·ÌÃÐÂ±¸³ÆºÅ)
	if nStep_XBTask == 17 then
		task_005_01_1();
		return
	end
	
	--ÉÐÎ´¾È³öÍÞÍÞÉ±ÊÖÇ°¶Ô»°
	if nStep_XBTask >= 18 and nStep_XBTask <= 23 then
		task_005_01_2();
		return
	end
	
	--¾È³öÉ±ÊÖÍÞÍÞ½»ÈÎÎñ£¬Íê³ÉµÚÒ»¸ö¿¼Ñé
	if nStep_XBTask == 24 then		
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃÐÂ±¸³ÆºÅ 
			task_005_09_0();
		else
			xb_title_tip(1,"Xa Lu©n B¸ V­¬ng");
		end
		return
	end
	
	---------------------------------- Î÷±±ÈÎÎñ06²»ËÀ½ðµ¤----------------------------------
	
	--ÁìÈ¡µÚ¶þ¸ö¿¼Ñé
	if nStep_XBTask == 25 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃÐÂ±¸³ÆºÅ 
			task_006_01_0();
		else
			xb_title_tip(1,"Xa Lu©n B¸ V­¬ng");
		end
		return
	end
	
	--»¹Ã»Íê³ÉµÚ¶þ¸ö¿¼Ñé
	if nStep_XBTask >= 26 and nStep_XBTask <= 29 then
		task_006_01_1();
		return
	end
	
	--Íê³ÉµÚ¶þ¸ö¿¼Ñé
	if nStep_XBTask == 30 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃÐÂ±¸³ÆºÅ 
			task_006_06_0();
		else
			xb_title_tip(1,"Xa Lu©n B¸ V­¬ng");
		end
		return
	end
	
	---------------------------------- Î÷±±Çø07ÄÐ¶ùï£¹Ç----------------------------------
	
	--ÁìÈ¡µÚÈý¸ö¿¼Ñé
	if nStep_XBTask == 31 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃÐÂ±¸³ÆºÅ 
			task_007_01_0();
		else
			xb_title_tip(1,"Xa Lu©n B¸ V­¬ng");
		end
		return
	end
	
	--Î´Íê³ÉµÚÈý¸ö¿¼Ñé
	if nStep_XBTask == 32 then
		task_007_01_1();
		return
	end
	
	--ÒÑÍê³ÉµÚÈý¸ö¿¼Ñé(»ñµÃÒ»Æ·ÌÃ-´Ì¿Í³ÆºÅ)
	if nStep_XBTask == 33 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃÐÂ±¸³ÆºÅ 
			task_007_02_0();
		else
			xb_title_tip(1,"Xa Lu©n B¸ V­¬ng");
		end		
		return
	end
	
	--ÉÐÎ´¼ûµ½Ô¬·ÉÔÆ
	if nStep_XBTask >= 34 and nStep_XBTask <= 35 then
		task_007_02_1();
		return
	end
	
	---------------------------------- Î÷±±Çø08Æå·êµÐÊÖ----------------------------------
	
	--ÁìÈ¡Ç°ÍùÑ¯ÎÊÍØ°ÎºëµÄÈÎÎñ
	if nStep_XBTask == 36 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ´Ì¿Í³ÆºÅ 
			task_008_01_0();
		else
			xb_title_tip(2,"Xa Lu©n B¸ V­¬ng");
		end		
		return
	end
	
	--ÉÐÎ´Ç°ÍùÓëÍØ°Îºë¶Ô»°
	if nStep_XBTask >= 37 and nStep_XBTask <= 38 then
		task_008_01_1();
		return
	end
	
	---------------------------------- Î÷±±Çø11·ÖÖ§1_3µÛÍõÖ®Ä¹----------------------------------
	
	--¹âÃ÷¶¥µ÷²éÍêºóÓë³µÂÖ°ÔÍõ¶Ô»°£¨»ñµÃÒ»Æ·ÌÃ·É»¤³ÆºÅ£©
	if nStep_XBTask_01 == 8 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ´Ì¿Í³ÆºÅ 
			task_011_02_0();
		else
			xb_title_tip(2,"Xa Lu©n B¸ V­¬ng");
		end
		return
	end
	
	--»¹Ã»ÓëÅ·Ñô»­¶Ô»°£¬Ã»È¡µÃ½ðË¿ÃæÕÖÖ®Ç°
	if nStep_XBTask_01 >= 9 and nStep_XBTask_01 <=  11 then
		task_011_02_1();
		return
	end
	
	--------------------------------- Î÷±±Çø12·ÖÖ§1_4¶Ï±Û²ÐÍÈ----------------------------------	
	
	--È¡µÃ»òÃ»È¡µÃ½ðË¿ÃæÕÖ
	if nStep_XBTask_01 == 12 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ·É»¤³ÆºÅ 
			task_012_01_0();
		else
			xb_title_tip(3,"Xa Lu©n B¸ V­¬ng");
		end
		return
	end
	
	--»¹Ã»É±ËÀ¶Ï±Û²ÐÍÈ
	if nStep_XBTask_01 == 13 then
		task_012_02_1();
		return
	end
	
	--ÒÑ¾­É±ËÀ¶Ï±Û²ÐÍÈ
	if nStep_XBTask_01 == 14 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ·É»¤³ÆºÅ 
			task_012_03_0();
		else
			xb_title_tip(3,"Xa Lu©n B¸ V­¬ng");
		end
		return
	end
	
	--»¹Ã»Ç°ÍùÓëÍØ°Îºë¶Ô»°
	if nStep_XBTask_01 == 15 then
		task_012_03_1();
		return
	end
	
	---------------------------------- Î÷±±Çø16·ÖÖ§1_7Ò©ÈË¾ªÏÖ----------------------------------
	--Óë³µÂÖ»ã±¨¹ØÓÚÁêÄ¹µÄÇé¿ö
	if nStep_XBTask_01 == 30 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ»¢Òí³ÆºÅ 
			task_016_02_0();
		else
			xb_title_tip(4,"Xa Lu©n B¸ V­¬ng");
		end
		return
	end
	
	--»¹Î´ÓëÅ·Ñô»­»ã±¨Ò©ÈËÒ»ÊÂ
	if nStep_XBTask_01 == 31 then
		task_016_02_1();
		return
	end
	
	---------------------------------- Î÷±±Çø20·ÖÖ§1_11±ø²»ÑáÕ©----------------------------------
	--½«Î±ÔìÒ©·½½»¸ø³µÂÖ°ÔÍõ£¨»ñµÃÒ»Æ·ÌÃÓðÎÀ³ÆºÅ£©
	if nStep_XBTask_01 == 51 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ»¢Òí³ÆºÅ 
			task_020_02_0();
		else
			xb_title_tip(4,"Xa Lu©n B¸ V­¬ng");
		end
		return
	end
	
	--»¹Î´Óë²¶¿ì¶Ô»°
	if nStep_XBTask_01 == 52 then
		task_020_02_1();
		return
	end
	
	---------------------------------- Î÷±±Çø21·ÖÖ§1_12½£°ÎåóÕÅ----------------------------------
	--É±ËÀÍÞÍÞÉ±ÊÖºó»Ø¼û³µÂÖ°ÔÍõ
	if nStep_XBTask_01 == 56 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃÓðÎÀ³ÆºÅ 
			task_021_01_0();
		else
			xb_title_tip(5,"Xa Lu©n B¸ V­¬ng");
		end
		return
	end

	----Î´ÓëÍØ°Îºë¶Ô»°
	if nStep_XBTask_01 == 57 then
		task_021_01_1();
		return
	end
	
	---------------------------------- Î÷±±Çø22·ÖÖ§1_13´óÄ®»ÃÏó----------------------------------	
	
	--Óë³µÂÖ°ÔÍõÕ½¶·
	if nStep_XBTask_01 == 60 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃÓðÎÀ³ÆºÅ 
			task_022_01_0();
		else
			xb_title_tip(5,"Xa Lu©n B¸ V­¬ng");
		end
		return
	end
	
	--´ò°Ü³µÂÖ°ÔÍõºó¶Ô»°
	if nStep_XBTask_01 >= 61 then
		task_022_01_2();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"Ng­¬i còng biÕt NhÊt PhÈm ®­êng? Xem ra danh tiÕng NhÊt PhÈm ®­êng ë Phông T­êng kh¸ vang déi."},
		{"VËy ng­¬i nghe qua ThËp §¹i Kim Cang cña NhÊt PhÈm ®­êng ch­a? Ta chÝnh lµ thñ lÜnh cña ThËp §¹i Kim Cang."},
		{"NÕu ng­¬i cã høng thó víi tin cña NhÊt PhÈm ®­êng th× cã thÓ th­¬ng l­îng."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--³µÂÖ°ÔÍõËÀÍö½Å±¾
function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIndex = 0;
local strTalk = {
	"X­a nay ta ®Òu rÊt c¶nh gi¸c kh«ng ngê mét phót l¬ lµ ®· bÞ tªn tiÓu bèi thõa n­íc ®ôc th¶ c©u, lµm háng chuyÖn tèt cña ta vµ tæn thÊt thùc lùc cña NhÊt PhÈm ®­êng. Nãi thËt víi ng­¬i, ngµy tµn cña §¹i Tèng s¾p ®Õn råi, sím muén th× trung nguyªn còng sÏ thuéc vÒ T©y H¹. C¸c ng­¬i ch¹y kh«ng tho¸t ¶o gi¸c sa m¹c ®©u. Ha ha...",
	"Sao? ThÕ nµo lµ ¶o gi¸c sa m¹c?",
	"Ha ha…",
	"(Kh«ng lÏ thÇn trÝ h¾n kh«ng b×nh th­êng? E r»ng h¾n biÕt ®­îc NhÊt PhÈm ®­êng sÏ kh«ng tha cho h¾n nªn ®iªn lo¹n råi. Nghe giäng h¾n kh«ng gièng nãi kho¸c, Th¸c B¹t tiÒn bèi tøng nãi T©y H¹ Ph¸p V­¬ng tiÕn vÒ Sa m¹c nhÊt ®Þnh cã ©m m­u. Kh«ng xong råi ph¶i b¸o cho ¢u d­¬ng tiÒn bèi.)",
	}

	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	nNpcIndex = CreateNpc("Xa Lu©n B¸ V­¬ng","Xa Lu©n B¸ V­¬ng",507,1791,3173);
	SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\ÁúÃÅÕò\\npc\\³µÂÖ°ÔÍõ.lua");
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 60 then
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,61);
			TaskTip("VÒ b¸o víi ¢u D­¬ng Häa chuyÖn ¶o gi¸c sa m¹c.");
			Msg2Player("VÒ b¸o víi ¢u D­¬ng Häa chuyÖn ¶o gi¸c sa m¹c.");
			--Çå³ýÖ®Ç°»ñµÃµÄÒ»Æ·ÌÃ³ÆºÅ
			for t=1,5 do
				RemoveTitle(60,t);
			end
			add_xb_title(6);--Ò»Æ·ÌÃ¼éÏ¸³ÆºÅ
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 60 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_01,61);
				TaskTip("VÒ b¸o víi ¢u D­¬ng Häa chuyÖn ¶o gi¸c sa m¹c.");
				Msg2Player("VÒ b¸o víi ¢u D­¬ng Häa chuyÖn ¶o gi¸c sa m¹c.");
				--Çå³ýÖ®Ç°»ñµÃµÄÒ»Æ·ÌÃ³ÆºÅ
				for t=1,5 do
				RemoveTitle(60,t);
				end
				add_xb_title(6);--Ò»Æ·ÌÃ¼éÏ¸³ÆºÅ
				end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
