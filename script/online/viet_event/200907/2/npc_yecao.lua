--=======================================================
--create by baiyun 2009.5.31
--describe:Ô½ÄÏ°æ7ÔÂ·İ»î¶¯Ö®¶şÒ¹²İ£¬Ò¹²İ½Å±¾
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	if VerifyDate(1) == 1 then
		Say("D¹ Th¶o: Tõ  <color=red>19-06-2009 ®Õn 24:00 19-07-2009<red>, ®ång ®¹o cã thÓ dïng §ång TiÒn Vµng ®Ó ®æi lÊy c¸c phÇn th­ëng hÊp dÉn sau ®©y::",
				7,
				"1 §¹i B¹ch C©u Hoµn – (cÇn 1 §ång TiÒn Vµng)/#duihuan_aword(1)",
				"1 C­êng HiÖu Tam Thanh Hoµn – (cÇn 1 §ång TiÒn Vµng)/#duihuan_aword(2)",
				"1 C­êng HiÖu Lôc ThÇn Hoµn – (cÇn 1 §ång TiÒn Vµng)/#duihuan_aword(3)",
				"1 Cöu ChuyÓn Håi Hån §¬n – (cÇn 1 §ång TiÒn Vµng)/#duihuan_aword(4)",
				"1 Thiªn H­¬ng CÈm Tôc_Tói Nhá – (cÇn 1 §ång TiÒn Vµng)/#duihuan_aword(5)",
				"Trang kÕ/#NextPage(2)",
				"T¹i h¹ chØ ghĞ ngang!/end_dialogover");
	else
		Say("Ho¹t ®éng nµy ®· kÕt thóc!",0)
	end
end

