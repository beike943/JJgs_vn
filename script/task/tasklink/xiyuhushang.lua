-- =====================================================
-- File : Î÷ÓòºúÉÌ
-- Desc : ³öÊÛÉÌ»áÀÏ°åĞèÒªµÄÎïÆ·£¬Ëæ»ú³öÏÖÔÚ¸÷¸ö³ÇÊĞµÄ¡£
-- Creator : Tony(Jizheng)
-- =====================================================
Include("\\script\\lib\\globalfunctions.lua");
-- Ä¬ÈÏÈë¿Úº¯Êı
function main()
	local nDate = tonumber(date("%y%m%d"));
	local tb_dialog = {
		"§ång ı mua/open_shop",
		"Ng­¬i ®· ®i nh÷ng n¬i ®©u?/query_pos",
		"LÇn sau l¹i ®Õn nhĞ!/exit_dialog"
	};
--	if nDate >= 091218 and nDate < 100117 then
--		tinsert(tb_dialog, 3, "Mua 1 ph¸o hoa (cÇn 1 ®ång)/buy_yanhuo");
--	end
	Say("Hµng hãa ë ®©y ®­îc ®em vÒ tõ T©y Vùc, kh¸ch quan xin cø tïy ı lùa chän.",
		getn(tb_dialog),
		tb_dialog
	);
end;

-- È¡×ßÎ÷ÓòÎïÆ·
function open_shop()
	-- ´ò¿ªÒ»¸ö²ß»®×¨ÃÅÖÆ¶¨µÄÉÌµê
	Sale(88)
end;

-- ÄãÍ¨³£ÔÚÄÄÀï³öÏÖ
function query_pos()
	Say("Ta th­êng dõng ch©n t¹i c¸c ®¹i thµnh thŞ: <color=green>TuyÒn Ch©u (187.191), BiÖn Kinh (179.184), Thµnh §« (224.225), T­¬ng D­¬ng (187.180), D­¬ng Ch©u (206.194), §¹i Lı (178.187)<color>", 0)
end;

-- ÏÂ´ÎÓĞ»ú»áÔÙÂò
function exit_dialog()
end;

-- ÂòÑÌ»ğ
function buy_yanhuo()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then 
		return 0;
	end
	if Pay(1) == 1 then
		AddItem(2, 1, 30137, 1);
		WriteLogEx("Giang Sinh","mua ph¸o hoa")
	else
		Talk(1, "", "<color=green>Th­¬ng Nh©n T©y Vùc<color>: Trªn hµnh trang kh«ng ®ñ tiÒn.");
	end
end
