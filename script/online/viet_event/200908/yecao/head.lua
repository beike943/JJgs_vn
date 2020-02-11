-- Created by TuanNA5
-- VNG August event - D¹ Th¶o

Include("\\script\\lib\\globalfunctions.lua")

-- Thêi gian event
START_DATE = 090731
END_DATE = 090906

-- Sè vµng, level cÇn ®Ó ®æi
MONEY_EXCHANGE = 990000
LEVEL_EXCHANGE = 70
ITEM_TIME_LIMIT = 30 * 24 * 60 * 60

---- Sè lÇn ®æi tèi ®a
--MAX_HORSE_EXCHANGE = 1
--MAX_WARHORSE_EXCHANGE = 1
--MAX_STONE_EXCHANGE = 1
--MAX_WEAPONFAG_EXCHANGE = 8

---- TÝnh theo Account
--EVENT_EXT = 3

--STONE_BIT = 1
--WARHORSE_BIT = 2
--HORSE_BIT = 3


---- TÝnh theo Role
--WEAPONFAG_TASKID = 2436


-- 2 Task ID cña ITEM thø 4, 5
--ITEM4_TASKID = 2434
--ITEM5_TASKID = 2435

-- Table tAwardItem gåm tªn, id, « trèng, ®é nÆng, option
tAwardItem = 
{
	{"Thiªn Th¹ch Linh Th¹ch",{2,1,1068,1},1,1,0},
	{"B¶n vÏ ®óc t¹o thÇn khÝ",{2,1,1086,1},1,1,0},
	{"ChiÕn m· Nguyªn So¸i cao cÊp",{0,105,51,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"ChiÕn m· Nguyªn So¸i cao cÊp",{0,105,52,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"§»ng Vô",{0,105,20,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"Siªu Quang",{0,105,19,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"B«n Tiªu",{0,105,16,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"Phiªu Vò",{0,105,15,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"Phï Dùc",{0,105,39,1,1,3,403,0,0,0,0},1,100,1},
	{"TuÇn Léc",{0,105,35,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"Kú L©n Niªn Thó",{0,105,33,1,1,3,403,0,0,0,0},1,100,1},
}

tNewAwardItem = 
{
	{"§Êu Hån",{2,1,1157,5,4},5,100,0, 1, 2000000, 1},
	{"ThÇn Hµnh BÝ Phæ",{0,200,39,2,1},2,100,0, 1, 50000, 30},
	{"ThÕ Th©n Phï",{2,0,556,3,1},3,100,0, 1, 100000, 30},
	{"TÈy Tuû Linh §¬n",{2,0,137,1,1},1,100,0, 30, 6000000, 15},
	{"B¸t B¶o TÈy Tuû §¬n",{2,0,138,1,1},1,100,0, 45, 5000000, 15},
	{"Tiªu KiÕp T¸n",{2,0,141,5,1},5,100,0, 1, 200000, 15},
	{"Lôc L©m Lang Yªn",{2,1,1014,1,1},1,100,0, 5, 500000, 15},
	{"Thñy Hoµng BÝ ChiÕu",{2,1,1047,1,1},1,100,0, 5, 500000, 15},
	{"Uyªn ¦¬ng Kim Ti B¹c",{2,1,1048,1,1},1,100,0, 5, 500000, 15},
	{"Kú Kim cña Thî rÌn L­u", {2,1,563,1,1},1,100,0,1,10000000,15},
	{"T©n Niªn Ngo¹i Trang", {0,109,113,1,1},1,100,0,1,1000000,30},
}

--Table vò khÝ ch­a gi¸m ®Þnh
tWeapon =
{
	{"Cæ §Ýnh ch­a gi¸m ®Þnh",2,1,379},
	{"A La H¸n Tr­îng ch­a gi¸m ®Þnh",2,1,382},
	{"V¹n NhÉn ch­a gi¸m ®Þnh",2,1,375},
	{"M·n Thiªn Hoa Vò ch­a gi¸m ®Þnh",2,1,378},
	{"Háa Tinh ch­a gi¸m ®Þnh",2,1,376},
	{"Hi Nh©n CÇm ch­a gi¸m ®Þnh",2,1,380},
	{"LiÖt DiÖm ch­a gi¸m ®Þnh",2,1,377},
	{"ThÇn Hµnh ch­a gi¸m ®Þnh",2,1,381},
	{"§¹i Hµo L«i Th­¬ng ch­a gi¸m ®Þnh",2,1,383},
	{"ThÇn Cung ch­a gi¸m ®Þnh",2,1,384}	,
	{"L¨ng Phong ch­a gi¸m ®Þnh",2,1,386},
	{"M·nh Hæ ch­a gi¸m ®Þnh",2,1,385},
}

-- Table yÕu quyÕt c¬ b¶n
tYue =
{
	{"ThiÕu l©m ®ao quyÕt",{2,6,1,1}},
	{"ThiÕu l©m c«n quyÕt",{2,6,2,1}},
	{"ThÊt b¶o chiÕu quyÕt",{2,6,11,1}},
	{"HuÖ nh·n quyÕt",{2,6,14,1}},
	{"Tu t©m quyÕt",{2,6,22,1}},
	{"Ph¸ ma chó quyÕt",{2,6,24,1}},
	{"ChÕ ¸m yÕu quyÕt",{2,6,32,1}},
	{"T©m nh·n quyÕt",{2,6,33,1}},
	{"Gi¶i ®éc bÝ quyÕt",{2,6,35,1}},
	{"Nga my phËt quyÕt",{2,6,48,1}},
	{"Ngäc n÷ kiÕm quyÕt",{2,6,49,1}},
	{"Tïy khóc quyÕt",{2,6,60,1}},
	{"NguyÖt thùc khóc quyÕt",{2,6,62,1}},
	{"C¸i bang ch­ëng quyÕt",{2,6,71,1}},
	{"Tiªu dao du quyÕt",{2,6,76,1}},
	{"C¸i bang c«n quyÕt",{2,6,80,1}},
	{"KhÊt th¶o quyÕt",{2,6,82,1}},
	{"Vâ ®ang kiÕm quyÕt",{2,6,89,1}},
	{"L­u quang kiÕm quyÕt",{2,6,90,1}},
	{"Nhu v©n kiÕm quyÕt",{2,6,92,1}},
	{"Bót ph¸p quyÕt",{2,6,109,1}},
	{"Lôc hãa c«ng quyÕt",{2,6,111,1}},
	{"Th­¬ng ph¸p quyÕt",{2,6,120,1}},
	{"Ngù m· quyÕt",{2,6,122,1}},
	{"Cung ph¸p quyÕt",{2,6,131,1}},
	{"TrËn liÖu quyÕt",{2,6,133,1}},
	{"BÝ kiÕp ngò ®éc ®ao ",{2,6,142,1}},
	{"BÝ kiÕp dÉn hån chó",{2,6,143,1}},
	{"BÝ kiÕp tËp thi tµ khÝ",{2,6,147,1}},
	{"BÝ kiÕp h¹ cæ mËt ph­¬ng",{2,6,155,1}},
	{"BÝ kiÕp d­ìng cæ bÝ thuËt",{2,6,157,1}},
	{"BÝ kiÕp huyÕt ®Ønh c«ng",{2,6,160,1}},
}

tRewardHorseAttribute1 =
{		
		{"T¨ng sinh lùc 4000 ®iÓm", 1	,2, 486},
		{"Ngo¹i c«ng t¨ng 4%", 1, 1, 261},
		{"T¨ng sinh lùc 1000 ®iÓm", 90,1, 486},
		{"Néi lùc tiªu hao 15%", 3, 2, 443},
		{"Gi¶m thä th­¬ng 10%", 1, 1, 302},
		{"Kh¸ng tÊt c¶ t¨ng 10", 4, 2, 329},
}

tRewardHorseAttribute2 =
{
--		{1, 306, "§é chÝnh x¸c t¨ng 150 ®iÓm"},
--		{6, 404, "Tèc ®é di chuyÓn 35 %"},
		{"T¨ng sinh lùc 4000 ®iÓm", 4000, 2, 486},
		{"Ngo¹i c«ng t¨ng 4 %", 1500, 1, 261},
		{"Ngo¹i c«ng t¨ng 8 %", 4, 2, 261},
		{"T¨ng tèc ®é xuÊt chiªu 6 %", 1, 1, 24},
		{"T¨ng tèc ®é xuÊt chiªu 9 %", 1, 2, 24},
		{"Hç trî mËt tÞch t¨ng thªm 4 %", 1, 1, 564},
		{"Hç trî mËt tÞch t¨ng thªm 5 %", 1, 2, 564},
		{"T¨ng sinh lùc 1000 ®iÓm", 100, 1, 486 },
		{"Néi phßng, ngo¹i phßng t¨ng 98 ®iÓm", 1500, 5, 420},
		{"Néi lùc tiªu hao 15 %", 1000, 2, 443},
		{"Gi¶m thä th­¬ng 10 %", 900, 1, 302},
		{"Kh¸ng tÊt c¶ 10 ®iÓm", 990, 2, 329},
		{"Lùc tÊn c«ng D­¬ng Gia B«n Lang Th­¬ng t¨ng 15 %", 1, 1, 323},
		{"Lùc tÊn c«ng D­¬ng Gia To¸i Kim TiÔn t¨ng 15 %", 1, 1, 325},
}


-- Table ThÇn Hµnh
TB_TRANSPORT_SCROLL =
{
	[1] = {{0,200,40,1,4}, "ThÇn Hµnh B¶o §iÓn", 14000000, 15*24*60*60},
	[2] = {{0,200,39,1,4}, "ThÇn Hµnh BÝ Phæ", 1600000, 2*24*60*60},
}


function CheckEventDate()
	local nDate = tonumber(date("%y%m%d"));
	if START_DATE <= nDate and nDate <= END_DATE then
		return 1
	end	
	return 0
end

function CheckGoldCoin(nNumber)
	if GetItemCount(2, 1, 30094) >=  nNumber then
		return 1
	end
	return 0
end

function CheckWeapon()
	for i=1,getn(tWeapon) do
		if GetItemCount(tWeapon[i][2],tWeapon[i][3],tWeapon[i][4]) <1 then
			return i
		end	
	end
	return 0
end

function DelWeapon()
	for i=1,getn(tWeapon) do
		if DelItem(tWeapon[i][2],tWeapon[i][3],tWeapon[i][4],1) ~= 1 then
			return 0
		end	
	end
	return 1
end