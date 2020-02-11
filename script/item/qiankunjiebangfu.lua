--Ç¬À¤½â°ó·ûÎïÆ·½Å±¾

function OnUse(nItemIdx)
	local tbSay = {}
	local szTitle = format("%s: cã thÓ gi¶i khãa trang bŞ kh«ng thÓ giao dŞch.",
		GetItemName(nItemIdx))
	szTitle = format("%s\n%s",szTitle, "Xin chó ı:<color=red>gi¶i khãa trang bŞ sÏ xãa ®¸ quı kh¶m trªn trang bŞ.<color>")
	tinsert(tbSay, format("Ta muèn gi¶i khãa/#_OnUse_confirm(%d)", nItemIdx))
	tinsert(tbSay, format("Tra xem trang bŞ cã thÓ gi¶i khãa/#_view_detail(%d)", nItemIdx))
	tinsert(tbSay, "Rêi khái/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _view_detail(nItemIdx)
	local tbSay = {}
	local szTitle = format("%s: gi¶i khãa trang bŞ kh¸c nhau cÇn tiªu hao vµng vµ sè l­îng vËt phÈm kh¸c nhau. HiÖn t¹i c¸c trang bŞ sau cã thÓ gi¶i khãa: \nBé trang bŞ s­ m«n 4, Bé trang bŞ s­ m«n 5, Trang bŞ Tinh Kh¾c, \nTrang bŞ Thiªn NghÜa, Trang bŞ H¹o NguyÖt, Trang bŞ Cöu Ch©u, \nTrang bŞ DiÖu D­¬ng, trang bŞ Vâ L©m Minh Chñ, Thiªn §Şa NhËt NguyÖt giíi chØ.",
		GetItemName(nItemIdx))
	szTitle = szTitle.."\n HÖ thèng trang bŞ ChiÕn Cuång"..", Trang bŞ Thiªn H¹ V« Song"
	tinsert(tbSay, format("trë l¹i/#OnUse(%d)", nItemIdx))
	tinsert(tbSay, "Rêi khái/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _OnUse_confirm(nItemIdx)
	SendScript2Client("Open([[CommonEnhanceItem]], 2);");
end

function no()
end