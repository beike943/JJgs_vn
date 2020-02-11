--½Å±¾Ãû£ºÄªÈıÌú´¸µÄÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÊ¹ÓÃÄªÈıµÄÌú´¸ÔÚGLB±äÁ¿ÄÚ¼ÇÂ¼ÏÂÊ¹ÓÃµÄ×ø±ê£¬È»ºóÏµÍ³°´Ê¹ÓÃµÄ×ø±ê´´½¨ÁõÌú½³
--²ß»®ÈË£ºÌúÑò
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-03-02
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
--========================================¹«¹²±äÁ¿¶¨ÒåÇø==============================
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
taixu_jwl_hammer_date = 997				--Íæ¼ÒÊ¹ÓÃÎïÆ·ÈÕÆÚĞòºÅ
taixu_jwl_task_step_taskID = 998		--Íæ¼ÒÈÎÎñ²½Öè
taixu_jwl_hammer_date_glbID = 507		--·şÎñÆ÷ÎïÆ·Ê¹ÓÃĞòºÅ
taixu_liu_killed_date_glbID = 508		--ÁõÌú½³±»É±ÈÕÆÚĞòºÅ
taixu_jwl_liu_crt_att_glbID_srt = 511	--¼ÇÂ¼×ø±êµÄÊÀ½ç±äÁ¿¿ªÊ¼Î»ÖÃ
taixu_jwl_liu_crt_att_glbID_end = 550	--¼ÇÂ¼×ø±êµÄÊ±¼ä±äÁ¿½áÊøÎ»ÖÃ
--=========================================½Å±¾Ö÷Âß¼­Çø===============================
function OnUse()
	local date_seq_now = zgc_pub_day_turn(1)
	--ÈÎÎñ²½ÖèÅĞ¶Ï
	if GetTask(taixu_jwl_task_step_taskID) == nil or GetTask(taixu_jwl_task_step_taskID) == 0 then
		Talk(1,"","Chïy nµy ta ®· nh×n thÊy ë ®©u råi, cã t¸c dông g× chø?")
		return
	end
	--Ê¹ÓÃµØÍ¼ÅĞ¶Ï
	local mapID = GetWorldPos()
	if mapID ~= 218 then
		Talk(1,"","VËt phÈm nµy chØ sö dông ë <color=red>Linh B¶o s¬n<color>!")
		return
	end
	--Ò»ÌìÖ»ÄÜÊ¹ÓÃÒ»´Î¼ì²â
	local use_date_seq = GetTask(taixu_jwl_hammer_date)
	if use_date_seq == nil then
		SetTask(taixu_jwl_hammer_date,0)
	end
	if use_date_seq >= date_seq_now then
		Talk(1,"","VËt phÈm nµy mçi ngµy chØ sö dông <color=red>1<color> lÇn!")
		return		
	end
	--Ê¹ÓÃÊ±¼äÏŞÖÆ
	if Zgc_pub_today_sec_num_rtn() > 75600 then
		Talk(1,"","Muén råi, tiÖm <color=yellow>thî rÌn L­u<color> ®· ®ãng cöa"..Zgc_pub_sex_name().."hay lµ ngµy mai quay l¹i!")
		return
	end
	--ÁõÌú½³×òÌì±»É±ÌáÊ¾
	if GetGlbValue(taixu_liu_killed_date_glbID) == (zgc_pub_day_turn(1) - 1) then
		Talk(1,"","<color=yellow>Thî rÌn L­u<color> h«m qua gÆp cõu nh©n bŞ ®¸nh mét trËn, e r»ng h«m nay kh«ng ®Õn."..Zgc_pub_sex_name().."hay lµ ngµy mai quay l¹i!")
		return
	end
	--Ìú´¸´æÔÚÅĞ¶Ï
	if GetItemCount(2,1,564) == 0 then
		Talk(1,"","X¸c nhËn b¹n cã mang theo <color=yellow>M¹c Tam ThiÕt Chïy<color>.")
		return
	end
	--¿ÉÒÔÊ¹ÓÃ´¦Àí
	--Ìú´¸É¾³ıÅĞ¶Ï
	if DelItem(2,1,564,1) ~= 1 then
		Talk(1,"","X¸c nhËn b¹n cã mang theo <color=yellow>M¹c Tam ThiÕt Chïy<color>.")
		return
	end
	local glb_use_date_seq = GetGlbValue(taixu_jwl_hammer_date_glbID)
	--¼ÆËã³ö×ø±êÖµ£¨Ò»¸ö¿Õ¼äÍ¬Ê±·ÅÖÃX×ø±êºÍY×ø±ê£©
	local map_ID,att_X,att_Y = GetWorldPos()		
	local att_save = (att_X * 10000) + att_Y
	--Èç¹û±¾´ÎÊ¹ÓÃÎª·şÎñÆ÷±¾ÂÖµÚÒ»´ÎÊ¹ÓÃ
	if glb_use_date_seq == nil or glb_use_date_seq < date_seq_now then
		--ÔÚ·şÎñÆ÷Ğ´Èëµ±Ç°ÈÕÆÚĞòºÅ
		SetGlbValue(taixu_jwl_hammer_date_glbID,date_seq_now)			
		--ÔÚµÚÒ»¸öÎ»ÖÃĞ´ÈëµÚÒ»×ø±ê
		SetGlbValue(taixu_jwl_liu_crt_att_glbID_srt,att_save)			
		--ÆäËûÎ»ÖÃ³õÊ¼»¯
		for i = (taixu_jwl_liu_crt_att_glbID_srt+1),taixu_jwl_liu_crt_att_glbID_end do	
			SetGlbValue(i,0)
		end
	else		--ÔÚºóÃæµÄµÄ¿ÕÎ»ÖÃÖĞ²¹ÉÏµ±Ç°µÄ×ø±ê
		for i = taixu_jwl_liu_crt_att_glbID_srt,taixu_jwl_liu_crt_att_glbID_end do
			--ÕÒ¿ÕÎ»ÖÃĞ´Èë×ø±ê
			if GetGlbValue(i) == 0 then
				SetGlbValue(i,att_save)
				break
			end
			--Èç¹ûÃ»ÓĞ¿ÕÎ»ÖÃ¾ÍËæ»úÕÒ¸öÎ»ÖÃ¸²¸Ç
			if i == taixu_jwl_liu_crt_att_glbID_end then
				i = random(taixu_jwl_liu_crt_att_glbID_srt,taixu_jwl_liu_crt_att_glbID_end)
				SetGlbValue(i,att_save)
				break
			end
		end
	end
	SetTask(taixu_jwl_hammer_date,date_seq_now)
	Talk(1,"","ThiÕt Chïy lµm xong råi, ®îi ®Õn (<color=yellow>21:00-21:30) <color> <color=yellow>thî rÌn L­u<color> sÏ ®Õn!")	
end
