Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");

function main()
	local nDate =  tonumber(date("%y%m%d"))
	if nDate < 110909 or nDate > 110918 then
		Talk(1, "", "§· hÕt h¹n b×nh chän!")
		return
	end
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Chµo mõng quý ®ång ®¹o tham gia  cuéc thi <color=red>B×nh chän s¸ng t¸c truyÖn tranh Vâ L©m 2<color>. H·y b×nh chän cho bé truyÖn mµ ®ång ®¹o c¶m thÊy Ên t­îng nhÊt trong danh s¸ch d­íi ®©y:"
	local tbSayDialog = {};
	local nSaySize = 0;
	
	if GetLevel() < 77 then
		Talk(1, "", "§¼ng cÊp 77 trë lªn míi cã thÓ tham gia b×nh chän!")
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "Ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia b×nh chän!")
		return
	end
	
	tinsert(tbSayDialog, "Xem h­íng dÉn/do_guide")
	tinsert(tbSayDialog, "Xem sè lÇn b¹n ®· b×nh chän /num_infor")
	tinsert(tbSayDialog, "Ta muèn b×nh chän TruyÖn Tranh/do_vote_1")
	tinsert(tbSayDialog, "Ta muèn b×nh chän Ký Häa/do_vote_2")
	tinsert(tbSayDialog, "Ta chØ ghÐ ngang./do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)		
	
end

function do_vote_1()
	local tListTruyenTranh = {
			[1] = 
			{
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng/#confirm_do_vote(1,1)",	
				"Tû Vâ - §Æng Minh Träng/#confirm_do_vote(2,1)",	
				"Anh hïng m¾c m­u - D­ Thanh Vò/#confirm_do_vote(3,1)",	
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o/#confirm_do_vote(5,1)",	
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam/#confirm_do_vote(6,1)",	
				"Lçi t¹i ai - NguyÔn Vò B¶o/#confirm_do_vote(7,1)",
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng/#confirm_do_vote(8,1)",
				"Danh T­íng - Th©n Quang D­¬ng/#confirm_do_vote(9,1)",	
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy/#confirm_do_vote(10,1)",	
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh/#confirm_do_vote(11,1)",	
			},
			[2] =
			{
				"Tû Vâ - §Æng Minh Träng/#confirm_do_vote(2,1)",	
				"Anh hïng m¾c m­u - D­ Thanh Vò/#confirm_do_vote(3,1)",	
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o/#confirm_do_vote(5,1)",	
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam/#confirm_do_vote(6,1)",	
				"Lçi t¹i ai - NguyÔn Vò B¶o/#confirm_do_vote(7,1)",
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng/#confirm_do_vote(8,1)",
				"Danh T­íng - Th©n Quang D­¬ng/#confirm_do_vote(9,1)",	
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy/#confirm_do_vote(10,1)",	
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh/#confirm_do_vote(11,1)",	
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng/#confirm_do_vote(1,1)",	
			},
			[3] =
			{
				"Anh hïng m¾c m­u - D­ Thanh Vò/#confirm_do_vote(3,1)",	
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o/#confirm_do_vote(5,1)",	
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam/#confirm_do_vote(6,1)",	
				"Lçi t¹i ai - NguyÔn Vò B¶o/#confirm_do_vote(7,1)",
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng/#confirm_do_vote(8,1)",
				"Danh T­íng - Th©n Quang D­¬ng/#confirm_do_vote(9,1)",	
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy/#confirm_do_vote(10,1)",	
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh/#confirm_do_vote(11,1)",	
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng/#confirm_do_vote(1,1)",	
				"Tû Vâ - §Æng Minh Träng/#confirm_do_vote(2,1)",	
			},
			[4] =
			{
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o/#confirm_do_vote(5,1)",	
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam/#confirm_do_vote(6,1)",	
				"Lçi t¹i ai - NguyÔn Vò B¶o/#confirm_do_vote(7,1)",
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng/#confirm_do_vote(8,1)",
				"Danh T­íng - Th©n Quang D­¬ng/#confirm_do_vote(9,1)",	
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy/#confirm_do_vote(10,1)",	
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh/#confirm_do_vote(11,1)",	
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng/#confirm_do_vote(1,1)",	
				"Tû Vâ - §Æng Minh Träng/#confirm_do_vote(2,1)",	
				"Anh hïng m¾c m­u - D­ Thanh Vò/#confirm_do_vote(3,1)",	
			},
			[5] =
			{
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o/#confirm_do_vote(5,1)",	
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam/#confirm_do_vote(6,1)",	
				"Lçi t¹i ai - NguyÔn Vò B¶o/#confirm_do_vote(7,1)",
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng/#confirm_do_vote(8,1)",
				"Danh T­íng - Th©n Quang D­¬ng/#confirm_do_vote(9,1)",	
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy/#confirm_do_vote(10,1)",	
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh/#confirm_do_vote(11,1)",	
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng/#confirm_do_vote(1,1)",	
				"Tû Vâ - §Æng Minh Träng/#confirm_do_vote(2,1)",	
				"Anh hïng m¾c m­u - D­ Thanh Vò/#confirm_do_vote(3,1)",	
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung/#confirm_do_vote(4,1)",	
			},
			[6] =
			{
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam/#confirm_do_vote(6,1)",	
				"Lçi t¹i ai - NguyÔn Vò B¶o/#confirm_do_vote(7,1)",
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng/#confirm_do_vote(8,1)",
				"Danh T­íng - Th©n Quang D­¬ng/#confirm_do_vote(9,1)",	
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy/#confirm_do_vote(10,1)",	
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh/#confirm_do_vote(11,1)",	
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng/#confirm_do_vote(1,1)",	
				"Tû Vâ - §Æng Minh Träng/#confirm_do_vote(2,1)",	
				"Anh hïng m¾c m­u - D­ Thanh Vò/#confirm_do_vote(3,1)",	
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o/#confirm_do_vote(5,1)",	
			},
			[7] =
			{
				"Lçi t¹i ai - NguyÔn Vò B¶o/#confirm_do_vote(7,1)",
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng/#confirm_do_vote(8,1)",
				"Danh T­íng - Th©n Quang D­¬ng/#confirm_do_vote(9,1)",	
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy/#confirm_do_vote(10,1)",	
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh/#confirm_do_vote(11,1)",	
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng/#confirm_do_vote(1,1)",	
				"Tû Vâ - §Æng Minh Träng/#confirm_do_vote(2,1)",	
				"Anh hïng m¾c m­u - D­ Thanh Vò/#confirm_do_vote(3,1)",	
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o/#confirm_do_vote(5,1)",	
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam/#confirm_do_vote(6,1)",	
			},
			[8] =
			{
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng/#confirm_do_vote(8,1)",
				"Danh T­íng - Th©n Quang D­¬ng/#confirm_do_vote(9,1)",	
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy/#confirm_do_vote(10,1)",	
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh/#confirm_do_vote(11,1)",	
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng/#confirm_do_vote(1,1)",	
				"Tû Vâ - §Æng Minh Träng/#confirm_do_vote(2,1)",	
				"Anh hïng m¾c m­u - D­ Thanh Vò/#confirm_do_vote(3,1)",	
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o/#confirm_do_vote(5,1)",	
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam/#confirm_do_vote(6,1)",	
				"Lçi t¹i ai - NguyÔn Vò B¶o/#confirm_do_vote(7,1)",
			},
			[9] =
			{
				"Danh T­íng - Th©n Quang D­¬ng/#confirm_do_vote(9,1)",	
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy/#confirm_do_vote(10,1)",	
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh/#confirm_do_vote(11,1)",	
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng/#confirm_do_vote(1,1)",	
				"Tû Vâ - §Æng Minh Träng/#confirm_do_vote(2,1)",	
				"Anh hïng m¾c m­u - D­ Thanh Vò/#confirm_do_vote(3,1)",	
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o/#confirm_do_vote(5,1)",	
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam/#confirm_do_vote(6,1)",	
				"Lçi t¹i ai - NguyÔn Vò B¶o/#confirm_do_vote(7,1)",
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng/#confirm_do_vote(8,1)",
			},
			[10] =
			{
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy/#confirm_do_vote(10,1)",	
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh/#confirm_do_vote(11,1)",	
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng/#confirm_do_vote(1,1)",	
				"Tû Vâ - §Æng Minh Träng/#confirm_do_vote(2,1)",	
				"Anh hïng m¾c m­u - D­ Thanh Vò/#confirm_do_vote(3,1)",	
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o/#confirm_do_vote(5,1)",	
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam/#confirm_do_vote(6,1)",	
				"Lçi t¹i ai - NguyÔn Vò B¶o/#confirm_do_vote(7,1)",
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng/#confirm_do_vote(8,1)",
				"Danh T­íng - Th©n Quang D­¬ng/#confirm_do_vote(9,1)",	
			},
			[11] =
			{
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh/#confirm_do_vote(11,1)",	
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng/#confirm_do_vote(1,1)",	
				"Tû Vâ - §Æng Minh Träng/#confirm_do_vote(2,1)",	
				"Anh hïng m¾c m­u - D­ Thanh Vò/#confirm_do_vote(3,1)",	
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o/#confirm_do_vote(5,1)",	
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam/#confirm_do_vote(6,1)",	
				"Lçi t¹i ai - NguyÔn Vò B¶o/#confirm_do_vote(7,1)",
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng/#confirm_do_vote(8,1)",
				"Danh T­íng - Th©n Quang D­¬ng/#confirm_do_vote(9,1)",	
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy/#confirm_do_vote(10,1)",	
			},		
	}
	local nRand = random(1,11)
	local tSay = tListTruyenTranh[nRand]
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Chµo mõng quý ®ång ®¹o tham gia  cuéc thi <color=red>B×nh chän s¸ng t¸c truyÖn tranh Vâ L©m 2<color>. H·y b×nh chän cho bé truyÖn mµ ®ång ®¹o c¶m thÊy Ên t­îng nhÊt trong danh s¸ch d­íi ®©y:"
	
	tinsert(tSay, "Xem th«ng tin kh¸c/main")
	Say(szHeader, getn(tSay), tSay)
		
end

function do_vote_2()
	local tListKyHoa = {
			[1] = 
			{
				"XÝch Thè Dám - D­¬ng Hå Vi §¹i Th¹ch/#confirm_do_vote(1,2)",	
				"Chóc bÐ ngñ ngon - Ng« Hång Nam/#confirm_do_vote(2,2)",	
				"Kh«ng ph¶i lµ - Lª V¨n Th­¬ng/#confirm_do_vote(3,2)",	
				"Truy t×m b¸u vËt - §Æng Vò Hoµng/#confirm_do_vote(4,2)",	
				"LuyÖn c«ng - NguyÔn Quang HiÕu/#confirm_do_vote(5,2)",	
				"S¨n Thá - TrÇn Ngäc YÕn Trang/#confirm_do_vote(6,2)",	
				"C­íp - Hoµng TrÇn S¬n/#confirm_do_vote(7,2)",	
				"TÕt Trung thu - TrÇn Ngäc YÕn Trang/#confirm_do_vote(8,2)",	
				"V« ¶nh C­íc - NguyÔn Vò B¶o/#confirm_do_vote(9,2)",	
				"Mü Nh©n KÕ - NguyÔn Th¶o Linh/#confirm_do_vote(10,2)",	
			},
			[2] =
			{
				"Chóc bÐ ngñ ngon - Ng« Hång Nam/#confirm_do_vote(2,2)",	
				"Kh«ng ph¶i lµ - Lª V¨n Th­¬ng/#confirm_do_vote(3,2)",	
				"Truy t×m b¸u vËt - §Æng Vò Hoµng/#confirm_do_vote(4,2)",	
				"LuyÖn c«ng - NguyÔn Quang HiÕu/#confirm_do_vote(5,2)",	
				"S¨n Thá - TrÇn Ngäc YÕn Trang/#confirm_do_vote(6,2)",	
				"C­íp - Hoµng TrÇn S¬n/#confirm_do_vote(7,2)",	
				"TÕt Trung thu - TrÇn Ngäc YÕn Trang/#confirm_do_vote(8,2)",	
				"V« ¶nh C­íc - NguyÔn Vò B¶o/#confirm_do_vote(9,2)",	
				"Mü Nh©n KÕ - NguyÔn Th¶o Linh/#confirm_do_vote(10,2)",	
				"XÝch Thè Dám - D­¬ng Hå Vi §¹i Th¹ch/#confirm_do_vote(1,2)",	
			},
			[3] =
			{
				"Kh«ng ph¶i lµ - Lª V¨n Th­¬ng/#confirm_do_vote(3,2)",	
				"Truy t×m b¸u vËt - §Æng Vò Hoµng/#confirm_do_vote(4,2)",	
				"LuyÖn c«ng - NguyÔn Quang HiÕu/#confirm_do_vote(5,2)",	
				"S¨n Thá - TrÇn Ngäc YÕn Trang/#confirm_do_vote(6,2)",	
				"C­íp - Hoµng TrÇn S¬n/#confirm_do_vote(7,2)",	
				"TÕt Trung thu - TrÇn Ngäc YÕn Trang/#confirm_do_vote(8,2)",	
				"V« ¶nh C­íc - NguyÔn Vò B¶o/#confirm_do_vote(9,2)",	
				"Mü Nh©n KÕ - NguyÔn Th¶o Linh/#confirm_do_vote(10,2)",	
				"XÝch Thè Dám - D­¬ng Hå Vi §¹i Th¹ch/#confirm_do_vote(1,2)",	
				"Chóc bÐ ngñ ngon - Ng« Hång Nam/#confirm_do_vote(2,2)",	
			},
			[4] =
			{
				"Truy t×m b¸u vËt - §Æng Vò Hoµng/#confirm_do_vote(4,2)",	
				"LuyÖn c«ng - NguyÔn Quang HiÕu/#confirm_do_vote(5,2)",	
				"S¨n Thá - TrÇn Ngäc YÕn Trang/#confirm_do_vote(6,2)",	
				"C­íp - Hoµng TrÇn S¬n/#confirm_do_vote(7,2)",	
				"TÕt Trung thu - TrÇn Ngäc YÕn Trang/#confirm_do_vote(8,2)",	
				"V« ¶nh C­íc - NguyÔn Vò B¶o/#confirm_do_vote(9,2)",	
				"Mü Nh©n KÕ - NguyÔn Th¶o Linh/#confirm_do_vote(10,2)",	
				"XÝch Thè Dám - D­¬ng Hå Vi §¹i Th¹ch/#confirm_do_vote(1,2)",	
				"Chóc bÐ ngñ ngon - Ng« Hång Nam/#confirm_do_vote(2,2)",	
				"Kh«ng ph¶i lµ - Lª V¨n Th­¬ng/#confirm_do_vote(3,2)",	
			},
			[5] =
			{
				"LuyÖn c«ng - NguyÔn Quang HiÕu/#confirm_do_vote(5,2)",	
				"S¨n Thá - TrÇn Ngäc YÕn Trang/#confirm_do_vote(6,2)",	
				"C­íp - Hoµng TrÇn S¬n/#confirm_do_vote(7,2)",	
				"TÕt Trung thu - TrÇn Ngäc YÕn Trang/#confirm_do_vote(8,2)",	
				"V« ¶nh C­íc - NguyÔn Vò B¶o/#confirm_do_vote(9,2)",	
				"Mü Nh©n KÕ - NguyÔn Th¶o Linh/#confirm_do_vote(10,2)",	
				"XÝch Thè Dám - D­¬ng Hå Vi §¹i Th¹ch/#confirm_do_vote(1,2)",	
				"Chóc bÐ ngñ ngon - Ng« Hång Nam/#confirm_do_vote(2,2)",	
				"Kh«ng ph¶i lµ - Lª V¨n Th­¬ng/#confirm_do_vote(3,2)",	
				"Truy t×m b¸u vËt - §Æng Vò Hoµng/#confirm_do_vote(4,2)",	
			},
			[6] =
			{
				"S¨n Thá - TrÇn Ngäc YÕn Trang/#confirm_do_vote(6,2)",	
				"C­íp - Hoµng TrÇn S¬n/#confirm_do_vote(7,2)",	
				"TÕt Trung thu - TrÇn Ngäc YÕn Trang/#confirm_do_vote(8,2)",	
				"V« ¶nh C­íc - NguyÔn Vò B¶o/#confirm_do_vote(9,2)",	
				"Mü Nh©n KÕ - NguyÔn Th¶o Linh/#confirm_do_vote(10,2)",	
				"XÝch Thè Dám - D­¬ng Hå Vi §¹i Th¹ch/#confirm_do_vote(1,2)",	
				"Chóc bÐ ngñ ngon - Ng« Hång Nam/#confirm_do_vote(2,2)",	
				"Kh«ng ph¶i lµ - Lª V¨n Th­¬ng/#confirm_do_vote(3,2)",	
				"Truy t×m b¸u vËt - §Æng Vò Hoµng/#confirm_do_vote(4,2)",	
				"LuyÖn c«ng - NguyÔn Quang HiÕu/#confirm_do_vote(5,2)",	
			},
			[7] =
			{
				"C­íp - Hoµng TrÇn S¬n/#confirm_do_vote(7,2)",	
				"TÕt Trung thu - TrÇn Ngäc YÕn Trang/#confirm_do_vote(8,2)",	
				"V« ¶nh C­íc - NguyÔn Vò B¶o/#confirm_do_vote(9,2)",	
				"Mü Nh©n KÕ - NguyÔn Th¶o Linh/#confirm_do_vote(10,2)",	
				"XÝch Thè Dám - D­¬ng Hå Vi §¹i Th¹ch/#confirm_do_vote(1,2)",	
				"Chóc bÐ ngñ ngon - Ng« Hång Nam/#confirm_do_vote(2,2)",	
				"Kh«ng ph¶i lµ - Lª V¨n Th­¬ng/#confirm_do_vote(3,2)",	
				"Truy t×m b¸u vËt - §Æng Vò Hoµng/#confirm_do_vote(4,2)",	
				"LuyÖn c«ng - NguyÔn Quang HiÕu/#confirm_do_vote(5,2)",	
				"S¨n Thá - TrÇn Ngäc YÕn Trang/#confirm_do_vote(6,2)",	
			},
			[8] =
			{
				"TÕt Trung thu - TrÇn Ngäc YÕn Trang/#confirm_do_vote(8,2)",	
				"V« ¶nh C­íc - NguyÔn Vò B¶o/#confirm_do_vote(9,2)",	
				"Mü Nh©n KÕ - NguyÔn Th¶o Linh/#confirm_do_vote(10,2)",	
				"XÝch Thè Dám - D­¬ng Hå Vi §¹i Th¹ch/#confirm_do_vote(1,2)",	
				"Chóc bÐ ngñ ngon - Ng« Hång Nam/#confirm_do_vote(2,2)",	
				"Kh«ng ph¶i lµ - Lª V¨n Th­¬ng/#confirm_do_vote(3,2)",	
				"Truy t×m b¸u vËt - §Æng Vò Hoµng/#confirm_do_vote(4,2)",	
				"LuyÖn c«ng - NguyÔn Quang HiÕu/#confirm_do_vote(5,2)",	
				"S¨n Thá - TrÇn Ngäc YÕn Trang/#confirm_do_vote(6,2)",	
				"C­íp - Hoµng TrÇn S¬n/#confirm_do_vote(7,2)",	
			},
			[9] =
			{
				"V« ¶nh C­íc - NguyÔn Vò B¶o/#confirm_do_vote(9,2)",	
				"Mü Nh©n KÕ - NguyÔn Th¶o Linh/#confirm_do_vote(10,2)",	
				"XÝch Thè Dám - D­¬ng Hå Vi §¹i Th¹ch/#confirm_do_vote(1,2)",	
				"Chóc bÐ ngñ ngon - Ng« Hång Nam/#confirm_do_vote(2,2)",	
				"Kh«ng ph¶i lµ - Lª V¨n Th­¬ng/#confirm_do_vote(3,2)",	
				"Truy t×m b¸u vËt - §Æng Vò Hoµng/#confirm_do_vote(4,2)",	
				"LuyÖn c«ng - NguyÔn Quang HiÕu/#confirm_do_vote(5,2)",	
				"S¨n Thá - TrÇn Ngäc YÕn Trang/#confirm_do_vote(6,2)",	
				"C­íp - Hoµng TrÇn S¬n/#confirm_do_vote(7,2)",	
				"TÕt Trung thu - TrÇn Ngäc YÕn Trang/#confirm_do_vote(8,2)",	
			},
			[10] =
			{
				"Mü Nh©n KÕ - NguyÔn Th¶o Linh/#confirm_do_vote(10,2)",	
				"XÝch Thè Dám - D­¬ng Hå Vi §¹i Th¹ch/#confirm_do_vote(1,2)",	
				"Chóc bÐ ngñ ngon - Ng« Hång Nam/#confirm_do_vote(2,2)",	
				"Kh«ng ph¶i lµ - Lª V¨n Th­¬ng/#confirm_do_vote(3,2)",	
				"Truy t×m b¸u vËt - §Æng Vò Hoµng/#confirm_do_vote(4,2)",	
				"LuyÖn c«ng - NguyÔn Quang HiÕu/#confirm_do_vote(5,2)",	
				"S¨n Thá - TrÇn Ngäc YÕn Trang/#confirm_do_vote(6,2)",	
				"C­íp - Hoµng TrÇn S¬n/#confirm_do_vote(7,2)",	
				"TÕt Trung thu - TrÇn Ngäc YÕn Trang/#confirm_do_vote(8,2)",	
				"V« ¶nh C­íc - NguyÔn Vò B¶o/#confirm_do_vote(9,2)",	
			},
	}
	
	local nRand = random(1,10)
	local tSay = tListKyHoa[nRand]
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Chµo mõng quý ®ång ®¹o tham gia  cuéc thi <color=red>B×nh chän s¸ng t¸c truyÖn tranh Vâ L©m 2<color>. H·y b×nh chän cho bé truyÖn mµ ®ång ®¹o c¶m thÊy Ên t­îng nhÊt trong danh s¸ch d­íi ®©y:"

	tinsert(tSay, "Xem th«ng tin kh¸c/main")
	Say(szHeader, getn(tSay), tSay)
	
end

function confirm_do_vote(nNum, nType)
	
	SetTaskTemp(TSK_KARAOKETEMP, nType) 
	SetTaskTemp(TSK_KARAOKETEMP, GetTaskTemp(TSK_KARAOKETEMP) + nNum * 10) 
	
	WinFlowerNumber()

end

function do_guide()
	local szName = "La Sa"
	local tSay = {}
	local szHeader = "<color=green>"..szName.." :<color> Ch­¬ng tr×nh b×nh chän s¸ng t¸c truyÖn tranh Vâ L©m 2 diÔn ra tõ ngµy 09/09/2011 ®Õn 18/9/2011. Trong thêi gian b×nh chän, ®ång ®¹o cã thÓ sö dông b¸nh Trung Thu ®Ó b×nh chän cho bé truyÖn thÇn t­îng cña m×nh. Tõ b¸nh Trung Thu thø 2001 trë ®i, ng­êi ch¬i chØ nhËn ®­îc ®iÓm b×nh chän. "
	
	tinsert(tSay, "Xem th«ng tin kh¸c/main")
	
	Say(szHeader, getn(tSay), tSay)
end

function WinFlowerNumber()
	AskClientForNumber("VoteNum",1,999,"Sè b¸nh Trung Thu!")
end

function VoteNum( nCount)
	
	local tVoteName =
	{
		[1] = 
			{
				"ThÇn Hµnh B¶o §iÓn - Phan H÷u Hoµng",
				"Tû Vâ - §Æng Minh Träng",
				"Anh hïng m¾c m­u - D­ Thanh Vò",
				"C¸i Bang ®¹i ®Ö tö - §inh ThÞ Hång Nhung",
				"Ngao Du Thiªn H¹ - NguyÔn Quèc B¶o",
				"S¬n Tinh Thñy Tinh Vâ L©m II - NguyÔn V¨n Nam",
				"Lçi t¹i ai - NguyÔn Vò B¶o",
				"T©n Hïng V­¬ng kÐn rÓ - NguyÔn Thµnh C«ng",
				"Danh T­íng - Th©n Quang D­¬ng",
				"Chuyªn gia lõa bÞp - NguyÔn Ngäc Huy",
				"Th¸m tö lõng danh - NguyÔn H÷u Vinh",
			},
		[2] = 
			{
				"XÝch Thè Dám - D­¬ng Hå Vi §¹i Th¹ch",
				"Chóc bÐ ngñ ngon - Ng« Hång Nam",
				"Kh«ng ph¶i lµ - Lª V¨n Th­¬ng",
				"Truy t×m b¸u vËt - §Æng Vò Hoµng",
				"LuyÖn c«ng - NguyÔn Quang HiÕu",
				"S¨n Thá - TrÇn Ngäc YÕn Trang",
				"C­íp - Hoµng TrÇn S¬n",
				"TÕt Trung thu - TrÇn Ngäc YÕn Trang",
				"V« ¶nh C­íc - NguyÔn Vò B¶o",
				"Mü Nh©n KÕ - NguyÔn Th¶o Linh",				
			},
	}
	
	if  nCount < 1 or nCount > 999  then
		Msg2Player("Sè b¸nh Trung Thu nhËp vµo kh«ng hîp lÖ")
		return
	end
	if GetItemCount(2, 1, 30326)  < nCount  then 
		Msg2Player("Hµnh trang ®¹i hiÖp kh«ng ®ñ "..nCount.." b¸nh Trung Thu!!")
		return
	end
	local nVotedCount = GetTask(TSK_TRUYENTRANH)
	local nWinFlower = 0
	local nExpCount = 0
	local nMark = 0;
	
	if nVotedCount >= 2000 then
		 nWinFlower = nCount
		 nMark = nWinFlower * 1
	else
		local nTotalVoted =  nVotedCount + nCount
		if nTotalVoted >= 2000  then
			nWinFlower = nTotalVoted - 2000
			nExpCount = 2000 -  nVotedCount
			nMark = nExpCount * 1 + nWinFlower * 1
		else
			nWinFlower = nCount
			nExpCount = nCount
			nMark = nCount * 1
		end
	end
	
--	
--	if nExpCount ~= 0 and DelItem(2, 1, 30326, nCount) == 1 then
--		SetTask(TSK_TRUYENTRANH, GetTask(TSK_TRUYENTRANH) + nMark)
--		local nExp = nExpCount * 250000
--		ModifyExp(nExp)
--		Msg2Player("NhËn ®­îc  "..nExp.." ®iÓm kinh nghiÖm!")
--	else
--		SetTask(TSK_TRUYENTRANH, GetTask(TSK_TRUYENTRANH) + nMark)
--	end
--	
	if nExpCount == 0 then
		if DelItem(2, 1, 30326, nCount) == 1  then
			SetTask(TSK_TRUYENTRANH, GetTask(TSK_TRUYENTRANH) + nMark)
		end
	else
		if DelItem(2, 1, 30326, nCount) == 1  then
			SetTask(TSK_TRUYENTRANH, GetTask(TSK_TRUYENTRANH) + nMark)
			local nExp = nExpCount * 250000
			ModifyExp(nExp)
			Msg2Player("NhËn ®­îc  "..nExp.." ®iÓm kinh nghiÖm!")
		end
	end
	
	local nType  = mod(GetTaskTemp(TSK_KARAOKETEMP), 10)
	local nNum = floor(GetTaskTemp(TSK_KARAOKETEMP)/10)
	
	local szLogTitle = "Binh chon sang tac truyen tranh"
	if nType == 2 then
		szLogTitle = "Binh chon sang tac ky hoa"
	end	
	gf_WriteLogEx(szLogTitle, "Tham gia b×nh chän ",nMark, tVoteName[nType][nNum])
	Talk(1,"","Sè ®iÓm b¹n b×nh chän cho "..tVoteName[nType][nNum] .. " " .. nMark)
end

function num_infor()
	local nNum = GetTask(TSK_TRUYENTRANH)
	Talk(1,"","B¹n ®· b×nh chän ®­îc <color=red>"..nNum.."<color> lÇn!!!")
end

function do_nothing()

end