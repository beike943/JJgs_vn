--=============================================
--create by baiyun 2009.7.16
--describe:越南版8月份活动 葡萄糖脚本
--=============================================
Include("\\script\\online\\viet_event\\200908\\viet0908_head.lua");
Include("\\script\\lib\\writelog.lua");

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d")) >= 090914 then return end
	if gf_Judge_Room_Weight(5, 10, " ") ~= 1 then return end
	if GetTask(VIET_0908_TASK_ALREADY_GET_EXP) >= VIET_0908_CONST_MAX_EXP then return end
	if DelItem(2, 1, 30102, 1) == 1  then
		ModifyExp(125000);
		WriteLogEx("Hoat dong thang 8", "Phan thuong keo trai cay", 125000, "Exp");
		SetTask(VIET_0908_TASK_ALREADY_GET_EXP, GetTask(VIET_0908_TASK_ALREADY_GET_EXP) + 125000);

	--这里给奖励
		local nItem = gf_GetRandItemByTable(tVIET_0908_TANG_AWARD, 100000000, 20);
		gf_SetLogCaption(str_VIET_0908_LOG_TITLE);
		if tVIET_0908_TANG_AWARD[nItem][4] > 0 then--命令
			dostring(format(tVIET_0908_TANG_AWARD[nItem][3], tVIET_0908_TANG_AWARD[nItem][4]));
			WriteLogEx("Hoat dong thang 8", "Phan thuong keo trai cay", tVIET_0908_TANG_AWARD[nItem][4], tVIET_0908_TANG_AWARD[nItem][1]);
			Msg2Player("B筺 nh薾 頲 "..tVIET_0908_TANG_AWARD[nItem][4].." 甶觤"..tVIET_0908_TANG_AWARD[nItem][1]);
		else--物品
			local nRetCode, nIndex = gf_AddItemEx(tVIET_0908_TANG_AWARD[nItem][3], tVIET_0908_TANG_AWARD[nItem][1]);
			WriteLogEx("Hoat dong thang 8", "Phan thuong keo trai cay", 1, tVIET_0908_TANG_AWARD[nItem][1]);
			if tVIET_0908_TANG_AWARD[nItem][5] ~= 0 then
				if nRetCode == 1 then					
					SetItemExpireTime(nIndex, tVIET_0908_TANG_AWARD[nItem][5]);
				end
			end
		end
		gf_SetLogCaption("");
		---
	end
end

