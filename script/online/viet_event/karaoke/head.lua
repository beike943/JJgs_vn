Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");

function main()
	local nDate =  tonumber(date("%y%m%d"))
	if nDate < 110519 or nDate > 110602 then
		Talk(1, "", "§· hÕt h¹n b×nh chän!")
		return
	end
	local szName = "ThÇn T­îng Vâ L©m"
	local tList = {
		[1] = 
		{
			"B×nh chän SBD 047 - TrÇn Phó - xIxHeoAnh (m¸y chñ ViÖt ¦ng-)/#do_vote(1)",
			"B×nh chän SBD 007 - Ph¹m Thµnh Nh©n - phamthanhnhan (m¸y chñ ViÖt ¦ng)/#do_vote(2)",
			"B×nh chän SBD 090 - TrÇn ThÞ BÝch Ph­îng - o4ever (m¸y chñ B¹ch Hæ)/#do_vote(3)",
			"B×nh chän SBD 067 - Th¸i §ç ChÝ Minh - DuongBatMuoi (m¸y chñ TrÝ Long)/#do_vote(4)",
			"B×nh chän SBD 068 - T« HuyÒn Trinh - PeXjnhNgamy(m¸y chñ TrÝ Long)/#do_vote(5)",
			"B×nh chän SBD 064 - Vâ Huy Vinh - zB¹chM·HoµngTöz (m¸y chñ Kú Hæ)/#do_vote(6)",
			"B×nh chän SBD 093 - Lª M¹nh C­êng - ZxBinhThuongxZ (m¸y chñ Song Hæ)/#do_vote(7)",
			"B×nh chän SBD 033 - Lª TuÊn Anh - zZ4NhH4iZz (m¸y chñ Hoµng Hæ	)/#do_vote(8)",
			"B×nh chän SBD 015 - Mai NguyÔn Minh Huy -  hi3px0ngz0ng(m¸y chñ B¹ch Hæ)/#do_vote(9)",
			"B×nh chän SBD 038 - Ph¹m ViÖt Dòng - policehotboy (m¸y chñ TrÝ Long)/#do_vote(10)",
			"B×nh chän SBD 050 - Qu¸ch Minh C­êng - o0oMichaelQuach (m¸y chñ Tµng Long)/#do_vote(11)",
		},
		[2] =
		{
			"B×nh chän SBD 007 - Ph¹m Thµnh Nh©n - phamthanhnhan (m¸y chñ ViÖt ¦ng)/#do_vote(2)",
			"B×nh chän SBD 090 - TrÇn ThÞ BÝch Ph­îng - o4ever (m¸y chñ B¹ch Hæ)/#do_vote(3)",
			"B×nh chän SBD 067 - Th¸i §ç ChÝ Minh - DuongBatMuoi (m¸y chñ TrÝ Long)/#do_vote(4)",
			"B×nh chän SBD 068 - T« HuyÒn Trinh - PeXjnhNgamy(m¸y chñ TrÝ Long)/#do_vote(5)",
			"B×nh chän SBD 064 - Vâ Huy Vinh - zB¹chM·HoµngTöz (m¸y chñ Kú Hæ)/#do_vote(6)",
			"B×nh chän SBD 093 - Lª M¹nh C­êng - ZxBinhThuongxZ (m¸y chñ Song Hæ)/#do_vote(7)",
			"B×nh chän SBD 033 - Lª TuÊn Anh - zZ4NhH4iZz (m¸y chñ Hoµng Hæ	)/#do_vote(8)",
			"B×nh chän SBD 015 - Mai NguyÔn Minh Huy -  hi3px0ngz0ng(m¸y chñ B¹ch Hæ)/#do_vote(9)",
			"B×nh chän SBD 038 - Ph¹m ViÖt Dòng - policehotboy (m¸y chñ TrÝ Long)/#do_vote(10)",
			"B×nh chän SBD 050 - Qu¸ch Minh C­êng - o0oMichaelQuach (m¸y chñ Tµng Long)/#do_vote(11)",
			"B×nh chän SBD 047 - TrÇn Phó - xIxHeoAnh (m¸y chñ ViÖt ¦ng-)/#do_vote(1)",
		},
		[3] =
		{
			"B×nh chän SBD 090 - TrÇn ThÞ BÝch Ph­îng - o4ever (m¸y chñ B¹ch Hæ)/#do_vote(3)",
			"B×nh chän SBD 067 - Th¸i §ç ChÝ Minh - DuongBatMuoi (m¸y chñ TrÝ Long)/#do_vote(4)",
			"B×nh chän SBD 068 - T« HuyÒn Trinh - PeXjnhNgamy(m¸y chñ TrÝ Long)/#do_vote(5)",
			"B×nh chän SBD 064 - Vâ Huy Vinh - zB¹chM·HoµngTöz (m¸y chñ Kú Hæ)/#do_vote(6)",
			"B×nh chän SBD 093 - Lª M¹nh C­êng - ZxBinhThuongxZ (m¸y chñ Song Hæ)/#do_vote(7)",
			"B×nh chän SBD 033 - Lª TuÊn Anh - zZ4NhH4iZz (m¸y chñ Hoµng Hæ	)/#do_vote(8)",
			"B×nh chän SBD 015 - Mai NguyÔn Minh Huy -  hi3px0ngz0ng(m¸y chñ B¹ch Hæ)/#do_vote(9)",
			"B×nh chän SBD 038 - Ph¹m ViÖt Dòng - policehotboy (m¸y chñ TrÝ Long)/#do_vote(10)",
			"B×nh chän SBD 050 - Qu¸ch Minh C­êng - o0oMichaelQuach (m¸y chñ Tµng Long)/#do_vote(11)",
			"B×nh chän SBD 047 - TrÇn Phó - xIxHeoAnh (m¸y chñ ViÖt ¦ng-)/#do_vote(1)",
			"B×nh chän SBD 007 - Ph¹m Thµnh Nh©n - phamthanhnhan (m¸y chñ ViÖt ¦ng)/#do_vote(2)",
		},
		[4] =
		{
			"B×nh chän SBD 067 - Th¸i §ç ChÝ Minh - DuongBatMuoi (m¸y chñ TrÝ Long)/#do_vote(4)",
			"B×nh chän SBD 068 - T« HuyÒn Trinh - PeXjnhNgamy(m¸y chñ TrÝ Long)/#do_vote(5)",
			"B×nh chän SBD 064 - Vâ Huy Vinh - zB¹chM·HoµngTöz (m¸y chñ Kú Hæ)/#do_vote(6)",
			"B×nh chän SBD 093 - Lª M¹nh C­êng - ZxBinhThuongxZ (m¸y chñ Song Hæ)/#do_vote(7)",
			"B×nh chän SBD 033 - Lª TuÊn Anh - zZ4NhH4iZz (m¸y chñ Hoµng Hæ	)/#do_vote(8)",
			"B×nh chän SBD 015 - Mai NguyÔn Minh Huy -  hi3px0ngz0ng(m¸y chñ B¹ch Hæ)/#do_vote(9)",
			"B×nh chän SBD 038 - Ph¹m ViÖt Dòng - policehotboy (m¸y chñ TrÝ Long)/#do_vote(10)",
			"B×nh chän SBD 050 - Qu¸ch Minh C­êng - o0oMichaelQuach (m¸y chñ Tµng Long)/#do_vote(11)",
			"B×nh chän SBD 047 - TrÇn Phó - xIxHeoAnh (m¸y chñ ViÖt ¦ng-)/#do_vote(1)",
			"B×nh chän SBD 007 - Ph¹m Thµnh Nh©n - phamthanhnhan (m¸y chñ ViÖt ¦ng)/#do_vote(2)",
			"B×nh chän SBD 090 - TrÇn ThÞ BÝch Ph­îng - o4ever (m¸y chñ B¹ch Hæ)/#do_vote(3)",
		},
		[5] =
		{
			"B×nh chän SBD 068 - T« HuyÒn Trinh - PeXjnhNgamy(m¸y chñ TrÝ Long)/#do_vote(5)",
			"B×nh chän SBD 064 - Vâ Huy Vinh - zB¹chM·HoµngTöz (m¸y chñ Kú Hæ)/#do_vote(6)",
			"B×nh chän SBD 093 - Lª M¹nh C­êng - ZxBinhThuongxZ (m¸y chñ Song Hæ)/#do_vote(7)",
			"B×nh chän SBD 033 - Lª TuÊn Anh - zZ4NhH4iZz (m¸y chñ Hoµng Hæ	)/#do_vote(8)",
			"B×nh chän SBD 015 - Mai NguyÔn Minh Huy -  hi3px0ngz0ng(m¸y chñ B¹ch Hæ)/#do_vote(9)",
			"B×nh chän SBD 038 - Ph¹m ViÖt Dòng - policehotboy (m¸y chñ TrÝ Long)/#do_vote(10)",
			"B×nh chän SBD 050 - Qu¸ch Minh C­êng - o0oMichaelQuach (m¸y chñ Tµng Long)/#do_vote(11)",
			"B×nh chän SBD 047 - TrÇn Phó - xIxHeoAnh (m¸y chñ ViÖt ¦ng-)/#do_vote(1)",
			"B×nh chän SBD 007 - Ph¹m Thµnh Nh©n - phamthanhnhan (m¸y chñ ViÖt ¦ng)/#do_vote(2)",
			"B×nh chän SBD 090 - TrÇn ThÞ BÝch Ph­îng - o4ever (m¸y chñ B¹ch Hæ)/#do_vote(3)",
			"B×nh chän SBD 067 - Th¸i §ç ChÝ Minh - DuongBatMuoi (m¸y chñ TrÝ Long)/#do_vote(4)",
		},
		[6] =
		{
			"B×nh chän SBD 064 - Vâ Huy Vinh - zB¹chM·HoµngTöz (m¸y chñ Kú Hæ)/#do_vote(6)",
			"B×nh chän SBD 093 - Lª M¹nh C­êng - ZxBinhThuongxZ (m¸y chñ Song Hæ)/#do_vote(7)",
			"B×nh chän SBD 033 - Lª TuÊn Anh - zZ4NhH4iZz (m¸y chñ Hoµng Hæ	)/#do_vote(8)",
			"B×nh chän SBD 015 - Mai NguyÔn Minh Huy -  hi3px0ngz0ng(m¸y chñ B¹ch Hæ)/#do_vote(9)",
			"B×nh chän SBD 038 - Ph¹m ViÖt Dòng - policehotboy (m¸y chñ TrÝ Long)/#do_vote(10)",
			"B×nh chän SBD 050 - Qu¸ch Minh C­êng - o0oMichaelQuach (m¸y chñ Tµng Long)/#do_vote(11)",
			"B×nh chän SBD 047 - TrÇn Phó - xIxHeoAnh (m¸y chñ ViÖt ¦ng-)/#do_vote(1)",
			"B×nh chän SBD 007 - Ph¹m Thµnh Nh©n - phamthanhnhan (m¸y chñ ViÖt ¦ng)/#do_vote(2)",
			"B×nh chän SBD 090 - TrÇn ThÞ BÝch Ph­îng - o4ever (m¸y chñ B¹ch Hæ)/#do_vote(3)",
			"B×nh chän SBD 067 - Th¸i §ç ChÝ Minh - DuongBatMuoi (m¸y chñ TrÝ Long)/#do_vote(4)",
			"B×nh chän SBD 068 - T« HuyÒn Trinh - PeXjnhNgamy(m¸y chñ TrÝ Long)/#do_vote(5)",
		},
		[7] =
		{
			"B×nh chän SBD 093 - Lª M¹nh C­êng - ZxBinhThuongxZ (m¸y chñ Song Hæ)/#do_vote(7)",
			"B×nh chän SBD 033 - Lª TuÊn Anh - zZ4NhH4iZz (m¸y chñ Hoµng Hæ	)/#do_vote(8)",
			"B×nh chän SBD 015 - Mai NguyÔn Minh Huy -  hi3px0ngz0ng(m¸y chñ B¹ch Hæ)/#do_vote(9)",
			"B×nh chän SBD 038 - Ph¹m ViÖt Dòng - policehotboy (m¸y chñ TrÝ Long)/#do_vote(10)",
			"B×nh chän SBD 050 - Qu¸ch Minh C­êng - o0oMichaelQuach (m¸y chñ Tµng Long)/#do_vote(11)",
			"B×nh chän SBD 047 - TrÇn Phó - xIxHeoAnh (m¸y chñ ViÖt ¦ng-)/#do_vote(1)",
			"B×nh chän SBD 007 - Ph¹m Thµnh Nh©n - phamthanhnhan (m¸y chñ ViÖt ¦ng)/#do_vote(2)",
			"B×nh chän SBD 090 - TrÇn ThÞ BÝch Ph­îng - o4ever (m¸y chñ B¹ch Hæ)/#do_vote(3)",
			"B×nh chän SBD 067 - Th¸i §ç ChÝ Minh - DuongBatMuoi (m¸y chñ TrÝ Long)/#do_vote(4)",
			"B×nh chän SBD 068 - T« HuyÒn Trinh - PeXjnhNgamy(m¸y chñ TrÝ Long)/#do_vote(5)",
			"B×nh chän SBD 064 - Vâ Huy Vinh - zB¹chM·HoµngTöz (m¸y chñ Kú Hæ)/#do_vote(6)",
		},
		[8] =
		{
			"B×nh chän SBD 033 - Lª TuÊn Anh - zZ4NhH4iZz (m¸y chñ Hoµng Hæ	)/#do_vote(8)",
			"B×nh chän SBD 015 - Mai NguyÔn Minh Huy -  hi3px0ngz0ng(m¸y chñ B¹ch Hæ)/#do_vote(9)",
			"B×nh chän SBD 038 - Ph¹m ViÖt Dòng - policehotboy (m¸y chñ TrÝ Long)/#do_vote(10)",
			"B×nh chän SBD 050 - Qu¸ch Minh C­êng - o0oMichaelQuach (m¸y chñ Tµng Long)/#do_vote(11)",
			"B×nh chän SBD 047 - TrÇn Phó - xIxHeoAnh (m¸y chñ ViÖt ¦ng-)/#do_vote(1)",
			"B×nh chän SBD 007 - Ph¹m Thµnh Nh©n - phamthanhnhan (m¸y chñ ViÖt ¦ng)/#do_vote(2)",
			"B×nh chän SBD 090 - TrÇn ThÞ BÝch Ph­îng - o4ever (m¸y chñ B¹ch Hæ)/#do_vote(3)",
			"B×nh chän SBD 067 - Th¸i §ç ChÝ Minh - DuongBatMuoi (m¸y chñ TrÝ Long)/#do_vote(4)",
			"B×nh chän SBD 068 - T« HuyÒn Trinh - PeXjnhNgamy(m¸y chñ TrÝ Long)/#do_vote(5)",
			"B×nh chän SBD 064 - Vâ Huy Vinh - zB¹chM·HoµngTöz (m¸y chñ Kú Hæ)/#do_vote(6)",
			"B×nh chän SBD 093 - Lª M¹nh C­êng - ZxBinhThuongxZ (m¸y chñ Song Hæ)/#do_vote(7)",
		},
		[9] =
		{
			"B×nh chän SBD 015 - Mai NguyÔn Minh Huy -  hi3px0ngz0ng(m¸y chñ B¹ch Hæ)/#do_vote(9)",
			"B×nh chän SBD 038 - Ph¹m ViÖt Dòng - policehotboy (m¸y chñ TrÝ Long)/#do_vote(10)",
			"B×nh chän SBD 050 - Qu¸ch Minh C­êng - o0oMichaelQuach (m¸y chñ Tµng Long)/#do_vote(11)",
			"B×nh chän SBD 047 - TrÇn Phó - xIxHeoAnh (m¸y chñ ViÖt ¦ng-)/#do_vote(1)",
			"B×nh chän SBD 007 - Ph¹m Thµnh Nh©n - phamthanhnhan (m¸y chñ ViÖt ¦ng)/#do_vote(2)",
			"B×nh chän SBD 090 - TrÇn ThÞ BÝch Ph­îng - o4ever (m¸y chñ B¹ch Hæ)/#do_vote(3)",
			"B×nh chän SBD 067 - Th¸i §ç ChÝ Minh - DuongBatMuoi (m¸y chñ TrÝ Long)/#do_vote(4)",
			"B×nh chän SBD 068 - T« HuyÒn Trinh - PeXjnhNgamy(m¸y chñ TrÝ Long)/#do_vote(5)",
			"B×nh chän SBD 064 - Vâ Huy Vinh - zB¹chM·HoµngTöz (m¸y chñ Kú Hæ)/#do_vote(6)",
			"B×nh chän SBD 093 - Lª M¹nh C­êng - ZxBinhThuongxZ (m¸y chñ Song Hæ)/#do_vote(7)",
			"B×nh chän SBD 033 - Lª TuÊn Anh - zZ4NhH4iZz (m¸y chñ Hoµng Hæ	)/#do_vote(8)",
		},
		[10] =
		{
			"B×nh chän SBD 038 - Ph¹m ViÖt Dòng - policehotboy (m¸y chñ TrÝ Long)/#do_vote(10)",
			"B×nh chän SBD 050 - Qu¸ch Minh C­êng - o0oMichaelQuach (m¸y chñ Tµng Long)/#do_vote(11)",
			"B×nh chän SBD 047 - TrÇn Phó - xIxHeoAnh (m¸y chñ ViÖt ¦ng-)/#do_vote(1)",
			"B×nh chän SBD 007 - Ph¹m Thµnh Nh©n - phamthanhnhan (m¸y chñ ViÖt ¦ng)/#do_vote(2)",
			"B×nh chän SBD 090 - TrÇn ThÞ BÝch Ph­îng - o4ever (m¸y chñ B¹ch Hæ)/#do_vote(3)",
			"B×nh chän SBD 067 - Th¸i §ç ChÝ Minh - DuongBatMuoi (m¸y chñ TrÝ Long)/#do_vote(4)",
			"B×nh chän SBD 068 - T« HuyÒn Trinh - PeXjnhNgamy(m¸y chñ TrÝ Long)/#do_vote(5)",
			"B×nh chän SBD 064 - Vâ Huy Vinh - zB¹chM·HoµngTöz (m¸y chñ Kú Hæ)/#do_vote(6)",
			"B×nh chän SBD 093 - Lª M¹nh C­êng - ZxBinhThuongxZ (m¸y chñ Song Hæ)/#do_vote(7)",
			"B×nh chän SBD 033 - Lª TuÊn Anh - zZ4NhH4iZz (m¸y chñ Hoµng Hæ	)/#do_vote(8)",
			"B×nh chän SBD 015 - Mai NguyÔn Minh Huy -  hi3px0ngz0ng(m¸y chñ B¹ch Hæ)/#do_vote(9)",
		},
		[11] =
		{
			"B×nh chän SBD 050 - Qu¸ch Minh C­êng - o0oMichaelQuach (m¸y chñ Tµng Long)/#do_vote(11)",
			"B×nh chän SBD 047 - TrÇn Phó - xIxHeoAnh (m¸y chñ ViÖt ¦ng-)/#do_vote(1)",
			"B×nh chän SBD 007 - Ph¹m Thµnh Nh©n - phamthanhnhan (m¸y chñ ViÖt ¦ng)/#do_vote(2)",
			"B×nh chän SBD 090 - TrÇn ThÞ BÝch Ph­îng - o4ever (m¸y chñ B¹ch Hæ)/#do_vote(3)",
			"B×nh chän SBD 067 - Th¸i §ç ChÝ Minh - DuongBatMuoi (m¸y chñ TrÝ Long)/#do_vote(4)",
			"B×nh chän SBD 068 - T« HuyÒn Trinh - PeXjnhNgamy(m¸y chñ TrÝ Long)/#do_vote(5)",
			"B×nh chän SBD 064 - Vâ Huy Vinh - zB¹chM·HoµngTöz (m¸y chñ Kú Hæ)/#do_vote(6)",
			"B×nh chän SBD 093 - Lª M¹nh C­êng - ZxBinhThuongxZ (m¸y chñ Song Hæ)/#do_vote(7)",
			"B×nh chän SBD 033 - Lª TuÊn Anh - zZ4NhH4iZz (m¸y chñ Hoµng Hæ	)/#do_vote(8)",
			"B×nh chän SBD 015 - Mai NguyÔn Minh Huy -  hi3px0ngz0ng(m¸y chñ B¹ch Hæ)/#do_vote(9)",
			"B×nh chän SBD 038 - Ph¹m ViÖt Dòng - policehotboy (m¸y chñ TrÝ Long)/#do_vote(10)",
		},
		
}

	local nRand = random(1,11)
	local tSay = tList[nRand]
	
	local szHeader = "<color=green>"..szName.." :<color>Chµo mõng quý ®ång ®¹o tham gia  cuéc thi <color=red>B×nh chän ho¹t ®éng Karaoke Vâ L©m 2<color>. H·y b×nh chän cho thÝ sinh mµ ®ång ®¹o c¶m thÊy Ên t­îng nhÊt trong danh s¸ch d­íi ®©y:"
	
	tinsert(tSay, "Xem h­íng dÉn/do_guide")
	tinsert(tSay, "Ta chØ ghÐ ngang./do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_vote(nType)

	local szLogTitle = "B×nh chän Karaoke"
	local szName = "<color=green>ThÇn T­îng Vâ L©m :<color>"
	
	if GetLevel() < 77 then
		Talk(1, "", "§¼ng cÊp 77 trë lªn míi cã thÓ tham gia b×nh chän!")
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "Ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia b×nh chän!")
		return
	end
	
	SetTaskTemp(TSK_KARAOKETEMP, nType) 
	
	WinFlowerNumber()
	
