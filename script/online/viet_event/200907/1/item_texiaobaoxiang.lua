--=======================================================
--create by baiyun 2009.5.30
--describe:Ô½ÄÏ°æ7ÔÂ·Ý»î¶¯Ö®Ò»×·Ñ°³¤ÉúÆÕ£¬ÌØÐ§±¦Ïä½Å±¾
--=======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function OnUse(nItemIdx)
	local nRandItem = 0;
	if gf_Judge_Room_Weight(1, 50, " ") == 0 then
		return
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		local nBody = GetBody();
		nRandItem = gf_GetRandItemByTable(tb_texiaobaoxiang_aword[nBody], 10000, 7);
		gf_SetLogCaption("Truy t×m tr­êng sinh phæ");
		gf_AddItemEx(
									{tb_texiaobaoxiang_aword[nBody][nRandItem][3], tb_texiaobaoxiang_aword[nBody][nRandItem][4], 
										tb_texiaobaoxiang_aword[nBody][nRandItem][5], tb_texiaobaoxiang_aword[nBody][nRandItem][6],
										1,-1,-1,-1,-1,-1,-1
									}, 
									tb_texiaobaoxiang_aword[nBody][nRandItem][1]
				);
		WriteLogEx("Hoat dong thang 6","Tr­êng Sinh Phæ",tb_texiaobaoxiang_aword[nBody][nRandItem][6],tb_texiaobaoxiang_aword[nBody][nRandItem][1]);
		gf_SetLogCaption("");
	end
end