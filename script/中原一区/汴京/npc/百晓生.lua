
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ĞÂÊÖÎÊ´ğ¹¦ÄÜÊµÌå´¦ÀíÎÄ¼ş_Â·ÈË°ÙÏşÉú
-- Edited by peres
-- 2005/04/14 PM 13:59

-- ¿´¼ûµÄ  Ï¨ÃğÁË
-- ÏûÊ§µÄ  ¼Ç×¡ÁË
-- ÎÒÕ¾ÔÚ  º£½ÅÌìÑÄ
-- Ìı¼û    ÍÁÈÀÃÈÑ¿
-- µÈ´ı    ê¼»¨ÔÙ¿ª
-- °Ñ·Ò·¼  Áô¸øÄê»ª
-- ±Ë°¶    Ã»ÓĞµÆËş
-- ÎÒÒÀÈ»  ÕÅÍû×Å
-- ÌìºÚ    Ë¢°×ÁËÍ··¢
-- ½ôÎÕ×Å  ÎÒ»ğ°Ñ
-- ËûÀ´    ÎÒ¶Ô×Ô¼ºËµ
-- ÎÒ²»º¦ÅÂ
-- ÎÒºÜ°®Ëû

-- lyrics : ±Ë°¶»¨

-- ======================================================

Include("\\script\\task\\question\\question_head.lua");
Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\world\\lizhi_³¤¸èÃÅ\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv40\\task_main.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");

-- Èë¿Ú´¦Àíº¯Êı
function main()

local Talk_Main_Sign = {};--¹¹½¨ÈÎÎñ±ê¼Ç;1Îª³¤¸èÃÅÈÎÎñ£»2ÎªÎ÷ÄÏÈÎÎñ£»3ÎªÎ÷±±ÈÎÎñ
local SelectList = {};
local nStep = GetTask(TASK_TWO);
local strSay = {"Ta chİnh lµ kÎ tóc trİ ®a m­u B¸ch HiÓu Sinh! Ng­¬i t×m ta cã g× kh«ng?"}

	SelectList = {
	
	[1] = {
					{
				 		"V·n bèi cã nghe chuyÖn cña Tr­êng Ca M«n, muèn ®­îc tiÒn bèi chØ gi¸o./task_002_00"
				 	},
				 	{
				 		"Muèn thØnh gi¸o chuyÖn vÒ vâ l©m truyÒn thuyÕt!/wl_story",
--				 		"ÎÒÏëºÍÄú±ÈÊÔÒ»ÏÂÓĞ¹ØÎäÁÖµÄÑ§Ê¶¡£/ConfirmQuestion"
				 	}
				},
	[2] = {
					{
						"V·n bèi cã nghe chuyÖn cña T©y nam §¹i Lı, muèn ®­îc tiÒn bèi chØ gi¸o./task_100_00",
					},
					
					{
						"V·n bèi cã nghe chuyÖn cña T©y nam §¹i Lı, muèn ®­îc tiÒn bèi chØ gi¸o./task_100_01"
					},
				},
	[3] = {
					{
						"V·n bèi ®­îc KhÊu ChuÈn ñy th¸c, muèn ®­îc tiÒn bèi chØ gi¸o vÒ ®éng tÜnh mÊy ngµy nay cña NhÊt phÈm ®­êng ë phİa t©y biªn giíi T©y H¹./task_001_02_0",
					},
					{
						"V·n bèi ®­îc KhÊu ChuÈn ñy th¸c, muèn ®­îc tiÒn bèi chØ gi¸o vÒ ®éng tÜnh mÊy ngµy nay cña NhÊt phÈm ®­êng ë phİa t©y biªn giíi T©y H¹./task_001_02_1"
					},
					{
						"V·n bèi muèn ®­îc tiÒn bèi chØ gi¸o lµm c¸ch nµo ®Ó b¾t S¸t Thñ Oa Oa/task_005_03_0"
					},
					{
						"V·n bèi muèn ®­îc tiÒn bèi chØ gi¸o lµm c¸ch nµo ®Ó b¾t S¸t Thñ Oa Oa/task_005_03_1"
					},
				}
		}

	--¹¹½¨ÈÎÎñ¶Ô»°´¦Àí
	
	--³¤¸èÃÅÈÎÎñ´¦Àí
	
	--task_002_00
	if nStep == 1 then
		Talk_Main_Sign[1] = 1;
	--szSay
	elseif nStep == 2 then
		Talk_Main_Sign[1] = 2;
	else
		Talk_Main_Sign[1] = 0;
	end
	
	--´óÀíÈÎÎñ´¦Àí
	--task_100_00
	if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
		Talk_Main_Sign[2] = 1;
	--task_100_01
	elseif GetTask(TASK_DL_LV40_ID) == 1 then
		Talk_Main_Sign[2] = 2;
	else
		Talk_Main_Sign[2] = 0;
	end
	
	--Î÷±±ÈÎÎñ´¦Àí
	if GetTask(TASK_XB_ID) == 1 then
		Talk_Main_Sign[3] = 1;
	elseif GetTask(TASK_XB_ID) == 2 then
		Talk_Main_Sign[3] = 2;
	elseif GetTask(TASK_XB_ID) == 18 then
		Talk_Main_Sign[3] = 3;
	elseif GetTask(TASK_XB_ID) == 19 then
		Talk_Main_Sign[3] = 4;
	else
		Talk_Main_Sign[3] = 0;
	end
	
	for i=1,getn(Talk_Main_Sign) do
		if Talk_Main_Sign[i] ~= 0 then
			for t=1,getn(SelectList[i][Talk_Main_Sign[i]]) do
				tinsert(strSay,SelectList[i][Talk_Main_Sign[i]][t]); 
			end
		end
	end
	
	tinsert(strSay,"Cã g× ®©u/MainExit");
	
	if Talk_Main_Sign[1] ~= 0 or Talk_Main_Sign[2] ~= 0 or Talk_Main_Sign[3] ~= 0 then
		SelectSay(strSay);
		return
	end
	
