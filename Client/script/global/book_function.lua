
--Code by Zhuli

g_tRSG = {
	[1] = {
		szTitle = " 小人参果 ",
		nTaskID = 2506,
		},
	[2] = {
		szTitle = " 大人参果 ",
		nTaskID = 2505,
		},
	[3] = {
		szTitle = "千年人参果",
		nTaskID = 2693,
		},
};

g_bGreatBook = 0;
g_nRsgType   = 0;

function ReadNormalBook()
	local szTitle = "请选择您要使用的人参果";
	local tMenu = {
		"我不使用人参果 /#Confirm(0)",
		"\n返回 /noting",
	};
	local nRSG = 0;

	for nIdx = 1, getn(g_tRSG) do
		tRsg = g_tRSG[nIdx];
		local tRsg = g_tRSG[nIdx];
		local nTime = GetTaskClient(tRsg.nTaskID) / 18 / 60;
		if 0 < nTime then
			nRSG = nRSG + 1;
			tinsert(tMenu, 1, format("我要使用 %s 【剩余 %d 小时 %d 分钟】 /#Confirm(%d)", tRsg.szTitle, nTime / 60, mod(nTime, 60), nIdx));
		end
	end

	g_bGreatBook = 0;

	if 0 == nRSG then
		Confirm(0);
	else
		Say(szTitle, getn(tMenu), tMenu);
	end
end

function ReadGreatBook()
	ReadNormalBook();
	g_bGreatBook = 1;
end

function Confirm(nSel)
	if 0 ~= nSel and not g_tRSG[nSel] then
		return 0;
	end

	g_nRsgType = nSel;

	local nPopur = GetPopur();
	AskClientForNumber("AddPoint", 1, nPopur, "你要投入多少修为？");
end

function AddPoint(nPopur)
	if nPopur <= 0 then
		return 0;
	end

	ReadBook(nPopur, g_bGreatBook, g_nRsgType);
end

function nothing()
end
