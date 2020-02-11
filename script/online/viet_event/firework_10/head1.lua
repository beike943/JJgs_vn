Include("\\script\\online\\viet_event\\vng_task_control.lua")

szLogTitle = "Phao hoa Idol 2010"

tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[29] = 1176,
				[30] = 1229,
}

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

function use_firework1()
	local nDate = tonumber(date("%y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", "Kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ sö dông ph¸o hoa!")
		return
	end
	
	local nCurDate = floor(GetTask(FIREWORK_IDOL_USE) / 100)
	if nCurDate ~= nDate then
		SetTask(FIREWORK_IDOL_USE, nDate * 100)
		SetTask(FIREWORK_IDOL_TIME, 0)
	end
	
	local nHour = tonumber(date("%H%M"))
	if nHour < 0900 or (nHour > 1000 and nHour < 1530) or (nHour > 1630 and nHour < 2030) or nHour > 2130 then
		Talk(1, "", "Ho¹t ®éng ®èt ph¸o hoa diÔn ra tõ 9 giê ®Õn 10 giê, tõ 15 giê 30 ®Õn 16 giê 30, tõ 20 giê 30 ®Õn 21 giê 30!")
		return
	end
	
	local nPos = GetWorldPos()
	if nPos ~= 100 and nPos ~= 150 and nPos ~= 606 and nPos ~= 885 and nPos ~= 884 then
		Talk(1, "", "ChØ cã thÓ sö dông ph¸o hoa t¹i TuyÒn Ch©u, D­¬ng Ch©u, chiÕn tr­êng Nh¹n M«n Quan, S¸t Thñ §­êng vµ trong Tµi Nguyªn ChiÕn!")
		return
	end
	
	if GetLevel() < 77 then
		Talk(1, "", "§¼ng cÊp 77 trë lªn míi cã thÓ ®èt ph¸o hoa!")
		return
	end
	if check_skill_55() == 0 then
		Talk(1, "", "Ch­a häc kü n¨ng cÊp 55 cña m«n ph¸i nªn kh«ng thÓ ®èt ph¸o hoa!")
		return
	end
	
	local nCount = mod(GetTask(FIREWORK_IDOL_USE), 100)
	if nCount >= 40 then
		Talk(1, "", "H«m nay thiÕu hiÖp ®· dïng qu¸ nhiÒu ph¸o hoa råi, ch¼ng cßn ph¸o cho thiÕu hiÖp n÷a ®©u. H·y quay l¹i vµo ngµy mai!")
		return
	end
	
	local nDif = 30 - (GetTime() - GetTask(FIREWORK_IDOL_TIME))
	if nDif > 0 then
		Talk(1, "", "ThiÕu hiÖp ph¶i chê "..nDif.." gi©y n÷a míi cã thÓ tiÕp tôc ®èt ph¸o hoa!")
		return
	end
	
	ModifyExp(200000)
	Msg2Player("NhËn ®­îc 200000 ®iÓm kinh nghiÖm")
	WriteLogEx(szLogTitle, "Sö dông ph¸o hoa nhËn 200000  ®iÓm kinh nghiÖm")
	SetTask(FIREWORK_IDOL_USE, GetTask(FIREWORK_IDOL_USE) + 1)
	SetTask(FIREWORK_IDOL_TIME, GetTime())
	local nIndex = random(1, getn(YANHUO_TABLE))
	DoFireworks(YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3])
	StartTimeGuage("Ph¸o hoa thÇn t­îng Vâ L©m 2", 30,0,1)
end

function check_skill_55()
	local nRoute = GetPlayerRoute()
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0
	else
		if GetSkillLevel(nSkillID) >= 1 then
			return 1
		else
			return 0
		end
	end
end