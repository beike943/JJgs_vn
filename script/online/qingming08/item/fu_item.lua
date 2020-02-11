--½Å±¾Ãû³Æ£º¼ÀÆ··ûÖ½Ê¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£º¼ÀÆ··ûÖ½Ê¹ÓÃ½Å±¾£¬¿ÉÒÔÈÃÍæ¼ÒÔÚÒ»ÌìÄÚ¶à½Ó9´ÎÇåÃ÷ÈÎÎñ¾íÖáÈÎÎñ
--²ß»®ÈË£º°¢ËÉ
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-03-13
--´úÂëĞŞ¸Ä¼ÇÂ¼£º2008-3-20byMoxian
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\online\\qingming08\\head_qingming.lua")
--=================================Glb±äÁ¿¶¨ÒåÇø===========================
tomb_sweep_2008_task_reel_date_seq = 1852			--ÈÎÎñµÄÈÕÆÚĞòÊı
tomb_sweep_2008_task_reel_num = 1853					--¿ÉÍê³ÉµÄÈÎÎñÊıÁ¿
tomb_sweep_2008_fu_use_date_seq	= 1856			--¼ÀÆ··ûÖ½µÄÊ¹ÓÃÈÕÆÚĞòÊı
tomb_sweep_2008_fu_use_num = 1857					--¼ÀÆ··ûÖ½½ñÌìµÄÊ¹ÓÃÊıÁ¿
if IS_SHOUFEI == TRUE then
	tomb_sweep_2008_fu_use_max_num = 8					--·ûÖ½Ã¿ÌìÏŞÖÆÊ¹ÓÃÊıÁ¿£¬·ÇÈÎÎñ±äÁ¿£¬Ãâ·ÑÇø9´Î·ûÖ½
else
	tomb_sweep_2008_fu_use_max_num = 9	
end

--=================================º¯ÊıÖ÷Âß¼­Çø============================
function OnUse(goods_index)
	--Ê±¼äÅĞ¶Ï
	local date_chk = is_qingming_opened()
	if date_chk == 1 then
		--DelItemByIndex(goods_index,1)--ÕâÀï²»ÄÜÉ¾³ı
	else
		Talk(1,"","<color=green>Nh¾c nhë<color>: VËt phÈm nµy chØ sö dông trong ho¹t ®éng Thanh Minh <color=yellow>3-4-2008 ®Õn 12-4<color>.")
		return
	end
	--Ê¹ÓÃÊıÁ¿ÅĞ¶Ï
	local use_date_seq = GetTask(tomb_sweep_2008_fu_use_date_seq)
	local use_num = GetTask(tomb_sweep_2008_fu_use_num)
	local date_seq_now = zgc_pub_day_turn(1)
	local task_deal_seq = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local task_deal_num = GetTask(tomb_sweep_2008_task_reel_num)
	--Ê¹ÓÃ´ÎÊıÏŞÖÆ¡¢·şÎñÆ÷Ê±¼ä²îÒìµ¼ÖÂµÄÌØÊâÇé¿ö
	if (use_date_seq >= date_seq_now and use_num >= tomb_sweep_2008_fu_use_max_num) or date_seq_now < ((use_date_seq + task_deal_seq)/2) then
		Talk(1,"","<color=green>Nh¾c nhë<color>: VËt phÈm nµy mçi ngµy chØ cã thÓ sö dông <color=yellow>"..tomb_sweep_2008_fu_use_max_num.."<color> lÇn!")
		return
	end
	--ÎïÆ·É¾³ı¼ì²â
	if DelItemByIndex(goods_index,1) ~= 1 then
		Talk(1,"","<color=green>Nh¾c nhë<color>: Xin kiÓm tra trªn ng­êi cã mang theo <color=yellow>giÊy cóng tÕ<color>!")
		return
	end
	--Êı¾İ²Ù×÷
		--·ûÖ½Ê¹ÓÃÏŞÖÆÊı¾İĞ´ÈË
	if use_date_seq == nil or date_seq_now > use_date_seq then
		SetTask(tomb_sweep_2008_fu_use_date_seq,date_seq_now)
		SetTask(tomb_sweep_2008_fu_use_num,1)
	elseif date_seq_now == use_date_seq then
		SetTask(tomb_sweep_2008_fu_use_num,(use_num+1))
	end
		--ÈÎÎñ´ÎÊı´¦Àí
	if task_deal_seq == date_seq_now then
		if task_deal_num == nil then
			SetTask(tomb_sweep_2008_task_reel_num,3)--ÊÕ·ÑÇøÔ­ÓĞµÄÁ½´Î+·ûÖ½1´Î
		else
			SetTask(tomb_sweep_2008_task_reel_num,(task_deal_num+1))
		end
	elseif task_deal_seq < date_seq_now then
		SetTask(tomb_sweep_2008_task_reel_date_seq,date_seq_now)
		SetTask(tomb_sweep_2008_task_reel_num,3)--ÊÕ·ÑÇøÔ­ÓĞµÄÁ½´Î+·ûÖ½1´Î
	end
	local use_num_dealed = GetTask(tomb_sweep_2008_fu_use_num)
	local dia_use_num_remain = ""
	if use_num_dealed == tomb_sweep_2008_fu_use_max_num then
		dia_use_num_remain = "®· kh«ng thÓ sö dông"
	else
		dia_use_num_remain = "Cßn sö dông ®­îc <color=yellow>"..(tomb_sweep_2008_fu_use_max_num-use_num_dealed).."<color> lÇn"
	end
	Talk(1,"","<color=green>Nh¾c nhë<color>: B¹n sö dông giÊy cóng tÕ thµnh c«ng, nhiÖm vô <color=yellow>h«m nay<color> ®­îc t¨ng thªm <color=yellow>1<color> lÇn, h«m nay b¹n"..dia_use_num_remain.." giÊy cóng tÕ!")
end

