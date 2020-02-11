------------------------------------------------------------
-- Ê¦ÃÅÁîÆìµÄ½Å±¾ shimenlingqi.lua
--
-- comment: Ê¹ÓÃºóÊ¦ÃÅ¹±Ï×¶È»ñµÃ2±¶¼Ó³É
-- creator: Tony(Jizheng)
-- Date   : Jan 18th, 2007
--
-- Item ID:  2,1,1017
------------------------------------------------------------

LAST_USE_DATE = 85
MULTI_COUNT = 86

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("B¹n muèn dïng <color=yellow>s­ m«n lÖnh kú<color>? Nã cã thÓ gióp b¹n nhËn ®é cèng hiÕn s­ m«n gÊp <color=yellow>3 lÇn<color>.",
		2,
		"§­îc/use_shimenlingqi",
		"Kh«ng sö dông/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

function use_shimenlingqi()
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B»ng h÷u ch­a b¸i s­, kh«ng thÓ sö dông s­ m«n lÖnh kú!", 0)
		return
	end


	local nLastDate = GetTask(LAST_USE_DATE)
	local nMultiCount = GetTask(MULTI_COUNT)
	
	--		          Äê	       ÔÂ	       ÈÕ
	local nCurrTime = {date("%Y"), date("%m"), date("%d")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ÏÖÔÚµÄÈÕÆÚ
	
	if (nCurDate > nLastDate) then
		if (DelItem(2, 1, 1017, 1) == 1) then
			SetTask(LAST_USE_DATE, nCurDate)
			SetTask(MULTI_COUNT, 3)
			Say("B¹n ®· sö dông <color=yellow>s­ m«n lÖnh kú<color> nhËn ®­îc ®é cèng hiÕn s­ m«n gÊp 3 lÇn!", 0)
			Msg2Player("B¹n ®· sö dông s­ m«n lÖnh kú, nhËn ®­îc ®é cèng hiÕn s­ m«n gÊp 3 lÇn!")
		end
	elseif (nMultiCount == 2) then
		Say("B¹n muèn dïng <color=yellow>S­ m«n lÖnh th­<color> ®æi s­ m«n lÖnh kú? NÕu dïng ®é cèng hiÕn s­ m«n sÏ t¨ng tõ 2 lªn 3 lÇn!",
			2,
			"§­îc/replace_shimenlingqi",
			"Kh«ng sö dông/cancel_dialog")
	elseif (nMultiCount == 3) then
		Say("H«m nay b¹n ®· sö dông 1 <color=yellow>S­ m«n lÖnh kú<color>, ngµy mai h·y quay l¹i!", 0)
	end
end;

function replace_shimenlingqi()
	if (DelItem(2, 1, 1017, 1) == 1) then
		SetTask(MULTI_COUNT, 3)
		Say("B¹n ®· sö dông <color=yellow>s­ m«n lÖnh kú<color> nhËn ®­îc ®é cèng hiÕn s­ m«n gÊp 3 lÇn!", 0)
		Msg2Player("B¹n ®· sö dông s­ m«n lÖnh kú, nhËn ®­îc ®é cèng hiÕn s­ m«n gÊp 3 lÇn!")
	end
end;

