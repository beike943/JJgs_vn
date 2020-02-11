Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_newserver.lua");

TSK_CHITONNEW1 = 2667
TSK_CHITONNEW2 = 2668
TSK_CHITONNEW3 = 2669

szNPCName = "<color=green>Anh/ChÞ Chñ Phßng M¸y: <color>"
szLogTitle = "CHI TON VUONG LENH"
szLogTitle1 = "CHI TON VUONG LENH BK"
DEFINE_30_DAYS = 2592000
--EXT_POINT_CLTV = 5	--khai b¸o ExtPoint
--TSK_CTVL_START = 2664  --khai b¸o Task thêi h¹n CTVL
--TSK_CTVL_ALL = 2665		--khai b¸o task: 0987654321: 1:kÝch ho¹t CTVL;	2: ®· x©y dùng bang trong tuÇn	3: ®· nhËn th­ëng BHCT trong tuÇn		4: nhËn th­ëng tæ ®éi trong ngµy		65: check lev nhËn th­ëng PS0 	7: nhËn trang bÞ HN	8: kich ho¹t Bang héi ChÝ T«n		9: nhËn th­ëng PS1 88	0: nhËn th­ëng PS2 75
--TSK_CTVL_COUNT = 2666	--0987654321: 		321: bé ®Õm b­íc nhiÖm vô	4: tr¹ng th¸i hoµn thµnh nhiÖm vô		65: l­u ID nhiÖm vô mçi ngµy ®ang thùc hiÖn	7: sè lÇn hoµn thµnh nhiÖm vô trong ngµy		8: tr¹ng th¸i nhËn thö th¸ch		9: nhËn th­ëng mçi ngµy cña old server
tbNewServer = {[83] = 1, [84] = 1, [85] = 1, [86] = 1, [87] = 1}

