
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Í¨¼©Ãû²á½Å±¾
-- ×÷ÓÃ£ºÁìÈ¡Ò»¸öÍ¨¼©ÈÎÎñ
-- Edited by StarryNight
-- 2007/01/17 10:25

-- ÊäÁËÄã£¬Ó®ÁËÊÀ½çÓÖÈçºÎ
-- ÄãÔø¿ÊÍûµÄÃÎ
-- ÎÒÏëÓÀÔ¶¶¼²»»á¶®

-- ======================================================

Include("\\script\\task\\killer\\killer_head.lua");

USE_TIME = 1116;--Ò»ÌìÄÚÊ¹ÓÃÍ¨¼©Ãû²áÀÛ¼ÆÊıÁ¿
LAST_TIME = 1117;--ÉÏÒ»´ÎÊ¹ÓÃÍ¨¼©Ãû²áµÄÈÕÆÚ

function OnUse()
	
	Say("B¹n muèn dïng danh s¸ch truy n·? Nã cã thÓ gióp b¹n nhËn nhiÖm vô truy n·, tèi ®a 20 lÇn.",
	2,
	"§ång ı/confirm_use",
	"T¹m thêi ch­a sö dông!/cancel_use"
	)

end

--È·ÈÏÊ¹ÓÃÍ¨¼©Ãû²á
function confirm_use()

local nLastTime = GetTask(LAST_TIME);
local nNowTime = GetYMDTime();
local nUseTime = GetTask(USE_TIME);

	--ÈÎÎñµÈ¼¶Ğ¡ÓÚ20²»ÄÜÊ¹ÓÃ
	if GetLevel() < 20 then
		Say("§¼ng cÊp hiÖn thêi cña b¹n kh«ng thÓ nhËn nhiÖm vô truy n·, ®¹t cÊp <color=yellow>20<color> h·y quay l¹i!",0)
		return
	end
	
	--Ö®Ç°ÒÑ¾­ÁìÈ¡Ê¦ÃÅÈÎÎñÔòÎŞ·¨Ê¹ÓÃ
	if GetTask(TASK_KILLER_STATE_ID) ~= 0 then
		Say("B¹n ch­a hoµn thµnh nhiÖm vô tr­íc, cè g¾ng lªn!",0)
		return
	end
	
	if nLastTime == nNowTime then
		if GetTask(USE_TIME) >= 20 then
		 Say("H«m nay b¹n ®· sö dông ®ñ danh s¸ch truy n·, ngµy mai h·y quay l¹i!",0)
		 return
		end
	end
	
	--·¢²¼Ò»¸öÍ¨¼©ÈÎÎñ
	if DelItem(2,1,1022,1) == 1 then
	
		local nKillerName = "";
		local nKillerMode = "";
		local nMapName = "";
		local nMapID = 0;
		local nWx,nWy,nMx,nMy = 0,0,0,0;
		local nTriggerID = 0;
		local nCustomID = 0;
			
		--Éú³ÉÒ»¸öÉ±ÊÖÊı¾İ
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
				
		SetTask(TASK_KILLER_STATE_ID,1);--½ÓÊÜÒ»¸öÍ¨¼©ÈÎÎñ£¬ÖÃ±äÁ¿Îª 1
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--¼ÇÂ¼Íæ¼Ò½Ó»ñÈÎÎñÊ±µÄµÈ¼¶
		
		Say("Theo tin th¸m b¸o, s¸t thñ <color=yellow>"..nKillerName.."<color> gÇn ®©y hay xuÊt hiÖn t¹i <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H·y mau ®i diÖt trõ! (H«m nay b¹n ®· dïng <color=yellow>"..(nUseTime+1).."<color> c¸i danh s¸ch truy n·, cßn <color=yellow>"..20-(nUseTime+1).."<color> lÇn c¬ héi).",0);
		
		--Éú³ÉÊ±¼ä´¥·¢Æ÷£¬¼ÆÊıÖµÎª900
		CreateTrigger(1,400,500);
		ContinueTimer(GetTrigger(500));
		
		--±£´æµ±Ç°Ê±¼ä
		nTime = GetTime();--»ñÈ¡1970ÄêÖÁ½ñ¾­¹ıµÄÃëÊı
		SetTask(TASK_ACCEPT_TIME,nTime);
		
		--Éú³ÉµØÍ¼´¥·¢Æ÷
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--±£´æµØÍ¼´¥·¢Æ÷ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);
	
		TaskTip("Néi 15 phót ph¶i hoµn thµnh, xem thªm trong LÖnh truy n·!");
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end
		
		--¼ÇÂ¼Ê¹ÓÃÊ±¼äºÍµ±ÌìÊ¹ÓÃ´ÎÊı
		if nLastTime ~= nNowTime then
			SetTask(USE_TIME,1);
		else
		 SetTask(USE_TIME,nUseTime+1);
		end
		
		SetTask(LAST_TIME,nNowTime);
		
	else
		Say("B¹n kh«ng mang danh s¸ch truy n·, kh«ng thÓ sö dông.",0)
	end
	
end

--È¡ÏûÊ¹ÓÃÍ¨¼©Ãû²á
function cancel_use()

end

--»ñÈ¡µ±Ç°ÄêÔÂÈÕ×Ö·û´®
function GetYMDTime()

local nYMD_str = date("%y")..date("%m")..date("%d")

	return nYMD_str

end