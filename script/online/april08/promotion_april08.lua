-- Event khuyÕn m·i th¸ng 4 - May m¾n thÎ cµo, R­íc vµo v¹n léc
-- tPromotionGift table = {ItemName, FreeItemRoom, ItemWeight, Ext_Point_Used}

tPromotionGift=
{
	[1] = {"B¸t B¶o TÈy Tñy Tiªn ®¬n",1,1,0}, -- Gi¶i t­
	[2] = {"TÈy Tñy linh ®¬n",1,1,1}, -- Gi¶i n¨m
	[3] = {"Sæ tay sèng",1,1,2}, -- Gi¶i s¸u
	[4] = {"B«n Tiªu",1,10,3}, -- Gi¶i b¶y
	[5] = {"ThÇn N«ng §¬n",1,1,4}, -- Gi¶i t¸m
	[6] = {"B¹ch C©u Hoµn",1,1,5}, -- Gi¶i chÝn
}

function RequestPromotionGift()

local gift = {			    
			    	"PhÇn th­ëng Gi¶i T­/#processIndex(1)",
				"PhÇn th­ëng Gi¶i N¨m/#processIndex(2)",
				"PhÇn th­ëng Gi¶i S¸u/#processIndex(3)",
				"PhÇn th­ëng Gi¶i B¶y/#processIndex(4)",
				"PhÇn th­ëng Gi¶i T¸m/#processIndex(5)",
				"PhÇn th­ëng Gi¶i ChÝn/#processIndex(6)",
				"HiÖn t¹i ta ch­a muèn nhËn./SayNo",
				}
	
	Say("Ng­êi ch¬i trong thêi gian tõ <color=Gold>18/04/2008 - 30/05/2008<color> tham gia ch­¬ng tr×nh <color=Gold>Vßng Quay May M¾n<color> sÏ cã c¬ héi nhËn ®­îc c¸c phÇn th­ëng gi¸ trÞ. Thêi gian nhËn th­ëng tõ <color=Gold>18/04/2008 - 07/06/2008<color>. B»ng h÷u nhËn phÇn th­ëng nµo? ",getn(gift),gift)

end


function processIndex(nIndex)
	local nExtVal = GetExtPoint(tPromotionGift[nIndex][4])
	local nFreeItemRoom = GetFreeItemRoom()
	
	if (nExtVal >= 1) then
		if ((nFreeItemRoom >=  nExtVal*tPromotionGift[nIndex][2]) and (GetCurItemWeight() + nExtVal*tPromotionGift[nIndex][3] <= GetMaxItemWeight())) then
			PayExtPoint(tPromotionGift[nIndex][4], nExtVal)
		else
			if ((nFreeItemRoom <  nExtVal*tPromotionGift[nIndex][2])  and (nFreeItemRoom > 0)) then
				Say("Chóc mõng b»ng h÷u ®· tróng th­ëng "..nExtVal.." "..tPromotionGift[nIndex][1]..". Hµnh trang cña b»ng h÷u chØ cã <color=Gold>"..nFreeItemRoom.." « trèng<color> nªn chØ nhËn ®­îc <color=Gold>"..nFreeItemRoom.."<color> "..tPromotionGift[nIndex][1]..". Sau khi nhËn th­ëng h·y s¾p xÕp l¹i hµnh trang råi ®Õn gÆp ta.",2,"§ång ý/#SayYes("..nIndex..","..GetFreeItemRoom()..")","§Ó ta s¾p xÕp l¹i hµnh trang/SayNo")
			else
				Say("Søc lùc hoÆc hµnh trang cña b»ng h÷u kh«ng ®ñ.",0)
				Msg2Player("Søc lùc hoÆc hµnh trang cña b¹n kh«ng ®ñ.")
				return			
			end
		end		
	else
		Say("ChØ cã ng­êi tróng th­ëng míi ®­îc nhËn quµ!",0)
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn quµ.")
	end
end


function SayYes(nIndex, nFreeItemRoom)
	if ((GetFreeItemRoom() >=  nFreeItemRoom*tPromotionGift[nIndex][2]) and (GetCurItemWeight() + nFreeItemRoom*tPromotionGift[nIndex][3] <= GetMaxItemWeight())) then
		PayExtPoint(tPromotionGift[nIndex][4], nFreeItemRoom)
	else
		Say("Søc lùc hoÆc hµnh trang cña b»ng h÷u kh«ng ®ñ.",0)
		Msg2Player("Søc lùc hoÆc hµnh trang cña b¹n kh«ng ®ñ.")
		return
	end
end


function SayNo()
end