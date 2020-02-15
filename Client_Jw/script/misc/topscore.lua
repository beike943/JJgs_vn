
tTopScore = {
	name = "天门阵",
	title = {'名字','门派','阵营','杀人数','死亡数','分数'},
	data = {
--		['p1'] = {'p1', 'wd', '天灾', 5, 5, 5, 1,'<color=gold>'},
--		['p2'] = {'p2', 'wd', '天灾', 5, 5, 5, 1,'<color=white>'},
--		['p3'] = {'p3', 'wd', '天灾', 5, 5, 5, 1,'<color=yellow>'},
--		['p4'] = {'p4', 'wd', '天灾', 5, 5, 5, 1,'<color=pink>'},
--		['p5'] = {'p5', 'wd', '天灾', 5, 5, 5, 1,'<color=orange>'},
--		['p6'] = {'p6', 'wd', '天灾', 5, 5, 5, 1,'<color=green>'},
--		['p7'] = {'p7', 'wd', '天灾', 5, 5, 5, 1,'<color=red>'},
--		['p8'] = {'p8', 'wd', '天灾', 5, 5, 5, 1,'<color=red>'},
--		['pa'] = {'pa', 'f', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		['pb'] = {'pb', 'f', '近卫', 0, 6, 4, 1,'<color=blue>'},
--		['pc'] = {'pc', 'f', '近卫', 0, 6, 3, 1,'<color=blue>'},
--		['pd'] = {'pd', 'f', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		['pe'] = {'pe', 'f', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		['pf'] = {'pf', 'f', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		['pg'] = {'pg', 'f', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		['ph'] = {'ph', 'f', '近卫', 0, 6, 2, 1,'<color=blue>'},
	},
	szFormat = "%-17s%-5s%-13s%-5s%-4s%-6s",
	szMsg = "     占阵时间比: <color=blue>近卫 100<color> / <color=red>天灾 200<color>",
}

g_CompType = 1;
g_bDecreasing = 1;

function OnChangeSortType(sType)
	local nType = nil;
	for i=1, getn(tTopScore.title) do
		if sType == tTopScore.title[i] then
			nType = i;
			break
		end
	end
	if not nType then return end
	if g_CompType == nType then
		g_bDecreasing = not g_bDecreasing;
	else
		g_CompType = nType;
		g_bDecreasing = nil;
	end
	UpdateWindow('topscore')
end

function fComp (t1, t2)
	local nRet = nil;
	if g_bDecreasing then
		nRet = t1[g_CompType] < t2[g_CompType];
	else
		nRet = t1[g_CompType] > t2[g_CompType];
	end
	return nRet
end
function OnGetTopScoreTitle()
	local title = "";
	for i=1, getn(tTopScore.title) do
		title = format(tTopScore.szFormat, gf_UnPack(tTopScore.title));
	end
	title = setTitleFormat(title).."<enter/>";
	return tTopScore.name, title;
end
function OnGetTopScoreData(nType)
	local score = "";
	g_CompType = nType or g_CompType;
	local t = {};
	for k,v in tTopScore.data do
		tinsert(t,v)
	end
	sort(t, fComp);
	for i=1, getn(t) do
		local d = t[i];
		local color = d[getn(tTopScore.title)+2];
		score = score..color..format(tTopScore.szFormat.."<enter/>", gf_UnPack(d))..'<color>';
	end
	return score, tTopScore.szMsg;
end

function setTitleFormat(szTitle)
	return gsub(szTitle,"([^ ]+)","<script=OnChangeSortType('%1')>%1</script>");
end
----------------------------------------------------------------------
function gf_UnPack(tbTable,nStartIdx,nEndIdx)
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],gf_UnPack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;
function gf_MergeTable(...)
	local tbTable = {};
	local nIdx = 1;
	for i=1,arg.n do
		for k,v in arg[i] do
			if type(tbTable[k]) == "table" and type(v) == "table" then
				tbTable[k] = gf_MergeTable(tbTable[k], v)
			else
				tbTable[k] = v;
			end
			nIdx = nIdx + 1;
		end;
	end;
	return tbTable;
end;

----------------------------------------------------------------------
function SyncTSD(k,v)
	tTopScore.data[k] = v;
	UpdateWindow('topscore')
end
function SyncTS(k,v)
	tTopScore[k] = v;
	Open('topscore');
	Open('topscore');
end
function ssay(str)
	Chat('附近玩家',tostring(str));
end
function SyncTable(tSync)
--	ssay(Val2Str(tSync));
	tTopScore = gf_MergeTable(tTopScore, tSync);
	tTopScore.data.parent = nil;
	UpdateWindow('topscore');
end
function SyncClear()
	tTopScore = {
		name = "",
		title = {},
		data = {},
		szFormat = "",
		szMsg = "",
	};
	UpdateWindow('topscore');
end
