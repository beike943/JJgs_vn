--ËÎ·½ºóÓªTrapµã´¥·¢µÄ½Å±¾
Include("\\script\\battles\\butcher\\head.lua")


function main()
	--Èç¹û´¦ÓÚ±¨Ãû½×¶ÎÊ±,Íæ¼Ò²»ÄÜ×ßµ½¶Ô·½µÄÁìµØÖĞÈ¥£¬ËùÒÔ»á½«Íæ¼ÒÈÓµ½´óÓªÄÚ
		if(GetCurCamp() == 1) then
			if( GetFightState() == 1) then
				print("hometrap1  hometrap1  hometrap1  hometrap1  GetFightState() == 1  GetCurCamp() == 1")
				SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
				SetFightState(0)
			else
				RestTime =  GetGameTime() - BT_GetData(PL_LASTDEATHTIME) 
				if ( RestTime < TIME_PLAYER_REV) then
					Say((TIME_PLAYER_REV - RestTime) .. " gi©y sau míi vµo ®­îc chiÕn tr­êng. T­íng sÜ! Xin ®õng nãng lßng!", 0)
				else
					file = GetMissionS(1)
					x,y = bt_getadata(file)
					print("hometrap1  hometrap1  hometrap1  hometrap1  RestTime >= TIME_PLAYER_REV and GetFightState() ~= 1  GetCurCamp() == 1")
					SetPos(floor(x/32), floor(y/32))
					SetFightState(1)
					SetTempRevPos(SubWorldIdx2ID(SubWorld) , GetMissionV(MS_HOMEIN_X1) * 32, GetMissionV(MS_HOMEIN_Y1) * 32);
				end
			end;
		elseif (GetCurCamp() == 2) then
			print("hometrap1  hometrap1  hometrap1  hometrap1  GetCurCamp() == 1")
			file = GetMissionS(1)
			x,y = bt_getadata(file)
			SetPos(floor(x/32), floor(y/32))
			Msg2Player("Tr­íc khi khai chiÕn, tÊt c¶ t­íng sÜ kh«ng ®­îc tù ı rêi khái qu©n doanh cña m×nh! H·y ®îi lóc khai chiÕn giÕt giÆc lËp c«ng!")
			SetFightState(1)
		end;
end;