--³¤¸èÃÅÈÎÎñµÄ´¦Àí
    
--    local nStep = 0;
--    local szTalk = {
--        "°ÙÏşÉú£ºÄãÓÖ»ØÀ´ÁË£¿Õâ´ÎÊÇÊ²Ã´·ç°ÑÄã´µ¹ıÀ´µÄ£¿",  
--        "Íæ¼Ò£ºÍí±²Åöµ½Ò»Ğ©ÓĞ¹Ø{³¤¸èÃÅ}µÄÊÂÇé£¬ÌØÀ´ÏòÄúÌÖ½Ì¡£",
--        "°ÙÏşÉú£ºÁ¬ÄãÒ²ÖªµÀ³¤¸èÃÅµÄÊÂÇéÁË£¿ÕÔÑÓÄêÕâÈË»¹ÕæÊÇ¶à×ì¡£Èç´Ë¿´À´ÄãÒ²Óë³¤¸èÃÅÓĞÔµ£¬Ò²°Õ£¬ÎÒ±ãÖ¸µãÄãÒ»¶ş¡£²»¹ıÎÒÕâĞ©ÄêÔÚ½­ºşÖĞÕ·×ªµßô¤£¬ÓĞ²»ÉÙÕä²ØµÄÊé¼®ÒÑ¾­Ê§ÂäÔÚ¸÷µØÁË£¬ÓĞĞ©Ï¸½ÚÒ»Ê±Ëµ²»Çå³ş£¬Äã¿É²»Òª±§Ô¹°¡¡£"
--    };
--    local szSay = {
--        "°ÙÏşÉú£ºÎÒ¾ÍÊÇÈË³Æ¡°×ãÖÇ¶àÄ±¡±µÄ°ÙÏşÉú£¬ÄãÕÒÎÒÓĞÊ²Ã´ÊÂÇéÃ´£¿",
--        "ÎÒÏëÏòÄúÌÖ½ÌÓĞ¹ØÎäÁÖ´«ËµµÄ¹ÊÊÂ¡£/wl_story",
--        "ÎÒÏëºÍÄú±ÈÊÔÒ»ÏÂÓĞ¹ØÎäÁÖµÄÑ§Ê¶¡£/ConfirmQuestion"
--    };
--
--    nStep = GetTask(TASK_TWO);
--    
--    if nStep == 1 then
--			--Î÷ÄÏÇø40¼¶ÈÎÎñÈë¿Ú(Ìõ¼ş:1Íê³ÉÎäÁêÉ½ÈÎÎñ;2µÈ¼¶´óÓÚ35¼¶)
--    	if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
--				local strSelect = {
--        	"°ÙÏşÉú£ºÄãÓÖ»ØÀ´ÁË£¿Õâ´ÎÊÇÊ²Ã´·ç°ÑÄã´µ¹ıÀ´µÄ£¿",
--        	"Íí±²Åöµ½Ò»Ğ©ÓĞ¹Ø{³¤¸èÃÅ}µÄÊÂÇé£¬ÌØÀ´ÏòÄúÌÖ½Ì¡£/task_002_00",
--        	"Íí±²Åöµ½Ò»Ğ©ÓĞ¹Ø{Î÷ÄÏ´óÀí}µÄÊÂÇé£¬ÌØÀ´ÏòÄúÌÖ½Ì¡£/task_100_00"
--    		};
--    		SelectSay(strSelect);
--    		return
--    	end
--    	if GetTask(TASK_DL_LV40_ID) == 1 then
--    		local strSelect = {
--        	"°ÙÏşÉú£ºÄãÓÖ»ØÀ´ÁË£¿Õâ´ÎÊÇÊ²Ã´·ç°ÑÄã´µ¹ıÀ´µÄ£¿",
--        	"Íí±²Åöµ½Ò»Ğ©ÓĞ¹Ø{³¤¸èÃÅ}µÄÊÂÇé£¬ÌØÀ´ÏòÄúÌÖ½Ì¡£/task_002_00",
--        	"Íí±²Åöµ½Ò»Ğ©ÓĞ¹Ø{Î÷ÄÏ´óÀí}µÄÊÂÇé£¬ÌØÀ´ÏòÄúÌÖ½Ì¡£/task_100_01"
--    		};
--    		SelectSay(strSelect);
--    		return
--    	end
--      TalkEx("task_002_00", szTalk);
--      return
--    elseif nStep == 2 then
--    	--Î÷ÄÏÇø40¼¶ÈÎÎñÈë¿Ú(Ìõ¼ş:1Íê³ÉÎäÁêÉ½ÈÎÎñ;2µÈ¼¶´óÓÚ35¼¶)
--    	if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
--				szSay = {
--        	"°ÙÏşÉú£ºÎÒ¾ÍÊÇÈË³Æ¡°×ãÖÇ¶àÄ±¡±µÄ°ÙÏşÉú£¬ÄãÕÒÎÒÓĞÊ²Ã´ÊÂÇéÃ´£¿",
--        	"ÎÒÏëÏòÄúÌÖ½ÌÓĞ¹ØÎäÁÖ´«ËµµÄ¹ÊÊÂ¡£/wl_story",
--        	"ÎÒÏëºÍÄú±ÈÊÔÒ»ÏÂÓĞ¹ØÎäÁÖµÄÑ§Ê¶¡£/ConfirmQuestion",
--        	"Íí±²Åöµ½Ò»Ğ©ÓĞ¹Ø{Î÷ÄÏ´óÀí}µÄÊÂÇé£¬ÌØÀ´ÏòÄúÌÖ½Ì¡£/task_100_00"
--   			 	};
--   			SelectSay(szSay);
--      	return
--   		end;
--   		if GetTask(TASK_DL_LV40_ID) == 1 then
--    		szSay = {
--        	"°ÙÏşÉú£ºÎÒ¾ÍÊÇÈË³Æ¡°×ãÖÇ¶àÄ±¡±µÄ°ÙÏşÉú£¬ÄãÕÒÎÒÓĞÊ²Ã´ÊÂÇéÃ´£¿",
--        	"ÎÒÏëÏòÄúÌÖ½ÌÓĞ¹ØÎäÁÖ´«ËµµÄ¹ÊÊÂ¡£/wl_story",
--        	"ÎÒÏëºÍÄú±ÈÊÔÒ»ÏÂÓĞ¹ØÎäÁÖµÄÑ§Ê¶¡£/ConfirmQuestion",
--        	"Íí±²Åöµ½Ò»Ğ©ÓĞ¹Ø{Î÷ÄÏ´óÀí}µÄÊÂÇé£¬ÌØÀ´ÏòÄúÌÖ½Ì¡£/task_100_01"
--    			};
--    		SelectSay(szSay);
--      	return
--    	end
--    	SelectSay(szSay);
--      return
--    end
--    
--    if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
--    	strTalk = {
--      	"°ÙÏşÉú£ºÎÒ¾ÍÊÇÈË³Æ¡°×ãÖÇ¶àÄ±¡±µÄ°ÙÏşÉú£¬ÄãÕÒÎÒÓĞÊ²Ã´ÊÂÇéÃ´£¿",
--      	"Íæ¼Ò:Íí±²Åöµ½Ò»Ğ©ÓĞ¹Ø{Î÷ÄÏ´óÀí}µÄÊÂÇé£¬ÌØÀ´ÏòÄúÌÖ½Ì¡£"
--   		 	};
--    	TalkEx("task_100_00",strTalk);
--    	return
--    end
--    	
--    if GetTask(TASK_DL_LV40_ID) == 1 then
--    	strTalk = {
--      	"°ÙÏşÉú£ºÄãÈ¥ÕÒ{ÕÔÑÓÄê}ÎÊÎÊ°É£¬Ëû¾ÍÔÚ{ãê¾©}¡£"
--   		 	};
--    	TalkEx("task_100_01",strTalk);
--    	return
--    end
    
