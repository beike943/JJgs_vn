--ÌìµØÐþ»Æ±¦Ïä
--by vivi
--2008/04/14

tTiandiBox = {{"R­¬ng Thiªn §Þa HuyÒn Hoµng Qu¸n",2,0,1055},{"R­¬ng Thiªn §Þa HuyÒn Hoµng Gi¸p",2,0,1056},{"R­¬ng Thiªn §Þa HuyÒn Hoµng Trang",2,0,1057},{"R­¬ng Thiªn §Þa HuyÒn Hoµng vò khÝ",2,0,1058}}

tTiandi = {
	{{"Thiªn §Þa HuyÒn Hoµng Kh«i",0,103,85},{"Thiªn §Þa HuyÒn Hoµng Kh«i",0,103,86},{"Thiªn §Þa HuyÒn Hoµng Kh«i",0,103,87},{"Thiªn §Þa HuyÒn Hoµng Kh«i",0,103,88}},
	{{"Thiªn §Þa HuyÒn Hoµng Gi¸p ",0,100,85},{"Thiªn §Þa HuyÒn Hoµng Gi¸p ",0,100,86},{"Thiªn §Þa HuyÒn Hoµng Gi¸p ",0,100,87},{"Thiªn §Þa HuyÒn Hoµng Gi¸p ",0,100,88}},
	{{"Thiªn §Þa HuyÒn Hoµng Trang",0,101,85},{"Thiªn §Þa HuyÒn Hoµng Trang",0,101,86},{"Thiªn §Þa HuyÒn Hoµng Trang",0,101,87},{"Thiªn §Þa HuyÒn Hoµng Trang",0,101,88}},
	{[0]={{"Thiªn §Þa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Þa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Þa HuyÒn Hoµng C«n",0,5,43},{"Thiªn §Þa HuyÒn Hoµng KhÝ ",0,1,56},{"Thiªn §Þa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Þa HuyÒn Hoµng CÇm",0,10,78},{"Thiªn §Þa HuyÒn Hoµng Bót ",0,9,89},{"Thiªn §Þa HuyÒn Hoµng Tr­îng",0,8,100},{"Thiªn §Þa HuyÒn Hoµng Th­¬ng ",0,6,111},{"Thiªn §Þa HuyÒn Hoµng Cung ",0,4,122},{"Thiªn §Þa HuyÒn Hoµng Tr¶o",0,11,15},{"Thiªn §Þa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [1]={{"Thiªn §Þa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Þa HuyÒn Hoµng C«n",0,5,43},{"Thiªn §Þa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Þa HuyÒn Hoµng Tr­îng",0,8,100}},
	 [2]={{"Thiªn §Þa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Þa HuyÒn Hoµng C«n",0,5,43}},
	 [3]={{"Thiªn §Þa HuyÒn Hoµng Tr­îng",0,8,100}},
	 [4]={{"Thiªn §Þa HuyÒn Hoµng Thñ",0,0,17}},
	 [5]={{"Thiªn §Þa HuyÒn Hoµng KhÝ ",0,1,56}},
	 [6]={{"Thiªn §Þa HuyÒn Hoµng KhÝ ",0,1,56}},
	 [7]={{"Thiªn §Þa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Þa HuyÒn Hoµng CÇm",0,10,78}},
	 [8]={{"Thiªn §Þa HuyÒn Hoµng KiÕm ",0,2,39}},
	 [9]={{"Thiªn §Þa HuyÒn Hoµng CÇm",0,10,78}},
	 [10]={{"Thiªn §Þa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Þa HuyÒn Hoµng C«n",0,5,43}},
	 [11]={{"Thiªn §Þa HuyÒn Hoµng Thñ",0,0,17}},
	 [12]={{"Thiªn §Þa HuyÒn Hoµng C«n",0,5,43}},
	 [13]={{"Thiªn §Þa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Þa HuyÒn Hoµng Bót ",0,9,89}},
	 [14]={{"Thiªn §Þa HuyÒn Hoµng KiÕm ",0,2,39}},
	 [15]={{"Thiªn §Þa HuyÒn Hoµng Bót ",0,9,89}},
	 [16]={{"Thiªn §Þa HuyÒn Hoµng Th­¬ng ",0,6,111},{"Thiªn §Þa HuyÒn Hoµng Cung ",0,4,122}},
	 [17]={{"Thiªn §Þa HuyÒn Hoµng Th­¬ng ",0,6,111}},
	 [18]={{"Thiªn §Þa HuyÒn Hoµng Cung ",0,4,122}},
	 [19]={{"Thiªn §Þa HuyÒn Hoµng Tr¶o",0,11,15},{"Thiªn §Þa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [20]={{"Thiªn §Þa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [21]={{"Thiªn §Þa HuyÒn Hoµng Tr¶o",0,11,15}}}
	};

function OnUse(nIndex)
	local nId1,nId2,nId3 = GetItemInfoByIndex(nIndex);
	local nTabIdx = 0;
	for i=1,getn(tTiandiBox) do
		if nId1 == tTiandiBox[i][2] and nId2 == tTiandiBox[i][3] and nId3 == tTiandiBox[i][4] then
			nTabIdx = i;
			break
		end
	end
	if nTabIdx == 0 then
		return 0;
	end
	if nTabIdx ~= 4 then
		Say("Sö dông "..tTiandiBox[nTabIdx][1].."SÏ nhËn ®­îc trang bÞ Thiªn §Þa HuyÒn Hoµng t­¬ng øng, ®ång ý dïng chø?",
			2,
			"§­îc/#choose_tiandi_lingqi("..nTabIdx..",0)",
			"Kh«ng cÇn/nothing");
	else
		Say("Sö dông "..tTiandiBox[nTabIdx][1].."SÏ nhËn ®­îc vò khÝ Thiªn §Þa HuyÒn Hoµng cña l­u ph¸i t­¬ng øng, ®ång ý dïng chø?",
			2,
			"§­îc/choose_tiandi_weapon",
			"Kh«ng cÇn/nothing");
	end
end

function choose_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("B¹n muèn ®æi mãn vò khÝ nµo?",
			3,
			"Thiªn §Þa HuyÒn Hoµng Dao/#choose_tiandi_lingqi(4,1)",
			"Thiªn §Þa HuyÒn Hoµng C«n/#choose_tiandi_lingqi(4,2)",
			"T¹m thêi kh«ng ®æi. /nothing")
	else
		choose_tiandi_lingqi(4,0);
	end
end

function choose_tiandi_lingqi(nTabIdx,nType)
	Say("H·y chän ®iÓm linh khÝ cña trang bÞ nµy.",
		3,
		"119 linh khÝ [Cµn Kh¶m ChÊn CÊn]/#confirm_give_tiandi("..nTabIdx..","..nType..",119)",
		"120 linh khÝ [Kh«n §oµi Ly Tèn]/#confirm_give_tiandi("..nTabIdx..","..nType..",120)",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function confirm_give_tiandi(nTabIdx,nType,nLingqi)
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then	
		return
	end
	if DelItem(tTiandiBox[nTabIdx][2],tTiandiBox[nTabIdx][3],tTiandiBox[nTabIdx][4],1) ==	1 then
		if nTabIdx ~= 4 then
			local nBody = GetBody();
			local add_flag,add_idx = AddItem(tTiandi[nTabIdx][nBody][2],tTiandi[nTabIdx][nBody][3],tTiandi[nTabIdx][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
				SetEquipCanChouQu(add_idx,1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tTiandi[nTabIdx][nBody][1]);
				WriteLog("Ho¹t ®éng 1-5: Ng­êi ch¬i"..GetName().."Sö dông "..tTiandiBox[nTabIdx][1].."NhËn ®­îc"..tTiandi[nTabIdx][nBody][1]);
			else
				WriteLog("Ho¹t ®éng 1-5: Ng­êi ch¬i"..GetName().."Sö dông "..tTiandiBox[nTabIdx][1].."NhËn ®­îc thÊt b¹i, vÞ trÝ thÊt b¹i: "..add_flag);
			end
		else
			local nRoute = GetPlayerRoute();
			if nRoute == 2 then
				local add_flag,add_idx = AddItem(tTiandi[nTabIdx][nRoute][nType][2],tTiandi[nTabIdx][nRoute][nType][3],tTiandi[nTabIdx][nRoute][nType][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tTiandi[nTabIdx][nRoute][nType][1]);
					WriteLog("Ho¹t ®éng 1-5: Ng­êi ch¬i"..GetName().."Sö dông "..tTiandiBox[nTabIdx][1].."NhËn ®­îc"..tTiandi[nTabIdx][nRoute][nType][1]);
				else
					WriteLog("Ho¹t ®éng 1-5: Ng­êi ch¬i"..GetName().."Sö dông "..tTiandiBox[nTabIdx][1].."NhËn ®­îc thÊt b¹i, vÞ trÝ thÊt b¹i: "..add_flag);
				end	
			else
				local nRand = random(1,getn(tTiandi[nTabIdx][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nTabIdx][nRoute][nRand][2],tTiandi[nTabIdx][nRoute][nRand][3],tTiandi[nTabIdx][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tTiandi[nTabIdx][nRoute][nRand][1]);
					WriteLog("Ho¹t ®éng 1-5: Ng­êi ch¬i"..GetName().."Sö dông "..tTiandiBox[nTabIdx][1].."NhËn ®­îc"..tTiandi[nTabIdx][nRoute][nRand][1]);
				else
					WriteLog("Ho¹t ®éng 1-5: Ng­êi ch¬i"..GetName().."Sö dông "..tTiandiBox[nTabIdx][1].."NhËn ®­îc thÊt b¹i, vÞ trÝ thÊt b¹i: "..add_flag);
				end	
			end					
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