--½Å±¾Ãû³Æ£º³ş¹úÃÜÁîÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÊ¹ÓÃ´ËÎïÆ·£¬¸øÍæ¼ÒÔö¼õ1000¸öĞÅÎï
--½Å±¾²ß»®ÈË£ºĞ¡ÌìÌì
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007Äê6ÔÂ11ÈÕ
--´úÂëĞŞ¸Ä¼ÇÂ¼£º

	keepsake_num_TaskID = 1227

function OnUse()
	Say("<color=green>Chó ı<color>: sö dông vËt phÈm nµy cã thÓ t¨ng <color=yellow>1000<color> <color=yellow>tİn vËt<color>, b¹n cã thÓ <color=yellow>Tİn vËt<color> ë <color=green>Di téc Së quèc<color> bªn c¹nh <color=green>D· TÈu<color> ®Ó ®æi lÊy <color=yellow>nguyªn liÖu b¸nh İt<color>. Sö dông chø?",
	2,
	"§ång ı dïng/use_dtm",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
function use_dtm()
	--Ğ¯´ø¼ì²â
	if GetItemCount(2,1,1142) == 0 then
		Talk(1,"","<color=green>Chó ı<color>: Xin x¸c nhËn cã mang theo <color=yellow>Së quèc MËt lÖnh<color>!")
		return
	end
	--É¾³ı¼ì²â
	if DelItem(2,1,1142,1) ~= 1 then
		Talk(1,"","<color=green>Chó ı<color>: Xin x¸c nhËn cã mang theo <color=yellow>Së quèc MËt lÖnh<color>!")
		return
	end
	--ĞÅÎïÔö¼Ó
	SetTask(keepsake_num_TaskID,(GetTask(keepsake_num_TaskID)+1000))
	Msg2Player("Chóc mõng b¹n ®· ®æi thµnh c«ng 1000 tİn vËt n­íc Së, b¹n cã thÓ ®Õn 'Di Téc Së Quèc' xem vµ sö dông!")
end
