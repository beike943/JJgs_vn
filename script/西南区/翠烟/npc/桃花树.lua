--½Å±¾¹¦ÄÜ£º´äÑÌÌÒ»¨Ê÷¶Ô»°½Å±¾
--¹¦ÄÜÉè¼Æ£ºÔøÇìÏé
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2009-3-16

Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	--2011ĞÂÊÖ¸Ä½ø:ÈëÃÅÈÎÎñ
	local nGet = tGtCondition:check_taskid(369, 2);
	if nGet ~= nil and gf_GetTaskBit(3378, 1) ~= 1 then
		Talk(1, "", "T×m ®­îc mét bµi th¬ Èn trªn vá §µo Hoa Thô\n<color=yellow>    §µo hoa tïng trung ®µo hoa am,\n    §µo hoa am hËu ®µo hoa s¬n.\n    ThÕ nh©n giai th¸n ®µo hoa diÔm,\n    BÊt kiÕn thô h¹ ®µo hoa tµn.<color>\n         --<color=green>Th«n tr­ëng<color>");
		AddItem(2,0,778,1);
		gf_SetTaskBit(3378, 1, 1);
		return
	end

	--2011ĞÂÊÖ¸Ä½øÖ®Ç°

	if GetTask(1019) == 2 and BigGetItemCount(2,0,778) == 0 then
		AddItem(2,0,778,1)
	else
		if random(1000) == 137 then
			Talk(1,"","T×m ®­îc mét bµi th¬ Èn trªn vá §µo Hoa Thô\n<color=yellow>    §µo hoa tïng trung ®µo hoa am,\n    §µo hoa am hËu ®µo hoa s¬n.\n    ThÕ nh©n giai th¸n ®µo hoa diÔm,\n    BÊt kiÕn thô h¹ ®µo hoa tµn.<color>\n         --<color=green>Th«n tr­ëng<color>")
		end
	end
end