end

function do_guide()
	local szName = "ThÇn T­îng Vâ L©m"
	local tSay = {}
	local szHeader = "<color=green>"..szName.." :<color> Ch­¬ng tr×nh b×nh chän ho¹t ®éng Karaoke diÔn ra tõ ngµy 19/05/2011 ®Õn 2/06/2011. Trong thêi gian b×nh chän, ®ång ®¹o cã thÓ sö dông ®¹o cô bã hoa chiÕn th¾ng ®Ó b×nh chän cho nh©n vËt ThÇn T­îng cña m×nh. Tõ bã hoa thø 1.001 trë ®i, ng­êi ch¬i chØ nhËn ®­îc ®iÓm b×nh chän. "
	
	tinsert(tSay, "Xem th«ng tin kh¸c/main")
	
	Say(szHeader, getn(tSay), tSay)
end

function WinFlowerNumber()
	AskClientForNumber("WinFlower",1,999,"Sè bã hoa chiÕn th¾ng !")
end

function WinFlower( nCount)
	
	local tVoteName =
	{
		"047 - TrÇn Phó",
		"007 - Ph¹m Thµnh Nh©n",
		"090 - TrÇn ThÞ BÝch Ph­îng",
		"067 - Th¸i §ç ChÝ Minh",
		"068 - T« HuyÒn Trinh",
		"064 - Vâ Huy Vinh",
		"093 - Lª M¹nh C­êng",
		"033 - Lª TuÊn Anh",
		"015 - Mai NguyÔn Minh Huy",
		"038 - Ph¹m ViÖt Dòng",
		"050 - Qu¸ch Minh C­êng",
	}
	
	if  nCount < 1 or nCount > 999  then
		Msg2Player("Sè bã hoa chiÕn th¾ng nhËp vµo kh«ng hîp lÖ")
		return
	end
	if GetItemCount(2, 1, 30296)  < nCount  then
		Msg2Player("Hµnh trang ®¹i hiÖp kh«ng ®ñ "..nCount.." bã hoa chiÕn th¾ng!!")
		return
	end
	local nVotedCount = GetTask(TSK_KARAOKE)
	local nWinFlower = 0
	local nExpCount = 0
	local nMark = 0;
	
	if nVotedCount >= 1000 then
		 nWinFlower = nCount
		 nMark = nWinFlower * 20
	else
		local nTotalVoted =  nVotedCount + nCount
		if nTotalVoted > 1000  then
			nWinFlower = nTotalVoted - 1000
			nExpCount = 1000 -  nVotedCount
			nMark = nExpCount * 10 + nWinFlower * 20
		else
			nWinFlower = nCount
			nExpCount = nCount
			nMark = nCount * 10
		end
	end
	
	if nExpCount == 0 then
		if DelItem(2, 1, 30296, nCount) == 1  then
			SetTask(TSK_KARAOKE, GetTask(TSK_KARAOKE) + nWinFlower)
		end
	else
		if DelItem(2, 1, 30296, nCount) == 1  then
			SetTask(TSK_KARAOKE, GetTask(TSK_KARAOKE) + nWinFlower)
			local nExp = nExpCount * 250000
			ModifyExp(nExp)
			Msg2Player("NhËn ®­îc  "..nExp.." ®iÓm kinh nghiÖm!")
		end
	end
	
	local nType  = GetTaskTemp(TSK_KARAOKETEMP)
	
	gf_WriteLogEx(szLogTitle, "Tham gia b×nh chän", nMark, tVoteName[nType])
	
	Talk(1,"","Sè ®iÓm b¹n b×nh chän cho "..tVoteName[nType] .. " " .. nMark)
end

function do_nothing()

end