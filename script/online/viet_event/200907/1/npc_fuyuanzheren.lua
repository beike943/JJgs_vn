--=======================================================
--create by baiyun 2009.5.30
--describe:Ô½ÄÏ°æ7ÔÂ·Ý»î¶¯Ö®Ò»×·Ñ°³¤ÉúÆÕ£¬¸´Ô­ÕæÈËNPC½Å±¾
--=======================================================

Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	if VerifyDate(1) == 1 then
		Say("Ho¹t ®éng truy t×m tr­êng sinh phæ diÔn ra tõ 19-06-2009 ®Õn 24:00 19-07-2009. Trong thêi gian sù kiÖn, ®ång ®¹o cã thÓ thu thËp BÝ Phæ Cò N¸t th«ng qua c¸c nhiÖm vô sau: S­ M«n, Th¸i H­, B¸t Nh·, H¹t Gièng, s¨n Thá MËp.\n- §Ó kh«i phôc BÝ Phæ Cò N¸t thµnh Tr­êng Sinh Phæ, ®ång ®¹o dïng 10 BÝ Phæ Cò N¸t vµ 1 Phôc Nguyªn ThuËt (cã b¸n t¹i Ngù C¸c) ®Õn NPC Phôc Nguyªn Ch©n Nh©n hoÆc t¹i CÈm Nang §¹i Sù KiÖn.\n Khi sö dông Tr­êng Sinh Phæ, ®ång ®¹o cã c¬ héi nhËn ®­îc §ång TiÒn Vµng, cã t¸c dông dïng ®Ó ®æi c¸c vËt phÈm gi¸ trÞ t¹i NPC D¹ Th¶o",
				3,
				"T¹i h¹ muèn kh«i phôc BÝ Phæ Cò N¸t (nhËn ®­îc 1 Tr­êng Sinh Phæ)../GetChangshengpu",
				"T¹i h¹ ®ang cÇn 1 CÈm Nang §¹i Sù KiÖn./GetJinnang",
				"T¹i h¹ chØ ghÐ ngang!/dialog_over");
	else
		Say("Ho¹t ®éng nµy ®· kÕt thóc!",0)
	end
end

function GetJinnang()
	if GetItemCount(2, 1, 30045) >= 1 then
		Talk(1, "", "C¸c h¹ ®· cã CÈm Nang §¹i Sù KiÖn råi, kh«ng thÓ nhËn thªm ®­îc n÷a!!");
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		return
	end
	local nRetCode, nItem = gf_AddItemEx({2, 1, 30045, 1}, "CÈm Nang §¹i Sù KiÖn");
	gf_SetItemExpireTime(nItem, 2009, 7, 20, 0, 0, 0); 
end

function dialog_over()

end