-- ½ÌÓıÈÎÎñµÄ´¦Àí
local nState = TE_GetTeachState();

if (nState==18) then
	task_018_00();
	return
end;

	Say("Thùc lùc cña Tµng KiÕm s¬n trang sao giÊu ®­îc ta!",0);

end;

-- ´Ó±í¸ñÎÄ¼şÖĞ¶ÁÈ¡Ã¿¸öÈÎÎñµÄÈ¨ÖØĞÎ³ÉÒ»¸öÊı×é
CreateRateArry();

-- ËµÃ÷TASK_TWOµÄÈÎÎñ×´Ì¬£¬20000±íÊ¾step2£¬ºóÃæµÄ4Î»·Ö±ğ´ú±íÊÇ·ñÍê³ÉÁË4¸öÏëÁË½âµÄÄÚÈİ
-- Íê³ÉÒ»¸öÁË½âµÄÄÚÈİ£¬ºóÃæ4Î»ÖĞµÄ¶ÔÓ¦Î»¾ÍÖÃÎª1

function task_002_00()
    local szSay = {
        "Ta chİnh lµ kÎ tóc trİ ®a m­u B¸ch HiÓu Sinh! Ng­¬i t×m ta cã g× kh«ng?",
        "T¹i h¹ muèn thØnh gi¸o kiÕn thøc vâ l©m!/wl_story",
--        "ÎÒÏëºÍÄú±ÈÊÔÒ»ÏÂÓĞ¹ØÎäÁÖµÄÑ§Ê¶¡£/ConfirmQuestion"
    };
    SetTask(TASK_TWO, 2);
    SelectSay(szSay);
end;

--¼ÓÈëÎ÷ÄÏÈÎÎñºóµÄ¸Ä¶¯
function task_002_10()
    local szSay = {
        "Ng­¬i còng biÕt chuyÖn Tr­êng Ca M«n sao? G· TriÖu Diªn Niªn qu¶ thËt nhiÒu chuyÖn nh­ng xem nh­ ng­¬i cã duyªn víi chuyÖn Tr­êng Ca M«n. MÊy n¨m nay ta l¨n lén chèn giang hå, biÕt ®­îc nhiÒu th­ tŞch quı hiÕm thÊt l¹c ë kh¾p n¬i nh­ng ta kh«ng biÕt chİnh x¸c ë n¬i nµo. Xin ®õng o¸n hËn ta!",
        "T¹i h¹ muèn thØnh gi¸o kiÕn thøc vâ l©m!/wl_story",
--        "ÎÒÏëºÍÄú±ÈÊÔÒ»ÏÂÓĞ¹ØÎäÁÖµÄÑ§Ê¶¡£/ConfirmQuestion"
    };
    SetTask(TASK_TWO, 2);
    SelectSay(szSay);
end;

