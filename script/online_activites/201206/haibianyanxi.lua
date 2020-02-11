--2012Äê6ÔÂÇÐ»»½±Àø»î¶¯
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\meridian\\meridian_script_api.lua")

VET_201206_ACITIVITY_ID = 67;

VET_201206_NPC = "<color=green>Chñ Töu LÇu:<color>";

VET_201206_Say_Tb = {
	"T¹i h¹ muèn ®ãng gãp Cua Rang Muèi cho buæi tiÖc (tiªu hao 25 Cua Rang Muèi + 25 Vµng)/exchange_one",
	"T¹i h¹ muèn ®ãng gãp Cµng GhÑ N­íng Muèi ít cho buæi tiÖc (tiªu hao 25 Cµng GhÑ N­íng Muèi ít + 25 Vµng)/exchange_two",
	"T¹i h¹ muèn ®ãng gãp Cua Rang Muèi + Cµng GhÑ N­íng Muèi ít cho buæi tiÖc (tiªu hao 25 Cua Rang Muèi + 25 Cµng GhÑ N­íng Muèi ít +25 Vµng)/exchange_both",
};

VET_201206_ExcAw_TaskGroup = TaskManager:Create(3,6);
VET_201206_ExcAw_TaskGroup.DaySeq = 1;
VET_201206_ExcAw_TaskGroup.Times1 = 2;
VET_201206_ExcAw_TaskGroup.Times2 = 3;
VET_201206_ExcAw_TaskGroup.Times3 = 4;

--externs task eq 2000
--don't modify
Vet_201206_Final_Tag1 = 2786;
Vet_201206_Final_Tag2 = 2787;

Max_Count = 8; --Ã¿Ììµ¥Ïî×î¶à8´Î
Exp_Award_Normal1 = 6500000;
Exp_Award_Normal2 = 12000000;
Exp_Award_Final1 = 5000000;
Exp_Award_Final2 = 10000000;
Item_QCJWJ = 25;
Item_BDSG = 25;
Coin_Consume = 25;
Item_table1 = {2,1,30395,"Cua Rang Muèi"};
Item_table2 = {2,1,30396,"Cµng GhÑ N­íng Muèi ít"};
Acitivity_log1 = "Ho¹t ®éng Buæi TiÖc Ven BiÓn th¸ng 7";
Acitivity_log2 = "Nguyªn liÖu ®ãng gãp";
Zhenqi_value1 = 10;
Zhenqi_value2 = 30;
strMsg2Player1 = "C¸c h¹ ®· lÇn thø %d ®ãng gãp %s cho buæi tiÖc råi";
strMsg2Player2 = "C¸c h¹ ®· lÇn thø %d ®ãng gãp %s cho buæi tiÖc råi";
strMsg2Player3 = "C¸c h¹ ®· lÇn thø %d ®ãng gãp %s vµ %s cho buæi tiÖc råi";

--½±Àø±í
Vet_201206_Award  = {
    {1, 1919, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
    {1, 1502, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2918, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 888, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 111, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 4, "M¶nh B¹ch Kim", {2, 1, 30346, 1}, 0},
    {3, 2658, 990000, 1},
};
Vet_201206_Award_Final  = {
    {1, 1919, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 2}, 0},
    {1, 1838, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2525, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 522, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 200, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 333, "M¶nh B¹ch Kim", {2, 1, 30346, 1}, 0},
    {1, 15, "§¹i §Þnh Hån ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {3, 2525, 990000, 1},
    {3, 123, 9900000, 1},
};

function exchange_one()
	if condition_check() == 0 then
		return 0;
	end
	if VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times1) >= Max_Count then
		Talk(1,"",VET_201206_NPC..format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_QCJWJ then
		Talk(1,"",VET_201206_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table1[4],Item_QCJWJ));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_201206_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_QCJWJ) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201206_ExcAw_TaskGroup:SetTask(VET_201206_ExcAw_TaskGroup.Times1,VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times1)+1);
	if VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times1) ~= Max_Count then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Final1+2500000);
		else
		 	if ActivityGetDailyGenuineQiLeftCapacity() < 1 then
		 		gf_Modify("Exp",Exp_Award_Final1+2500000);
		 	else
				gf_Modify("Exp",Exp_Award_Final1);
			end
			ActivityAwardGenuineQiDaily(Zhenqi_value1);
		end
		if GetTask(Vet_201206_Final_Tag1) == 2000 then
			gf_EventGiveRandAward(Vet_201206_Award_Final,100000,1,Acitivity_log1,Acitivity_log2)
		else
			gf_EventGiveRandAward(Vet_201206_Award,10000,1,Acitivity_log1,Acitivity_log2)
		end
	end
	Msg2Player(format(strMsg2Player1, VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times1),Item_table1[4]))
