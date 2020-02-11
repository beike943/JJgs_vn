--2012Äê5ÔÂ³©¿ìÊî¼Ù»î¶¯
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_CKSJ_ACITIVITY_ID = 62;

VET_CKSJ_NPC = "<color=green>Th­¬ng Nh©n ThÇn BÝ :   <color>";

Vet_CKSJ_Say_Tb = {
	"T¹i h¹ muèn ®æi Cocktail 7 mµu lÊy phÇn th­ëng (tiªu hao 25 Cocktail 7 mµu + 25 Vµng)/exchange_qcjwj",
	"T¹i h¹ muèn ®æi Tr¸i C©y ­íp l¹nh lÊy phÇn th­ëng (tiªu hao 25 Tr¸i C©y ­íp l¹nh  + 25 Vµng)/exchange_bdsg",
	"T¹i h¹ muèn ®æi Cocktail 7 mµu vµ Tr¸i C©y ­íp l¹nh lÊy phÇn th­ëng (tiªu hao 25 Cocktail 7 mµu  + 25 Tr¸i C©y ­íp l¹nh + 25 Vµng)/exchange_both",
};

VET_201204_CKSJ_TaskGroup = TaskManager:Create(8,2);
VET_201204_CKSJ_TaskGroup.DaySeq = 1;
VET_201204_CKSJ_TaskGroup.Times1 = 2;
VET_201204_CKSJ_TaskGroup.Times2 = 3;
VET_201204_CKSJ_TaskGroup.Times3 = 4;

--externs task eq 2000
--don't modify
Vet_201204_Final_Tag1 = 2813;
Vet_201204_Final_Tag2 = 2814;

Max_Count = 8; --Ã¿Ììµ¥Ïî×î¶à8´Î
Exp_Award_Normal1 = 6500000;
Exp_Award_Normal2 = 12000000;
Exp_Award_Final1 = 5000000;
Exp_Award_Final2 = 10000000;
Item_QCJWJ = 25;
Item_BDSG = 25;
Coin_Consume = 25;
--½±Àø±í
Vet_201204_Award  = {
    {1, 1850, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
    {1, 1502, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2929, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 1010, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 51, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {3, 2658, 990000, 1},
};
Vet_201204_Award_Final  = {
    {1, 18020, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 2}, 0},
    {1, 15020, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 38410, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 5218, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 2000, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 2, "M¶nh B¹ch Kim", {2, 1, 30346, 1}, 0},
    {3, 20330, 990000, 1},
    {3, 1000, 9990000, 1},
};

function exchange_qcjwj()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_CKSJ_NPC.."Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
		return 0;
	end	
	--ÅÐ¶Ï±³°ü¿Õ¼ä
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return 0
	end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
			Talk(1,"",VET_CKSJ_NPC.."Kh«ng gian hµnh trang kh«ng ®ñ")
	    return 0
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,0)		
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,0)	
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,0)
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1) >= 8 then
		Talk(1,"",VET_CKSJ_NPC..format("Mçi ngµy mçi gamer chØ giao nép tèi ®a <color=green>%d<color>lÇn",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30377) < Item_QCJWJ then
		Talk(1,"",VET_CKSJ_NPC..format("Sè l­îng Cocktail 7 mµu trong hµnh trang kh«ng ®ñ<color=green>%d ly <color>",Item_QCJWJ));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_CKSJ_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(2,1,30377,Item_QCJWJ) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1)+1);
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		gf_Modify("Exp",Exp_Award_Final1);
		if GetTask(Vet_201204_Final_Tag1) == 2000 then
			gf_EventGiveRandAward(Vet_201204_Award_Final,100000,1,"PhÇn th­ëng tèi ®a Mïa HÌ S¶ng Kho¸i","Nh©n vËt ch­a sö dông tèi ®a ho¹t ®éng Mïa HÌ S¶ng Kho¸i")
		else
			gf_EventGiveRandAward(Vet_201204_Award,10000,1,"PhÇn th­ëng tèi ®a Mïa HÌ S¶ng Kho¸i","Nh©n vËt ch­a sö dông tèi ®a ho¹t ®éng Mïa HÌ S¶ng Kho¸i")
		end
	end
	Msg2Player(format("§©y lµ lÇn thø %d  b¹n sö dïng Cocktail 7 mµu lÊy phÇn th­ëng",VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1)))
