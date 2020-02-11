Include("\\script\\online_activites\\2010_12\\activity_05\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

CR_Head = "<color=green>Xa Phu ®Êu tr­êng TuyÕt: <color>Ho¹t ®éng §Êu Tr­êng TuyÕt 1 ngµy tiÕn hµnh 3 lÇn, thêi gian bao gåm 11:30, 17:30, 21:30, mçi trËn ®Êu duy tr× 1 giê; §iÒu kiÖn tham gia cÊp 80 trë lªn, ®· gia nhËp m«n ph¸i, ®· kÝch ho¹t c¶nh giíi kinh m¹ch.";

CR_Menu1 = 
{
	"Vµo §Êu Tr­êng TuyÕt (tiªu hao 5 vµng tÆng 10 TiÓu TuyÕt CÇu)/CR_DoEnter",
	"Mua ®¹n tuyÕt cÇu/CR_DoShowSaleList",
	"Rêi khái/gf_DoNothing"
};

CR_Menu2 = 
{
	"Rêi khái ®Êu tr­êng tuyÕt/CR_DoExit",
	"Mua ®¹n tuyÕt cÇu/CR_DoShowSaleList",
	"Rêi khái/gf_DoNothing"
}

CR_SaleList = 
{
	{{2, 3, 221}, "§¹i tuyÕt cÇu", 10, 150000},
	{{2, 3, 220}, "Trung tuyÕt cÇu", 10, 100000},
	{{2, 3, 219}, "TiÓu tuyÕt cÇu", 10, 50000},
}

CR_Menu3_1 = 
{
	"10 §¹i TuyÕt CÇu (15 vµng)/#CR_DoBuy(1)",
	"10 Trung TuyÕt CÇu (10 vµng)/#CR_DoBuy(2)",
	"10 TiÓu TuyÕt CÇu (5 vµng)/#CR_DoBuy(3)",
	"Ta chØ ghÐ ch¬i/gf_DoNothing",
}

function CR_DoEnter()
	local mapID = GetWorldPos();
  mapID = SB_MapMap[mapID];
	if 1 ~= SB_CheckState(mapID) then
		Talk(1, "", "RÊt tiÕc, ®ît ho¹t ®éng nµy ®· kÕt thóc, h·y trë l¹i lÇn sau");
		return
	end
	if 1 ~= SB_CheckPlayerCount(mapID) then
		Talk(1, "", "RÊt tiÕc, ®Êu tr­êng ®· ®Çy, vui lßng trë l¹i lÇn sau");
		return
	end
	if 0 == GetPlayerRoute() then
		Talk(1, "", "RÊt tiÕc, c¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia");
		return
	end
	if SB_MIN_LEVEL > GetLevel() then
		Talk(1, "", "RÊt tiÕc, c¸c h¹ ch­a ®¹t ®ñ cÊp ®é, cÇn "..SB_MIN_LEVEL.."trë lªn");
		return
	end
	if MeridianGetLevel() < 1 then
		Talk(1,"","RÊt tiÕc, c¸c h¹ ch­a khai th«ng c¶nh giíi kinh m¹ch");
		return
	end
	if 1 ~= SB_CheckEquipment() then
		Talk(1, "", "RÊt tiÕc, c¸c h¹ cÇn cëi bá ngo¹i trang vµ vò khÝ");
		return
	end
	if GetCash() < SB_COST then
		Talk(1,"","RÊt tiÕc, ng©n l­îng c¸c h¹ mang theo kh«ng ®ñ!");
		return
	end	
	if gf_Judge_Room_Weight(2,50) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end	
	local itemID = {2, 3, 219, 10};
	local itemName = "TiÓu tuyÕt cÇu";
	gf_AddItemEx2(itemID, itemName, "Event th¸ng 12 n¨m 2012", "application gift");
	gf_WriteLogEx("NEM TUYET 022013", "tham gia thµnh c«ng", 1, "Tham gia nÐm tuyÕt")
	mf_JoinMission(SB_MISSION_ID, SB_CAMP_ID, mapID);
end

function CR_DoExit()
	--WriteLog("CR_DoExit::SubWorld: "..SubWorld..", mapID: "..SubWorldIdx2ID(SubWorld));
	SB_ResetState()
	DelMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
end

function CR_DoShowSaleList()
	Say(CR_Head, getn(CR_Menu3_1), CR_Menu3_1);
end

function CR_DoBuy(index)
	local itemID = CR_SaleList[index][1];
	local itemName = CR_SaleList[index][2];
	local itemCount = CR_SaleList[index][3];
	local cost = CR_SaleList[index][4];
	if GetCash() < cost then
		Talk(1,"","Hµnh trang kh«ng ®ñ tiÒn!");
		return
	end
	if 1 == gf_Judge_Room_Weight(4,100, "") then
		if 1 == Pay(cost) then
			local tmpItemID = {itemID[1], itemID[2], itemID[3], itemCount};
			gf_AddItemEx2(tmpItemID, itemName, "NEM TUYET 022013", "Mua ®¹n tuyÕt cÇu"); --Event th¸ng 12 n¨m 2012
		end
	end
	CR_DoShowSaleList();	
end

function main()
	--WriteLog("main::called");
	if 0 == SB_IsInSnowMap() then
		Say(CR_Head, getn(CR_Menu1), CR_Menu1);
	else
		Say(CR_Head, getn(CR_Menu2), CR_Menu2);
	end
end