function wl_story()
    local szSay = {
        "Thêi vâ l©m lo¹n thÕ, anh hïng xuÊt hiÖn! Ng­¬i muèn hiÓu chuyÖn chi?",
        "Muèn biÕt vÒ lai lŞch Tr­êng Ca m«n./say1",
        "Muèn biÕt vÒ kÕt cÊu tæ chøc cña Tr­êng Ca m«n./say2",
        "Muèn hiÓu chuyÖn cña Thiªn ¢m gi¸o Liªu Quèc./say3",
        "Muèn hiÓu chuyÖn cña Xi Háa gi¸o §¹i Lı./say4",
        "Muèn hiÓu chuyÖn T©y H¹ NhÊt PhÈm §­êng./say5"
    };
    SelectSay(szSay);
end;

function say1()
    local szTalk = {
        "Sau khi Th¸i Tæ ®êi tr­íc b×nh ®Şnh giang s¬n B«i Töu Thİch Binh QuyÒn, c¸c t­íng lÜnh Th¹ch Thñ Tİn, Cao Hoµi §øc, Tr­¬ng LÖnh Phong, TriÖu Ng¹n Huy ®Òu c¸o l·o håi h­¬ng. TriÖu Ng¹n Huy ®¹i nh©n kh«ng cam c¶nh c« ®¬n, ®· liªn l¹c vµi b»ng h÷u giang hå, th­êng cïng nhau ng©m th¬ ®èi x­íng hoÆc tû thİ vâ c«ng.",
        "Sau nµy c¸c b»ng h÷u cïng kÕt nghÜa, thµnh lËp nªn mét m«n ph¸i. Khi Êy, ng­êi trong ph¸i hÇu hÕt ®Òu lµ c¸c sÜ phu nho nh·, lÊy s¸ng t¸c thi ca lµm thó vui nªn mäi ng­êi ®Òu tù x­ng lµ Tr­êng Ca M«n. Tuy Tr­êng Ca M«n th©n t¹i giang hå nh­ng tr­íc sau rÊt quan t©m Quèc kÕ d©n sinh, hµnh hiÖp tr­îng nghÜa kh¾p n¬i theo t«n chØ lu«n t¹o phóc cho thiªn h¹ b¸ t¸nh.",
        "Ra lµ vËy! §a t¹ tiÒn bèi chØ gi¸o!"
    };
    TalkEx("", szTalk);
end;