tb_award_ctvl_PS0 = 
{
				[79] = {1, "Qu©n C«ng Ch­¬ng", 2,1,9999, 1, 10000000, 100000,0},
				[80] = {2, "Qu©n C«ng Ch­¬ng", 2,1,9999, 1, 10000000, 100000,0},
				[81] = {3, "Qu©n C«ng Ch­¬ng", 2,1,9999, 1, 10000000, 100000,0},
				[82] = {4, "Qu©n C«ng Ch­¬ng", 2,1,9999, 2, 20000000, 100000,0},
				[83] = {5, "Qu©n C«ng Ch­¬ng", 2,1,9999, 2, 20000000, 100000,0},
				[84] = {6, "Qu©n C«ng Ch­¬ng", 2,1,9999, 2, 20000000, 100000,0},
				[85] = {7, "Qu©n C«ng Ch­¬ng", 2,1,9999, 3, 30000000, 100000,0},
				[86] = {8, "Qu©n C«ng Ch­¬ng", 2,1,9999, 3, 30000000, 100000,0},
				[87] = {9, "Qu©n C«ng Ch­¬ng", 2,1,9999, 3, 30000000, 100000,0},
				[88] = {10, "Qu©n C«ng §¹i", 2,1,9998, 1, 50000000, 100000,0},
				[89] = {11, "Qu©n C«ng §¹i", 2,1,9998, 1, 50000000, 100000,0},
				[90] = {12, "Qu©n C«ng §¹i", 2,1,9998, 1, 50000000, 0, 5000},
				[91] = {13, "Qu©n C«ng §¹i", 2,1,9998, 1, 50000000, 0, 5000},
				[92] = {14, "Qu©n C«ng §¹i", 2,1,9998, 1, 50000000, 0, 5000},
				[93] = {15, "Qu©n C«ng §¹i", 2,1,9998, 2, 100000000, 0, 10000},
				[94] = {16, "Qu©n C«ng §¹i", 2,1,9998, 2, 100000000, 0, 10000},
				[95] = {17, "Qu©n C«ng Huy Hoµng", 2,1,9977, 1, 300000000, 0, 20000},
				[96] = {18, "Qu©n C«ng Huy Hoµng", 2,1,9977, 1, 300000000, 0, 20000},
				[97] = {19, "Qu©n C«ng Huy Hoµng", 2,1,9977, 2, 500000000, 0, 20000},
				[98] = {20, "Qu©n C«ng Huy Hoµng", 2,1,9977, 2, 500000000, 0, 20000},
				[99] = {21, "Qu©n C«ng Huy Hoµng", 2,1,9977, 3, 1000000000, 0, 50000},
}
tbCTVLRate = {
	[1] = {[1] = 1, nRate = 2.50},	-- Hoµn thµnh 1 lÇn nhËn th­ëng chiÕn tr­êng N«ng Trang
	[2] = {[1] = 2, nRate = 2.50},	-- Hoµn thµnh 2 lÇn nhËn th­ëng chiÕn tr­êng N«ng Trang
	[3] = {[1] = 3, nRate = 2.50},	-- Hoµn thµnh 1 lÇn nhËn th­ëng chiÕn tr­êng L­¬ng Th¶o
	[4] = {[1] = 4, nRate = 2.50},	-- Hoµn thµnh 2 lÇn nhËn th­ëng chiÕn tr­êng L­¬ng Th¶o
	[5] = {[1] = 5, nRate = 2.50},	-- Hoµn thµnh 1 lÇn nhËn th­ëng chiÕn tr­êng Thµnh Tr×
	[6] = {[1] = 6, nRate = 2.50},	-- Hoµn thµnh 2 lÇn nhËn th­ëng chiÕn tr­êng Thµnh Tr×
	[7] = {[1] = 7, nRate = 2.50},	-- Hoµn thµnh 1 lÇn nhËn th­ëng chiÕn tr­êng Nh¹n M«n
	[8] = {[1] = 8, nRate = 2.50},	-- Hoµn thµnh 2 lÇn nhËn th­ëng chiÕn tr­êng Nh¹n M«n
	[9] = {[1] = 9, nRate = 2.50},	-- Hoµn thµnh 1 lÇn nhËn th­ëng Tµi Nguyªn ChiÕn
	[10] = {[1] = 10, nRate = 2.50},	-- Hoµn thµnh 2 lÇn nhËn th­ëng Tµi Nguyªn ChiÕn
	[11] = {[1] = 11, nRate = 2.50},	-- Hoµn thµnh 3 lÇn nhËn th­ëng Tµi Nguyªn ChiÕn
	[12] = {[1] = 12, nRate = 2.50},	-- Hoµn thµnh 4 lÇn nhËn th­ëng Tµi Nguyªn ChiÕn
	[13] = {[1] = 13, nRate = 2.50},	-- Hoµn thµnh 1 lÇn nhËn th­ëng ThÞt N­íng
	[14] = {[1] = 14, nRate = 2.50},	-- Hoµn thµnh 2 lÇn nhËn th­ëng ThÞt N­íng
	[15] = {[1] = 15, nRate = 2.50},	-- Hoµn thµnh 3 lÇn nhËn th­ëng ThÞt N­íng
	[16] = {[1] = 16, nRate = 2.50},	-- Hoµn thµnh 4 lÇn nhËn th­ëng ThÞt N­íng
	[17] = {[1] = 17, nRate = 2.50},	-- Hoµn thµnh 2 lÇn nhËn th­ëng chiÕn th¾ng Thiªn M«n TrËn
	[18] = {[1] = 18, nRate = 2.50},	-- Hoµn thµnh 4 lÇn nhËn th­ëng chiÕn th¾ng Thiªn M«n TrËn
	[19] = {[1] = 19, nRate = 2.50},	-- Sö dông thµnh c«ng 10 ph¸o hoa
	[20] = {[1] = 20, nRate = 2.50},	-- Sö dông thµnh c«ng 20 ph¸o hoa
	[21] = {[1] = 21, nRate = 2.50},	-- Sö dông thµnh c«ng 40 ph¸o hoa
	[22] = {[1] = 22, nRate = 2.50},	-- Nép 1 lÇn Cóng TÕ - TrÞ Quèc B×nh Thiªn H¹
	[23] = {[1] = 23, nRate = 2.50},	-- Nép 1 lÇn TrÞ An - TrÞ Quèc B×nh Thiªn H¹
	[24] = {[1] = 24, nRate = 2.50},	-- Nép 1 lÇn Thñy Lîi - TrÞ Quèc B×nh Thiªn H¹
	[25] = {[1] = 25, nRate = 2.50},	-- Nép 1 lÇn LuyÖn §¬n - TrÞ Quèc B×nh Thiªn H¹
	[26] = {[1] = 26, nRate = 2.50},	-- KÝch ho¹t 1 h¹t gièng
	[27] = {[1] = 27, nRate = 2.50},	-- KÝch ho¹t 6 h¹t gièng
	[28] = {[1] = 28, nRate = 2.50},	-- KÝch ho¹t 24 h¹t gièng
	[29] = {[1] = 29, nRate = 2.50},	-- KÝch ho¹t 1 b¸t nh· nhá
	[30] = {[1] = 30, nRate = 2.50},	-- KÝch ho¹t 6 b¸t nh· nhá
	[31] = {[1] = 31, nRate = 2.50},	-- KÝch ho¹t 16 b¸t nh· nhá
	[32] = {[1] = 32, nRate = 2.50},	-- KÝch ho¹t 1 c©y Tø Linh
	[33] = {[1] = 33, nRate = 2.50},	-- KÝch ho¹t 6 c©y Tø Linh
	[34] = {[1] = 34, nRate = 2.50},	-- KÝch ho¹t 16 c©y Tø Linh
	[35] = {[1] = 35, nRate = 2.50},	-- Sö dông 20 N÷ Oa B¶o H¹p
	[36] = {[1] = 36, nRate = 2.50},	-- Sö dông 50 N÷ Oa B¶o H¹p
	[37] = {[1] = 37, nRate = 2.50},	-- Sö dông 100 N÷ Oa B¶o H¹p
	[38] = {[1] = 38, nRate = 2.50},	-- Sö dông 5 Ng«i Sao May M¾n
	[39] = {[1] = 39, nRate = 2.50},	-- Sö dông 10 Ng«i Sao May M¾n
	[40] = {[1] = 40, nRate = 2.50},	-- Sö dông 16 Ng«i Sao May M¾n
--	[19] = {[1] = 19, nRate = 2.10},	-- Hoµn thµnh 1 lÇn v­ît ¶i 7 Tµng KiÕm
--	[20] = {[1] = 20, nRate = 2.10},	-- Hoµn thµnh 2 lÇn v­ît ¶i 7 Tµng KiÕm
--	[21] = {[1] = 21, nRate = 2.10},	-- Hoµn thµnh 3 lÇn v­ît ¶i 7 Tµng KiÕm
--	[22] = {[1] = 22, nRate = 0.00},	-- Hoµn thµnh 1 lÇn nhiÖm vô L­¬ng S¬n
--	[23] = {[1] = 23, nRate = 2.10},	-- Hoµn thµnh 2 lÇn nhiÖm vô L­¬ng S¬n
--	[24] = {[1] = 24, nRate = 2.10},	-- Hoµn thµnh 3 lÇn nhiÖm vô L­¬ng S¬n

--	[28] = {[1] = 28, nRate = 2.10},	-- Hoµn thµnh 1 lÇn v­ît ¶i Th¸i H­ thu phÝ
--	[29] = {[1] = 29, nRate = 2.10},	-- Hoµn thµnh 2 lÇn v­ît ¶i Th¸i H­ thu phÝ
--	[30] = {[1] = 30, nRate = 2.10},	-- Hoµn thµnh 3 lÇn v­ît ¶i Th¸i H­ thu phÝ
--	[31] = {[1] = 31, nRate = 2.10},	-- Hoµn thµnh 1 lÇn v­ît ¶i Th¸i H­
--	[32] = {[1] = 32, nRate = 2.10},	-- Hoµn thµnh 1 lÇn Th«ng Thiªn §Ønh
--	[33] = {[1] = 33, nRate = 2.10},	-- Tham gia 1 lÇn V¹n KiÕm Tròng
--	[34] = {[1] = 34, nRate = 2.10},	-- Tham gia 1 lÇn §Þa HuyÒn Cung

--	[54] = {[1] = 54, nRate = 2.10},	-- Tiªu diÖt 200 KiÕm Tiªn Tö
--	[55] = {[1] = 55, nRate = 2.10},	-- Tiªu diÖt 200 Sa M¹c Hµnh Nh©n
--	[56] = {[1] = 56, nRate = 2.10},	-- Tiªu diÖt 200 XÝch LuyÖn Háa Hå
--	[57] = {[1] = 57, nRate = 2.10},	-- Tiªu diÖt 200 Tiªu Lam Xoa Quû
--	[1] = {[1] = 25, nRate = 25},	-- Nép 20 M¶nh Thiªn Th¹ch  					----dïng ®Ó test
--	[2] = {[1] = 26, nRate = 25},	-- Nép 20 Thiªn Th¹ch
--	[3] = {[1] = 48, nRate = 25},	-- Nép 02 Qu©n C«ng §¹i
--	[4] = {[1] = 49, nRate = 25},	-- Nép 01 Qu©n C«ng Huy Hoµng
}

