Include("\\script\\missions\\tong_melee\\tm_head.lua")

function main()
	if IsTongMeleeSystemOpen() ~= 1 then
		return
	end
	local today = Date();
	local wday = today:week();
	if wday ~= 0 then
		return 0;
	end
	Msg2Global("Lo¹n chiÕn bang héi s¾p b¾t ®Çu, c¸c vŞ ®¹i hiÖp nhanh ch©n ®Õn Thµnh §« ®Õn chç Ng­êi TiÕp DÉn Liªn Server ®Ó tiÕn hµnh b¸o danh!");
	AddLocalCountNews("Lo¹n chiÕn bang héi s¾p b¾t ®Çu, c¸c vŞ ®¹i hiÖp nhanh ch©n ®Õn Thµnh §« ®Õn chç Ng­êi TiÕp DÉn Liªn Server ®Ó tiÕn hµnh b¸o danh!", 2);
end