--½Å±¾Ãû³Æ£ºÌ«ĞéÊ×ÊÎÈÎÎñÁõÌú½³µÄËÀÍö½Å±¾
--½Å±¾¹¦ÄÜ£ºÁõÌú½³µÄËÀÍö½Å±¾£¬ËÀÍöºóÍù¿ÉÌí¼ÓÎïÆ·µÄÈËÎïÉíÉÏÌí¼ÓÆæ½ğ
--²ß»®ÈË£ºÌúÑò
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-03-02
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
--========================================¹«¹²±äÁ¿¶¨ÒåÇø==============================
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
taixu_jwl_taskID = 998
kill_liu_date_seq_glb = 508
--=========================================½Å±¾Ö÷Âß¼­Çø===============================
function OnDeath(index)
	--É¾³ıNPC
	SetNpcLifeTime(index,0)
	--±£´æµ±Ç°Ë÷Òı
	local PlayerIndex_save = PlayerIndex
	--Ñ°ÕÒÓĞÈÎÎñµÄÍæ¼Ò
	local team_number = GetTeamSize()
	local get_task_index_table = {}
	local j = 1
	get_task_index_table[1] = 0			--³õÊ¼»¯Îª0
	SetGlbValue(kill_liu_date_seq_glb,zgc_pub_day_turn(1))
	if team_number == 0 then
		liu_qijin_add()
		return
	else
		for i = 1,team_number do
			PlayerIndex = GetTeamMember(i)									--ĞŞ¸Äµ±Ç°Íæ¼ÒË÷Òı
			if BigGetItemCount(2,1,562) ~= 0 then
				if Zgc_pub_goods_add_chk(1,1) == 1 then
					get_task_index_table[j] = PlayerIndex
					j = j + 1
				end
			end
		end
	end
	--¶ÓÄÚÃ»ÓĞÈË·ûºÏÌõ¼ş
	local player_seq = 0
	if get_task_index_table[1] == 0 then
		player_seq = random(1,team_number)
		PlayerIndex = GetTeamMember(player_seq)
		liu_qijin_add()
	else	--ÓĞÈË·ûºÏËæ»úÈ¡Ò»¸ö
		player_seq = random(1,j)
		PlayerIndex = get_task_index_table[player_seq]
		liu_qijin_add()
	end
end
function liu_qijin_add()
	local add_flag = AddItem(2,1,563,1)
	if add_flag == 1 then
		Msg2Player("Chóc mõng b¹n nhËn ®­îc Kú Kim cña thî rÌn L­u!")
		Msg2SubWorld("Chóc mõng:"..GetName().."NhiÖm vô t¨ng cÊp trang søc Th¸i H­, nÕu giÕt ®­îc thî rÌn L­u sÏ nhËn ®­îc Kú Kim!")
		SetTask(taixu_jwl_taskID,4)
	else
		WriteLog("NhiÖm vô trang søc Th¸i H­_Ng­êi ch¬i:"..GetName().."T¨ng Kú Kim cña thî rÌn L­u thÊt b¹i, vŞ trİ thÊt b¹i:"..add_flag)
	end
end
