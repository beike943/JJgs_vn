
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ê¦ÃÅÇëÔ¸Êé½Å±¾
-- ×÷ÓÃ£ºÔö¼Ó24Ğ¡Ê±ÄÚÁìÈ¡Ê¦ÃÅÈÎÎñ¸ÅÂÊ
-- Edited by StarryNight
-- 2007/01/16 16:50

-- ÎÒµÄÒ¹ÍíÊÇÄãµÄ°×Ìì
-- µ±ÄãĞÑÊ±ÎÒÃÎÀïÏà¼û
-- Ö»ÎªÁËºÍÄãÔÙ¼ûÒ»Ãæ
-- ÎÒ»á²»·ÖÖçÒ¹µÄÏëÄî

-- ======================================================

USE_TIME = 558;
ADD_RATE = 2;--Ôö¼ÓÁìÈ¡ÈÎÎñ¸ÅÂÊ£¨µ¥Î»£º±¶Êı£©

function OnUse()
	
	Say("B¹n muèn dïng s­ m«n thØnh nguyÖn th­? Nã cã thÓ gióp b¹n t¨ng tû lÖ nhËn nhiÖm vô s­ m«n ngÉu nhiªn gÊp 4 lÇn trong 24 giê.",
	2,
	"§ång ı/confirm_use",
	"T¹m thêi ch­a sö dông!/cancel_use"
	)

end

--È·ÈÏÊ¹ÓÃÊ¦ÃÅÇëÔ¸Êé
function confirm_use()

local use_time = GetTime();

	-- Èç¹û»¹Ã»ÓĞÈëÃÅÅÉ¾Í²»ÄÜÊ¹ÓÃ
	if GetPlayerFaction() == 0 then
		Say("B¹n ch­a gia nhËp m«n ph¸i, kh«ng thÓ sö dông vËt phÈm nµy",0);
		return
	end

	if GetTime() - GetTask(USE_TIME) < 86400 then
		Say("B¹n ®· dïng s­ m«n thØnh nguyÖn th­, trong 24h kh«ng thÓ sö dông tiÕp",0)
		return
	end

	if DelItem(2,1,1019,1) == 1 then	
		SetTask(USE_TIME,use_time);
		Say("B¹n ®· dïng s­ m«n thØnh nguyÖn th­, trong 24h tû lÖ nhËn nhiÖm vô s­ m«n ngÉu nhiªn gÊp ®«i",0)
	else
		Say("B¹n kh«ng mang s­ m«n thØnh nguyÖn th­, kh«ng thÓ sö dông.",0)
	end
	
end

--È¡ÏûÊ¹ÓÃÊ¦ÃÅÇëÔ¸Êé
function cancel_use()

end