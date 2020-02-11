--=============================================
--create by baiyun 2009.11.22
--describe:Ô½ÄÏ°æ12ÔÂ·ÝÊ¥µ®½Ú»î¶¯¼¦½Å½Å±¾
--=============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua")

function OnUse(nItemIdx)
	do return end
	--local nDate = tonumber(date("%y%m%d"));
	--if nDate > 091025 then
	--	Talk(1, "", "ÎïÆ·ÒÑ¾­¹ýÆÚ£¬²»ÄÜ´ò¿ª¡£");
	--	return 0;
	--end
	if gf_Judge_Room_Weight(2, 50, " ") ~= 1 then 
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
            --¸øÎïÆ·½±Àø
            local szFullLogTitle = VIET_0912_STR_EVENT_LOG_TITLE
            gf_EventGiveRandAward(VIET_0912_YUTUXIAO_AWARD, 100000, 13, szFullLogTitle,"Ch©n gµ");
	end
end
