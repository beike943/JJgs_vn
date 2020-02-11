------------------------------------------------------------
-- »Ô»Í°ÔÍõÁîµÄ½Å±¾ huihuangbawangling.lua
--
-- comment: Ê¹ÓÃºóÖ±½Óµ½´ï73¼¶
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID: 2, 1, 1025
------------------------------------------------------------

SHINING_NIGHT_DATE = 83		-- Ê¦ÃÅÈÎÎñ´óÊÂ¼şµÄÈÎÎñID´æ·ÅµÄÈÎÎñ±äÁ¿
SHINING_NIGHT_COUNT = 84	-- ÉÏ´ÎÁìÈ¡Ê¦ÃÅ´óÊÂº¯µÄÈÕÆÚ

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("<color=yellow>B¸ V­¬ng LÖnh<color> sÏ quyÕt ®Şnh néi dung ®ªm huy hoµng h«m nay, b¹n muèn dïng <color=yellow>B¸ V­¬ng lÖnh<color>?",
--		7,
--		"Õ½³¡/#vote_shining_night(0)",
		6,
		"Th­¬ng héi/#vote_shining_night(1)",
		"NhiÖm vô s­ m«n - ngÉu nhiªn/#vote_shining_night(2)",
		"NhiÖm vô s­ m«n tuÇn hoµn/#vote_shining_night(3)",
		"NhiÖm vô s¸t thñ/#vote_shining_night(4)",
		"ThuyÒn rång/#vote_shining_night(5)",
		"Kh«ng sö dông/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

function vote_shining_night(nChoice)
	strTab = {"ChiÕn tr­êng", "Th­¬ng héi", "NhiÖm vô s­ m«n - ngÉu nhiªn", "NhiÖm vô s­ m«n tuÇn hoµn", "NhiÖm vô s¸t thñ", "ThuyÒn rång"}

	--		          Äê	       ÔÂ	       ÈÕ
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ÏÖÔÚµÄÈÕÆÚ
	local nCurHour = tonumber( nCurrTime[4] )
	local nLastDate = GetTask(SHINING_NIGHT_DATE)
	local nShiningCount = GetTask(SHINING_NIGHT_COUNT)
	
	if (nCurHour > 19) then
		Say("Ho¹t ®éng ®ªm huy hoµng cña ngµy h«m nay ®· kÕt thóc, mêi b¹n ngµy mai h·y quay l¹i!", 0)
		return
	end
	
	if (DelItem(2, 1, 1025, 1) == 1) then
		if (nCurDate > nLastDate) then
			SetTask(SHINING_NIGHT_DATE, nCurDate)
			nShiningCount = 0
		end
		
		nShiningCount = nShiningCount + 1
		SetTask(SHINING_NIGHT_COUNT, nShiningCount)
		Say("§©y lµ lÇn thø "..nShiningCount.."sö dông B¸ V­¬ng lÖnh! Ho¹t ®éng ®­îc chän lµ"..strTab[nChoice + 1], 0)
		
		VoteForShiningNight(nChoice, nShiningCount)
		
		local szPlayerName = GetName()
		local msg="ThiÕu hiÖp "..szPlayerName.." Sö dông B¸ V­¬ng lÖnh chän ho¹t ®éng ®ªm huy hoµng h«m nay lµ "..strTab[nChoice + 1]
		AddGlobalNews(msg)
	end
end;

