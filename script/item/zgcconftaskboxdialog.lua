--½Å±¾Ãû³Æ£º²½·ÇÑÌµÄ±¦ÏäÊ°È¡½Å±¾
--½Å±¾¹¦ÄÜ£º¸ú²½·ÇÑÌµÄ±¦ÏäNpc¶Ô»°£¬È»ºó½øÐÐÊ°È¡Ìõ¼þÅÐ¶Ï£¬¸øÓÚ±¦Ïä
--²ß»®ÈË£ººî¶Ü
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£ºµ½½ðÉ½µÄµÚ¶þ¸öDD
--´úÂëÐÞ¸Ä¼ÇÂ¼£º2007-08-13¸ù¾Ýºî¶ÜµÄÒªÇóÐÞ¸ÄÁË±¦ÏäµÄÊ°È¡»úÖÆ
Include("\\script\\online\\zgc_public_fun.lua")
Box_belong_ID = 0
Box_get_time = 1
Box_index_save_ID = 166
function main()
	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	if GetPlayerRoute() == 0 then
		Msg2Player("ChØ bang chñ, phã bang chñ, tr­ëng l·o, ®­êng chñ, h­¬ng chñ gia nhËp l­u ph¸i míi cã thÓ nhÆt b¶o vËt nµy!")
		return
	end
	if IsTongMember() > 5 or IsTongMember() == 0 then 															--ÅÐ¶ÏÊÇ·ñÈë°ï
		Msg2Player("ChØ bang chñ, phã bang chñ, tr­ëng l·o, ®­êng chñ, h­¬ng chñ gia nhËp l­u ph¸i míi cã thÓ nhÆt b¶o vËt nµy!")
	else
		if GetFightState() == 0 then --·ÇÕ½¶·×´Ì¬²»ÄÜ¼ñ
			Msg2Player("ChØ ë tr¹ng th¸i chiÕn ®Êu míi cã thÓ nhÆt ®­îc b¶o vËt nµy!")
			return
		end
		if GetUnitCurStates(npc_index,Box_belong_ID) == 0 or (GetTime() - GetUnitCurStates(npc_index,Box_get_time)) > 10 then
			SetTaskTemp(Box_index_save_ID,npc_index)
			SetUnitCurStates(npc_index,Box_belong_ID,1)
			SetUnitCurStates(npc_index,Box_get_time,GetTime())
			DoWait(9,10,10)
		else
			Talk(1,"","<color=green>®­a ra <color>: r­¬ng kho b¸u cÇn ®ang bÞ ng­êi kh¸c sö dông, vui lßng quay l¹i trong chèc l¸t.")
			return
		end
	end	
end
