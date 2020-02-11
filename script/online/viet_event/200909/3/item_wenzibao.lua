--=============================================
--create by baiyun 2009.8.26
--describe:Ô½ÄÏ°æ9ÔÂ·ÝÖÐÇï»î¶¯ÎÃ×Ó°ü½Å±¾
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")

function OnUse(nItemIdx)
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then 
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		gf_SetLogCaption(VIET_0909_LOG_TITLE);
		local nRand = gf_GetRandItemByTable(tb_VIET_0909_WENZIBAO, 100, 10);
		local nRetCode, nIndex = gf_AddItemEx(tb_VIET_0909_WENZIBAO[nRand][3], tb_VIET_0909_WENZIBAO[nRand][1]);
		WriteLogEx("Hoat dong trung thu","Tói V¨n Tö",1,tb_VIET_0909_WENZIBAO[nRand][1])
		if nRetCode == 1 and tb_VIET_0909_WENZIBAO[nRand][4] > 0 then
			SetItemExpireTime(nIndex, tb_VIET_0909_WENZIBAO[nRand][4]);
		end
		gf_SetLogCaption("");
	end
end