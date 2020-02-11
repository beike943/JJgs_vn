
---------------------------------------------------------
--	½ğÉ½ÕÆÃÅÈË
--	°ï»áµÄÈÎÎñ½Ó¿ÚÈË - Jeep tag
---------------------------------------------------------

Include("\\script\\online\\viet_event\\200911\\event_head.lua");
Include("\\script\\online\\viet_event\\200909\\9\\head.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function main()
--	if (SCCheckCanGetOfflineExp() > 0) then
--		Say("<color=green>½ğÉ½ÕÆÃÅÈË<color>£º¸÷Î»ÏÀÊ¿³ÉÌìÇÚÑ§¿àÁ·£¬±¾×ù×ÔÊÇĞÀÉÍ¡£²»¹ı·²ÊÂ±ØÓĞ³ß¶È£¬¹ıÓÌ²»¼°¡£ÀÏ·ò½üÈÕÕıÔÚÑĞÖÆÒ»ÀıÍÑÀëÈâÌåµÄÉñÓÎĞŞÉíÖ®µÀ£¬¿É½«Ã¿ÈÕÁìÎòµÄ¹¦Á¦´«¸ø¸÷Î»¡£ÕâµÀÎäÑ§¿ÉÔÚĞİÏ¢Ê±ÈÕÒ²ÄÜÔö³¤ÎäÑ§¡£Ò»´Î´«ËÍµÄ¹¦Á¦½ö¿É³ÖĞø<color=yellow>8¸ö<color>Ê±³½¡£³ı´ËÖ®Íâ£¬»¹ÑĞÖÆ³öÒ»ÖÖÖÜÆÚ´«¹¦µÄ¹¦Á¦£¬´ËĞÂ¹¦Á¦¿ÉÔÚ½ü<color=yellow>7ÈÕ<color>ÄÚ»ñµÃ¹²<color=yellow>56¸ö<color>Ê±³½µÄ³ÖĞø¹¦Á¦£¬ÖÚÏÀÊ¿¿ÉÃâÈ¥±¼²¨Ö®¿à¡£¼Ç×¡£¬ÖÜÆÚ´«¹¦ÆÚ¼ä²»¿ÉÔÙ½ÓÊÕÆÕÍ¨´«¹¦£¬ÖÚÏÀÊ¿¿ÉÔÚÃ¿ÈÕÈÎºÎÊ±¿ÌÀ´ÕÒÎÒ¡£",
--			3,
--			"½ÓÊÜ1ÈÕ´«¹¦£¬¿É»ñµÃÃ¿ÌìÀëÏß¾­Ñé8¸öÊ±³½(·îÉÏ5J¹©ÕÆÃÅ¼ÌĞøÑĞÖÆËùĞè)/iiiiiiwantwant",
--			"½ÓÊÕ7ÈÕ´«¹¦£¬¿É»ñµÃ7ÌìÀëÏß¾­Ñé56¸öÊ±³½(·îÉÏ50J¹©ÕÆÃÅ¼ÌĞøÑĞÖÆËùĞè)/i77777777want",
--			"ÎÒÁíÕÒÕÆÃÅÓĞÊÂ/main_1")
--	else

	local tbDialog = {
		"Ta muèn gi¶i quyÕt viÖc liªn quan ®Õn bang héi/main_1",
		"Rêi khái/noooooo_say"
		};
	if tonumber(date("%Y%m%d")) >= 20090928 and tonumber(date("%Y%m%d")) <= 20091025 then
		tinsert(tbDialog ,1,"Nh©n dŞp TÕt Trung Thu, S­ phô ta cã  mét chót quµ muèn göi ®Õn Minh Chñ, mong Minh Chñ h·y nhËn lÊy!/give_letter")
	end	
	
	if GetTaskTrans() >= 8 then
		tinsert(tbDialog ,1,"T×m hiÓu c¸c h­íng tu luyÖn/view_info")	
		tinsert(tbDialog ,1,"NhiÖm vô ChuyÓn Sinh - C¶i L·o Hoµn §ång/translife_task_2")
	end
	
	Say("<color=green>Minh Chñ Kim S¬n<color>: Ng­¬i ®Õn t×m l·o phu cã viÖc g×?",
		getn(tbDialog),
		tbDialog
		)
--	end
end

function translife_task_2()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(2148) ~= nDate then		
		gf_SetTaskByte(2161,2,0)
		gf_SetTaskByte(2161,3,0)
		SetTask(2148,nDate)
	end	
	if gf_GetTaskByte(2161,2) >= 2 then
		if GetTask(1537) == 9 then
			SetTask(1537,10)			
		end
	end	
	if GetTaskTrans() == 8 then
		trans_talk_09()	
	elseif GetTaskTrans() == 10 then
		trans_talk_10()
	elseif GetTaskTrans() == 11 then
		trans_talk_11()
	elseif GetTaskTrans() == 12 then	
		trans_talk_12()
	elseif GetTaskTrans() == 13 then	 	
		trans_talk_13()
	else
		Talk(1,"",szNpcName.."Hçn Nguyªn C«ng tung hoµnh thiªn h¹, mÊy ai lÜnh héi ®­îc?")
		return
	end
end


function i77777777want()
	if GetTask(OFFLINE_EXP_TIME) > 0 then
		Say("LÇn tr­íc c«ng lùc cña l·o phu truyÒn cho c¸c ng­¬i vÉn ch­a sö dông hÕt, lÇn nµy cã muèn ®æi kh«ng?",
			2,
			"§óng/yes7777777",
			"§Ó ta suy nghÜ!/noooooo_say")
	else
		yes7777777()
	end
end

function yes7777777()
	local nMoney = GetCash()
	if nMoney < 500000 then
		Talk(1, "", "VŞ b»ng h÷u ®©y còng thµnh kİnh qu¸ nhØ")
	else
		Pay(500000)
		Talk(1, "", "C«ng lùc lÇn nµy duy tr× ®­îc <color=yellow>112 giê<color>")
		SCCheckOfflineExp(1, 1)
		Msg2Player("B¹n nhËn ®­îc 112 giê rêi m¹ng t¨ng ®iÓm kinh nghiÖm.")
	end
end

function iiiiiiwantwant()
	if GetTask(OFFLINE_EXP_TIME) > 0 then
		Say("LÇn tr­íc c«ng lùc cña l·o phu truyÒn cho c¸c ng­¬i vÉn ch­a sö dông hÕt, lÇn nµy cã muèn ®æi kh«ng?",
			2,
			"§óng/yes1111111",
			"§Ó ta suy nghÜ!/noooooo_say")
	else
		yes1111111()
	end
end

function yes1111111()
	local nMoney = GetCash()
	if (nMoney < 50000) then
		Talk(1, "", "VŞ b»ng h÷u ®©y còng thµnh kİnh qu¸ nhØ")
	else
		Pay(50000)
		Talk(1, "", "C«ng lùc lÇn nµy duy tr× ®­îc <color=yellow>16 giê<color>")
		SCCheckOfflineExp(1, 0)
		Msg2Player("B¹n nhËn ®­îc 16 giê rêi m¹ng t¨ng ®iÓm kinh nghiÖm")
	end
end

function main_1()
	local bWantCreateTong = GetTask(297)
	local bWantDestoryTong = GetTask(295)

	-- <bWantDestoryTong == 1>±íÊ¾Íæ¼ÒÒÑ¾­µ½°ï»á½éÉÜÈË´¦ÉêÇë½âÉ¢°ï»á£¬À´ÕâÀïÉêÇë
	-- <bWantDestoryTong == 2>±íÊ¾Íæ¼ÒÒÑ¾­ÔÚÕâÀïÉêÇë¹ı½âÉ¢°ï»á£¬ÓÖÀ´É§ÈÅ½ğÉ½ÕÆÃÅÈËÁË
	-- <bWantDestoryTong == 3>±íÊ¾½ğÉ½ÕÆÃÅÈËÒÑ¾­´ğÓ¦ÁË½âÉ¢°ï»áµÄÉêÇë
	
	-- <bWantCreateTong == 1>±íÊ¾Íæ¼ÒÒÑ¾­µ½°ï»á½éÉÜÈË´¦ÉêÇë½¨Á¢°ï»á£¬À´ÕâÀïÉêÇë
	-- <bWantCreateTong == 2>±íÊ¾Íæ¼ÒÒÑ¾­»ñµÃÁË½ğÉ½ÕÆÃÅÈËµÄÈÏ¿É£¬µÃµ½ÁË(»áÃËÁîÅÆ)
	
-- ½âÉ¢°ï»áµÄ²¿·Ö·Ö¸îÏß -- ¿ªÊ¼ ------------------------------------------------------------------------------	
	if (bWantDestoryTong == 1) then		-- ÏëÒª½âÉ¢°ï»á
		Say("Ta ®· nghe thuéc h¹ b¸o l¹i, ng­¬i muèn gi¶i t¸n bang héi vÒ Èn s¬n l©m, ®óng kh«ng?",
		    2,
		    "V·n bèi ®· quyÕt, xin ch­ëng m«n ®ång ı!/first_apply_destroy_tong",
		    "V·n bèi ®· nghÜ l¹i, kh«ng muèn gi¶i t¸n n÷a./cancel_destroy_tong")
		return
	end
	
	if (bWantDestoryTong == 2) then		-- ÒÑ¾­ÉêÇëÁË£¬ÏëÒªÕıÊ½½âÉ¢°ï»á»òÕßÊÇÈ¡Ïû½âÉ¢°ï»á
		Say("L¹i ®Õn n÷a µ, ph¶i ch¨ng ng­¬i muèn gi¶i t¸n bang héi?",
		    2,
		    "V·n bèi ®· nghÜ kü l¹i kh«ng muèn rêi xa c¸c huynh ®Ö trong bang nªn kh«ng muèn gi¶i t¸n n÷a./cancel_destroy_tong",
		    "§óng vËy, v·n bèi ®· thu xÕp æn tháa víi c¸c huynh ®Ö trong bang, ı chİ ®· quyÕt mong ch­ëng m«n chÊp nhËn cho./second_apply_destroy_tong")
		return
	end
	
	if (bWantDestoryTong == 3) then		-- ÒÑ¾­±»´ğÓ¦ÁË
		Say("BiÖn Kinh, Thµnh §«, TuyÒn Ch©u ®Òu cã Sø gi¶ bang héi, ng­¬i ®Õn ®ã xin ®­îc gi¶i t¸n bang héi, nhí thu xÕp víi c¸c huynh ®Ö trong bang nhĞ!", 0)
		return
	end
-- ½âÉ¢°ï»áµÄ²¿·Ö·Ö¸îÏß -- ½áÊø ------------------------------------------------------------------------------

-- ½¨Á¢°ï»áµÄ²¿·Ö·Ö¸îÏß -- ¿ªÊ¼ ------------------------------------------------------------------------------
	if (bWantCreateTong == 1) then		-- °ï»á½éÉÜÈË½éÉÜÀ´µÄ£¬¸øËû¼ì²éÇé¿ö£¡
		Say("Ta ®· nghe thuéc h¹ b¸o l¹i, ng­¬i muèn s¸ng lËp bang ph¸i, triÖu tËp anh hïng thiªn h¹ ®óng kh«ng?",
		    1,
		    "§óng vËy, v·n bèi muèn tËp hîp anh hïng trong thiªn h¹, xin ch­ëng m«n ®ång ı/check_apply_create_tong_cond")
		return
	end
	
	if (bWantCreateTong == 2) then
		Talk(1,"","BiÖn Kinh, Thµnh §«, TuyÒn Ch©u ®Òu cã Sø gi¶ bang héi, ng­¬i cã thÓ ®Õn ®ã xin ®­îc gi¶i t¸n bang héi, ta ®· ph¸i ng­êi th«ng b¸o cho hä råi. Ng­¬i cÇm <color=yellow>Minh Héi lÖnh bµi<color> vÒ ®i!")
		return
	end
-- ½¨Á¢°ï»áµÄ²¿·Ö·Ö¸îÏß -- ½áÊø ------------------------------------------------------------------------------
	
-- ÁìÈ¡ÏÉ²İÂ¶µÄ¹¦ÄÜ¶Ô»° -- ¿ªÊ¼ ------------------------------------------------------------------------------
	local bIsTongMember = IsTongMember()		-- ÅĞ¶ÏÕâ¸öÍæ¼ÒÊÇ²»ÊÇ°ï»á³ÉÔ±
	local bChangedPopulation = 0			-- ÅĞ¶Ï°ï»áÈËÆøÊÇ·ñÓĞ¸Ä±ä¹ı
	local bTongLadder = 0				-- Õâ¸öÍæ¼ÒµÄ°ï»áµ±Ç°ÈËÆøÅÅÃû
	local nLastTongPopulation = GetTask(298)	-- Õâ¸öÍæ¼ÒÉÏ´ÎµÄÈËÆøÊıÖµ£¬ºÍµ±Ç°ÏàÍ¬µÄ»°¾ÍÊÇ²»ÓÃÔÙÁìÈ¡ÁË
	local nLastGetPrizeDate = GetTask(299)		-- Õâ¸öÍæ¼ÒÉÏ´ÎÁìÈ¡ÏÉ²İµÄÈÕÆÚ£¨Ã¿ÌìÖ»ÄÜÁìÒ»´Î£©
	local nCurTongPopulation = nLastTongPopulation	-- Õâ¸öÍæ¼Òµ±Ç°µÄÈËÆøÊıÖµ
	
	local nCurPrizeDate = {date("%y"), date("%m"), date("%d")}
	local nCurPrizeDateNum = tonumber(nCurPrizeDate[1]..nCurPrizeDate[2]..nCurPrizeDate[3])	-- µ±Ç°Ê±¼ä(ÄêÔÂÈÕ)
	local nExpireDataNum = tonumber("5".."11".."11")	-- ¹ıÆÚµÄÊ±¼ä
	
	-- Èç¹ûÊÇ°ï»á³ÉÔ±µÄ»°£¬¾Í¸Ä±änCurTongPopulationºÍbTongLadderÁ½¸öÊıÖµ
	-- ¶øÇÒÊÇÔÚ2005Äê11ÔÂ11ÈÕÒÔÇ°
	if ((bIsTongMember == 1) and (nCurPrizeDateNum < nExpireDataNum)) then
		bTongLadder = GetTongPopuLadder()
		nCurTongPopulation = GetTongPopulation()
	end
	
	-- Èç¹ûÈËÆøÊıÖµ²»ÏàµÈ£¬¾ÍÊÇÓĞ¸üĞÂ¹ıÁË
	if ((nCurTongPopulation ~= nLastTongPopulation) and (nCurPrizeDateNum ~= nLastGetPrizeDate)) then
		bChangedPopulation = 1
	end
	
	if ((bTongLadder == 1) and (bChangedPopulation == 1)) then	-- Èç¹ûÊÇµÚÒ»Ãû£¬¶øÇÒ½ñÌìÃ»ÓĞÁì£¬Áì3¸öÏÉ²İ
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,3)
		Talk(1,"","Nh©n khİ bang héi cña ng­¬i hiÖn nay ®Ö nhÊt giang hå, nhËn ®­îc phÇn th­ëng <color=yellow>3 Tiªn Th¶o Lé<color>.")
		return
	end
	
	if ((bTongLadder == 2) and (bChangedPopulation == 1)) then	-- Èç¹ûÊÇµÚ¶şÃû£¬¶øÇÒ½ñÌìÃ»ÓĞÁì£¬Áì2¸öÏÉ²İ
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,2)
		Talk(1,"","Nh©n khİ bang héi cña ng­¬i hiÖn nay xÕp thø 2, nhËn ®­îc phÇn th­ëng <color=yellow>2 Tiªn Th¶o Lé<color>.")
		return
	end
	
	if ((bTongLadder == 3) and (bChangedPopulation == 1)) then	-- Èç¹ûÊÇµÚÈıÃû£¬¶øÇÒ½ñÌìÃ»ÓĞÁì£¬Áì1¸öÏÉ²İ
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,1)
		Talk(1,"","Nh©n khİ bang héi cña ng­¬i hiÖn nay xÕp thø 3, nhËn ®­îc phÇn th­ëng <color=yellow>1 Tiªn Th¶o Lé<color>.")
		return
	end

