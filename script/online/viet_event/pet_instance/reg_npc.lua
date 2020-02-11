Include("\\script\\online\\viet_event\\pet_instance\\head.lua")

function main()
	Say("BÇn ®¹o phông mÖnh Cöu Thiªn HuyÒn N÷ ®Õn nh©n gian ®é hãa mäi ng­êi ®Õn Th¸i H­ HuyÔn C¶nh. Trªn ®­êng ®i thÝ chñ cÇn cã b¹n ®ång hµnh ®i kÌm theo, ng­êi cã cßn g× cÇn hái kh«ng?",
		3, 
		"Lµm sao vµo ®­îc Th¸i H­ HuyÔn C¶nh cïng b¹n ®ång hµnh?/Ruhe",
		--"Ta muèn mua Tói Thùc PhÈm (1 Xu)/buy_pet_food"),
		"Ta muèn mua Th¸i H­ §a MËt Qu¶ (50 Xu)/buy_god_fruit",
--		"Xin ch©n nh©n dÉn ®­êng cho t¹i h¹!/EnterTx",  -- CloseFeature
		"Ta chØ hái th«i!/no")
end

function CloseFeature()
	Talk(1,"","TÝnh n¨ng Th¸i H­ HuyÔn C¶nh cïng b¹n ®ång hµnh  ®ang t¹m ®ãng, ®¹i hiÖp h·y quay l¹i sau !!!")
end

function buy_pet_food()
	if gf_JudgeRoomWeight(2, 100) == 0 then
		return
	end
	
	if GetItemCount(2,1,30230) < 1 then
		Talk(1, "", "Ng­¬i kh«ng mang theo ®ñ tiÒn th× sao mua ®­îc!")
		return
	end
	
	if DelItem(2,1,30230,1) == 1 then
		gf_AddItemEx2({2,1,30159,1}, "Tói thùc phÈm", "Bac Dau Lao Nhan", "mua")
	end
	main()
end

function buy_god_fruit()
	if gf_JudgeRoomWeight(2, 100) == 0 then
		return
	end
	
	if GetItemCount(2,1,30230) < 50 then
		Talk(1, "", "Ng­¬i kh«ng mang theo ®ñ tiÒn th× sao mua ®­îc!")
		return
	end
	
	if DelItem(2,1,30230,50) == 1 then
		gf_AddItemEx2({2,1,387,1}, "Th¸i H­ §a MËt Qu¶", "Bac Dau Lao Nhan", "mua", 7 * 24 * 3600)
	end
	main()
end