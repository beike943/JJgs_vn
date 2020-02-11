--Ñæ»ðµÄ×Üµ÷ÓÃº¯Êý
--created by lizhi
--2005-10-16 20:59

YANHUO_TABLE = {
	{"XÝch M¹c Háa DiÖm", 801, 10, 2, 1, 191},
	{"Tranh M¹c Háa DiÖm", 802, 10, 2, 1, 193},
	{"Lam M¹c Háa DiÖm", 805, 10, 2, 1, 192},
	{"Tranh S¾c Yªn Hoa", 820, 3, 2, 1, 189},
	{"Lam S¾c Yªn Hoa", 823, 3, 2, 1, 190},
	{""		   , 808, 5, 2, 1, 194},	--ÉñÃØÑÌ»¨
	{""		   , 811, 5, 2, 1, 194},
	{""		   , 813, 10, 2, 1, 194},
	{""		   , 814, 10, 2, 1, 194},
	{""		   , 817, 10, 2, 1, 194},
	{""		   , 832, 3, 2, 1, 194},
	{""		   , 835, 3, 2, 1, 194},
	{""		   , 838, 1, 2, 1, 194},
	{""        , 841, 1, 2, 1, 194}
};

function use_yanhuo(szName)
	if szName == nil or szName == "" then
		print("Sö dông ph¸o hoa b¸o lçi");
		return
	end
	
	if szName == "ThÇn bÝ Yªn Hoa" then
		nCount = getn(YANHUO_TABLE);
		nIndex = random(1, nCount);
		nRetCode = DoFireworks(YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3]);
		if nRetCode == 1 then	--³É¹¦
			DelItem(2, 1, 194, 1);
		end;
		return
	end;
	
	local nRetCode = 0;
	for index, value in YANHUO_TABLE do
		if value[1] == szName then
			nRetCode = DoFireworks(value[2], value[3]);
			if nRetCode == 1 then	--³É¹¦
				DelItem(value[4], value[5], value[6], 1);
			end;
			break
		end;
	end;
end;