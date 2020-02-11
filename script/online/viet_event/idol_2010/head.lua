Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");

function main()
	local nDate =  tonumber(date("%y%m%d"))
	if nDate < 100816 or nDate > 100829 then
		return
	end
	local szName = "ThÇn T­îng Vâ L©m"
	local tList = {
		[1] = 
		{
		"Ta muèn b×nh chän thÇn t­îng 62 - D­¬ng TuÊn Tó (m¸y chñ XÝch Long)/#do_vote(1)",
		"Ta muèn b×nh chän thÇn t­îng 17 - Vò ThÞ Thanh Nhµn (m¸y chñ §¹i Hæ)/#do_vote(2)",
		"Ta muèn b×nh chän thÇn t­îng 15 - NguyÔn H¶i An (m¸y chñ QuyÒn Long)/#do_vote(3)",
		"Ta muèn b×nh chän thÇn t­îng 48 - TrÇn H÷u Ph­íc (m¸y chñ Kú ¦ng)/#do_vote(4)",
		"Ta muèn b×nh chän thÇn t­îng 213 - Ph¹m Minh Ch©u (m¸y chñ Tiªn Phông)/#do_vote(5)",
		"Ta muèn b×nh chän thÇn t­îng 52 - Ng« §×nh Giang TriÒu (m¸y chñ §¹i ¦ng)/#do_vote(6)",
		"Ta muèn b×nh chän thÇn t­îng 230 - NguyÔn Minh HiÒn (m¸y chñ B¹ch ¦ng)/#do_vote(7)",
		"Ta muèn b×nh chän thÇn t­îng 276 - Ph¹m Ngäc Thïy Dung (m¸y chñ Phi Hæ)/#do_vote(8)",
		"Ta muèn b×nh chän thÇn t­îng 206 - TrÇn Kiªn (m¸y chñ Hoµng Hæ)/#do_vote(9)",
		"Ta muèn b×nh chän thÇn t­îng 280 - Tr­¬ng NhÊt CÈm Thy (m¸y chñ Phi ¦ng)/#do_vote(10)",
		},
		[2] = 
		{
		"Ta muèn b×nh chän thÇn t­îng 17 - Vò ThÞ Thanh Nhµn (m¸y chñ §¹i Hæ)/#do_vote(2)",
		"Ta muèn b×nh chän thÇn t­îng 15 - NguyÔn H¶i An (m¸y chñ QuyÒn Long)/#do_vote(3)",
		"Ta muèn b×nh chän thÇn t­îng 48 - TrÇn H÷u Ph­íc (m¸y chñ Kú ¦ng)/#do_vote(4)",
		"Ta muèn b×nh chän thÇn t­îng 213 - Ph¹m Minh Ch©u (m¸y chñ Tiªn Phông)/#do_vote(5)",
		"Ta muèn b×nh chän thÇn t­îng 52 - Ng« §×nh Giang TriÒu (m¸y chñ §¹i ¦ng)/#do_vote(6)",
		"Ta muèn b×nh chän thÇn t­îng 230 - NguyÔn Minh HiÒn (m¸y chñ B¹ch ¦ng)/#do_vote(7)",
		"Ta muèn b×nh chän thÇn t­îng 276 - Ph¹m Ngäc Thïy Dung (m¸y chñ Phi Hæ)/#do_vote(8)",
		"Ta muèn b×nh chän thÇn t­îng 206 - TrÇn Kiªn (m¸y chñ Hoµng Hæ)/#do_vote(9)",
		"Ta muèn b×nh chän thÇn t­îng 280 - Tr­¬ng NhÊt CÈm Thy (m¸y chñ Phi ¦ng)/#do_vote(10)",
		"Ta muèn b×nh chän thÇn t­îng 62 - D­¬ng TuÊn Tó (m¸y chñ XÝch Long)/#do_vote(1)",
		},
		[3] = 
		{		
		"Ta muèn b×nh chän thÇn t­îng 15 - NguyÔn H¶i An (m¸y chñ QuyÒn Long)/#do_vote(3)",
		"Ta muèn b×nh chän thÇn t­îng 48 - TrÇn H÷u Ph­íc (m¸y chñ Kú ¦ng)/#do_vote(4)",
		"Ta muèn b×nh chän thÇn t­îng 213 - Ph¹m Minh Ch©u (m¸y chñ Tiªn Phông)/#do_vote(5)",
		"Ta muèn b×nh chän thÇn t­îng 52 - Ng« §×nh Giang TriÒu (m¸y chñ §¹i ¦ng)/#do_vote(6)",
		"Ta muèn b×nh chän thÇn t­îng 230 - NguyÔn Minh HiÒn (m¸y chñ B¹ch ¦ng)/#do_vote(7)",
		"Ta muèn b×nh chän thÇn t­îng 276 - Ph¹m Ngäc Thïy Dung (m¸y chñ Phi Hæ)/#do_vote(8)",
		"Ta muèn b×nh chän thÇn t­îng 206 - TrÇn Kiªn (m¸y chñ Hoµng Hæ)/#do_vote(9)",
		"Ta muèn b×nh chän thÇn t­îng 280 - Tr­¬ng NhÊt CÈm Thy (m¸y chñ Phi ¦ng)/#do_vote(10)",
		"Ta muèn b×nh chän thÇn t­îng 62 - D­¬ng TuÊn Tó (m¸y chñ XÝch Long)/#do_vote(1)",
		"Ta muèn b×nh chän thÇn t­îng 17 - Vò ThÞ Thanh Nhµn (m¸y chñ §¹i Hæ)/#do_vote(2)",
		},
		[4] = 
		{
		"Ta muèn b×nh chän thÇn t­îng 48 - TrÇn H÷u Ph­íc (m¸y chñ Kú ¦ng)/#do_vote(4)",
		"Ta muèn b×nh chän thÇn t­îng 213 - Ph¹m Minh Ch©u (m¸y chñ Tiªn Phông)/#do_vote(5)",
		"Ta muèn b×nh chän thÇn t­îng 52 - Ng« §×nh Giang TriÒu (m¸y chñ §¹i ¦ng)/#do_vote(6)",
		"Ta muèn b×nh chän thÇn t­îng 230 - NguyÔn Minh HiÒn (m¸y chñ B¹ch ¦ng)/#do_vote(7)",
		"Ta muèn b×nh chän thÇn t­îng 276 - Ph¹m Ngäc Thïy Dung (m¸y chñ Phi Hæ)/#do_vote(8)",
		"Ta muèn b×nh chän thÇn t­îng 206 - TrÇn Kiªn (m¸y chñ Hoµng Hæ)/#do_vote(9)",
		"Ta muèn b×nh chän thÇn t­îng 280 - Tr­¬ng NhÊt CÈm Thy (m¸y chñ Phi ¦ng)/#do_vote(10)",
		"Ta muèn b×nh chän thÇn t­îng 62 - D­¬ng TuÊn Tó (m¸y chñ XÝch Long)/#do_vote(1)",
		"Ta muèn b×nh chän thÇn t­îng 17 - Vò ThÞ Thanh Nhµn (m¸y chñ §¹i Hæ)/#do_vote(2)",
		"Ta muèn b×nh chän thÇn t­îng 15 - NguyÔn H¶i An (m¸y chñ QuyÒn Long)/#do_vote(3)",
		},
		[5] = 
		{
		"Ta muèn b×nh chän thÇn t­îng 213 - Ph¹m Minh Ch©u (m¸y chñ Tiªn Phông)/#do_vote(5)",
		"Ta muèn b×nh chän thÇn t­îng 52 - Ng« §×nh Giang TriÒu (m¸y chñ §¹i ¦ng)/#do_vote(6)",
		"Ta muèn b×nh chän thÇn t­îng 230 - NguyÔn Minh HiÒn (m¸y chñ B¹ch ¦ng)/#do_vote(7)",
		"Ta muèn b×nh chän thÇn t­îng 276 - Ph¹m Ngäc Thïy Dung (m¸y chñ Phi Hæ)/#do_vote(8)",
		"Ta muèn b×nh chän thÇn t­îng 206 - TrÇn Kiªn (m¸y chñ Hoµng Hæ)/#do_vote(9)",
		"Ta muèn b×nh chän thÇn t­îng 280 - Tr­¬ng NhÊt CÈm Thy (m¸y chñ Phi ¦ng)/#do_vote(10)",
		"Ta muèn b×nh chän thÇn t­îng 62 - D­¬ng TuÊn Tó (m¸y chñ XÝch Long)/#do_vote(1)",
		"Ta muèn b×nh chän thÇn t­îng 17 - Vò ThÞ Thanh Nhµn (m¸y chñ §¹i Hæ)/#do_vote(2)",
		"Ta muèn b×nh chän thÇn t­îng 15 - NguyÔn H¶i An (m¸y chñ QuyÒn Long)/#do_vote(3)",
		"Ta muèn b×nh chän thÇn t­îng 48 - TrÇn H÷u Ph­íc (m¸y chñ Kú ¦ng)/#do_vote(4)",
		},
		[6] = 
		{		
		"Ta muèn b×nh chän thÇn t­îng 52 - Ng« §×nh Giang TriÒu (m¸y chñ §¹i ¦ng)/#do_vote(6)",
		"Ta muèn b×nh chän thÇn t­îng 230 - NguyÔn Minh HiÒn (m¸y chñ B¹ch ¦ng)/#do_vote(7)",
		"Ta muèn b×nh chän thÇn t­îng 276 - Ph¹m Ngäc Thïy Dung (m¸y chñ Phi Hæ)/#do_vote(8)",
		"Ta muèn b×nh chän thÇn t­îng 206 - TrÇn Kiªn (m¸y chñ Hoµng Hæ)/#do_vote(9)",
		"Ta muèn b×nh chän thÇn t­îng 280 - Tr­¬ng NhÊt CÈm Thy (m¸y chñ Phi ¦ng)/#do_vote(10)",
		"Ta muèn b×nh chän thÇn t­îng 62 - D­¬ng TuÊn Tó (m¸y chñ XÝch Long)/#do_vote(1)",
		"Ta muèn b×nh chän thÇn t­îng 17 - Vò ThÞ Thanh Nhµn (m¸y chñ §¹i Hæ)/#do_vote(2)",
		"Ta muèn b×nh chän thÇn t­îng 15 - NguyÔn H¶i An (m¸y chñ QuyÒn Long)/#do_vote(3)",
		"Ta muèn b×nh chän thÇn t­îng 48 - TrÇn H÷u Ph­íc (m¸y chñ Kú ¦ng)/#do_vote(4)",
		"Ta muèn b×nh chän thÇn t­îng 213 - Ph¹m Minh Ch©u (m¸y chñ Tiªn Phông)/#do_vote(5)",
		},
		[7] = 
		{		
		"Ta muèn b×nh chän thÇn t­îng 230 - NguyÔn Minh HiÒn (m¸y chñ B¹ch ¦ng)/#do_vote(7)",
		"Ta muèn b×nh chän thÇn t­îng 276 - Ph¹m Ngäc Thïy Dung (m¸y chñ Phi Hæ)/#do_vote(8)",
		"Ta muèn b×nh chän thÇn t­îng 206 - TrÇn Kiªn (m¸y chñ Hoµng Hæ)/#do_vote(9)",
		"Ta muèn b×nh chän thÇn t­îng 280 - Tr­¬ng NhÊt CÈm Thy (m¸y chñ Phi ¦ng)/#do_vote(10)",
		"Ta muèn b×nh chän thÇn t­îng 62 - D­¬ng TuÊn Tó (m¸y chñ XÝch Long)/#do_vote(1)",
		"Ta muèn b×nh chän thÇn t­îng 17 - Vò ThÞ Thanh Nhµn (m¸y chñ §¹i Hæ)/#do_vote(2)",
		"Ta muèn b×nh chän thÇn t­îng 15 - NguyÔn H¶i An (m¸y chñ QuyÒn Long)/#do_vote(3)",
		"Ta muèn b×nh chän thÇn t­îng 48 - TrÇn H÷u Ph­íc (m¸y chñ Kú ¦ng)/#do_vote(4)",
		"Ta muèn b×nh chän thÇn t­îng 213 - Ph¹m Minh Ch©u (m¸y chñ Tiªn Phông)/#do_vote(5)",
		"Ta muèn b×nh chän thÇn t­îng 52 - Ng« §×nh Giang TriÒu (m¸y chñ §¹i ¦ng)/#do_vote(6)",
		},
		[8] = 
		{
		"Ta muèn b×nh chän thÇn t­îng 276 - Ph¹m Ngäc Thïy Dung (m¸y chñ Phi Hæ)/#do_vote(8)",
		"Ta muèn b×nh chän thÇn t­îng 206 - TrÇn Kiªn (m¸y chñ Hoµng Hæ)/#do_vote(9)",
		"Ta muèn b×nh chän thÇn t­îng 280 - Tr­¬ng NhÊt CÈm Thy (m¸y chñ Phi ¦ng)/#do_vote(10)",
		"Ta muèn b×nh chän thÇn t­îng 62 - D­¬ng TuÊn Tó (m¸y chñ XÝch Long)/#do_vote(1)",
		"Ta muèn b×nh chän thÇn t­îng 17 - Vò ThÞ Thanh Nhµn (m¸y chñ §¹i Hæ)/#do_vote(2)",
		"Ta muèn b×nh chän thÇn t­îng 15 - NguyÔn H¶i An (m¸y chñ QuyÒn Long)/#do_vote(3)",
		"Ta muèn b×nh chän thÇn t­îng 48 - TrÇn H÷u Ph­íc (m¸y chñ Kú ¦ng)/#do_vote(4)",
		"Ta muèn b×nh chän thÇn t­îng 213 - Ph¹m Minh Ch©u (m¸y chñ Tiªn Phông)/#do_vote(5)",
		"Ta muèn b×nh chän thÇn t­îng 52 - Ng« §×nh Giang TriÒu (m¸y chñ §¹i ¦ng)/#do_vote(6)",	
		"Ta muèn b×nh chän thÇn t­îng 230 - NguyÔn Minh HiÒn (m¸y chñ B¹ch ¦ng)/#do_vote(7)",
		},
		[9] = 
		{		
		"Ta muèn b×nh chän thÇn t­îng 206 - TrÇn Kiªn (m¸y chñ Hoµng Hæ)/#do_vote(9)",
		"Ta muèn b×nh chän thÇn t­îng 280 - Tr­¬ng NhÊt CÈm Thy (m¸y chñ Phi ¦ng)/#do_vote(10)",
		"Ta muèn b×nh chän thÇn t­îng 62 - D­¬ng TuÊn Tó (m¸y chñ XÝch Long)/#do_vote(1)",
		"Ta muèn b×nh chän thÇn t­îng 17 - Vò ThÞ Thanh Nhµn (m¸y chñ §¹i Hæ)/#do_vote(2)",
		"Ta muèn b×nh chän thÇn t­îng 15 - NguyÔn H¶i An (m¸y chñ QuyÒn Long)/#do_vote(3)",
		"Ta muèn b×nh chän thÇn t­îng 48 - TrÇn H÷u Ph­íc (m¸y chñ Kú ¦ng)/#do_vote(4)",
		"Ta muèn b×nh chän thÇn t­îng 213 - Ph¹m Minh Ch©u (m¸y chñ Tiªn Phông)/#do_vote(5)",
		"Ta muèn b×nh chän thÇn t­îng 52 - Ng« §×nh Giang TriÒu (m¸y chñ §¹i ¦ng)/#do_vote(6)",	
		"Ta muèn b×nh chän thÇn t­îng 230 - NguyÔn Minh HiÒn (m¸y chñ B¹ch ¦ng)/#do_vote(7)",
		"Ta muèn b×nh chän thÇn t­îng 276 - Ph¹m Ngäc Thïy Dung (m¸y chñ Phi Hæ)/#do_vote(8)",
		},
		[10] = 
		{		
		"Ta muèn b×nh chän thÇn t­îng 280 - Tr­¬ng NhÊt CÈm Thy (m¸y chñ Phi ¦ng)/#do_vote(10)",
		"Ta muèn b×nh chän thÇn t­îng 62 - D­¬ng TuÊn Tó (m¸y chñ XÝch Long)/#do_vote(1)",
		"Ta muèn b×nh chän thÇn t­îng 17 - Vò ThÞ Thanh Nhµn (m¸y chñ §¹i Hæ)/#do_vote(2)",
		"Ta muèn b×nh chän thÇn t­îng 15 - NguyÔn H¶i An (m¸y chñ QuyÒn Long)/#do_vote(3)",
		"Ta muèn b×nh chän thÇn t­îng 48 - TrÇn H÷u Ph­íc (m¸y chñ Kú ¦ng)/#do_vote(4)",
		"Ta muèn b×nh chän thÇn t­îng 213 - Ph¹m Minh Ch©u (m¸y chñ Tiªn Phông)/#do_vote(5)",
		"Ta muèn b×nh chän thÇn t­îng 52 - Ng« §×nh Giang TriÒu (m¸y chñ §¹i ¦ng)/#do_vote(6)",	
		"Ta muèn b×nh chän thÇn t­îng 230 - NguyÔn Minh HiÒn (m¸y chñ B¹ch ¦ng)/#do_vote(7)",
		"Ta muèn b×nh chän thÇn t­îng 276 - Ph¹m Ngäc Thïy Dung (m¸y chñ Phi Hæ)/#do_vote(8)",
		"Ta muèn b×nh chän thÇn t­îng 206 - TrÇn Kiªn (m¸y chñ Hoµng Hæ)/#do_vote(9)",
		},
	}

	local nRand = random(1,10)
	local tSay = tList[nRand]
	
	local szHeader = "<color=green>"..szName.." :<color>Chµo mõng quý ®ång ®¹o tham gia b×nh chän cuéc thi <color=red>ThÇn t­îng ©m nh¹c Vâ L©m 2<color>. H·y b×nh chän cho thÝ sinh mµ ®ång ®¹o c¶m thÊy Ên t­îng nhÊt trong danh s¸ch d­íi ®©y:"
	
	tinsert(tSay, "Xem h­íng dÉn/do_guide")
	tinsert(tSay, "Ta chØ ghÐ ngang./do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_vote(nType)
	local tVoteName =
	{
		"62 - D­¬ng TuÊn Tó",
		"17 - Vò ThÞ Thanh Nhµn",
		"15 - NguyÔn H¶i An",
		"48 - TrÇn H÷u Ph­íc",
		"213 - Ph¹m Minh Ch©u",
		"52 - Ng« §×nh Giang TriÒu",
		"230 - NguyÔn Minh HiÒn",
		"276 - Ph¹m Ngäc Thïy Dung",
		"206 - TrÇn Kiªn",
		"280 - Tr­¬ng NhÊt CÈm Thy",
	}
	local szLogTitle = "JX2 Idol"
	local szName = "<color=green>ThÇn T­îng Vâ L©m :<color>"
	local nDate = tonumber(date("%y%m%d"))
	local nVoteDate = floor(GetTask(JX2_IDOL_TASK) / 100)
	
	if GetLevel() < 77 then
		Talk(1, "", "§¼ng cÊp 77 trë lªn míi cã thÓ tham gia b×nh chän!")
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1, "", "Ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia b×nh chän!")
		return
	end
	
	if nDate ~= nVoteDate then
		SetTask(JX2_IDOL_TASK, nDate * 100)
	end
	
	local nVote = mod(GetTask(JX2_IDOL_TASK), 100)
	
	if nVote >= 10 then
		local tSay =
		{
			"HiÓu råi! ngµy mai ta sÏ quay l¹i./do_nothing",
		}
		
		Say(szName.."Mçi nh©n vËt chØ cã thÓ b×nh chän cho thÇn t­îng m×nh yªu thÝch 10 lÇn trong 1 ngµy. H«m nay c¸c h¹ ®· b×nh chän 10 lÇn råi, ngµy mai l¹i tiÕp tôc nhÐ.", getn(tSay), tSay)
		return
	end
	
	if GetItemCount(2, 0, 1162) <= 0 then
		local tSay =
		{
			"ThËt ng¹i qu¸! T¹i h¹ sÏ quay l¹i sau./do_nothing",
		}
		
		Say(szName.."Mçi lÇn kÝch ho¹t b×nh chän cÇn 1 Hoa Hång, c¸c h¹ kh«ng mang theo th× ph¶i..", getn(tSay), tSay)
		return
	end

	if DelItem(2, 0, 1162, 1) == 1 then
		SetTask(JX2_IDOL_TASK, GetTask(JX2_IDOL_TASK) + 1)
		ModifyExp(1000000)
		Msg2Player("NhËn ®­îc 1000000 ®iÓm kinh nghiÖm!")
		Talk(1,"","B×nh chän cho "..tVoteName[nType])
		gf_WriteLogEx(szLogTitle, "Tham gia b×nh chän", 1, tVoteName[nType])
	end
end

function do_guide()
	local szName = "ThÇn T­îng Vâ L©m"
	local tSay = {}
	local szHeader = "<color=green>"..szName.." :<color> Ch­¬ng tr×nh b×nh chän ThÇn T­îng Vâ L©m diÔn ra tõ ngµy 16/08/2010 ®Õn 29/08/2010. Trong thêi gian b×nh chän, ®ång ®¹o cã thÓ sö dông ®¹o cô Hoa Hång ®á ®Ó b×nh chän cho nh©n vËt ThÇn T­îng cña m×nh, mçi hoa hång sÏ mang vÒ 1 ®iÓm b×nh chän cho ThÇn T­îng, mçi ngµy cã thÓ b×nh chän ®­îc 10 lÇn. Mçi b×nh chän thµnh c«ng sÏ nhËn phÇn th­ëng kinh nghiÖm. \nHoa Hång cã thÓ thu thËp khi hoµn thµnh nhiÖm vô thu thËp tµi nguyªn chiÕn, trång h¹t gièng, trång c©y b¸t nh· nhá, sö dông N÷ Oa B¶o H¹p."
	
	tinsert(tSay, "Xem th«ng tin kh¸c/main")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_nothing()

end