tbCTVLName = {
	[1] = {"Hoµn thµnh 1 lÇn nhËn th­ëng chiÕn tr­êng N«ng Trang", 1, 0},
	[2] = {"Hoµn thµnh 2 lÇn nhËn th­ëng chiÕn tr­êng N«ng Trang", 2, 0},
	[3] = {"Hoµn thµnh 1 lÇn nhËn th­ëng chiÕn tr­êng L­¬ng Th¶o", 1, 0},
	[4] = {"Hoµn thµnh 2 lÇn nhËn th­ëng chiÕn tr­êng L­¬ng Th¶o", 2, 0},
	[5] = {"Hoµn thµnh 1 lÇn nhËn th­ëng chiÕn tr­êng Thµnh Tr×", 1, 0},
	[6] = {"Hoµn thµnh 2 lÇn nhËn th­ëng chiÕn tr­êng Thµnh Tr×", 2, 0},
	[7] = {"Hoµn thµnh 1 lÇn nhËn th­ëng chiÕn tr­êng Nh¹n M«n", 1, 0},
	[8] = {"Hoµn thµnh 2 lÇn nhËn th­ëng chiÕn tr­êng Nh¹n M«n", 2, 0},
	[9] = {"Hoµn thµnh 1 lÇn nhËn th­ëng Tµi Nguyªn ChiÕn", 1, 0},		--done
	[10] = {"Hoµn thµnh 2 lÇn nhËn th­ëng Tµi Nguyªn ChiÕn", 2, 0},
	[11] = {"Hoµn thµnh 3 lÇn nhËn th­ëng Tµi Nguyªn ChiÕn", 3, 0},
	[12] = {"Hoµn thµnh 4 lÇn nhËn th­ëng Tµi Nguyªn ChiÕn", 4, 0},
	[13] = {"Hoµn thµnh 1 lÇn nhËn th­ëng ThÞt N­íng", 1, 0},		--done
	[14] = {"Hoµn thµnh 2 lÇn nhËn th­ëng ThÞt N­íng", 2, 0},
	[15] = {"Hoµn thµnh 3 lÇn nhËn th­ëng ThÞt N­íng", 3, 0},
	[16] = {"Hoµn thµnh 4 lÇn nhËn th­ëng ThÞt N­íng", 4, 0},
	[17] = {"Hoµn thµnh 2 lÇn nhËn th­ëng chiÕn th¾ng Thiªn M«n TrËn", 2, 0},		--done
	[18] = {"Hoµn thµnh 4 lÇn nhËn th­ëng chiÕn th¾ng Thiªn M«n TrËn", 4, 0},
	[19] = {"Sö dông thµnh c«ng 10 ph¸o hoa", 10, 0},			--done
	[20] = {"Sö dông thµnh c«ng 20 ph¸o hoa", 20, 0},
	[21] = {"Sö dông thµnh c«ng 40 ph¸o hoa", 40, 0},
	[22] = {"Nép 1 lÇn Cóng TÕ - TrÞ Quèc B×nh Thiªn H¹", 1, 0},		--done
	[23] = {"Nép 1 lÇn TrÞ An - TrÞ Quèc B×nh Thiªn H¹", 1, 0},
	[24] = {"Nép 1 lÇn Thñy Lîi - TrÞ Quèc B×nh Thiªn H¹", 1, 0},
	[25] = {"Nép 1 lÇn LuyÖn §¬n - TrÞ Quèc B×nh Thiªn H¹", 1, 0},
	[26] = {"KÝch ho¹t 1 h¹t gièng", 1, 0},		--done
	[27] = {"KÝch ho¹t 6 h¹t gièng", 6, 0},
	[28] = {"KÝch ho¹t 24 h¹t gièng", 24, 0},
	[29] = {"KÝch ho¹t 1 b¸t nh· nhá", 1, 0},		--done
	[30] = {"KÝch ho¹t 6 b¸t nh· nhá", 6, 0},
	[31] = {"KÝch ho¹t 16 b¸t nh· nhá", 16, 0},
	[32] = {"KÝch ho¹t 1 c©y Tø Linh", 1, 0},		--done
	[33] = {"KÝch ho¹t 6 c©y Tø Linh", 6, 0},
	[34] = {"KÝch ho¹t 16 c©y Tø Linh", 16, 0},
	[35] = {"Sö dông 20 N÷ Oa B¶o H¹p", 20, 0},	--done
	[36] = {"Sö dông 50 N÷ Oa B¶o H¹p", 50, 0},
	[37] = {"Sö dông 100 N÷ Oa B¶o H¹p", 100, 0},
	[38] = {"Sö dông 5 Ng«i Sao May M¾n", 5, 0},		--done
	[39] = {"Sö dông 10 Ng«i Sao May M¾n", 10, 0},
	[40] = {"Sö dông 16 Ng«i Sao May M¾n", 16, 0},

--	[19] = {"Hoµn thµnh 1 lÇn v­ît ¶i 7 Tµng KiÕm", 1, 0},
--	[20] = {"Hoµn thµnh 2 lÇn v­ît ¶i 7 Tµng KiÕm", 2, 0},
--	[21] = {"Hoµn thµnh 3 lÇn v­ît ¶i 7 Tµng KiÕm", 3, 0},
--	[22] = {"Hoµn thµnh 1 lÇn nhiÖm vô L­¬ng S¬n", 1, 0},
--	[23] = {"Hoµn thµnh 2 lÇn nhiÖm vô L­¬ng S¬n", 2, 0},
--	[24] = {"Hoµn thµnh 3 lÇn nhiÖm vô L­¬ng S¬n", 3, 0},

--	[28] = {"Hoµn thµnh 1 lÇn v­ît ¶i Th¸i H­ thu phÝ", 1, 0},
--	[29] = {"Hoµn thµnh 2 lÇn v­ît ¶i Th¸i H­ thu phÝ", 2, 0},
--	[30] = {"Hoµn thµnh 3 lÇn v­ît ¶i Th¸i H­ thu phÝ", 3, 0},
--	[31] = {"Hoµn thµnh 1 lÇn v­ît ¶i Th¸i H­", 1, 0},
--	[32] = {"Hoµn thµnh 1 lÇn Th«ng Thiªn §Ønh", 1, 0},
--	[33] = {"Tham gia 1 lÇn V¹n KiÕm Tròng", 1, 0},
--	[34] = {"Tham gia 1 lÇn §Þa HuyÒn Cung", 1, 0},

--	[54] = {"Tiªu diÖt 200 KiÕm Tiªn Tö", 200, 0},
--	[55] = {"Tiªu diÖt 200 Sa M¹c Hµnh Nh©n", 200, 0},
--	[56] = {"Tiªu diÖt 200 XÝch LuyÖn Háa Hå", 200, 0},
--	[57] = {"Tiªu diÖt 200 Tiªu Lam Xoa Quû", 200, 0},
--	[25] = {"Sö dông thµnh c«ng 1 N÷ Oa B¶o H¹p", 1, 0},		--dïng ®Ó test
--	[26] =  {"Sö dông thµnh c«ng 2 N÷ Oa B¶o H¹p", 2, 0},
--	[48] =  {"Sö dông thµnh c«ng 3 N÷ Oa B¶o H¹p", 3, 0},
--	[59] =  {"Sö dông thµnh c«ng 4 N÷ Oa B¶o H¹p", 4, 0},
}

