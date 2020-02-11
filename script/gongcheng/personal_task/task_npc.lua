-- ÈÎÎñµØÍ¼ÀïµÄNPC

Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\gongcheng\\personal_task\\task_head.lua")


tMap2CityMap =
{
	[889] = 300,
}

function main()
	Say("Th©n lµ vâ l©m nh©n sÜ kh«ng thÓ chèi bá tr¸ch nhiÖm chèng giÆc ngo¹i x©m, gióp b¸ch tİnh sinh sèng yªn b×nh!",
		5,
		"Giíi thiÖu Håi Phong tr¹i/hui_jieshao",
		"Ng¨n c¶n tiÕp viÖn/start_task",
		"Hoµn thµnh nhiÖm vô/complete_task",
		"Rêi khái Håi Phong tr¹i/leave_task",
		"KÕt thóc ®èi tho¹i/no_say")
	init_fight()
end

function hui_jieshao()
	Say("Håi Phong tr¹i lµ n¬i ®Şa thÕ hiÓm trë, s«ng ngßi ch»ng chŞt, chØ cã 3 c©y cÇu ®Ó qua, n¬i nµy lµ phßng tuyÕn chiÕn ®Êu cuèi cïng cña ®Şch, x©y dùng mét hÖ thèng liªn hoµn c¸c c«ng tr×nh tiÕp viÖn, Kho¸ng tr­êng, tr¹i ngùa, kho l­¬ng, lÊy gç\nHåi Phong tr¹i cao thñ v« sè, toµn lµm chuyÖn xÊu xa. H·y tiªu diÖt chóng ®o¹t c¸c bé hé gi¸p ®Ó chøng minh n¨ng lùc cña ng­¬i. (Tæ ®éi tiªu diÖt ®Çu môc ®èi ph­¬ng, mçi thµnh viªn®Òu nhËn ®­îc hé gi¸p)",0)
end

function complete_task()
	Say("Th©n lµ vâ l©m nh©n sÜ kh«ng thÓ chèi bá tr¸ch nhiÖm chèng giÆc ngo¹i x©m, gióp b¸ch tİnh sinh sèng yªn b×nh!",
		3,
		"Ng¨n c¶n tiÕp viÖn-tr¹i ngùa vµ kho l­¬ng/complete_task_1",
		"Ng¨n c¶n tiÕp viÖn-Kho¸ng tr­êng vµ khi ®èn gç/complete_task_2",
		"Cø hái/no_say")
end

function complete_task_1()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nTask1 < 1 or nNow > nDate then
		Say("H«m nay ng­¬i ch­a nhËn nhiÖm vô nµy.", 0)
		return
	end
	
	if nTask1 > 1 then
		Say("Ng­¬i ®· hoµn thµnh nhiÖm vô nµy.", 0)
		return
	end
	
	if _11 == 1 and _12 == 1 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			AddItem(2,0,765,1)
			CustomDataSave("tongcitywar_person_map_task", "ddddddd", 2, _11, _12, nTask2, _21, _22, nDate)
			Say("Ng­¬i ®· hoµn thµnh nhiÖm vô, nhËn ®­îc mét huy ch­¬ng.", 0)
			Msg2Player("Hoµn thµnh nhiÖm vô: ng¨n c¶n tiÕp viÖn-tr¹i ngùa vµ kho l­¬ng")
		end
	elseif _11 == 1 then
		Say("B¹n ®· tiªu diÖt Thñ vÖ tr¹i ngùa, ph¶i tiªu diÖt lu«n <color=yellow>Thñ vÖ kho l­¬ng<color> míi cã thÓ hoµn thµnh nhiÖm vô nµy",0)
	elseif _12 == 1 then
		Say("B¹n ®· tiªu diÖt Thñ vÖ kho l­¬ng, cßn ph¶i tiªu diÖt<color=yellow>Thñ vÖ tr¹i ngùa<color> míi cã thÓ hoµn thµnh nhiÖm vô nµy",0)
	else
		Say("B¹n cÇn tiªu diÖt <color=yellow>Thñ vÖ kho l­¬ng<color>vµ<color=yellow>Thñ vÖ tr¹i ngùa<color> míi cã thÓ hoµn thµnh nhiÖm vô nµy.",0)
	end
end

