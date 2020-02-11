Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")

TASKVAL_BAIJUWAN = 2501		-- ¸ÃÈÎÎñ±äÁ¿±£´æ°×¾ÔÍèµÄÊ£ÓàÊ±¼ä£¨·ÖÖÓ£©
TASKVAL_SHENNONG = 2502		-- ¸ÃÈÎÎñ±äÁ¿±£´æÉñÅ©µ¤µÄÊ£ÓàÊ±¼ä£¨·ÖÖÓ£©
TASKVAL_BAIJUWAN1 = 2507	-- ´ó°×¾ÔÍèµÄÊ±¼ä
TASKVAL_BAIJUWAN2 = 2508	-- °×¾ÔÏÉµ¤µÄÊ±¼ä
TASKVAL_BAIJUWAN3 = 2511	-- Ð¡°×¾ÔµÄÊ±¼ä
TASKVAL_BAIJUWAN3_DATA = 2512	-- Ð¡°×¾ÔÁìÈ¡Ê±¼ä

TASKVAL_BAIJU_LASTACTIVE_TIME = 2292		-- ¼ÇÂ¼×î½üÒ»´Î»ñµÃ°×¾Ô¾­ÑéµÄÊ±¼ä
TASKVAL_LIUSHEN_LASTACTIVE_TIME = 2293		-- ¼ÇÂ¼×î½üÒ»´Î»ñµÃÁùÉñ¾­ÑéµÄÊ±¼ä
TASKVAL_SANQING_LASTACTIVE_TIME = 2294		-- ¼ÇÂ¼×î½üÒ»´Î»ñµÃÈýÇå¾­ÑéµÄÊ±¼ä


function main(nBaiju, nShennong, nZhenQi)
	local nPlayerMapId, nPlayerX, nPlayerY = GetWorldPos();
	if nPlayerMapId == 219 then
     		local nDist = DistanceBetweenPoints(219, 1529,3137, nPlayerMapId, nPlayerX, nPlayerY);
     		if nDist >= 0 and nDist <= 3 then
     			Msg2Player("Khu vùc nµy kh«ng thÓ tiÕn hµnh ñy th¸c, vui lßng thö l¹i t¹i vÞ trÝ kh¸c.")
     			return
     		end
     	end

	local TimeNow = GetTime()
	SetTask(TASKVAL_BAIJU_LASTACTIVE_TIME, TimeNow)
	SetTask(TASKVAL_LIUSHEN_LASTACTIVE_TIME, TimeNow)
	SetTask(TASKVAL_SANQING_LASTACTIVE_TIME, TimeNow)
	--SetTask(TASKVAL_ZHENQI_LASTACTIVE_TIME, TimeNow)

	local nResult = 0
	if IsGathering() > 0 then
		nResult = Shennong(nShennong)
	elseif IsStalling() > 0 or IsReading() > 0 then
		if nBaiju > 0 then
			nResult = Taibai(nBaiju)
		elseif nZhenQi > 0 then
			nResult = nResult + ZhenQi(nZhenQi)
		else
			Taibai(nBaiju)
		end
	else
		Msg2Player("B¹n nªn b¾t ®Çu thu thËp, nghiªn cøu hoÆc bµy b¸n tr­íc råi h·y m¬ t­ëng.")
	end;
	if nResult == 0 then
		return
	end
	IpBonusClose()
	OfflineLive()
	local strLog = "[Offlinelive] "..GetName().." "..GetAccount()
	if nBaiju > 0 then
		strLog = strLog.." BaiJuWan"
	end
	if nShennong > 0 then
		strLog = strLog.." ShenNongDan"
	end
	if nZhenQi > 0 then
		strLog = strLog.." JuLingWan"
	end
	WriteLog(strLog)
	Msg2Player("B¹n b¾t ®Çu tr¹ng th¸i bay bæng trong thÕ giíi thÇn tiªn.")
	QuitGestConvention();	--ÍË³ö±ÈÎä´ó»áÅä¶ÔÁÐ±í
end

function Taibai(nBaiju)
	if nBaiju == 0 then
		Msg2Player("B¹n ph¶i sö dông B¹ch C©u hoµn míi cã thÓ suy t­ëng.")
		return 0
	end
	if GetTask(TASKVAL_BAIJUWAN) + GetTask(TASKVAL_BAIJUWAN1) + GetTask(TASKVAL_BAIJUWAN2) + GetTask(TASKVAL_BAIJUWAN3) <= 0 then
		Msg2Player("B¹ch C©u hoµn cã thÓ gióp b¹n nguyªn thÇn hîp nhÊt.")
		return 0
	end;
	return 1
end

function ZhenQi(nZhenQi)
	if nZhenQi == 0 then
		Msg2Player("C¸c h¹ cÇn sö dông Tô Linh Hoµn ®Ó b¾t ®Çu minh t­ëng.")
		return 0
	end
	if MeridianGetLeftGenuineQiCapcity() <= 0 then
		Msg2Player("Ch©n khÝ cña c¸c h¹ ®· ®¹t giíi h¹n, kh«ng thÓ sö dông Tô Linh Hoµn ®Ó minh t­ëng.")
		return 0
	end
	if GetJuLingWanAllTime() <= 0 then
		Msg2Player("Tô Linh Hoµn cã thÓ gióp b¹n hç thÇn thñ nhÊt, h·y thö 1 qu¶ ®i.")
		return 0
	end;
	return 1
end

function Shennong(nShennong)
	if GetTask(TASKVAL_SHENNONG) <= 0 then
		Msg2Player("§Ó thØnh ThÇn N«ng cÇn ph¶i cã ThÇn N«ng ®¬n.")
		return 0
	end;
	return 1
end

function Leave()
end
function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	    local dx = MapX2 - MapX1;
	    local dy = MapY2 - MapY1;
	    local nDist = (dx * dx + dy * dy)^(1/2);
	    return nDist;
    end;
end;
