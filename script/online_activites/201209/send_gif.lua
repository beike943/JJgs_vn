--2012Äê8ÔÂËØÊ³ÅÌ»î¶¯
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\meridian\\meridian_script_api.lua")

VET_201209_ACITIVITY_ID = 73;

VET_201209_NPC = "<color=green>Chñ Töu LÇu:<color>";

VET_201209_Say_Tb = {
	"T¹i h¹ muèn ®ãng gãp N­íc Hoa Kh« 1 cho chÞ em Phô N÷ (tiªu hao 25 N­íc Hoa Kh« 1 + 25 Vµng)/send_one_201209",
	"T¹i h¹ muèn ®ãng gãp N­íc Hoa Kh« 2 cho chÞ em Phô N÷ (tiªu hao 25 N­íc Hoa Kh« 2 + 25 Vµng)/send_two_201209",
	"T¹i h¹ muèn ®ãng gãp N­íc Hoa Kh« 1 + N­íc Hoa Kh« 2 cho chÞ em Phô N÷ (tiªu hao 25 N­íc Hoa Kh« 1 + 25 N­íc Hoa Kh«  2 + 25 Vµng)/send_both_201209",
};

VET_201209_ExcAw_TaskGroup = TaskManager:Create(10,3);
VET_201209_ExcAw_TaskGroup.DaySeq = 1;
VET_201209_ExcAw_TaskGroup.Times1 = 2;
VET_201209_ExcAw_TaskGroup.Times2 = 3;
VET_201209_ExcAw_TaskGroup.Times3 = 4;

Max_Count_201209 = 8; --Ã¿Ììµ¥Ïî×î¶à8´Î
Exp_Award_Normal1_201209 = 6500000;
Exp_Award_Normal2_201209 = 12000000;
Zhenqi_Award1_201209 = 10;
Zhenqi_Award2_201209 = 30;
Item_Count1_201209 = 25;
Item_Count2_201209 = 25;
Coin_Consume_201209 = 25;
Item_table1_201209 = {2,1,30444,"N­íc Hoa Kh« 1"};
Item_table2_201209 = {2,1,30445,"N­íc Hoa Kh« 2"};
Acitivity_log1_201209 = "Ho¹t ®éng phô TÕt Phô N÷";
Acitivity_log2_201209 = "TÆng N­íc Hoa Kh«";

strMsg2Player1_201209 = "TÆng N­íc Hoa Kh« 1 %d/%d";
strMsg2Player2_201209 = "TÆng N­íc Hoa Kh«2 %d/%d";
strMsg2Player3_201209 = "T¨ng N­íc Hoa Kh« 1 vµ N­íc Hoa Kh« 2 %d/%d";


--½±Àø±í
Vet_201209_Award  = {
    {1, 1919, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
    {1, 1502, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2918, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 888, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 111, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 4, "M¶nh B¹ch Kim", {2, 1, 30346, 1}, 0},
    {3, 2658, 990000, 1},
};
Vet_201209_Award_Special  = {
    {1, 1919, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 2}, 0},
    {1, 1838, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2525, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 522, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 200, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 333, "M¶nh B¹ch Kim", {2, 1, 30346, 1}, 0},
    {1, 15, "§¹i §Þnh Hån ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {3, 2525, 990000, 1},
    {3, 123, 9990000, 1},
};

function send_one_201209()
	if condition_check() == 0 then
		return 0;
	end

	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1) >= Max_Count_201209 then
		Talk(1,"",VET_201209_NPC..format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count_201209));
		return 0;
	end

	if GetItemCount(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3]) < Item_Count1_201209 then
		Talk(1,"",VET_201209_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table1_201209[4],Item_Count1_201209));
		return 0;
	end
	if GetCash() < Coin_Consume_201209*10000 then
		Talk(1,"",VET_201209_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume_201209));
		return 0;
	end
	
	if DelItem(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3],Item_Count1_201209) ~= 1 then return 0; end
	if Pay(Coin_Consume_201209 * 10000) ~= 1 then return 0; end
	
	VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times1,VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1)+1);
	
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1) == Max_Count_201209 then
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Normal1_201209 + 1000000);
			if GetTask(3052) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		else
			gf_Modify("Exp",Exp_Award_Normal1_201209 - 1500000);
			AwardGenuineQi(Zhenqi_Award1_201209);
			if GetTask(3052) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		end
	else
		gf_Modify("Exp",Exp_Award_Normal1_201209);
		if GetTask(3052) < 2000 then
		--	gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		else
		--	gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		end
	end
	gf_WriteLogEx("HOAT DONG PHU THANG 10", "nhËn thµnh c«ng", 1, "PhÇn th­ëng dßng 1")
	Msg2Player(format(strMsg2Player1_201209, VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1),Max_Count_201209));
