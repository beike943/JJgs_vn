Include("\\script\\class\\ktabfile.lua")
tabLVEXP = new(KTabFile, "\\settings\\uplevel.txt");
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");

function OnUse()
	local selTab = {
				"V©ng, ta kh«ng thÓ ®îi ®­îc n÷a./confirm",
				"Sau nµy h·y më/nothing",
				}
	Say("Më lÔ bao sÏ ®­îc nhiÒu vËt phÈm, xin x¸c nhËn hµnh trang b¹n cßn chç trèng vµ søc lùc cßn ®ñ ®Ó tr¸nh tæn thÊt ®¸ng tiÕc. B¹n x¸c nhËn muèn më lÔ bao?",getn(selTab),selTab);
end;

function confirm()
	if DelItem(tItemOther["present_bag"][2],tItemOther["present_bag"][3],tItemOther["present_bag"][4],1) == 1 then
		local nRandomNum = 0;
		local nRow = tonumber(tabLVEXP:selectRowNum("CÊp",GetLevel()+1))
		local nExp = tonumber(tabLVEXP:getCell(nRow,"Kinh nghiÖm ®¼ng cÊp nh©n vËt"))
		local nRetCode = 0;
		if nExp < 0 or nExp > 1950000000 then	--ÒÔĞ¡ÓÚ0»ò´óÓÚÉı99¼¶ËùĞè¾­ÑéÎªÒì³£
			WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]:"..GetName().."Më lÔ bao nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm ®Æc biÖt, trŞ sè lµ:"..nExp);
			return 0;
		end;
		nExp = floor(nExp/100);
		if nExp < 500000 then
			nExp = 500000;
		end;
		ModifyExp(nExp);
		Msg2Player("B¹n nhËn ®­îc 1% ®iÓm kinh nghiÖm");
		WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]:"..GetName().."Më lÔ bao nhËn ®­îc 1% ®iÓm kinh nghiÖm:"..nExp);
		nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			nRow = tonumber(tabLVEXP:selectRowNum("CÊp",GetLevel()+1))
			nExp = tonumber(tabLVEXP:getCell(nRow,"Kinh nghiÖm ®¼ng cÊp nh©n vËt"))
			if nExp < 0 or nExp > 1950000000 then	--ÒÔĞ¡ÓÚ0»ò´óÓÚÉı99¼¶ËùĞè¾­ÑéÎªÒì³£
				WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]:"..GetName().."Më lÔ bao nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm ®Æc biÖt, trŞ sè lµ:"..nExp);
				return 0;
			end;
			nExp = floor(nExp/100)*4;
			if nExp < 2000000 then
				nExp = 2000000;
			end;
			ModifyExp(nExp);
			Msg2Player("B¹n nhËn ®­îc 4% ®iÓm kinh nghiÖm");	
			WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]:"..GetName().."Më lÔ bao nhËn ®­îc 4% ®iÓm kinh nghiÖm:"..nExp);
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			nRetCode = AddItem(1,1,19,32);
			if nRetCode == 1 then
				Msg2Player("B¹n nhËn ®­îc 32 T©y B¾c Väng");
				WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]:"..GetName().."Më lÔ bao nhËn ®­îc 32 T©y B¾c Väng");
			else
				WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]:"..GetName().."Lçi më lÔ bao nhËn ®­îc T©y B¾c Väng, trŞ quay l¹i AddItem:"..nRetCode);
			end;
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			nRetCode = AddItem(1,1,15,32);
			if nRetCode == 1 then
				Msg2Player("B¹n nhËn ®­îc 32 b¸nh Bét vµng");
				WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]:"..GetName().."Më lÔ bao nhËn ®­îc 32 b¸nh Bét vµng");
			else
				WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]:"..GetName().."Lçi më lÔ bao nhËn ®­îc b¸nh Bét vµng, trŞ quay l¹i AddItem:"..nRetCode);
			end;
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			nRetCode = AddItem(1,1,17,32);
			if nRetCode == 1 then
				Msg2Player("B¹n nhËn ®­îc 32 c¸i NhŞ ThËp Tø KiÒu Minh NguyÖt D¹");
				WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]:"..GetName().."Më lÔ bao nhËn ®­îc 32 NhŞ ThËp Tø KiÒu Minh NguyÖt D¹");
			else
				WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]:"..GetName().."Lçi më lÔ bao nhËn ®­îc 32 NhŞ ThËp Tø KiÒu Minh NguyÖt D¹, trŞ quay l¹i AddItem:"..nRetCode);
			end;
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 50 then
			nRetCode = AddItem(tItemOther["transformer_card"][2],tItemOther["transformer_card"][3],tItemOther["transformer_card"][4],1);
			if nRetCode == 1 then
				Msg2Player("B¹n nhËn ®­îc 1 "..tItemOther["transformer_card"][1]);
				WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]:"..GetName().."Më lÔ bao nhËn ®­îc 1 "..tItemOther["transformer_card"][1]);
			else
				WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]:"..GetName().."Më lÔ bao nhËn ®­îc "..tItemOther["transformer_card"][1].."Cã lçi, trŞ quay l¹i AddItem:"..nRetCode);
			end;
		end;
	end;
end;

function nothing()

end;