end


function exchange_two()
	if condition_check() == 0 then
		return 0
	end
	if VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times2) >= Max_Count then
		Talk(1,"",VET_201206_NPC..format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_BDSG then
		Talk(1,"",VET_201206_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table2[4], Item_BDSG));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_201206_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_BDSG) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201206_ExcAw_TaskGroup:SetTask(VET_201206_ExcAw_TaskGroup.Times2,VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times2)+1);
	if VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times2) ~= Max_Count then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Final1+2500000);
		else
			if ActivityGetDailyGenuineQiLeftCapacity() < 1 then
		 		gf_Modify("Exp",Exp_Award_Final1+2500000);
		 	else
				gf_Modify("Exp",Exp_Award_Final1);
			end
			ActivityAwardGenuineQiDaily(Zhenqi_value1);
		end
		if GetTask(Vet_201206_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201206_Award_Final,100000,1,Acitivity_log1,Acitivity_log2)
		else
			gf_EventGiveRandAward(Vet_201206_Award,10000,1,Acitivity_log1,Acitivity_log2)
		end
	end
	Msg2Player(format(strMsg2Player1,VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times2),Item_table2[4]))
end


function exchange_both()
	if condition_check() == 0 then 
		return 0;
	end
	if VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times3) >= Max_Count then
		Talk(1,"",format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_QCJWJ then
		Talk(1,"",VET_201206_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table1[4], Item_QCJWJ));
		return 0;
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_BDSG then
		Talk(1,"",VET_201206_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table2[4],Item_BDSG));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_201206_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_QCJWJ) ~= 1 then return 0; end
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_BDSG) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201206_ExcAw_TaskGroup:SetTask(VET_201206_ExcAw_TaskGroup.Times3,VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times3)+1);
	if VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times3) ~= Max_Count then
		gf_Modify("Exp",Exp_Award_Normal2);
	else
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Final2+7500000);
		else
			if ActivityGetDailyGenuineQiLeftCapacity() < 1 then
		 		gf_Modify("Exp",Exp_Award_Final2+7500000);
		 	else
				gf_Modify("Exp",Exp_Award_Final2);
			end
			ActivityAwardGenuineQiDaily(Zhenqi_value2);
		end
		if GetTask(Vet_201206_Final_Tag1) == 2000 and GetTask(Vet_201206_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201206_Award_Final,100000,1,Acitivity_log1,Acitivity_log2)
		else
			gf_EventGiveRandAward(Vet_201206_Award,10000,1,Acitivity_log1,Acitivity_log2)
		end
	end
	Msg2Player(format(strMsg2Player1,VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.Times3),Item_table1[4],Item_table2[4]))
end

function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201206_NPC.."Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
		return 0;
	end	
	--ÅÐ¶Ï±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Talk(1,"",VET_201206_NPC.."Kh«ng gian hµnh trang kh«ng ®ñ")
	    return 0
	end
	if VET_201206_ExcAw_TaskGroup:GetTask(VET_201206_ExcAw_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201206_ExcAw_TaskGroup:SetTask(VET_201206_ExcAw_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201206_ExcAw_TaskGroup:SetTask(VET_201206_ExcAw_TaskGroup.Times1,0)		
		VET_201206_ExcAw_TaskGroup:SetTask(VET_201206_ExcAw_TaskGroup.Times2,0)	
		VET_201206_ExcAw_TaskGroup:SetTask(VET_201206_ExcAw_TaskGroup.Times3,0)		
	end
	return 1;
end