end


function send_two_201209()
	if condition_check() == 0 then
		return 0;
	end

	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2) >= Max_Count_201209 then
		Talk(1,"",VET_201209_NPC..format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count_201209));
		return 0;
	end

	if GetItemCount(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3]) < Item_Count2_201209 then
		Talk(1,"",VET_201209_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table2_201209[4],Item_Count2_201209));
		return 0;
	end
	if GetCash() < Coin_Consume_201209*10000 then
		Talk(1,"",VET_201209_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume_201209));
		return 0;
	end
	
	if DelItem(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3],Item_Count2_201209) ~= 1 then return 0; end
	if Pay(Coin_Consume_201209 * 10000) ~= 1 then return 0; end
	
	VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times2,VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2)+1);
	
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2) == Max_Count_201209 then
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Normal1_201209 + 1000000);
			if GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		else
			gf_Modify("Exp",Exp_Award_Normal1_201209 - 1500000);
			AwardGenuineQi(Zhenqi_Award1_201209);
			if GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		end
	else
		gf_Modify("Exp",Exp_Award_Normal1_201209);
		if GetTask(3053) < 2000 then
		--	gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		else
		--	gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		end
	end
	gf_WriteLogEx("HOAT DONG PHU THANG 10", "nhËn thµnh c«ng", 1, "PhÇn th­ëng dßng 2")
	Msg2Player(format(strMsg2Player2_201209, VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2),Max_Count_201209));
end


function send_both_201209()
		if condition_check() == 0 then
		return 0;
	end

	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3) >= Max_Count_201209 then
		Talk(1,"",VET_201209_NPC..format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count_201209));
		return 0;
	end
	
	if GetItemCount(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3]) < Item_Count1_201209 then
		Talk(1,"",VET_201209_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table1_201209[4],Item_Count1_201209));
		return 0;
	end
	
	if GetItemCount(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3]) < Item_Count2_201209 then
		Talk(1,"",VET_201209_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table2_201209[4],Item_Count2_201209));
		return 0;
	end
	
	if GetCash() < Coin_Consume_201209*10000 then
		Talk(1,"",VET_201209_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume_201209));
		return 0;
	end
	
	if DelItem(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3],Item_Count1_201209) ~= 1 then return 0; end
	if DelItem(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3],Item_Count2_201209) ~= 1 then return 0; end
	if Pay(Coin_Consume_201209 * 10000) ~= 1 then return 0; end
	
	VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times3,VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3)+1);
	
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3) == Max_Count_201209 then
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Normal2_201209 + 5500000);
			if GetTask(3052) < 2000 or GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		else
			gf_Modify("Exp",Exp_Award_Normal2_201209 - 2000000);
			AwardGenuineQi(Zhenqi_Award2_201209);
			if GetTask(3052) < 2000 or GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		end
	else
		gf_Modify("Exp",Exp_Award_Normal2_201209);
		if GetTask(3052) < 2000 or GetTask(3053) < 2000 then
		--	gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		else
		--	gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		end
	end
	gf_WriteLogEx("HOAT DONG PHU THANG 10", "nhËn thµnh c«ng", 1, "PhÇn th­ëng dßng 3")	
	Msg2Player(format(strMsg2Player3_201209, VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3),Max_Count_201209));
end

function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201209_NPC.."Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
		return 0;
	end	
	--ÅÐ¶Ï±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(3,100," ") ~= 1 then
			Talk(1,"",VET_201209_NPC.."Kh«ng gian hµnh trang kh«ng ®ñ")
	    return 0
	end
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times1,0)		
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times2,0)	
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times3,0)
	end
	return 1;
end