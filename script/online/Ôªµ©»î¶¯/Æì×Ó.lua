--filename:Æì×Ó.lua
--create date:2005-12-23
--author:yanjun
--describe:Ö°ÄÜNPC½Å±¾
Include("\\script\\online\\Ôªµ©»î¶¯\\yuandan_head.lua")

function main()
	SetDeathPunish(0)	--È·±£ÎŞËÀÍö³Í·£
	if GetLevel() < 10 then	--Ğ¡ÓÚ£±£°¼¶²»ÄÜ²Î¼Ó
		Say("§¼ng cÊp cña ng­¬i thÊp h¬n <color=red>10<color> còng muèn tham gia ®o¹t kú µ? H·y rÌn luyÖn thªm vµi ba n¨m n÷a nhĞ!",0)
		return 0
	end
	if GetPlayerRoute() == 0 then	--Ã»¼ÓÈëÃÅÅÉÕß²»ÄÜ²Î¼Ó
		Say("Ng­êi ch¬i ph¶i gia nhËp m«n ph¸i míi cã thÓ tham gia Nguyªn §¸n ®o¹t kú.",0)
		return 0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= GetCurDate() then
		SetTask(TASK_FLAG_HANDUP,0)	--ĞÂµÄÒ»Ìì£¬ÒÑ¶áÆì±ê¼ÇÇå0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= 0 then
		Say("B¹n ®· ®o¹t kú thµnh c«ng, h«m nay kh«ng thÓ tham gia tiÕp, ngµy mai h·y quay l¹i nhĞ!",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("Mçi ng­êi chØ cã thÓ mang 1 tiªu kú.",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 0 then
		SetDeathScript("\\script\\online\\Ôªµ©»î¶¯\\playerdeath.lua")
		npcIndex = GetTriggeringUnit()
		SetNpcLifeTime(npcIndex,0)
		SummonNpc("Tiªu s­-chiÕn ®Êu","Tiªu kú")
		AddTitle(3,3)
		SetCurTitle(3,3)
		Msg2Player("B¹n ®· ®o¹t ®­îc tiªu kú, h·y mau giao cho ®o¹t tiªu gi¸o ®Çu.")
		mapID,mapX,mapY = GetWorldPos()
		SetTaskTemp(MAP_ID,mapID)	--¼ÇÂ¼µÃµ½Æì×ÓÊ±Íæ¼ÒµÄ×ù±ê
		SetTaskTemp(MAP_X,mapX)
		SetTaskTemp(MAP_Y,mapY)
		SetTaskTemp(TASK_FLAG_FOLLOW,1)
	end
end
