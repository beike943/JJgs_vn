--×Ï¹â×°±¸Ç¿»¯Ê¯
--by vivi
--2008/07/10

tZiguangDiji = {
	{0,103,2351},
	{0,100,2351},
	{0,101,2351}
};

tZiguangGaoji = {
	{{0,103,2355},{0,103,2359},{0,103,2363},{0,103,2367},{0,103,2371}},
	{{0,100,2355},{0,100,2363},{0,100,2371},{0,100,2379},{0,100,2387},{0,100,2359},{0,100,2367},{0,100,2375},{0,100,2383},{0,100,2391}},
	{{0,101,2355},{0,101,2359},{0,101,2363},{0,101,2367},{0,101,2371}}
};

tZiguangWp = {{0,3,2351},{0,5,2352},{0,8,2353},{0,0,2354},{0,1,2355},{0,2,2356},{0,10,2357},{0,0,2358},{0,5,2359},{0,2,2360},{0,9,2361},{0,6,2362},{0,4,2363},{0,7,2364},{0,11,2365}};

tZiguangshi = {{2,0,1065,"Tö Quang Thiªn Th¹ch","§é c­êng hãa trang bÞ Tö Quang thÊp h¬n 4, th× ph¶i n©ng cÊp thµnh 4",4},{2,0,1066,"Tö Quang §Þa Th¹ch","§é c­êng hãa trang bÞ Tö Quang lµ 4, th× ph¶i n©ng cÊp thµnh 5",5},{2,0,1067,"Tö Quang HuyÒn Th¹ch","§é c­êng hãa trang bÞ Tö Quang lµ 5, th× ph¶i n©ng cÊp thµnh 6",6},{2,0,1068,"Tö Quang Hoµng Th¹ch","§é c­êng hãa trang bÞ Tö Quang lµ 6, th× ph¶i n©ng cÊp thµnh 7",7}};

function OnUse(nIndex)
	local nId1,nId2,nId3 = GetItemInfoByIndex(nIndex);
	local nIdx = 0;
	for i=1,getn(tZiguangshi) do
		if nId3 == tZiguangshi[i][3] then
			nIdx = i;
			break
		end
	end
	Say(tZiguangshi[nIdx][4].." cã thÓ gióp b¹n ®em  "..tZiguangshi[nIdx][5]..", b¹n x¸c nhËn muèn sö dông chø?",
		2,
		"§­îc/#choose_weizhi("..nIdx..")",
		"Sö dông sau/nothing")
end

function nothing()

end

function choose_weizhi(nIdx)
	Say("B¹n  muèn c­êng hãa trang bÞ nµo?",
		5,
		"§Çu/#confirm_qianghua_ziguang(1,"..nIdx..")",
		"Ngo¹i trang/#confirm_qianghua_ziguang(2,"..nIdx..")",
		"H¹ y/#confirm_qianghua_ziguang(3,"..nIdx..")",
		"Vò khÝ/#confirm_qianghua_ziguang(4,"..nIdx..")",
		"§îi ta mÆc trang bÞ lªn ®·./nothing")	
end

function confirm_qianghua_ziguang(nWz,nIdx)
	local tWz = {0,1,3,2};
	local nIndex = GetPlayerEquipIndex(tWz[nWz]); --»ñÈ¡×°±¸Ë÷Òý
	local nId1,nId2,nId3 = GetPlayerEquipInfo(tWz[nWz]); --»ñÈ¡×°±¸id
	local nQianghua = GetEquipAttr(nIndex,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --»ñÈ¡ÊÇ·ñËø¶¨
	local nRandSeed = GetItemRandSeed(nIndex);--Ëæ»úÖÖ×Ó	
	local nBody = GetBody()-1;
	
	if nIndex == 0 then
		Talk(1,"","Trªn ng­êi b¹n hiÖn kh«ng cã trang bÞ.");
		return
	end
	
	if nLock == 1 then
		Talk(1,"","Trang bÞ  nµy ®· khãa, kh«ng thÓ c­êng hãa.");
		return
	end
	if Zgc_pub_goods_add_chk(1,10) ~= 1 then
		return
	end
	local nFlag = 0; 
	if nWz ~= 4 then
		if nId3 == (tZiguangDiji[nWz][3]+nBody) then
			nFlag = 1;
		else
			for i=1,getn(tZiguangGaoji[nWz]) do 
				if nId3 == (tZiguangGaoji[nWz][i][3]+nBody) then
					nFlag = i;
					break;
				end
			end
		end
	else
		for i=1,getn(tZiguangWp) do
			if nId1 == tZiguangWp[i][1] and nId2 == tZiguangWp[i][2] and nId3 == tZiguangWp[i][3] then
				nFlag = i;
				break
			end
		end
	end		
	if nFlag == 0 then
		Talk(1,"","Trªn ng­êi b¹n hiÖn giê kh«ng ph¶i lµ trang bÞ Tö Quang.");
		return
	else
		if (nIdx == 1 and nQianghua >= tZiguangshi[nIdx][6]) or (nIdx == 2 and nQianghua ~= (tZiguangshi[nIdx][6]-1)) or (nIdx == 3 and nQianghua ~= (tZiguangshi[nIdx][6]-1)) or (nIdx == 4 and nQianghua ~= (tZiguangshi[nIdx][6]-1)) then
			Talk(1,"","Bé trang bÞ trªn ng­êi b¹n kh«ng ®ñ ®iÒu kiÖn, ®iÒu kiÖn "..tZiguangshi[nIdx][4].." sö dông lµ <color=yellow>"..tZiguangshi[nIdx][5].."<color>");
		else
			if DelItemByIndex(nIndex,-1) == 1 and DelItem(tZiguangshi[nIdx][1],tZiguangshi[nIdx][2],tZiguangshi[nIdx][3],1) == 1 then
				AddItem(nId1,nId2,nId3,1,1,-1,-1,-1,-1,-1,-1,0,tZiguangshi[nIdx][6],0,nRandSeed);
			end
		end
	end
end

--¶Ôµ±Ç°Íæ¼Ò¿É·ñÕý³£Ìí¼ÓÎïÆ·½øÐÐ¼ì²â 
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