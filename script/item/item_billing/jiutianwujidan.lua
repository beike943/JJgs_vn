------------------------------------------------------------
-- ¾ÅÌìÎŞ¼«µ¤µÄ½Å±¾ jiutianwujidan.lua
--
-- comment: Ê¹ÓÃºóÖ±½Óµ½´ï73¼¶£¬3000ÉùÍû£¬4000Ê¦ÃÅ¹±Ï×¶È£¬5w¶¼Í³¾ü¹¦
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1006
------------------------------------------------------------

TSK_USE = 1540

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("B¹n muèn dïng <color=yellow>Cöu Thiªn V« Cùc ®¬n<color>? Nã cã thÓ gióp b¹n ®¹t ®Õn cÊp 73, danh väng 3000, ®é cèng hiÕn s­ m«n 4000 vµ qu©n c«ng chiÕn tr­êng.",
		2,
		"§­îc/use_jiutianwuji_dan",
		"Kh«ng sö dông/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

function use_jiutianwuji_dan()
	local nCurLevel = GetLevel()
	local nCurRepu = GetReputation()
	local nCurFactionRepu = GetTask(336)
	local nZhanGong = GetTask(701)
	
	if GetTask(TSK_USE) ~= 0 then
		Say("B¹n ®· sö dông sè thuèc nµy.", 0)
		return
	end
	
	if (nCurLevel >= 73 and nCurRepu >= 3000 and nCurFactionRepu >= 4000 and (nZhanGong >= 50000 or nZhanGong <= -50000)) then
		Say("B¹n ®· lµ cao thñ vâ l©m, kh«ng cÇn dïng ®Õn sè thuèc nµy.", 0)
		return
	end
	
	Say("B¹n muèn nhËp phe cña §« thèng nµo?",
		3,
		"§« thèng_Tèng/#real_do_with_camp(1)",
		"§« thèng phe Liªu/#real_do_with_camp(2)",
		"Kh«ng sö dông/cancel_dialog")
end;

function real_do_with_camp(nCamp)
	local nCurLevel = GetLevel()
	local nCurRepu = GetReputation()
	local nCurFactionRepu = GetTask(336)
	local nZhanGong = GetTask(701)
	
	if (DelItem(2, 1, 1006, 1) == 1) then
		SetTask(TSK_USE,1)
		
		if (nCurLevel < 73) then
			SetLevel(73, 454)
			ResetProperty()
		end
	
		if (nCurRepu < 3000) then
			ModifyReputation(3000 - nCurRepu, 0)
		end
	
		if (nCurFactionRepu < 4000) then
			SetTask(336, 4000)
		end
	
		if (nCamp == 1 and nZhanGong < 50000) then	--³ÉÎªËÎ·½¶¼Í³
			SetTask(701,50000)	--ÉèÖÃËÎ·½¾ü¹¦
			SetTask(704,3)	--ÉèÖÃËÎ·½µ±Ç°¾üÏÎ
			if GetTask(745) < 3 then	--Èç¹ûÖ®Ç°ËÎ·½¾üÏÎĞ¡ÓÚ¶¼Í³
				SetTask(745,3)	--ÉèÖÃËÎ·½×î¸ß¾üÏÎ
			end;
			if GetTask(702) < 50000 then
				SetTask(702,50000);	--ÉèÖÃËÎ·½×î¸ß¾ü¹¦
			end;
		elseif (nCamp == 2 and nZhanGong > -50000) then	--³ÉÎªÁÉ·½¶¼Í³
			SetTask(701,-50000)	--ÉèÖÃÁÉ·½¾ü¹¦
			SetTask(704,-3)	--ÉèÖÃÁÉ·½µ±Ç°¾üÏÎ
			if GetTask(746) > -3 then	--Èç¹ûÖ®Ç°ÁÉ·½¾üÏÎĞ¡ÓÚ¶¼Í³
				SetTask(746,-3)	--ÉèÖÃÁÉ·½×î¸ß¾üÏÎ
			end;
			if GetTask(703) < 50000 then
				SetTask(703,50000);	--ÉèÖÃÁÉ·½×î¸ß¾ü¹¦
			end;
		end;
		
		ModifyExp(20000000)
	
		Say("B¹n ®· lµ cao thñ vâ l©m, vÒ sau cã thÓ hµnh hiÖp tr­îng nghÜa!", 0)
	end
end;