function CheckAccount_Active1()
	local nExtPoint = GetExtPoint(EXT_POINT_CLTV)
	local nKichhoat = mod(GetTask(TSK_CTVL_ALL), 10)
	if nExtPoint < 1 then
		Talk(1, "", "Tµi kho¶n cña ®¹i hiÖp ch­a nhËp code ChÝ T«n V­¬ng LÖnh.")
		return 0
	end
	if nKichhoat < 1 then
		Talk(1, "", "§¹i hiÖp ch­a kÝch ho¹t ChÝ T«n V­¬ng LÖnh.")
		return 0
	end
	if nKichhoat > 1 then
		Talk(1, "", "§¹i hiÖp ®· hÕt thêi gian nhËn th­ëng ChÝ T«n V­¬ng LÖnh.")
		return 0
	end
	return 1
end
function CheckAccount_Active()
	local nExtPoint = GetExtPoint(EXT_POINT_CLTV)
	local nCTVL_End = GetTime()
	if nExtPoint < 1 then
		Talk(1, "", "Tµi kho¶n cña ®¹i hiÖp ch­a nhËp code ChÝ T«n V­¬ng LÖnh.")
		return 0
	end

	if nCTVL_End - GetTask(TSK_CTVL_START) < DEFINE_30_DAYS then
		Msg2Player("ChÝ T«n V­¬ng LÖnh vÉn cßn ®ang hiÖu lùc. §¹i hiÖp kh«ng thÓ kÝch ho¹t thªm ®­îc n÷a.")
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChÝ T«n V­¬ng LÖnh vÉn cßn ®ang hiÖu lùc. §¹i hiÖp kh«ng thÓ kÝch ho¹t thªm ®­îc n÷a.")
		return 0
	end		
	return 1
