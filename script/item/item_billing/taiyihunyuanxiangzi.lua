--Ì«Ò×Í¼¼øÏä×Ó
--by vivi
--2008/11/20

function OnUse()
	Say("Dïng Th¸i DÞch §å (r­¬ng) sÏ nhËn ®­îc 100 Th¸i DÞch Hçn Nguyªn C«ng §å, dïng chø?",
		2,
		"\nSö dông/give_tujian",
		"\nKh«ng cÇn/nothing")
end

function give_tujian()
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return 0;
	end
	if DelItem(2,0,1094,1) == 1 then	
		AddItem(2,0,1082,100);
		Msg2Player("B¹n nhËn ®­îc 100 Th¸i DÞch Hçn Nguyªn C«ng §å");
	end
end

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