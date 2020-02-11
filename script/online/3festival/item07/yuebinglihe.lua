--ÔÂ±ıÀñºĞ½Å±¾
--by vivi
--09/14/2007

tYuebing = { 
	{"ThŞnh ThÕ Mai Hµn H­¬ng NguyÖt",2,0	,1008,30},
	{"ThŞnh ThÕ B¹ch Ngäc Song NguyÖt",2,0	,1009,45},
	{"ThŞnh ThÕ Kú H­¬ng Ngò Nh©n NguyÖt",2,0	,1010,70},
	{"ThŞnh ThÕ B¸ch Hoa ThËp CÈm NguyÖt",2,0	,1011,90},
	{"ThŞnh ThÕ ThÊt Tinh B¹n Qu©n NguyÖt",2,0	,1012,97},
	{"ThŞnh ThÕ H»ng Nga Thñy Tinh NguyÖt",2,0	,1013,100}
	}

function OnUse()
	Say("Më hép b¸nh Trung Thu ngÉu nhiªn nhËn ®­îc 1 b¸nh Trung Thu ThŞnh ThÕ, më kh«ng? ",
		3,
		"§ång ı/confirm_yuebing",
		"Ta muèn xem x¸c suÊt nhËn ®­îc b¸nh Trung Thu./about_prob",
		"Kh«ng cã g×/nothing")
end

function confirm_yuebing()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if DelItem(2,0,1020,1) == 1 then
		local nRand = random(1,100)
		for i=1,getn(tYuebing) do
			if nRand <= tYuebing[i][5] then
				local add_flag = AddItem(tYuebing[i][2],tYuebing[i][3],tYuebing[i][4],1,1);
				if add_flag == 1 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tYuebing[i][1].." 1!");
					if i == getn(tYuebing) then
						Msg2Global("Ng­êi ch¬i"..GetName().."Më hép b¸nh Trung Thu nhËn ®­îc "..tYuebing[i][1].." 1!");
					end
				else
					WriteLog("Hép b¸nh Trung Thu: "..GetName().."Më b¸nh Trung Thu nhËn ®­îc b¸nh Trung Thu thÊt b¹i, vŞ trİ thÊt b¹i:"..add_flag);
				end
				break
			end
		end
	end
end

function about_prob()
	local sDia = "";
	local nProb = tYuebing[1][5];
	for i=1,getn(tYuebing) do
		if i > 1 then
			nProb = tYuebing[i][5]-tYuebing[i-1][5];
		end
		sDia = sDia..tYuebing[i][1].."  <color=yellow>"..nProb.."%<color>\n";
	end
	Talk(1,"OnUse",sDia);
end 

function nothing()

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