function say2()
    local szNotFinished = {
        "Tr­êng Ca M«n hÇu hÕt lµ nh÷ng v¨n nh©n mÆc kh¸ch næi danh. ChØ ®¸ng tiÕc lÇn tr­íc khi ta ë L­¬ng S¬n, quyÓn s¸ch ghi chĞp vÒ c©u chuyÖn cña hä ®· bŞ thÊt l¹c gÇn D· Tr­ L©m. H·y gióp ta t×m Tr­êng M«n s¸ch, ta sÏ kÓ thªm cho nghe!",
	    "Tr­êng M«n S¸ch gåm 9 trang. Thu thËp ®ñ, ta sÏ nãi râ cho ng­¬i biÕt!"
    };
    local szFinished = {
        "Tr­êng Ca M«n hÇu hÕt lµ nh÷ng v¨n nh©n mÆc kh¸ch dung rñi kh¾p n¬i, næi tiÕng trªn giang hå vÒ Ngò hiÖp Nh©n NghÜa LÔ Trİ Tİn vµ Tø h÷u CÇm Kú Thi Häa.",
        "Tİnh c¸ch kiªn c­êng Chuyªn lµm viÖc nghÜa nh©n. Hµn ThÕ M¹nh, lu«n tiªn phong ra tay hµnh hiÖp tr­îng nghÜa. X¶ th©n v× nghÜa. C¶nh V©n Phi lu«n coi träng nghÜa khİ, víi b»ng h÷u lu«n v÷ng d¹ s¾c son. LÔ Th­îng v·ng lai. T©n Thanh NhiÔm lµ néi gia quyÒn cao nh©n, m­în lùc ®¸nh lùc lµ tuyÖt kü næi danh cña ng­êi nµy.",
        "Tóc trİ ®a m­u, tİnh t×nh ®iÒm ®¹m, ngo¹i trõ kiÕn thøc réng còng kh«ng cã g× næi bËt. H¹ bót thµnh v¨n. L­¬ng Th­îng Ngäc lµ së tr­êng, c«ng phu xuÊt thÇn nhËp hãa, cã thÓ s¸nh ngang víi C¶nh V©n Phi, nh­ng tiÕc thay ¶ l¹i lµ mét nghÜa ®¹o c­íp cña ng­êi giµu chia cho ng­êi nghÌo.",
        "Tø h÷u CÇm Kú Thi Häa. ¢u D­¬ng Häa lµ bËc thÇy vÒ mµu s¾c. H¹ HÇu CÇm x­ng lµ ®Ö nhÊt danh cÇm ë D­¬ng Ch©u. Gia C¸t Kú ®Ö nhÊt danh cê ®ang tró t¹i Nam Thµnh §« phñ. C«ng T«n Th­ ë T­¬ng D­¬ng giái c¶ vÒ th­ ph¸p lÉn ®¸nh b¹c .",
        "Ra lµ vËy! §a t¹ tiÒn bèi chØ gi¸o!"
    }
    local nStep = GetTask(TASK_TWO_ONE);
    if nStep == 0 or nStep == 1 then
        -- ³¤¸èÃÅÈËÎïÆ×
        if GetItemCount(2,0,51) >= 9 then
            DelItem(2,0,51,9);
            SetTask(TASK_TWO_ONE, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(92));
            if GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_THREE) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_ONE, 1);
            Msg2Player("§Õn D· Tr­ L©m t×m Tr­êng M«n S¸ch thÊt l¹c.");
            TaskTip("§Õn D· Tr­ L©m t×m Tr­êng M«n S¸ch thÊt l¹c.");
            CreateTrigger(0, 502, 92);  --ÍÀÉ±Ò°ÖíÁÖ
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say3()
    local szNotFinished = {
	    "Thiªn ¢m gi¸o nguån gèc ë Liªu C­¬ng. Ta ®· tõng lªn ph­¬ng B¾c dß la t×nh h×nh cña chóng vµ ghi chĞp l¹i Thiªn ¢m gi¸o t¹p th­. Nµo ngê trªn ®­êng quay vÒ Trung Nguyªn bŞ ng­êi cña Linh B¶o s¬n c­íp mÊt. H·y thay ta ®Õn ®ã lÊy vÒ, ta sÏ kÓ râ cho ng­¬i chuyÖn vÒ Thiªn ¢m gi¸o!",
	    "Thiªn ¢m gi¸o t¹p th­ gåm 9 trang. Thu thËp ®ñ, ta sÏ kÓ râ cho ng­¬i!"
    };
    local szFinished = {
    	"Thiªn ¢m gi¸o cã nguån gèc tõ mét t«n gi¸o thÇn bİ ë Liªu C­¬ng, gi¸o nghÜa lµ tin t­ëng vµo v¹n vËt ®Òu cã linh hån, th­êng dïng nghi thøc ca vò ®Ó tÕ b¸i trêi ®Êt. Thiªn ¢m gi¸o nhiÒu vâ l©m cao thñ nªn mÊy n¨m nay cã thÕ lùc ngµy cµng m¹nh ë Liªu Quèc, nhiÒu quı téc ë Liªu Quèc lµ tİn ®å cña Thiªn ¢m gi¸o.",
    	"Thèng so¸i tèi cao cña Thiªn ¢m gi¸o, d­íi cã T¶ H÷u hé ph¸p gióp gi¸o chñ thi hµnh quyÕt s¸ch. Trong gi¸o cã tam ®­êng Phong- Háa- L«i ®¶m tr¸ch c¸c viÖc dä th¸m t×nh b¸o, nghiªn cøu vâ nghÖ vµ th­ëng ph¹t c¸c gi¸o ®å. NhËt NguyÖt Tinh ChÊn tø ®µn dïng tÕ lÔ trêi ®Êt v¹n vËt. Ng­êi trùc tiÕp thèng lÜnh mÊy v¹n bang chóng lµ Hång H¾c Lam Hoµng B¹ch Ngò Kú Chñ.",
        "Ra lµ vËy! §a t¹ tiÒn bèi chØ gi¸o!"
    }
    local nStep = GetTask(TASK_TWO_TWO);
    if nStep == 0 or nStep == 1 then
        --ÌìÒõ½ÌÔÓÊé
        if GetItemCount(2,0,52) >= 9 then
            DelItem(2,0,52,9);
            SetTask(TASK_TWO_TWO, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(93));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_THREE) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_TWO, 1);
            Msg2Player("§Õn Linh B¶o s¬n ®o¹t vÒ Thiªn ¢m gi¸o t¹p th­!");
            TaskTip("§Õn Linh B¶o s¬n ®o¹t vÒ Thiªn ¢m gi¸o t¹p th­!");
            CreateTrigger(0, 503, 93);  --ÍÀÉ±Áé±¦É½
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say4()
    local szNotFinished = {
    	"Xi Háa gi¸o khëi nguån tõ phİa Nam §¹i Lı, cã tËp tôc l¹ th­êng. Gi¸o nghÜa Xi Háa gi¸o còng rÊt kú l¹. Ta ®· ®Õn ¤ M«ng Bé ë Nam C­¬ng dß la tin tøc cña Xi Háa gi¸o, ghi chĞp trong Xi Háa gi¸o d©n tôc nh­ng ng­êi ¤ M«ng Bé sî tiÕt lé ra ngoµi sÏ g©y bÊt lîi cho hä, kh«ng cho phĞp ta mang s¸ch ra khái Nam C­¬ng. H·y gióp ta lÊy nã vÒ, ta sÏ nãi râ chuyÖn Xi Háa gi¸o cho ng­¬i biÕt!",
    	"Xi Háa gi¸o d©n tôc gåm 9 trang. Thu thËp ®ñ, ta sÏ nãi râ cho ng­¬i biÕt!"
    };
    local szFinished = {
    	"Xi Háa gi¸o khëi nguån tõ phİa Nam §¹i Lı, cã tËp tôc l¹ th­êng. Gi¸o nghÜa Xi Háa gi¸o còng rÊt kú l¹. Xi V­u lµ vŞ thÇn ®­îc t«n kİnh nhÊt cña Xi Háa gi¸o. V× thÕ, Xi Háa gi¸o cã th©m thï s©u s¾c víi con ch¸u Huúnh §Õ ta.",
    	"Xi Háa gi¸o gi¸o chñ tù x­ng lµ Xi V­u chñ tÕ, lµ l·nh tô tinh thÇn tuyÖt ®èi cña Xi Háa gi¸o. D­íi gi¸o chñ cã Chóc Dung tÕ s­ vµ Céng C«ng tÕ s­ ®¶m tr¸ch tÕ b¸i Háa ThÇn vµ Thñy ThÇn, cÇu Thñy Háa t­¬ng tÕ. Ngoµi ra cßn cã Ngò Hµnh ph¸p s­, n¾m vÒ ngò hµnh t­¬ng sinh t­¬ng kh¾c, v¹n vËt ®­îc sinh s«i n¶y në. HiÖn ë §¹i Lı cã nhiÒu ho¹t ®éng cña Xi Háa gi¸o gi¸o ®å, d­êng nh­ ngÇm lËt ®æ ngai vŞ TiÒn V­¬ng Tö §¹i Lı.",
        "Ra lµ vËy! §a t¹ tiÒn bèi chØ gi¸o!"
    };
    local nStep = GetTask(TASK_TWO_THREE);
    if nStep == 0 or nStep == 1 then
        --ò¿»ğ½ÌÃñË×
        if GetItemCount(2,0,53) >= 9 then
            DelItem(2,0,53,9);
            SetTask(TASK_TWO_THREE, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(94));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_THREE, 1);
            Msg2Player("§Õn ¤ M«ng Bé ®o¹t vÒ s¸ch Xi Háa gi¸o d©n tôc!");
            TaskTip("§Õn ¤ M«ng Bé ®o¹t vÒ s¸ch Xi Háa gi¸o d©n tôc!");
            CreateTrigger(0, 504, 94);  --ÍÀÉ±ÎÚÃË²¿
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say5()
    local szNotFinished = {
	    "NhÊt PhÈm §­êng lµ tæ chøc thÇn bİ ë T©y H¹. Trong m«n ph¸i cã nhiÒu cao thñ. Khi ta tró t¹i Mé TuyÕt s¬n trang tõng cïng trang chñ bµn vÒ chuyÖn cña NhÊt PhÈm §­êng vµ ®· ghi chĞp l¹i trong NhÊt PhÈm §­êng bİ sù. Nµo ngê Mé TuyÕt s¬n trang cÊu kÕt víi ng­êi T©y H¹, thu gi÷ th­ tŞch cña ta trong s¬n trang. H·y gióp ta lÊy th­ tŞch vÒ, ta sÏ kÓ râ chuyÖn NhÊt PhÈm §­êng cho ng­¬i biÕt!",
	    "NhÊt PhÈm §­êng bİ sù gåm 9 trang. Thu thËp ®ñ, ta sÏ nãi râ cho ng­¬i nghe!"
    };
    local szFinished = {
        "NhÊt PhÈm §­êng do T©y h¹ chinh §«ng §¹i t­íng qu©n Xİch Liªn ThiÕt Thô s¸ng lËp. §Ó t¨ng c­êng qu©n lùc cho T©y H¹, Xİch Liªn ThiÕt Thô ®· chiªu mé nhiÒu vâ l©m dŞ sÜ gia nhËp NhÊt PhÈm §­êng, kh«ng ph©n biÖt xuÊt th©n chØ xem vâ nghÖ m¹nh yÕu, nªn ®· thu phôc ®­îc lßng ng­êi. Nh­ng còng v× thÕ, NhÊt PhÈm §­êng ®· thu nhËn nhiÒu nh©n sÜ vâ l©m vâ nghÖ cao c­êng nh­ng nh©n phÈm bÊt h¶o. Tõ ®ã, vâ l©m chİnh ®¹o lu«n xem th­êng NhÊt PhÈm §­êng!",
        "Xİch Liªn ThiÕt Thô lµ ®­êng chñ cña NhÊt PhÈm §­êng. Thµnh viªn hÇu hÕt lµ qu©n ®éi cña T©y H¹. NhÊt PhÈm §­êng hiÖn cã 4 vŞ ®­îc x­ng lµ Tø §¹i Thiªn V­¬ng, vâ c«ng cao c­êng nh­ng ra tay ¸c ®éc. Ngoµi ra cßn cã ThËp §¹i Kim Cang, mçi ng­êi thèng so¸i mét ®éi qu©n, g©y uy hiÕp nhiÒu cho biªn phßng cña §¹i Tèng. B»ng h÷u hµnh hiÖp giang hå, gÆp bän ng­êi nµy nhÊt mùc ph¶i cÈn thËn!",
        "Ra lµ vËy! §a t¹ tiÒn bèi chØ gi¸o!"
    };
    local nStep = GetTask(TASK_TWO_FOUR);
    if nStep == 0 or nStep == 1 then
        --Ò»Æ·ÌÃÒİÊÂ
        if GetItemCount(2,0,54) >= 9 then
            DelItem(2,0,54,9);
            SetTask(TASK_TWO_FOUR, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(95));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_THREE) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_FOUR, 1);
            Msg2Player("§Õn Mé TuyÕt s¬n trang ®o¹t vÒ NhÊt PhÈm §­êng bİ sù!");
            TaskTip("§Õn Mé TuyÕt s¬n trang ®o¹t vÒ NhÊt PhÈm §­êng bİ sù!");
            CreateTrigger(0, 505, 95);  --ÍÀÉ±ÄºÑ©É½×¯
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;


