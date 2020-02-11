function OnUse()
	local selTab = {
				"Dïng th«i! KÎo h­ mÊt!/use",
				"§Ó dµnh sau nµy dïng/nothing",
				}
	Say("Dïng Thİ LuyÖn Qu¶ cã thÓ t¨ng 100 v¹n ®iÓm søc kháe! Vui lßng kh«ng dïng qu¸ nhiÒu kÎo v­ît qu¸ møc tèi ®a!",getn(selTab),selTab);
end;

function use()
	if DelItem(2,0,392,1) == 1 then
		local nGoldenExp = ModifyGoldenExp(1000000);
		Msg2Player("B¹n ®· dïng 1 Thİ LuyÖn Qu¶, ®iÓm søc kháe t¨ng lªn 100 v¹n!");
		WriteLog("[Dïng Thİ LuyÖn Qu¶]:"..GetName().."Dïng 1 Thİ LuyÖn Qu¶");
		if nGoldenExp >= 10000000 then
			Msg2Player("§iÓm søc kháe cña b¹n ®· v­ît qu¸ 1 ngµn v¹n, hÖ thèng sÏ thu håi phÇn v­ît møc khi b¹n rêi m¹ng. Xin ®Æc biÖt chó ı!")
		end;
	end;
end;

function nothing()

end;