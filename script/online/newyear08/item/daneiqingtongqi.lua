--08´º½Ú´óÄÚÇàÍ­Æ÷½Å±¾
--by vivi
--2008/01/14

tSuipian = {
		{"M¶nh ®ång cÊp 2",2,1,3212,25,712},
		{"Phèi kiÖn Thanh §ång ®Ønh cÊp 1",2,1,3220,3,715},
		{"Phèi kiÖn Thanh §ång ®Ønh cÊp 2",2,1,3221,3,725},
		{"Phèi kiÖn Thanh §ång ®Ønh cÊp 3",2,1,3222,10,750},
		{"Phèi kiÖn Thanh §ång ®Ønh cÊp 4",2,1,3223,12,1000}
		};

function OnUse()
	Say("<color=green>§¹i Néi Thanh §ång<color>: Mçi khi sö dông §¹i Néi Thanh §ång, x¸c suÊt nhËn ®­îc vËt phÈm nh­ sau. B¹n chÊp nhËn? \n 1 m¶nh ®ång h÷u dông 100% \n 25 m¶nh ®ång cÊp 2: 71.2 %\n 12 Thanh §ång ®Ønh phèi kie65nc Êp 4: 25% \n 10 Thanh §ång ®Ønh phèi kiÖn cÊp 3: 2.5% \n 3 Thanh §ång ®Ønh phèi kiÖn cÊp 2: 1%\n 3 Thanh §ång ®Ønh phèi kiÖn cÊp: 0.3%",
		2,
		"§­îc/use_daneiqingtongqi",
		"Kh«ng cÇn/nothing")
end

function use_daneiqingtongqi()
	if Zgc_pub_goods_add_chk(2,26) ~= 1 then
		return
	end
	if DelItem(2,1,3208,1) == 1 then
		local nRand = random(1,1000);
		local nIdx = 0;
		for i = 1,getn(tSuipian) do
			if nRand <= tSuipian[i][6] then
				nIdx = i;
				break
			end
		end
		AddItem(tSuipian[nIdx][2],tSuipian[nIdx][3],tSuipian[nIdx][4],tSuipian[nIdx][5]);
		AddItem(2,1,3217,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tSuipian[nIdx][5].."c¸i"..tSuipian[nIdx][1]);
	end
end

--º¯ÊıÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êı
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕı³£Ìí¼ÓÎïÆ·½øĞĞ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end

function nothing()

end