function NextPage(nPage)
	if VerifyDate(1) == 1 then
		if nPage == 2 then
			Say("D¹ Th¶o: Tõ  <color=red>19-06-2009 ®Õn 24:00 19-07-2009<red>, ®ång ®¹o cã thÓ dïng §ång TiÒn Vµng ®Ó ®æi lÊy c¸c phÇn th­ëng hÊp dÉn sau ®©y::",
				7,
				"1 NhÊt nguyªn phôc thñy ®¬n (tiÓu) – (cÇn 1 §ång TiÒn Vµng)/#duihuan_aword(6)",
				"1 Ngò hoa ngäc lé hoµn (tiÓu) – (cÇn 1 §ång TiÒn Vµng)/#duihuan_aword(7)",
				"1 Bång Lai Tiªn §¬n – (cÇn 2 §ång TiÒn Vµng)/#duihuan_aword(8)",
				"1 V¹n vËt quy nguyªn ®¬n (TiÓu) – (cÇn 2 §ång TiÒn Vµng)/#duihuan_aword(9)",
				"1 TiÓu ThÇn Th«ng Phï – (cÇn 2 §ång TiÒn Vµng)/#duihuan_aword(10)",
				"Trang tr­íc/main",
				"Trang kÕ/#NextPage(3)");
		elseif nPage == 3 then
				Say("D¹ Th¶o: Tõ  <color=red>19-06-2009 ®Õn 24:00 19-07-2009<red>, ®ång ®¹o cã thÓ dïng §ång TiÒn Vµng ®Ó ®æi lÊy c¸c phÇn th­ëng hÊp dÉn sau ®©y::",
				8,
				"1 TiÓu Niªn Thó ThÇn Phï – (cÇn 3 §ång TiÒn Vµng)/#duihuan_aword(11)",
				"1 H¾c ngäc ®o¹n tôc cao (tiÓu) – (cÇn 3 §ång TiÒn Vµng)/#duihuan_aword(12)",
				"1 B¹ch C©u Tiªn §¬n – (cÇn 4 §ång TiÒn Vµng)/#duihuan_aword(13)",
				"1 Tam Thanh Tiªn §¬n – (cÇn 4 §ång TiÒn Vµng)/#duihuan_aword(14)",
				"1 Lôc ThÇn Tiªn §¬n – (cÇn 4 §ång TiÒn Vµng)/#duihuan_aword(15)",
				"Trang tr­íc/#NextPage(2)",
				"Trang kÕ/#NextPage(4)",
				"trë l¹i/main");
		elseif nPage == 4 then
				Say("D¹ Th¶o: Tõ  <color=red>19-06-2009 ®Õn 24:00 19-07-2009<red>, ®ång ®¹o cã thÓ dïng §ång TiÒn Vµng ®Ó ®æi lÊy c¸c phÇn th­ëng hÊp dÉn sau ®©y::",
				8,
				"1 Sinh sinh hãa t¸n (tiÓu) – (cÇn 4 §ång TiÒn Vµng)/#duihuan_aword(16)",
				"1 Lôc l©m lang yªn – (cÇn 5 §ång TiÒn Vµng)/#duihuan_aword(17)",
				"1 Thñy hoµng bİ chiÕu – (cÇn 5 §ång TiÒn Vµng)/#duihuan_aword(18)",
				"1 Uyªn ­¬ng kim ti b¹c – (cÇn 7 §ång TiÒn Vµng)/#duihuan_aword(19)",
				"1 Sæ tay sèng – (cÇn 20 §ång TiÒn Vµng)/#duihuan_aword(20)",
				"Trang tr­íc/#NextPage(3)",
				"Trang kÕ/#NextPage(5)",
				"trë l¹i/main");
		elseif nPage == 5 then
				Say("D¹ Th¶o: Tõ  <color=red>19-06-2009 ®Õn 24:00 19-07-2009<red>, ®ång ®¹o cã thÓ dïng §ång TiÒn Vµng ®Ó ®æi lÊy c¸c phÇn th­ëng hÊp dÉn sau ®©y::",
				8,
				"1 ThÇn hµnh b¶o ®iÓn – (cÇn 25 §ång TiÒn Vµng)/#duihuan_aword(21)",
				"1 Huy hiÖu chiÕn c«ng (huy hoµng) – (cÇn 50 §ång TiÒn Vµng)/#duihuan_aword(22)",
				"1 TÈy Tñy Linh §¬n – (cÇn 80 §ång TiÒn Vµng)/#duihuan_aword(23)",
				"1 B¸t B¶o TÈy Tñy Tiªn §¬n – (cÇn 100 §ång TiÒn Vµng)/#duihuan_aword(24)",
				"1 Phiªu Vò – (cÇn 250 §ång TiÒn Vµng) /#duihuan_aword(25)",
				"Trang tr­íc/#NextPage(4)",
				"trë l¹i/main",
				"T¹i h¹ chØ ghĞ ngang!/end_dialogover");
		end
	else
		Say("Ho¹t ®éng nµy ®· kÕt thóc!",0)
	end
end

--¶Ò»»½±Àø
function duihuan_aword(nIndex)
	if GetItemCount(2, 1, 30094) < tb_yecao_aword[nIndex][3] then
		Talk(1, "", "§ång TiÒn Vµng mang theo kh«ng ®ñ!");
		return
	end
	if gf_Judge_Room_Weight(2, 50, " ") == 0 then
		return
	end
	if DelItem(2, 1, 30094, tb_yecao_aword[nIndex][3]) == 1 then
		local nRetCode, nItem = gf_AddItemEx(tb_yecao_aword[nIndex][2], tb_yecao_aword[nIndex][1]);
		WriteLogEx("Hoat dong thang 6","D¹ Th¶o Trë l¹i",tb_yecao_aword[nIndex][2][4],tb_yecao_aword[nIndex][1]);
		if nRetCode == 1 and tb_yecao_aword[nIndex][4] ~= 0 then
			SetItemExpireTime(nItem, tb_yecao_aword[nIndex][4]);
		end
	end
end

--½áÊø¶Ô»°
function end_dialogover()
end