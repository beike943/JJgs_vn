--=======================================================
--create by baiyun 2009.5.30
--describe:Ô½ÄÏ°æ7ÔÂ·Ý»î¶¯Ö®Ò»×·Ñ°³¤ÉúÆÕ£¬ÃØ¼®Ïä½Å±¾
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function OnUse(nItemIdx)
	local nRandItem = 0;
	if gf_Judge_Room_Weight(1, 50, " ") == 0 then
		return
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		nRandItem = gf_GetRandItemByTable(tb_mijixiang_aword, 1000, 1);
		gf_SetLogCaption("Truy t×m tr­êng sinh phæ");
		gf_AddItemEx(
									{tb_mijixiang_aword[nRandItem][3], tb_mijixiang_aword[nRandItem][4], 
										tb_mijixiang_aword[nRandItem][5], tb_mijixiang_aword[nRandItem][6]
									}, 
									tb_mijixiang_aword[nRandItem][1]
				);
		WriteLogEx("Hoat dong thang 6","Tr­êng Sinh Phæ",tb_mijixiang_aword[nRandItem][6],tb_mijixiang_aword[nRandItem][1]);
		gf_SetLogCaption("");
	end
end