end

function CTVL_SetDailyMission(nQuestID)
	local nMISSION_QTY = 3
	if CTVL_CountDailyMission() >= nMISSION_QTY then
		Talk(1,"",szNPCName.."Ng­¬i ®· hoµn thµnh "..nMISSION_QTY.."/"..nMISSION_QTY.." nhiÖm vô, kh«ng cÇn ph¶i lµm thªm.")
		return 0
	end
	local nMissionID = nQuestID
	if nQuestID == nil then
		nMissionID = LIB_Award:GetValueByRate(tbCTVLRate)
	end
	local nTaskValue = GetTask(TSK_CTVL_COUNT)
	SetTask(TSK_CTVL_COUNT, floor(nTaskValue/1000000)*1000000 + nMissionID*10000 + tbCTVLName[nMissionID][2])
	Talk(1,"", szNPCName.."Thö th¸ch lÇn nµy cña ng­¬i lµ <color=yellow>"..tbCTVLName[nMissionID][1].."<color>! H·y mau chãng hoµn thµnh.")
	TaskTip("NhËn ®­îc mét thö th¸ch cña ChÝ T«n V­¬ng LÖnh.")
end
function CTVL_CountDailyMission()
	local nCount = VNG_GetTaskPos(TSK_CTVL_COUNT, 7, 7)
	return nCount
