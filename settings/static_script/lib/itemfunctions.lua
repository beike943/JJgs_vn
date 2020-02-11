	itempart_head			= 0;	-- Í·
	itempart_body			= 1;	-- ÄÚÒÂ
	itempart_weapon			= 2;	-- ±øÆ÷
	itempart_foot			= 3;	-- ½Å²¿
	itempart_ring			= 4;	-- ×°ÊÎÀ¸1
	itempart_ring2			= 5;	-- ×°ÊÎÀ¸2
                                    --
	itempart_mask			= 6;	-- Ãæ¾ß
	itempart_cloth			= 7;	-- ÍâÒÂ
	itempart_outfoot		= 8;	-- ÏÂ°ëÉíµÄÍâÌ×
	itempart_great_book		= 9;	-- ¸±ÃØ¼®
	itempart_horse			= 10;	-- Âí
	itempart_book			= 11;	-- ÃØ¼®
                                    --
	itempart_weapon_extend	= 12;	-- ÎäÆ÷À©Õ¹(°µÆ÷,¼ýÊ¸)
                                    --
	itempart_innerstone1	= 13;	-- ÄÚµ¤1
	itempart_innerstone2	= 14;	-- ÄÚµ¤2
	itempart_innerstone3	= 15;	-- ÄÚµ¤3
	itempart_innerstone4	= 16;	-- ÄÚµ¤4
                                    --
	itempart_armory_head	= 17;	-- ÎÆÊÎ-¹Ú
	itempart_armory_body	= 18;	-- ÎÆÊÎ-ÒÂ
	itempart_armory_foot	= 19;	-- ÎÆÊÎ-×°
	itempart_armory_ring1	= 20;	-- ÎÆÊÎ-½äÖ¸1
	itempart_armory_ring2	= 21;	-- ÎÆÊÎ-½äÖ¸2
                                    --
	itempart_badge			= 22;	-- »ÕÕÂ
	itempart_dress_smock	= 23;	-- Åû·ç
                                    --
	itempart_ornament_cap	= 24;	-- ÊÎÆ·-Ã±
	itempart_ornament_cloth	= 25;	-- ÊÎÆ·-ÒÂ
	itempart_ornament_foot	= 26;	-- ÊÎÆ·-Ð¬

ItemCreate = {}
function ItemCreate.giveCangJianGoldenCap()
	gf_AddItemEx({0,103,94+GetBody(),1,1,-1,-1,-1,-1,-1,-1}, "Tµng KiÕm Tö Kim m·o");
end
function ItemCreate.giveCangJianGoldenCloth()
	gf_AddItemEx({0,100,94+GetBody(),1,1,-1,-1,-1,-1,-1,-1}, "Kim Lò Th­êng");
end
function ItemCreate.giveCangJianGoldenPants()
	gf_AddItemEx({0,101,94+GetBody(),1,1,-1,-1,-1,-1,-1,-1}, "Tµng KiÕm ¤ kim phôc");
end

ItemCreate.tRoute2ItmePart = {
	[2 ] = {8801,8802, {{3, 8801, "Hiªn Viªn To¸i Vò §ao"}}},
	[3 ] = {8803,8804, {{8, 8803, "Hiªn Viªn Cöu Nh­ Tr­îng"}}},
	[4 ] = {8805,8806, {{0, 8804, "Hiªn Viªn H¹o Nhiªn Thñ"}}},
	[6 ] = {8807,8808, {{1, 8805, "Hiªn Viªn ch©m v« h×nh"}}},
	[8 ] = {8809,8810, {{2, 8806, "Hiªn Viªn Tö Tinh KiÕm"}}},
	[9 ] = {8811,8812, {{10,8807, "Hiªn Viªn Phông Hoµng CÇm"}}},
	[11] = {8813,8814, {{0, 8808, "Hiªn Viªn Ngò Nh¹c Thñ"}}},
	[12] = {8815,8816, {{5, 8809, "Hiªn Viªn Ph¸ Thiªn C«n"}}},
	[14] = {8817,8818, {{2, 8810, "Hiªn Viªn Hång Qu©n KiÕm"}}},
	[15] = {8819,8820, {{9, 8811, "Hiªn Viªn Sinh Tö Bót"}}},
	[17] = {8821,8822, {{6, 8812, "Hiªn Viªn Ph¸ Qu©n Th­¬ng"}}},
	[18] = {8823,8824, {{4, 8813, "Hiªn Viªn Khai Thiªn Cung"}}},
	[20] = {8825,8826, {{7, 8814, "Hiªn Viªn ¢m D­¬ng NhÉn"}}},
	[21] = {8827,8828, {{11,8815, "Hiªn Viªn U Minh Tr¶o"}}},
	[23] = {8829,8830, {{2, 8816, "Hiªn Viªn L«i Minh KiÕm"}}},
	[25] = {8831,8832, {{3, 8817, "Hiªn Viªn Tr¶m Viªm §ao"}}},
	[26] = {8833,8834, {{9, 8818, "Hiªn Viªn Quang Minh Bót"}}},
	[27] = {8835,8836, {{11,8819, "Hiªn Viªn Chó  Ên Tr¶o"}}},
	[29] = {8837,8838, {{13,8820, "Hiªn Viªn L¨ng Tiªu PhiÕn"}}},
	[30] = {8839,8848, {{12,8821, "Hiªn Viªn Phån Hoa §Þch"}}},
}

