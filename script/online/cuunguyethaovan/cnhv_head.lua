-- Event Cöu NguyÖt H¶o VËn 29/08/2008 - 30/09/2008
-- tEventCNHVGift table = {ItemName, FreeItemRoom, ItemWeight, Ext_Point_Used}
-- Created by TuanNA5


CNHV_DATE_START 	= 2008090500
CNHV_DATE_END 		= 2008100800


CNHV_EXT_POINT_TND 		= 1 	-- Tróng gi¶i t¸m
CNHV_EXT_POINT_BCH 		= 2 	-- Tróng gi¶i chÝn
CNHV_EXT_POINT_MTSM 	= 3 	-- Tróng gi¶i t­
CNHV_EXT_POINT_TTLD 	= 4 	-- Tróng gi¶i n¨m
CNHV_EXT_POINT_BLTD 	= 5 	-- Tróng gi¶i s¸u
CNHV_EXT_POINT_TTH 		= 6 	-- Tróng gi¶i b¶y


tEventCNHVGift =
{
	[1] = {"ThÇn N«ng §¬n",1,1,CNHV_EXT_POINT_TND}, 		-- Gi¶i t¸m
	[2] = {"B¹ch C©u Hoµn",1,1,CNHV_EXT_POINT_BCH}, 		-- Gi¶i chÝn
	[3] = {"MËt TÞch S­ M«n",1,1,CNHV_EXT_POINT_MTSM}, 	-- Gi¶i t­
	[4] = {"TÈy Tñy Linh §¬n",1,1,CNHV_EXT_POINT_TTLD},	-- Gi¶i n¨m
	[5] = {"Bång Lai Tiªn §¬n",1,1,CNHV_EXT_POINT_BLTD}, 	-- Gi¶i s¸u
	[6] = {"Tam Thanh Hoµn",1,1,CNHV_EXT_POINT_TTH}, 	-- Gi¶i b¶y
}


tBookList =
{
	[1]   = {"Kim Cang Phôc Ma kinh",0,107,1,1},
	[2]   = {"V« TrÇn MËt tÞch",0,107,5,1},
	[3]   = {"TiÒm Long MËt tÞch",0,107,3,1},
	[4]   = {"Thiªn La MËt tÞch",0,107,7,1},
	[5]   = {"Nh­ ý MËt tÞch",0,107,9,1},
	[6]   = {"BÝch H¶i Phæ",0,107,11,1},
	[7]   = {"Hçn §én MËt tÞch",0,107,13,1},
	[8]   = {"Quý Thiªn MËt tÞch",0,107,15,1},
	[9]   = {"HuyÒn ¶nh MËt tÞch",0,107,17,1},
	[10] = {"Qu©n Tö MËt tÞch",0,107,19,1},
	[11] = {"TrÊn Qu©n MËt tÞch",0,107,21,1},
	[12] = {"Xuyªn V©n MËt tÞch",0,107,23,1},
	[13] = {"U Minh Quû Lôc",0,107,25,1},
	[14] = {"Linh Cæ MËt tÞch",0,107,27,1},
}

function IsEventCNHVStart()
	local nDate = tonumber(date("%Y%m%d%H"));	
	if nDate >= CNHV_DATE_START and nDate < CNHV_DATE_END then
		return 1
	end
	return 0
end 