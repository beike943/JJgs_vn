Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	local selTab = {
				format("§ång ý/#use_yes(%d)",nItemIdx),
				"Hñy bá/nothing",
				}
	Say("HiÖn giê ng­¬i cã muèn më T«n Quý LÔ Bao kh«ng? Cã thÓ ng­¬i sÏ nhËn ®­îc nh÷ng vËt phÈm sau: 200 danh väng, tói nhá Ngò Hoa Ngäc Lé hoµn, tói nhá Sinh Sinh Hãa T¸n, ngùa cao cÊp (thêi h¹n 7 ngµy), 10 b¹ch c©u hoµn, 10 ®¹i b¹ch c©u hoµn, bao m¶nh Thiªn Th¹ch, Kú L©n hoµn<, Long HuyÕt hoµn, tñ nhá (thêi h¹n 7 ngµy), Trang bÞ Hoµng Kim míi. Chóc ng­¬i may m¾n!",
		getn(selTab),
		selTab);
end;

function use_yes(nItemIdx)
	if gf_JudgeRoomWeight(16,300) == 0 then
		Talk(1,"","Kh«ng ®ñ chç trèng, s¾p xÕp l¹i tr­íc råi h½n më.");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nBody = GetBody();
		ModifyReputation(200,0);
		AddItem(2,1,481,1,4);
		Msg2Player("B¹n nhËn ®­îc 1 Ngò Hoa Ngäc Lé hoµn");
		AddItem(2,1,483,1,4);
		Msg2Player("B¹nh nhËn ®­îc 1 Sinh Sinh Hãa T¸n");
		local nRand = random(1,100);
		local nFlag = 0;
		local nAddIdx = 0;
		if nRand <= 40 then
			nFlag,nAddIdx = AddItem(0,105,11,1,4,-1,-1,-1,-1,-1,-1);
			SetItemExpireTime(nAddIdx,60*60*24*7);
			Msg2Player("Ng­¬i nhËn ®­îc 1 con Tr¶o Hoµng Phi §iÖn");
		elseif nRand <= 80 then
			nFlag,nAddIdx = AddItem(0,105,9,1,4,-1,-1,-1,-1,-1,-1);
			SetItemExpireTime(nAddIdx,60*60*24*7);
			Msg2Player("Ng­¬i nhËn ®­îc 1 con XÝch Thè");
		elseif nRand <= 95 then
			nFlag,nAddIdx = AddItem(0,105,12,1,4,-1,-1,-1,-1,-1,-1);
			SetItemExpireTime(nAddIdx,60*60*24*7);
			Msg2Player("Ng­¬i nhËn ®­îc 1 con Hèt L«i B¸c");
		else
			nFlag,nAddIdx = AddItem(0,105,13,1,4,-1,-1,-1,-1,-1,-1);
			SetItemExpireTime(nAddIdx,60*60*24*7);
			Msg2Player("Ng­¬i nhËn ®­îc 1 con Bé C¶nh");
		end 
		
		nRand = random(1,100);
		if nRand <= 98 then
			nFlag,nAddIdx = AddItem(2,1,1069,1,4);
			SetItemExpireTime(nAddIdx,60*60*24*7);
			Msg2Player("Ng­¬i nhËn ®­îc 1 tñ nhá");
		else
			AddItem(0,110,89+nBody-1,1,4);
			Msg2Player("B¹n nhËn ®­îc 1 Hoµng kim gi¸p khè tö");
			AddItem(0,109,277+nBody-1,1,4);
			Msg2Player("B¹n nhËn ®­îc 1 Hoµng kim gi¸p y phôc");
		end
		
		nRand = random(1,10000);
		if nRand <= 6000 then
			AddItem(2,1,270,10,4);
			Msg2Player("B¹n nhËn ®­îc 10 B¹ch C©u hoµn");
		elseif nRand <= 9800 then
			AddItem(2,1,1007,10,4);
			Msg2Player("B¹n nhËn ®­îc 10 ®¹i B¹ch C©u hoµn");
		elseif nRand <= 9990 then
			AddItem(2,1,1049,1,4);
			Msg2Player("B¹n nhËn ®­îc bao m¶nh Thiªn Th¹ch");
		elseif nRand <= 9995 then
			AddItem(2,1,1003,1,4);
			Msg2Player("B¹nh nhËn ®­îc Kú L©n hoµn");
			Msg2Global(GetName().."Dïng tµi kho¶n t«n quý, më T«n Quý LÔ Bao sÏ nhËn ®­îc phÇn th­ëng Kú L©n hoµn cao cÊp cã gi¸ trÞ liªn thµnh.");
			WriteLog("[T«n Quý LÔ Bao]:"..GetName().."Më bao nhËn ®­îc 1 Kú L©n hoµn.");
		else
			AddItem(2,1,1002,1,4);
			Msg2Player("B¹n nhËn ®­îc Long HuyÕt hoµn");
			Msg2Global(GetName().."Dïng tµi kho¶n t«n quý, më T«n Quý LÔ Bao sÏ nhËn ®­îc phÇn th­ëng Long HuyÕt hoµn cao cÊp cã gi¸ trÞ liªn thµnh.");
			WriteLog("[T«n Quý LÔ Bao]:"..GetName().."Më bao nhËn ®­îc 1 Long HuyÕt hoµn.");		
		end;
		WriteLog("[T«n Quý LÔ Bao]:"..GetName().."Dïng 1 T«n Quý LÔ Bao");
	end;
end;

function nothing()

end;