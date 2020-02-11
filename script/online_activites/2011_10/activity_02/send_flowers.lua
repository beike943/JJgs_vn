--by liubo
--ËÍ»¨»î¶¯½Å±¾

Include("\\script\\lib\\globalfunctions.lua") --¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\misc\\taskmanager.lua") 

tSTRING_201111_ACTIVITY_TWO = {
	[1] = "TÆng hoa ®Õn c¸c vÞ s­ phô trong thiªn h¹",
	[2] = "Nh©n vËt cÊp 77 trë lªn, ®· häc kü n¨ng cÊp 55 míi cã thÓ tham gia ho¹t ®éng",
	[3] = "ThiÕu hiÖp chØ cã thÓ tÆng hoa <color=green>%d<color> lÇn",
	[4] = "Hoa S¬n Trµ thiÕu hiÖp mang theo kh«ng ®ñ <color=green>%d<color> hoa",
	[5] = "Thao t¸c thÊt b¹i, h·y thö l¹i",
	[6] = "C¸c vÞ tr­ëng m«n ®· nhËn ®­îc tÊm lßng thµnh cña c¸c h¹ råi (t¨ng hoa lÇn %d)",
}

VET_201111_SENDFLOWER_ID = 43 --»î¶¯ID
VET_201111_SENDFLOWER_MAXTIMES = 6 --×î´ó´ÎÊý
VET_201111_SENDFLOWER_EXP = 2500000 --¾­ÑéÊýÁ¿
VET_201111_SENDFLOWER_DELNUM  = 10  --¿Û³ýÊýÁ¿
--ÈÎÎñ±äÁ¿×é
VET_201111_SEND_FLOWER = TaskManager:Create(2,6)
VET_201111_SEND_FLOWER.DaySeq = 1
VET_201111_SEND_FLOWER.Times = 2

function VET_201111_SendFlowerDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201111_SENDFLOWER_ID) == 1 then
		tinsert(tbSayDialog, tSTRING_201111_ACTIVITY_TWO[1].."/send_flower")
	end
    return tbSayDialog, szSayHead 
end

function send_flower()
	local nLevel = GetLevel()
    if nLevel < 77  or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201111_ACTIVITY_TWO[2])
		return 0
	end
	if VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_SEND_FLOWER:SetTask(VET_201111_SEND_FLOWER.DaySeq,zgc_pub_day_turn())
		VET_201111_SEND_FLOWER:SetTask(VET_201111_SEND_FLOWER.Times,0)
	end
	if VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.Times) >= VET_201111_SENDFLOWER_MAXTIMES then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TWO[3],VET_201111_SENDFLOWER_MAXTIMES))
		return 0
	end
	if BigGetItemCount(2,1,30334) < 10 then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TWO[4],VET_201111_SENDFLOWER_DELNUM))
		return 0
	end
	if BigDelItem(2,1,30334,10) == 0 then
		Msg2Player(tSTRING_201111_ACTIVITY_TWO[5])
		return 0
	end
	VET_201111_SEND_FLOWER:SetTask(VET_201111_SEND_FLOWER.Times,VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.Times)+1)
	--gf_Modify("Exp",VET_201111_SENDFLOWER_EXP)
	ModifyExp(VET_201111_SENDFLOWER_EXP)
	WriteLogEx("Tang hoa Thay Co", " nhËn ®­îc "..VET_201111_SENDFLOWER_EXP.."  ®iÓm kinh nghiÖm")
	Msg2Player("B¹n nhËn ®­îc "..VET_201111_SENDFLOWER_EXP.."  ®iÓm kinh nghiÖm")
	Msg2Player(format(tSTRING_201111_ACTIVITY_TWO[6],VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.Times)))
end

--·µ»ØÌìÊý
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end