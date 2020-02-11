--´º½Ú¸±»î¶¯4
Include("\\script\\lib\\globalfunctions.lua") --¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua")

VET_201401_SPRING2_ACTIVITYID = 111;

VET_201401_SPRING2_MAIN = "TÕt n¨m 2014/Vet_201401_sprint2_main";

VET_201401_SPRING2_TASK = TaskManager:Create(2, 14)
VET_201401_SPRING2_TASK.DaySeq = 1
VET_201401_SPRING2_TASK.TaskStep = 2
VET_201401_SPRING2_TASK.Award = 3
VET_201401_SPRING2_TASK.WildPig = 4
VET_201401_SPRING2_TASK.WildPigCount = 5

function Vet_201401_sprint2_main()
	if gf_GetPlayerRebornCount() < 1 then
		Talk(1,"","Nh©n vËt chuyÓn sinh 1 trë lªn míi tham gia ®­îc ho¹t ®éng");
		return 0;
	end
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.DaySeq,zgc_pub_day_turn());
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.TaskStep,0);
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.Award,0);
	end
	local tTask = {
		[1] = "Tiªu hao 1 Vµng + 1 giê ®ång hå lªn m¹ng",
		[2] = "Giao nép 240 Gç Qu©n Dông",
		[3] = "Giao nép 240 L¸ Dong",
		[4] = "Tr¶ lêi 3 c©u hái",
		[5] = "§¸nh b¹i 240 con Heo Rõng",
		[6] = "Hoµn thµnh nhiÖm vô",
	}
	local nStep = VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.TaskStep)
	local tSay = {
		format("NhiÖm vô ngµy TÕt (%s)/#Vet_201401_sprint2_task(%d)", tTask[min(nStep + 1, 6)], nStep),
		"NhËn phÇn th­ëng nhiÖm vô/Vet_201401_sprint2_award",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("Chóc Mõng N¨m Míi ! ! !", getn(tSay), tSay);
end

function Vet_201401_sprint2_task(nStep, nTalk, nAns)
	if nStep == 0 then
		if GetCash() < 10000 then
			Talk(1,"",format("Hµnh trang kh«ng gian %s kh«ng ®ñ %d", "Vµng", 1).." Kim ");
			return 0;
		end
--		if GetGameTime() < 3600 then
--			Talk(1,"","Thêi gian trªn m¹ng liªn tôc kh«ng ®ñ 1 tiÕng ®ång hå");
--			return 0;
--		end
		if GetOnlineTime() < 1 * 3600 then
			Talk(1,"IpBonus","Thêi gian trªn m¹ng cña c¸c h¹ ch­a ®ñ 1 giê!")
			return
		end		
		if SetOnlineTime(3600,2) < 0 then	
			return 0
		end
		if Pay(10000) ~= 1 then
			return 0;
		end
	end
	if nStep == 1 then
		if GetItemCount(2, 0, 308) < 240 then
			Talk(1,"",format("Hµnh trang kh«ng gian %s kh«ng ®ñ %d", "Gç qu©n dông", 240));
			return 0;
		end
		if DelItem(2, 0, 308, 240) ~= 1 then
			return 0;
		end
	end
	if nStep == 2 then
		if GetItemCount(2, 1, 30619) < 240 then
			Talk(1,"",format("Hµnh trang kh«ng gian %s kh«ng ®ñ %d", "L¸ Dong", 240));
			return 0;
		end
		if DelItem(2, 1, 30619, 240) ~= 1 then
			return 0;
		end
	end
	if nStep == 3 then
		if nTalk == nil then
			Say("Mång 1 TÕt __, Mång 3 TÕt __.", 4, 
				format("MÑ, Cha/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 1),
				format("Cha, MÑ/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 2),
				format("Cha, ThÇy/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 3),
				format("¤ng, Bµ/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 4)
			)
			return 0;
		end
		if nTalk == 1 then
			if nAns ~= 3 then
				Talk(1,"","Tr¶ lêi sai!");
				return 0;
			end 
			Say("M«n §a Kh¸ch §¸o Thiªn Tµi §¸o, Gia H÷u Nh©n Lai V¹n VËt Lai ( c©u ®èi nµy d¸n ë ®©u trong nhµ ?)", 4, 
				format("T­êng nhµ/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 1),
				format("Sµn nhµ/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 2),
				format("S©n Nhµ/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 3),
				format("D¸n ®©u còng ®­îc/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 4)
			)
			return 0;
		end
		if nTalk == 2 then
			if nAns ~= 3 then
				Talk(1,"","Tr¶ lêi sai!");
				return 0;
			end 
			Say("Phóc Nh­ __,Thä TØ Nam S¬n.", 4, 
				format("Nam H¶i/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 1),
				format("B¾c H¶i/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 2),
				format("§«ng H¶i/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 3),
				format("Long H¶i/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 4)
			)
			return 0;
		end
		if nTalk == 3 then
			if nAns ~= 3 then
				Talk(1,"","Tr¶ lêi sai!");
				return 0;
			end 
		end
	end
	if nStep == 4 then
		if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPig) == 0 then
			VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.WildPig, 1);
			Talk(1,"","§¹i hiÖp nhanh chãng ®i t×m Heo Rõng vµ tiªu diÖt nã!");
			Msg2Player(format("NhiÖm vô ngµy TÕt: Tiªu diÖt %d/%d con Heo Rõng", 0, 240));
			return 0;
		end
		local nCount = VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPigCount);
		if nCount < 240 then
			Talk(1,"",format("NhiÖm vô ngµy TÕt: Tiªu diÖt %d/%d con Heo Rõng", nCount, 240));
			return 0;
		end
	end
	if nStep + 1 <= 5 then
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.TaskStep, nStep + 1);
		Vet_201401_sprint2_main();
	else
		Msg2Player("Ng­¬i ®· hoµn thµnh tÊt c¶ nhiÖm vô ngµy TÕt, nhanh ch©n ®i l·nh th­ëng ®i!");
		Talk(1,"","Ng­¬i ®· hoµn thµnh tÊt c¶ nhiÖm vô ngµy TÕt, nhanh ch©n ®i l·nh th­ëng ®i!");
	end
	return 0;
end

function Vet_201401_sprint2_trigger(sName)
	if gf_CheckEventDateEx(VET_201401_SPRING2_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPig) ~= 1 then
		return 0;
	end
	local nCount = VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPigCount);
	if nCount >= 240 then
		return 0;
	end
	if sName == "Heo rõng" then
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.WildPigCount, nCount + 1);
		Msg2Player(format("NhiÖm vô ngµy TÕt: Tiªu diÖt %d/%d con Heo Rõng", min(nCount + 1, 240), 240));
	end
end


function Vet_201401_sprint2_award()
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.Award) ~= 0 then
		Talk(1,"","Ng­¬i ®· nhËn th­ëng råi");
		return 0;
	end
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.TaskStep) ~= 5 then
		Talk(1,"","Ng­¬i ch­a hoµn thµnh nhiÖm vô ngµy TÕt");
		return 0;
	end
	if gf_Judge_Room_Weight(4, 10," ") ~= 1 then
		return 0;
	end
	VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.Award, 1);
	gf_ModifyExp(20142014);
	gf_AddItemEx2({2, 1, 30167, 39}, "Dõa", "Event phu 4 thang 1");
	gf_AddItemEx2({2, 1, 30172, 39}, "Xoµi", "Event phu 4 thang 1");
	gf_AddItemEx2({2, 1, 30178, 39}, "§u §ñ", "Event phu 4 thang 1");
	gf_AddItemEx2({2, 1, 30179, 39}, "M·ng CÇu", "Event phu 4 thang 1");
	-------------------------------------------------
	--Complete By Veit
	--Update Value of Pet : 100 point
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel >= 1 then
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (100 * 100)) --®iÓm n©ng cÊp
		WriteLogEx("Event phu 4 thang 1", "nhËn th­ëng sö dông vËt phÈm event ", 1, "100 ®iÓm n©ng cÊp")
		Msg2Player("B¹n nhËn ®­îc 100 §iÓm N©ng CÊp B¹n §ång Hµnh")
	end
	if nCurPetLevel >= 2 then
		--Pet's psychic value: 20 piont
		Pet_AddGP(20)
		WriteLogEx("Event phu 4 thang 1", "nhËn th­ëng sö dông vËt phÈm event ", 1, "20 ®iÓm linh lùc")
		Msg2Player("B¹n nhËn ®­îc 20 §iÓm Linh Lùc B¹n §ång Hµnh")
	end
	--
	-------------------------------------------------
end