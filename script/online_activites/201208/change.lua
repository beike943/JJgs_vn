--201209¸±»î¶¯æÏ¶ð½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

Npc_Name_201208 = "<color=green>H»ng Nga: <color>";

Npc_Say_Title_201208 = "TÆng vËt phÈm Trung Thu cho ThiÕu Nhi!";

Npc_Say_Dialog_201208 = {
	"T¹i h¹ muèn tÆng B¸nh N­íng (tiªu hao 25 B¸nh N­íng + 25 Vµng) /exchange_one",
	"T¹i h¹ muèn tÆng B¸nh DÎo (tiªu hao 25 B¸nh DÎo + 25 Vµng) /exchange_two",
	"T¹i h¹ muèn tÆng lång ®Ìn Trung Thu (tiªu hao 25 B¸nh N­íng + 25 B¸nh DÎo + 25 Vµng)/exchange_both",
	"T¹i h¹ muèn nhËn phÇn th­ëng 'Yªu ThiÕu Nhi ' (chØ kÝch ho¹t thµnh c«ng khi sö dông 06 lÇn)/super_award",
	"T¹i h¹ chØ xem qua th«i/do_nothing",
}

VET_201208_ExcAw_TaskGroup = TaskManager:Create(7,3);
VET_201208_ExcAw_TaskGroup.DaySeq = 1;
VET_201208_ExcAw_TaskGroup.Times1 = 2;
VET_201208_ExcAw_TaskGroup.Times2 = 3;
VET_201208_ExcAw_TaskGroup.Times3 = 4;
VET_201208_ExcAw_TaskGroup.Tag = 5;

Max_Count = 6; --Ã¿Ììµ¥Ïî×î¶à8´Î
Exp_Award_Normal1 = 6000000;
Exp_Award_Normal2 = 12000000;
Item_Count1 = 25;
Item_Count2 = 25;
Coin_Consume = 25;
Item_table1 = {2,1,30433,"B¸nh N­íng "};
Item_table2 = {2,1,30434,"B¸nh DÎo"};

Acitivity_log1 = "HOAT DONG PHU THANG 9";
Acitivity_log2 = "Vui cïng chÞ H»ng";

strMsg2Player1 = "TÆng B¸nh N­íng %d/%d";
strMsg2Player2 = "TÆng B¸nh DÎo %d/%d";
strMsg2Player3 = "TÆng lång ®Ìn Trung Thu %d/%d";

--½±Àø±í
Vet_201208_Award  = {
	{1, 2525, "B¨ng th¹ch", {2, 1, 149, 2}, 0},
    {1, 1919, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 2}, 0},
    {1, 1838, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2525, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 522, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 200, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 333, "M¶nh B¹ch Kim", {2, 1, 30346, 1}, 0},
    {1, 15, "§¹i §Þnh Hån ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {3, 123, 9990000, 1},
};
Vet_201208_Award_Special  = {
	{1, 2525, "B¨ng th¹ch", {2, 1, 149, 3}, 0},
    {1, 1515, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 4}, 0},
    {1, 2020, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 1010, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 678, "M¶nh B¹ch Kim", {2, 1, 30346, 1}, 0},
    {1, 73, "§¹i §Þnh Hån ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {1, 2020, "M¶nh Thiªn Cang", {2, 1, 30390, 100}, 0},
    {3, 159, 9990000, 1},
};

function main()
	Say(Npc_Name_201208..Npc_Say_Title_201208,getn(Npc_Say_Dialog_201208),Npc_Say_Dialog_201208);
end

function exchange_one()
	if condition_check() == 0 then
		return 0;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times1) >= Max_Count then
		Talk(1,"",Npc_Name_201208..format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_Count1 then
		Talk(1,"",Npc_Name_201208..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table1[4],Item_Count1));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",Npc_Name_201208..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_Count1) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times1,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times1)+1);
	gf_Modify("Exp",Exp_Award_Normal1);
	local nRand = gf_EventGiveRandAward(Vet_201208_Award,10000,1,Acitivity_log1,Acitivity_log2);
	--´ó¶¨»ê¹â±¬Ò»ÏÂ
	if Vet_201208_Award[nRand][3] == "§¹i §Þnh Hån " then
		Msg2Global(format("Chóc mõng %s may m¾n nhËn ®­îc phÇn th­ëng %s x %d",GetName(),Vet_201208_Award[nRand][3],Vet_201208_Award[nRand][4][4]));
	end
	Msg2Player(format(strMsg2Player1, VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times1),Max_Count))
	gf_WriteLogEx("HOAT DONG PHU THANG 9", "nhËn thµnh c«ng", 1, "PhÇn th­ëng dßng 1")

