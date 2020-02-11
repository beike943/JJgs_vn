--=============================================
--create by baiyun 2009.10.14
--describe:Ô½ÄÏ°æ11ÔÂ·Ý»î¶¯ ÕäÖé½Å±¾ÎÄ¼þ
--=============================================
Include("\\script\\online\\viet_event\\200911\\event_head.lua");

function OnUse(nItemIdx)
	if GetTask(VIET_0911_TASK_ZHENZHU_COUNT) >= VIET_0911_ZHENZHU_MAX_COUNT then
		Talk(1, "", "§¹i hiÖp sö dông ngäc trai ®¹t ®Õn sè lÇn cho phÐp, kh«ng thÓ sö dông ®­îc n÷a");
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		ModifyExp(500000)
		SetTask(VIET_0911_TASK_ZHENZHU_COUNT, GetTask(VIET_0911_TASK_ZHENZHU_COUNT) + 1);
	end
end