end
function CTVL_AddCount()
	local nCount = CTVL_CountDailyMission()
	if nCount < 3 then
		nCount = nCount +1
	end
	VNG_SetTaskPos(TSK_CTVL_COUNT, nCount, 7, 7)
end
function CTVL_GetStatus()	-- LÊy tr¹ng th¸i hoµn thµnh nhiÖm vô. 0/1 = Ch­a hoµn thµnh/ hoµn thµnh
	local nStatus = VNG_GetTaskPos(TSK_CTVL_COUNT, 4, 4)
	return nStatus
end

function CTVL_SetStatus(nStatus)	-- Set tr¹ng th¸i hoµn thµnh nhiÖm vô.
	nStatus = nStatus or 1
	if CTVL_GetStatus() == 0 then
		VNG_SetTaskPos(TSK_CTVL_COUNT, 1, 4, 4)
		CTVL_AddCount()
		return 1
	else
		return 0
	end
end
		--============================
function CTVL_SetMissionPart()
	local nPart = mod(GetTask(TSK_CTVL_COUNT),1000)
	if nPart >0 then
		nPart = nPart  - 1
		Msg2Player("Hoµn thµnh mét lÇn thö th¸ch phôc sinh 2, cßn "..nPart.." lÇn n÷a")
		SetTask(TSK_CTVL_COUNT, GetTask(TSK_CTVL_COUNT) - 1)
		if nPart == 0 then
			CTVL_SetStatus()
			Msg2Player("Chóc mõng b¹n ®· hoµn thµnh 1 nhiÖm vô hµng ngµy cña ChÝ T«n V­¬ng LÖnh")
			CTVL_DeActive()			
		end
	end
end

function CTVL_GetMissionPart()
	return mod(GetTask(TSK_CTVL_COUNT), 1000)
end
--==============================

function CTVL_CheckActive() -- KiÓm tra tr¹ng th¸i nhËn thö th¸ch: 1 = ®· nhËn
	local nCheck = VNG_GetTaskPos(TSK_CTVL_COUNT, 8, 8)
	return nCheck
end

function CTVL_Active() -- Set tr¹ng th¸i nhËn thö th¸ch: 1 = ®· nhËn
	local nCheck = VNG_GetTaskPos(TSK_CTVL_COUNT, 8, 8)
	if nCheck < 1 then
		VNG_SetTaskPos(TSK_CTVL_COUNT, 1, 8, 8)
		return 1
	else
		return 0
	end
end
function CTVL_DeActive() -- Set tr¹ng th¸i nhËn thö th¸ch: 0 = ch­a nhËn
	local nCheck = VNG_GetTaskPos(TSK_CTVL_COUNT, 8, 8)
	if nCheck == 1 then
		VNG_SetTaskPos(TSK_CTVL_COUNT, 0, 8, 8)
		return 1
	else
		return 0
	end
