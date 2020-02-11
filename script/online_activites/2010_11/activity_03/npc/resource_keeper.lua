Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\2010_11\\activity_03\\head.lua");

RK_results =
{
	"Rêi khái/gf_DoNothing",
	"Thêi gian kh«ng cßn nhiÒu n÷a, h·y nhanh chãng thu thËp nh÷ng nguyªn liÖu ®ã cho ta",
	"H«m nay c¸c h¹ ®· ®æi vËt phÈm nµy råi"
}

RK_itemList = 
{
	{{0, 200, 30003}, 500, "ThiÕt Phñ míi"}, 
	{{0, 200, 30001}, 500, "Cuèc Chim míi"}, 
	{{0, 200, 30002}, 500, "Cuèc míi"},
	{{0, 200, 30004}, 500, "Cuèc Thuèc míi"}
}

function RK_notEnoughResource()
	local head = RK_results[2];
	local menu = {RK_results[1]};
	Say(head, getn(menu), menu);
end

function RK_exchanged()
	local head = RK_results[3];
	local menu = {RK_results[1]};
	Say(head, getn(menu), menu);
end

function RK_exchange(index)
	if 1 == GT_hasExchanged(index) then
		RK_exchanged();
	elseif 0 == GT_isEnoughResource(index) then
		RK_notEnoughResource();
	else
		GT_exchange(index);
	end
end

function RK_buyItem(index)
	local itemID = RK_itemList[index][1];
	local cost = RK_itemList[index][2];
	if GetCash() < cost then
		Talk(1,"","Hµnh trang kh«ng ®ñ tiÒn!");
		return
	end
	if 1 == gf_Judge_Room_Weight(1, 0, "") then
		if 1 == Pay(cost) then
			local tmpItemID = {itemID[1], itemID[2], itemID[3], 1};
			local itemName = RK_itemList[index][3];
			gf_AddItemEx2(tmpItemID, itemName, "gather event", "buy");
		end
	end
end

function RK_showItemList()
	local head = "Mua ®¹o cô thu thËp";
	local menu = {
		"Mua ThiÕt Phñ (5 b¹c)/#RK_buyItem(1)",
		"Mua Cuèc (5 b¹c)/#RK_buyItem(2)",
		"Mua Cuèc Chim (5 b¹c)/#RK_buyItem(3)",
		"Mua Cuèc Thuèc (5 b¹c)/#RK_buyItem(4)",
		"Tho¸t/gf_DoNothing"
	};
	Say(head, getn(menu), menu);
end

function main()
	--WriteLog("main::called");
	local head = "Nghe nãi khu vùc TuyÒn Ch©u ®Êt ®ai mµu mì tµi nguyªn thiªn nhiªn v« h¹n, nay quèc gia ®ang rÊt cÇn nhiÒu tµi nguyªn ®Ó phôc vô qu©n ®éi chèng giÆc ngo¹i x©m. NÕu c¸c h¹ cã thÓ thu thËp gióp ta tÊt nhiªn sÏ cã lÔ vËt hËu t¹.";
	local menu = {
		"Ta muèn nép 300 Gç/#RK_exchange(1)",
		"Ta muèn nép 300 Lóa/#RK_exchange(2)",
		"Ta muèn nép 180 §¸/#RK_exchange(3)",
		"Ta muèn nép 180 S¾t/#RK_exchange(4)",
		"Mua ®¹o cô thu thËp/RK_showItemList",
		"Ta chØ ghÐ ngang/gf_DoNothing"
		};
	Say(head, getn(menu), menu);
end