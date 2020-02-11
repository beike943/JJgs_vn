--2012Äê8ÔÂËØÊ³ÅÌ»î¶¯
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\meridian\\meridian_script_api.lua")

VET_201207_ACITIVITY_ID = 69;

VET_201207_NPC = "<color=green>Chñ Töu LÇu:<color>";

VET_201207_Say_Tb = {
	"Ta muèn th­ëng thøc Giß Chay (Tiªu hao 25 §ãa Hoa Vu Lan + 25 Vµng) /#exchange_one(1)",
	"Ta muèn th­ëng thøc Nem (Tiªu hao 25 §ãa Hoa Vu Lan + 25 Vµng) /#exchange_one(2)",
	"Ta muèn th­ëng thøc Rau Xµo ThËp CÈm (Tiªu hao 25 §ãa Hoa tÆng MÑ + 25 Vµng) /#exchange_two(1)",
	"Ta muèn th­ëng thøc C¶i Th¶o TiÒm NÊm §«ng C« (Tiªu hao 25 §ãa Hoa tÆng MÑ + 25 Vµng) /#exchange_two(2)",
	"Ta muèn th­ëng thøc M©m Cç Vu Lan (Tiªu hao 50 §ãa Hoa Vu Lan + 50 §ãa Hoa tÆng MÑ + 50 Vµng)/exchange_both",
	"Ta muèn nhËn th­ëng Siªu Th­ëng Thøc (KÝch ho¹t 06 lÇn tÊt c¶ dßng chän)/super_award",
};

VET_201207_ExcAw_TaskGroup = TaskManager:Create(5,3);
VET_201207_ExcAw_TaskGroup.DaySeq = 1;
VET_201207_ExcAw_TaskGroup.Times1 = 2;
VET_201207_ExcAw_TaskGroup.Times2 = 3;
VET_201207_ExcAw_TaskGroup.Times3 = 4;
VET_201207_ExcAw_TaskGroup.Times4 = 5;
VET_201207_ExcAw_TaskGroup.Times5 = 6;
VET_201207_ExcAw_TaskGroup.Tag = 7;


Max_Count = 6; --Ã¿Ììµ¥Ïî×î¶à8´Î
Exp_Award_Normal1 = 6000000;
Exp_Award_Normal2 = 24000000;
Item_Count1 = 25;
Item_Count2 = 25;
Coin_Consume = 25;
Item_table1 = {2,1,30423,"§ãa Hoa Vu Lan"};
Item_table2 = {2,1,30422,"§ãa Hoa tÆng MÑ"};
Acitivity_log1 = "HOAT DONG PHU THANG 8";
Acitivity_log2 = "M©m Cç Chay";

strMsg2Player1 = "Th­ëng thøc Giß Chay %d/%d";
strMsg2Player2 = "Th­ëng thøc Nem %d/%d";
strMsg2Player3 = "Th­ëng thøc Rau Xµo ThËp CÈm %d/%d";
strMsg2Player4 = "Th­ëng thøc C¶i Th¶o TiÒm NÊm §«ng C« %d/%d";
strMsg2Player5 = "Th­ëng thøc M©m Cç Vu Lan %d/%d";

--½±Àø±í
Vet_201207_Award  = {
    {1, 1919, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 2}, 0},
    {1, 1838, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2525, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 522, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 200, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 333, "M¶nh B¹ch Kim", {2, 1, 30346, 1}, 0},
    {1, 15, "§¹i §Þnh Hån ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {3, 123, 9990000, 1},
    {3, 2525, 990000, 1},
};
Vet_201207_Award_Special  = {
    {1, 1515, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 4}, 0},
    {1, 2020, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 1010, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 678, "M¶nh B¹ch Kim", {2, 1, 30346, 1}, 0},
    {1, 73, "§¹i §Þnh Hån ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {1, 2020, "M¶nh Thiªn Cang", {2, 1, 30390, 100}, 0},
    {3, 2525, 990000, 1},
    {3, 159, 9990000, 1},
};

function exchange_one(nFlag)
	if condition_check() == 0 then
		return 0;
	end
	if nFlag == 1 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count));
			return 0;
		end
	end
	if nFlag == 2 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count));
			return 0;
		end
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_Count1 then
		Talk(1,"",VET_201207_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table1[4],Item_Count1));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_201207_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_Count1) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	if nFlag == 1 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times1,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1)+1);
	end
	if nFlag == 2 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times2,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2)+1);
	end
	gf_Modify("Exp",Exp_Award_Normal1);
	gf_EventGiveRandAward(Vet_201207_Award,10000,1,Acitivity_log1,Acitivity_log2)
	 gf_WriteLogEx(Acitivity_log1, "nhËn thµnh c«ng", 1, "Tæng nhËn 6 triÖu Giß Nem (21/8) lo¹i "..nFlag)
	if nFlag == 1 then
		Msg2Player(format(strMsg2Player1, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1),Max_Count));
	end
	if nFlag == 2 then
		Msg2Player(format(strMsg2Player2, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2),Max_Count));
	end
