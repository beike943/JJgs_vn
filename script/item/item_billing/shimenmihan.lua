
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ê¦ÃÅÃÜº¯½Å±¾
-- ×÷ÓÃ£ºÁìÈ¡Ò»¸öÊ¦ÃÅËæ»úÈÎÎñ
-- Edited by StarryNight
-- 2007/01/17 10:02

-- ÎÒ½«ÔÚÊôÓÚÄãµÄĞÇ×ùÉÏÁôÏÂÒ»µãµã¹ì¼£
-- ¸æËßÄã²»Òª·ÅÆú²»Òª·ÅÆú

-- ======================================================

Include("\\script\\task\\random\\task_head.lua");

USE_TIME = 559;

function OnUse()
	
	Say("B¹n muèn dïng s­ m«n mËt hµm? Nã cã thÓ gióp b¹n nhËn nhiÖm vô s­ m«n ngÉu nhiªn!",
	2,
	"§ång ı/confirm_use",
	"T¹m thêi ch­a sö dông!/cancel_use"
	)

end

--È·ÈÏÊ¹ÓÃÊ¦ÃÅÃÜº¯
function confirm_use()

local nCoolDown = GetTime() - GetTask(USE_TIME);
local use_time = GetTime();

	-- Èç¹û»¹Ã»ÓĞÈëÃÅÅÉ¾Í²»ÄÜÊ¹ÓÃ
	if GetPlayerFaction() == 0 then
		Say("B¹n ch­a gia nhËp m«n ph¸i, kh«ng thÓ sö dông vËt phÈm nµy",0);
		return
	end
	
	--Ö®Ç°ÒÑ¾­ÁìÈ¡Ê¦ÃÅÈÎÎñÔòÎŞ·¨Ê¹ÓÃ
	if GetTask(551) ~= 0 then
		Say("Ng­¬i vÉn ch­a hoµn thµnh nhiÖm vô s­ m«n, lÏ nµo muèn hñy bá ®Ó nhËn nhiÖm vô míi?",
		2,
		"§­îc/cancel_task",
		"Hñy bá/cancel_use"
		)
		return 0;
	end
	
	if nCoolDown < 7200 then
		Say("Trong 2 giê kh«ng thÓ sö dông liªn tiÕp s­ m«n mËt hµm, b¹n cßn"..TurnTime(7200-nCoolDown).." míi cã thÓ sö dông.",0)
		return
	end

	if DelItem(2,1,1020,1) == 1 then	
		if CreateTask() == 1 then	--´´½¨³É¹¦ºó²Å·¢Í¨Öª¡¡edited by yanjun 06-11-15
			RandomTaskTip("B¹n nhËn ®­îc nhiÖm vô s­ ®å!");
			Msg2Player("NÕu liªn tôc 2 lÇn kh«ng thÓ hoµn thµnh nhiÖm vô s­ phô giao sÏ bŞ mÊt 1 ®iÓm danh väng!");
			SetTask(USE_TIME,use_time);
		else
			AddItem(2,1,1020,1,1);--·ÀÖ¹ÁìÈ¡²»ÁËÈÎÎñ¶ø²¹·¢Ò»¸öÊ¦ÃÅÃØ¼®
		end;
	else
		Say("B¹n kh«ng mang s­ m«n mËt tŞch, kh«ng thÓ sö dông.",0)
	end
	
end

--È¡ÏûÊ¹ÓÃÊ¦ÃÅÃÜº¯
function cancel_use()

end

--°ÑÒ»¸öÃëÊı×ª»»ÎªÊ±£º·Ö£ºÃë
function TurnTime(nSec)

local nHour = floor(nSec/3600);
local nMinute = floor(mod(nSec,3600)/60); 
local nSecond = floor(mod((mod(nSec,3600)),60));
local str = "";

	str = " <color=yellow>"..nHour.."<color> giê <color=yellow>"..nMinute.."<color> phót <color=yellow>"..nSecond.."<color> gi©y ";
	
	return str

end

--Çå³ıÔ­ÓĞÈÎÎñ×´Ì¬
function cancel_task()

	SetTask(551,0);
	RemoveTrigger(100);

	Say("B¹n cã thÓ sö dông MËt Hµm S­ m«n ®Ó tïy ı nhËn nhiÖm vô s­ m«n",0);
	
end