end

function CTVL_GetDailyMission()	-- LÊy ID nhiÖm vô ®ang thùc hiÖn
	local nTaskValue = VNG_GetTaskPos(TSK_CTVL_COUNT, 6, 5)
	return nTaskValue
end


--========================= ===========================================
--                                             ChÝ T«n V­¬ng LÖnh Newserver
--=====================================================================
tbMission = {
	[1] = {10,99, "NhËn nhiÖm vô ®¼ng cÊp 10-99", 111401111},
	[2] = {191,199, "NhËn nhiÖm vô ®¼ng cÊp 91-99 chuyÓn sinh 1", 114033},
	[3] = {290,299, "NhËn nhiÖm vô ®¼ng cÊp 90-99 chuyÓn sinh 2", 1188},
	[4] = {390,399, "NhËn nhiÖm vô ®¼ng cÊp 90-99 chuyÓn sinh 3", 1391616},
	[5] = {490,499, "NhËn nhiÖm vô ®¼ng cÊp 90-99 chuyÓn sinh 4", 249},
	[6] = {586,586, "NhËn nhiÖm vô ®¼ng cÊp 86 chuyÓn sinh 5", 3},
	[7] = {587,587, "NhËn nhiÖm vô ®¼ng cÊp 87 chuyÓn sinh 5", 0},
	[8] = {588,588, "NhËn nhiÖm vô ®¼ng cÊp 88 chuyÓn sinh 5", 0},
	[9] = {589,589, "NhËn nhiÖm vô ®¼ng cÊp 89 chuyÓn sinh 5", 316},
	[10] = {590,590, "NhËn nhiÖm vô ®¼ng cÊp 90 chuyÓn sinh 5", 39},
	[11] = {591,591, "NhËn nhiÖm vô ®¼ng cÊp 91 chuyÓn sinh 5", 0},
	[12] = {592,592, "NhËn nhiÖm vô ®¼ng cÊp 92 chuyÓn sinh 5", 10},
	[13] = {593,593, "NhËn nhiÖm vô ®¼ng cÊp 93 chuyÓn sinh 5", 13916},
	[14] = {594,594, "NhËn nhiÖm vô ®¼ng cÊp 94 chuyÓn sinh 5", 16},
	[15] = {595,595, "NhËn nhiÖm vô ®¼ng cÊp 95 chuyÓn sinh 5", 100},
	[16] = {596,596, "NhËn nhiÖm vô ®¼ng cÊp 96 chuyÓn sinh 5", 100},
	[17] = {597,597, "NhËn nhiÖm vô ®¼ng cÊp 97 chuyÓn sinh 5", 1510050},
	[18] = {598,598, "NhËn nhiÖm vô ®¼ng cÊp 98 chuyÓn sinh 5", 8},
	[19] = {599,599, "NhËn nhiÖm vô ®¼ng cÊp 99 chuyÓn sinh 5", 1139},
--	[20] = {680,680, "NhËn nhiÖm vô ®¼ng cÊp 80 Phôc Sinh", 40100},
--	[21] = {688,699, "NhËn nhiÖm vô ®¼ng cÊp 88-99 Phôc Sinh", 0},
}

