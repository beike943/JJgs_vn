Include("\\script\\battles\\butcher\\head.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--¼ÆÊıÆ÷£¬Í³¼Æµ±Ç°¶¨Ê±Æ÷´¥·¢ÁË¶àÉÙ´ÎÁË
	SetMissionV(MS_TIMER1, t)
	
	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "Khu vùc s¬ cÊp"
		lvllimit = 40
	elseif (lsf_level == 2) then
		resultstr = "Khu vùc cao cÊp"
		lvllimit = 70
	end
	
	local group1count = GetMSPlayerCount(MISSIONID, 1)
	local group2count = GetMSPlayerCount(MISSIONID, 2)

	if (t == RUNGAME_TIME) then --Èç¹ûµ½ÁËÕıÊ½¿ªÕ½Ê±¿Ì£¬ÔòÍ£Ö¹±¨Ãû£¬ÕıÊ½½øÈëÕ½¶·½×¶Î
		if ( group1count < but_getminplayerlimit() or group2count < but_getminplayerlimit() ) then
			SetMissionV(MS_MOSTDEATH, 1) 
			CloseMission(MISSIONID)
			return
		end
		RunMission(MISSIONID)
		AddGlobalNews(resultstr.."Thiªn M«n trËn t¹i Nh¹n M«n quan ®· më. C¸c hiÖp kh¸ch xin nhanh ch©n ®Õn b¸o danh tham chiÕn!");
		Msg2Global(resultstr.."Thiªn M«n trËn t¹i Nh¹n M«n quan ®· më. C¸c hiÖp kh¸ch xin nhanh ch©n ®Õn b¸o danh tham chiÕn!")
		Msg2MSAll(MISSIONID, "§¹i chiÕn Nh¹n M«n quan chİnh thøc khai chiÕn! C¸c t­íng sÜ! TiÕn lªn!");
		WriteLog("butcher battle is entering fight state\tsong member count\t"..GetMSPlayerCount(MISSIONID, 1).."\tliao member count\t"..GetMSPlayerCount(MISSIONID, 2), "NhËt kı Tèng Liªu")
	end

	if (t == CLOSE_SIGNUP_TIME) then
		AddGlobalNews("ChiÕn tr­êng ®ang diÔn ra khèc liÖt. §­êng vµo chiÕn tr­êng ®· bŞ phong táa! ViÖn qu©n mçi bªn xin ®îi trËn sau!")
		Msg2Global("ChiÕn tr­êng ®ang diÔn ra khèc liÖt. §­êng vµo chiÕn tr­êng ®· bŞ phong táa! ViÖn qu©n mçi bªn xin ®îi trËn sau!")
	end

	if (t < RUNGAME_TIME and mod(t, 3) == 0 ) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."Thiªn M«n trËn t¹i Nh¹n M«n quan s¾p khai chiÕn. C¸c hiÖp kh¸ch h·y mau chãng mang theo Anh hïng lÖnh ®Õn Nh¹n M«n quan b¸o danh! Thêi gian b¸o danh cßn"..RestMin.." phót. §iÒu kiÖn tham chiÕn: §¼ng cÊp tõ"..lvllimit.." trë lªn.";
			str2 = "Thêi gian khai chiÕn cßn:"..RestMin.." Phót "
		else
			str1 = resultstr.."Thiªn M«n trËn t¹i Nh¹n M«n quan s¾p khai chiÕn. C¸c hiÖp kh¸ch h·y mau chãng mang theo Anh hïng lÖnh ®Õn Nh¹n M«n quan b¸o danh! Thêi gian b¸o danh cßn"..RestMin.." Phót "..RestSec.." gi©y. §iÒu kiÖn tham chiÕn: §¼ng cÊp kh«ng nhá h¬n"..lvllimit.." trë lªn.";
			str2 = "Thêi gian khai chiÕn cßn:"..RestMin.." Phót "..RestSec.." Gi©y "
		end
		if( mod(t, 18) == 0 ) then
			AddGlobalNews(str1);
			Msg2Global(str1)
		end
		Msg2MSAll(MISSIONID,str2);		--Í¨Öª³¡ÄÚÍæ¼Ò¿ªÕ½Ê£ÓàÊ±¼ä
	end
	
	if (t >= RUNGAME_TIME) then

		--Èç¹û³¡ÉÏÄ³Ò»ÕóÓªÈËÊıµÍÓÚ×îĞ¡ÊıÁ¿£¬Ôò±ÈÈü½áÊø£¬ÈË¶àµÄÕóÓªÖ±½Ó»ñÊ¤
		if( t > RUNGAME_TIME and wl_search_memcount() == 1 ) then
			CloseMission(MISSIONID)
			return
		end

		--Ã¿Ò»·ÖÖÓÍ¨¸æµ±Ç°Ë«·½Õ½¹¦£¬ºÍnpc
		if (mod(t, 3) == 0 ) then
			msstr = "Th«ng b¸o: ChiÕn c«ng 2 phe Tèng Liªu hiÖn lµ"..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
			Msg2MSAll(MISSIONID, msstr)
			
			local gametime = floor(GetMSRestTime(MISSIONID, 40) / 18);
			local gamerestmin, gamerestsec = GetMinAndSec(gametime);
			if( gamerestmin ~= 0 ) then
				Msg2MSAll( MISSIONID, "Thêi gian kÕt thóc trËn chiÕn cßn"..gamerestmin.." phót " )
				if ( mod(t,30) == 0 and t > RUNGAME_TIME and t < CLOSE_SIGNUP_TIME) then
					AddGlobalNews("ChiÕn ®Êu gi÷a Tèng qu©n vµ Liªu binh ®ang håi kŞch liÖt, thêi gian kÕt thóc trËn chiÕn cßn"..gamerestmin.." phót, c¸c t­íng sÜ khÈn tr­¬ng dïng Anh hïng lÖnh th¼ng tiÕn Nh¹n M«n quan tham chiÕn!")
					Msg2Global("ChiÕn ®Êu gi÷a Tèng qu©n vµ Liªu binh ®ang håi kŞch liÖt, thêi gian kÕt thóc trËn chiÕn cßn"..gamerestmin.." phót, c¸c t­íng sÜ khÈn tr­¬ng dïng Anh hïng lÖnh th¼ng tiÕn Nh¹n M«n quan tham chiÕn!")
				end
			end
			resttime_to_close = (CLOSE_SIGNUP_TIME - t) * TIMER_1 / FRAME2TIME
			m, s = GetMinAndSec(resttime_to_close);
			if (m > 0 and mod(t, 15) == 0) then
				Msg2Global("§­êng vµo Nh¹n M«n quan sÏ ®ãng sau "..m.."  phót, viÖn qu©n mçi bªn h·y khÈn cÊp tiÕn vÒ chiÕn tr­êng!")
			end
		end
		
		but_pop2home( 1 )
		but_pop2home( 2 )
	end
end
