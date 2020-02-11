--½Å±¾Ãû£º2007ÇåÃ÷½Ú»î¶¯É±¹Öµ÷ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£º2007ÄêÇåÃ÷½Ú»î¶¯É±¹ÖÍê³ÉºóµÄÏà¹Ø²Ù×÷
--²ß»®ÈË£º°¢ËÉ
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-03-20
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
tomb_sweep_2008_task_reel_step = 1855				--µ±Ç°ÈÎÎñ²½Öè£¨É±¹Ö£©
function monster_killed()
	SetTask(tomb_sweep_2008_task_reel_step,1)
	TaskTip("Nh¾c nhë: B¹n ®· hoµn thµnh nhiÖm vô cã thÓ t×m thñ l¨ng nh©n nhËn th­ëng!")
	for i = 900,903 do
		local trigger_ID = GetTrigger(i)
		if trigger_ID ~= 0  then
			RemoveTrigger(trigger_ID)
		end
	end
end