tbMissionPart = {
	[1] = {{"Thu ho¹ch 1 b¸t nh· nhá", 1,1}, {"Thu ho¹ch 1 h¹t gièng",2,2}, {"Thu ho¹ch 1 c©y tø linh",3,3}, {"Sö dông 1 n÷ oa b¶o h¹p",4,4}, {"Sö dông 40 ph¸o hoa",6,5}, {"Hoµn thµnh 1 lÇn thñy lîi", 7,7}, {"Gia nhËp bang",8,8}, {"Häc khinh c«ng", 9,9}},
	[2] = {{"Thu ho¹ch 3 b¸t nh· nhá", 1,1}, {"Thu ho¹ch 3 c©y tø linh",2,2}, {"Sö dông 40 ph¸o hoa",4,3}, {"Hoµn thµnh 1 lÇn cóng tÕ", 5,5}, {"Së h÷u b¹n ®ång hµnh cÊp 1",6,6}},
	[3] = {{"Thu ho¹ch 8 h¹t gièng",1,1}, {"Thu ho¹ch 8 c©y tø linh",2,2}, {"Hoµn thµnh 1 lÇn cóng tÕ", 3,3}, {"Thùc hiÖn 1 tÇng d­ìng sinh thuËt",4,4}},
	[4] = {{"Thu ho¹ch 16 b¸t nh· nhá", 2,1}, {"Thu ho¹ch 16 h¹t gièng",4,3}, {"Sö dông 9 n÷ oa b¶o h¹p",5,5}, {"Hoµn thµnh 3 lÇn thñy lîi", 6,6}, {"Tham gia 1 lÇn Th¸i h­ huyÔn c¶nh", 7,7},},
	[5] = {{"Sö dông 9 n÷ oa b¶o h¹p",1,1}, {"Hoµn thµnh 4 nhiÖm vô Tµi nguyªn chiÕn",2,2}, {"Sö dông 2 ng«i sao may m¾n",3,3}},
	[6] = {{"Hoµn thµnh 3 lÇn trÞ an", 1,1}},
	[9] = {{"Thu ho¹ch 16 c©y tø linh",2,1}, {"Sö dông 3 ng«i sao may m¾n",3,3}},
	[10] = {{"Thu ho¹ch 39 b¸t nh· nhá", 2,1}},
	[12] = {{"Thùc hiÖn 10 lÇn d­ìng sinh thuËt",2,1}},
	[13] = {{"Thu ho¹ch 16 c©y tø linh",2,1}, {"Sö dông 39 n÷ oa b¶o h¹p",4,3}, {"Hoµn thµnh 1 lÇn cóng tÕ", 5,5}},
	[14] = {{"Sö dông 16 ng«i sao may m¾n",2,1}},
	[15] = {{"Thu ho¹ch 100 h¹t gièng",3,1}},
	[16] = {{"Sö dông 100 n÷ oa b¶o h¹p",3,1}},
	[17] = {{"Thu ho¹ch 50 h¹t gièng",2,1}, {"Sö dông 100 n÷ oa b¶o h¹p",5,3},{"Hoµn thµnh 15 nhiÖm vô Tµi nguyªn chiÕn",7,6}},
	[18] = {{"Thùc hiÖn 8 lÇn d­ìng sinh thuËt",1,1}},
	[19] = {{"Sö dông 39 ng«i sao may m¾n",2,1}, {"NhËn nhiÖm vô Phôc Sinh",3,3}, {"Sö dông 10 tr¸i c©y mçi lo¹i",4,4}},
--	[20] = {{"Sö dông 100 n÷ oa b¶o h¹p",3,1}, {"Sö dông 40 ph¸o hoa",5,4}},
}

function ChiTonNew_GetStep()
	return VNG_GetTaskPos(TSK_CHITONNEW1, 2,1)
end


function ChiTonNew_SetMissionPart(nSubPart)
	local nStepID = ChiTonNew_GetStep()
	if tbMissionPart[nStepID][nSubPart] == nil then
		return 0
	end
	local nPart = VNG_GetTaskPos(TSK_CHITONNEW2, tbMissionPart[nStepID][nSubPart][2], tbMissionPart[nStepID][nSubPart][3])
	if nPart == 0 then
		return 0
	end
	nPart = nPart - 1
	VNG_SetTaskPos(TSK_CHITONNEW2, nPart, tbMissionPart[nStepID][nSubPart][2], tbMissionPart[nStepID][nSubPart][3])
	if nPart == 0 then
		TaskTip(tbMissionPart[nStepID][nSubPart][1]..": Hoµn thµnh.")
	else
		Msg2Player(tbMissionPart[nStepID][nSubPart][1]..": Cßn "..nPart.." lÇn.")
	end
end


function ChiTonNew_CheckNewServer()
	local nServerID = GetGlbValue(1023)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	if nServerID ~= nNationality then
		return 0
	end
	local nKichhoat = mod(GetTask(TSK_CTVL_ALL), 10)
	if nKichhoat ~= 1 then
		return 0
	end
	if tbNewServer[nServerID] == 1 then
		return 1
	else
		return 0
	end
end


function ChiTonNew_ExpBonus(nExp)
	if ChiTonNew_CheckNewServer() == 1 then
		ModifyExp(nExp)
		Msg2Player("Th­ëng ChÝ T«n V­¬ng LÖnh server míi "..nExp.." ®iÓm kinh nghiÖm.")
	end
end


function ChiTonNew_GetAward()
	return VNG_GetTaskPos(TSK_CHITONNEW1, 4,3)
end


function ChiTonNew_SetAward(nIndex)
	return VNG_SetTaskPos(TSK_CHITONNEW1, nIndex, 4,3)
end