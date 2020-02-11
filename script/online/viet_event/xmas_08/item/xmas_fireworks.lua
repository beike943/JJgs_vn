--File name:	xmas_fireworks.lua
--Describe:		ÑÌ»ð½Å±¾
--Item ID:		2,1,30039
--Create Date:	2008-11-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\xmas_08\\xmas_head.lua");

TYPE_NULL 	= 0;	--Ã»ÓÐ½±Àø
TYPE_ITEM 	= 1;	--ÆÕÍ¨ÎïÆ·
TYPE_EQUIP 	= 2;	--´øÊôÐÔ×°±¸ÀàÎïÆ·
TYPE_CMD 	= 3;	--ÃüÁî

BYTE_FIREWORKS_NUM_08_USED = 1
BYTE_FIREWORKS_NUM_08_COUNT = 2
--=========================================================================================
g_szLogTitle = "Hoat dong thang 6 nam 2010"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_nVietUseBoxEnd = 2009010500					--ÑÌ»ðµÄÊ¹ÓÃ½ØÖ¹ÈÕÆÚ
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nExpNum = 200000
g_nMaxUse = 100
g_nDayUse = 10								--Ê¹ÓÃÒ»¸öÑÌ»ð»ñµÃµÄ¾­ÑéÖµ

YANHUO_TABLE = {
--	{"XÝch M¹c Háa DiÖm", 801, 10, 2, 1, 191},
--	{"Tranh M¹c Háa DiÖm", 802, 10, 2, 1, 193},
--	{"Lam M¹c Háa DiÖm", 805, 10, 2, 1, 192},
	{"Tranh S¾c Yªn Hoa", 820, 3, 2, 1, 189},
	{"Lam S¾c Yªn Hoa", 823, 3, 2, 1, 190},
	{""		   , 808, 5, 2, 1, 194},	--ÉñÃØÑÌ»¨
	{""		   , 811, 5, 2, 1, 194},
--	{""		   , 813, 10, 2, 1, 194},
--	{""		   , 814, 10, 2, 1, 194},
--	{""		   , 817, 10, 2, 1, 194},
	{""		   , 832, 3, 2, 1, 194},
	{""		   , 835, 3, 2, 1, 194},
	{""		   , 838, 1, 2, 1, 194},
	{""        , 841, 1, 2, 1, 194}
};

t_Firework_Exp = {
	{2, 80, 200000},
	{2, 5, 400000},
	{2, 5, 600000},
	{2, 5, 800000},
	{2, 5, 1000000},
}


--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"))
	
	if nDate < 20100708 or nDate > 20100711 then
		return
	end
	
	if GetTask(FIREWORKS_DATE_08_XMAS_VIET) ~= nDate then
		SetTask(FIREWORKS_DATE_08_XMAS_VIET, nDate)
		gf_SetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT, 0)
		SetTask(FIREWORKS_TIME_08_XMAS_VIET, 0)
	end

	if GetLevel() < 73 then
		Say("Nh©n vËt cã ®¼ng cÊp 73 trë lªn míi cã thÓ sö dông ph¸o hoa",1,"KÕt thóc ®èi tho¹i/no_talk")
		return
	end

	--if gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_USED) >= 100 then
	--	Msg2Player("ChØ cã thÓ sö dông tèi ®a 100 ph¸o hoa.")
	--	return
	--end

	if gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT) >= g_nDayUse then
		Msg2Player("Ngµy h«m nay chØ cã thÓ sö dông 10 ph¸o hoa.")
		return
	end

	if (GetTime() - GetTask(FIREWORKS_TIME_08_XMAS_VIET)) < 60 then
		local nRemainTime = 60 - (GetTime() - GetTask(FIREWORKS_TIME_08_XMAS_VIET))
		Msg2Player("Cßn "..nRemainTime.." gi©y n÷a míi cã thÓ ®èt ph¸o hoa tiÕp.")
		return
	end

	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_EventGiveRandAward(t_Firework_Exp,100,1,g_szLogTitle,"sö dông ph¸o hoa")
		gf_SetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT, gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_COUNT) + 1)
		--gf_SetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_USED, gf_GetTaskByte(FIREWORKS_NUM_08_XMAS_VIET, BYTE_FIREWORKS_NUM_08_USED) + 1)
		SetTask(FIREWORKS_TIME_08_XMAS_VIET, GetTime())		
		nIndex = random(1, getn(YANHUO_TABLE));
		DoFireworks(YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3]);
	end
end

function no_talk()
end