-- ÁìÈ¡ÏÉ²İÂ¶µÄ¹¦ÄÜ¶Ô»° -- ½áÊø ------------------------------------------------------------------------------
	-- Ã»ÓĞÏëÒª½¨Á¢°ï»á£¬ÏĞÁÄ
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0) then
		Talk(1,"","L·o phu tung hoµnh giang hå ®· nhiÒu n¨m nhËn ®­îc sùc tin yªu cña ®ång ®¹o, nay ®¶m nhËn chøc minh chñ cña Vâ L©m, kh«ng biÕt trong giang hå cßn ai cã thÓ xøng ®­îc víi danh hiÖu <color=yellow>§¹i hiÖp<color> nµy kh«ng?")
	else
		Talk(1,"","Ng­¬i ®· lµ chñ cña mét bang héi, cã thÓ kªu gäi c¸c huynh ®Ö trong bang, h·y cè lªn nhĞ!")
	end
end;





-- µÚÒ»´ÎÏòÕÆÃÅÈËÉêÇë£¬Òª½âÉ¢°ï»á
function first_apply_destroy_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- ²»ÊÇ°ïÖ÷
		Talk(1,"","Ng­¬i kh«ng ph¶i lµ chñ cña mét bang, sao l¹i ®Õn ®©y ®ßi gi¶i t¸n bang héi?")
		SetTask(295, 0)
		SetTask(296, 0)
		return
	end
	
	local nCurDate = {date("%y"), date("%m"), date("%d")}
	local nCurDateNum = tonumber(nCurDate[1]..nCurDate[2]..nCurDate[3])	-- µ±Ç°Ê±¼ä(ÄêÔÂÈÕ)
	
	SetTask(295, 2)			-- ÉèÖÃ³ÉÒÑ¾­½ÓÊÕÁËÍæ¼ÒÔÚ½ğÉ½ÕÆÃÅÈË´¦µÄÉêÇë
	SetTask(296, nCurDateNum)	-- ÉèÖÃÉêÇëµÄÊ±¼ä
	
	-- ½«Íæ¼Ò´ò·¢×ß
	Say("Ng­¬i vÊt v¶ l¾m míi lËp ®­îc nªn mét bang héi vËy mµ chØ v× xung ®ét nhá ®· muèn gi¶i t¸n, nh­ vËy cã ®¸ng kh«ng? VÇy nhĞ, ta cho ng­¬i 3 ngµy ®Ó suy nghÜ sau ®ã quay l¹i gÆp ta, thÕ nµo?",
	    1,
	    "Còng §­îc! §Ó v·n bèi suy nghÜ l¹i./delay_for_three_days")
