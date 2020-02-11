--ÉñÃØµÄ»¨½Å±¾
--by vivi
--07/30/2007

Include("\\script\\online\\qixi07\\qixi07_head.lua")

function OnUse()
	local remain_time = 0;
	local nNowDay = floor((GetTime()+28800)/86400); 
	
	if GetTask(TASK_FLOWER_GROW) > 100 then
		SetTask(TASK_FLOWER_GROW,100);
	end	
	
	--µ±ÌìÊÇ·ñ³É³¤¹ı»òÕß³É³¤¶ÈÊÇ·ñÒÑ¾­µ½100
	if nNowDay == GetTask(TASK_IS_GROW) or GetTask(TASK_FLOWER_GROW) >= 100 then
		Talk(1,"","<color=green>Hoa thÇn bİ<color>: ®é tr­ëng thµnh ®ãa hoa nµy lµ <color=red>"..GetTask(TASK_FLOWER_GROW).."<color>. §é tr­ëng thµnh cña hoa h«m nay ®· t¨ng thªm <color=red>1<color>, phÇn th­ëng tr­ëng thµnh giê cã thÓ l·nh lµ <color=red>"..npc_grow_award().."<color>, <color=red>"..is_get_award().."<color> nhËn phÇn th­ëng tr­ëng thµnh lóc nµy. B©y giê nép ®ãa hoa nµy cho B¸ch Hoa sø gi¶ cã thÓ nhËn ®­îc phÇn th­ëng cuèi cïng lµ"..npc_final_award()..". Chó ı, chØ cÇn sö dông <color=red>Bång Lai Tiªn thñy<color> hoÆc <color=red>Bång Lai Tiªn lé<color> hoÆc <color=red>Bång Lai Tiªn ®¬n<color>, mçi ngµy lªn m¹ng 1 giê trë lªn míi cã thÓ t¨ng ®­îc 1 ®iÓm ®é tr­ëng thµnh trong ngµy h«m ®ã");
	else  				
		remain_time = NEED_TIME - GetTask(TASK_TOTAL_TIME);
		Talk(1,"","<color=green>Hoa thÇn bİ<color>: ®é tr­ëng thµnh ®ãa hoa nµy lµ <color=red>"..GetTask(TASK_FLOWER_GROW).."<color>. H«m nay b¹n vÉn ph¶i lªn m¹ng <color=red>"..remain_time.."<color> phót ®Ó t¨ng ®é tr­ëng thµnh lªn <color=red>1<color>, phÇn th­ëng tr­ëng thµnh cã thÓ nhËn b©y giê lµ <color=red>"..npc_grow_award().."<color>, <color=red>"..is_get_award().."<color> nhËn phÇn th­ëng tr­ëng thµnh lóc nµy. B©y giê nép ®ãa hoa nµy cho B¸ch Hoa sø gi¶ cã thÓ nhËn ®­îc phÇn th­ëng cuèi cïng lµ"..npc_final_award()..". Chó ı, chØ cÇn sö dông <color=red>Bång Lai Tiªn thñy<color> hoÆc <color=red>Bång Lai Tiªn lé<color> hoÆc <color=red>Bång Lai Tiªn ®¬n<color>, mçi ngµy lªn m¹ng 1 giê trë lªn míi cã thÓ t¨ng ®­îc 1 ®iÓm ®é tr­ëng thµnh trong ngµy h«m ®ã");
	end			
end

--¸øÓè×îÖÕ½±Àø£¬ÓÃÓÚÏÔÊ¾¸øÍæ¼Ò
function npc_final_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local j = 0;
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;
	local aStr = "";			
	if fl_grow == 0 then
		aStr = aStr.."<color=red>"..floor(tFinalAward[1][2]*exp_arg).."<color> kinh nghiÖm "
	else 
		for i = 2,getn(tFinalAward) do
			if fl_grow <= tFinalAward[i][1] and fl_grow <= 100 then
				j = i;
				break
			elseif fl_grow > 100 then
				WriteLog("Ho¹t ®éng ThÊt TŞch, hoa thËt ®Æc biÖt. TrŞ sè ®Æc biÖt lµ:"..fl_grow);
				return
			end
		end		
		if j == 2 then
			aStr = aStr.."<color=red>"..floor(tFinalAward[2][2]*exp_arg).."<color> kinh nghiÖm "
		elseif j > 2 then
			aStr = aStr.."<color=red>"..floor(tFinalAward[j][2]*exp_arg).." <color> kinh nghiÖm,"..tBoxAward[j-2]
		end			
	end
	return aStr
end

--ÊÇ·ñÒÑ¾­ÁìÈ¡¹ı½±Àø
function is_get_award()
	local str = "";
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	if fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),fl_grow) == 0 then
		str="ch­a";
	elseif fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),fl_grow) ~= 0 then
		str="®· ";
	elseif fl_grow > 30 then
		for i = 31,getn(tGrowAward) do
			if fl_grow <= tGrowAward[i][1] and GetBit(GetTask(TASK_AWARD_TWO),i-30) == 0 then
				str="ch­a";
				break
			elseif fl_grow <=tGrowAward[i][1] and GetBit(GetTask(TASK_AWARD_TWO),i-30) ~= 0 then 
				str="®· ";
				break
			end
		end
	end
	return str
end		

function npc_grow_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;  --¾­ÑéÏµÊı
	local gStr = "";
	if fl_grow == 0 then
		gStr = "0";
	elseif fl_grow > 0 and fl_grow <= 100 then
		for i=1,getn(tGrowAward) do
			if fl_grow <= tGrowAward[i][1] then
				gStr = "tÆng ngÉu nhiªn "..floor(tGrowAward[i][2]*10000*exp_arg).."-"..floor(tGrowAward[i][3]*10000*exp_arg).."Kinh nghiÖm";
				break
			end
		end
	else
		gStr = "§é tr­ëng thµnh kh¸c th­êng cña hoa. Xin liªn hÖ bé phËn phôc vô kh¸ch hµng, c¶m ¬n.";
	end
	return gStr;	
end