--=============================================
--create by baiyun 2009.8.24
--describe:越南版9月份中秋活动高级要诀箱
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")

function OnUse(nItemIdx)
	if gf_Judge_Room_Weight(3, 10, " ") ~= 1 then 
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		local nRand = gf_GetRandItemByTable(tbVIET_0909_GAOJIYAOJUE, 100, 1);
		gf_SetLogCaption(VIET_0909_LOG_TITLE);
		gf_AddItemEx(tbVIET_0909_GAOJIYAOJUE[nRand][3], tbVIET_0909_GAOJIYAOJUE[nRand][1]);
		WriteLogEx("Hoat dong trung thu","Rng Y誹 Quy誸",1,tbVIET_0909_GAOJIYAOJUE[nRand][1])
		gf_SetLogCaption("");
	end
end