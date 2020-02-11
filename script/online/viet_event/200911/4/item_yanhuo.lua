--=============================================
--create by baiyun 2009.10.15
--describe:Ô½ÄÏ°æ11ÔÂ·İ»î¶¯ ÑÌ»ğ½Å±¾ÎÄ¼ş
--=============================================
Include("\\script\\online\\viet_event\\200911\\event_head.lua");
Include("\\script\\item\\yanhuo.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"));
	if nDate < 091106 or nDate > 091206 then
		Talk(1, "", "Ho¹t ®éng lÇn nµy ®· kÕt thóc");
		return
	end
	if GetLevel() < 10 then
		Talk(1, "", "CÊp bËc ®¹i hiÖp kh«ng ®ñ 10, kh«ng thÓ sö dông ph¸o hoa");
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1, "", "§¹i hiÖp ch­a gia nhËp m«n ph¸i, kh«ng thÓ sö dông ph¸o hoa");
		return
	end
	if GetTask(VIET_0911_TASK_YANHUO_DATE) < nDate then
		SetTask(VIET_0911_TASK_YANHUO_NUM, 0);
		SetTask(VIET_0911_TASK_LAST_USE_TIME, 0);
	end
	if GetTask(VIET_0911_TASK_YANHUO_NUM) >= 16 then
		Talk(1, "", "Mçi ngµy mçi nh©n vËt chØ cã thÓ sö dông 16 ph¸o hãa");
		return
	end
	if GetTime() - GetTask(VIET_0911_TASK_LAST_USE_TIME) < 120 then
		Talk(1, "", "Thêi gian sö dông liªn tiÕp ph¸o hoa lµ 2 phót, cÇn ph¶i ®îi "..(120 - GetTime() + GetTask(VIET_0911_TASK_LAST_USE_TIME)).." gi©y míi cã thÓ sö dông tiÕp");
		return
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		DoFireworks(801, 10);
		if nDate < 091109 then
			ModifyExp(1000000);
			Msg2Player("B¹n nhËn ®­îc 1000000 ®iÓm kinh nghiÖm.")
			WriteLogEx(VIET_0911_LOG_TITLE,"Ph¸o hoa",1000000,"®iÓm kinh nghiÖm")
		else
			ModifyExp(100000);
			Msg2Player("B¹n nhËn ®­îc 100000 ®iÓm kinh nghiÖm.")
			WriteLogEx(VIET_0911_LOG_TITLE,"Ph¸o hoa",100000,"®iÓm kinh nghiÖm")
		end
		ModifyReputation(10, 0);
		
		local nRand = random(1,100)
		if nRand <= 33 then
			AddItem(2,1,30120,1)
			Msg2Player("B¹n nhËn ®­îc 1 B¸nh B¸ch Hoa");	
		elseif nRand <= 67 then
			AddItem(2,1,30118,2)
			Msg2Player("B¹n nhËn ®­îc 2 Hoa Cóc");	
		else
			AddItem(2,0,351,1)
			Msg2Player("B¹n nhËn ®­îc 1 Lé Thñy");	
		end
		SetTask(VIET_0911_TASK_YANHUO_NUM, GetTask(VIET_0911_TASK_YANHUO_NUM) + 1);
		SetTask(VIET_0911_TASK_YANHUO_DATE, nDate);
		SetTask(VIET_0911_TASK_LAST_USE_TIME, GetTime());		
		WriteLogEx(VIET_0911_LOG_TITLE,"Ph¸o hoa",10,"®iÓm danh väng")
	end
end