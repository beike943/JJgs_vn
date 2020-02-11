--===================================================
--Ê¹ÓÃÕâ¸öÎïÆ·£¬Íæ¼Ò¾ÍÀëÏßÁË
--ÀëÏßÖ®Ç°ÔÚ¸ÉÊ²Ã´£¬ÀëÏßÒÔºó¶¼»¹ÔÚ¸ÉÊ²Ã´
--Ò»´ÎÊ¹ÓÃ£¬8Ð¡Ê±ÓÐÐ§
--¿ÆÑ§
--===================================================

function OnUse()
	if GetOfflineLiveTime() > 1728000 then
		Talk(1,"","Th¸i B¹ch Kim ®¬n trªn ng­êi b¹n ®· v­ît qu¸ 60 viªn, kh«ng thÓ tiÕp tôc sö dông!");
	elseif DelItem(2,1,202,1) == 1 then
		AddOfflineLiveTime(8 * 3600)
		Msg2Player("B¹n ®· sö dông 1 viªn Th¸i B¹ch Kim ®¬n, cã thÓ phiªu du vµo câi thÇn tiªn trong 4 giê!")
	end
end
