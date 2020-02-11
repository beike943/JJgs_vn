--2012Äê6ÔÂÇÐ»»Ë®¹û»î¶¯
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

--	how to use
--	Include("\\script\\online_activites\\201205\\exchange_fruit.lua")
--	function main
--		local tbSay = {};
--		if gf_CheckEventDateEx(VET_201205_TMC_AcitivityID) == 1 then
--			for i=1,getn(VET_201205_TANGMINGCHENG_TABLE) do
--				tinsert(tbSay,VET_201205_TANGMINGCHENG_TABLE[i]);
--			end
--		end	
--		tinsert(tbSay,"ÒÔºóÔÙËµ/cancel");
--		Say("...",getn(tbSay),tbSay);
--	end

VET_201205_TMC_NPC = "<color=green>§­êng Minh Thµnh: <color>";

VET_201205_TMC_AcitivityID = 65;

ZongZi_Num = 20;
Fruit_Num = 20;
Coin_Cost = 20;--½ð
Item_table1 = {2,1,30382,"B¸nh ó Tro"};
Item_table2 = {2,1,30383,"B¸nh ó Tro §Ëu §á"};
Max_Exch_Num = 3;
AddItem_log1 = "Ho¹t ®éng th¸ng 6 n¨m 2012";
AddItem_log2 = "§æi Tr¸i C©y";

VET_201205_TANGMINGCHENG_TABLE = {
	"T¹i h¹ muèn ®æi B¸nh ó Tro lÊy phÇn th­ëng 20 Tr¸i C©y ngÉu nhiªn  (tiªu hao 20 B¸nh ó Tro +20 vµng)/exchange_one",
	"T¹i h¹ muèn ®æi B¸nh ó Tro §Ëu §á lÊy phÇn th­ëng 20 Tr¸i C©y ngÉu nhiªn  (tiªu hao 20 B¸nh ó Tro §Ëu §á +20 vµng)/exchange_two",
}

VET_201205_TMC_TaskGroup = TaskManager:Create(1,10);
VET_201205_TMC_TaskGroup.DaySeq = 1;
VET_201205_TMC_TaskGroup.Times1 = 2;
VET_201205_TMC_TaskGroup.Times2 = 3;

VET_201205_TMC_AWARD1 = {
    {1, 5, "Nh·n", {2, 1, 30164, 1}, 0},
    {1, 5, "Ch«m Ch«m", {2, 1, 30165, 1}, 0},
    {1, 15, "Cam", {2, 1, 30165, 1}, 0},
    {1, 5, "Dõa", {2, 1, 30167, 1}, 0},
    {1, 5, "M¨ng Côt", {2, 1, 30168, 1}, 0},
    {1, 5, "M·ng cÇu", {2, 1, 30179, 1}, 0},
    {1, 15, "Khãm", {2, 1, 30180, 1}, 0},
    {1, 15, "Lª", {2, 1, 30181, 1}, 0},
    {1, 15, "Bßn Bon", {2, 1, 30182, 1}, 0},
    {1, 15, "KhÕ", {2, 1, 30183, 1}, 0},
};

 
VET_201205_TMC_AWARD2 = {
    {1, 5, "B­ëi", {2, 1, 30169, 1}, 0},
    {1, 10, "D©u", {2, 1, 30170, 1}, 0},
    {1, 15, "Chuèi", {2, 1, 30171, 1}, 0},
    {1, 5, "Xoµi", {2, 1, 30172, 1}, 0},
    {1, 5, "§µo", {2, 1, 30173, 1}, 0},
    {1, 10, "MËn", {2, 1, 30174, 1}, 0},
    {1, 15, "V¶i", {2, 1, 30175, 1}, 0},
    {1, 15, "T¸o", {2, 1, 30176, 1}, 0},
    {1, 15, "B¬", {2, 1, 30177, 1}, 0},
    {1, 5, "§u §ñ", {2, 1, 30178, 1}, 0},
};


function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201205_TMC_NPC.."Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
		return 0;
	end	
	--ÅÐ¶Ï±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(10,20," ") ~= 1 then
			Talk(1,"",VET_201205_TMC_NPC.."Kh«ng gian hµnh trang kh«ng ®ñ")
	    return 0;
	end
	if VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201205_TMC_TaskGroup:SetTask(VET_201205_TMC_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201205_TMC_TaskGroup:SetTask(VET_201205_TMC_TaskGroup.Times1,0)		
		VET_201205_TMC_TaskGroup:SetTask(VET_201205_TMC_TaskGroup.Times2,0)	
	end
	return 1;
end

function check_Item(Item_table)
	if Item_table == nil then return 0; end
	if GetItemCount(Item_table[1],Item_table[2],Item_table[3]) < ZongZi_Num then
		Talk(1,"",format("%s Sè l­îng kh«ng ®ñ %d c¸i",Item_table[4],ZongZi_Num));
		return 0;
	else
		if GetCash() < Coin_Cost*10000 then
			Talk(1,"",format("Sè l­îng vµng trong hµnh trang kh«ng ®ñ%d",Coin_Cost))
			return 0;
		else
			if DelItem(Item_table[1],Item_table[2],Item_table[3],ZongZi_Num) ~= 1 then
				Msg2Player("Ch­a râ nguyªn nh©n thao t¸c kh«ng thÓ hoµn thµnh")
				return 0;
			else
				if Pay(Coin_Cost*10000) ~= 1 then
					Msg2Player("Ch­a râ nguyªn nh©n thao t¸c kh«ng thÓ hoµn thµnh")
					return 0;
				else
					return 1;
				end
			end
		end
	end
end

function exchange_one()
	if condition_check() == 0 then
		return 0;
	end
	if VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times1) >= Max_Exch_Num then
		Talk(1,"",VET_201205_TMC_NPC..format("Mçi ngµy mçi gamer chØ giao nép tèi ®a<color=green>%d<color>lÇn",Max_Exch_Num));
		return 0;
	end
	if check_Item(Item_table1) ~= 1 then
		return 0;
	end
	VET_201205_TMC_TaskGroup:SetTask(VET_201205_TMC_TaskGroup.Times1,VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times1) + 1);
	for i = 1,Fruit_Num do 
		gf_EventGiveRandAward(VET_201205_TMC_AWARD1,100,1,AddItem_log1,AddItem_log2);
	end
	Msg2Player(format("C¸c h¹ ®· lÇn thø %d sö dông %s ®æi phÇn th­ëng råi ", VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times1),Item_table1[4]))
end

function exchange_two()
	if condition_check() == 0 then
		return 0;
	end
	if VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times2) >= Max_Exch_Num then
		Talk(1,"",VET_201205_TMC_NPC..format("Mçi ngµy mçi gamer chØ giao nép tèi ®a<color=green>%d<color>lÇn",Max_Exch_Num));
		return 0;
	end
	if check_Item(Item_table2) ~= 1 then
		return 0;
	end
	VET_201205_TMC_TaskGroup:SetTask(VET_201205_TMC_TaskGroup.Times2,VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times2) + 1);
	for i = 1,Fruit_Num do 
		gf_EventGiveRandAward(VET_201205_TMC_AWARD2,100,1,AddItem_log1,AddItem_log2);
	end
	Msg2Player(format("C¸c h¹ ®· lÇn thø %d sö dông %s ®æi phÇn th­ëng råi ", VET_201205_TMC_TaskGroup:GetTask(VET_201205_TMC_TaskGroup.Times2),Item_table2[4]))
end