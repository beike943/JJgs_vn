--08´º½Ú°İÄêÌù½Å±¾
--by vivi
--2008/01/14

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function OnUse()
	local nDate = floor((GetTime()+28800)/86400);
	local nTime = tonumber(date("%Y%m%d"));
	if nTime > 20080218 then
		nDate = floor((MkTime(2008,2,18)+28800)/86400);
	end	
	local nStartDate = floor((MkTime(2008,1,28)+28800)/86400);
	local nDay = nDate-nStartDate;
	local nNum = nDay - GetTask(TASK_WIND_NUM);
	if nNum <= 0 then
		Talk(1,"","<color=green>ThiÖp chóc tÕt<color>: Dïng thiÖp chóc tÕt ®Ó nhËn phÇn th­ëng nhiÖm vô chóc tÕt. B¹n ®· nhËn phÇn th­ëng chóc tÕt hiÖn t¹i");
		return
	else	
		Say("<color=green>ThiÖp chóc tÕt<color>: Dïng thiÖp chóc tÕt ®Ó nhËn phÇn th­ëng nhiÖm vô chóc tÕt. Ho¹t ®éng lÇn nµy b¹n ®· nhËn <color=yellow>"..GetTask(TASK_WIND_NUM).." <color> lÇn phÇn th­ëng chóc tÕt, b¹n cßn <color=yellow>"..nNum.." <color> lÇn phÇn th­ëng chóc tÕt ch­a nhËn. B¹n muèn nhËn?",
			2,
			"Ta muèn nhËn/buling_use_jungong",
			"T¹m thêi kh«ng dïng/nothing")
	end
end

--function confirm_buling_bainian()
--	local nLv = GetLevel();
--	local nExp = floor(6000000*nLv^2/80^2);
--	local nTianshiNum = 15; --ÌìÊ±×¢½âÊıÁ¿£¬99¼¶Íæ¼Ò
--	if nLv == 99 then
--		Say("<color=green>°İÄêÌù<color>£ºÊ¹ÓÃ°İÄêÌù¿ÉÒÔ»ñµÃ<color=yellow>"..nTianshiNum.."<color>±¾ÌìÊ±×¢½âÒÔ¼°<color=yellow>600<color>¾ü¹¦£¬ÊÇ·ñÊ¹ÓÃ¾ü¹¦ÕÂÀ´Ìá¸ß»ñµÃµÄ¾ü¹¦ÄØ£¿",
--			5,
--			"ÎÒ²»ÒªÊ¹ÓÃ¾ü¹¦ÕÂ(600¾ü¹¦)/#buling_use_jungong(0)",
--			"ÎÒÒªÊ¹ÓÃÁ½¸ö¾ü¹¦ÕÂ£¨1600¾ü¹¦£©/#buling_use_jungong(1)",
--			"ÎÒÒªÊ¹ÓÃÁ½¸ö´ó¾ü¹¦ÕÂ£¨4000¾ü¹¦£©/#buling_use_jungong(2)",
--			"ÎÒÒªÊ¹ÓÃÁ½¸ö»Ô»Í¾ü¹¦ÕÂ£¨8000¾ü¹¦£©/#buling_use_jungong(3)",
--			"Ôİ²»ÁìÈ¡½±Àø/nothing");
--	else
--		Say("<color=green>°İÄêÌù<color>£ºÊ¹ÓÃ°İÄêÌù¿ÉÒÔ»ñµÃ<color=yellow>"..nExp.."<color>¾­ÑéÒÔ¼°<color=yellow>600<color>¾ü¹¦£¬ÊÇ·ñÊ¹ÓÃ¾ü¹¦ÕÂÀ´Ìá¸ß»ñµÃµÄ¾ü¹¦ÄØ£¿",
--			5,
--			"ÎÒ²»ÒªÊ¹ÓÃ¾ü¹¦ÕÂ(600¾ü¹¦)/#buling_use_jungong(0)",
--			"ÎÒÒªÊ¹ÓÃÁ½¸ö¾ü¹¦ÕÂ£¨1600¾ü¹¦£©/#buling_use_jungong(1)",
--			"ÎÒÒªÊ¹ÓÃÁ½¸ö´ó¾ü¹¦ÕÂ£¨4000¾ü¹¦£©/#buling_use_jungong(2)",
--			"ÎÒÒªÊ¹ÓÃÁ½¸ö»Ô»Í¾ü¹¦ÕÂ£¨8000¾ü¹¦£©/#buling_use_jungong(3)",
--			"Ôİ²»ÁìÈ¡½±Àø/nothing");
--	end			
--end

function buling_use_jungong()
	local nJungong = GetTask(701); --Íæ¼Òµ±Ç°¾ü¹¦£¬ÕıÎªËÎ£¬¸ºÎªÁÉ
	local nGetJungong = 600; --»ñµÃµÄ¾ü¹¦
	local nLv = GetLevel();
	local nExp = floor(6000000*nLv^2/80^2);
	local nTianshiNum = 15; --ÌìÊ±×¢½âÊıÁ¿£¬99¼¶Íæ¼Ò
	
	if nLv == 99 then
		if Zgc_pub_goods_add_chk(1,15) ~= 1 then
			return
		end
	end
	
--	if nType == 1 then
--		if GetItemCount(2,1,9999) < 2 then
--			Talk(1,"","<color=green>ĞÂÄê»î¶¯Ê¹Õß<color>£ºÄãÃ»ÓĞ×ã¹»µÄ¾ü¹¦ÕÂÅ¶¡£");
--			return
--		else
--			if DelItem(2,1,9999,2) == 1 then
--				if nJungong >= 0 then
--					nGetJungong = 800*2;
--				else
--					nGetJungong = -800*2;
--				end
--			end
--		end
--	elseif nType == 2 then
--		if GetItemCount(2,1,9998) < 2 then
--			Talk(1,"","<color=green>ĞÂÄê»î¶¯Ê¹Õß<color>£ºÄãÃ»ÓĞ×ã¹»µÄ´ó¾ü¹¦ÕÂÅ¶¡£");
--			return
--		else
--			if DelItem(2,1,9998,2) == 1 then
--				if nJungong >= 0 then
--					nGetJungong = 800*5;
--				else
--					nGetJungong = -800*5;
--				end
--			end
--		end
--	elseif nType == 3 then
--		if GetItemCount(2,1,9977) < 2 then
--			Talk(1,"","<color=green>ĞÂÄê»î¶¯Ê¹Õß<color>£ºÄãÃ»ÓĞ×ã¹»µÄ»Ô»Í¾ü¹¦ÕÂÅ¶¡£");
--			return
--		else
--			if DelItem(2,1,9977,2) == 1 then
--				if nJungong >= 0 then
--					nGetJungong = 800*10;
--				else
--					nGetJungong = -800*10;
--				end
--			end
--		end
--	end	

	if nJungong >= 0 then
		nGetJungong = 600;
	else
		nGetJungong = -600;
	end

	if DelItem(2,1,3207,1) == 1 then
		SetTask(TASK_WIND_NUM,GetTask(TASK_WIND_NUM)+1);
	
		SetTask(701,nJungong+nGetJungong);
		if nJungong >= 0 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nGetJungong.."C«ng tr¹ng");
		else
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..-nGetJungong.."C«ng tr¹ng");
		end
		
		if nLv == 99 then
			AddItem(2,1,3210,nTianshiNum);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nTianshiNum.."Thiªn Thêi Chó Gi¶i.");
		else
			ModifyExp(nExp);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
		end	
	end	
end