end


function exchange_bdsg()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_CKSJ_NPC.."Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
		return 0;
	end	
	--ÅÐ¶Ï±³°ü¿Õ¼ä
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return 0
	end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
			Talk(1,"",VET_CKSJ_NPC.."Kh«ng gian hµnh trang kh«ng ®ñ")
	    return 0
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,0)		
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,0)	
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,0)
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2) >= 8 then
		Talk(1,"",VET_CKSJ_NPC..format("Mçi ngµy mçi gamer chØ giao nép tèi ®a <color=green>%d<color>lÇn",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30378) < Item_BDSG then
		Talk(1,"",VET_CKSJ_NPC..format("Sè l­îng Tr¸i C©y ­íp l¹nh trong hµnh trang kh«ng ®ñ <color=green>%d tr¸i <color>",Item_BDSG));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_CKSJ_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng: <color=green>%d vµng <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(2,1,30378,Item_BDSG) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2)+1);
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		gf_Modify("Exp",Exp_Award_Final1);
		if GetTask(Vet_201204_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201204_Award_Final,100000,1,"PhÇn th­ëng tèi ®a Mïa HÌ S¶ng Kho¸i","Nh©n vËt ch­a sö dông tèi ®a ho¹t ®éng Mïa HÌ S¶ng Kho¸i")
		else
			gf_EventGiveRandAward(Vet_201204_Award,10000,1,"PhÇn th­ëng tèi ®a Mïa HÌ S¶ng Kho¸i","Nh©n vËt ch­a sö dông tèi ®a ho¹t ®éng Mïa HÌ S¶ng Kho¸i")
		end
	end
	Msg2Player(format("§©y lµ lÇn thø %d  b¹n sö dïng Tr¸i c©y ­íp l¹nh lÊy phÇn th­ëng",VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2)))
end


function exchange_both()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_CKSJ_NPC.."Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
		return 0;
	end	
	--ÅÐ¶Ï±³°ü¿Õ¼ä
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
			Talk(1,"",VET_CKSJ_NPC.."Kh«ng gian hµnh trang kh«ng ®ñ")
	    return 0
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,0)		
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,0)	
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,0)		
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3) >= 8 then
		Talk(1,"",format("Mçi ngµy mçi gamer chØ giao nép tèi ®a<color=green>%d<color>lÇn",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30377) < Item_QCJWJ then
		Talk(1,"",VET_CKSJ_NPC..format("Sè l­îng Cocktail 7 mµu trong hµnh trang kh«ng ®ñ <color=green>%d ly <color>",Item_QCJWJ));
		return 0;
	end
	if GetItemCount(2,1,30378) < Item_BDSG then
		Talk(1,"",VET_CKSJ_NPC..format("Sè l­îng Tr¸i C©y ­íp l¹nh trong hµnh trang kh«ng ®ñ <color=green>%d tr¸i <color>",Item_BDSG));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_CKSJ_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng: <color=green>%d vµng <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(2,1,30377,Item_QCJWJ) ~= 1 then return 0; end
	if DelItem(2,1,30378,Item_BDSG) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3)+1);
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal2);
	else
		gf_Modify("Exp",Exp_Award_Final2);
		if GetTask(Vet_201204_Final_Tag1) == 2000 and GetTask(Vet_201204_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201204_Award_Final,100000,1,"PhÇn th­ëng tèi ®a Mïa HÌ S¶ng Kho¸i","Nh©n vËt ch­a sö dông tèi ®a ho¹t ®éng Mïa HÌ S¶ng Kho¸i")
		else
			gf_EventGiveRandAward(Vet_201204_Award,10000,1,"PhÇn th­ëng tèi ®a Mïa HÌ S¶ng Kho¸i","Nh©n vËt ch­a sö dông tèi ®a ho¹t ®éng Mïa HÌ S¶ng Kho¸i")
		end
	end
	Msg2Player(format("§©y lµ lÇn thø %d  b¹n sö dïng Cocktail 7 mµu vµ Tr¸i c©y ­íp l¹nh lÊy phÇn th­ëng",VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3)))
end

