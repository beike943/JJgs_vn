--2014Äê2ÔÂ¸±»î¶¯2
Include("\\script\\lib\\globalfunctions.lua") --¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201402_ACTIVITYID = 114;

VET_201402_MAIN = "Sa Trung Kim /Vet_201402_main";

VET_201402_TASK = TaskManager:Create(6, 8)
VET_201402_TASK.DaySeq = 1;
VET_201402_TASK.TASK = 2;
VET_201402_TASK.AWARD = 3;
VET_201402_TASK.KILL1 = 4;
VET_201402_TASK.KILL2 = 5;
VET_201402_TASK.KILL3 = 6;


function Vet_201402_main()
	if VET_201402_TASK:GetTask(VET_201402_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201402_TASK:SetTask(VET_201402_TASK.DaySeq,zgc_pub_day_turn());
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.AWARD,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL1,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL2,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL3,0);
	end
	local tSay = {
		"nhËn nhiÖm vô 'Sa Trung Kim'/Vet_201402_AcceptTask",
		"NhËn phÇn th­ëng nhiÖm vô 'Sa Trung Kim'(tiªu hao 199 vµng vµ 99 Tiªu Dao Ngäc )/Vet_201402_Award",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("<color=green>Lôc Tróc ¤ng: <color>®­êng phè h«m nay thËt n¸o nhiÖt.", getn(tSay), tSay);
end

function Vet_201402_AcceptTask()
	local nStep = VET_201402_TASK:GetTask(VET_201402_TASK.TASK);
	if nStep ~= 0 then
		Talk(1,"","B¹n ®· nhËn nhiÖm vô 'Sa Trung Kim'");
		if nStep == 1 then
			Msg2Player("§Õn Quang Minh §Ønh t×m ¢n Minh");
		elseif nStep == 2 then
			Msg2Player("§Õn mª cung sa m¹c t×m B¹ch Tiªn Thµnh");
		elseif nStep == 3 then
			Msg2Player("tiªu diÖt 333 Sa M¹c Hµnh Nh©n, tiªu diÖt 555 TÇm B¶o Nh©n");
		elseif nStep == 4 then
			Msg2Player("§Õn D­îc V­¬ng §éng t×m D­îc ThÊt Thñ VÖ");
		elseif nStep == 5 then
			Msg2Player("Tiªu diÖt 99 ng­êi c©y");
		elseif nStep == 6 then
			Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô 'Sa Trung Kim'");
		end
		return 0;
	end
	VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 1);
	Msg2Player("§Õn Quang Minh §Ønh t×m ¢n Minh".."ThØnh gi¸o gi¶ kim mËt thuËt");
	TaskTip("§Õn Quang Minh §Ønh t×m ¢n Minh".."ThØnh gi¸o gi¶ kim mËt thuËt");
end