-- È·¶¨½ÓÊÜÈÎÎñ£¬¿ªÊ¼»Ø´ğÎÊÌâ
function ConfirmQuestion()
	do
		Talk(1,"",QA_TitleText.."VŞ "..GetPlayerSex().."Cã thÓ ®ä víi häc thøc uyªn b¸c cña l·o phu, qu¶ nhiªn hËu sinh kh¶ óy!");
		return 0;
	end;
	
	if GetStamina()<=QA_MINSTAMINA + 1 then
		Say(QA_TitleText.."VŞ "..GetPlayerSex().."tr«ng cã vÎ mÖt mái? Chi b»ng nghØ ng¬i <color=yellow>bæ sung chót thÓ lùc<color> råi ®Õn!",0);
		return
	end;

	SetTask(QA_STATE, 1); -- ÈÎÎñ×´Ì¬ÎªÒÑ¾­¿ªÊ¼»Ø´ğÈÎÎñ
--	SetTask(QA_RANDOMSEED, tonumber(date("%y%m%d%H%M%S"))); -- ¼ÇÂ¼Ëæ»úÖÖ×Ó
	CreateQuestion();
	return
end;

-- µ±Ò»¸öÎÊÌâ»Ø´ğµÃÕıÈ·Ê±
function AnswerRight()


	if GetTask(QA_FINISHNUM)+ 1 >= 10 then
		SetTask(QA_RIGHTSTATE, GetTask(QA_RIGHTSTATE) + 1); -- Á¬Ğø»Ø´ğÕıÈ·µÄ´ÎÊı¼Ó 1
		FinishQuestion();
	else
		SetTask(QA_FINISHNUM, GetTask(QA_FINISHNUM) + 1); -- Á¬Ğø»Ø´ğµÄ´ÎÊı¼Ó 1
		SetTask(QA_RIGHTSTATE, GetTask(QA_RIGHTSTATE) + 1); -- Á¬Ğø»Ø´ğÕıÈ·µÄ´ÎÊı¼Ó 1
		AnswerNext(1);
	end;
	
