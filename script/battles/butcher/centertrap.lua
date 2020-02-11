Include("\\script\\battles\\butcher\\head.lua")

function main()
	--Èç¹û´¦ÓÚ±¨Ãû½×¶ÎÊ±,Íæ¼Ò²»ÄÜ×ßµ½¶Ô·½µÄÁìµØÖĞÈ¥£¬ËùÒÔ»á½«Íæ¼ÒÈÓµ½´óÓªÄÚ
	if(GetMissionV(MS_STATE) == 1) then
		if(GetCurCamp() == 1) then
			print("centertrap  centertrap  centertrap")
			local xpos, ypos = sj_getfrontpos( GetCurCamp() )
			SetPos( xpos, ypos )
--			SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
			SetFightState(1)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
			Say("Tr­íc khi khai chiÕn, tÊt c¶ t­íng sÜ kh«ng ®­îc tù ı rêi khái qu©n doanh cña m×nh! H·y ®îi lóc khai chiÕn giÕt giÆc lËp c«ng!", 0)
		elseif (GetCurCamp() == 2) then
			print("centertrap  centertrap  centertrap")
			local xpos, ypos = sj_getfrontpos( GetCurCamp() )
			SetPos( xpos, ypos )
--			SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
			SetFightState(1)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
			Say("Tr­íc khi khai chiÕn, tÊt c¶ t­íng sÜ kh«ng ®­îc tù ı rêi khái qu©n doanh cña m×nh! H·y ®îi lóc khai chiÕn giÕt giÆc lËp c«ng!", 0)
		end;
	else
		SetFightState(1)
	end;
end;


