--by liubo
--ÐÂÄêÀûÀûÊÇÊÇ»î¶¯½Å±¾

Include("\\script\\lib\\globalfunctions.lua") --¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201112_LILISHISHI_ID = 52 --»î¶¯ID
VET_201112_LILISHISHI_MAXTIMES = 8 --×î´ó´ÎÊý
VET_201112_LILISHISHI_EXP = 2500000 --¾­ÑéÊýÁ¿
VET_201112_LILISHISHI_DELNUM  = 10  --¿Û³ýÊýÁ¿
VET_201112_LILISHISHI_MAXEXP = 20000000
--ÈÎÎñ±äÁ¿×é
VET_201112_LILISHISHI = TaskManager:Create(7,1)
VET_201112_LILISHISHI.DaySeq = 1
VET_201112_LILISHISHI.Times = 2

VET_201112_LILISHISHI_AWARD = {
	  {1, 1250, "C©y Tø Linh", {2, 1, 30269, 1}, 7 * 24 * 3600},
    {1, 1250, "C©y B¸t Nh·", {2, 0, 398, 1}, 7 * 24 * 3600},
    {1, 2000, "C©y B¸t Nh· nhá", {2, 0, 504, 1}, 7 * 24 * 3600},
    {1, 1000, "§u §ñ", {2, 1, 30178, 10}, 0},
    {1, 1000, "Xoµi", {2, 1, 30172, 10}, 0},
    {3, 3500, 680000, 1},
}

tSTRING_201112_ACTIVITY_TB = {
	[1] = "Ta muèn tÆng l× x× cho c¸c em nhá trong thµnh",
	[2] = "Nh©n vËt cÊp 79 trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc 1 kü n¨ng cÊp 55 míi cã thÓ tham gia",
	[3] = "Mçi ngµy thiÕu hiÖp chØ cã thÓ tÆng <color=green>%d<color> lÇn",
	[4] = "L× x× trong hµnh trang thiÕu hiÖp kh«ng ®ñ <color=green>%d<color>",
	[5] = "Thao t¸c thÊt b¹i, h·y thö l¹i",
	[6] = "Ta sÏ chuyÓn tÊm lßng thµnh cña thiÕu hiÖp ®Õn c¸c em nhá trong thµnh thÞ (LÇn %d)",
	[7] = "Kh«ng cÇn ®©u",
}

----------------------------------------
--interface for vn
VET_201112_SENDGIFT_TABLE = tSTRING_201112_ACTIVITY_TB[1].."/send_gift";
VET_201112_SENDGIFT_EXIT = tSTRING_201112_ACTIVITY_TB[7].."/do_nothing";
--example:
--Include("this File")
function send_gift()
	local tbSay = {};
	local nSaySize = 0;
	local szSayHead = "L× X× n¨m míi"
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate >= 20120123 and nDate <= 20120201 then
		tinsert(tbSay,"§ång ý/send_gift_accept");
		tinsert(tbSay,VET_201112_SENDGIFT_EXIT);		--[Optional]
	end
	nSaySize = getn(tbSay);
	Say(szSayHead, nSaySize, tbSay);
end
----------------------------------------



function send_gift_accept()
	if gf_CheckEventDateEx(VET_201112_LILISHISHI_ID) ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n!")
		return 0;
	end
	local nLevel = GetLevel()
    if nLevel < 79  or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201112_ACTIVITY_TB[2])
		return 0
	end
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.DaySeq) ~= zgc_pub_day_turn() then
		VET_201112_LILISHISHI:SetTask(VET_201112_LILISHISHI.DaySeq,zgc_pub_day_turn())
		VET_201112_LILISHISHI:SetTask(VET_201112_LILISHISHI.Times,0)
	end
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times) * VET_201112_LILISHISHI_EXP >= VET_201112_LILISHISHI_MAXEXP then
		Talk(1,"","ThiÕu hiÖp ®· nhËn ®ñ ®iÓm L× X× trong ngµy h«m nay, vui lßng quay l¹i vµo ngµy mai!")
		return 0
	end
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times) >= VET_201112_LILISHISHI_MAXTIMES then
		Talk(1,"",format(tSTRING_201112_ACTIVITY_TB[3],VET_201112_LILISHISHI_MAXTIMES))
		return 0
	end
	if GetItemCount(2,1,30355) < 10 then
		Talk(1,"",format(tSTRING_201112_ACTIVITY_TB[4],VET_201112_LILISHISHI_DELNUM))
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"",tSTRING_MR_WHITE_NPC.."Kh«ng gian hµnh trang kh«ng ®ñ")
        return 0
	end
	if DelItem(2,1,30355,10) == 0 then
		Msg2Player(tSTRING_201112_ACTIVITY_TB[5])
		return 0
	end
	VET_201112_LILISHISHI:SetTask(VET_201112_LILISHISHI.Times,VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times)+1)
	gf_Modify("Exp",VET_201112_LILISHISHI_EXP)
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times) == VET_201112_LILISHISHI_MAXTIMES then
		gf_EventGiveRandAward(VET_201112_LILISHISHI_AWARD,10000,1,"Hoat dong thang 1 nam 2012","LÇn tÆng quµ thø 8 nhËn ®­îc phÇn th­ëng")
	end
	Msg2Player(format(tSTRING_201112_ACTIVITY_TB[6],VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times)))
end

function do_nothing()
end