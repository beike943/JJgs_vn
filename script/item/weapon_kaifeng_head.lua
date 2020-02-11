	-- ====================== ÎÄ¼þÐÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII ¸ß¼¶ÎäÆ÷¿ª·æÍ·ÎÄ¼þ                  
-- Edited by starry night                                 
-- 2006/05/11 AM 10:47                                    
                                                          
-- ======================================================

--»ñÈ¡±í¸ñÖ§³Ö
Include("\\script\\class\\ktabfile.lua");

--Ïà¹ØÊôÐÔ±í¸ñ
tabCommonKF = new(KTabFile, "\\settings\\item\\weapon_kf_common.txt");
tabSkillKF  = new(KTabFile, "\\settings\\item\\weapon_kf_skill.txt");
tabDJSKF    = new(KTabFile, "\\settings\\item\\weapon_kf_dajiangshi.txt");

--ÊôÐÔÊýÁ¿³öÏÖ¸ÅÂÊ
--¿ª·æÀàÐÍ 1:Ò»°ã¿ª·æ¡¢2£º¾«Ï¸¿ª·æ¡¢3£º´óÊ¦¿ª·æ¡¢4£ºÉñ±ø¿ª·æ
Attribute_Num_Rate = {

	[1] = {{60,0},{40,0},{30,0}},
	[2] = {{80,10},{30,0},{25,0}},
	[3] = {{75,15},{20,0},{15,0}},
	[4] = {}

}

WEAPON_DATA_76 = {

	[1]  = 	{{0,8,97,"A La H¸n Tr­îng"},{2,1,382}},	--ÕÈ
	[2]  = 	{{0,5,40,"LiÖt DiÖm"},{2,1,377}},			--¹÷°ô
	[3]  = 	{{0,6,108,"§¹i Hµo L«i Th­¬ng"},{2,1,383}},	--Ç¹
	[4]  = 	{{0,0,14,"V¹n NhÉn"},{2,1,375}},			--»¤ÊÖ
	[5]  = 	{{0,3,64,"Cæ §Ýnh"},{2,1,379}},			--µ¶
	[6]  = 	{{0,2,36,"Háa Tinh"},{2,1,376}},			--½£
	[7]  = 	{{0,7,12,"L¨ng Phong"},{2,1,386}},			--Ë«µ¶
	[8]  = 	{{0,1,53,"M·n Thiªn Hoa Vò"},{2,1,378}},	--°µÆ÷
	[9]  = 	{{0,9,86,"ThÇn Hµnh"},{2,1,381}},			--±Ê
	[10] = 	{{0,10,75,"Hi Nh©n CÇm"},{2,1,380}},	--ÇÙ
	[11] = 	{{0,11,12,"M·nh hæ"},{2,1,385}},			--×¦
	[12] = 	{{0,4,119,"ThÇn Cung"},{2,1,384}},			--¹­

}

--nKfType:¿ª·æÀàÐÍ 1:Ò»°ã¿ª·æ¡¢2£º¾«Ï¸¿ª·æ¡¢3£º´óÊ¦¿ª·æ¡¢4£ºÉñ±ø¿ª·æ
--nAttributeType:ÎäÆ÷ÀàÐÍ 1£ºÍâ¹¦¡¢2£ºÄÚ¹¦¡¢0£ºÄÚÍâ¹¦
--nWeaponType 1:ÕÈ¡¢2¹÷°ô¡¢3Ç¹¡¢4»¤ÊÖ¡¢5µ¶¡¢6½£¡¢7Ë«µ¶¡¢8°µÆ÷¡¢9±Ê¡¢10ÇÙ¡¢11×¦¡¢12¹­
function Weapon_Kaifeng(nKfType,nAttributeType,nWeaponType)