end;

-- µ±Ò»¸öÎÊÌâ»Ø´ğµÃ´íÎóÊ±
function AnswerError()

	if GetTask(QA_FINISHNUM)+ 1 >= 10 then
		FinishQuestion();
	else
		SetTask(QA_FINISHNUM, GetTask(QA_FINISHNUM) + 1); -- Á¬Ğø»Ø´ğµÄ´ÎÊı¼Ó 1
		AnswerNext(2);
	end;
	
end;


-- Ñ¡Ôñ½øĞĞÏÂÒ»²½µÄ¹ı³Ì£¬²¢ÇÒ¸æËßÍæ¼Ò»Ø´ğÕıÈ·»òÕß´íÎó
function AnswerNext(nCheck)
	
	if nCheck==1 then
		Talk(1, "CreateQuestion", QA_TitleText.."Hay l¾m! Ng­¬i ®· tr¶ lêi ®óng! H·y tr¶ lêi c©u hái tiÕp theo!");
	elseif nCheck==2 then
		Talk(1, "CreateQuestion", QA_TitleText.."Ha ha!…Sai råi! H·y cè g¾ng häc hái thªm! Nh­ng kh«ng sao! H·y nghe c©u hái tiÕp theo!");
	end;
end;


-- È«²¿ÕıÈ·»Ø´ğÍê 10 ¸öÎÊÌâÊ±µÄ´¦Àíº¯Êı
function FinishQuestion()

local nPay, nTimes = GiveAward(); -- ÅÉ·¢½±Àø
	
	if nPay ~= 0 then
		Say(QA_TitleText.."Ng­¬i ®· ®¸p ®óng "..nTimes.."  c©u hái cña ta, ®©y lµ phÇn th­ëng  "..nPay.." tiÒn ®ång cña ng­¬i. Hy väng sau nµy ng­¬i cã thÓ hiÓu biÕt thªm vÒ thÕ giíi xung quanh!",0);
	else
		Say(QA_TitleText.."Ng­¬i ch­a ®¸p ®óng c©u hái nµo cña ta! H·y cè g¾ng trau dåi kiÕn thøc!",0);
	end;
	
	SetTask(QA_FINISHNUM, 0); -- ½«Á¬Ğø»Ø´ğµÄ´ÎÊıÇå¿Õ
	SetTask(QA_RIGHTSTATE, 0); -- ½«ÕıÈ·»Ø´ğÎÊÌâµÄ´ÎÊıÇå¿Õ
	SetTask(QA_STATE, 0); -- ÈÎÎñ×´Ì¬Îª»¹Ã»¿ªÊ¼»Ø´ğÈÎÎñ
end;

-- ¸øÍæ¼Ò·¢Óè½±Àø
function GiveAward()

local nTimes = GetTask(QA_RIGHTSTATE);
local nPay = 0;

	PayStamina(QA_PAYSTAMINA); -- ¿Û³ıÍæ¼ÒµÄÌåÁ¦Öµ

	if nTimes>=10 then -- Èç¹û 10 ¸öÈ«²¿»Ø´ğÕıÈ·µÄ»°Ôò·¢È«¶î½±Àø
		nPay = 130;
		Earn(nPay);
		return nPay, nTimes;
	else
		nPay = nTimes * 10; -- Ã¿»Ø´ğÕıÈ·Ò»¸öÎÊÌâ¸ø 10 ¿éÇ®
		Earn(nPay);
		return nPay, nTimes;
	end;
	
end;

-- ¼ì²âÍæ¼ÒÌåÁ¦ÖµÊÇ·ñ×ã¹»
function CheckStamina()

	
end;

-- Ê²Ã´Ò²²»´¦ÀíµÄÍË³öº¯Êı
function MainExit()

end;

--ÁìÈ¡Î÷ÄÏÇø40¼¶ÈÎÎñ1
function task_100_00()

