--by liubo 
--2012Äê3ÔÂ¹ú¼Ê¸¾Å®½Ú¸±»î¶¯

Include("\\script\\lib\\globalfunctions.lua") --¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_201202_SENDPIFENG_ID = 57; 
VET_201202_SENDPIFENG_Exp1 = 2000000;
VET_201202_SENDPIFENG_Exp2 = 1000000;
VET_201202_SENDPIFENG_DelItemNum = 8;
VET_201202_SENDPIFENG_DelGold = 3; --ÏûºÄ3J
VET_201202_SENDPIFENG_SendCount = 8;--8´Î

VET_201202_SENDPIFENG_TASK = TaskManager:Create(3,5);
VET_201202_SENDPIFENG_TASK.Num = 1;
VET_201202_SENDPIFENG_TASK.DaySeq = 2;

VET_201202_SENDPIFENG_AWARD1 = {
	  {1, 1850, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
  	  {1, 1502, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
    	  {1, 2929, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    	  {1, 1010, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
	  {1, 51, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    	  {3, 2658, 830000, 1},
};

VET_201202_SENDPIFENG_AWARD2 = {
	{1, 18020, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 2}, 0},
    	{1, 15020, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
	{1, 38410, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    	{1, 5218, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    	{1, 2000, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    	{1, 2, "M¶nh B¹ch Kim", {2, 1, 30346, 1}, 0},
    	{3, 20330, 830000, 1},
    	{3, 1000, 8300000, 1},
};

function main()
	local nDate =  tonumber(date("%y%m%d"))
	if nDate < 120312 or nDate > 120408 then
		Talk(1, "", "§· hÕt h¹n tÆng quµ cho chÞ em Phô N÷!")
		return
	end
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Chµo mõng lÔ quèc tÕ Phô N÷ 8 - 3. B¹n h·y tÆng quµ cho chÞ em Phô N÷:"
	local tbSayDialog = {};
	local nSaySize = 0;

	tinsert(tbSayDialog, "Ta muèn tÆng Phi Phong Hoµng Kim cho chÞ em Phô N÷ (8 phi phong Hoµng Kim + 3 vµng/deal_send")
	tinsert(tbSayDialog, "Ta chØ ghÐ ngang/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)		
	
end

function deal_send()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
		return 0;
	end
	if VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201202_SENDPIFENG_TASK:SetTask(VET_201202_SENDPIFENG_TASK.DaySeq,zgc_pub_day_turn())
		VET_201202_SENDPIFENG_TASK:SetTask(VET_201202_SENDPIFENG_TASK.Num,0)
	end
	if VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num) >= VET_201202_SENDPIFENG_SendCount then
		Talk(1,"",format("Mçi ngµy giíi h¹n tÆng <color=green>%d<color> lÇn Hoµng Kim Phi Phong",VET_201202_SENDPIFENG_SendCount));
		return 0;
	end
	if GetItemCount(2,1,30362) < VET_201202_SENDPIFENG_DelItemNum then 
		Talk(1,"",format("Phi Phong trong hµnh trang kh«ng ®ñ <color=green>%d<color>",VET_201202_SENDPIFENG_DelItemNum))
		return 0;
	end
	if GetCash() < VET_201202_SENDPIFENG_DelGold*10000 then
		Talk(1,"",format("TiÒn vµng trong hµnh trang kh«ng ®ñ <color=grenn>%d<color>",VET_201202_SENDPIFENG_DelGold))
		return 0;
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
    return 0
	end
	if DelItem(2,1,30362,VET_201202_SENDPIFENG_DelItemNum) ~= 1 then
		return 0
	end
	if Pay(VET_201202_SENDPIFENG_DelGold*10000) ~= 1 then
		return 0
	end
	VET_201202_SENDPIFENG_TASK:SetTask(VET_201202_SENDPIFENG_TASK.Num,VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num)+1);
	if VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num) == VET_201202_SENDPIFENG_SendCount then
		gf_Modify("Exp",VET_201202_SENDPIFENG_Exp2);
		--\script\misc\taskmanager.luaÈÎÎñ±äÁ¿2783¼ÇÂ¼ÊÇ·ñÁìÈ¡×îÖÕ½±Àø
		if GetTask(2783) == 0 then
		 	gf_EventGiveRandAward(VET_201202_SENDPIFENG_AWARD1,10000,1,"QUOC TE PHU NU","PhÇn th­ëng tÆng quµ lÇn thø 8");
		else
			gf_EventGiveRandAward(VET_201202_SENDPIFENG_AWARD2,100000,1,"QUOC TE PHU NU","PhÇn th­ëng tÆng quµ lÇn thø 8");
		end		
	else
		gf_Modify("Exp",VET_201202_SENDPIFENG_Exp1);
	end
	Msg2Player(format("TÊt c¶ chÞ em phô n÷ trong thµnh ®· nhËn ®­îc quµ Quèc TÕ Phô N÷ cña b¹n råi (lÇn thø %d)",VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num)))
end
