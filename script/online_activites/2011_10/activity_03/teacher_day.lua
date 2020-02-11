--by liubo
--½ÌÊ¦½Ú»î¶¯

Include("\\script\\lib\\globalfunctions.lua") --¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\misc\\taskmanager.lua") 

VET_201111_TEACHER_DAY = TaskManager:Create(3,3)
VET_201111_TEACHER_DAY.LoginInTime = 1 --µÇÂ¼µÄÊ±¼ä  
VET_201111_TEACHER_DAY.Times = 2 --ÁìÈ¡ËéÆ¬µÄ´ÎÊý 
VET_201111_TEACHER_DAY.DaySeq = 3 --Ìì´Î
VET_201111_TEACHER_DAY.TriggerIndex = 4 --´¥·¢Æ÷Ë÷Òý 
VET_201111_TEACHER_DAY.SpaceTime = 5 --ÀÛ¼ÆÔÚÏßÊ±¼ä 

VET_201111_MaxUsedCount = 10 --×î´óÊ¹ÓÃ´ÎÊý -- 
VET_201111_LimitTime = 60*60 --ÁìÈ¡Ê±¼ä  --

--µÇÂ¼´¥·¢Æ÷
VET_201111_TEACHER_DAY_TBID = 3004 --±íÄÚID 
VET_201111_TEACHER_DAY_UFID = 2557 --×Ô¶¨ÒåID -
--Ê±¼ä´¥·¢Æ÷ -- 
VET_201111_TEACHER_DAY_TBID1 = 1515 
VET_201111_TEACHER_DAY_UFID1 = 2550

VET_201111_TEACHER_DAY_STRING = {
	[1] = "Thêi gian online cña c¸c h¹ lµ <color=green>%d<color>giê<color=green>%d<color> phót<color=green>%d<color> gi©y.",
	[2] = "Thêi gian online cña c¸c h¹ lµ<color=green>%d<color> giê<color=green>%d<color> phót<color=green>%d<color> gi©y. \nThêi gian online cã thÓ sö dông cßn l¹i<color=green>%d<color> giê<color=green>%d<color> phót<color=green>%d<color> gi©y.",
	[3] = "Nh©n vËt ®¹t cÊp<color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc kü n¨ng cÊp 55 míi cã thÓ tham gia event.",
	[4] = "Mçi ngµy mçi ng­êi ch¬i giíi h¹n nhËn ®­îc M¶nh GhÐp lµ <color=green>10<color> m¶nh.",
	[5] = "Thêi gian nhËn m·nh ghÐp vÉn ch­a ®Õn.",
	[6] = "Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i hµnh trang!",
	[7] = "[Event]: evnet nhµ gi¸o th¸ng 11 n¨m 2011 sè m¶nh ghÐp ngÉu nhiªn dÞ th­êng.",
	[8] = "Sè l­îng m¶nh ‘T«n’ kh«ng ®ñ",
	[9] = "Sè l­îng m¶nh ‘S­’ kh«ng ®ñ",
	[10] = "Sè l­îng m¶nh ‘Träng’ kh«ng ®ñ",
	[11] = "Sè l­îng m¶nh ‘§¹o’ kh«ng ®ñ",
	[12] = "[Event]: B¶o R­¬ng Tri ¢n gia t¨ng thÊt b¹i",
}

--11ÔÂ½ÌÊ¦½Ú»î¶¯£¬×ðÊ¦ÖØµÀ -- 
function check_onlinetime()
	local nTime = GetTime()
	--²»ÀÛ¼Æ¿çÌìÔÚÏßÊ±¼ä
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)
	end	
	local nLoginTime = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime)
	local nOnlineTime = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime)
	local nUseTime = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) * VET_201111_LimitTime
	local hour1,minute1,second1 = format_time(nTime - nLoginTime + nOnlineTime)
	local hour2,minute2,second2 = format_time(nTime - nLoginTime + nOnlineTime - nUseTime)
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55MaxSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",format(VET_201111_TEACHER_DAY_STRING[1],hour1,minute1,second1))
	else
		Talk(1,"",format(VET_201111_TEACHER_DAY_STRING[2],hour1,minute1,second1,hour2,minute2,second2))
	end