end;

-- ¸úÕÆÃÅÈËÔÙ¼û£¬ÈıÌìÒÔºóÔÙÀ´ÕÒ
function delay_for_three_days()
	Talk(1,"","VËy nhĞ, 3 ngµy sau quay l¹i t×m ta. Nh­ng h·y nhí hµnh tÈu giang hå ph¶i biÕt coi träng ch÷ nghÜa, ®õng ®Ó c¸c huynh ®Ö trong bang thÊt väng.")
end;

-- µÚ¶ş´ÎÏòÕÆÃÅÈËÕıÊ½ÉêÇë£¬Òª½âÉ¢°ï»á
function second_apply_destroy_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- ²»ÊÇ°ïÖ÷
		Talk(1,"","Ng­¬i kh«ng ph¶i lµ chñ cña mét bang, sao l¹i ®Õn ®©y ®ßi gi¶i t¸n bang héi?")
		SetTask(295, 0)
		SetTask(296, 0)
		return
	end
	
	local nCurDate = {date("%y"), date("%m"), date("%d")}
	local nCurDateNum = tonumber(nCurDate[1]..nCurDate[2]..nCurDate[3])	-- µ±Ç°Ê±¼ä(ÄêÔÂÈÕ)
	local nApplyDateNum = GetTask(296)					-- ÉêÇë½âÉ¢µÄÊ±¼ä
	local nExpiredDate = nCurDateNum - nApplyDateNum			-- ÒÑ¾­¾­¹ıÁËµÄÊ±¼ä
	
	if (nExpiredDate < 3) then		-- ²»¹»ÈıÈÕµÄÆÚÏŞ
		Talk(1,"","Ng­¬i nãng n·y qu¸, ch¼ng ph¶i lµ hÑn víi ng­¬i 3 ngµy sau míi quay l¹i ®ã sao!")
	else
		SetTask(295, 3)			-- ÒÑ¾­´ğÓ¦ÁË½âÉ¢°ï»áµÄÉêÇë
		Say("NÕu lßng ng­¬i ®· quyÕt th× ta còng kh«ng c¶n. Ta sÏ th«ng b¸o cho thuéc h¹ xãa bá bang héi cña ng­¬i. T¹i BiÖn Kinh, Thµnh §«, TuyÒn Ch©u ®Òu cã Sø gi¶ bang héi, ng­¬i ®Õn ®ã ®Ó xin lµm thñ tôc gi¶i t¸n.", 0)
	end
