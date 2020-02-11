--ËÎ·½ºóÓªÍâTrapµã´¥·¢µÄ½Å±¾
Include("\\script\\battles\\butcher\\head.lua")
function main()
	--Èç¹û´¦ÓÚ±¨Ãû½×¶ÎÊ±,Íæ¼Ò²»ÄÜ×ßµ½¶Ô·½µÄÁìµØÖĞÈ¥£¬ËùÒÔ»á½«Íæ¼ÒÈÓµ½´óÓªÄÚ
		if(GetCurCamp() == 1) then
			print("homeouttrap1  homeouttrap1  homeouttrap1  homeouttrap1")
			SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
			SetFightState(0)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
		elseif (GetCurCamp() == 2) then
			Msg2Player("Tr­íc khi khai chiÕn, tÊt c¶ t­íng sÜ kh«ng ®­îc tù ı rêi khái qu©n doanh cña m×nh! H·y ®îi lóc khai chiÕn giÕt giÆc lËp c«ng!")
			SetFightState(1)
		end;
end;