function ItemCreate.giveXYWeapen()
	local tItemInfo = ItemCreate.tRoute2ItmePart[GetPlayerRoute()][3];
	if not tItemInfo then return end
	tItemInfo = tItemInfo[random(1, getn(tItemInfo))];
	if not tItemInfo then return end
	gf_AddItemEx({0, tItemInfo[1], tItemInfo[2], 1, 1, -1, -1, -1, -1, -1, -1}, tItemInfo[3]);
end
function ItemCreate.giveXYZhan()
	local tItemInfo = ItemCreate.tRoute2ItmePart[GetPlayerRoute()][1];
	if not tItemInfo then return end
	gf_AddItemEx({0, 102, tItemInfo, 1, 1, -1, -1, -1, -1, -1, -1}, "Hiªn Viªn ChiÕn");

end
function ItemCreate.giveXYDou()
	local tItemInfo = ItemCreate.tRoute2ItmePart[GetPlayerRoute()][2];
	if not tItemInfo then return end
	gf_AddItemEx({0, 102, tItemInfo, 1, 1, -1, -1, -1, -1, -1, -1}, "Hiªn Viªn §Êu");

end

ItemCreate.TiandiCloth = {
	[1] = {
		{"Thiªn §Þa HuyÒn Hoµng Kh«i",{0,103,85,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thiªn §Þa HuyÒn Hoµng Kh«i",{0,103,86,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thiªn §Þa HuyÒn Hoµng Kh«i",{0,103,87,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thiªn §Þa HuyÒn Hoµng Kh«i",{0,103,88,1,1,0,0,0,0,0,0,0,0,120}}},
	[2] = {
		{"Thiªn §Þa HuyÒn Hoµng Gi¸p ",{0,100,85,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thiªn §Þa HuyÒn Hoµng Gi¸p ",{0,100,86,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thiªn §Þa HuyÒn Hoµng Gi¸p ",{0,100,87,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thiªn §Þa HuyÒn Hoµng Gi¸p ",{0,100,88,1,1,0,0,0,0,0,0,0,0,120}}},
	[3] = {
		{"Thiªn §Þa HuyÒn Hoµng Trang",{0,101,85,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thiªn §Þa HuyÒn Hoµng Trang",{0,101,86,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thiªn §Þa HuyÒn Hoµng Trang",{0,101,87,1,1,0,0,0,0,0,0,0,0,120}},
		{"Thiªn §Þa HuyÒn Hoµng Trang",{0,101,88,1,1,0,0,0,0,0,0,0,0,120}}},
};

ItemCreate.TiandiWp ={
	{"Thiªn §Þa HuyÒn Hoµng Thñ",{0,0,17	,1,1,0,0,0,0,0,0,0,0,120}},	--01
	{"Thiªn §Þa HuyÒn Hoµng KiÕm ",{0,2,39	,1,1,0,0,0,0,0,0,0,0,120}},	--02
	{"Thiªn §Þa HuyÒn Hoµng C«n",{0,5,43	,1,1,0,0,0,0,0,0,0,0,120}},	--03
	{"Thiªn §Þa HuyÒn Hoµng KhÝ ",{0,1,56	,1,1,0,0,0,0,0,0,0,0,120}},	--04
	{"Thiªn §Þa HuyÒn Hoµng Dao",{0,3,67	,1,1,0,0,0,0,0,0,0,0,120}},	--05
	{"Thiªn §Þa HuyÒn Hoµng CÇm",{0,10,78	,1,1,0,0,0,0,0,0,0,0,120}},	--06
	{"Thiªn §Þa HuyÒn Hoµng Bót ",{0,9,89	,1,1,0,0,0,0,0,0,0,0,120}},	--07
	{"Thiªn §Þa HuyÒn Hoµng Tr­îng",{0,8,100	,1,1,0,0,0,0,0,0,0,0,120}},	--08
	{"Thiªn §Þa HuyÒn Hoµng Th­¬ng ",{0,6,111	,1,1,0,0,0,0,0,0,0,0,120}},	--09
	{"Thiªn §Þa HuyÒn Hoµng Cung ",{0,4,122	,1,1,0,0,0,0,0,0,0,0,120}},	--10
	{"Thiªn §Þa HuyÒn Hoµng Tr¶o",{0,11,15	,1,1,0,0,0,0,0,0,0,0,120}},	--11
	{"Thiªn §Þa HuyÒn Hoµng NhÉn ",{0,7,15	,1,1,0,0,0,0,0,0,0,0,120}},	--12
	{"Thiªn §Þa HuyÒn Hoµng PhiÕn",{0,13,15	,1,1,0,0,0,0,0,0,0,0,120}},	--13
	{"Thiªn §Þa HuyÒn Hoµng §Þch",{0,12,15	,1,1,0,0,0,0,0,0,0,0,120}},	--14
};

ItemCreate.Tiandi_Route2Weapon = {
	[2] = 5 ,
	[3] = 8 ,
	[4] = 1 ,
	[6] = 4 ,
	[8] = 2 ,
	[9] = 6 ,
	[11]= 1 ,
	[12]= 3 ,
	[14]= 2 ,
	[15]= 7 ,
	[17]= 9 ,
	[18]= 10,
	[20]= 12,
	[21]= 11,
	[23]= 2 ,
	[25]= 5 ,
	[26]= 7 ,
	[27]= 11,
	[29]= 13,
	[30]= 14,
}
function getWeapenByRoute(nRoute)
	return ItemCreate.Tiandi_Route2Weapon[nRoute];
end
function ItemCreate.giveTiandi(nType, nBody, nLingqi)
	if not nBody then
		nBody = random(1,4)
	end
	local tItem = ItemCreate.TiandiCloth[nType][nBody];
	if nLingqi and nLingqi ~= 120 then
		tItem = new(tItem);
		tItem[2][14] = nLingqi;
	end
	gf_AddItemEx(tItem[2], tItem[1]);
end
function ItemCreate.giveTiandi1(nBody, nLingqi)
	ItemCreate.giveTiandi(1, nBody, nLingqi)
end
function ItemCreate.giveTiandi2(nBody, nLingqi)
	ItemCreate.giveTiandi(2, nBody, nLingqi)
end
function ItemCreate.giveTiandi3(nBody, nLingqi)
	ItemCreate.giveTiandi(3, nBody, nLingqi)
end
function ItemCreate.giveTiandi4(nType, nLingqi)
	if not nType then
		nType = random(1, getn(ItemCreate.TiandiWp));
	end
	local tItem = ItemCreate.TiandiWp[nType];
	if not tItem then return end
	if nLingqi and nLingqi ~= 120 then
		tItem = new(tItem);
		tItem[2][14] = nLingqi;
	end
gf_AddItemEx(tItem[2], tItem[1]);
end

--------------------------------------------------------------------------
ItemCreate.tItemList = {
	["Hiªn Viªn ChiÕn"] = ItemCreate.giveXYZhan,
	["Hiªn Viªn §Êu"] = ItemCreate.giveXYDou,
	["Hiªn Viªn vò khÝ"] = ItemCreate.giveXYWeapen,
	["Tµng KiÕm Tö Kim m·o"] = ItemCreate.giveCangJianGoldenCap,
	["Kim Lò Th­êng"] = ItemCreate.giveCangJianGoldenCloth,
	["Tµng KiÕm ¤ kim phôc"] = ItemCreate.giveCangJianGoldenPants,
	["Thiªn §Þa HuyÒn Hoµng Kh«i"] = ItemCreate.giveTiandi1,
	["Thiªn §Þa HuyÒn Hoµng Gi¸p "] = ItemCreate.giveTiandi2,
	["Thiªn §Þa HuyÒn Hoµng Trang"] = ItemCreate.giveTiandi3,
	["Vò khÝ Thiªn §Þa HuyÒn Hoµng"] = ItemCreate.giveTiandi4,

}
function ItemCreate:create(name, ...)
	if not name then
		print("[ItemCreate:create] [Error name] [name=nil]");
		return
	end
	local f = ItemCreate.tItemList[name];
	if not f then
		print(format("[ItemCreate:create] [Error name] [name=%s]", tostring(name)));
		return
	end
	f(gf_UnPack(arg));
end

------------------------------------------------------------------
function getItemGDP(nItemIdx)
	return GetItemGenre(nItemIdx), GetItemDetail(nItemIdx), GetItemParticular(nItemIdx);
end

--Ê¹ÓÃroll½÷¼Ç±ØÐëÓÉNPC´¥·¢£¬±ÈÈçÏä×Ó£¡
SF_FILE = "\\settings\\static_script\\lib\\itemfunctions.lua";
function roll(tLootItem)
	if type(tLootItem) ~= "table" then return end
	SetNpcLifeTime(GetTargetNpc(),	0);
	SetNpcScript(GetTargetNpc(),	"");
	local diceId = ApplyItemDice(1, 100, 150, SF_FILE, "rollTimeOver", GetTeamSize());
	AddDiceItemInfo(diceId, gf_UnPack(tLootItem))
	local nPlayerOld = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsPlayerDeath() == 0 then
			RollItem(diceId)
		end
	end
	PlayerIndex = nPlayerOld
end

function rollTimeOver(dwID)
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	if type(t) ~= "table" then return end
	for index, value in t do
		local str = value[1].."NÐm"..value[2].." ®iÓm"
		if value[3] == 0 then
			str = value[1].."Phãng"
		elseif value[3] == 1 then
			str = str.." (TuyÕt cÇu)"
			if value[4] == 1 then
				str = str.." -- Ê°È¡ÁË"..szItem
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -- Ê°È¡ÁË"..szItem
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("TÊt c¶ ng­êi ch¬i ®· bá cuéc")
	elseif nSize ~= getn(t) then
		Msg2Player("Nh÷ng ng­êi ch¬i kh¸c ®· v­ît qu¸ thêi gian, xem nh­ bá cuéc")
	end
end

tShineSunEquipName = {
	[2] = {
		{"H¹o NguyÖt-§é N¹n T«n Gi¶ M·o","H¹o NguyÖt-§é N¹n T«n Gi¶ Bµo","H¹o NguyÖt-§é N¹n T«n Gi¶ Trang","H¹o NguyÖt-§é N¹n T«n Gi¶ PhËt §ao",},
		{"DiÖu D­¬ng-§é N¹n T«n Gi¶ M·o","DiÖu D­¬ng-§é N¹n T«n Gi¶ Bµo","DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang","DiÖu D­¬ng-§é N¹n T«n Gi¶ PhËt §ao",},
	},
	[3] = {
		{"H¹o NguyÖt-§é ¸ch T«n Gi¶ M·o","H¹o NguyÖt-§é ¸ch T«n Gi¶ Bµo","H¹o NguyÖt-§é ¸ch T«n Gi¶ Trang","H¹o NguyÖt-§é ¸ch T«n Gi¶ PhËt Tr­îng",},
		{"DiÖu D­¬ng-§é ¸ch T«n Gi¶ M·o","DiÖu D­¬ng-§é ¸ch T«n Gi¶ Bµo","DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang","DiÖu D­¬ng-§é ¸ch T«n Gi¶ PhËt Tr­îng",},
	},
	[4] = {
		{"H¹o NguyÖt-§é KiÕp T«n Gi¶ M·o","H¹o NguyÖt-§é KiÕp T«n Gi¶ Bµo","H¹o NguyÖt-§é KiÕp T«n Gi¶ Trang","H¹o NguyÖt-§é KiÕp T«n Gi¶ PhËt Thñ",},
		{"DiÖu D­¬ng-§é KiÕp T«n Gi¶ M·o","DiÖu D­¬ng-§é KiÕp T«n Gi¶ Bµo","DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang","DiÖu D­¬ng-§é KiÕp T«n Gi¶ PhËt Thñ",},
	},	
	[6] = {
		{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Qu¸n","H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Y","H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Trang","H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Tr©m",},
		{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n","DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y","DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang","DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Tr©m",},
	},
	[8] = {
		{"H¹o NguyÖt-PhËt V©n Th¸nh C« Tr©m","H¹o NguyÖt-PhËt V©n Th¸nh C« Y","H¹o NguyÖt-PhËt V©n Th¸nh C« QuÇn","H¹o NguyÖt-PhËt V©n Th¸nh C« Liªn KiÕm",},
		{"DiÖu D­¬ng-PhËt V©n Th¸nh C« Tr©m","DiÖu D­¬ng-PhËt V©n Th¸nh C« Y","DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn","DiÖu D­¬ng-PhËt V©n Th¸nh C« Liªn KiÕm",},
	},
	[9] = {
		{"H¹o NguyÖt-PhËt TrÇn Th¸nh C« Tr©m","H¹o NguyÖt-PhËt TrÇn Th¸nh C« Y","H¹o NguyÖt-PhËt TrÇn Th¸nh C« QuÇn","H¹o NguyÖt-PhËt TrÇn Th¸nh C« CÇm",},
		{"DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Tr©m","DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Y","DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn","DiÖu D­¬ng-PhËt TrÇn Th¸nh C« CÇm",},
	},
	[11] = {
		{"H¹o NguyÖt-Trôc Phông Thiªn C¸i C©n","H¹o NguyÖt-Trôc Phông Thiªn C¸i Y","H¹o NguyÖt-Trôc Phông Thiªn C¸i Trang","H¹o NguyÖt-Trôc Phông Thiªn C¸i Thñ",},
		{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n","DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y","DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang","DiÖu D­¬ng-Trôc Phông Thiªn C¸i Thñ",},
	},
	[12] = {
		{"H¹o NguyÖt-Du Long §Þa KhÊt C©n","H¹o NguyÖt-Du Long §Þa KhÊt Y","H¹o NguyÖt-Du Long §Þa KhÊt Trang","H¹o NguyÖt-Du Long §Þa KhÊt C«n",},
		{"DiÖu D­¬ng-Du Long §Þa KhÊt C©n","DiÖu D­¬ng-Du Long §Þa KhÊt Y","DiÖu D­¬ng-Du Long §Þa KhÊt Trang","DiÖu D­¬ng-Du Long §Þa KhÊt C«n",},
	},
	[14] = {
		{"H¹o NguyÖt-V« Cùc Thiªn T«n Qu¸n","H¹o NguyÖt-V« Cùc Thiªn T«n Bµo","H¹o NguyÖt-V« Cùc Thiªn T«n Trang","H¹o NguyÖt-V« Cùc Thiªn T«n Tóc KiÕm",},
		{"DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n","DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo","DiÖu D­¬ng-V« Cùc Thiªn T«n Trang","DiÖu D­¬ng-V« Cùc Thiªn T«n Tóc KiÕm",},
	},
	[15] = {
		{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Qu¸n","H¹o NguyÖt-BÝch L¹c Thiªn T«n Bµo","H¹o NguyÖt-BÝch L¹c Thiªn T«n Trang","H¹o NguyÖt-BÝch L¹c Thiªn T«n Bót",},
		{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n","DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo","DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang","DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bót",},
	},
	[17] = {
		{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Kh«i","H¹o NguyÖt-C¶m Thiªn §Êu Hån Gi¸p","H¹o NguyÖt-C¶m Thiªn §Êu Hån Trang","H¹o NguyÖt-C¶m Thiªn §Êu Hån Th­¬ng",},
		{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i","DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p","DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang","DiÖu D­¬ng-C¶m Thiªn §Êu Hån Th­¬ng",},
	},
	[18] = {
		{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Kh«i","H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Gi¸p","H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Trang","H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Cung",},
		{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i","DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p","DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang","DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Cung",},
	},
	[20] = {
		{"H¹o NguyÖt-Quû Xóc Tµ ThÇn C©n","H¹o NguyÖt-Quû Xóc Tµ ThÇn Y","H¹o NguyÖt-Quû Xóc Tµ ThÇn Trang","H¹o NguyÖt-Quû Xóc Tµ ThÇn §ao",},
		{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n","DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y","DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang","DiÖu D­¬ng-Quû Xóc Tµ ThÇn §ao",},
	},
	[21] = {
		{"H¹o NguyÖt-Vu Cèt §éc V­¬ng C©n","H¹o NguyÖt-Vu Cèt §éc V­¬ng Y","H¹o NguyÖt-Vu Cèt §éc V­¬ng Trang","H¹o NguyÖt-Vu Cèt §éc V­¬ng Tr¶o",},
		{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n","DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y","DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang","DiÖu D­¬ng-Vu Cèt §éc V­¬ng Tr¶o",},
	},
	[23] = {
		{"H¹o NguyÖt-BÊt §éng Ch©n Tiªn Qu¸n","H¹o NguyÖt-BÊt §éng Ch©n Tiªn Bµo","H¹o NguyÖt-BÊt §éng Ch©n Tiªn Trang","H¹o NguyÖt-BÊt §éng Ch©n Tiªn KiÕm",},
		{"DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Qu¸n","DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Bµo","DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang","DiÖu D­¬ng-BÊt §éng Ch©n Tiªn KiÕm",},
	},
	[25] = {
		{"H¹o NguyÖt-Nhôc HuyÕt Cuång ChiÕn C©n","H¹o NguyÖt-Nhôc HuyÕt Cuång ChiÕn Y","H¹o NguyÖt-Nhôc HuyÕt Cuång ChiÕn Trang","H¹o NguyÖt-Nhôc HuyÕt Cuång ChiÕn §ao",},
		{"DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn C©n","DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Y","DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang","DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn §ao",},
	},
	[26] = {
		{"H¹o NguyÖt-Cöu Thiªn Quû Phï Qu¸n","H¹o NguyÖt-Cöu Thiªn Quû Phï Bµo","H¹o NguyÖt-Cöu Thiªn Quû Phï Trang","H¹o NguyÖt-Cöu Thiªn Quû Phï Bót",},
		{"DiÖu D­¬ng-Cöu Thiªn Quû Phï Qu¸n","DiÖu D­¬ng-Cöu Thiªn Quû Phï Bµo","DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang","DiÖu D­¬ng-Cöu Thiªn Quû Phï Bót",},
	},
	[27] = {
		{"H¹o NguyÖt-Ma ¶nh ThÇn T«ng Qu¸n","H¹o NguyÖt-Ma ¶nh ThÇn T«ng Bµo","H¹o NguyÖt-Ma ¶nh ThÇn T«ng Trang","H¹o NguyÖt-Ma ¶nh ThÇn T«ng Tr¶o",},
		{"DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Qu¸n","DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Bµo","DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang","DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Tr¶o",},
	},
	[29] = {
		{"H¹o NguyÖt-Tª V©n Tiªn Tö Tr©m","H¹o NguyÖt-Tª V©n Tiªn Tö Y","H¹o NguyÖt-Tª V©n Tiªn Tö QuÇn","H¹o NguyÖt-Tª V©n Tiªn Tö PhiÕn",},
		{"DiÖu D­¬ng-Tª V©n Tiªn Tö Tr©m","DiÖu D­¬ng-Tª V©n Tiªn Tö Y","DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn","DiÖu D­¬ng-Tª V©n Tiªn Tö PhiÕn",},
	},
	[30] = {
		{"H¹o NguyÖt-Phi H¹ Tiªn Tö Tr©m","H¹o NguyÖt-Phi H¹ Tiªn Tö Y","H¹o NguyÖt-Phi H¹ Tiªn Tö ","H¹o NguyÖt-Phi H¹ Tiªn Tö ¦u Lan Tiªu",},
		{"DiÖu D­¬ng-Phi H¹ Tiªn Tö Tr©m","DiÖu D­¬ng-Phi H¹ Tiªn Tö Y","DiÖu D­¬ng-Phi H¹ Tiªn Tö","DiÖu D­¬ng-Phi H¹ Tiªn Tö ¦u Lan Tiªu",},
	},
}

function ef_GetShineSunEquipName(nRoute,nGeneration,nType)
	local szName = tShineSunEquipName[nRoute][nGeneration][nType];
	return szName;
end

--»ñµÃð©ÔÂºÍÒ«Ñô×°±¸
--nRoute£ºÂ·Ïß
--nBody£ºÌåÐÍ
--nGeneration£º1Îªð©ÔÂ£¬2ÎªÒ«Ñô
--nType£º1ÎªÍ·£¬2ÎªÒÂ·þ£¬3Îª¿ã×Ó£¬4ÎªÎäÆ÷
--nQianghua£ºÇ¿»¯µÈ¼¶
--tExpireTime£º´æÔÚÊ±¼ä
function ef_AddShineSunEquip(nRoute,nBody,nGeneration,nType,nQianghua,tExpireTime)
	nQianghua = nQianghua or 0;
	local nRetCode,nItemIdx = 0,0;
	local nID1,nID2,nID3 = 0,0,0;
	local szName = ef_GetShineSunEquipName(nRoute,nGeneration,nType);
	local tbWeaponID2 = {nil,3,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11,nil,2,nil,3,9,11,nil,13,12};
	local tbWeaponID3 = {{nil,8972,8974,8973,nil,8975,nil,8976,8977,nil,8978,8979,nil,8980,8981,nil,8982,8983,nil,8984,8985,nil,8986,nil,8987,8988,8989,nil,8990,8991},
											 {nil,8992,8994,8993,nil,8995,nil,8996,8997,nil,8998,8999,nil,9000,9001,nil,9002,9003,nil,9004,9005,nil,9006,nil,9007,9008,9009,nil,9010,9011}};
	local tbID3 = {
		[2] = {{3064,3065},{3128,3129}},
		[3] = {{3068,3069},{3132,3133}},
		[4] = {{3066,3067},{3130,3131}},
		[6] = {{3070,3071,3072,3073},{3134,3135,3136,3137}},
		[8] = {{nil,nil,3074,3075},{nil,nil,3138,3139}},
		[9] = {{nil,nil,3076,3077},{nil,nil,3140,3141}},
		[11] = {{3078,3079,3080,3081},{3142,3143,3144,3145}},
		[12] = {{3082,3083,3084,3085},{3146,3147,3148,3149}},
		[14] = {{3086,3087,3088,3089},{3150,3151,3152,3153}},
		[15] = {{3090,3091,3092,3093},{3154,3155,3156,3157}},
		[17] = {{3094,3095,3096,3097},{3158,3159,3160,3161}},
		[18] = {{3098,3099,3100,3101},{3162,3163,3164,3165}},
		[20] = {{3102,3103,3104,3105},{3166,3167,3168,3169}},
		[21] = {{3106,3107,3108,3109},{3170,3171,3172,3173}},
		[23] = {{3110,3111},{3174,3175}},
		[25] = {{3112,3113,3114,3115},{3176,3177,3178,3179}},
		[26] = {{3116,3117,3118,3119},{3180,3181,3182,3183}},
		[27] = {{3120,3121,3122,3123},{3184,3185,3186,3187}},
		[29] = {{nil,nil,3124,3125},{nil,nil,3188,3189}},
		[30] = {{nil,nil,3126,3127},{nil,nil,3190,3191}},	
	};
	if nType == 1 then
		nID2 = 103;
		nID3 = tbID3[nRoute][nGeneration][nBody];
	elseif nType == 2 then
		nID2 = 100;
		nID3 = tbID3[nRoute][nGeneration][nBody];
	elseif nType == 3 then
		nID2 = 101;
		nID3 = tbID3[nRoute][nGeneration][nBody];
	elseif nType == 4 then
		nID2 = tbWeaponID2[nRoute];
		nID3 = tbWeaponID3[nGeneration][nRoute];
	end
	
	gf_SetLogCaption("Trang bÞ H¹o NguyÖt DiÖu NhËt");
	nRetCode,nItemIdx = gf_AddItemEx({nID1,nID2,nID3,1,1,-1,-1,-1,-1,-1,-1,0,nQianghua},szName);
	if nRetCode == 1 and type(tExpireTime) == "table" then
		gf_SetItemExpireTime(nItemIdx, gf_UnPack(tExpireTime));
	end
	gf_SetLogCaption("");
	return nRetCode,nItemIdx;
end