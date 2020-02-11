--by liubo
--Ê¥µ®½ÚËÍÀñ»î¶¯½Å±¾

Include("\\script\\lib\\globalfunctions.lua") --¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online_activites\\2011_11\\string.lua")
tSTRING_201111_ACTIVITY_TB = {
	[1] = "Ta muèn tÆng quµ cho c¸c em nhá trong thµnh thÞ",
	[2] = "Nh©n vËt cÊp 79 trë lªn, ®· häc kü n¨ng cÊp 55 míi cã thÓ tham gia ho¹t ®éng",
	[3] = "C¸c h¹ chØ ®­îc tÆng quµ tèi ®a <color=green>%d<color> lÇn mçi ngµy",
	[4] = "Hép quµ trong hµnh trang c¸c h¹ kh«ng ®ñ <color=green>%d<color>",
	[5] = "Thao t¸c thÊt b¹i, h·y thö l¹i",
	[6] = "Ta sÏ chuyÓn tÊm lßng thµnh cña thiÕu hiÖp ®Õn c¸c em nhá trong thµnh thÞ (LÇn %d)",
	[7] = "§¹i hiÖp ®· sö dông hÕt ®iÓm trong ngµy h«m nay, vui lßng quay l¹i vµo ngµy mai!!!"
}

VET_201111_SHENGDANGIFT_AWARD = {
    {1, 25, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},
    {1, 10, "C©y Tø Linh", {2, 1, 30269, 1}, 7 * 24 * 3600},
    {1, 20, "C©y B¸t Nh· nhá", {2, 0, 504, 1}, 7 * 24 * 3600},
    {1, 10, "C©y B¸t Nh·", {2, 0, 398, 1}, 7 * 24 * 3600},
    {1, 10, "§u §ñ", {2, 1, 30178, 12}, 0},
    {3, 25, 60000, 1},
};

VET_201111_SHENGDANGIFT_ID = 49 --»î¶¯ID
VET_201111_SHENGDANGIFT_MAXTIMES = 6 --×î´ó´ÎÊý
VET_201111_SHENGDANGIFT_EXP = 2500000 --¾­ÑéÊýÁ¿
VET_201111_SHENGDANGIFT_DELNUM  = 10  --¿Û³ýÊýÁ¿
--ÈÎÎñ±äÁ¿×é
VET_201111_SHENGDANGIFT = TaskManager:Create(4,3)
VET_201111_SHENGDANGIFT.DaySeq = 1
VET_201111_SHENGDANGIFT.Times = 2

function VET_201111_ShengdanGiftDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201111_SHENGDANGIFT_ID) == 1 then
		tinsert(tbSayDialog, tSTRING_201111_ACTIVITY_TB[1].."/send_gift")
	end
    return tbSayDialog, szSayHead 
end

function send_gift()
	local nLevel = GetLevel()
	local nMax_Exp = 15000000
    if nLevel < 79  or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201111_ACTIVITY_TB[2])
		return 0
	end
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_SHENGDANGIFT:SetTask(VET_201111_SHENGDANGIFT.DaySeq,zgc_pub_day_turn())
		VET_201111_SHENGDANGIFT:SetTask(VET_201111_SHENGDANGIFT.Times,0)
	end
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times) >= VET_201111_SHENGDANGIFT_MAXTIMES then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TB[3],VET_201111_SHENGDANGIFT_MAXTIMES))
		return 0
	end
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times) *  VET_201111_SHENGDANGIFT_EXP >= nMax_Exp then
		Talk(1,"",tSTRING_201111_ACTIVITY_TB[7])
		return 0
	end
	if GetItemCount(2,1,30349) < 10 then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TB[4],VET_201111_SHENGDANGIFT_DELNUM))
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[3])
        return 0
	end
	if DelItem(2,1,30349,10) == 0 then
		Msg2Player(tSTRING_201111_ACTIVITY_TB[5])
		return 0
	end
	VET_201111_SHENGDANGIFT:SetTask(VET_201111_SHENGDANGIFT.Times,VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times)+1)
	ModifyExp(VET_201111_SHENGDANGIFT_EXP)
	Msg2Player("B¹n nhËn ®­îc "..VET_201111_SHENGDANGIFT_EXP.." ®iÓm kinh nghiÖm")
	gf_WriteLogEx("Tang qua noel" ,"nhËn 2500000 ®iÓm kinh nghiÖm")
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times) == VET_201111_SHENGDANGIFT_MAXTIMES then
		gf_EventGiveRandAward(VET_201111_SHENGDANGIFT_AWARD,100,1,"Tang qua noel","TÆng quµ lÇn thø 6 nhËn ®­îc phÇn th­ëng")
	end
	Msg2Player(format(tSTRING_201111_ACTIVITY_TB[6],VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times)))
end
