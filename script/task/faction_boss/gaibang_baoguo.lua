-- =============================================================
-- FileName : gaibang_baoguo.lua
-- Desc     : Ø¤°ïbossµôÂäµÄ°ü¹üµÄ½Å±¾£¬ÃÅÅÉbossÈÎÎñÖĞµôÂäµÄ°ü¹ü£¬µã»÷Ê¹ÓÃ¿ÉÒÔ»ñµÃºÃ¶àgood¶«Î÷µÄ¹¦ÄÜ
-- Date     : Dec 26 2006
-- Creator  : Tony(Jizheng)
-- ID       : 2, 1, 962
-- =============================================================

-- Ø¤°ï±¦ÏäµÄ½Å±¾£¬·¢½±Í¨ÓÃ
Include("\\script\\task\\faction_boss\\boss_baoxiang_gaibang.lua");

-- Ä¬ÈÏÊ¹ÓÃµÄº¯Êı
function OnUse()
	-- Ã»ÓĞÈëÁ÷ÅÉ¾Í²»ÄÜ¿ªÏä×Ó
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B¹n vÉn ch­a b¸i s­ häc vâ, tói quµ nµy kh«ng thÓ më!", 0)
		return
	end

	Say("B¹n x¸c nhËn më tói quµ nµy chø?",
		2,
		"§ång ı/confirm_get",
		"Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°
function cancel_dialog()
end;

-- È·ÈÏ´ò¿ª°ü¹ü
function confirm_get()
	local nSel = random(1, 100)					-- ±¦Ïä³ö¶«Î÷µÄ¸ÅÂÊ
	
	if (DelItem(2, 1, 962, 1) == 1) then		-- °Ñ×Ô¼ºÉ¾³ı
		local nRand = random(1,1000);
		if nRand <= 300 then
		local nRandIdx = random(1,getn(tGaojiMiji[10]));
			AddItem(tGaojiMiji[10][nRandIdx][2],tGaojiMiji[10][nRandIdx][3],tGaojiMiji[10][nRandIdx][4],1);
			Msg2Player("§¹i hiÖp më Tói tïy th©n, nhËn ®­îc "..tGaojiMiji[10][nRandIdx][1]);
		else
	
			if (nSel <= 37) then			-- 37%µÄ¸ÅÂÊ£¬µÃµ½Î´¿ª·âµÄ76¼¶ÎäÆ÷
				get_76_weapon()
				ModifyExp(3000000)
				Msg2Player("B¹n më ®­îc tói quµ, nhËn ®­îc mét vò khİ cÊp 76 vµ 3000000 ®iÓm kinh nghiÖm!")
			elseif (nSel <= 52) then		-- 15%   µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅ¾í±¾ÉÏ
				get_faction_misbook(0)
			elseif (nSel <= 61) then		-- 9%    µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅ¾í±¾ÖĞ
				get_faction_misbook(1)
			elseif (nSel <= 64) then		-- 3%    µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅ¾í±¾ÏÂ
				get_faction_misbook(2)
			elseif (nSel <= 88) then		-- 24%   µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅÌ××°¶ş¿ã×Ó
				get_suit_2_shoe()
				ModifyExp(3000000)
				Msg2Player("B¹n më ®­îc tói quµ, nhËn ®­îc trang phôc cña s­ m«n vµ 3000000 ®iÓm kinh nghiÖm.")
			elseif (nSel <= 91) then		-- 3%    µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅÌ××°ÈıÍ·
				get_suit_3_head()
				Msg2Player("B¹n më ®­îc tói quµ, nhËn ®­îc trang phôc cña s­ m«n")
			elseif (nSel <= 97) then		-- 6%    µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅÌ××°ÈıÊ×ÊÎ
				get_suit_3_deco()
				Msg2Player("B¹n më ®­îc tói quµ, nhËn ®­îc bé trang søc cña s­ m«n!")
			elseif (nSel <= 100) then		-- 3%    µÄ¸ÅÂÊ£¬µÃµ½´ó½³Ê¦ÊÖÊé
				AddItem(2, 0, 397, 1)
				Msg2Player("B¹n më ®­îc tói quµ, nhËn ®­îc quyÓn mËt tŞch!")
			end
		end
	end
end;