end


function exchange_two(nFlag)
	if condition_check() == 0 then
		return 0
	end
	if nFlag == 1 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count));
			return 0;
		end
	end
	if nFlag == 2 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count));
			return 0;
		end
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_Count2 then
		Talk(1,"",VET_201207_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table2[4],Item_Count2));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_201207_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_Count2) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	if nFlag == 1 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times3,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3)+1);
	end
	if nFlag == 2 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times4,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4)+1);
	end
	gf_Modify("Exp",Exp_Award_Normal1);
	gf_EventGiveRandAward(Vet_201207_Award,10000,1,Acitivity_log1,Acitivity_log2)
	gf_WriteLogEx(Acitivity_log1, "nhËn thµnh c«ng", 1, "Tæng nhËn 6 triÖu Rau C¶i (21/8) lo¹i "..nFlag)
	if nFlag == 1 then
		Msg2Player(format(strMsg2Player3, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3),Max_Count));
	end
	if nFlag == 2 then
		Msg2Player(format(strMsg2Player4, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4),Max_Count));
	end
end


function exchange_both()
	if condition_check() == 0 then 
		return 0;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5) >= Max_Count then
		Talk(1,"",format("Mçi ngµy mçi nh©n vËt tèi ®a chØ cã thÓ hoµn thµnh<color=green>%d<color>lÇn",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_Count1*2 then
		Talk(1,"",VET_201207_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table1[4], Item_Count1*2));
		return 0;
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_Count2*2 then
		Talk(1,"",VET_201207_NPC..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ <color=green>%d c¸i <color>",Item_table2[4],Item_Count1*2));
		return 0;
	end
	if GetCash() < Coin_Consume*10000*2 then
		Talk(1,"",VET_201207_NPC..format("Trong hµnh trang kh«ng ®ñ sè l­îng vµng<color=green>%d c¸i <color>",Coin_Consume*2));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_Count1*2) ~= 1 then return 0; end
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_Count2*2) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000*2) ~= 1 then return 0; end
	
	VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times5,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5)+1);
	gf_Modify("Exp",Exp_Award_Normal2);
	gf_EventGiveRandAward(Vet_201207_Award,10000,1,Acitivity_log1,Acitivity_log2)
	gf_WriteLogEx(Acitivity_log1, "nhËn thµnh c«ng", 1, "Tæng nhËn 24 triÖu (21/8)")
	Msg2Player(format(strMsg2Player5,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5),Max_Count))
end

function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201207_NPC.."Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
		return 0;
	end	
	--ÅÐ¶Ï±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Talk(1,"",VET_201207_NPC.."Kh«ng gian hµnh trang kh«ng ®ñ")
	    return 0
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times1,0)		
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times2,0)	
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times3,0)
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times4,0)	
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times5,0)
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Tag,0)
	end
	return 1;
end

function super_award()
	if condition_check() == 0 then
		return 0;
	end
	local nFlag = 0;
	local strMsg = "Kh«ng ®ñ ®iÒu kiÖn nhËn phÇn th­ëng Siªu Th­ëng Thøc: \n";
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Tag) == 1 then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng Siªu Th­ëng Thøc råi")
		return 0;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player1,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player2,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player3,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player4,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player5,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if nFlag == 1 then
		Talk(1,"",strMsg);
		return 0;
	end
	VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Tag,1);
	local nRand = gf_EventGiveRandAward(Vet_201207_Award_Special,10000,1,Acitivity_log1,Acitivity_log2)
	gf_WriteLogEx(Acitivity_log1, "nhËn thµnh c«ng", 1, "Tæng nhËn ®Æc biÖt (21/8)")
	--´ó¶¨»ê¹â±¬Ò»ÏÂ
	if nRand == 5 then
		Msg2Global(format("Chóc mõng %s nhËn ®­îc phÇn th­ëng Siªu Th­ëng Thøc trong ho¹t ®éng Vu Lan B¸o HiÕu %s x %d",GetName(),Vet_201207_Award_Special[nRand][3],Vet_201207_Award_Special[nRand][4][4]));
	end
end