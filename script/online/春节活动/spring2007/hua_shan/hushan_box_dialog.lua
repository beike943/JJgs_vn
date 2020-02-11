--»î¶¯£ºĞÂÄê»î¶¯-»ªÉ½¾º¼¼-»ªÉ½±¦Ïä¶Ô»°½Å±¾
--»î¶¯²ß»®ÈË£º°¢ËÉ
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-01-23
--ĞŞ¸Ä¼ÇÂ¼£º
--============================¹«¹²±äÁ¿¶¨ÒåÇø===============================
--ÕÔ¹ó´º¹«¹²ÎÄ¼ş
Include("\\script\\online\\zgc_public_fun.lua")
--================================Ö÷Âß¼­===================================
function main()
	local box_index = GetTargetNpc()
	SetGlbValue(501,box_index)
	local task_start_time =	66600
	local time_diff = task_start_time - Zgc_pub_today_sec_num_rtn()
	if GetPlayerRoute() == 0 then
		Msg2Player("Ng­êi ch­a gia nhËp m«n ph¸i kh«ng thÓ më b¶o r­¬ng!")
		return
	end
	if spring_2007_date_chk() == 0 then
		return
	end
	if time_diff > 0 then
		Talk(1,"","Héi Hoa S¬n vÉn ch­a b¾t ®Çu, cßn "..Zgc_pub_time_sec_change(time_diff,0).." míi cã thÓ më b¶o r­¬ng!")
		return
	end
	if GetUnitCurStates(box_index,4) >= zgc_pub_day_turn(1) then
		Talk(1,"","Ho¹t ®éng Hoa S¬n h«m nay ®· kÕt thóc, ngµy mai l¹i ®Õn nhĞ!")
		return
	end
	if Zgc_pub_goods_add_chk(3,50) == 0 then
		return
	end
	if GetUnitCurStates(box_index,2) ~= 1 or (GetTime() - GetUnitCurStates(box_index,1)) > 30 then
		SetUnitCurStates(box_index,1,GetTime())
		SetUnitCurStates(box_index,2,1)
		DoWait(1,2,30)				--½øÈëµ÷ÓÃ
	else
		Talk(1,"","HiÖn ®· cã ng­êi sö dông <color=red>Hoa S¬n b¶o r­¬ng<color>.")
		return
	end
end
