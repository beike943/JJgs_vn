-- Event Ngäa Hæ Tµng Long -  Vâ l©m lÖnh bµi
-- tEventGift table = {ItemName, FreeItemRoom, ItemWeight, Ext_Point_Used}
-- tEventFactionGift = {GiftName,GiftTypeName,GiftLevelRequire,Ext_Bit,Ext_Value,FreeItemRoom}


NHTL_DATE_START 	= 2008060900
NHTL_DATE_END 		= 2009010100

NHTL_EXT_POINT_FACTION = 0 	-- Bao gåm value tµi kho¶n cã lÖnh bµi + sè lÇn nhËn trang bÞ m«n ph¸i

NHTL_EXT_POINT_TND = 1 		-- Tróng gi¶i b¶y
NHTL_EXT_POINT_BCH = 2 			-- Tróng gi¶i t¸m

BIT_LEVEL_30 = 2
BIT_LEVEL_50 = 3
BIT_LEVEL_60 = 4


tEventGift =
{
	[1] = {"ThÇn N«ng §¬n",1,1,NHTL_EXT_POINT_TND}, -- Gi¶i b¶y
	[2] = {"B¹ch C©u Hoµn",1,1,NHTL_EXT_POINT_BCH}, -- Gi¶i t¸m
}

tEventFactionGift =
{
	[1] = {"Trang bÞ m«n ph¸i S¬ cÊp", "Vò KhÝ, M·o, H¹ Y", 30, BIT_LEVEL_30, 2, 3},											-- Level 30
	[2] = {"Trang bÞ m«n ph¸i Trung cÊp", "Vò khÝ, Trang Søc", 50, BIT_LEVEL_50, 4, 3}, 										-- Level 50
	[3] = {"Trang bÞ Tµng KiÕm", "M·o, H¹ Y, Th­îng Y, Trang Søc vµ Vò KhÝ", 60, BIT_LEVEL_60, 8, 6}, 				-- Level 60	
}


function CheckAccount()
	local nCheckAccount = GetExtPoint(NHTL_EXT_POINT_FACTION)	
	if (nCheckAccount > 0) then	
		return 1
	end	
	return 0	
end


function IsEventStart()
	local nDate = tonumber(date("%Y%m%d%H"));
	
	if nDate >= NHTL_DATE_START and nDate < NHTL_DATE_END then
		return 1
	end
	return 0
end 

function CheckFaction(nFaction)
	local tFaction = {0,1,5,7,10,13,16,19}
	local i = 0
	
	if nFaction == nil or nFaction < 0 then
		nFaction = 0
	end
	
	for i=1, getn(tFaction) do
		if nFaction == tFaction[i] then
			return 0
		end
	end
	return 1
end
