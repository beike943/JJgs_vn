Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\task_values.lua")

NT_ActivityID = 16;

NT_TitleTable = 
{
	{"", 0, 0, 76},
	{"C¶m", 65, 19, 2},
	{"Sæ Mòi", 65, 20, 2},
	{"Tiªu Ch¶y", 65, 21, 2},
	{"Ho", 65, 22, 2},
	{"Nhøc §Çu", 65, 23, 2},
	{"§au Bông", 65, 24, 2},
--	{"Chãng MÆt", 65, 25, 2},
	{"Th©n ThÓ C­êng Tr¸ng", 65, 26, 6},
	{"Tinh ThÇn Ho¹t B¸t", 65, 27, 6},
};

NT_ItemTable = 
{
	{"Thuèc sæ mòi", 2, 1, 30244, 10000},
	{"Thuèc c¶m", 2, 1, 30245, 10000},
	{"Thuèc nhøc ®Çu", 2, 1, 30246, 10000},
	{"Thuèc tiªu ch¶y", 2, 1, 30247, 10000},
	{"Thuèc ®au bông", 2, 1, 30248, 10000},
	{"Thuèc ho", 2, 1, 30249, 10000}
};

function NT_Dialog(sayDialog, sayHead)
	if gf_CheckEventDateEx(NT_ActivityID) == 1 then
		tinsert(sayDialog, "Mua thuèc trÞ bÖnh/NT_Dialog2");
	end
	return sayDialog, sayHead;
end

function NT_Dialog2()
	head = "C¸c h¹ muèn mua thuèc g×?"
	menu = {};
	for i=1, getn(NT_ItemTable) do
		tinsert(menu, "Ta muèn mua 1 phÇn"..NT_ItemTable[i][1].."(1 vµng)/#NT_DoBuy("..i..")");
	end
	tinsert(menu, "Rêi khái");
	Say(head, getn(menu), menu);
end

function NT_DoBuy(itemIndex)
    if GetCash() < NT_ItemTable[itemIndex][5] then
        Talk(1,"","Hµnh trang kh«ng ®ñ tiÒn!")
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if Pay(NT_ItemTable[itemIndex][5]) == 1 then
        local itemID = {NT_ItemTable[itemIndex][2], NT_ItemTable[itemIndex][3], NT_ItemTable[itemIndex][4], 1}
        gf_AddItemEx2(itemID, NT_ItemTable[itemIndex][1], "new title", "buy")
    end	
end

function NT_GetTitleName(type1, type2)
	local titleName = "";
	for i=1, getn(NT_TitleTable) do
		if NT_TitleTable[i][2] == type1 and NT_TitleTable[i][3] == type2 then
			titleName = NT_TitleTable[i][1];
			break;
		end
	end
	return titleName;
end

function NT_AddTitle(type1, type2)
	local name = NT_GetTitleName(type1, type2);
	if 0 ~= type1 and 0 ~= type2 then
		--WriteLog("NT_AddTitle::add title{"..type1..", "..type2.."}");	
		Msg2Player("C¸c h¹ c¶m thÊy"..name..", nhËn ®­îc"..name.."hiÖu øng");		
		AddTitle(type1, type2);
		SetCurTitle(type1, type2);
		
		local curHour = tonumber(date("%H"));
		local curMinute = tonumber(date("%M"));
		local curSecond = tonumber(date("%S"));
		local expireTime = GetTime() + 23*3600+59*60+59 - (curHour*3600+curMinute*60+curSecond);
		SetTitleTime(type1, type2, expireTime);
	end
end

function NT_ResetTaskValue()
	SetTask(VET_201009_00_TASK_FLAG_TITLE, 0);
end

function main()
--	NT_ResetTaskValue();
end

function NT_OnPlayer1stLoginToday()
	local nDate = tonumber(date("%y%m%d"))
	if nDate == GetTask(VET_201009_00_TASK_FLAG_TITLE) then
		return
	end
	--WriteLog("NT_OnPlayer1stLoginToday::called");
	local chance = random(1, 100);
	--WriteLog("NT_OnPlayer1stLoginToday::chance: "..chance);
	local tmp = 0;
	local type1 = 0;
	local type2 = 0;
	for i=1, getn(NT_TitleTable) do
		if tmp < chance and chance <= tmp + NT_TitleTable[i][4] then
			type1 = NT_TitleTable[i][2];
			type2 = NT_TitleTable[i][3];
			break;
		else
			tmp = tmp + NT_TitleTable[i][4];
		end
	end
	if type1 == 0 and type2 == 0 then	
		return
	end
	SetTask(VET_201009_00_TASK_FLAG_TITLE, nDate)
	NT_AddTitle(type1, type2);
end 