function complete_task_2()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nTask2 < 1 or nNow > nDate then
		Say("H«m nay ng­¬i ch­a nhËn nhiÖm vô nµy.", 0)
		return
	end
	
	if nTask2 > 1 then
		Say("Ng­¬i ®· hoµn thµnh nhiÖm vô nµy.", 0)
		return
	end
	
	if _21 == 1 and _22 == 1 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			AddItem(2,0,765,1)
			CustomDataSave("tongcitywar_person_map_task", "ddddddd", nTask1, _11, _12, 2, _21, _22, nDate)
			Say("Ng­¬i ®· hoµn thµnh nhiÖm vô, nhËn ®­îc mét huy ch­¬ng.", 0)
			Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô: ng¨n c¶n tiÕp viÖn-Kho¸ng tr­êng vµ Méc tr­êng")
		end
	elseif _21 == 1 then
		Say("B¹n ®· tiªu diÖt Thñ vÖ Kho¸ng tr­êng, cÇn ph¶i tiªu diÖt <color=yellow>Thñ vÖ Méc tr­êng<color> míi cã thÓ hoµn thµnh nhiÖm vô nµy.",0)
	elseif _22 == 1 then
		Say("B¹n ®· tiªu diÖt Thñ vÖ Méc tr­êng, cÇn ph¶i tiªu diÖt <color=yellow>Thñ vÖ Kho¸ng tr­êng<color> míi cã thÓ hoµn thµnh nhiÖm vô nµy.",0)
	else
		Say("B¹n cÇn tiªu diÖt <color=yellow>Thñ vÖ Kho¸ng tr­êng<color>vµ<color=yellow>Thñ vÖ Méc tr­êng<color> míi cã thÓ hoµn thµnh nhiÖm vô nµy.",0)
	end
end

function start_task()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow > nDate then		-- ÇåÀíµô×òÌìµÄÈÎÎñ
		CustomDataSave("tongcitywar_person_map_task", "ddddddd", 0, 0, 0, 0, 0, 0, nNow)
	end

	Say("Th©n lµ vâ l©m nh©n sÜ kh«ng thÓ chèi bá tr¸ch nhiÖm chèng giÆc ngo¹i x©m, gióp b¸ch tİnh sinh sèng yªn b×nh!",
		3,
		"Ng¨n c¶n tiÕp viÖn-tr¹i ngùa vµ kho l­¬ng/get_task_1",
		"Ng¨n c¶n tiÕp viÖn-Kho¸ng tr­êng vµ khi ®èn gç/get_task_2",
		"Cø hái/no_say")
end

function get_task_1()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask1 >= 1 then
		Say("H«m nay ng­¬i ®· nhËn nhiÖm vô nµy.",0)
		return
	end
	Say("Ngùa vµ l­¬ng th¶o chİnh lµ nÒn t¶ng c¬ b¶n ®Ó chiÕn ®Êu, h·y ®i ®èt s¹ch kho l­¬ng vµ tr¹i ngùa cña ®Şch!",
		2,
		"TiÕp nhËn nhiÖm vô/get_task_1_yes",
		"Cø hái/no_say")
end

function get_task_2()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask2 >= 1 then
		Say("H«m nay ng­¬i ®· nhËn nhiÖm vô nµy.",0)
		return
	end
	Say("Giê h·y ®i tiªu diÖt bän lİnh canh g¸c Kho¸ng tr­êng vµ Méc tr­êng.",
		2,
		"TiÕp nhËn nhiÖm vô/get_task_2_yes",
		"Cø hái/no_say")
end

function get_task_1_yes()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask1 >= 1 then
		Say("H«m nay ng­¬i ®· nhËn nhiÖm vô nµy.",0)
		return
	end
	CustomDataSave("tongcitywar_person_map_task", "ddddddd", 1,0,0,nTask2,_21,_22,nNow)
	Msg2Player("TiÕp nhËn nhiÖm vô: ng¨n c¶n tiÕp viÖn-tr¹i ngùa vµ kho l­¬ng")
end

function get_task_2_yes()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask2 >= 1 then
		Say("H«m nay ng­¬i ®· nhËn nhiÖm vô nµy.",0)
		return
	end
	CustomDataSave("tongcitywar_person_map_task", "ddddddd", nTask1,_11,_12,1,0,0,nNow)
	Msg2Player("TiÕp nhËn nhiÖm vô: ng¨n c¶n tiÕp viÖn-Kho¸ng tr­êng vµ Méc tr­êng")
end

function leave_task()
	uninit_fight()
	LeaveTeam()
	SetLogoutRV(0)
	NewWorld(300, 1732, 3540)
end

function no_say()
end