function Vet_201402_Award()
	if VET_201402_TASK:GetTask(VET_201402_TASK.AWARD) ~= 0 then
		Talk(1,"","B¹n ®· sö dông phÇn th­ëng 'Sa Trung Kim'");
		return 0;
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) ~= 6 then
		Talk(1,"","B¹n ch­a hoµn thµnh xong nhiÖm vô 'Sa Trung Kim', kh«ng thÓ sö dông phÇn th­ëng ");
		return 0;
	end
	if gf_Judge_Room_Weight(21, 100, " ") ~= 1 then
		return 0;
	end
	if GetCash() < 199*10000 then
		Talk(1,"",format("Ng©n l­îng kh«ng ®ñ %d vµng", 199));
		return 0;
	end
	if GetItemCount(2,1,30603) < 99 then
		Talk(1,"",format("Sè l­îng Tiªu Dao Ngäc trong tói kh«ng ®ñ %d ", 99));
		return 0;
	end
	if Pay(199*10000) ~= 1 or DelItem(2,1,30603,99) ~= 1 then
		return 0;
	end
	VET_201402_TASK:SetTask(VET_201402_TASK.AWARD, 1);
	gf_ModifyExp(1234567890);
	local tFruitAward = {
		{"Nh·n", 2,	1,	30164},
		{"Ch«m Ch«m", 2,	1,	30165},
		{"Cam", 2,	1,	30166},
		{"Dõa", 2,	1,	30167},
		{"M¨ng côt", 2,	1,	30168},
		{"B­ëi", 2,	1,	30169},
		{"D©u", 2,	1,	30170},
		{"Chuèi", 2,	1,	30171},
		{"Xoµi", 2,	1,	30172},
		{"§µo", 2,	1,	30173},
		{"MËn", 2,	1,	30174},
		{"V¶i", 2,	1,	30175},
		{"T¸o", 2,	1,	30176},
		{"B¬", 2,	1,	30177},
		{"§u §ñ", 2,	1,	30178},
		{"M·ng CÇu", 2,	1,	30179},
		{"Khãm", 2,	1,	30180},
		{"Lª", 2,	1,	30181},
		{"Bßn Bon", 2,	1,	30182},
		{"KhÕ", 2,	1,	30183},		
	}
	for i = 1, getn(tFruitAward) do
		gf_AddItemEx2({tFruitAward[i][2],tFruitAward[i][3],tFruitAward[i][4], 12}, tFruitAward[i][1], "Event phu 2 thang 2 nam 2014", "NhiÖm vô 'Sa Trung Kim'", 0, 1);
	end
	local tAward = {
		{31, 40000, "Vet_201402_70Book()", 1},
		{1, 15550, "Ch×a Khãa Vµng", {2, 1, 30133, 1}, 0},
		{32, 4000, 6789, 1},
		{1, 15000, "Ma Tinh", {2, 1, 30497, 50}, 0},
		{1, 1, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 0},
		{1, 1, "Tói Thiªn Th¹ch Tinh Th¹ch", {2, 1, 3356, 1}, 7 * 24 * 3600},
		{1, 15998, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
		{1, 7250, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 2200, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		--{1, 100, "14¼¶Ç¿»¯¾í", {2, 1, 30426, 1}, 7 * 24 * 3600},
		--{1, 500, "15¼¶Ç¿»¯¾í", {2, 1, 30427, 1}, 7 * 24 * 3600},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event phu 2 thang 2 nam 2014", "NhiÖm vô 'Sa Trung Kim'");
end

function Vet_201402_70Book()
	local tBook = {
		[2] =  {0, 107, 204, "Kim Cang B¸t Ch©n QuyÓn"},
		[4] =  {0, 107, 205, "TiÒm Long TÞch DiÖt Ch©n QuyÓn"},
		[3] =  {0, 107, 206, "V« TrÇn Bå §Ò Ch©n QuyÓn"},
		[6] =  {0, 107, 207, "Thiªn La Liªn Ch©u Ch©n QuyÓn"},
		[8] =  {0, 107, 208, "Nh­ ý Kim §Ønh MËt Ch©n QuyÓn"},
		[9] =  {0, 107, 209, "BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
		[11] = {0, 107, 210, "Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
		[12] = {0, 107, 211, "Quü Thiªn Du Long Ch©n QuyÓn"},
		[14] = {0, 107, 212, "HuyÔn ¶nh Mª Tung Ch©n QuyÓn"},
		[15] = {0, 107, 213, "Qu©n Tö TiÖt Phong Ch©n QuyÓn"},
		[17] = {0, 107, 214, "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
		[18] = {0, 107, 215, "Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
		[20] = {0, 107, 216, "HuyÒn Minh Phong Ma Ch©n QuyÓn"},
		[21] = {0, 107, 217, "Linh Cæ HuyÔn Tµ Ch©n QuyÓn"},
		[23] = {0, 107, 218, "Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[29] = {0, 107, 222, "Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0, 107, 223, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
	}
	local nRoute = GetPlayerRoute();
	if not tBook[nRoute] then return 0; end
	gf_AddItemEx2({tBook[nRoute][1],tBook[nRoute][2],tBook[nRoute][3], 1}, tBook[nRoute][4], "Event phu 2 thang 2 nam 2014", "NhiÖm vô 'Sa Trung Kim'", 0, 1);
end

function Vet_201402_KillNpc1(szName)
	if gf_CheckEventDateEx(VET_201402_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) ~= 3 then
		return 0;
	end
	if szName == "Sa M¹c Hµnh Nh©n" and VET_201402_TASK:GetTask(VET_201402_TASK.KILL1) < 333 then
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL1, VET_201402_TASK:GetTask(VET_201402_TASK.KILL1) + 1);
		Msg2Player(format("Tiªu diÖt Sa M¹c Hµnh Nh©n %d/333", VET_201402_TASK:GetTask(VET_201402_TASK.KILL1)));
	elseif szName == "TÇm B¶o Nh©n" and VET_201402_TASK:GetTask(VET_201402_TASK.KILL2) < 555 then
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL2, VET_201402_TASK:GetTask(VET_201402_TASK.KILL2) + 1);
		Msg2Player(format("Tiªu diÖt TÇm B¶o Nh©n %d/555", VET_201402_TASK:GetTask(VET_201402_TASK.KILL2)));
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.KILL1) >= 333 and VET_201402_TASK:GetTask(VET_201402_TASK.KILL2) >= 555 then
		Talk(1,"","§Õn D­îc V­¬ng §éng t×m D­îc ThÊt Thñ VÖ, thØnh gi¸o mËt thuËt (196/178)");
		TaskTip("§Õn D­îc V­¬ng §éng t×m D­îc ThÊt Thñ VÖ, thØnh gi¸o mËt thuËt (196/178)");
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 4);
	end
end

function Vet_201402_KillNpc2(szName)
	if gf_CheckEventDateEx(VET_201402_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) ~= 5 then
		return 0;
	end
	if szName == "Ng­êi c©y" and VET_201402_TASK:GetTask(VET_201402_TASK.KILL3) < 99 then
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL3, VET_201402_TASK:GetTask(VET_201402_TASK.KILL3) + 1);
		Msg2Player(format("Tiªu diÖt ng­êi c©y %d/99", VET_201402_TASK:GetTask(VET_201402_TASK.KILL3)));
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.KILL3) >= 99 then
		Talk(1,"","Hoµn thµnh nhiÖm vô, Thao XuyÕn Kim-trang søc vµng-gi¶ kim thuËt tÆng ng­¬i, quay vÒ t×m L­u Tróc «ng ®Ó nhËn th­ëng.");
		Msg2Player("Hoµn thµnh nhiÖm vô, Thao XuyÕn Kim-trang søc vµng-gi¶ kim thuËt tÆng ng­¬i, quay vÒ t×m L­u Tróc «ng ®Ó nhËn th­ëng.");
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 6);
	end
end