--Ëæ»úºÐ½Å±¾
--by vivi
--09/13/2007

function OnUse()
	Say("Më hép cã tû lÖ 90% nhËn ®­îc Hép Ng©n Bµi Vinh Dù, 10% nhËn ®­îc Hép Kim Bµi Vinh Dù, b¹n muèn më chø?",
		2,
		"§ång ý/just_do_it",
		"Kh«ng cã g×/nothing")
end

function just_do_it()
	if Zgc_pub_goods_add_chk(1,10) ~= 1 then
		return
	end
	if DelItem(2,0,1080,1) == 1 then
		local nRand = random(1,100);
		local nRetCode = 0;
		if nRand <= 90 then
			nRetCode = AddItem(2,0,1078,1);
			if nRetCode == 1 then
				Msg2Player("B¹n nhËn ®­îc Hép Ng©n Bµi Vinh Dù");
			end
		else
			nRetCode = AddItem(2,0,1079,1);
			if nRetCode == 1 then
				Msg2Player("B¹n nhËn ®­îc Hép Kim Bµi Vinh Dù");
			end
		end
		if nRetCode ~= 1 then
			WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më hép nhËn vËt phÈm thÊt b¹n, vÞ trÝ thÊt b¹i:"..nRetCode);
		end
	end
end

--º¯ÊýÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êý
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕý³£Ìí¼ÓÎïÆ·½øÐÐ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅÐ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
		Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
		return 0
	else 
		return 1
	end
end

function nothing()

end;