end

function exchange_two()	
	if condition_check() == 0 then
		return 0;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times2) >= Max_Count then
		Talk(1,"",Npc_Name_201208..format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_Count2 then
		Talk(1,"",Npc_Name_201208..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table2[4],Item_Count2));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",Npc_Name_201208..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_Count2) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times2,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times2)+1);
	gf_Modify("Exp",Exp_Award_Normal1);
	local nRand = gf_EventGiveRandAward(Vet_201208_Award,10000,1,Acitivity_log1,Acitivity_log2)
	--´ó¶¨»ê¹â±¬Ò»ÏÂ
	if Vet_201208_Award[nRand][3] == "§¹i §Þnh Hån " then
		Msg2Global(format("Chóc mõng %s may m¾n nhËn ®­îc phÇn th­ëng %s x %d",GetName(),Vet_201208_Award[nRand][3],Vet_201208_Award[nRand][4][4]));
	end
	Msg2Player(format(strMsg2Player2, VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times2),Max_Count));
	gf_WriteLogEx("HOAT DONG PHU THANG 9", "nhËn thµnh c«ng", 1, "PhÇn th­ëng dßng 2")
end

function exchange_both()
	if condition_check() == 0 then
		return 0;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times3) >= Max_Count then
		Talk(1,"",format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_Count1 then
		Talk(1,"",Npc_Name_201208..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table1[4], Item_Count1));
		return 0;
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_Count2 then
		Talk(1,"",Npc_Name_201208..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table2[4],Item_Count2));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",Npc_Name_201208..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_Count1) ~= 1 then return 0; end
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_Count2) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times3,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times3)+1);
	gf_Modify("Exp",Exp_Award_Normal2);
	local nRand = gf_EventGiveRandAward(Vet_201208_Award,10000,1,Acitivity_log1,Acitivity_log2)
	--´ó¶¨»ê¹â±¬Ò»ÏÂ
	if Vet_201208_Award[nRand][3] == "§¹i §Þnh Hån " then
		Msg2Global(format("Chóc mõng %s may m¾n nhËn ®­îc phÇn th­ëng %s x %d",GetName(),Vet_201208_Award[nRand][3],Vet_201208_Award[nRand][4][4]));
	end
	Msg2Player(format(strMsg2Player3,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times3),Max_Count));
	gf_WriteLogEx("HOAT DONG PHU THANG 9", "nhËn thµnh c«ng", 1, "PhÇn th­ëng c¶ 2 dßng")
end

function super_award()
	if condition_check() == 0 then
		return 0;
	end
	local nFlag = 0;
	local strMsg = "Ch­a ®ñ ®iÒu kiÖn nhËn phÇn th­ëng:  \n";
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Tag) == 1 then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng råi")
		return 0;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times1) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player1,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times1),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times2) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player2,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times2),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times3) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player3,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times3),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if nFlag == 1 then
		Talk(1,"",strMsg);
		return 0;
	end
	VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Tag,1);
	local nRand = gf_EventGiveRandAward(Vet_201208_Award_Special,10000,1,Acitivity_log1,Acitivity_log2)
	--´ó¶¨»ê¹â±¬Ò»ÏÂ
	if Vet_201208_Award_Special[nRand][3] == "§¹i §Þnh Hån " then
		Msg2Global(format("Chóc mõng %s may m¾n nhËn ®­îc phÇn th­ëng %s x %d",GetName(),Vet_201208_Award_Special[nRand][3],Vet_201208_Award_Special[nRand][4][4]));
	end
	gf_WriteLogEx("HOAT DONG PHU THANG 9", "nhËn thµnh c«ng", 1, "PhÇn th­ëng ®Æc biÖt")
end

function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",Npc_Name_201208.."Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
		return 0;
	end	
	--ÅÐ¶Ï±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(3,100) ~= 1 then
			Talk(1,"",Npc_Name_201208.."Kh«ng gian hµnh trang kh«ng ®ñ")
	    return 0
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times1,0)		
		VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times2,0)	
		VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times3,0)
		VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Tag,0)
	end
	return 1;
end

function do_nothing()
--do nothing
end