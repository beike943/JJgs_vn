--=============================================
--create by baiyun 2009.4.14
--describe:Ô½ÄÏ°æ4ÔÂ·ÝÎäÁÖÊ¹Õß»î¶¯ Á¬ÐÄµ¤
--=============================================
Include("\\script\\online\\viet_2009_4\\wulinshizhe\\wulinshizhe.lua");

function OnUse()
	local nDate = tonumber(date("%y%m%d%H"))
	if nDate > JXWEB_EXPIRED_DATE then
		Msg2Player("VËt phÈm nµy ®· qu¸ h¹n, kh«ng thÓ sö dông thªm n÷a.")
		return 0;
	end	
	
	-----ÅÐ¶ÏµÈ¼¶----------------------------------------------------
	if GetLevel() < WL_ROLE_LEVEL_LIMIT then
		Talk(1, "", "VÉn ch­a ®¹t ®Õn cÊp <color=yellow>" .. WL_ROLE_LEVEL_LIMIT .. "<color> cÊp, kh«ng thÓ sö dông Liªn T©m §¬n");
		return 0;
	end
	
	-----ÅÐ¶ÏÊ¹ÓÃÁ¬ÐÄµ¤»ñµÃµÄ¾­ÑéÊÇ·ñÒÑ¾­´ïµ½ÉÏÏÞ
	if GetTask(WL_TASK_ALREADY_GET_EXP) >= WL_GET_MAX_EXP then
		Talk(1, "", "Sö dông Liªn T©m §¬n ®· ®¹t ®Õn kinh nghiÖm giíi h¹n cao nhÊt");
		return 0;		
	end
	
	-----»ñµÃ¾­Ñé
	if DelItem(2, 1, 30085, 1) == 1 then
		SetTask(WL_TASK_ALREADY_GET_EXP, GetTask(WL_TASK_ALREADY_GET_EXP) + WL_GET_EACH_EXP);
		ModifyExp(WL_GET_EACH_EXP);
		Msg2Player("B¹n nhËn ®­îc " .. WL_GET_EACH_EXP .. "Kinh nghiÖm");
	end
	
end