end

function exchang_chip()
	local nTime = GetTime()
	--¶ÔÏóÏÞÖÆ
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55MaxSkill() == 0  or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[3])
		return 0
	end
	--ÁìÈ¡´ÎÊýÏÞÖÆ
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)
	end
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) >= VET_201111_MaxUsedCount then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[4])
		return 0
	end
	--Ê±¼äÊÇ·ñÂú×ã
	if nTime - VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime) + VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime) - VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) * VET_201111_LimitTime < VET_201111_LimitTime then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[5])
		return 0
	end
	--±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(1,1,"") == 0 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[6])
		return 0
	end
	--ÁìÈ¡´ÎÊý¼Ó1
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times)+1)
	--Ëæ»ú¸øËéÆ¬
	local num = random(400)
	if mod(num,4) == 1 then
		--gf_AddItemEx({2,1,30335,1},"T«n",1)
		gf_AddItemEx2({2,1,30335,1},"T«n", "Ton Su Trong Dao", "nhan Ton")
	elseif mod(num,4) == 2 then
		--gf_AddItemEx({2,1,30336,1},"S­",1)
		gf_AddItemEx2({2,1,30336,1},"S­", "Ton Su Trong Dao", "nhan Su")
	elseif mod(num,4) == 3 then
		--gf_AddItemEx({2,1,30337,1},"Träng",1)
		gf_AddItemEx2({2,1,30337,1},"Träng", "Ton Su Trong Dao", "nhan Trong")
	elseif mod(num,4) == 0 then
		--gf_AddItemEx({2,1,30338,1},"§¹o",1)
		gf_AddItemEx2({2,1,30338,1},"§¹o", "Ton Su Trong Dao", "nhan Dao")
	else
		WriteLog(VET_201111_TEACHER_DAY_STRING[7])
	end
end

function exchang_zhienbaoxiang()
	--¶ÔÏóÏÞÖÆ
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55MaxSkill() == 0  or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[3])
		return 0
	end
	if BigGetItemCount(2,1,30335) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[8])
		return 0
	end
	if BigGetItemCount(2,1,30336) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[9])
		return 0
	end
	if BigGetItemCount(2,1,30337) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[10])
		return 0
	end
	if BigGetItemCount(2,1,30338) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[11])
		return 0
	end
	BigDelItem(2,1,30335,1)
	BigDelItem(2,1,30336,1)
	BigDelItem(2,1,30337,1)
	BigDelItem(2,1,30338,1)
	local res,index = gf_AddItemEx2({2,1,30339,1},"B¶o R­¬ng Tri ¢n", "Ton Su Trong Dao", "nhan Bao Ruong") --gf_AddItemEx({2,1,30339,1},"B¶o R­¬ng Tri ¢n",1)
	if res == 0 then
	--	print("writelog")
		WriteLog(VET_201111_TEACHER_DAY_STRING[12])
	end
end

function format_time(nSecond)
	if nSecond < 0 then
		return 0,0,0
	end
	local hour,minute,second
	hour = floor(nSecond / 3600)
	minute = floor((nSecond - hour*3600)/ 60)
	second = nSecond - minute*60 - hour*3600
	return hour,minute,second
end

--·µ»ØÌìÊý
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end

--µÇ³ö
function Leave_Game()
	local nTime = GetTime()
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime)+(nTime-VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime)))
	local nIndex1 = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.TriggerIndex)
	if nIndex1 ~= 0 then
		RemoveTrigger(nIndex1)
	end
	local nIndex2 = GetTrigger(VET_201111_TEACHER_DAY_UFID1)
	if nIndex2 ~= 0 then
		RemoveTrigger(nIndex2)
	end
end

function OnTimer()
	do return end
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		local nTime = GetTime()
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime)+(nTime-VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime)))
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)
	end
end