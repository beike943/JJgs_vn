Include("\\script\\lib\\globalfunctions.lua");

SM_MAIN = 2;
SM_SUB1 = 1;
SM_SUB2 = 30242;

SM_titleTable = 
{
	{"Siªu Nh©n Trøng Muèi (néi c«ng +20)", 64, 1},
	{"Siªu Nh©n Gao (søc m¹nh +20)", 64, 2},
	{"Siªu Nh©n M× Bß (th©n ph¸p +20)", 64, 3},
	{"Siªu Nh©n M× Gµ (g©n cèt +20)", 64, 4},
	{"Siªu Nh©n M× T«m (linh ho¹t +20)", 64, 5}
};

function OnUse(itemIndex)
	local menu = {};
	menu[0] = "Chän danh hiÖu cÇn ®æi:"; 
	for i=1, getn(SM_titleTable) do
		tinsert(menu, SM_titleTable[i][1].."/#DoUse("..i..")");
	end
	gf_PageSay(menu,1, 6);
end

function DoUse(index)
	if 1 == DelItem(SM_MAIN, SM_SUB1, SM_SUB2, 1) then
		local now = GetTime();
		local year, month, day, hour, minute, second = GmTime(GetTime()+8*60*60);
		--WriteLog("year: "..year..", month: "..month..", day: "..day..", hour: "..hour..", minute: "..minute..", second: "..second);
		local expireTime = MkTime(year, month, day, 23, 59, 59);
		--WriteLog("now: "..now..", expireTime: "..expireTime);
		AddTitle(SM_titleTable[index][2], SM_titleTable[index][3]);
		SetCurTitle(SM_titleTable[index][2], SM_titleTable[index][3]);
		SetTitleTime(SM_titleTable[index][2], SM_titleTable[index][3], GetTime() + 30*24*3600);
	end
end