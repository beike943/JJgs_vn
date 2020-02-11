--=======================================================
--create by baiyun 2009.6.1
--describe:Ô½ÄÏ°æ7ÔÂ·Ý»î¶¯Ö®Èý×·Ñ°ÅÖÍÃ×Ó£¬ÅÖÍÃ×Ó±¦Ïä½Å±¾
--
-----ÍÛ£¬½ñÌìÊÇ¶ùÍ¯½Ú°¡£¬¾ÃÎ¥µÄ¸Ð¾õ°¡¡£¡£¡£¡£¡£¡£¡£
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d%H")) < 09061900 or tonumber(date("%y%m%d%H")) >= 09072700 then
		Talk(1, "", "VËt phÈm ®· qu¸ h¹n sö dông");
		return
	end
	local nRandItem = 0;
	if gf_Judge_Room_Weight(1, 50, " ") == 0 then
		return
	end
	
	if DelItemByIndex(nItemIdx, 1) == 1 then
		nRandItem = gf_GetRandItemByTable(tb_pangtuzi_aword, 1000000, 8);
		gf_SetLogCaption("Hoat dong truy tim tho map: Su dung ruong tho map");
		if tb_pangtuzi_aword[nRandItem][5] == 1 then
			local nRetCode, nItem = gf_AddItemEx(tb_pangtuzi_aword[nRandItem][3], tb_pangtuzi_aword[nRandItem][1]);
			if nRetCode == 1 then
				WriteLogEx("Hoat dong thang 6","Thá MËp",tb_pangtuzi_aword[nRandItem][3][4],tb_pangtuzi_aword[nRandItem][1]);
			end
			if nRetCode == 1 and tb_pangtuzi_aword[nRandItem][4] ~= 0 then
				SetItemExpireTime(nItem, tb_pangtuzi_aword[nRandItem][4]);
			end
		else
			Earn(tb_pangtuzi_aword[nRandItem][3] * 100 * 100);
			WriteLogEx("Hoat dong thang 6","nhËn ®­îc",tb_pangtuzi_aword[nRandItem][3], "vµng");
		end
		gf_SetLogCaption("");
	end
end

function task_trigger()
	if tonumber(date("%y%m%d%H")) < 09061900 or tonumber(date("%y%m%d%H")) >= 09071924 then
		RemoveTrigger(GetRunningTrigger());
		return
	end
	gf_SetLogCaption("Hoat dong tho map");
	gf_AddItemEx({2, 1, 30095, 1}, "R­¬ng thá mËp");
	WriteLogEx("Hoat dong thang 6","Thá MËp",1,"R­¬ng Thá MËp");
	gf_SetLogCaption("");
	
end