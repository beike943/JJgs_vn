Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\task\\global_task\\task_id.lua")
function OnUse(nItemIndex)
	SendScript2Client("Open([[LargeMsg]], 2, [[hép th­ thÇn bİ ]]);");
	--Talk(1,"get_new_task","<color=green>¸÷Î»½­ºşÏÀ¿Í£º<color>\n\n   ÄãÃÇºÃ£¡ÔÚÏÂÃû½Ğ½­±ğº×£¬×î½üÓöµ½Ò»¼ş¼¬ÊÖÊÂÇé£¬µ¥Æ¾ÎÒ¸öÈËÁ¦Á¿ºÜÄÑÍê³É´ËÊÂ£¬Òò´Ë¿ÏÇë¸÷Î»ÎäÁÖ¸ßÊÖ°ïÃ¦£¬Èô¸÷Î»ÏÀ¿ÍÔ¸ÒâÓëÔÚÏÂÒ»Í¬Íê³É´ËÊÂ£¬ÔÚÏÂ¶¨µ±²»»á¿÷´ıÄãÃÇ¡£ÄãÃÇ¿ÉÀ´·ïÏè¸®ÕÒÎÒ£¬ÎÒ»áÏêÏ¸ËµÃ÷´ËÊÂ¡£¸ĞĞ»¸÷Î»ÏÀ¿Í£¡\n\n                                                                    <color=green> ½­±ğº×<color>")
	--SetItemUseLapse(nItemIndex,18*60*3);
	get_new_task();
end

function get_new_task()
	local nLevel = GetLevel();
	if nLevel < 80 or GetPlayerFaction() == 0 then
		Talk(1,"","Ng­êi ch¬i <color=green>cÊp 80<color>trë lªn, cã hÖ ph¸i míi cã thÓ tiÕp nhËn chuçi nhiÖm vô h­íng dÉn vµo ¶i");
		return 0;
	end
	DirectGetGTask(74,1);
end