local strTalk = {
	"Ng­¬i muèn biÕt g× vÒ §¹i Lı?",
	"V·n bèi muèn hái {Lôc ®¹i gia téc}.",
	"§óng lµ §¹i Lı cã 6 téc lín ®­îc gäi {Lôc ®¹i gia téc} gåm TrŞnh gia, D­¬ng gia, TriÖu gia, §æng gia, Cao gia vµ §oµn gia.",
	"{§oµn gia}!?",
	"§óng! §oµn gia lµ hoµng téc cña §¹i Lı. H¬n n÷a kh«ng nhê c¸c gia téc kh¸c §oµn gia kh«ng thÓ trô v÷ng ®­îc.",
	"Cho hái {Lôc ®¹i gia téc} h×nh thµnh nh­ thÕ nµo? Cã quan hÖ ra sao?"
	}
	TalkEx("task_100_10",strTalk);
	return
end

--ÁìÈ¡Î÷ÄÏÇø40¼¶ÈÎÎñ2
function task_100_10()

local strTalk = {	
	"§¹i Lı ban ®Çu cã tªn Nam ChiÕu Quèc lµ thuéc ®Şa nhµ §­êng. Cuèi nhµ §­êng Nam ChiÕu Quèc suy yÕu. Gian thÇn TrŞnh M·i T­ nh©n c¬ héi ®o¹t ng«i vua thµnh lËp §¹i Tr­êng Hßa Quèc, vÒ sau bŞ c¸c quı téc nh­ TriÖu ThiÖn Ch¸nh, D­¬ng Can Trinh vµ §oµn T­ B×nh thay phiªn ®¶o chİnh, trong thêi gian ng¾n thay ®æi nhiÒu quèc hiÖu. Cuèi cïng §oµn T­ B×nh thµnh lËp n­íc §¹i Lı, æn ®Şnh c¸c thÕ lùc kh¸c h×nh thµnh 4 väng téc lín gåm: TrŞnh, TriÖu, D­¬ng, §oµn.",
	"Cßn {Cao gia} vµ {§æng gia} th× sao?",
	}
	TalkEx("task_100_11",strTalk);
	return
end

function task_100_11()

local strTalk = {
	"{Cao gia} vµ {§æng gia} ®Òu lµ gia téc míi kÓ tõ khi §¹i Lı thµnh lËp. HiÖn thÕ lùc cña §æng gia m¹nh h¬n, quèc s­ ®­¬ng triÒu lµ §æng Giµ La thuéc gia téc hä §æng. Hai thÕ lùc lu«n ngÊm ngÇm tranh giµnh lÉn nhau.",
	"Th× ra lµ vËy!",
	"Nãi Lôc ®¹i gia téc nh­ng thùc tÕ §¹i Lı chØ cßn 5 gia téc th«i!"
	}
	TalkEx("task_100_20",strTalk);
	return
end

--ÁìÈ¡Î÷ÄÏÇø40¼¶ÈÎÎñ3
function task_100_20()

local strTalk = {	
	"Sao l¹ vËy?",
	"Tr­íc khi §¹i Lı thµnh lËp, c¸c thÕ lùc lu«n tranh giµnh chĞm giÕt lÉn nhau, trong ®ã gia téc TrŞnh thŞ bŞ diÖt vong tr­íc. V× vËy, trªn thùc tÕ TrŞnh gia kh«ng cßn tån t¹i.",
	"HiÖn {Xi Háa gi¸o} ®ang g©y rèi ë {§¹i Lı}, nghe nãi liªn quan ®Õn viÖc hoµng ®Õ míi lªn ng«i. Kh«ng biÕt tiÒn bèi cã nghe tin ch­a?",
	"§¸m ng­êi Xi Háa gi¸o cã nghe qua nh­ng hiÖn §¹i Lı thay ®æi v­¬ng triÒu nªn ta còng kh«ng râ. Ng­¬i thö ®Õn BiÖn Kinh hái TriÖu Diªn Niªn xem!",
	"§a t¹ tiÒn bèi!",
}
	TalkEx("",strTalk);
	CreateTrigger(4,200,Talk_DL_ZHAOYANNIAN);--ÕÔÑÓÄêÎ÷ÄÏÇøÈÎÎñ¶Ô»°´¥·¢Æ÷
	Msg2Player("§Õn BiÖn Kinh hái TriÖu Diªn Niªn vÒ viÖc hoµng ®Õ míi lªn ng«i");
	TaskTip("§Õn BiÖn Kinh hái TriÖu Diªn Niªn vÒ viÖc hoµng ®Õ míi lªn ng«i");
	SetTask(TASK_DL_LV35_ID,4);--É¾³ıÎäÁêÉ½Ãæ°åĞÅÏ¢
	SetTask(TASK_DL_LV40_ID,1);
	GivePlayerAward("Level_40","xn_step_1");
	GivePlayerExp(SkeyDali,"baixiaosheng")
	return
end

--Î÷ÄÏÇø40¼¶ÈÎÎñ,Î´ÓëÕÔÑÓÄê¶Ô»°
function task_100_01()

local strTalk = {
	"TriÖu Diªn Niªn n¾m râ t×nh h×nh hoµng téc c¸c n­íc, ng­¬i ®i hái h¾n thö xem, h¾n ë BiÖn Kinh.",
	"§a t¹ tiÒn bèi!",
	}
	
	TalkEx("",strTalk);
	
	if GetTrigger(Talk_DL_ZHAOYANNIAN) == 0 then
		CreateTrigger(4,200,Talk_DL_ZHAOYANNIAN);--ÕÔÑÓÄêÎ÷ÄÏÇøÈÎÎñ¶Ô»°´¥·¢Æ÷
		Msg2Player("§Õn BiÖn Kinh hái TriÖu Diªn Niªn vÒ viÖc hoµng ®Õ míi lªn ng«i");
		TaskTip("§Õn BiÖn Kinh hái TriÖu Diªn Niªn vÒ viÖc hoµng ®Õ míi lªn ng«i");
	end;
	return
end