local nAttribute_1,nAttribute_2,nAttribute_3 = 0,0,0;
local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;
local nOk,nItemIndex = 0,0;

	--ÅÐ¶ÏÉíÉÏÊÇ·ñ´øÓÐÎ´¿ª·æÎäÆ÷
		if GetItemCount(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1) <= 0 then
			Talk(1,"","HiÖn b¹n ch­a cung cÊp vò khÝ cÇn kÝch ho¹t!");
			return
		end
	
	--ÅÐ¶Ï¿ª·æ»¨·ÑÊÇ·ñ³É¹¦¿Û³ý
	if Kf_Cost(nKfType) == 1 then
		nAttribute_1,nAttribute_2,nAttribute_3 = GetWeaponAttributeNum(nKfType);
		
		--ÅÐ¶ÏÎäÆ÷ÊÇ·ñËð»µ
		if IsWeaponDestroy(nAttribute_1,nAttribute_2,nAttribute_3) == 1 then
			Say("V× kü x¶o khai phong ®· dïng kh«ng phï hîp dÉn ®Õn vò khÝ bÞ tæn h¹i.",0);
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			WriteLog("[NhËt ký kÝch ho¹t vò khÝ]".."		Tµi kho¶n:"..GetAccount().."		Tªn:"..GetName().."		Gi¸m ®Þnh 1 "..WEAPON_DATA_76[nWeaponType][1][4].."		KÕt qu¶: ThÊt b¹i!");
		else
			nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3 = GetWeaponAttribute(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType);
			nOk,nItemIndex = AddItem(WEAPON_DATA_76[nWeaponType][1][1],WEAPON_DATA_76[nWeaponType][1][2],WEAPON_DATA_76[nWeaponType][1][3],1,1,nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3);
			SetEquipCanChouQu(nItemIndex,1); 
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			Say("Chóc mõng b¹n, vò khÝ <color=yellow>"..WEAPON_DATA_76[nWeaponType][1][4].."<color> KÝch ho¹t thµnh c«ng!",0);
			WriteLog("[NhËt ký kÝch ho¹t vò khÝ]".."		Tµi kho¶n:"..GetAccount().."		Tªn:"..GetName().."		Gi¸m ®Þnh 1 "..WEAPON_DATA_76[nWeaponType][1][4].."		KÕt qu¶: Thµnh c«ng! NhËn ®­îc mét vËt phÈm, id lµ: *"..WEAPON_DATA_76[nWeaponType][1][1].."*"..WEAPON_DATA_76[nWeaponType][1][2].."*"..WEAPON_DATA_76[nWeaponType][1][3].."*1*1*"..nAttributeLv_1.."*"..nAttributeID_1.."*"..nAttributeLv_2.."*"..nAttributeID_2.."*"..nAttributeLv_3.."*"..nAttributeID_3.."{vò khÝ}");
		end
	else
		Say("VËt liÖu kÝch ho¹t cña b¹n hiÖn kh«ng ®ñ! H·y chuÈn bÞ l¹i!",0);
	end

end

--ÅÐ¶Ï¿Û³ýÏàÓ¦¿ª·æÎïÆ·ÊÇ·ñ³É¹¦
--·µ»ØÖµ 1£º³É¹¦¡¢0£º²»³É¹¦
function Kf_Cost(nKfType)

	if nKfType == 1 then
		if GetItemCount(2,2,8) >= 1 and GetItemCount(2,5,7) >= 3 and GetCash() >= 10000 then
			DelItem(2,2,8,1);
			DelItem(2,5,7,3);
			Pay(10000);
			return 1
		else
			return 0
		end
	end
	
	if nKfType == 2 then
		if GetItemCount(2,2,8) >= 5 and GetItemCount(2,5,7) >= 5 and GetCash() >= 200000 then
			DelItem(2,2,8,5);
			DelItem(2,5,7,5);
			Pay(200000);
			return 1
		else
			return 0
		end
	end
	
	if nKfType == 3 then
		if GetItemCount(2,2,8) >= 10 and GetItemCount(2,5,7) >= 10 and GetItemCount(2,0,397) >= 1 and GetCash() >= 2000000 then
			DelItem(2,2,8,10);
			DelItem(2,5,7,10);
			DelItem(2,0,397,1);
			Pay(2000000);
			return 1
		else
			return 0
		end
	end	
