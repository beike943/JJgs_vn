--=============================================
--create by baiyun 2009.8.24
--describe:Ô½ÄÏ°æ9ÔÂ·ÝÖÐÇï»î¶¯Ê²½õ±ý½Å±¾
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d")) < 090918 or tonumber(date("%y%m%d")) >= 091102 then
		Talk(1, "", "Ho¹t ®éng ®· qu¸ h¹n");
		return 0;
	end
	if GetTask(VIET_0909_TASK_ALREADY_GET_EXP) >= 300000000 then
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10, " ") ~= 1 then 
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		local nRand = gf_GetRandItemByTable(tbVIET_0909_SHIJINBING_EXP, 1000, 1);
		local nExp = tbVIET_0909_SHIJINBING_EXP[nRand][1];
		if GetTask(VIET_0909_TASK_ALREADY_GET_EXP) + nExp > 300000000 then
			nExp = 300000000 - GetTask(VIET_0909_TASK_ALREADY_GET_EXP)
		end
		ModifyExp(nExp);
		SetTask(VIET_0909_TASK_ALREADY_GET_EXP, GetTask(VIET_0909_TASK_ALREADY_GET_EXP) + nExp);
		local nRand = gf_GetRandItemByTable(tbVIET_0909_SJLD_AWARD, 1000000, 8);
		gf_SetLogCaption(VIET_0909_LOG_TITLE);
		local nRetCode, nIndex = gf_AddItemEx(tbVIET_0909_SJLD_AWARD[nRand][3], tbVIET_0909_SJLD_AWARD[nRand][1]);
		if nRetCode == 1 then
			if tbVIET_0909_SJLD_AWARD[nRand][4] ~= 0 then
				SetItemExpireTime(nIndex, tbVIET_0909_SJLD_AWARD[nRand][4]);
			end
			WriteLogEx("Hoat dong trung thu","Sö dông b¸nh",1,tbVIET_0909_SJLD_AWARD[nRand][1])
		end
		gf_SetLogCaption("");
	end
end