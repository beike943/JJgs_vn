--½Å±¾Ãû³Æ£º½á»é¾íÖáÊ¹ÓÃº¯Êı
--½Å±¾¹¦ÄÜ£º½á»é¾íÖáÊ¹ÓÃµ÷ÓÃº¯Êı
--²ß»®ÈË£ºÌúÑò
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä:2007-04-25
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
--¾ı×ÓºÃÉ«£¬È¢Ö®ÓĞµÀ
--================================¹«¹²±äÁ¿¶¨ÒåÇø================================
Frag_att_num_TaskID = 1220
Tb_ma_task_reel = {
	{565,"MËt ®å L­u tinh",14},
	{566,"MËt ®å Tö Khİ",21},
	{567,"MËt ®å T­êng Thôy",42},
}
--================================¾íÖáÊ¹ÓÃÖ÷º¯Êı================================
function OnUse(goods_index)
	--ÅĞ¶ÏÊÇ·ñ½á»é
	if GetMateName() == nil or GetMateName() == "" then
		Talk(1,"","<color=green>Chó ı<color>: Ch­a kÕt h«n ch­a thÓ sö dông vËt phÈm nµy!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	--È¡µÃ¾íÖáÖÖÀà
	local goods_diff = 0 				
	for i = 1,getn(Tb_ma_task_reel) do
		if goods_id == Tb_ma_task_reel[i][1] then
			goods_diff = i
		end
	end
	Say("<color=green>Gîi ı<color>: Sö dông"..Tb_ma_task_reel[goods_diff][2].." cã thÓ t¨ng täa ®é L­u tinh trong <color=yellow>Khiªn V©n Phi Tinh Phæ<color> <color=yellow>"..Tb_ma_task_reel[goods_diff][3].."<color>. Sao h¶?",
	2,
	"§æi/#use_dtm("..goods_diff..")",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--****************************¾íÖáÊ¹ÓÃ**********************
function use_dtm(goods_diff)
	--¾íÖáĞ¯´ø¼ì²â
	if GetItemCount(2,1,Tb_ma_task_reel[goods_diff][1]) == 0 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..Tb_ma_task_reel[goods_diff][2].."<color>!")
		return
	end
	--ÏËÔÆ·ÉĞÇÆ×Ğ¯´ø¼ì²â
	if GetItemCount(2,1,583) == 0 then
		Talk(1,"","<color=green>Gîi ı<color>: Xin x¸c nhËn b¹n cã mang<color=yellow>Khiªn V©n Phi Tinh Phæ<color>!")
		return
	end	
	--¾íÖáÉ¾³ı¼ì²â
	if DelItem(2,1,Tb_ma_task_reel[goods_diff][1],1) ~= 1 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..Tb_ma_task_reel[goods_diff][2].."<color>!")
		return
	end
	--Ôö¼ÓÈÎÎñ´ÎÊı
	SetTask(Frag_att_num_TaskID,(GetTask(Frag_att_num_TaskID)+Tb_ma_task_reel[goods_diff][3]))
	Talk(1,"","<color=green>Gîi ı<color>: Xin chóc mõng! Täa ®é L­u tinh ®· t¨ng<color=yellow>"..Tb_ma_task_reel[goods_diff][3].."<color>!")
end