end;

-- ·­»ÚÁË²»Ïë½âÉ¢°ï»áÁË
function cancel_destroy_tong()
	SetTask(295, 0)
	SetTask(296, 0)
	Talk(1,"","Tèt qu¸, ng­¬i ®· kŞp thêi nghÜ l¹i. H·y tiÕp tôc thèng lÜnh bang héi kiÕn c«ng lËp nghiÖp nhĞ!")
end;

-- ¶ÔÒ»¸öÏëÒª½¨Á¢°ï»áµÄÈË½øĞĞÌõ¼ş¼ì²é
function check_apply_create_tong_cond()
	Say("Xem ng­¬i cßn trÎ mµ t­ chÊt kh«ng tÖ. Anh hïng n÷ hiÖp h·y v× <color=yellow>b¸ t¸nh<color> cóc cung tËn tôy nh­ vËy míi xøng danh <color=yello>§¹i hiÖp<color>!", 
	    1,
	    "§a t¹ tiÒn bèi gi¸o huÊn, t¹i h¹ cã thÓ vÒ lËp bang héi cho m×nh ch­a??/get_tong_card")
end;

function get_tong_card()
	local nCurReputation = GetReputation()		-- µ±Ç°ÉùÍû
	local bHaveTongCard = GetItemCount(2,0,125)	-- ÊÇ·ñÓĞ»áÃËÁîÅÆ
	
	if ((nCurReputation >= 1000) and (bHaveTongCard >= 1) and (GetItemCount(2,0,555) >=1)) then
		SetTask(297, 2)				-- ¼ÇÂ¼ÈÎÎñ±äÁ¿
		Talk(1,"","Xem ng­¬i cßn trÎ nh­ng t­ chÊt kh«ng tÖ, vâ nghÖ cao c­êng xøng danh §¹i hiÖp. Ng­¬i h·y cÇm <color=yellow>Minh Héi lÖnh bµi vµ Cµn Kh«n Phï<color> vÒ kiÕn lËp bang héi, kªu gäi anh hïng n÷ hiÖp t¹o phóc cho b¸ t¸nh.")
	else
		Talk(1,"","Ng­¬i vâ c«ng tuy xuÊt chóng nh­ng vÉn ch­a ®ñ ®iÒu kiÖn kiÕn lËp bang ph¸i. Tr­íc tiªn h·y tİch lòy <color=yellow>1000 ®iÓm danh väng<color> vµ <color=yellow>Minh Héi lÖnh bµi vµ Cµn Kh«n Phï<color>.<color=yellow>Minh Héi lÖnh bµi <color> cã thÓ dïng ®iÓm chiÕn c«ng ®Õn Nh¹n M«n quan gÆp Qu©n Nhu Quan ®Ó ®æi. <color=yellow>Cµn Kh«n Phï<color> cã thÓ mua t¹i Ngù C¸c.")
	end
end;

function noooooo_say()

end
