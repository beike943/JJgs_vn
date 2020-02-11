--½Å±¾Ãû³Æ£º°×Ã×ôÕ×ÓÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£º½«°×Ã×ôÕ×Ó¶Ò»»ÎªÏãÃ×ôÕ×Ó
--¹¦ÄÜ²ß»®£ºoo
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2008-06-05
--´úÂëĞŞ¸Ä¼ÇÂ¼
function OnUse()
	local baimi_zongzi_num = GetItemCount(2,1,1122)
	local del_flag = DelItem(2,1,1122,baimi_zongzi_num)
	if del_flag == 1 then
		local add_flag = AddItem(2,1,3359,baimi_zongzi_num)
		if add_flag == 1 then
			Msg2Player("B¹n ®æi "..baimi_zongzi_num.." 'B¸nh İt g¹o tr¾ng' lÊy 'B¸nh İt g¹o th¬m'!")
		else
			WriteLog("[§oan Ngä 08] ng­êi ch¬i:  "..GetName().."T¨ng"..baimi_zongzi_num.." B¸nh İt g¹o th¬m thÊt b¹i, kı hiÖu thÊt b¹i:  "..add_flag)
		end
	else
		WriteLog("[§oan Ngä 08] ng­êi ch¬i:  "..GetName().."Hñy bá"..baimi_zongzi_num.." B¸nh İt g¹o tr¾ng thÊt b¹i, kı hiÖu thÊt b¹i:  "..del_flag)
	end
end
