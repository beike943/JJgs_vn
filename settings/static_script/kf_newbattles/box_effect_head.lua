Include("\\script\\class\\ktabfile.lua")
Include("\\script\\lib\\string.lua")
--表的列类型
TBOX_TYPE =
{
	result = 1,
	rate_10 = 2,
	rate_20 = 3,
	rate_30 = 4,
	rate_40 = 5,
	rate_50 = 6,
	rate_60 = 7,
	rate_70 = 8,
	rate_80 = 9,
	rate_90 = 10,
	prompt = 11,
}

--随机一个几率
function GetRate()
	local t = {10, 20, 30, 40, 50, 60, 70, 80, 90}
	local nMax = 0
	for index, value in t do
		nMax = nMax + value
	end
	
	local n = mod(random(1, 246461617), nMax)
	local nAera = 0
	
	for index, value in t do
		nAera = nAera + value
		if n <= nAera then
			return value
		end
	end
end

function FillResultData(szString, t)
	local nCount = getn(t)
	local nIndex = 0
	local szKey = "/"
	local strStart = 1
	local szResult = ""
	for i = 1, nCount do
		nIndex = strfind(szString, szKey..i, strStart)
		if nIndex == nil then
			BT_ShowDebugInfor("\n###FillResultData error...\n")
			return ""
		end
		szResult = szResult..strsub(szString, strStart, nIndex - 1)..t[i]
		strStart = nIndex + strlen(szKey..i)
	end
	
	szResult = szResult..strsub(szString, strStart, strlen(szString))	--补上最后的字符串
	return szResult
end

function Do_Box_Effect(tBoxConfig)
	local nRowCount = tBoxConfig:getRow()
	local nRow = random(3, nRowCount)
	local sDescribe = "";
	local szCellResultData = tBoxConfig:getCell(nRow, TBOX_TYPE["result"])
	local nRate = GetRate()
	sDescribe = tBoxConfig:getCell(nRow, TBOX_TYPE["prompt"]);
	local szCellRateData = tBoxConfig:getCell(nRow, TBOX_TYPE["rate_"..nRate])	--Rate_n代表含义在设定表里有解释
	local tResult = split(szCellRateData, ";")
	szCellResultData = FillResultData(szCellResultData, tResult)
	BT_ShowDebugInfor(szCellResultData)
	dostring(szCellResultData)
	for i=1,getn(tResult) do
		sDescribe = replace(sDescribe,"/"..i,tResult[i]);
	end;
	sDescribe = "Msg2Player(\""..sDescribe.."\")";
	dostring(sDescribe);
end;