
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")
Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\offline_head.lua");
Include("\\script\\lib\\writelog.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

--============================================================================================== HEAD ====
SF_FILE_SVR =
{
	"\\script\\藏剑山庄\\task_script\\成都\\藏剑使者.lua",
	"\\script\\藏剑山庄\\task_script\\汴京\\藏剑使者.lua",
	"\\script\\藏剑山庄\\task_script\\泉州\\藏剑使者.lua",
	"\\script\\藏剑山庄\\task_script\\襄阳\\藏剑使者.lua",
	"\\script\\藏剑山庄\\task_script\\扬州\\藏剑使者.lua"
}

--按列从左到右：是否区分体型，物品名称，大类，副类，详细类别
tGOOD_DROP_ITEM = 
{
	[1] = {1, "总管裤", 0, 101, 91},
	[2] = {1, "总管外衣", 0, 100, 91},
	[3] = {0, "小姐戒指", 0, 102, 36},
	[4] = {1, "庄主帽", 0, 103, 91},
	[5] = {0, "长老指环", 0, 102, 37},
	[6] = {0, "藏剑宝珠", 0, 102, 38},
	[7] = {0, "藏剑奇石", 0, 102, 39},
	[8] = {1, "藏剑紫金帽", 0,103,95},
	[9] = {1, "藏剑金缕裳", 0,100,95},
	[10] = {1, "藏剑乌金装", 0,101,95},
	[11] = {0, "藏剑金印", 0,102,40},
}

tBOSS_GOOD_DROP =
{
	["T鎛g qu秐 ngo筰 vi謓"] = {
		[70] = {{100, 1}},
		[80] = {{120, 1}},
		[90] = {{160, 1}},
	},
		
	["T鎛g qu秐 n閕 vi謓"] = {
		[70] = {{100, 2}},
		[80] = {{120, 2}},
		[90] = {{160, 2}},
	},
	
	["Чi ti觰 th?"] = {
		[70] = {{100, 3}},
		[80] = {{120, 3}},
		[90] = {{160, 3}},
	},
		
	["Чi trang ch?"] = {
		[70] = {{100, 4}},
		[80] = {{120, 4}},
		[90] = {{160, 4}},
	},
	
	["Trng l穙 T祅g Ki誱 C竎"] = {
		[70] = {{100, 5}},
		
		[80] = {
			{120, 5},
			{160, 11},
			{200, 7},
		},
		
		[90] = {
			{160, 5},
			{210, 11},
			{260, 7},
		},
	},
		
	["C鰑 Tuy謙 Ki誱 Ma"] = {
		[80] = {
			{60	, 8},
			{160, 9},
			{220, 10},
			{235, 6},
		},
		
		[90] = {
			{60 , 8},
			{160, 9},
			{220, 10},
			{235, 6},
		},
	},
}


SF_TOWNID_SVR = {300,200,100,350,150}
SF_TOWNNAME_SVR = {"成都，“汴京”、“泉州”、“襄阳”、“扬州”"}
SF_BACKPOINT_SVR = {			-- 意外中断后玩家返回的地点
{300,1776,3704},
{200,1229,2763},
{100,1510,3107},
{350,1395,2852},
{150,1745,3120}}
SF_FILE = ""		-- 不同服务器需要修改此处指向实际文件
SF_TOWNID = 350
SF_TOWNNAME = "襄阳"
SF_BACKPOINT = {350, 1397, 2852}
SF_MAPBASE = 1000
--09年8月藏剑调整新增奖励
tNEW_AWARD_EX = {
	{--第一关
		[5] = 15000,
		[6] = 60000,
		[7] = 75000,
		[8] = 90000,
		[9] = 105000,
	},
	{--第二关
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--第三关
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--第四关
		[5] = 30000,
		[6] = 120000,
		[7] = 150000,
		[8] = 180000,
		[9] = 210000,
	},
	{--第五关
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
	{--第六关
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
};

tNEW_AWARD_EX_2 = {
	{--第一关
		[5] = 15000,
		[6] = 60000,
		[7] = 75000,
		[8] = 90000,
		[9] = 105000,
	},
	{--第二关
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--第三关
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--第四关
		[5] = 2100000,
		[6] = 2300000,
		[7] = 2500000,
		[8] = 3000000,
		[9] = 3250000,
	},
	{--第五关
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
	{--第六关
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
};

--09年8月藏剑调整新增奖励
tNEW_AWARD_EX_STAGE_7_NEW = {
		[5] = 1225000,
		[6] = 1675000,
		[7] = 2125000,
		[8] = 3250000,
		[9] = 3812500,
};

tNEW_AWARD_EX_STAGE_7_2 = {
		[5] = 2200000,
		[6] = 2600000,
		[7] = 3000000,
		[8] = 4000000,
		[9] = 4500000,
};

------------------------------------------------------------------------------------------------ FUNCTION ----    			
function Main_Init(nSvr)
	SF_FILE = SF_FILE_SVR[nSvr]
	SF_MAPBASE = nSvr*1000
	SF_TOWNID = SF_TOWNID_SVR[nSvr]
	SF_TOWNNAME = SF_TOWNNAME_SVR[nSvr]
	SF_BACKPOINT = {SF_BACKPOINT_SVR[nSvr][1], SF_BACKPOINT_SVR[nSvr][2], SF_BACKPOINT_SVR[nSvr][3]}
end

if SERVER_INDEX ~= nil then
	Main_Init(SERVER_INDEX)
end

--============================================================================================== MISC UNIT ====
------------------------------------------------------------------------------------------------ FUNCTION ----    			
function SB_GetPNPage(nStage)
	if nStage == nil then
		nStage = 1
	end
	local nStagePre = nStage - 1
	local nStageNext = nStage + 1
	if (nStagePre < 1) or (nStagePre == 9) then
		nStagePre = 10
	end
	if nStageNext == 11 then
		nStageNext = 1
	elseif nStageNext == 10 then
		nStageNext = 9
	end
----------- 此处为屏蔽未开放的场景的页面显示
	if nStageNext == 6 then
		nStageNext = 8
	elseif nStagePre == 7 then
		nStagePre = 5
	end
----------- --------------------------------
	return nStagePre, nStageNext
end

-- 格式化字符串：为 sStr 添加空格或者"0"达到 nLen 的长度
-- sStr : 原数据(整数、字符串……)
-- nLen : 格式后长度
-- nMode : 1.在串后家空格(空缺默认) 2.在串前加空格 3.在串前加“0”
-- 返回格式化后的字符串
function SB_FormatStr(sStr, nLen, nMode)
	if sStr == nil then sStr = GetName() end
	if type(sStr) ~= "string" then sStr = tostring(sStr) end
	if nLen == nil then nLen = 16 end
	local nStrLen = strlen(sStr)
	local nSpaceNum = nLen - nStrLen
	for i=1, nSpaceNum do
		if (nMode == nil) or (nMode == 1) then
			sStr = sStr.." "
		elseif (nMode == 2) then
			sStr = " "..sStr
		elseif (nMode == 3) then
			sStr = "0"..sStr
		end
	end
	return sStr
end

-- 整除 
-- num : 除数
-- steps : 被除数
-- 返回 商 和 余数
function SB_Div(num, steps)
	if tonumber(num) == nil then
		return 0
	else
		num = tonumber(num)
	end
	if (steps == nil) then
		steps = 10
	end
	if (steps == 0) then
		steps = 1
	end
	return (num - mod(num, steps)) / steps, mod(num, steps)
end

-- 整除：只能除以10的整倍数
-- num : 除数
-- steps : 被除数
-- 返回 商
function MU_Div(num, steps)
	if tonumber(num) == nil then						-- 整除 steps
		return 0
	else
		num = tonumber(num)
	end
--	if (steps == nil) or (mod(steps, 10) ~= 0) then
	if (steps == nil) then
		steps = 10
	end
	return (num - mod(num, steps)) / steps
end

-- 反转：反转 BOOLEAN
-- num : 0 or 1
-- 返回 (not num)
function MU_Inverse(num)
	if num == 0 then
		return 1
	else
		return 0
	end
end

-- 队伍信息：向当前玩家所在队伍发送信息
-- msg : 需要发送的信息
-- msgtype : 发送信息的方式: 0.Msg2Player(缺省默认) 1.Say 2.Talk
function MU_Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end

-- 两点间距离: 取得两点间的距离
function MU_Distance(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)		-- 判断两点间距离
	if MapID1 ~= MapID2 then
		Msg2Player("Error: Khu v鵦 kh玭g ph? h頿!")
		return 0
	else
		local dx = MapX2 - MapX1
		local dy = MapY2 - MapY1
		local nDist = (dx * dx + dy * dy)^(1/2)
		return nDist
	end
end

-- 文字上色: 给文字段上色后返回
-- text : 需要上色的文字段
-- color : 需要的颜色: gray red green blue yellow gold wood metal fire water earth ....
function MU_GetColoredText(text, color)
	return "<color="..color..">"..text.."<color>"
end

function MU_Split(str,splitor)
	if (splitor == nil) then
		splitor = ","
	end
	local strArray = {}
	local strStart = 1
	local splitorLen = strlen(splitor)
	local index = strfind(str, splitor, strStart)
	if (index == nil) then
		strArray[1] = str
		return strArray, 1
	end
	local i = 1
	while (index ~= nil) do
		strArray[i] = strsub(str, strStart, index-1)
		i = i + 1
		strStart = index + splitorLen
		index = strfind(str, splitor, strStart)
	end
	strArray[i] = strsub(str, strStart, strlen(str))
	return strArray, i
end

--============================================================================================== SPAWNER TABLE ====
-- Spawner Table
ST_FILE = new(KTabFile, "\\settings\\藏剑山庄\\spawner\\cangjian_spawner.txt")			-- 记录每个关卡刷怪点信息的表格
ST_TYPE = {"SortID","UnitIndex","MapID","MapX","MapY","NpcID",							-- 表头（列名称）
		   "NpcName","RandomTable","SpawnPeriod","Amount","Limit","SpawnerCount"}
ST_ROWCOUNT = tonumber(ST_FILE:getRow())												-- 表总行数
ST_LMD_INIT = {{0,0},{0,0},{0,0},{0,0},{0,0}, {0,0},{0,0},{0,0},{0,0}}					-- 怪物初始化关卡区间（表中位置）
ST_LMD_SPWN = {{0,0},{0,0},{0,0},{0,0},{0,0}, {0,0},{0,0},{0,0},{0,0}}					-- 怪物刷怪点关卡区间（表中位置）

------------------------------------------------------------------------------------------------ FUNCTION ----
-- 读表的初始化处理
-- 计算表格中每一关的信息的位置区间
function ST_Init()
	for i=2, ST_ROWCOUNT do												-- 计算关卡区间
		local tempdata = tonumber(ST_FILE:getCell(i, ST_TYPE[1]))
		if (tempdata >= 10000) then
			local nStage = (tempdata - mod(tempdata, 10000)) / 10000
			if (ST_LMD_INIT[nStage][1] == 0) then
				ST_LMD_INIT[nStage][1] = i
				ST_LMD_INIT[nStage][2] = i
			else
				ST_LMD_INIT[nStage][2] = i
			end
		else
			local nStage = (tempdata - mod(tempdata, 100)) / 100
			if (ST_LMD_SPWN[nStage][1] == 0) then
				ST_LMD_SPWN[nStage][1] = i
				ST_LMD_SPWN[nStage][2] = i
			else
				ST_LMD_SPWN[nStage][2] = i
			end
		end
	end
end				
ST_Init()	-------------------------------------------------------------- 初始化执行

-- 取得固定row行datatype列的单元内容
function ST_GetData(row, datatype)
	local tempdata = ST_FILE:getCell(row, ST_TYPE[datatype])
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end
end

-- 通过datatype列取得data的行数
function ST_GetRow(data, datatype)
	for i=2, ST_ROWCOUNT do
		if (data == ST_GetData(i, datatype)) then
			return i
		end
	end
end

-- 取得某数据的行数和列数(如果表中有重复数据,则取最靠近左上位置的数据)
function ST_GetLoc(data)
	for i=2, ST_ROWCOUNT do
		for j=1, 12 do
			local datax = ST_GetData(i, j)
			if (data == datax) then
				return i, j
			end
		end
	end
end

--============================================================================================== GEARS TABLE ====
-- Gears Table
GT_FILE = new(KTabFile, "\\settings\\藏剑山庄\\gears\\cangjian_gears.txt")			-- 记录每个关卡刷怪点信息的表格
GT_TYPE = {"秈","Ngi b? r韙","S? ki謓","Tr筺g th竔","Lo筰 h譶h o c?","Lo筰 ph? r琲 ra","Lo筰 nh? ph? thu閏",			-- 表头（列名称） 
		   "T? l? r琲30","T? l? r琲40","T? l? r琲50","T? l? r琲60","T? l? r琲70","T? l? r琲80","T? l? r琲90"}
GT_ROWCOUNT = tonumber(GT_FILE:getRow())											-- 表总行数
GT_GEARSPART = {"u", "Th﹏ th?", "Ch﹏", "Kim ho祅", "V? kh?"}
GT_GEARFACTION = {"Thi誹 L﹎ t鬰 gia", "Thi誹 L﹎ t鬰 gia", "Thi誹 L﹎ thi襫 t╪g", "Thi誹 L﹎ v? t╪g", "Л阯g M玭", "Nga My ph藅 gia", "Nga My t鬰 gia", "C竔 Bang T躰h y", "C竔 Bang ? Y", "V? ng o gia", "V? ng t鬰 gia", "Dng M玭 thng K?", "Dng M玭 Cung K?", "Hi謕 чc", "T? чc"}
------------------------------------------------------------------------------------------------ FUNCTION ----
-- 取得固定row行datatype列的单元内容
function GT_GetData(row, datatype)
	local tempdata = GT_FILE:getCell(row, GT_TYPE[datatype])
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end
end

-- 通过datatype列取得data的行数
function GT_GetRow(data, datatype)
	for i=2, GT_ROWCOUNT do
		if (data == GT_GetData(i, datatype)) then
			return i
		end
	end
end

-- 取得某数据的行数和列数(如果表中有重复数据,则取最靠近左上位置的数据)
function GT_GetLoc(data)
	for i=2, GT_ROWCOUNT do
		for j=1, 12 do
			local datax = GT_GetData(i, j)
			if (data == datax) then
				return i, j
			end
		end
	end
end

--新的给东西需求，加在这里吧
function GT_BossGiveNew(name)

	-- 越南2009	三月活动
	if is_march_09_viet_open() == 1 then
		local tDropBag =
		{
			["九把剑"] = 80,
		}

		local nItemNum = tDropBag[name]
		if nItemNum == nil then
			nItemNum = 1
			local nRandom = random(1,100)
			if nRandom <= 30 then
				add_bag_march_09_viet(nItemNum, "藏剑山庄")
			end
		else
			local nOldPlayer = PlayerIndex
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i)
				if PlayerIndex > 0 then
					if GetTask(GS_RECORD_CHANCE) > 1 then
						add_bag_march_09_viet(nItemNum, "藏剑山庄")
					end
				end
			end
			PlayerIndex = nOldPlayer
		end
	end
end

--再再后来的需求，杀死boss后call一个NPC出来
function GT_NewBossDrop(name)
	local tDrop =
	{
		["T鎛g qu秐 ngo筰 vi謓"] = {"L謓h b礽 t鎛g qu秐 ngo筰 vi謓", "L謓h b礽 t鎛g qu秐 ngo筰 vi謓", "\\script\\task\\tasklink\\taskitem.lua"},
		["T鎛g qu秐 n閕 vi謓"] = {"L謓h b礽 t鎛g qu秐 n閕 vi謓", "L謓h b礽 t鎛g qu秐 n閕 vi謓", "\\script\\task\\tasklink\\taskitem.lua"},
		["Чi ti觰 th?"] = {"Vi謙 N? ki誱", "Vi謙 N? ki誱", "\\script\\task\\tasklink\\taskitem.lua"},
		["Чi trang ch?"] = {"Trang ch? kim 蕁", "Trang ch? kim 蕁", "\\script\\task\\tasklink\\taskitem.lua"},
		["Trng l穙 T祅g Ki誱 C竎"] = {"Trng L穙 Ch? Ho祅", "Trng L穙 Ch? Ho祅", "\\script\\task\\tasklink\\taskitem.lua"},
	}
	
	if tDrop[name] == nil then
		return
	end
	
	local nMapID, nX, nY = GetNpcWorldPos(TT_TARGET_Index)
	local nChestIndex = CreateNpc(tDrop[name][1], tDrop[name][2], nMapID, nX - 2, nY - 2)
	SetNpcDeathScript(nChestIndex, tDrop[name][3])
	SetNpcLifeTime(nChestIndex, 5 * 60)		-- 统一NPC存活时间为5分钟
	WriteLog("[T祅g Ki誱 s琻 trang] boss : "..name.."Sau khi nh b筰 CALL ra NPC:"..tDrop[name][1])
end

function GT_GoodDrop(name, level)
	-- boss的新掉落
	if tBOSS_GOOD_DROP[name] == nil then
		return 0
	elseif tBOSS_GOOD_DROP[name][level] == nil then
		return 0
	end
	
	local MAX_RANDOM = 10000
	local nArea = random(0, MAX_RANDOM)
	local nItemIndex = 0
	
	for index, value in tBOSS_GOOD_DROP[name][level] do
		if nArea < value[1] then
			nItemIndex = value[2]
			break
		end
	end
	
	if nItemIndex == 0 then
		return 0
	end
	
	local nChestIndex = CreateNpc("箱子钱", "箱子", GetNpcWorldPos(TT_TARGET_Index))
	SetNpcScript(nChestIndex, SF_FILE)
	
	-- 用到的NPC属性，清零先
	local tNpcAttr = {3, 5}
	for index, value in tNpcAttr do
		local nState = GetUnitCurStates(nChestIndex, value)
		AddUnitStates(nChestIndex, value, (0 - nState))
	end
	
	AddUnitStates(nChestIndex, 5, nItemIndex)
	
	return 1
end

function GT_Drop(name, count, nStage)
	local nZone = TC_GetTeamZone()
	local nStartRow = 0
	local nEndRow = 999999
	local data = 0
	local nLevelCell = MU_Div(TM_GetMinLevel()) + 5
	local nDropTable = {}				-- 记录所有可能掉落的道具（最后从中抽取一定数量可以实际掉落的道具）
	local nDropTableCount = 0			-- 记录所有可能掉落的道具数量

	local nRet = GT_GoodDrop(name, MU_Div(TM_GetMinLevel()) * 10)
	if nRet > 0 then
		return
	end

	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	for i=2, GT_ROWCOUNT + 1 do
		local stage = GT_GetData(i, 1)
		local data = GT_GetData(i, 2)
--		Msg2Player(i.." - "..data.." / "..name.."   "..nStage.." / "..stage.."   "..nStartRow)
		if (data == name) and (nStage == stage) and (nStartRow == 0) then
			nStartRow = i
			nEndRow = i
		end
		if ((data ~= name) or (nStage ~= stage)) and (nStartRow ~= 0) then
			nEndRow = i - 1
			break; 
		end
	end
 	if nStartRow == 0 then
		return
	end
	for i=nStartRow, nEndRow do
		local nRecordState = GetBit(SB_STAGE_RECORD[nZone], GT_GetData(i, 3))
		local nRecordFlag = GT_GetData(i, 4)
		local nRnd = random(1, 1000)
		local nRndEnd = tonumber(GT_GetData(i, nLevelCell))
		local nBingo = 0	
		if (nRecordState == nRecordFlag) and (nRnd <= nRndEnd) then		-- 条件满足则DROP表+1
			nDropTableCount = nDropTableCount + 1
			nDropTable[nDropTableCount] = i
			nBingo = 1
		end	
	end
	if count > nDropTableCount then
		count = nDropTableCount
	end

	local aGearsLevelTable = {5, 7}
	local nGearsLevelTableLen = 2
	local aGearsSlotTable = {103, 100, 101, 102, -1}
	local aWeaponsTable = {3, 5, 8, 0, 1, 1, 3, 2, 10, 8, 0, 5, 9, 2, 9, 10, 6, 4, 0, 7, 11}		-- 门派武器
	local aGearsFactionTable = {1, 2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21}
	local nNpcIndex;
	for i=1, count do
		local nRnd = random(i, nDropTableCount)
		nDropTable[i], nDropTable[nRnd] = nDropTable[nRnd], nDropTable[i]
		local nChestIndex = CreateNpc("箱子钱", "精致的箱子", GetNpcWorldPos(TT_TARGET_Index))
		nNpcIndex = nChestIndex
--		local nChestIndex = CreateNpc("箱子钱", "精致的箱子", GetWorldPos())
		SetNpcDeathScript(nChestIndex, SF_FILE)
		MC_Add2Group(nChestIndex)
		-- 使用 NPC 的属性数据纪录掉落物数据
		-- 1 ：详细类别
		-- 5 ：大类型
		-- 6 ：副类型
		-- 8 ：bit1 - 上锁 / bit2 - 独占
		local nChestState = 0
		local nChestRow = nDropTable[i]
		local nSimData = GT_GetData(nChestRow, 7)
		local aSplitedData, nSplitedDataLen = MU_Split(nSimData, ",")
		local nChestType = aSplitedData[random(1, nSplitedDataLen)]
--		Msg2Player("nSimData: "..nSimData.." nSplitedDataLen: "..nSplitedDataLen.." nChestType: "..nChestType)
		local nGearsFaction = tonumber(nChestType)						-- 如果是套装，表示门派
		local aGearsIndex = {0,0,0}							-- 新装备的编号
		local nIsLocked = 0
		if random(1,100000) <= 10000 then
			nIsLocked = 1
		end			
		------
		local nGearsLevel = tonumber(GT_GetData(nChestRow, 5))		-- 如果是套装，表示等级段
		if nGearsLevel == 0 then									-- 如果是 0 表示随机
			nGearsLevel = aGearsLevelTable[random(1, nGearsLevelTableLen)]
		end
		local nGearsSlot = tonumber(GT_GetData(nChestRow, 6))		-- 表示装备的装备位置
		if nGearsSlot == 0 then
			nGearsSlot = random(1, 5)
		end	
		if tonumber(aSplitedData[1]) == 0 then								-- 随机门派
			nGearsFaction = aGearsFactionTable[random(1, 15)]
		end
		if (nGearsSlot >= 1) and (nGearsSlot <= 4) then				-- 不是武器
			aGearsIndex[2] = aGearsSlotTable[nGearsSlot]
		elseif (nGearsSlot == 5) then								-- 是武器
			aGearsIndex[2] = aWeaponsTable[nGearsFaction]
		end
		if nGearsFaction == 1 then									-- 处理少林的两种武器编号
			nGearsFaction = 2
		end
		aGearsIndex[3] = nGearsFaction*100 + nGearsLevel*10	
		AddUnitStates(nChestIndex, 5, aGearsIndex[1])
		AddUnitStates(nChestIndex, 6, aGearsIndex[2])
		AddUnitStates(nChestIndex, 1, (aGearsIndex[3]-1))
		AddUnitStates(nChestIndex, 8, nIsLocked)			-- 上锁
		WriteLog("#"..GetName().." "..GetWorldPos().."打开箱子"..aGearsIndex[1].." "..aGearsIndex[2].." "..aGearsIndex[3])
	end
end

function GT_GetGearPart(nIndex)
	--Msg2Player("GT_GetGearPart: "..nIndex)
	if nIndex == nil then
		nIndex = 103
	end
	local aTable = {}
	aTable[100] = 2
	aTable[101] = 3
	aTable[102] = 4
	aTable[103] = 1
	aTable[0] = 5
	aTable[1] = 5
	aTable[2] = 5
	aTable[3] = 5
	aTable[5] = 5
	aTable[8] = 5
	aTable[9] = 5
	aTable[10] = 5
	aTable[4] = 5
	aTable[6] = 5
	aTable[7] = 5
	aTable[11] = 5
	return GT_GEARSPART[aTable[nIndex]]
end

function GT_GetGearFaction(nIndex)
--	Msg2Player("GT_GetGearFaction: "..nIndex)
	local nIndex = SB_Div(nIndex, 100)
	local aTable = {}
	aTable[1] = 1
	aTable[2] = 2
	aTable[3] = 3
	aTable[4] = 4
	aTable[6] = 5
	aTable[8] = 6
	aTable[9] = 7
	aTable[11] = 8
	aTable[12] = 9
	aTable[14] = 10
	aTable[15] = 11
	aTable[17] = 12
	aTable[18] = 13
	aTable[20] = 14
	aTable[21] = 15
	return GT_GEARFACTION[aTable[nIndex]]
end

--============================================================================================== TASK CONTENTS ====
-- Task Contents
TC_ZONE_MAX	= 5						-- 记录总组数（相同的场景会开N组）
TB_ZONE_TASKTEMP = 10				-- 在每个人身上的记录自己所在场地的 TaskTemp 索引号
TC_STAGE_Index = {0, 0, 0, 0, 0}	-- 记录当前关卡数，0 表示还没进山庄
TC_STAGE_State = {0, 0, 0, 0, 0}	-- 关卡状态：0~9 还未开始 / 10~19 已经开始 / 20~29 已经完成 （具体细节的值根据不同需求解释）
TC_KILL_Total = {0, 0, 0, 0, 0}		-- 所有关卡总共杀敌数量
TC_KILL_Stage = {0, 0, 0, 0, 0}		-- 当前关卡总共杀敌数量
TC_KILL_KeyGot = {0, 0, 0, 0, 0}	-- 当前关卡能获得的钥匙数量
TC_KILL_Player = {}					-- 玩家每关卡杀敌人数量
TC_TASK_EventCount = {}				-- 任务记数，不同关卡可以有不同的数量和内容的记数值
TC_TASK_Conditions = {}				-- 任务完成条件，对应上面的记数值，不同关卡有不同的解释
TC_TIMER_Count = {0, 0, 0, 0, 0}	-- 总控记时器记数，每一次记数表示一个周期：14秒
TC_TIMER_CountTotal = {0, 0, 0, 0, 0}	-- 总控记时器记数，所有关卡消耗时间
TC_TIMER_StartDate = {0, 0, 0, 0, 0}	-- 关卡开始时间
TC_TIMER_Limit = {128, 128, 128, 128, 128}	-- 记时器周期上限，一个关卡允许的最长时间
TC_TIMER_ALARM = {80, 80, 80, 80, 80, 80, 80, 40, 80}					-- 记时器警报，从这个周期开始每10个周期做一次警报
TC_TIMER_LIMIT_TABLE = {128, 128, 128, 128, 128, 128, 128, 64, 128}		-- 每关卡的时间限制
TC_TIMER_LIMIT_TABLE_UI = {"30:00", "30:00", "30:00", "30:00", "30:00", "30:00", "30:00", "15:00", "30:00"}		-- 每关卡的时间限制的用户界面显示时间（分钟）

------------------------------------------------------------------------------------------------ FUNCTION ----
-- 一些变量的初始化
-- 基本上这里已经不会使用了~~挖哈哈哈啊哈哈
--function TC_Init(nZone, nStage)
--	if nZone == nil then
--		nZone = 1
--		TC_SetTeamZone(nZone)
--	else
--		TC_SetTeamZone(nZone)
--	end
--	if (nStage == nil) or (nStage == 1) then
--		nStage = 1
--		TC_KILL_Total[nZone] = 0	
--		TC_KILL_Player = {}	
--	end
	
--	TC_STAGE_Index[nZone] = nStage
--	TC_STAGE_State[nZone] = 0
--	TC_KILL_Stage[nZone] = 0
--	TC_TASK_EventCount[nZone] = {}
--	TC_TASK_Conditions[nZone] = {}
--	TC_TIMER_Count[nZone] = 0
--	TC_TIMER_Limit[nZone] = TC_TIMER_LIMIT_TABLE[nStage]
--end

-- 设置玩家所在的场地号(仅作为记录,不表示玩家确实在这个场地)
function TC_SetTeamZone(nZone)
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		SetTaskTemp(TB_ZONE_TASKTEMP, nZone)
	end
	PlayerIndex = nOldIndex
end

-- 取得玩家所在场地号的记录(仅作为记录,不表示玩家确实在这个场地)
function TC_GetTeamZone()
	return GetTaskTemp(TB_ZONE_TASKTEMP)
end

-- 刷新一些玩家的杀敌信息,比如杀敌数量的记录,积分获得的记录等(只是临时记录,实际保存在玩家身上会用 TB_AddScore 和 TB_StoreScore)
function TC_RefKilledNpc()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	TC_KILL_Total[nZone] = TC_KILL_Total[nZone] + 1
	TC_KILL_Stage[nZone] = TC_KILL_Stage[nZone] + 1
	if TC_KILL_Player[PlayerIndex] == nil then
		TC_KILL_Player[PlayerIndex] = {}
	end
	if TC_KILL_Player[PlayerIndex][nStage] == nil then
		TC_KILL_Player[PlayerIndex][nStage] = 1
	else
		TC_KILL_Player[PlayerIndex][nStage] = TC_KILL_Player[PlayerIndex][nStage] + 1
	end
	if TB_BONUS_MemberTotal[nZone] == nil then
		TB_BONUS_MemberTotal[nZone] = 0
	end
	TB_BONUS_MemberTotal[nZone] = TB_BONUS_MemberTotal[nZone] + GetUnitCurStates(TT_TARGET_Index, 6)
	if TB_BONUS_Total[nZone] == nil then
		TB_BONUS_Total[nZone] = 0
	end
	TB_BONUS_Total[nZone] = TB_BONUS_Total[nZone] + (GetUnitCurStates(TT_TARGET_Index, 6)/10)
--	Msg2Player("全队累积积分 +"..(GetUnitCurStates(TT_TARGET_Index, 6)/10).." ("..TB_BONUS_Total[nZone]..")")
	return TC_KILL_Player[PlayerIndex][nStage], TC_KILL_Stage[nZone], TC_KILL_Total[nZone], TB_BONUS_MemberTotal[nZone], TB_BONUS_Total[nZone]
end

-- 检查玩家在当前关卡所消耗的时间是否需要发出警告,已经判断超出关卡允许的时间并予以结束关卡
function TC_CheckTimer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	if (TC_TIMER_Count[nZone] >= TC_TIMER_ALARM[nStage]) and (mod(TC_TIMER_Count[nZone], 10) == 0) then
		MU_Msg2Team("关卡限时警告:"..TC_TIMER_Count[nZone].."/"..TC_TIMER_LIMIT_TABLE[nStage])
	end
	if TC_TIMER_Count[nZone] >= TC_TIMER_LIMIT_TABLE[nStage] then
		local a,b,c=GetWorldPos()
		--if (a >= 1011 and a <= 1059) or (a >= 2011 and a <= 2059) or (a >= 3011 and a <= 3059) or (a >= 4011 and a <= 4059) or (a >= 5011 and a <= 5059) then
		--	ClearMapNpc(a)
		--end
		TM_LeaveMap()
		return 1
	end
	return 0
end

--============================================================================================== TEAM MEMBER =============
-- Team Member
TM_MEMBER_MAX = 8								-- 允许的队员数量
TM_MEMBER_Index = {}							-- 记录初始队员
TM_MEMBER_MaxLevel = {30, 30, 30, 30, 30}		-- 记录队员最高等级
------------------------------------------------------------------------------------------------ FUNCTION ----
function TM_Init()
	TM_GetMaxLevel()
end

-- 取得当前队伍中的最高等级,参数 nZone 表示场地,可以省略(以后若没有特殊说明,nZone都表示场地号且都可以缺省)
function TM_GetMaxLevel(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() > TM_MEMBER_MaxLevel[nZone] then
			TM_MEMBER_MaxLevel[nZone] = GetLevel()
		end
	end
	PlayerIndex = nOldIndex
	return TM_MEMBER_MaxLevel[nZone]
end

-- 取得当前队伍中的最低等级
function TM_GetMinLevel()
	local nMinLevel = 99
	local nOldIndex = PlayerIndex
	local nTSize = GetTeamSize()
	if nTSize == 0 then
		return GetLevel()
	end
	for i=1, nTSize do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() < nMinLevel then
			nMinLevel = GetLevel()
		end
	end
	PlayerIndex = nOldIndex
	return nMinLevel
end

-- 记录刚进山庄时队伍里面的成员
function TM_SaveOrgMember(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if TM_MEMBER_Index[nZone] == nil then
		TM_MEMBER_Index[nZone] = {}
	end
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		TM_MEMBER_Index[nZone][i] = GetTeamMember(i)
		TM_MEMBER_Index[nZone][9] = i
	end
	PlayerIndex = nOldIndex
	return TM_MEMBER_Index[nZone][9]			-- 返回初始队员数量
end

-- 通过玩家索引号获得玩家名字(当前玩家的索引号通过直接访问全局变量 PlayerIndex 获得)
function TM_GetMemberName(nIndex)
	local nOldIndex = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	PlayerIndex = nOldIndex
	return sName
end

-- 通过玩家的名字来获得 队伍中 玩家的索引号(只对当前队伍有效果)
function TM_GetMemberIndex(nName, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetName() == nName then
			PlayerIndex = nOldIndex
			return GetTeamMember(i)
		end
	end
	PlayerIndex = nOldIndex
	return 0
end

-- 判断当前玩家是否是队长
function TM_IsCaptain()
	local nIsCaptain = 0								-- 是否是队长
	local nCaptainIndex = GetTeamMember(0)
	if nCaptainIndex == 0 then
		WriteLog("[藏剑山庄]找不到队长"..GetName().." PlayerIndex="..PlayerIndex)
	end
	if nCaptainIndex == PlayerIndex then
		nIsCaptain = 1
	end
	return nIsCaptain
end

-- 判断触发对象是否是玩家,这个的用法比较特殊,比如 对话事件(有目标事件) 和 踩TRAP(无目标事件) 事件都是调用的 LUA 中的 main 函数, 所以 TM_IsPlayer() 为 1 表示是 踩 TRAP 事件,为 0 表示有一个目标,则为 对话事件
function TM_IsPlayer()
	local nIsPlayer = 0
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
	if (TT_TARGET_ModID == "标准男") or (TT_TARGET_ModID == "魁梧男") or (TT_TARGET_ModID == "性感女") or (TT_TARGET_ModID == "娇小女") then
		nIsPlayer = 1
	end
	return nIsPlayer
end

-- 计算并返回队伍中的 男性 与 女性 成员数量
function TM_SexCount()
	local nFemale = 0	-- 女性人数
	local nMale = 0		-- 男性人数
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetSex() == 1 then
			nMale = nMale + 1
		else
			nFemale = nFemale + 1
		end
	end
	PlayerIndex = nOldIndex
	return nMale, nFemale
end

-- 对玩家 离开山庄/离开当前所在nZone 进行处理
-- nIndex 表示对某特定玩家进行处理,如果 此参数缺省,表示对全队进行操作
function TM_LeaveMap(nZone, nIndex)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
--	if not (((GetWorldPos() >= 901) and (GetWorldPos() <= 999)) or (GetWorldPos() == 350)) then
--		return
--	end
	if TC_STAGE_State[nZone] < 30 then
		if TM_IsCaptain() == 1 then
			local a,b,c=GetWorldPos()
			if (a >= 1011 and a <= 1059) or (a >= 2011 and a <=2059) or (a >= 3011 and a <= 3059) or (a >= 4011 and a <= 4059) or (a >= 5011 and a <= 5059) then
				ClearMapNpc(a)
			end
			GM_Rules(1, 1)
			TC_KILL_Total[nZone] = 0
			TC_TIMER_CountTotal[nZone] = 0
			if TM_MEMBER_Index[nZone] == nil then
				TM_MEMBER_Index[nZone] = {}
			end
			if TM_MEMBER_Index[nZone][9] ~= nil then
				for i=1, TM_MEMBER_Index[nZone][9] do
					TC_KILL_Player[TM_MEMBER_Index[nZone][i]] = nil
				end
			else
				TM_MEMBER_Index[nZone] = {}
			end
			TM_MEMBER_Index[nZone] = {}
			
			WriteLog("#Tin t鴆 s? quan l謓h GS_STAGE_USED["..nZone.."] = "..GS_STAGE_USED[nZone].."; PlayerIndex = "..PlayerIndex);
			
			TC_STAGE_State[nZone] = 0
			TC_KILL_Stage[nZone] = 0
			TC_TASK_EventCount[nZone] = {}
			TC_TASK_Conditions[nZone] = {}
			TC_TIMER_Count[nZone] = 0
			TM_MEMBER_MaxLevel[nZone] = 30
			MC_SPWN_Count[nZone] = {}
			MC_SPWN_Limit[nZone] = 150
			TB_BONUS_MemberTotal[nZone] = 0
			TB_BONUS_Total[nZone] = 0
			GS_IsAllowTrade[nZone] = 0
--------------------------
			MC_ClearGroup(0, nZone)
			TT_RemoveTimer()
			TT_RemoveTriggers()
			SetDeathPunish(1)
			if GS_Team2NextStage(nZone, nStage, -1) > 0 then
				GS_STAGE_USED[nZone] = 0
			end
			TC_STAGE_Index[nZone] = 0
			TC_SetTeamZone(0)
			GS_StartFlag = 0
		else
			GM_Rules(1, 0)
			TT_RemoveTriggers(nIndex)
			SetDeathPunish(1)
			GS_Team2NextStage(nZone, nStage, PlayerIndex)
			LeaveTeam()
			SetTaskTemp(TB_ZONE_TASKTEMP, 0)
		end
	end
end

--============================================================================================== TASK TRIGGER ====
-- Task Trigger
TT_TRIGGER_KILLER = 1101										-- 表示 杀怪触发器 的玩家自己定义索引号
TT_TRIGGER_TIMER = 1102											-- 表示 时间触发器 的玩家自己定义索引号
TT_TRIGGER_RECT = 1103											-- 表示 区域触发器 的玩家自己定义索引号
TT_TRIGGER_LOGOUT = 1104										-- 表示 登出触发器 的玩家自己定义索引号

if SERVER_INDEX ~= nil then
	TT_TRIGGER_SortID = 1100 + SERVER_INDEX							-- 得到在触发器配置表中的列数
end

TT_TARGET_Index = 0												-- 事件发生后相关目标NPC的索引号：INTEGER
TT_TARGET_ModID = ""											-- 事件发生后相关目标NPC的模板ID：STRING
TT_TARGET_Name = ""												-- 事件发生后相关目标NPC的显示名：STRING
TT_TARGET_INDEX = 11											-- 事件发生后相关目标NPC的索引号用到的 TASKTEMP 编号
TT_TARGET_MODID = 12											-- 事件发生后相关目标NPC的模板ID用到的 TASKTEMP 编号
TT_TARGET_NAME = 13												-- 事件发生后相关目标NPC的显示名用到的 TASKTEMP 编号
------------------------------------------------------------------------------------------------ FUNCTION ----
function TT_Init(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
end

-- 设置当前玩家在某事件触发后的目标索引号(用于那种对目标的操作不是即时处理的情况,配合 TT_GetTarget() 使用)
function TT_SetTarget(nIndex)
	SetTaskTemp(TT_TARGET_INDEX, nIndex)
end

-- 取得最近一次用 TT_SetTarget 函数保存的目标索引号
function TT_GetTarget()
	return GetTaskTemp(TT_TARGET_INDEX)
end

-- 触发器@开始时间触发器, 这个触发器是挂在队长身上的,作用是作为 整个关卡进程 中的周期时间控制/触发 ,以周期为单位,一个周期 14 秒
function TT_StartTimer(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	TC_TIMER_Count[nZone] = 0
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local nTimerIndex = CreateTrigger(1, TT_TRIGGER_SortID, TT_TRIGGER_TIMER)
	ContinueTimer(nTimerIndex)
	PlayerIndex = nOldIndex
	return nTimerIndex
end

-- 触发器@删除时间触发器
function TT_RemoveTimer(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	RemoveTrigger(GetTrigger(TT_TRIGGER_TIMER))
	PlayerIndex = nOldIndex
end

-- 触发器@开始通用触发器组, 这组触发器是挂在所有队员身上的,每个人的触发器私有,这个触发器组包括了: 杀怪/区域/登陆
function TT_StartTriggers()
	local nZone = TC_GetTeamZone()
	local nTriggerIndex = 0
	TC_TASK_EventCount[nZone] = {}
	TC_TASK_Conditions[nZone] = {}
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		nTriggerIndex = CreateTrigger(0,TT_TRIGGER_SortID,TT_TRIGGER_KILLER)
		nTriggerIndex = CreateTrigger(2,TT_TRIGGER_SortID,TT_TRIGGER_RECT)
		nTriggerIndex = CreateTrigger(1,TT_TRIGGER_SortID,TT_TRIGGER_LOGOUT)
	end
	PlayerIndex = nOldIndex
end

-- 触发器@删除通用触发器组, 这组触发器是挂在所有队员身上的,每个人的触发器私有,这个触发器组包括了: 杀怪/区域/登陆
function TT_RemoveTriggers(nIndex)
	local nOldIndex = PlayerIndex
	if nIndex == nil then
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			RemoveTrigger(GetTrigger(TT_TRIGGER_KILLER))
			RemoveTrigger(GetTrigger(TT_TRIGGER_RECT))
			RemoveTrigger(GetTrigger(TT_TRIGGER_LOGOUT))
		end
	else
		PlayerIndex = nIndex
		RemoveTrigger(GetTrigger(TT_TRIGGER_KILLER))
		RemoveTrigger(GetTrigger(TT_TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TT_TRIGGER_LOGOUT))
	end
	PlayerIndex = nOldIndex
end

-- 分档记步器, 就是一个 Counter ~~这个累加器是用来记录每关卡已经经过的时间周期的,超过上限后会重置
function TT_Stepper(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local STEP_MAX = 8									-- 要保证 8 STEP ，其记步长度必须为 1~8 所有数字的 任意公倍数
	local STEP_LENGTH_MAX = 840							-- 记步长度上限
	if TC_TIMER_Count[nZone] == nil then
		WriteLog("**[藏剑山庄]TC_TIMER_Count[nZone]== nil, nZone == "..nZone)
	else
		if TC_TIMER_Count[nZone] < STEP_LENGTH_MAX then
			TC_TIMER_Count[nZone] = TC_TIMER_Count[nZone] + 1
			return TC_TIMER_Count[nZone]
		else
			TC_TIMER_Count[nZone] = 0
			return "错误:超过最大值，重置记步数。"
		end
	end
end

-- 分档记步器检查器,作用是返回一个是否被整除的信息,用于控制那些多周期执行一次的处理过程
-- step : 被检查的是否能被当前的时间周期整除的数
function TT_StepperChecker(step, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if (type(step) == "number") and (step >= 1) and (step <= 8) then
		return mod(TC_TIMER_Count[nZone], step)
	else
		return "错误:检查数据不正确。"
	end
end

--============================================================================================== MONSTER CREATER ====
-- Monster Creater
MC_SPWN_Count = {}							-- 每个刷新点已经刷出的怪物数量
MC_SPWN_Limit = {150,150,150,150,150}		-- 当前地图允许出现的怪物数量
MC_SPWN_LIMIT_TABLE = {150, 150, 150, 150, 150, 150, 150, 150, 150}		-- 每关卡的最大怪物数量限制
MC_BOSS_POS = {
{"外院总管", "外院总管", 1, 1587, 3238},		-- 1 - Stage 1 boss
{"内院总管", "内院总管", 2, 1657, 3133},			-- 2 - Stage 2 boss
{"大小姐", "大小姐", 3, 1629, 3147},					-- 3 - Stage 3 boss
{"大庄主", "大庄主", 4, 1869, 2895},					-- 4 - Stage 4 boss
{"藏剑阁长老", "藏剑阁长老", 5, 1602, 3193},			-- 5 - Stage 5 boss
{"", "", 0, 0, 0},										-- 6 - Stage 6 boss
{"", "", 0, 0, 0},										-- 7 - Stage 7 boss
{"", "", 0, 0, 0},										-- 8 - Stage 8 boss
{"九绝剑魔", "九绝剑魔", 9, 1567, 3245}}					-- 9 - Stage 9 boss

------------------------------------------------------------------------------------------------ FUNCTION ----
function MC_Init(nZone)
end

-- 将一个单位添加进一个 Group 中(Group 是一个用来记录 NPC INDEX 的对象,把多个NPC INDEX 添加进组后,可以对组进行操作)
function MC_Add2Group(nUnitIndex, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	return AddGroupUnit(nZone, nUnitIndex)
end

-- 将一个NPC INDEX从 Group 中删除,并且删掉NPC的实体本身
-- nLifeTime 表示实际删除实体的时间延迟
function MC_Del4Group(nUnitIndex, nLifeTime, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nLifeTime == nil then
		nLifeTime = 1
	end
	SetNpcLifeTime(nUnitIndex, nLifeTime)
	SetNpcDeathScript(nUnitIndex, "")
	return DelGroupUnit(nZone, nUnitIndex)
end

-- 将一个 Group 中的所有 NPC INDEX 清除,并且删掉所有NPC实体
function MC_ClearGroup(nLifeTime, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nLifeTime == nil then
		nLifeTime = 1
	end
	SetGroupLifeTime(nZone, nLifeTime)
	SetGroupDeathScript(nZone, "")
	return ClearGroup(nZone)
end

-- 根据 cangjian_spawner.txt 表创建一个单位
-- data : 表中的任意一个数据项
-- datatype : 这个数据所在的列的编号
-- nlevel : 表示这个NPC的等级,这个等级将去掉个位数后作为字符串添加到NPC模板名后面
function MC_CreateUnit(data, datatype, nlevel, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nRow = ST_GetRow(data, datatype)
	local nMapID = GetWorldPos()			-- 不同的场地确定不同的 地图 ID
	if nlevel == nil then
		return CreateNpc(ST_GetData(nRow, 6), ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
	else
		nlevel = MU_Div(nlevel) * 10
		sNpcTemp = ST_GetData(nRow, 6)..tostring(nlevel)
		return CreateNpc(sNpcTemp, ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
	end
end

-- 根据 cangjian_spawner.txt 表创建一个指定行的单位
-- sNpctype : 如果不空缺则表示待创建的单位是 sNpctype 指定的 NPC 时才会创建
function MC_CreateUnitByRow(nRow, nlevel, sNpctype, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
--	local nMapID = ST_GetData(nRow, 3) + (nZone * 10) - 10			-- 不同的场地确定不同的 地图 ID
--                   服务器        场地组            关卡
	local nMapID = SF_MAPBASE + (nZone * 10) + ST_GetData(nRow, 3)		-- 不同的场地确定不同的 地图 ID
	if nlevel == nil then
		if (sNpctype == ST_GetData(nRow, 6)) or (sNpctype == nil) then
			return CreateNpc(ST_GetData(nRow, 6), ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))
		end
	else
		nlevel = MU_Div(nlevel) * 10
		sNpcTemp = ST_GetData(nRow, 6)..tostring(nlevel)
--		if ST_GetData(nRow, 7) == "机关" then
--			sNpcTemp = ST_GetData(nRow, 6)
--		end
		if (sNpctype == ST_GetData(nRow, 6)) or (sNpctype == nil) then
			return CreateNpc(sNpcTemp, ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
		end
	end
end

-- 根据 cangjian_spawner.txt 表创建一组 NPC ,这些NPC 不会周期性的创建,只会在每次关卡初始化的时候才会创建(ST_Init() 会计算出每个关卡需要创建的一批NPC)
-- stage : 表示需要创建的第stage关的所有NPC
-- sNpctype : 如果不空缺则表示待创建的单位是 sNpctype 指定的 NPC 时才会创建
function MC_NoSpawnNPCs(stage, level, sNpctype, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if stage == nil then
		stage = TC_STAGE_Index[nZone]
	end
	for i=ST_LMD_INIT[stage][1], ST_LMD_INIT[stage][2] do
		if i ~= 0 then
			MC_Add2Group(MC_CreateUnitByRow(i, level, sNpctype, nZone))
		end
	end
end

-- 根据 cangjian_spawner.txt 表创建一组 NPC ,这些NPC 会周期性的进行创建(ST_Init() 会计算出每个关卡需要创建的一批NPC)
-- stage : 表示需要创建的第stage关的所有NPC
-- sNpctype : 如果不空缺则表示待创建的单位是 sNpctype 指定的 NPC 时才会创建
-- nNoCheck : 如果参数值为 1 表示不进行周期检查,无论在什么周期都回创建(周期检查是检查某个NPC究竟要几个周期才被创建一次的)
function MC_BeSpawnNPCs(stage, level, sNpctype, nZone, nNoCheck)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if stage == nil then
		stage = TC_STAGE_Index[nZone]
	end
	for i=ST_LMD_SPWN[stage][1], ST_LMD_SPWN[stage][2] do
		if i ~= 0 then
			local nSpawnPeriod = ST_GetData(i, 9)
			local nSpawnerCountMax = ST_GetData(i, 12)
			if (TT_StepperChecker(nSpawnPeriod) == 0) or (nNoCheck == 1) then
				if MC_SPWN_Count[nZone][i] == nil then
					MC_SPWN_Count[nZone][i] = 0
				end
				if CountGroupUnit(nZone) < MC_SPWN_Limit[nZone] then
					if MC_SPWN_Count[nZone][i] < nSpawnerCountMax then
						local LastedCreatedUnit = MC_CreateUnitByRow(i, level, sNpctype, nZone)
						MC_Add2Group(LastedCreatedUnit)
						MC_SPWN_Count[nZone][i] = MC_SPWN_Count[nZone][i] + 1
						AddUnitStates(LastedCreatedUnit, 8, 1001)		-- 视野范围设置为大于 1000
					else
						return "错误:地点刷新"..i.."数量超过最大值:"..MC_SPWN_Count[nZone][i].."/"..nSpawnerCountMax
					end
				else
					return "错误:怪物的数量已经达到最大值:"..MC_SPWN_Limit[nZone]
				end
			else
				return "错误：未达到恢复周期"..TT_StepperChecker(nSpawnPeriod).."/"..nSpawnPeriod
			end
		end
	end
end

-- 创建某关的BOSS(通常这个函数不带参数,调用后会创建玩家所在关卡的BOSS)
-- nIndex : 通常是关卡号
-- nCheck : 是否检查等级
function MC_CreateBoss(nIndex, nCheck, nStage, nZone)				-- 生成每关卡的刷新点怪物
	if nIndex == nil then
		nIndex = TC_STAGE_Index[nZone]
	end
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nCheck == nil then
		nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
	else
		nlevel = ""
	end
	local nMapID = GetWorldPos()				-- 获取当前地图ID
	local nBossIndex = CreateNpc(MC_BOSS_POS[nIndex][1]..nlevel, MC_BOSS_POS[nIndex][2], nMapID, MC_BOSS_POS[nIndex][4], MC_BOSS_POS[nIndex][5])
	MC_Add2Group(nBossIndex)
	return nBossIndex
end

--============================================================================================== THE BONUS ====
-- The Bonus
TB_BONUS_TABLE =	{--s1	 s2		s3		s4		s5		s6		s7		s8		s9			-- 不同等级每关卡的队长奖励表
    				{1500,	3000,	4500,	6000,	7500,	0,		0,		9000,	12000   },	-- level 30
    				{3000,	6000,	9000,	12000,	15000,	0,		0,		18000,	21000   },	-- level 40
    				{25000,	32500,	42250,	54925,	71402,	0,		0,		107100,	160000   },	-- level 50
    				{50000,65000,	85000,	108000,	150000,	0,		0,		220000,	320000   },	-- level 60
    				{100000,130000,	170000,	220000,	320000, 0,		0,		500000,	700000  },	-- level 70
    				{200000,260000,	340000,	440000, 600000, 0,		0,		1000000,	1500000  },	-- level 80
    				{300000,390000,	510000, 660000, 900000, 0,		0,		1500000,	2250000  }}	-- level 90
TB_BONUS_CHANCE	= 14				-- 记录队长领奖机会所用到的 TaskTemp 索引号
TB_BONUS_LASTEDGOT = 15				-- 记录队长上次领奖关卡机会用到的 TaskTemp 索引号
TB_BONUS_SCORE = 1801				-- Task 索引号 累计积分（主要影响因素：杀敌人数、消耗时间、关卡）
TB_BONUS_TIME = 1802				-- Task 索引号 共用时间（主要影响因素：消耗时间）
TB_BONUS_RELATION = 1803			-- Task 索引号 友好程度（主要影响因素：杀敌人数、关卡特殊条件）
TB_BONUS_PLAYED = 1804				-- Task 索引号 参与次数（主要影响因素：参与次数）
TB_BONUS_FINISHED = 1805			-- Task 索引号 通关次数（主要影响因素：完全完成次数）
TB_BONUS_STAGE = 1806				-- Task 索引号 闯关数量（主要影响因素：总共完成的单个关卡数量）
TB_BONUS_KILLED = 1807				-- Task 索引号 杀怪数量（主要影响因素：杀怪数量）
TB_BONUS_BECAPTAIN = 1808			-- Task 索引号 队长次数（主要影响因素：作为队长的次数）
TB_BONUS_CAPTAINLEVEL = 1822		-- Task 索引号 通关等级（最短时间通关时的队长等级）
TB_BONUS_CAPTAINTIME = 1823			-- Task 索引号 通关时间
TB_BONUS_MemberTotal = {0, 0, 0, 0, 0}		-- 队员奖励总值
TB_BONUS_Total = {0, 0, 0, 0, 0}			-- 全关卡奖励总值
------------------------------------------------------------------------------------------------ FUNCTION ----
-- 初始化
-- 通常在刚开始的时候调用一次,作用是变量初始化还有设置队长可领奖的次数
function TB_Init(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	if nStage == 1 then
		SetTaskTemp(TB_BONUS_CHANCE, 2)
	end
	SetTaskTemp(TB_BONUS_LASTEDGOT, 0)
	PlayerIndex = nOldIndex
end

-- 设置队长领奖机会
-- 每个关卡完成后队长都可以领取一次奖励,但是所有关卡只有N次机会,这个 N 就是用此函数设置
function TB_SetBonusChance(nChance, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	SetTaskTemp(TB_BONUS_CHANCE, nChance)
	PlayerIndex = nOldIndex
end

-- 取得队长还剩余的领奖机会
function TB_GetBonusChance(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local nChance = GetTaskTemp(TB_BONUS_CHANCE)
	PlayerIndex = nOldIndex
	return nChance
end

-- 设置队长最近一次拿奖品的关卡数
function TB_SetLastedGot(nStage, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	SetTaskTemp(TB_BONUS_LASTEDGOT, nStage)
	PlayerIndex = nOldIndex
end

-- 取得队长最近一次拿奖品的关卡数
function TB_GetLastedGot(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local  nStage = GetTaskTemp(TB_BONUS_LASTEDGOT)
	PlayerIndex = nOldIndex
	return  nStage
end

-- 队长领奖处理
-- 奖励目前包括 金钱/经验
function TB_GetCaptainBonus(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local nChance = GetTaskTemp(TB_BONUS_CHANCE)
	local nStage = GetTaskTemp(TB_BONUS_LASTEDGOT)
	if nChance > 0 then
		if TC_STAGE_Index[nZone] > nStage then
			SetTaskTemp(TB_BONUS_CHANCE, (nChance - 1))
			SetTaskTemp(TB_BONUS_LASTEDGOT, TC_STAGE_Index[nZone])
			local nETRow = MU_Div(GetLevel()) - 2					-- 根据队长等级获取 TB_BONUS_TABLE 表中的行参数
			local nTempBonus = 0
			for i=(nStage + 1), TC_STAGE_Index[nZone] do
				nTempBonus = nTempBonus + TB_BONUS_TABLE[nETRow][i]
			end
			
			local nTeamSize = GetTeamSize()
			local nCaptainExp = floor(nTempBonus / 3)
			local nMemberExp = 0
			if nTeamSize > 1 then
				nMemberExp = floor(nTempBonus / nTeamSize / 3 * 2)
			end
			-- 队长获得经验的1/3
			ModifyExp(nCaptainExp)
			for i=1, GetTeamSize() do
				--其他队员获得剩下的2/3
				PlayerIndex = GetTeamMember(i)
				if PlayerIndex > 0 and PlayerIndex ~= GetTeamMember(0) then
					ModifyExp(nMemberExp)
				end
			end
			PlayerIndex = nOldIndex
			MU_Msg2Team(GetName().."获得队长奖励: 经验 ["..nCaptainExp.."], 和队伍奖励经验["..nMemberExp.."]")
		else
			PlayerIndex = nOldIndex
			Msg2Player("你已经通过这一关了")
		end
	else
		PlayerIndex = nOldIndex
		Msg2Player("副本次数上限了，明天再来吧!")
	end
	PlayerIndex = nOldIndex
	return  nStage
end

-- 全队完成一关卡后的积分分配处理
-- nBonus : 全队待分配积分
--function TB_GetMemberBonus(nBonus, nZone)
--	if nZone == nil then
--		nZone = TC_GetTeamZone()
--	end
--	local nStage = TC_STAGE_Index[nZone]
--	if nBonus == nil then
--		nBonus = TB_BONUS_Total[nZone]
--	end
--	local nSigle_Bonus = (nBonus / (GetTeamSize() * nStage)) * (1 - (TC_TIMER_Count[nZone] / TC_TIMER_LIMIT_TABLE[nStage]))
--	nSigle_Bonus = (nSigle_Bonus * (15 + nStage * 1.5)) / 10
--	local nOldIndex = PlayerIndex
--	for i=1, GetTeamSize() do
--		PlayerIndex = GetTeamMember(i)
--		nSigle_Bonus = GetTask(TB_BONUS_SCORE) + nSigle_Bonus
--		SetTask(TB_BONUS_SCORE, nSigle_Bonus)						-- 奖励积分
--	end
--	PlayerIndex = nOldIndex
--	return nSigle_Bonus
--end

-- 开启每关都有的随机效果的小宝箱
function TB_OpenCommonChest(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nStage = TC_STAGE_Index[nZone]
	local nLevel = MU_Div(TM_GetMinLevel())
	local nETRow = nLevel - 2
	local nChoice = random(1, 25)
	if nChoice == 1 then
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		Earn(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("增加"..nCash.."银币")
	elseif nChoice == 2 then
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		ModifyExp(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("增加"..nCash.."经验")
	elseif nChoice == 3 then
		CastState("state_lost_life_per18",(GetLevel()^0.75),270,1)		-- 15 秒，每半秒扣除一定的HP
		Msg2Player("15秒﹜,每半秒扣除一定的HP")
	elseif nChoice == 4 then
		CastState("state_lost_mana_per18",(GetLevel()^0.85),270,1)		-- 15 秒，每半秒扣除一定的MP
		Msg2Player("15秒﹜,每半秒扣除一定的MP")
	elseif nChoice == 5 then
		CastState("state_perfect_dodge_rate",50,540,1)					-- 30 秒，50%的闪避
		Msg2Player("30秒﹜, 50%的闪避")
	elseif nChoice == 6 then
		CastState("state_life_max_percent_add",25,1080,1)					-- 60 秒，HP增加25%
		Msg2Player("60秒﹜, HP增加25%")
	elseif nChoice == 7 then
		CastState("state_neili_max_percent_add",35,1080,1)				-- 60 秒，MP增加35%
		Msg2Player("60秒﹜, MP增加35%")
	elseif nChoice == 8 then
		CastState("state_attack_rate_percent_add",50,1080,1)				-- 60 秒，命中增加100
		Msg2Player("60秒﹜, 命中增加50%")
	elseif nChoice == 9 then
		CastState("state_critical_hit_rate",25,1080,1)					-- 60 秒，会心增加25
		Msg2Player("60秒﹜, 会心增加25")
	elseif nChoice == 10 then
		CastState("state_attack_speed_add",25,1080,1)						-- 60 秒，攻速增加25%
		Msg2Player("60秒﹜,攻速增加25%")
	elseif nChoice == 11 then
		CastState("state_attack_speed_dec",30,1080,1)						-- 60 秒，攻速降低30%
		Msg2Player("60秒﹜, 攻速降低30%")
	elseif nChoice == 12 then
		CastState("state_move_speed_percent_add",50,1080,1)				-- 60 秒，移动速度增加 50%
		Msg2Player("60秒﹜,移动速度增加50%")
	elseif nChoice == 13 then
		CastState("state_slow",50,1080,1)									-- 60 秒，移动速度降低 50%
		Msg2Player("60秒﹜,移动速度降低50%")
	elseif nChoice == 14 then
--      此功能未生效，临时替换成其他功能
--		CastState("state_maximumattack",100,180,1)						-- 10 秒，外功临时达到最大值
--		Msg2Player("10秒，外功临时达到最大值")
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		Earn(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("增加.."银币")
	elseif nChoice == 15 then
		CastState("state_confusion",100,270,1)							-- 15 秒，临时混乱
		Msg2Player("15秒﹜,临时混乱")
	elseif nChoice == 16 then
		CastState("state_paralysis",100,270,1)							-- 15 秒，临时麻痹
		Msg2Player("15秒﹜,临时麻痹")
	elseif nChoice == 17 then
		CastState("state_sleep",100,360,1)								-- 20 秒，临时睡眠
		Msg2Player("20秒﹜,临时睡眠")
	elseif nChoice == 18 then
		CastState("state_vertigo",100,180,1)								-- 15 秒，临时眩晕
		Msg2Player("15秒﹜,临时眩晕")
	elseif nChoice == 19 then
		CastState("state_burst_enhance_rate",75,1080,1)					-- 60 秒，释放速度增加 75%
		Msg2Player("60秒﹜,释放速度增加75%")
	elseif nChoice == 20 then
		CastState("state_burst_enhance_rate",-25,1080,1)					-- 60 秒，释放速度降低 25%
		Msg2Player("60秒﹜,释放速度降低75%")
	elseif nChoice == 21 then
		CastState("state_p_attack_percent_add",25,1080,1)					-- 60 秒，外功总攻击力比例加成 25%
		Msg2Player("60秒﹜,外功总攻击力比例加成25%")
	elseif nChoice == 22 then
		CastState("state_p_attack_percent_dec",25,1080,1)					-- 60 秒，外功总攻击力比例减少 25%
		Msg2Player("60秒﹜,外功总攻击力比例减少25%")
	elseif nChoice == 23 then
		CastState("state_m_attack_percent_add",25,1080,1)					-- 60 秒，内功总攻击力比例加成 25%
		Msg2Player("60秒﹜,内功总攻击力比例加成25%")
	elseif nChoice == 24 then
		CastState("state_m_attack_percent_dec",25,1080,1)					-- 60 秒，内功总攻击力比例减少 25%
		Msg2Player("60秒﹜,内功总攻击力比例减少25%")
	elseif nChoice == 25 then
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		DoubleExpCount(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("T╪g"..nCash.." 甶觤 kinh nghi謒 nh﹏ i")
	end
end

-- 增加玩家的关卡记分中某项目的值 (记分信息通过使用 AddItem(2,0,212,1) 所获得的道具来查看)
function TB_AddScore(nType, nValue, nIndex)
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if nIndex ~= nil then
			PlayerIndex = nIndex
		end
--- 积分记录
		if (nType == 1) or (nType == "积分记录") then
			SetTask(TB_BONUS_SCORE, GetTask(TB_BONUS_SCORE)+nValue)
--- 时间记录
		elseif (nType == 2) or (nType == "时间记录") then
			SetTask(TB_BONUS_TIME, GetTask(TB_BONUS_TIME)+nValue)
--- 友好记录
		elseif (nType == 3) or (nType == "友好记录") then
			SetTask(TB_BONUS_RELATION, GetTask(TB_BONUS_RELATION)+nValue)
--- 参与次数
		elseif (nType == 4) or (nType == "参与次数") then
			SetTask(TB_BONUS_PLAYED, GetTask(TB_BONUS_PLAYED)+nValue)
--- 通关次数
		elseif (nType == 5) or (nType == "通关次数") then
			SetTask(TB_BONUS_FINISHED, GetTask(TB_BONUS_FINISHED)+nValue)
--- 闯关次数
		elseif (nType == 6) or (nType == "闯关次数") then
			SetTask(TB_BONUS_STAGE, GetTask(TB_BONUS_STAGE)+nValue)
--- 杀怪总数
		elseif (nType == 7) or (nType == "杀怪总数") then
			SetTask(TB_BONUS_KILLED, GetTask(TB_BONUS_KILLED)+nValue)
--- 队长次数
		elseif (nType == 8) or (nType == "队长次数") then
			SetTask(TB_BONUS_BECAPTAIN, GetTask(TB_BONUS_BECAPTAIN)+nValue)
--- 处理完成
		end
		if nIndex ~= nil then
			PlayerIndex = nOldIndex
			return
		end
	end
	PlayerIndex = nOldIndex
end

-- 保存每关玩家的记分信息
function TB_StoreScore()									-- 全队获得关卡奖励
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nRanInt = random(0,14)
	local nOldIndex = PlayerIndex
	local nCaptain = {"", "чi trng"}
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
--- 积分记录
		local nBonus = TB_BONUS_Total[nZone]
		local nSigle_Bonus = (nBonus / (GetTeamSize() * nStage)) * (1.2 - (TC_TIMER_Count[nZone] / TC_TIMER_LIMIT_TABLE[nStage]))
		nSigle_Bonus = (nSigle_Bonus * (15 + nStage * 1.5)) / 10
		nSigle_Bonus = GetTask(TB_BONUS_SCORE) + nSigle_Bonus
		SetTask(TB_BONUS_SCORE, nSigle_Bonus)						-- 奖励积分
--- 时间记录
		local nSigle_Time = GetTask(TB_BONUS_TIME) + (TC_TIMER_Count[nZone]) * 14 - 7 + nRanInt
		SetTask(TB_BONUS_TIME, nSigle_Time)
--- 参与次数
		if nStage == 1 then
			local nSigle_Played = GetTask(TB_BONUS_PLAYED) + 1
			SetTask(TB_BONUS_PLAYED, nSigle_Played)
		end
--- 通关次数
		if nStage == 2 then
			local nSigle_Finished = GetTask(TB_BONUS_FINISHED) + 1
			SetTask(TB_BONUS_FINISHED, nSigle_Finished)
		end
--- 闯关次数
		if (nStage >= 1) and (nStage <= 9) then
			local nSigle_Stage = GetTask(TB_BONUS_STAGE) + 1
			SetTask(TB_BONUS_STAGE, nSigle_Stage)
		end
--- 杀怪总数
		if TC_KILL_Player[PlayerIndex] == nil then
			TC_KILL_Player[PlayerIndex] = {}
		end
		if TC_KILL_Player[PlayerIndex][nStage] == nil then
			TC_KILL_Player[PlayerIndex][nStage] = 0
		end
		local nSigle_Killed = GetTask(TB_BONUS_KILLED) + TC_KILL_Player[PlayerIndex][nStage]
		SetTask(TB_BONUS_KILLED, nSigle_Killed)
--- 队长次数
		if (nStage == 1) and (TM_IsCaptain() == 1) then
			local nSigle_Becaptain = GetTask(TB_BONUS_BECAPTAIN) + 1
			SetTask(TB_BONUS_BECAPTAIN, nSigle_Becaptain)
		end
--- 处理完成
	end
	PlayerIndex = nOldIndex
end

--============================================================================================== GAME STAGES ====
-- Game Stages
GS_STAGE_START = {					-- 藏剑使者开始对话的内容
	MU_GetColoredText("T祅g Ki誱 s琻 trang. S琻 M玭", "gold").."\n дn T祅g Ki誱 s琻 trang u l? nh鱪g anh t礽 k? n? trong giang h?, c? g? th蕋 l? xin lng th?. \n Trang ch? mu鑞 th? t礽 c竎 v?. \n Цnh b筰 25"..MU_GetColoredText("Gia 甶nh", "green").."\n. Цnh b筰"..MU_GetColoredText("T鎛g qu秐 ngo筰 vi謓", "green"),
	MU_GetColoredText("Чi Vi謓. T祅g Ki誱 s琻 trang", "gold").."\n Чi vi謓 do T鎛g qu秐 n閕 vi謓 ph? tr竎h, c? g? c莕 xin ch? v? c? t? nhi猲. \n. "..MU_GetColoredText("????", "green").."\n. Цnh b筰"..MU_GetColoredText("T鎛g qu秐 n閕 vi謓", "green"),
	MU_GetColoredText("H藆 Hoa Vi猲. T祅g Ki誱 s琻 trang", "gold").."\n H藆 Hoa vi猲 kh玭g cho ph衟 ngi ngo礽 ra v祇. C竎 v? ng ch鋍 gi薾 Чi Ti觰 Th?. \n Чi ti觰 th? xinh p nh璶g do t? nh?  theo cha h鋍 v? n猲 t輓h kh? h琲 ng? ngc. \n. Цnh b筰 8"..MU_GetColoredText("L穙 b閏", "green").."\n. Цnh b筰"..MU_GetColoredText("Чi ti觰 th?", "green"),
	MU_GetColoredText("Li猲 Ho祅 S祇. T祅g Ki誱 s琻 trang", "gold").."\n Trong C鰑 Cung t 9 nh l? hng c? ch筸 tr? Tam s綾 k? th筩h, tr穒 qua nhi襲 i 頲 ng璶g k誸 b雐 tia l鯽 v? kh鉯 c ki誱 ? s琻 trang. ng nh譶 v? ngo礽 m? xem thng! Ch? c莕 c? ngi ngang nhi猲 t nh藀 v祇, Tam s綾 k? th筩h s? ph竧 huy ma l鵦. \n . L祄 b?"..MU_GetColoredText("L? hng", "green").."\n. Цnh b筰"..MU_GetColoredText("???", "green"),
	MU_GetColoredText("T祅g Ki誱 C竎. T祅g Ki誱 s琻 trang", "gold").."\n N琲 y  t祅g gi? v? s? 產o ki誱 c? gi? tr? li猲 th祅h. \n c bi謙 l? c竎 lo筰 v? kh? thu閏 h? ng? h祅h. \n R髏 v? kh? ra nh b筰"..MU_GetColoredText("B秓 v? ng? h祅h", "green").."\n V? huynh  n祇 c? th? th? s鴆 \n nh b筰"..MU_GetColoredText("Trng l穙 T祅g Ki誱 C竎", "green"),
	MU_GetColoredText("T祅g Ki誱 s琻 trang. T? Tr骳 L﹎", "gold").."\n Nghe n鉯 ch鑞 n祔 v鑞 l? n琲 tr? ng? c馻 m閠 v? ti猲 nh﹏, t鎛g c閚g 16 phng v?, u c? Kh綾 蕁 ph?, d? v祇 kh? ra. \n N誹 c竎 v? c? th? ra 頲, l穙 phu s? d蒼 阯g n Ki誱 Tr駈g. \n 甶 t譵 v?"..MU_GetColoredText("S? gi? T祅g Ki誱", "green").." i tho筰 .",
	MU_GetColoredText("T祅g Ki誱 s琻 trang. T? Tr骳 L﹎", "gold").."\n Nghe n鉯 ch鑞 n祔 v鑞 l? n琲 tr? ng? c馻 m閠 v? ti猲 nh﹏, t鎛g c閚g 16 phng v?, u c? Kh綾 蕁 ph?, d? v祇 kh? ra. \n N誹 c竎 v? c? th? ra 頲, l穙 phu s? d蒼 阯g n Ki誱 Tr駈g. \n 甶 t譵 v?"..MU_GetColoredText("S? gi? T祅g Ki誱", "green").." i tho筰 .",
	MU_GetColoredText("T祅g Ki誱 s琻 trang. T? Tr骳 L﹎", "gold").."\n Nghe n鉯 ch鑞 n祔 v鑞 l? n琲 tr? ng? c馻 m閠 v? ti猲 nh﹏, t鎛g c閚g 16 phng v?, u c? Kh綾 蕁 ph?, d? v祇 kh? ra. \n N誹 c竎 v? c? th? ra 頲, l穙 phu s? d蒼 阯g n Ki誱 Tr駈g. \n 甶 t譵 v?"..MU_GetColoredText("S? gi? T祅g Ki誱", "green").." i tho筰 .",
	MU_GetColoredText("T祅g Ki誱 s琻 trang. Ki誱 Ch駈g", "gold").."\n Ki誱 Ch駈g 頲 xem l? v飊g c蕀 m藅 c馻 T祅g Ki誱 S琻 Trang, b雐 n琲 y 頲 c蕋 nhi襲 thanh ki誱 qu?. \n . Th竜 5 c﹜"..MU_GetColoredText("Ng? H祅h ki誱", "green").."\n. Цnh b筰"..MU_GetColoredText("C鰑 Tuy謙 Ki誱 Ma", "green")}
GS_STAGE_END = {					-- 藏剑使者结束对话的内容
	MU_GetColoredText("T祅g Ki誱 s琻 trang. S琻 M玭", "gold").."\n Ch骳 m鮪g c竎 v?  vt qua th? th竎h u ti猲, xin chu萵 b? cho th? th竎h ti誴 theo!",
	MU_GetColoredText("Чi Vi謓. T祅g Ki誱 s琻 trang", "gold").."\n Ch骳 m鮪g c竎 v?  vt qua th? th竎h th? 2, xin chu萵 b? cho th? th竎h ti誴 theo!",
	MU_GetColoredText("H藆 Hoa Vi猲. T祅g Ki誱 s琻 trang", "gold").."\n Ch骳 m鮪g c竎 v?  vt qua th? th竎h th? 3, xin chu萵 b? cho th? th竎h ti誴 theo!",
	MU_GetColoredText("Li猲 Ho祅 S祇. T祅g Ki誱 s琻 trang", "gold").."\n Ch骳 m鮪g c竎 v?  vt qua th? th竎h th? 4, xin chu萵 b? cho th? th竎h ti誴 theo!",
	MU_GetColoredText("T祅g Ki誱 C竎. T祅g Ki誱 s琻 trang", "gold").."\n Ch骳 m鮪g c竎 v?  vt qua th? th竎h th? 5, xin chu萵 b? cho th? th竎h ti誴 theo!",
	MU_GetColoredText("T祅g Ki誱 s琻 trang. T? Tr骳 L﹎", "gold").."\n Ch骳 m鮪g c竎 v?  vt qua th? th竎h th? 6, xin chu萵 b? cho th? th竎h ti誴 theo!",
	MU_GetColoredText("T祅g Ki誱 s琻 trang. T? Tr骳 L﹎", "gold").."\n Ch骳 m鮪g c竎 v?  vt qua th? th竎h th? 7, xin chu萵 b? cho th? th竎h ti誴 theo!",
	MU_GetColoredText("T祅g Ki誱 s琻 trang. T? Tr骳 L﹎", "gold").."\n Ch骳 m鮪g c竎 v?  vt qua th? th竎h th? 8, xin chu萵 b? cho th? th竎h ti誴 theo!",
	MU_GetColoredText("T祅g Ki誱 s琻 trang. Ki誱 Ch駈g", "gold").."\n Ch骳 m鮪g c竎 anh h飊g vt 秈 th祅h c玭g! X璦 nay, nhi襲 anh h飊g h秓 h竛 c騨g kh? l遪g qua n鎖. C竎 v? xu蕋 s綾 vt 秈, l藀 n猲 i nghi謕, danh ch蕁 giang h?! L穙 phu h誸 l遪g k輓h ph鬰!!!"}
GS_FORSELECT = {					-- 与藏剑使者对话的选项
"开始进攻/GS_StartStage",
"进入下一个关节/GS_NextStage",
"获得队长奖励",
"购买物资/GS_Trade",
"购买条件/GS_Trade",
"休息一下/GS_ExitSay",
"打开仓库/GS_OpenBox"}
GS_ERRORMSG = {
"你的身上没有英雄帖，是不是忘记带了？",
""}

GS_RECORD_DATE = 1820				-- Task 索引号 每天能进入藏剑的时间记录 
GS_RECORD_CHANCE = 1821				-- Task 索引号 每天能进入藏剑的次数记录
GS_STAGE_USED = {0,0,0,0,0}			-- 记录某组关卡是否已经在使用了
GS_USEDNOTE_IMG = {"<color=green>0<color>", "<color=red>X<color>"}
GS_USEDNOTE_TXT = {" (从未使用过，点击敏捷度)", " (使用中，单击检查状态)"}
GS_ENTERTALK = "这位英雄想去哪里？ \n".."[副本] 第一关 第二关 第三关 第四关 第五关 \n".."[状态]       "..GS_USEDNOTE_IMG[GS_STAGE_USED[1]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[2]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[3]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[4]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[5]+1]..""
GS_MESSENGER_MID = {"Vng An Th筩h", "藏剑使者"}
GS_MESSENGER_STARTPOS = {			-- 藏剑使者在每关开始的时候出现的位置
{1529, 3476}, {1613, 3182}, {1605, 3170}, {1697, 3067}, {1698, 3441}, {1,1}, {1,1}, {1477, 3170}, {1567, 3236}}
GS_MESSENGER_ENDPOS = {				-- 藏剑使者在每关结束的时候出现的位置
{1597, 3216}, {1659, 3128}, {1667, 3104}, {1860, 2899}, {1592, 3180}, {1,1}, {1,1}, {9999, 9999}, {1567, 3236}}
GS_PLAYER_STARTPOS = {				-- 玩家在每关开始的时候出现的位置
{1523, 3481}, {1609, 3188}, {1600, 3177}, {1690, 3073}, {1698, 3451}, {1,1}, {1,1}, {1487, 3169}, {1567, 3246}}

GS_IsAllowTrade = {0, 0, 0, 0, 0}			-- 是否允许购买道具的标记
GS_HERO_TOKEN = {2, 0, 31}					-- 英雄帖
GS_SALE_INDEX = {1,1,1,1,1,1,1,1,1}			-- 每关卡的商店编号
GS_StartFlag = 0
------------------------------------------------------------------------------------------------ FUNCTION ----
function GS_Init(nZone, nStage)
end

function GS_CheckRoute()
	local RouteTable = {};
	local nCount = 1;
	local nRoute = 0;
	local flagInTable = 0;
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		nRoute = GetPlayerRoute();
		for index, value in RouteTable do
			if value == nRoute then
				flagInTable = 1;
				break
			end;
		end;
		if flagInTable == 1 then
			flagInTable = 0;
		else
			RouteTable[nCount] = nRoute;
			nCount = nCount + 1;
		end
	end;
	PlayerIndex = nOldIndex
	return nCount - 1
end;
		

-- 在进入山庄前判断所有队员是否在 襄阳城里
function GS_AreaCheck()
	local nTeamSize = 0
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetWorldPos() == SF_TOWNID then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if GetTeamSize() == nTeamSize and GS_SleepCheck() == 1 then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function GS_DateCheck()
	local nTeamSize = 0
	local nDateDay = tonumber(date("%m%d"))
	local nChance = 500	--进入次数限制
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
--		Msg2Player(GetTask(GS_RECORD_DATE).." / "..nDateDay)
--		Msg2Player(GetTask(GS_RECORD_CHANCE).." / "..nChance)
		if (GetTask(GS_RECORD_DATE) == nDateDay) then
			if (GetTask(GS_RECORD_CHANCE) < nChance) then
				nTeamSize = nTeamSize + 1
			end
		else
			SetTask(GS_RECORD_DATE, nDateDay)
			SetTask(GS_RECORD_CHANCE, 0)
			if (GetTask(GS_RECORD_DATE) == nDateDay) then
				if (GetTask(GS_RECORD_CHANCE) < nChance) then
					nTeamSize = nTeamSize + 1
				end
			end
		end
		if (GetTask(GS_RECORD_DATE) ~= nDateDay) or (GetTask(GS_RECORD_CHANCE) >= nChance) then
			MU_Msg2Team(GetName().."副本进入次数达到上限，明天再来吧！). ["..GetTask(GS_RECORD_CHANCE).."/5]")
		end
	end
	PlayerIndex = nOldIndex
	if (GetTeamSize() == nTeamSize) and (GetTeamSize() > 0) then
		return 1
	else
		return 0
	end
end

function CalcYingXiongTie(nShowMsg)
	local nNeedCount = 0
	local nDateDay = tonumber(date("%m%d"))
	local nOldIndex = PlayerIndex
	local MaxCount = 1
	if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 091206 then
		MaxCount = 5
	end	
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if (GetTask(GS_RECORD_DATE) == nDateDay) then
			if (GetTask(GS_RECORD_CHANCE) >= MaxCount) then
				nNeedCount = nNeedCount + 1
			end
		else
			SetTask(GS_RECORD_DATE, nDateDay)
			SetTask(GS_RECORD_CHANCE, 0)
			if (GetTask(GS_RECORD_DATE) == nDateDay) then
				if (GetTask(GS_RECORD_CHANCE) >= MaxCount) then
					nNeedCount = nNeedCount + 1
				end
			end
		end
		if (GetTask(GS_RECORD_DATE) ~= nDateDay) or (GetTask(GS_RECORD_CHANCE) >= MaxCount) then
			if nShowMsg == 1 then
				MU_Msg2Team(GetName().."今天开放进入的["..GetTask(GS_RECORD_CHANCE).."]时间")
			end
		end
	end
	PlayerIndex = nOldIndex
	return nNeedCount
end

function GS_SleepCheck()
	local nTeamSize = 0
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsSleeping() == 1 then
			MU_Msg2Team(GetName().."不能进入藏剑山庄(正在休息中).")
		else
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if (GetTeamSize() == nTeamSize) and (GetTeamSize() > 0) then
		return 1
	else
		return 0
	end
end

-- 这里是判断玩家是否满足进入山庄的条件
function GS_EnterCheck()
	local GS_TeamLeaderTxt = ""
	local GS_TeamSizeTxt = ""
	local GS_TeamLevelTxt = ""
	local GS_TeamItemTxt = ""
	local GS_TeamDateTxt = ""
	local nCheckPoint = {0, 0, 0, 0, 0, 0, 0}
-------------------------------------
	if TM_IsCaptain() == 1 then
		return 2
	end
end

function GS_EnterTaskTalk()
	local GS_ENTERTASKTALK = "Ta theo l謓h trang ch? n y ngh猲h ti誴 c竎 v? anh h飊g, xin h醝 c? c莕 tr? gi髉 g? kh玭g?"
	if (GetItemCount(2,0,333) == 0) then
		GS_ENTERTASKTALK = GS_ENTERTASKTALK.."Ta c? 1 quy觧 <T祅g Ki誱 Ch?>."
		Msg2Player("Nh薾 頲 1 quy觧 <T祅g Ki誱 Ch?>")
		AddItem(2,0,333,1)
	end
	Say(GS_ENTERTASKTALK, 8, "关于藏剑山庄/GS_EnterTaskTalk_1", 
				 			 "关于英雄帖/GS_EnterTaskTalk_2", 
							 "--这个无法翻译--/GS_EnterTaskTalk_3", 
							 "关于XXX/GS_EnterTaskTalk_4", 
							 "\n进入任务\n /GS_EnterTaskTalk_5",  -- DongTinhNang
							 "获得XXX/get_Award7", 
							 "买什么？/GS_ChangeAHL",
							 "积分兑换/GS_EnterTaskTalk_6",
							 "听说这里有好东西，所以我来看看。/GS_EnterTaskTalk_7")	
end
	function DongTinhNang()
		Talk(1,"","副本暂时关闭，大侠稍后再来！")
	end
	function GS_EnterTaskTalk_1()
		Say("请问你有什么需要帮助吗？",2,"我想问些别的事/GS_EnterTaskTalk","结束对话/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_2()
		Say("英雄贴可以从城里的杂货店买到",2,"我想问些别的事/GS_EnterTaskTalk","结束对话/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_3()
		Say("请问你有什么需要帮助吗？",2,"我想问些别的事/GS_EnterTaskTalk","结束对话/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_4()
		Say("进入藏剑山庄至少需要5个"..SF_TOWNNAME.."50级以上的人并且由队长带队才能进去，每天只有五次机会。",2,"我想问些别的事/GS_EnterTaskTalk","结束对话/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_5()
	--	local nMap = GetWorldPos()
--		if nMap ~= 350 and nMap ~= 100 then
--			Talk(1,"","C竎 h? ch? c? th? v祇 T祅g Ki誱 S琻 Trang t? Tng Dng v? Tuy襫 Ch﹗!")
--			return
--		end
		local nCurDate = tonumber(date("%m%d"))
		local nOldIndex = PlayerIndex
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			
			if GetTask(GS_RECORD_DATE) ~= nCurDate then
				SetTask(GS_RECORD_CHANCE, 0)
				SetTask(GS_RECORD_DATE, nCurDate)
			end
			
			if GetTask(GS_RECORD_CHANCE) >= 7 then
				gf_Msg2Team("今天"..GetName().."去了7次")
				return
			end
		end
		PlayerIndex = nOldIndex
		GS_EnterTask()
	end
	function GS_EnterTaskTalk_6()
		local nScore = GetTask(TB_BONUS_SCORE)
		if nScore < 0 then
			Talk(1,"","异常积分，无法改变奖励！")
			WriteLog("[藏剑使者]"..GetName().."异常积分")
			return
		end
		
		local sTalk = "你现在的积分是<color=gold>"..nScore.."<color>你想要什么奖励？"
		Say(sTalk,9,SB_FormatStr("50级套装",30).."100000积分/GS_TaskReward_1", 
			    SB_FormatStr("70级套装",30).."500000积分/GS_TaskReward_2", 
			    --SB_FormatStr("      血魄",30).."7500积分/GS_TaskReward_3", 
			    --SB_FormatStr("      冰晶",30).."8500积分/GS_TaskReward_4", 
			    SB_FormatStr("10000经验点",30).."1000点积点/#GS_TaskReward_5(1000)",
			    SB_FormatStr("50000经验",30).."5000点积点/#GS_TaskReward_5(5000)",
			    SB_FormatStr("100000经验",30).." 10000点积点/#GS_TaskReward_5(10000)",
			    SB_FormatStr("500000经验",30).."50000点积点/#GS_TaskReward_5(50000)",
			    SB_FormatStr("换一次经验",30).."积分/#GS_TaskReward_5(-1)", 
			    "\n我想问些别的事/GS_EnterTaskTalk",
			    "结束对话/GS_EnterTaskTalk_7")
	end
	
--	local aGearsLevelTable = {3, 5, 7, 10}
--	local nGearsLevelTableLen = 4
--	local aGearsSlotTable = {103, 100, 101, 102, -1}
--	local aWeaponsTable = {3, 5, 8, 0, 1, 1, 3, 2, 10, 8, 0, 5, 9, 2, 9, 10}		-- 门派武器
--	local aGearsFactionTable = {1, 2, 3, 4, 6, 8, 9, 11, 12, 14, 15}	

		function GS_TaskReward_1()
			local nGearIndex = {0,102, 0}
			local nFaction = GetPlayerRoute()
			local nBody = GetBody()
			nGearIndex[3] = nFaction*100 + 50 + nBody
			local nScore = GetTask(TB_BONUS_SCORE)
			--年久失修屏蔽掉偶也干得好
			if nFaction == 23 or nFaction == 29 or nFaction == 30 then
				Talk(1,"","T筰 h? h譶h nh? kh玭g th蕐 l璾 ph竔 c竎 h?  h鋍, n猲 kh玭g c? trang b? n祇 danh cho c竎 h? i");
				return 0;
			end
			if nFaction == 0 then
				Talk(1,"","你还没有加入门派，无法获得奖励！")
			else
				if nScore >= 100000 then
					SetTask(TB_BONUS_SCORE, (nScore-100000))
					AddItem(nGearIndex[1], nGearIndex[2], nGearIndex[3], 1, 1, -1, -1, -1, -1, -1, -1)
					WriteLog("[藏剑使者] "..GetAccount().. " / "..GetName().." :50级套装:"..nGearIndex[1]..nGearIndex[2]..nGearIndex[3]);
				else
					Talk(1,"","你的积分不够")
				end
			end
		end
		function GS_TaskReward_2()
			local nGearIndex = {0,102, 0}
			local nFaction = GetPlayerRoute()
			local nBody = GetBody()
			nGearIndex[3] = nFaction*100 + 70 + nBody
			local nScore = GetTask(TB_BONUS_SCORE)
			--年久失修屏蔽掉偶也干得好
			if nFaction == 23 or nFaction == 29 or nFaction == 30 then
				Talk(1,"","T筰 h? h譶h nh? kh玭g th蕐 l璾 ph竔 c竎 h?  h鋍, n猲 kh玭g c? trang b? n祇 danh cho c竎 h? i");
				return 0;
			end
			if nFaction == 0 then
				Talk(1,"","Ngich璦 gia nh藀 m玭 ph竔, kh玭g th? nh薾 ph莕 thng!")
			else
				if nScore >= 500000 then
					SetTask(TB_BONUS_SCORE, (nScore-500000))
					AddItem(nGearIndex[1], nGearIndex[2], nGearIndex[3], 1, 1, -1, -1, -1, -1, -1, -1)
					WriteLog("[藏剑使者] "..GetAccount().. " / "..GetName().." :70级套装:"..nGearIndex[1]..nGearIndex[2]..nGearIndex[3]);
				else
					Talk(1,"","你的积分不够")
				end
			end
		end
		function GS_TaskReward_3()
			local nScore = GetTask(TB_BONUS_SCORE)
			if nScore >= 7500 then
				SetTask(TB_BONUS_SCORE, (nScore-7500))
				AddItem(2, 0, 334, 1)
			else
				Talk(1,"","你的积分不够")
			end
		end
		function GS_TaskReward_4()
			local nScore = GetTask(TB_BONUS_SCORE)
			if nScore >= 8500 then
				SetTask(TB_BONUS_SCORE, (nScore-8500))
				AddItem(2, 0, 335, 1)
			else
				Talk(1,"","你的积分不够")
			end
		end
		function GS_TaskReward_5(nPoint)
			local nScore = GetTask(TB_BONUS_SCORE)
			if nPoint == -1 then
				SetTask(TB_BONUS_SCORE, 0)
				ModifyExp(nScore * 10)
				WriteLog("[藏剑使者] "..GetAccount().. " / "..GetName().."使用积分"..(nScore * 10).."兑换一次经验")
			elseif nScore >= nPoint then
				SetTask(TB_BONUS_SCORE, (nScore - nPoint))
				ModifyExp(nPoint * 10)
				WriteLog("[藏剑使者] "..GetAccount().. " / "..GetName().."使用积分"..(nPoint * 10).."兑换一次经验")
			else
				Talk(1,"","你的积分不够")
			end
		end
		
	function GS_EnterTaskTalk_7()
		--Talk(1,"","少侠客气了！")
	end


-- 条件满足后让玩家选择场地的界面和控制部分
function GS_EnterTask()
	local sInfo1 = "这位大侠想去哪里?\n"..SF_TOWNNAME..",大侠想去哪里？\n".."[副本]第一关 第二关 第三关 第四关 第五关\n"
	local sInfo2 = "[状态]       "..GS_USEDNOTE_IMG[GS_STAGE_USED[1]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[2]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[3]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[4]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[5]+1].."\n"
	local GS_USEDNOTE_COT = {}
	for i=1, 5 do
		local sStage = TC_STAGE_Index[i]
		if sStage < 1 then
			sStage = "<color=gold>?<color>"
		else
			sStage = "<color=gold>"..sStage.."<color>"
		end
		local sTurn = TC_TIMER_Count[i]
		if sTurn < 1 then
			sTurn = "???"
		elseif sTurn < 10 then
			sTurn = "00"..sTurn
		elseif sTurn < 100 then
			sTurn = "0"..sTurn
		else
			sTurn = sTurn
		end		
		GS_USEDNOTE_COT[i] = sStage..". "..sTurn
	end
	local sInfo3 = "[进度]     "..GS_USEDNOTE_COT[1].."      "..GS_USEDNOTE_COT[2].."      "..GS_USEDNOTE_COT[3].."      "..GS_USEDNOTE_COT[4].."      "..GS_USEDNOTE_COT[5]
	GS_ENTERTALK = sInfo1..sInfo2..sInfo3
	if (GS_EnterCheck() == 2) then
		Say(GS_ENTERTALK, 6, "第一关"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_1", 
					 		 "第二关"..GS_USEDNOTE_TXT[GS_STAGE_USED[2]+1].."/GS_ZoneSelect_2", 
							 "第三关"..GS_USEDNOTE_TXT[GS_STAGE_USED[3]+1].."/GS_ZoneSelect_3", 
							 "第四关"..GS_USEDNOTE_TXT[GS_STAGE_USED[4]+1].."/GS_ZoneSelect_4", 
							 "第五关"..GS_USEDNOTE_TXT[GS_STAGE_USED[5]+1].."/GS_ZoneSelect_5",
							 "下次再来/GS_ExitSay")
--		Say(GS_ENTERTALK, 9, "第一关场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_1", 
--					 		 "第二关场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_12", 
--							 "第三关场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_13", 
--							 "第四关场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_14", 
--							 "第五关场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_15",
--							 "第八关场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_18",
--							 "第九关场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_19",
--							 "第二组场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[2]+1].."/GS_ZoneSelect_2",
--							 "下次再来。/GS_ExitSay")
	end
end
	-- 以下5个是选择不同的选项后的处理
	function GS_ZoneSelect_1()
		if (GS_STAGE_USED[1] == 0) and (GS_EnterCheck() == 2) then
--			local nNeedCount = CalcYingXiongTie(0)
--			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(1, 0)
				MU_Msg2Team("队伍正在进入.. [第一关场地]")
				GS_StartFlag = 1
--			else
--				Msg2Player("没有足够的英雄帖，不能进入副本！")
--			end
		else
			--GS_EnterTask()
			GS_ViewZone(1)
			Msg2Player("不符合进入条件...")
		end
	end
	function GS_ZoneSelect_2()
		if (GS_STAGE_USED[2] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(2, 0)
				MU_Msg2Team("队伍正在进入.. [第二关场地]")
			else
				Msg2Player("没有足够的英雄帖，不能进入副本！")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(2)
			Msg2Player("不符合进入条件...")
		end
	end
	function GS_ZoneSelect_3()
		if (GS_STAGE_USED[3] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(3, 0)
				MU_Msg2Team("队伍正在进入.. [第三关场地]")
			else
				Msg2Player("没有足够的英雄帖，不能进入副本！")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(3)
			Msg2Player("不符合进入条件...")
		end
	end
	function GS_ZoneSelect_4()
		if (GS_STAGE_USED[4] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(4, 0)
				MU_Msg2Team("队伍正在进入.. [第四关场地]")
			else
				Msg2Player("没有足够的英雄帖，不能进入副本！")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(4)
			Msg2Player("不符合进入条件...")
		end
	end
	function GS_ZoneSelect_5()
		if (GS_STAGE_USED[5] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(5, 0)
				MU_Msg2Team("队伍正在进入.. [第五关场地]")
			else
				Msg2Player("没有足够的英雄帖，不能进入副本！")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(5)
			Msg2Player("不符合进入条件...")
		end
	end
--	function GS_ZoneSelect_12()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 1)
--			MU_Msg2Team("队伍传送中…… [场地一关卡二]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end
--	function GS_ZoneSelect_13()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 2)
--			MU_Msg2Team("队伍传送中…… [场地一关卡三]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end
--	function GS_ZoneSelect_14()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 3)
--			MU_Msg2Team("队伍传送中…… [场地一关卡四]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end
--	function GS_ZoneSelect_15()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 4)
--			MU_Msg2Team("队伍传送中…… [场地一关卡五]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end
--	function GS_ZoneSelect_18()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 7)
--			MU_Msg2Team("队伍传送中…… [场地一关卡八]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end
--	function GS_ZoneSelect_19()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 8)
--			MU_Msg2Team("队伍传送中…… [场地一关卡九]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end

	-- 玩家查看已经被使用的场地时的界面显示
	function GS_ViewZone(nZone)
		local sBNum = {"壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖", "0", "??"}
--		local sBNum = {"m閠", "hai", "ba", "b鑞", "Ng? ", "s竨", "b秠", "t竚", "ch輓", "0", "??"}
		local sSNam = {"S琻 m玭", "Чi vi謓", "H藆 hoa vi猲", "Li猲 Ho祅 S祇", "T祅g Ki誱 c竎", "????", "????", "T? Tr骳 l﹎", "Ki誱 Ch駈g", "????", "????"}
		local Temp = TC_STAGE_Index[nZone]
		local Temp2 = ""
		local Temp3 = 0
		if (Temp == nil) then
			Temp = 11
			Temp2 = "?:??"
		elseif (Temp < 1) then
			Temp = 11
			Temp2 = "?:??"
		else
--			Temp2 = TC_TIMER_LIMIT_TABLE[Temp]*14	-- 实际时间显示
--			Temp2 = ((Temp2-mod(Temp2, 60))/60)..":"..mod(Temp2, 60)
			Temp2 = TC_TIMER_LIMIT_TABLE_UI[Temp]	-- 近似整数时间显示
		end
		local sLine1 = "                         M? s? tr薾 a: <color=gold>"..sBNum[nZone].."<color>\n"
		local sLine2 = "                         当前: <color=gold>"..sSNam[Temp].."<color>("..sBNum[Temp]..")\n"
		Temp = TC_TIMER_Count[nZone]*14
		if (Temp < 1) or (Temp == nil) then
			Temp = "?:??"
		else
			Temp = ((Temp-mod(Temp, 60))/60)..":"..mod(Temp, 60)
		end
		local sLine3 = "                         时间到了: <color=gold>"..Temp.."<color>/"..Temp2.."\n"
		if (TM_MEMBER_Index[nZone] == nil) or (TM_MEMBER_Index[nZone][1] == nil) then
			Temp = "??"
			Temp2 = "?"
		else
			Temp = TM_MEMBER_Index[nZone][1]
			local nOldIndex = PlayerIndex
			PlayerIndex = Temp
			Temp = GetName()
			Temp2 = GetLevel()
			Temp3 = GetTeamSize()
			PlayerIndex = nOldIndex
		end
		if Temp3 < 1 then
			Temp3 = "?"
		elseif Temp3 <= 6 then
			Temp3 = "<color=green>"..Temp3.."<color>"
		elseif Temp3 <= 7 then
			Temp3 = "<color=gold>"..Temp3.."<color>"
		else
			Temp3 = "<color=red>"..Temp3.."<color>"
		end
		local sLine4 = "                         队长名字: <color=green>"..Temp.."<color> (级别:"..Temp2..")\n"
		Temp = TM_MEMBER_MaxLevel[nZone]
		Temp = MU_Div(Temp)
		if Temp <= 5 then
			Temp = "<color=green>"..Temp.."<color>"
		elseif Temp <= 7 then
			Temp = "<color=gold>"..Temp.."<color>"
		else
			Temp = "<color=red>"..Temp.."<color>"
		end
		local sLine5 = "                         数量:  "..Temp3.."/<color=red>8<color>\n"
		local sLine6 = "                         难度:  "..Temp.."/<color=red>9<color>\n"
		Temp = TB_BONUS_Total[nZone]
		Temp2 = TC_KILL_Total[nZone]
		if (Temp < 1) or (Temp == nil) then
			Temp = "????"
		elseif Temp <= 25000 then
			Temp = "<color=green>"..Temp.."<color>"
		elseif Temp <= 80000 then
			Temp = "<color=gold>"..Temp.."<color>"
		else
			Temp = "<color=red>"..Temp.."<color>"	
		end
		Temp = SB_Div(Temp, 1)
		local sLine7 = "                         觤 vt 秈:  "..Temp.." (失败次数:"..Temp2..")"
		local sLine8 = ""				
		Say(sLine1..sLine2..sLine3..sLine4..sLine5..sLine6..sLine7, 0)
	end
	
-- 创建每关卡的藏剑使者(通常是缺省所有参数,会根据玩家游戏的进程自动创建需要的藏剑使者)
-- nMode : 0.开始NPC 1.结束NPC
function GS_CreateMessenger(nMode, nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nMode == nil then
		if TC_STAGE_State[nZone] < 10 then
			nMode = 0
		elseif TC_STAGE_State[nZone] >= 20 then
			nMode = 1
		end
	end
--	local nMapID = 890 + (nZone * 10) + nStage		-- 不同的场地\关卡确定不同的 地图 ID
--                   服务器        场地组            关卡
	local nMapID = SF_MAPBASE + (nZone * 10) + nStage		-- 不同的场地确定不同的 地图 ID
	if nMode == 1 then
		local nMsgIndex = CreateNpc(GS_MESSENGER_MID[1], GS_MESSENGER_MID[2], nMapID, GS_MESSENGER_ENDPOS[nStage][1], GS_MESSENGER_ENDPOS[nStage][2])
		SetNpcDeathScript(nMsgIndex, SF_FILE)
		MC_Add2Group(nMsgIndex)
		GM_FightState(0)
	else
		local nMsgIndex = CreateNpc(GS_MESSENGER_MID[1], GS_MESSENGER_MID[2], nMapID, GS_MESSENGER_STARTPOS[nStage][1], GS_MESSENGER_STARTPOS[nStage][2])
		SetNpcDeathScript(nMsgIndex, SF_FILE)
		MC_Add2Group(nMsgIndex)
		GM_FightState(1)
	end	
end

function GS_InitStage(nZone, nStage)
end

-- 与藏剑使者对话@开始关卡时
function GS_Talk4Start(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if TM_IsCaptain() == 1 then							-- 判断是否是队长
		Say(GS_STAGE_START[nStage], 1, GS_FORSELECT[1])
	else
		Talk(1, "", GS_STAGE_START[nStage])
	end
end

-- 与藏剑使者对话@结束关卡时,这里会分配关卡积分
function GS_Talk4End(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	local sGCBonus = GS_FORSELECT[3].."("..TB_GetBonusChance()..")"
	sGCBonus = sGCBonus.."/GS_GetCaptainBonus"
	if TM_IsCaptain() == 1 then							-- 判断是否是队长
--		if GS_IsAllowTrade[nZone] == 1 then
--			Say(GS_STAGE_END[nStage], 4, GS_FORSELECT[2], sGCBonus, GS_FORSELECT[5], GS_FORSELECT[6])
--		else
--			Say(GS_STAGE_END[nStage], 4, GS_FORSELECT[2], sGCBonus, GS_FORSELECT[4], GS_FORSELECT[6])
--		end
		Say(GS_STAGE_END[nStage], 4, GS_FORSELECT[2], sGCBonus, GS_FORSELECT[7], GS_FORSELECT[6])

	else
--		if GS_IsAllowTrade[nZone] == 1 then
--			Say(GS_STAGE_END[nStage], 2, GS_FORSELECT[5], GS_FORSELECT[6])
--		else
--			Say(GS_STAGE_END[nStage], 1, GS_FORSELECT[6])
--		end
		Say(GS_STAGE_END[nStage], 2, GS_FORSELECT[7], GS_FORSELECT[6])
	end
end

-- 与藏剑使者对话@判断是进行 开始对话 还是进行 结束对话(通常是缺省所有参数,会根据玩家游戏的进程自动选择需要对话内容)
function GS_TalkWithMessenger(nMode, nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nMode == nil then
		if TC_STAGE_State[nZone] < 10 then
			nMode = 0
		elseif TC_STAGE_State[nZone] >= 20 then
			nMode = 1
		end
	end
	if (nMode == 1) then
		GS_Talk4End(nZone, nStage)
	else
		GS_Talk4Start(nZone, nStage)
	end
end

-- 关卡正常结束后,开始下一关卡(一般被 GM_NextStageInit 调用,不单独使用)
-- nMode : -1.所有队员返回襄阳 0.所有队员到下一关卡(缺省默认) 1+.表示把当前玩加送回襄阳
function GS_Team2NextStage(nZone, nStage, nMode)
	local nNewWorldResult
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nMode == nil then
		nMode = 0
	end
	if (nStage >= 1) and (nStage < 10) and (nMode == 0) then
--		local nMapID = 890 + nZone * 10 + nStage		-- 不同的场地\关卡确定不同的 地图 ID
--  	                 服务器        场地组            关卡
		local nMapID = SF_MAPBASE + (nZone * 10) + nStage		-- 不同的场地确定不同的 地图 ID
		local nOldIndex = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if (nStage == 1) and (GetWorldPos() == SF_TOWNID) then
				SetDeathPunish(0)
				local a,b,c = GetWorldPos()
				nNewWorldResult = NewWorld(nMapID, GS_PLAYER_STARTPOS[nStage][1], GS_PLAYER_STARTPOS[nStage][2])
--			elseif (nStage ~= 1) and (GetWorldPos() > 900) and (GetWorldPos() < 999) then
			else
				local a,b,c = GetWorldPos()
				nNewWorldResult = NewWorld(nMapID, GS_PLAYER_STARTPOS[nStage][1], GS_PLAYER_STARTPOS[nStage][2])
			end
		end
		PlayerIndex = nOldIndex
	elseif nMode == -1 then
		local nOldIndex = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			local a,b,c = GetWorldPos()
			nNewWorldResult = NewWorld(SF_BACKPOINT[1], SF_BACKPOINT[2], SF_BACKPOINT[3])
		end
		PlayerIndex = nOldIndex
	elseif nMode > 0 then
		local a,b,c = GetWorldPos()
		nNewWorldResult = NewWorld(SF_BACKPOINT[1], SF_BACKPOINT[2], SF_BACKPOINT[3])
	end

	return nNewWorldResult
end

-- 全队传送到指定坐标
function GS_NewWorldTeam(nMap, nX, nY)
		local nOldIndex = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			local a,b,c = GetWorldPos()
			local nNewWorldResult = NewWorld(nMap, nX, nY)
		end
		PlayerIndex = nOldIndex
end

-- 进入下一关卡的选项所调用的过程
function GS_NextStage(nZone)
	local a,b,c=GetWorldPos()
	if a == SF_TOWNID then
		return
	end
	if (a >= 1011 and a <= 1059) or (a >= 2011 and a <=2059) or (a >= 3011 and a <= 3059) or (a >= 4011 and a <= 4059) or (a >= 5011 and a <= 5059) then
		ClearMapNpc(a)
	end
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	TB_StoreScore()
	TC_STAGE_State[nZone] = 30
	GM_NextStageInit()
end

-- 队长领取奖励的选项所调用的过程
function GS_GetCaptainBonus()
	TB_GetCaptainBonus()
end

-- 和藏剑使者进行交易的选项所调用的过程
function GS_Trade(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if GS_IsAllowTrade[nZone] == 1 then
		Sale(GS_SALE_INDEX[TC_STAGE_Index[nZone]])
	else
		local nST = GetTask(TB_BONUS_RELATION)
		if nST <= 100 then
			nST = 10
		elseif  nST <= 200 then
			nST = 5000
		elseif  nST <= 500 then
			nST = 10000
		elseif  nST <= 1000 then
			nST = 15000
		elseif  nST <= 2000 then
			nST = 20000
		elseif  nST <= 5000 then
			nST = 25000
		else
			nST = 30000
		end
		if random(1, 100000) <= nST then
			-- Stage Event Start
			GS_IsAllowTrade[nZone] = 1
			Sale(GS_SALE_INDEX[TC_STAGE_Index[nZone]])
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[10]), 2, 1)
			SetTask(SB_EVENT_STAGE[10], nFlag)
			TB_AddScore(3, random(0, 2))
			TaskTip("触发特殊事件: 通货交易")
			-- Stage Event End
		elseif GetItemCount(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3]) > 0 then
			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], 1)
			GS_IsAllowTrade[nZone] = 1
			Sale(GS_SALE_INDEX[TC_STAGE_Index[nZone]])
		else
			Talk(1, "", GS_ERRORMSG[1])
		end
	end
end

function GS_OpenBox()
	local nST = GetTask(TB_BONUS_RELATION)
	if GetTask(805)==0 then 
		Talk(1,"","你还没有开启仓库，所以你不能使用这个功能。")
		return
	end
	if nST <= 100 then
		nST = 10
	elseif  nST <= 200 then
		nST = 5000
	elseif  nST <= 500 then
		nST = 10000
	elseif  nST <= 1000 then
		nST = 15000
	elseif  nST <= 2000 then
		nST = 20000
	elseif  nST <= 5000 then
		nST = 25000
	else
		nST = 30000
	end
	if random(1, 100000) <= nST then
		-- Stage Event Start
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[10]), 2, 1)
		SetTask(SB_EVENT_STAGE[10], nFlag)
		TB_AddScore(3, random(0, 2))
		TaskTip("触发特殊事件: 打开仓库")
		OpenBox()
		-- Stage Event End
	elseif GetItemCount(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3]) > 0 then
		DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], 1)
		OpenBox()
	else
		Talk(1, "", GS_ERRORMSG[1])
	end
end

function GS_ExitSay()
end

-- 开始一个关卡,包括了关卡所需要的初始化部分
function GS_StartStage()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMaxLevel = TM_GetMaxLevel()
	if GetWorldPos() == SF_TOWNID then
		return
	end
	MC_Del4Group(TT_GetTarget(), 0)
	TC_STAGE_State[nZone] = 10
-----------------------------------------------------------------------------------
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel)
--		MC_NoSpawnNPCs(nStage, nMaxLevel, "看门狗")
--		MC_NoSpawnNPCs(nStage, nMaxLevel, "普通箱子")
--		MC_BeSpawnNPCs(nStage, nMaxLevel, "看门狗", nZone, 1)
		ACT1_BOSS_Index[nZone] = 0
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = 25	-- 出现BOSS需要杀死的护院家丁数量
		TC_TASK_EventCount[nZone][2] = 0
		TC_TASK_EventCount[nZone][3] = 0
		TC_TASK_Conditions[nZone][3] = random(5, 10)	-- 出现 Event：愤怒的家丁 需要杀死的狗的数量
		TC_TASK_Conditions[nZone][4] = random(120, 120)	-- 出现 Event：愤怒的外院总管 需要杀死的人数
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel, "看门狗", nZone, 1)
		ACT2_GotSword[nZone] = 0
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = random(10, 15)	-- 掉落任务道具需要杀死的山庄教头数量
		TC_TASK_Conditions[nZone][2] = TC_TASK_Conditions[nZone][1] + random(15, 20)	-- 必定掉落任务道具需要杀死的山庄教头数量
		local nMapID = GetWorldPos()
--		local nBossIndex = CreateNpc("N閕 qu秐_i tho筰", "T鎛g qu秐 n閕 vi謓", nMapID, 1657, 3133)
		local nBossIndex = CreateNpc("江湖豪杰", "内院总管", nMapID, 1657, 3133)
		MC_Add2Group(nBossIndex)
		SetNpcDeathScript(nBossIndex, SF_FILE)
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		MC_BeSpawnNPCs(nStage, nMaxLevel, "看门狗", nZone, 1)
		ACT3_CalculateOdderTable()
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = 16	-- 刷出所有老女仆需要杀死的护院家丁数量，每10个刷一个女仆
		TC_TASK_EventCount[nZone][2] = 0	-- 记录已经刷到第N个老女仆
		ACT3_Keeper[nZone] = 0				-- 后花园执事是否惊动
		ACT3_Traped[nZone] = 0				-- 踩到花圃的次数
		ACT3_ContrackSent[nZone] = 0		-- 是否已经交还过卖身契约
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel, nil, nZone, 1)
		ACT4_SWITCH_Table[nZone] = {}
		ACT4_SWITCH_Count[nZone] = {0,0,0}
		ACT4_SWITCH_DEBUFF[nZone] = {0,0,0}
		ACT4_SWITCH_TimeLim[nZone] = {999,999,999}
		ACT4_SWITCH_Index[nZone] = {{0,0,0},{0,0,0},{0,0,0}}
		ACT4_BOSS_Spwaned[nZone] = 0
		ACT4_CalculateSwitchTable()
		ACT4_CreateSwitch()
		ACT4_Debuff(0)
		MU_Msg2Team("由于陌生人的入侵，这场战斗被提升到级别。", 1)
		TC_TASK_EventCount[nZone][1] = 0	-- 记录击活的机关数量
		TC_TASK_Conditions[nZone][1] = 0	-- 记录被击活的机关类型
		TC_TASK_EventCount[nZone][2] = 0	-- 记录剑灵的死亡个数
		TC_TASK_Conditions[nZone][2] = 3	-- 记录剑灵的死亡个数需求
		TC_TASK_Conditions[nZone][3] = TC_TIMER_LIMIT_TABLE[nStage]	-- 开启机关的时间限制
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_CreateSword()
		TC_TASK_EventCount[nZone][1] = 0	-- 记录拔剑的个数
		TC_TASK_EventCount[nZone][2] = 1	-- 记录插剑的个数
		TC_TASK_Conditions[nZone][2] = 6	-- 出现BOSS的插剑个数
		ACT5_DROP_ROW[nZone] = 0			-- 记录插剑的 相位类型
		ACT5_CHACUOLE[nZone] = {}			-- 记录插错剑的次数
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel)
		ACT8_CalculatePath()
--		local nMapID = ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][1] - 10 + nZone * 10
		local nMapID = SF_MAPBASE + (nZone * 10) + ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][1]
		local nStartPoint = ACT8_GetSnEIndex(0)
		local nEndPoint = ACT8_GetSnEIndex(1)
--		Msg2Player("开始点："..nStartPoint.."  结束点："..nEndPoint)
		GS_NewWorldTeam(nMapID, ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][2], ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][3])
		local nEndMessenger = CreateNpc("Vng An Th筩h", "S? gi? T祅g Ki誱", nMapID, ACT8_PATH_PortOut[ACT8_GetSnEIndex(1)][2], ACT8_PATH_PortOut[ACT8_GetSnEIndex(1)][3])
		SetNpcDeathScript(nEndMessenger, SF_FILE)
		MC_Add2Group(nEndMessenger)
		TC_STAGE_State[nZone] = 20
		ACT8_CreateLargeChest()
		ACT8_CreateSmallChest()
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		local nMapID = GetWorldPos()
		local nLevel = MU_Div(nMaxLevel)*10
		local aSLoca = {{1505, 3154}, {1473, 3335}, {1612, 3374}, {1677, 3218}, {1589, 3116}}
		local aSName = {"Kim Ki誱 phong kh綾", "M閏 Ki誱 phong kh綾", "Th駓 Ki誱 phong kh綾", "H醓 Ki誱 phong kh綾", "Th? Ki誱 phong kh綾"}
		SWORD_SEALTIME[nZone] = {0,0,0,0,0}
		SWORD_SEALINDEX[nZone] = {0,0,0,0,0}
		SWORD_BOSSSPWANED[nZone] = 0
		for i=1, 5 do
			local nBossIndex = CreateNpc("Ki誱 i"..nLevel, aSName[i], nMapID, aSLoca[i][1], aSLoca[i][2])
			MC_Add2Group(nBossIndex)
			local nCHP = -1*(GetUnitCurStates(nBossIndex, 1) - 1)
			AddUnitStates(nBossIndex, 1, nCHP)
		end
		local nBossIndex = CreateNpc("B祅 Long Tr?", "Ki誱 Ma ng? m?", nMapID, 1567, 3240)
		SWORD_SleepOne[nZone] = nBossIndex
		MC_Add2Group(nBossIndex)
		SetNpcDeathScript(nBossIndex, SF_FILE)
	end
end
--============================================================================================== GAME MAIN ====
------------------------------------------------------------------------------------------------ FUNCTION ----
-- 设置队伍规则
-- nMode : 0.开启规则 1.关闭规则
function GM_Rules(nMode, nEffTeam)
	local nTeamSize = GetTeamSize()
	if nTeamSize <= 1 then
		nTeamSize = 1
	end
	if nEffTeam == nil then
		nEffTeam = 0
	end
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		if GetTeamSize() ~= 0 then
			PlayerIndex = GetTeamMember(i)
		end
		if (nTeamSize == 1) or (nEffTeam == 0) then
			PlayerIndex = nOldIndex
		end
		Msg2Player("Trong quy t綾 b? tr? 秈厖")
		CleanInteractive()						-- 解除互动
--		SetLogoutRV(MU_Inverse(nMode))			-- 中途中断后回城
		SetFightState(MU_Inverse(nMode))		-- 设置为可战斗
		SetCreateTeam(MU_Inverse(nMode))		-- 关闭组队功能
		UseScrollEnable(nMode)					-- 禁止使用回城符
	    InteractiveEnable(nMode)				-- 交互开关，0关闭，1打开
	    StallEnable(nMode)		   				-- 摆摊开关
		ForbitTrade(MU_Inverse(nMode))			-- 禁止交易
		--SetDeathScript("")					-- 设置当前玩家的死亡脚本
		TT_SetTarget(0)
		if (nTeamSize == 1) or (nEffTeam == 0) then
			return
		end
	end
	PlayerIndex = nOldIndex	
end

function GM_FightState(nMode)
	local nTeamSize = GetTeamSize()
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		SetFightState(nMode)		-- 设置为可战斗
	end
	PlayerIndex = nOldIndex	
end

function GM_RecordDate()
	local nTeamSize = GetTeamSize()
	local nDate = tonumber(date("%m%d"))
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if GetTask(GS_RECORD_DATE) == nDate then
			SetTask(GS_RECORD_CHANCE, (GetTask(GS_RECORD_CHANCE)+1))
		else
			SetTask(GS_RECORD_CHANCE, 1)
			SetTask(GS_RECORD_DATE, nDate)
		end
		SetTask(2471, 0)
	end
	PlayerIndex = nOldIndex	
end

-- 队伍进入下一关卡,带初始化部分
function GM_NextStageInit(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	else
		TC_SetTeamZone(nZone)
	end
	if nStage == nil then
		if (TC_STAGE_Index[nZone] == 5) or (TC_STAGE_Index[nZone] == 6) then
			TC_STAGE_Index[nZone] = 8
		else
			TC_STAGE_Index[nZone] = TC_STAGE_Index[nZone] + 1
		end
		nStage = TC_STAGE_Index[nZone]
	else
		nStage = nStage + 1
		TC_STAGE_Index[nZone] = nStage
	end
	SB_STAGE_RECORD[nZone] = 0
	if (nStage == 1) then	
--	if (nStage <= 9) and (GS_StartFlag == 0) then
		GM_Rules(0, 1)
		TC_KILL_Total[nZone] = 0
		TC_TIMER_CountTotal[nZone] = 0
		TC_TIMER_StartDate[nZone] = tonumber(date("%d%H%M%S"))
		if TM_MEMBER_Index[nZone] ~= nil then
			TM_MEMBER_Index[nZone] = nil
		end
		TM_SaveOrgMember(nZone)
		GS_STAGE_USED[nZone] = 1
		
		local nOldIndex = PlayerIndex
		PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
		SetTaskTemp(TB_BONUS_CHANCE, 2)
		SetTaskTemp(TB_BONUS_LASTEDGOT, 0)
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			SCCheckOfflineExp(2)
			if PlayerIndex <= 0 then
				PlayerIndex = nOldIndex
				WriteLog("[藏剑使者] "..GetName().."'s team is somthing wrong.")
			end
		end
		PlayerIndex = nOldIndex
		GM_RecordDate()
	elseif nStage > 9 then
		GM_Rules(1, 1)
		local nOldIndex = PlayerIndex
		PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
		SetTaskTemp(TB_BONUS_CHANCE, 0)
		SetTaskTemp(TB_BONUS_LASTEDGOT, 0)
		TC_TIMER_CountTotal[nZone] = TC_TIMER_CountTotal[nZone] + TC_TIMER_Count[nZone]
		if ((TC_TIMER_CountTotal[nZone]*14) < GetTask(TB_BONUS_CAPTAINTIME)) or (GetTask(TB_BONUS_CAPTAINTIME) == 0) then
			SetTask(TB_BONUS_CAPTAINLEVEL, GetLevel())
			SetTask(TB_BONUS_CAPTAINTIME, (TC_TIMER_CountTotal[nZone]*14+random(-7,7)))
			Msg2Player("创建最短时间记录:等级-"..GetTask(TB_BONUS_CAPTAINLEVEL).."时间-"..GetTask(TB_BONUS_CAPTAINTIME))
		else
			Msg2Player("记录现在用时最短:等级-"..GetTask(TB_BONUS_CAPTAINLEVEL).."时间"..GetTask(TB_BONUS_CAPTAINTIME))
		end
		PlayerIndex = nOldIndex
		TC_KILL_Total[nZone] = 0
		TC_TIMER_CountTotal[nZone] = 0
		for i=1, TM_MEMBER_Index[nZone][9] do
			TC_KILL_Player[TM_MEMBER_Index[nZone][i]] = nil
		end
		TM_MEMBER_Index[nZone] = {}
		GS_STAGE_USED[nZone] = 0
		
		TC_STAGE_State[nZone] = 0
		TC_KILL_Stage[nZone] = 0
		TC_TASK_EventCount[nZone] = {}
		TC_TASK_Conditions[nZone] = {}
		TC_TIMER_Count[nZone] = 0
		TM_MEMBER_MaxLevel[nZone] = 30
		MC_SPWN_Count[nZone] = {}
		MC_SPWN_Limit[nZone] = 150
		TB_BONUS_MemberTotal[nZone] = 0
		TB_BONUS_Total[nZone] = 0
		GS_IsAllowTrade[nZone] = 0
--------------------------
		MC_ClearGroup(0, nZone)
		TT_RemoveTimer()
		TT_RemoveTriggers()
		if GS_Team2NextStage(nZone, nStage, -1) > 0 then
			GS_STAGE_USED[nZone] = 0
		end
		MU_Msg2Team("通关了所有的关卡!队伍的人都回来了。"..SF_TOWNNAME..".")
		TC_STAGE_Index[nZone] = 0
		TC_SetTeamZone(0)		
		GS_StartFlag = 0
		Observer:onTeamEvent(SYSEVENT_CANGJIAN_STAGE_FINISH, nStage)
		return
	end
	TC_KILL_Stage[nZone] = 0
	TC_TASK_EventCount[nZone] = {}
	TC_TASK_Conditions[nZone] = {}
	TC_TIMER_CountTotal[nZone] = TC_TIMER_CountTotal[nZone] + TC_TIMER_Count[nZone]
	TC_TIMER_Count[nZone] = 0
	TM_MEMBER_MaxLevel[nZone] = TM_GetMaxLevel(nZone)
	MC_SPWN_Limit[nZone] = MC_SPWN_LIMIT_TABLE[TC_STAGE_Index[nZone]]
	MC_SPWN_Count[nZone] = {}
	TB_BONUS_MemberTotal[nZone] = 0
	GS_IsAllowTrade[nZone] = 0
	TC_KILL_KeyGot[nZone] = 1
--------------------------
	MC_ClearGroup(0, nZone)
	GS_Team2NextStage(nZone, nStage)

	add_award_ex_0908(nStage);
	
	TC_STAGE_State[nZone] = 0
	GS_CreateMessenger()
--------------------------
	TT_StartTimer(nZone)
	TT_StartTriggers()
	Observer:onTeamEvent(SYSEVENT_CANGJIAN_STAGE_FINISH, nStage)
end

-- ------------------------------------------------------------------------------------------------ <Act III> ----
-- ------------------------------------------------------------------------------------------------ <Act III Function> ----
-- 计算第三关出现不同位置的 老女仆 的随机顺序
function ACT3_CalculateOdderTable(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	ACT3_ODDER_Table[nZone] = {1,2,3,4,5,6,7,8}
	for i=1, 8 do
		local nTempRND = random(i, 8)
		local nTempEXC = ACT3_ODDER_Table[nZone][nTempRND]
		ACT3_ODDER_Table[nZone][nTempRND] = ACT3_ODDER_Table[nZone][i]
		ACT3_ODDER_Table[nZone][i] = nTempEXC
	end
end

-- 创建 老女仆 ,会自动处理 累加器
function ACT3_CreateOdder(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	TC_TASK_EventCount[nZone][2] = TC_TASK_EventCount[nZone][2] + 1
	local nOdderFlag = ACT3_ODDER_Table[nZone][TC_TASK_EventCount[nZone][2]]
	local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
	local nOdderIndex = CreateNpc("老女仆"..nlevel, "老女仆", nMapID, ACT3_ODDER_POS[nOdderFlag][1], ACT3_ODDER_POS[nOdderFlag][2])
	MC_Add2Group(nOdderIndex)
	return nOdderIndex
end

-- ------------------------------------------------------------------------------------------------ <Act IV> ----
-- ------------------------------------------------------------------------------------------------ <Act IV Function> ----
-- 计算第四关的 三种奇石 的随机排布
function ACT4_CalculateSwitchTable(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	ACT4_SWITCH_Table[nZone] = {1,2,3, 2,3,1, 3,1,2}
	for i=1, 9 do
		local nTempRND = random(i, 9)
		ACT4_SWITCH_Table[nZone][nTempRND], ACT4_SWITCH_Table[nZone][i] = ACT4_SWITCH_Table[nZone][i], ACT4_SWITCH_Table[nZone][nTempRND]
	end
--	Msg2Player(ACT4_SWITCH_Table[nZone][1].." "..ACT4_SWITCH_Table[nZone][2].." "..ACT4_SWITCH_Table[nZone][3])
--	Msg2Player(ACT4_SWITCH_Table[nZone][4].." "..ACT4_SWITCH_Table[nZone][5].." "..ACT4_SWITCH_Table[nZone][6])
--	Msg2Player(ACT4_SWITCH_Table[nZone][7].." "..ACT4_SWITCH_Table[nZone][8].." "..ACT4_SWITCH_Table[nZone][9])
end

function ACT4_Debuff(nType)
	local nOldIndex = PlayerIndex
	local nZone = TC_GetTeamZone()
	local aTimes = {ACT4_SWITCH_Count[nZone][1]*60, ACT4_SWITCH_Count[nZone][2]*60, ACT4_SWITCH_Count[nZone][3]*60}
--	Msg2Player(aTimes[1].." "..aTimes[2].." "..aTimes[3])
	if (nType == 0) or (nType == nil) then
		aTimes = {180,180,180}
	end
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nRndEnd = 500
		if ACT4_SWITCH_DEBUFF[nZone][1] == 0 and random(1,1000) <= nRndEnd then
			CastState("state_slow",50,aTimes[1],1)								-- 移动速度降低 50%
		end
		if ACT4_SWITCH_DEBUFF[nZone][2] == 0 and random(1,1000) <= nRndEnd then
			CastState("state_paralysis",100,aTimes[2],1)							-- 临时麻痹
		end
		if ACT4_SWITCH_DEBUFF[nZone][3] == 0 and random(1,1000) <= nRndEnd then
			CastState("state_sleep",100,aTimes[3],1)								-- 临时睡眠
		end
	end
	PlayerIndex = nOldIndex
end

-- 创建所有 奇石
function ACT4_CreateSwitch(nZone, nType)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	for i=1, 9 do
		local nType = ACT4_SWITCH_Table[nZone][i]
		local nSwitchIndex = CreateNpc("隐形人2", ACT4_SWITCH_Name[nType], nMapID, ACT4_SWITCH_POS[i][1], ACT4_SWITCH_POS[i][2])
		ACT4_SWITCH_Count[nZone][nType] = ACT4_SWITCH_Count[nZone][nType] + 1			-- 累计不同种类玉的数量
		ACT4_SWITCH_Index[nZone][nType][ACT4_SWITCH_Count[nType]] = nSwitchIndex
		MC_Add2Group(nSwitchIndex)
		AddUnitStates(nSwitchIndex, 8, i)
--		Msg2Player("CreateSwitch: "..nType.." - "..ACT4_SWITCH_Count[nZone][nType].." - "..ACT4_SWITCH_Index[nZone][nType][ACT4_SWITCH_Count[nType]])
	end
end

-- 创建单类 奇石
function ACT4_RebrithSwitch(nZone, nType)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	ACT4_SWITCH_Count[nZone][nType] = 3
	local aRS_Loc = {0,0,0}
	local nTempInt = 0
	for i=1, 9 do
		if ACT4_SWITCH_Table[nZone][i] == nType then
			nTempInt = nTempInt + 1
			aRS_Loc[nTempInt] = i
		end
	end
	for i=1, 3 do
		local nSwitch = ACT4_SWITCH_Index[nZone][nType][i]
		--local nLoc = ACT4_GetSwitchFlag(nSwitch)
		local nLoc = aRS_Loc[i]
		if nSwitch ~= 0 then
			MC_Del4Group(nSwitch, 0)
		end
--		Msg2Player("Create Switch: "..nType.." "..ACT4_SWITCH_Name[nType].." "..nLoc)
--		Msg2Player("Loc: "..nMapID.." "..ACT4_SWITCH_POS[nLoc][1].." "..ACT4_SWITCH_POS[nLoc][2])
		local nSwitchIndex = CreateNpc("隐形人2", ACT4_SWITCH_Name[nType], nMapID, ACT4_SWITCH_POS[nLoc][1], ACT4_SWITCH_POS[nLoc][2])
		ACT4_SWITCH_Index[nZone][nType][i] = nSwitchIndex
		MC_Add2Group(nSwitchIndex)
		AddUnitStates(nSwitchIndex, 8, nLoc)
	end
end

-- 取得 奇石 的类型
function ACT4_GetSwitchType(nName, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if (nName == nil) or (nName == "<T? Thanh L? hng >") then 
		return 1
	elseif(nName == "<Thanh Lam L? hng >") then 
		return 2
	elseif(nName == "<T? Lam L? hng >") then 
		return 3
	end
	return 0
end

-- 取得 奇石 的位置编号
function ACT4_GetSwitchFlag(nIndex, nZone)
	return GetUnitCurStates(nIndex, 8)
end

-- 创建守护某位置的奇石的守卫NPC  ---已经废弃
--function ACT4_CreateDefender(nFlag, nZone)
--	if nZone == nil then
--		nZone = TC_GetTeamZone()
--	end
--	local nMapID = GetWorldPos()
--	local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
--	local nSoulIndex = CreateNpc("剑灵"..nlevel, "剑灵", nMapID, ACT4_SWITCH_POS[nFlag][1], ----ACT4_SWITCH_POS[nFlag][2])
--	MC_Add2Group(nSoulIndex)
--	for i=1, 4 do
--		local nDefenderIndex = CreateNpc("连环邬守卫"..nlevel, "连环坞守卫", nMapID, --ACT4_SWITCH_DEFENDER[nFlag][i][1], ACT4_SWITCH_DEFENDER[nFlag][i][2])
--		MC_Add2Group(nDefenderIndex)
--	end
--end

-- ------------------------------------------------------------------------------------------------ <Act V> ----
-- ------------------------------------------------------------------------------------------------ <Act V Function> ----
function ACT5_GetSwordFlag(nIndex)
	return GetUnitCurStates(nIndex, 8)
end
function ACT5_Word2Num(nWN)
	if nWN == "Kim ki誱" then
		return 1
	elseif nWN == "M閏 ki誱" then
		return 2
	elseif nWN == "Th駓 ki誱" then
		return 3
	elseif nWN == "H醓 Ki誱" then
		return 4
	elseif nWN == "Th? ki誱" then
		return 5
	elseif nWN == 1 then
		return "Kim ki誱"
	elseif nWN == 2 then
		return "M閏 ki誱"
	elseif nWN == 3 then
		return "Th駓 ki誱"
	elseif nWN == 4 then
		return "H醓 Ki誱"
	elseif nWN == 5 then
		return "Th? ki誱"
	end
	return 0
end
function ACT5_GetDefFlag(nIndex, nZone)
	local nZone = TC_GetTeamZone()
	for i=1, 5 do
		if ACT5_PICKORDER_Table[nZone][i] == nIndex then
			return i
		end
	end
	return 0
end
function ACT5_CreateSword(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	local nOrder_Table = {1,2,3,4,5}
	local nSword_Name = {"Kim ki誱","M閏 ki誱","Th駓 ki誱","H醓 Ki誱","Th? ki誱"}
	for i=1, 5 do
		local nTempRND = random(i, 5)
		local nTempEXC = nOrder_Table[nTempRND]
		nOrder_Table[nTempRND] = nOrder_Table[i]
		nOrder_Table[i] = nTempEXC
	end
--	Msg2Player(nOrder_Table[1].." "..nOrder_Table[2].." "..nOrder_Table[3].." "..nOrder_Table[4].." "..nOrder_Table[5])
	for i=1, 5 do
		local nOrderIndex = nOrder_Table[i]
		local nSwordIndex = CreateNpc("цi tho筰 Ki誱 Уi", nSword_Name[nOrderIndex], nMapID, ACT5_SWORD_PICKPOS[i][1], ACT5_SWORD_PICKPOS[i][2])
		SetNpcDeathScript(nSwordIndex, SF_FILE)
		MC_Add2Group(nSwordIndex)
		local nNewValue = i - GetUnitCurStates(nSwordIndex, 8)
		AddUnitStates(nSwordIndex, 8, nNewValue)
	end	
end
function ACT5_CreateDesk(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	for i=1, 5 do
		local nDeskIndex = CreateNpc("与剑台对话", nMapID, ACT5_SWORD_DROPPOS[i][1], ACT5_SWORD_DROPPOS[i][2])
		SetNpcDeathScript(nDeskIndex, SF_FILE)
		MC_Add2Group(nDeskIndex)
		local nNewValue = i - GetUnitCurStates(nSwordIndex, 8)
		AddUnitStates(nDeskIndex, 8, nNewValue)
	end	
end
function ACT5_CreateDefender(nFlag, sEffc, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nSword_Name = {"隐形人","Th駓 ki誱","H醓 Ki誱","Th? ki誱"}
	local nMapID = GetWorldPos()
	local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
	if TC_STAGE_State[nZone] < 15 then
		if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
			local nDefIndex = CreateNpc(sEffc..nlevel, "保护行动", nMapID, ACT5_SWORD_PICKDEFENDER[nFlag][1][1], ACT5_SWORD_PICKDEFENDER[nFlag][1][2])
			MC_Add2Group(nDefIndex)
		end
		for j=1, 2 do
			for i=2, 6 do
				if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
					local nDefenderIndex = CreateNpc("首席弟子"..nlevel, "山庄弟子", nMapID, ACT5_SWORD_PICKDEFENDER[nFlag][i][1], ACT5_SWORD_PICKDEFENDER[nFlag][i][2])
					MC_Add2Group(nDefenderIndex)
				end
			end
		end
	else
		if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
			local nDefIndex = CreateNpc(nSword_Name[nFlag]..nlevel, "保护行动", nMapID, ACT5_SWORD_DROPDEFENDER[nFlag][1][1], ACT5_SWORD_DROPDEFENDER[nFlag][1][2])
			MC_Add2Group(nDefIndex)
		end
		for j=1, 2 do
			for i=2, 6 do
				if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
					local nDefenderIndex = CreateNpc("首席弟子"..nlevel, "山庄弟子", nMapID, ACT5_SWORD_DROPDEFENDER[nFlag][i][1], ACT5_SWORD_DROPDEFENDER[nFlag][i][2])
					MC_Add2Group(nDefenderIndex)
				end
			end
		end
	end
end

-- ------------------------------------------------------------------------------------------------ <Act VIII> ----
-- ------------------------------------------------------------------------------------------------ <Act VIII Function> ----
function ACT8_CalculatePath(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local PATH_Pointer = {}
	local TP_COMMON = {{1, 2, 3},{1, 3, 2},{2, 1, 3},{2, 3, 1},{3, 1, 2},{3, 2, 1}}
	local TP_START = {{3, 2, 1},{2, 3, 1},{3, 1, 2},{1, 3, 2}}
	local TP_END = {{1, 3, 2},{2, 3, 1},{3, 2, 1},{3, 1, 2}}
	local GroupPath = {{1, 2, 3},{1, 2, 3},{1, 2, 3},{1, 2, 3}}
	local GroupPathLink = {1, 2, 3, 4}
	local GroupStart = random(1, 4)
	GroupPathLink[GroupStart] = 1
	local GroupEnd = GroupPathLink[random(2, 4)]
	GroupPathLink = {1, 2, 3, 4}
	for i=1, 4 do
		local nTempRND = random(i, 4)
		local nTempEXC = GroupPathLink[nTempRND]
		GroupPathLink[nTempRND] = GroupPathLink[i]
		GroupPathLink[i] = nTempEXC
	end
	for i=1, 4 do
		if i == GroupStart then
			local nTempRND = random(i, 4)
			for j=1, 3 do
				GroupPath[i][j] = TP_START[nTempRND][j]
			end
		elseif i == GroupEnd then
			local nTempRND = random(i, 4)
			for j=1, 3 do
				GroupPath[i][j] = TP_END[nTempRND][j]
			end
		else
			local nTempRND = random(i, 6)
			for j=1, 3 do
				GroupPath[i][j] = TP_COMMON[nTempRND][j]
			end
		end	
	end
	local nCurGroup = 0
	local nPreGroup = 0
	local nNextGroup = 0
	local nTempINT = 0
	for i=1, 4 do
		for j=1, 4 do
			if i == GroupPathLink[j] then
				nCurGroup = j
			end
		end
		nPreGroup = nCurGroup - 1
		nNextGroup = nCurGroup + 1
		if nPreGroup == 0 then
			nPreGroup = 4
		end
		if nNextGroup == 5 then
			nNextGroup = 1
		end
		local nCurGroupIndex = (GroupPathLink[nCurGroup]-1)*3
		local nPreGroupIndex = (GroupPathLink[nPreGroup]-1)*3
		local nNextGroupIndex = (GroupPathLink[nNextGroup]-1)*3
		PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][1]] = nPreGroupIndex+GroupPath[GroupPathLink[nPreGroup]][2]
		PATH_Pointer[nPreGroupIndex+GroupPath[GroupPathLink[nPreGroup]][2]] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][1]
		PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][2]] = nNextGroupIndex+GroupPath[GroupPathLink[nNextGroup]][1]
		PATH_Pointer[nNextGroupIndex+GroupPath[GroupPathLink[nNextGroup]][1]] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][2]
		if i == GroupStart then
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = 0
		elseif i == GroupEnd then
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = 17
		else
			local nBonusPos = 13 + nTempINT * 2
			nTempINT = nTempINT + 1
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = nBonusPos
			PATH_Pointer[nBonusPos] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]
			PATH_Pointer[nBonusPos+1] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]
		end
	end
	ACT8_PATH_Pointer[nZone] = {}
	for i=1, 16 do
		ACT8_PATH_Pointer[nZone][i] = PATH_Pointer[i]
--		if PATH_Pointer[i] == nil then
--			if i < 10 then
--				Msg2Player("#0"..i.." TARGET: nil")
--			else
--				Msg2Player("#"..i.." TARGET: nil")
--			end
--		else
--			if i < 10 then
--				Msg2Player("#0"..i.." TARGET: #"..ACT8_PATH_Pointer[nZone][i])
--			else
--				Msg2Player("#"..i.." TARGET: #"..ACT8_PATH_Pointer[nZone][i])
--			end
--		end
	end
end
function ACT8_GetSnEIndex(nMode)
	local nZone = TC_GetTeamZone()
	if nMode == nil then
		nMode = 0
	end
	for i=1,16 do
		if (nMode == 0) and (ACT8_PATH_Pointer[nZone][i] == 0) then
			return i
		elseif (nMode == 1) and (ACT8_PATH_Pointer[nZone][i] == 17) then
			return i
		end
	end
end
function ACT8_GetTPTIndex()
	m,x,y = GetWorldPos()
	for i=1, 16 do
		if MU_Distance(1,x,y,1,ACT8_PATH_PortIn[i][2],ACT8_PATH_PortIn[i][3]) < 6 then
			return i
		end
	end
	return 0
end
function ACT8_CreateLargeChest()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nRandomTable = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18}
	local nMapID = GetWorldPos()
	for i=1, 10 do
		local nTempRND = random(i, 18)
		local nTempEXC = nRandomTable[nTempRND]
		nRandomTable[nTempRND] = nRandomTable[i]
		nRandomTable[i] = nTempEXC
	end
	for i=1, 10 do
		local nChestIndex = CreateNpc("Rng v藅 ph萴-cao", "Ho祅g Kim b秓 rng", nMapID, ACT8_CHEST_L_Pos[nRandomTable[i]][1], ACT8_CHEST_L_Pos[nRandomTable[i]][2])
		MC_Add2Group(nChestIndex)
	end
end
function ACT8_CreateSmallChest()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nRandomTable = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}
	local nMapID = GetWorldPos()
	if ACT8_CHEST_StoreIndex[nZone] == nil then
		ACT8_CHEST_StoreIndex[nZone] = {}
	end
	for i=1, 8 do
		local nTempRND = random(i, 16)
		local nTempEXC = nRandomTable[nTempRND]
		nRandomTable[nTempRND] = nRandomTable[i]
		nRandomTable[i] = nTempEXC
		ACT8_CHEST_StoreIndex[nZone][i] = 0
	end
	for i=1, 8 do
		local nChestIndex = CreateNpc("Rng v藅 ph萴-trung", "Rng b筩", nMapID, ACT8_CHEST_S_Pos[nRandomTable[i]][1], ACT8_CHEST_S_Pos[nRandomTable[i]][2])
		SetNpcLifeTime(nChestIndex, 300)
		ACT8_CHEST_StoreIndex[nZone][i] = nChestIndex
		MC_Add2Group(nChestIndex)
	end
end
function ACT8_DelSmallChest()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	for i=1, 16 do
		if ACT8_CHEST_StoreIndex[nZone] ~= nil then
			if (ACT8_CHEST_StoreIndex[nZone][i] ~= 0) or (ACT8_CHEST_StoreIndex[nZone][i] ~= nil) then
				SetNpcLifeTime(ACT8_CHEST_StoreIndex[nZone][i], 0)
			end
		end
	end
end

function viet_0909_aword(nStage)
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 090918 and nDate < 091026 then
		if GetTask(GS_RECORD_CHANCE) <= 1 then return end;
		---收费进入
		local szLogTitle = "[Hoat dong trung thu 2009]";
		local nRetCode = 0;
		local nOldPlayer = PlayerIndex;
		if nStage == 1 then										--进入第一关卡
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				if PlayerIndex > 0 then
					nRetCode = AddItem(2, 1, 30106, 30);			
					if nRetCode == 1 then
						Msg2Player("大侠收到了30份面粉");
					else
						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."]得了三十个面粉后再来治疗= "..nRetCode);
					end
				end
			end
			PlayerIndex = nOldPlayer;
		elseif nStage == 2 then 							--通关第一关卡
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				if PlayerIndex > 0 then
					nRetCode = AddItem(2, 1, 30106, 30);			
					if nRetCode == 1 then
						Msg2Player("大侠收到了30份面粉");
					else
						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."]得了30个面粉后再来治疗= "..nRetCode);
					end
				end
			end
			PlayerIndex = nOldPlayer;
		elseif nStage == 5 then 							--通关第四关卡
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				if PlayerIndex > 0 then
					nRetCode = AddItem(2, 1, 30106, 60);			
					if nRetCode == 1 then
						Msg2Player("大侠收到了60份面粉");
					else
						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."]得了60个面粉后再来治疗= "..nRetCode);
					end
				end
			end
			PlayerIndex = nOldPlayer;
		end
	end
end

--09年8月藏剑调整奖励给予
function add_award_ex_0908(nStage)
	if nStage <= 1 then--进入第一关没奖励
		return 0;
	end
	if nStage == 8 then
		nStage = 6;
	end
	if nStage == 9 then
		nStage = 7;
	end
	local nRand = random(1, GetTeamSize());
	local nOldPlayer = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then			
			if IsPlayerDeath() == 0 then
				local nRate = 1;
				local nLevel = floor(GetLevel() / 10);
				local nNumVuotAi = GetTask(GS_RECORD_CHANCE)
				if nStage == 66 then nRate = 5 end
				if i == nRand and random(1, 100) <= nRate and GetLevel() >= 70 and (nStage == 6 or nStage == 66) then
					AddItem(2, 1, 30115, 1);--给藏剑令			
					Msg2Player("你得到了一个给藏剑令");							
					WriteLogEx("Tang Kiem", "得到", 1, "藏剑令");
				end
				--Modify by Trungbt
				if nNumVuotAi >= 2 then
					if nStage > 7 then
						local nExp_more = 5000000
						ModifyExp(nExp_more) --ph莕 thng 5 tri謚 khi vt 秈 th祅h c玭g thu ph?
						Msg2Player("获得 "..nExp_more.."经验");		
						Earn(390000)
					end
				end
				if nStage == 5 then
					gf_WriteLogEx("Tang Kiem", "tham gia vt 秈", 1, "S? l莕 vt 秈 4 th祅h c玭g l莕"..nNumVuotAi.."_"..nLevel.."x")
				elseif nStage >= 7 then
					gf_WriteLogEx("Tang Kiem", "tham gia vt 秈", 1, "S? l莕 vt 秈 7 th祅h c玭g l莕"..nNumVuotAi.."_"..nLevel.."x")
				end
			
				--
				if nLevel >= 5 then
					local nExp = 0;
					if nStage == 66 then
						if GetTask(GS_RECORD_CHANCE) > 1 then
							nExp = tNEW_AWARD_EX_STAGE_7_2[nLevel];
						else
							nExp = tNEW_AWARD_EX_STAGE_7_NEW[nLevel];	
							Msg2Player("你可以免费完成七次")						
						end
						-- nhi謒 v? l祄 gi祏
						if CFG_NhiemVuLamGiau == 1 then	
								if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 3) == 0 then
									gf_SetTaskBit(TSK_LAMGIAU, 3, 1, 0)
									TaskTip("Ho祅 th祅h nhi謒 v? l祄 gi祏:完成任务")
								end
						end
					else
						if GetTask(GS_RECORD_CHANCE) > 1 then
							nExp = tNEW_AWARD_EX_2[nStage - 1][nLevel];
						else
							nExp = tNEW_AWARD_EX[nStage - 1][nLevel];
						end
					end
					ModifyExp(nExp);
					Msg2Player("你得到了 "..nExp.."经验");					
					WriteLogEx("获得", "奖励", nExp, "经验");
				end
			end
		end
		--其他奖励汇总
		aw_cjsz_award(nStage);
	end
	PlayerIndex = nOldPlayer;
end

-- Mua anh H飊g Thi誴
function GS_ChangeAHL()
	if gf_Judge_Room_Weight(10,20)~= 1 or GetItemCount(2,1,30230) < 20 then
		Talk(1,"","--未翻译--提示:检查背包忘带了什么物品（20个）还是背包已满了。")
		return	
	end
	if DelItem(2,1,30230,20) == 1 then
		gf_AddItemEx2({2,0,31,1}, "T祅g Ki誱 Anh H飊g Thi誴", "Tang Kiem Son Trang", "nh薾")
	end
end

function get_Award7()
	if gf_Judge_Room_Weight(5,20)~= 1 then
		Talk(1,"","你的背包空间不够或重量超标了")
		return	
	end
	local nNumVuotAi = GetTask(GS_RECORD_CHANCE)
	if nNumVuotAi == 7 then
		Earn(1000000)
		AddItem(2,1,30230, 10) --Xu v藅 ph萴
		AddItem(2,0,398, 2) --B竧 nh? l韓
		AddItem(2,1,30497, 10) --Ma tinh
		local nExp_more2 = 10000000
		ModifyExp(nExp_more2) --ph莕 thng 10 tri謚 khi vt 秈 th祅h c玭g thu ph?
		Msg2Player("获得 "..nExp_more2.."经验");		
		gf_WriteLogEx("Tang Kiem", "领取奖励成功", 1, "完成7次")
		SetTask(GS_RECORD_CHANCE, 100) --settask cho kh竎 gi? tr? 7, qua ng祔 t? reset
		--=============== Chu鏸 nhi謒 v? Ph鬰 Sinh 2 =============
		if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 22 and PhucSinh2_GetMissionPart() > 0 then
			PhucSinh2_SetMissionPart()
		end
		--====================================================
	else
		Talk(1,"","Чi hi謕 ch璦 tham gia  7 l莕 Vt 秈 T祅g Ki誱 !!!!")
		return
	end
end
