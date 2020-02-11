--ÌìÃÅºìÒ© ÌìÃÅÀ¶Ò©½Å±¾
--Ö»ÄÜÔÚÍ¨Ìì»Ã¾³ºÍÍò½£Ú£¹Ø¿¨²ÅÄÜÊ¹ÓÃ

t_allow_use_map={
	[6019] = 1,
	[6020] = 1,
	[6007] = 1,--ÁºÉ½
	[427] = 1,--µØĞş¹¬
	[1010] = 1,--Ì«Ğé»Ã¾³
	[2010] = 1,--Ì«Ğé»Ã¾³
	[3010] = 1,--Ì«Ğé»Ã¾³
	[4010] = 1,--Ì«Ğé»Ã¾³
	[5010] = 1,--Ì«Ğé»Ã¾³
}
function OnUse(nItemIdx)
	local nMapTemplate = GetMapTemplate(SubWorld)
	if 1 ~= t_allow_use_map[nMapTemplate] then
		Msg2Player("VËt phÈm nµy chØ cã thÓ sö dông trong V¹n KiÕm Tròng, Th«ng Thiªn HuyÔn C¶nh, L­¬ng S¬n, §Şa HuyÒn Cung, Th¸i H­");
		return 0;
	end
	return 1;
end;