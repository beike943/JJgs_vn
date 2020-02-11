-- Event HÌ NgËp Trµn - Vui Rén Rµng 11/06/2008 - 20/07/2008
-- tEventGift table = {ItemName, FreeItemRoom, ItemWeight, Ext_Point_Used}


VUIHE_DATE_START 	= 2008060900
VUIHE_DATE_END 		= 2008072100

VUIHE_EXT_POINT_SML = 3 		-- Tróng gi¶i nhÊt
VUIHE_EXT_POINT_PTL = 4			-- Tróng gi¶i nh×
VUIHE_EXT_POINT_TKH = 5 		-- Tróng gi¶i ba
VUIHE_EXT_POINT_TND = 1 		-- Tróng gi¶i t­
VUIHE_EXT_POINT_BCH = 2 		-- Tróng gi¶i n¨m


tEventHeGift =
{
	[1] = {"Ch­ëng M«n §Æc Phong LÖnh - Cao cÊp",1,1,VUIHE_EXT_POINT_SML}, -- Gi¶i nhÊt
	[2] = {"Phong Th­ëng LÖnh Tiªn Phong - Tèng",1,1,VUIHE_EXT_POINT_PTL}, -- Gi¶i nh×
	[3] = {"Phong Th­ëng LÖnh Tiªn Phong - Liªu",1,1,VUIHE_EXT_POINT_PTL}, -- Gi¶i nh×
	[4] = {"B¶o R­¬ng Tµng KiÕm Hoa Khè",1,1,VUIHE_EXT_POINT_TKH}, -- Gi¶i ba
	[5] = {"ThÇn N«ng §¬n",1,1,VUIHE_EXT_POINT_TND}, -- Gi¶i t­
	[6] = {"B¹ch C©u Hoµn",1,1,VUIHE_EXT_POINT_BCH}, -- Gi¶i n¨m
}


function IsEventHeStart()
	local nDate = tonumber(date("%Y%m%d%H"));
	
	if nDate >= VUIHE_DATE_START and nDate < VUIHE_DATE_END then
		return 1
	end
	return 0
end 