end


--Ñ¡È¡¿ª·æÀàÐÍ¶ÔÓ¦µÄÊôÐÔ±í¸ñ
function SelectAttributeFile(nKfType)

local tabAttributeKF;

	if nKfType == 1 then
		tabAttributeKF = tabCommonKF;
	elseif nKfType == 2 then
		tabAttributeKF = tabSkillKF;
	elseif nKfType == 3 then
		tabAttributeKF = tabDJSKF;
	end
	
	return tabAttributeKF

end

--»ñÈ¡ÎäÆ÷ÊôÐÔ
function GetWeaponAttribute(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType)

local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;

	nAttributeID_1,nAttributeID_2,nAttributeID_3 = GetWeaponAttributeID(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType)
	nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = GetWeaponAttributeLV(nKfType,nAttributeID_1,nAttributeID_2,nAttributeID_3)
	return nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3

end

--¸ù¾ÝÊôÐÔÊýÄ¿Ñ¡È¡ÊôÐÔID
function GetWeaponAttributeID(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType)

local tabAttributeFile = SelectAttributeFile(nKfType);
local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
local argRate = {};
local nRow = 0;

	if nAttribute_1 == 1 then
		nAttributeID_1 = SelectWeaponAttributeID(nKfType,nAttributeType);
	else
		return nAttributeID_1,nAttributeID_2,nAttributeID_3
	end
	
	if nAttribute_2 == 1 then
		nAttributeID_2 = SelectWeaponAttributeID(nKfType,nAttributeType);
		if nAttributeID_2 == nAttributeID_1 then
			nAttributeID_2,nAttributeID_3 = 0,0;
			return nAttributeID_1,nAttributeID_2,nAttributeID_3
		end			
	else
		nAttributeID_2,nAttributeID_3 = 0,0;
		return nAttributeID_1,nAttributeID_2,nAttributeID_3
	end
	
	if nAttribute_3 == 1 then
		nAttributeID_3 = SelectWeaponAttributeID(nKfType,nAttributeType);
		if nAttributeID_3 == nAttributeID_1 or nAttributeID_3 == nAttributeID_2 then
			nAttributeID_3 = 0;
		end
	else
		nAttributeID_3 = 0;
		return nAttributeID_1,nAttributeID_2,nAttributeID_3
	end
	
	return nAttributeID_1,nAttributeID_2,nAttributeID_3
	
end

--»ñÈ¡µ¥¸öÊôÐÔID
function SelectWeaponAttributeID(nKfType,nAttributeType)

local tabAttributeFile = SelectAttributeFile(nKfType);
local	argRow = CreateArrayRowRate(nKfType,nAttributeType);
local nAttributeID = GetAttributeFormRowRateArray(nKfType,argRow);

	return nAttributeID

end


--¸ù¾ÝÎäÆ÷ÊôÐÔÑ¡Ôñ¶ÔÓ¦ÊôÐÔµÈ¼¶
function GetWeaponAttributeLV(nKfType,nAttributeID_1,nAttributeID_2,nAttributeID_3)

local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;

	if nAttributeID_1 ~= 0 and nAttributeID_1 ~= -1 then
		nAttributeLv_1 = SelectWeaponAttributeLV(nKfType,nAttributeID_1);
	else
		return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3
	end

	if nAttributeID_2 ~= 0 and nAttributeID_2 ~= -1 then
		nAttributeLv_2 = SelectWeaponAttributeLV(nKfType,nAttributeID_2);
	else
		return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3
	end
	
	if nAttributeID_3 ~= 0 and nAttributeID_3 ~= -1 then
		nAttributeLv_3 = SelectWeaponAttributeLV(nKfType,nAttributeID_3);
	else
		nAttributeLv_3 = 0;
		return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3
	end

	return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3

