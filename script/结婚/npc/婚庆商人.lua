Include("\\script\\½á»é\\marriage_head.lua");

g_InfoHeader = "<color=green>Th­¬ng nh©n h«n lÔ<color>:";

function main()
	local selTab = {
				"Mua tiÓu hång bao/buy_xiaohongbao",
				"Mua ph¸o/buy_banger",
				"Kh«ng mua/cancel",
				}
	Say(g_InfoHeader.."TÊt c¶ vËt phÈm phôc vô cho h«n lÔ bæn tiÖm ®Òu kh«ng thiÕu. Kh¸ch quan "..gf_GetPlayerSexName().."cÇn mua g×?",getn(selTab),selTab);
end;

function buy_xiaohongbao()
	local selTab = {
			"§ång ý/buy_hongbao_confirm",
			"§Ó ta nghÜ l¹i/cancel",
			}
	Say(g_InfoHeader.."Mua tiÓu hång bao mÊt 100 l­îng, më ra cã thÓ nhËn ®­îc 88 l­îng. Mua kh«ng?",getn(selTab),selTab);
end;

function buy_hongbao_confirm()
	if gf_JudgeRoomWeight(2,10) ~= 1 then
		Talk(1,"",g_InfoHeader.."Ng­¬i cÇn s¾p xÕp l¹i hµnh lý, kho¶ng trèng kh«ng ®ñ.");
		return 0;
	end;
	if Pay(1000000) == 1 then
		AddItem(2,1,508,1);
		Msg2Player("B¹n mua ®­îc tiÓu hång bao")
		WriteLog("[KÕt h«n]:"..GetName().."Mua ®­îc tiÓu hång bao");
	else
		Msg2Player("B¹n kh«ng ®ñ tiÒn ");
	end;
end;

function buy_banger()
	local selTab = {
			"Mua ph¸o/#buy_banger_confirm(1)",
			"Mua mét phong ph¸o/#buy_banger_confirm(2)",
			"Ta muèn xem c¸c vËt phÈm kh¸c/main",
			}
	Say(g_InfoHeader.."Ph¸o 50 l­îng b¹c 1 viªn, 1 phong ph¸o cÇn 1 l­îng vµng",getn(selTab),selTab);
end;

function buy_banger_confirm(nType)
	if gf_JudgeRoomWeight(2,10) ~= 1 then
		Talk(1,"",g_InfoHeader.."Ng­¬i cÇn s¾p xÕp l¹i hµnh lý, kho¶ng trèng kh«ng ®ñ.");
		return 0;
	end;
	if nType == 1 then
		if Pay(5000) == 1 then
			AddItem(2,3,214,1);
			Msg2Player("B¹n mua 1 viªn ph¸o")
		else
			Msg2Player("B¹n kh«ng ®ñ tiÒn ");
		end;		
	else
		if Pay(10000) == 1 then
			AddItem(2,3,215,1);
			Msg2Player("B¹n mua 1 phong ph¸o")
		else
			Msg2Player("B¹n kh«ng ®ñ tiÒn ");
		end;	
	end;
end;