end


--¸ù¾ÝÊôÐÔIDÑ¡È¡ÊôÐÔµÈ¼¶
--·µ»ØÖµ£º¸ÃÊôÐÔIDµÈ¼¶
function SelectWeaponAttributeLV(nKfType,nAttributeID)

local argAttributeLv = CreateAttributeLvRowRateArray(nKfType,nAttributeID);
local nAttributeLv = GetAttributeLvFormRateArray(argAttributeLv);

	return nAttributeLv

end


--ÅÐ¶ÏÎäÆ÷ÊÇ·ñÆÆËð
--·µ»ØÖµ 1£ºÒÑ¾­ÆÆËð 0:ÎÞÆÆËð
function IsWeaponDestroy(nAttribute_1,nAttribute_2,nAttribute_3)

	if nAttribute_1 == 2 or nAttribute_2 == 2 or nAttribute_3 == 2 then
		return 1
	else
		return 0
	end

end

--Ñ¡È¡ÎäÆ÷Ëù´øÊôÐÔÊýÁ¿
--·µ»ØÖµ£ºÊôÐÔ1½á¹û£¬ÊôÐÔ2½á¹û£¬ÊôÐÔ3½á¹û
--0£ºÎÞÊôÐÔ£»1£º´øÊôÐÔ£»2Îª¿ª·æÊ§°Ü
function GetWeaponAttributeNum(nKfType)

local i = 0;
local nAttribute_1,nAttribute_2,nAttribute_3 = 0,0,0;


	--ÅÐ¶ÏÊÇ·ñ´øÓÐÊôÐÔ1
	i = random(1,100);
	if i >= 1 and i <= Attribute_Num_Rate[nKfType][1][1] then
		nAttribute_1 = 1;
	elseif i > Attribute_Num_Rate[nKfType][1][1] and i <= Attribute_Num_Rate[nKfType][1][1] + Attribute_Num_Rate[nKfType][1][2] then
		nAttribute_1 = 2;
		nAttribute_2 = 2;
		nAttribute_3 = 2;
		return nAttribute_1,nAttribute_2,nAttribute_3
	else
		return nAttribute_1,nAttribute_2,nAttribute_3
	end
	
	--ÅÐ¶ÏÊÇ·ñ´øÓÐÊôÐÔ2
	if nAttribute_1 == 1 then -- µÚÒ»ÊôÐÔ³öÏÖºó·½ÅÐ¶ÏµÚ¶þÊôÐÔÊÇ·ñ³öÏÖ
		i = random(1,100);
		if i >= 1 and i <= Attribute_Num_Rate[nKfType][2][1] then
			nAttribute_2 = 1;
		elseif i > Attribute_Num_Rate[nKfType][2][1] and i <= Attribute_Num_Rate[nKfType][2][1] + Attribute_Num_Rate[nKfType][2][2] then
			nAttribute_1 = 2;
			nAttribute_2 = 2;
			nAttribute_3 = 2;
			return nAttribute_1,nAttribute_2,nAttribute_3
		else
			return nAttribute_1,nAttribute_2,nAttribute_3
		end
	end
	
	--ÅÐ¶ÏÊÇ·ñ´øÓÐÊôÐÔ3
	if nAttribute_1 == 1 and nAttribute_2 == 1 then --µÚÒ»¡¢¶þÊôÐÔ³öÏÖºó·½ÅÐ¶ÏµÚÈýÊôÐÔÊÇ·ñ³öÏÖ
		i = random(1,100);
		if i >= 1 and i <= Attribute_Num_Rate[nKfType][3][1] then
			nAttribute_3 = 1;
			return nAttribute_1,nAttribute_2,nAttribute_3
		elseif i > Attribute_Num_Rate[nKfType][3][1] and i <= Attribute_Num_Rate[nKfType][3][1] + Attribute_Num_Rate[nKfType][3][2] then
			nAttribute_1 = 2;
			nAttribute_2 = 2;
			nAttribute_3 = 2;
			return nAttribute_1,nAttribute_2,nAttribute_3
		else
			return nAttribute_1,nAttribute_2,nAttribute_3
		end
	end
end

--¸ù¾ÝÄ¿±êÊôÐÔÑ¡È¡¸ÃÊôÐÔµÈ¼¶ÁÐÊý×÷³öÒ»¸öÈ¨ÖØÊý×é
--·µ»ØÖµ£ºÊôÐÔµÈ¼¶È¨ÖØÊý×é
function CreateAttributeLvRowRateArray(nKfType,nAttributeID)

local tabAttributeFile = SelectAttributeFile(nKfType);
local nRow = tabAttributeFile:selectRowNum("AttributeID",tonumber(nAttributeID));
local argAttributeLv = {};
local i = 0;

	for i=1,7 do
		tinsert(argAttributeLv,tabAttributeFile:getCell(nRow,"LevelRate"..i))
	end
	
	return argAttributeLv
end

--¸ù¾ÝÒ»¸öÊôÐÔµÈ¼¶Êý×éÈ¨ÖØ»ñÈ¡µÈ¼¶
--·µ»ØÖµ£ºÄ¿±êÊôÐÔµÄµÈ¼¶
function GetAttributeLvFormRateArray(argAttributeLv)

local i = 0;
local nCount = 0;
local nLuckyNum = 0;

	for i=1,getn(argAttributeLv) do
		nCount = nCount + argAttributeLv[i]
	end
	
	nLuckyNum = random(1,nCount);
	nCount = 0;
	
	for i=1,getn(argAttributeLv) do
		nCount = nCount + argAttributeLv[i]
		if nCount >= nLuckyNum then
			return i
		end
	end
		
	return -1 -- ³ö´íÔò·µ»Ø -1

end


--´ÓÊôÐÔÁÐ±íÖÐÑ¡È¡Âú×ãÌõ¼þµÄÊôÐÔ¹¹ÔìÒ»¸öÐÐÊýÊý×é
--·µ»ØÖµ£ºÒ»¸öÂú×ãÌõ¼þµÄÐÐÊýÊý×é{Row1,Row2¡­¡­}
function CreateArrayRowRate(nKfType,nAttributeType)

local tabAttributeFile = SelectAttributeFile(nKfType);
local argRow = {};
local i = 0;
local nNum = tabAttributeFile:getRow()

	if nAttributeType == 0 then
		for i=3,nNum do
			tinsert(argRow,i);
		end		 
		return argRow
	elseif nAttributeType == 1 then
		for i=3,nNum do
			if tonumber(tabAttributeFile:getCell(i,"AttributeType")) ~= 2 then
				tinsert(argRow,i);
			end
		end
		return argRow
	elseif nAttributeType == 2 then
		for i=3,nNum do
			if tonumber(tabAttributeFile:getCell(i,"AttributeType")) ~= 1 then
				tinsert(argRow,i);
			end		 
		end
		return argRow
	end
end

--´ÓÂú×ãÊôÐÔÌõ¼þµÄÐÐÊýÊý×éÖÐ¸ù¾ÝÈ¨ÖØÑ¡³öÒ»¸öÊôÐÔ
--·µ»ØÖµ£º¸ÃÈ¨ÖØÊôÐÔID
function GetAttributeFormRowRateArray(nKfType,argRow)

local tabAttributeFile = SelectAttributeFile(nKfType); 
local i = 0;
local nCount = 0;
local nLuckyNum = 0;

	for i=1,getn(argRow) do
		nCount = nCount + tabAttributeFile:getCell(argRow[i],"AttributeRate");
	end
	
	nLuckyNum = random(1,nCount);
	nCount = 0;
	
	for i=1,getn(argRow) do
		nCount = nCount + tabAttributeFile:getCell(argRow[i],"AttributeRate");
		if nCount >= nLuckyNum then
			return tabAttributeFile:getCell(argRow[i],"AttributeID")
		end
	end
		
	return -1 -- ³ö´íÔò·µ»ØÎÞÊôÐÔ

end

function Weapon_Kaifeng_Ex(nKfType,nAttributeType,nWeaponType)
	local nAttribute_1,nAttribute_2,nAttribute_3 = 0,0,0;
	local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
	local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;
	local nOk,nItemIndex = 0,0;

	--ÅÐ¶ÏÉíÉÏÊÇ·ñ´øÓÐÎ´¿ª·æÎäÆ÷
		if GetItemCount(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1) <= 0 then
			Talk(1,"","HiÖn b¹n ch­a cung cÊp vò khÝ cÇn kÝch ho¹t!");
			return
		end
	local tbPLBCost = {
			[1] = {2,1,1000,2},	--ÅÍÁúèµ2¸ö
			[2] = {2,1,1000,4},	--ÅÍÁúèµ4¸ö
			[3] = {2,0,136,1},	--Ï´Ëèµ¤1¸ö
			}
	--ÅÐ¶Ï¿ª·æ»¨·ÑÊÇ·ñ³É¹¦¿Û³ý
	if DelItem(tbPLBCost[nKfType][1],tbPLBCost[nKfType][2],tbPLBCost[nKfType][3],tbPLBCost[nKfType][4]) == 1 then
		nAttribute_1,nAttribute_2,nAttribute_3 = GetWeaponAttributeNum(nKfType);
		
		--ÅÐ¶ÏÎäÆ÷ÊÇ·ñËð»µ
		if IsWeaponDestroy(nAttribute_1,nAttribute_2,nAttribute_3) == 1 then
			Say("V× kü x¶o khai phong ®· dïng kh«ng phï hîp dÉn ®Õn vò khÝ bÞ tæn h¹i.",0);
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			WriteLog("[NhËt ký kÝch ho¹t vò khÝ]".."		Tµi kho¶n:"..GetAccount().."		Tªn:"..GetName().."		Gi¸m ®Þnh 1 "..WEAPON_DATA_76[nWeaponType][1][4].."		KÕt qu¶: ThÊt b¹i!");
		else
			nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3 = GetWeaponAttribute(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType);
			nOk,nItemIndex = AddItem(WEAPON_DATA_76[nWeaponType][1][1],WEAPON_DATA_76[nWeaponType][1][2],WEAPON_DATA_76[nWeaponType][1][3],1,1,nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3);
			SetEquipCanChouQu(nItemIndex,1);
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			Say("Chóc mõng b¹n, vò khÝ <color=yellow>"..WEAPON_DATA_76[nWeaponType][1][4].."<color> KÝch ho¹t thµnh c«ng!",0);
			WriteLog("[NhËt ký kÝch ho¹t vò khÝ]".."		Tµi kho¶n:"..GetAccount().."		Tªn:"..GetName().."		Gi¸m ®Þnh 1 "..WEAPON_DATA_76[nWeaponType][1][4].."		KÕt qu¶: Thµnh c«ng! NhËn ®­îc mét vËt phÈm, id lµ: *"..WEAPON_DATA_76[nWeaponType][1][1].."*"..WEAPON_DATA_76[nWeaponType][1][2].."*"..WEAPON_DATA_76[nWeaponType][1][3].."*1*1*"..nAttributeLv_1.."*"..nAttributeID_1.."*"..nAttributeLv_2.."*"..nAttributeID_2.."*"..nAttributeLv_3.."*"..nAttributeID_3.." vò khÝ! Dïng vËt phÈm trong Ngù C¸c ®Ó mëi bao, C¸c kiÓu më:"..nKfType);
		end
	else
		Say("VËt liÖu kÝch ho¹t cña b¹n hiÖn kh«ng ®ñ! H·y chuÈn bÞ l¹i!",0);
	end

end;
