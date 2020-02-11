
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
	"\\script\\²Ø½£É½×¯\\task_script\\³É¶¼\\²Ø½£Ê¹Õß.lua",
	"\\script\\²Ø½£É½×¯\\task_script\\ãê¾©\\²Ø½£Ê¹Õß.lua",
	"\\script\\²Ø½£É½×¯\\task_script\\ÈªÖÝ\\²Ø½£Ê¹Õß.lua",
	"\\script\\²Ø½£É½×¯\\task_script\\ÏåÑô\\²Ø½£Ê¹Õß.lua",
	"\\script\\²Ø½£É½×¯\\task_script\\ÑïÖÝ\\²Ø½£Ê¹Õß.lua"
}

--°´ÁÐ´Ó×óµ½ÓÒ£ºÊÇ·ñÇø·ÖÌåÐÍ£¬ÎïÆ·Ãû³Æ£¬´óÀà£¬¸±Àà£¬ÏêÏ¸Àà±ð
tGOOD_DROP_ITEM = 
{
	[1] = {1, "Tæng Qu¶n khè", 0, 101, 91},
	[2] = {1, "Tæng Qu¶n Ngo¹i trang", 0, 100, 91},
	[3] = {0, "TiÓu Th­ Giíi ChØ", 0, 102, 36},
	[4] = {1, "Trang Chñ m·o", 0, 103, 91},
	[5] = {0, "Tr­ëng L·o ChØ Hoµn", 0, 102, 37},
	[6] = {0, "Tµng KiÕm B¶o Ch©u", 0, 102, 38},
	[7] = {0, "Tµng KiÕm Kú Th¹ch", 0, 102, 39},
	[8] = {1, "Tµng KiÕm Tö Kim m·o", 0,103,95},
	[9] = {1, "Kim Lò Th­êng", 0,100,95},
	[10] = {1, "Tµng KiÕm ¤ kim phôc", 0,101,95},
	[11] = {0, "Tµng KiÕm Kim Ên", 0,102,40},
}

tBOSS_GOOD_DROP =
{
	["Tæng qu¶n ngo¹i viÖn"] = {
		[70] = {{100, 1}},
		[80] = {{120, 1}},
		[90] = {{160, 1}},
	},
		
	["Tæng qu¶n néi viÖn"] = {
		[70] = {{100, 2}},
		[80] = {{120, 2}},
		[90] = {{160, 2}},
	},
	
	["§¹i tiÓu th­"] = {
		[70] = {{100, 3}},
		[80] = {{120, 3}},
		[90] = {{160, 3}},
	},
		
	["§¹i trang chñ"] = {
		[70] = {{100, 4}},
		[80] = {{120, 4}},
		[90] = {{160, 4}},
	},
	
	["Tr­ëng l·o Tµng KiÕm C¸c"] = {
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
		
	["Cöu TuyÖt KiÕm Ma"] = {
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
SF_TOWNNAME_SVR = {"Thµnh §«","BiÖn Kinh","TuyÒn Ch©u","T­¬ng D­¬ng","D­¬ng Ch©u"}
SF_BACKPOINT_SVR = {			-- ÒâÍâÖÐ¶ÏºóÍæ¼Ò·µ»ØµÄµØµã
{300,1776,3704},
{200,1229,2763},
{100,1510,3107},
{350,1395,2852},
{150,1745,3120}}
SF_FILE = ""		-- ²»Í¬·þÎñÆ÷ÐèÒªÐÞ¸Ä´Ë´¦Ö¸ÏòÊµ¼ÊÎÄ¼þ
SF_TOWNID = 350
SF_TOWNNAME = "T­¬ng D­¬ng"
SF_BACKPOINT = {350, 1397, 2852}
SF_MAPBASE = 1000
--09Äê8ÔÂ²Ø½£µ÷ÕûÐÂÔö½±Àø
tNEW_AWARD_EX = {
	{--µÚÒ»¹Ø
		[5] = 15000,
		[6] = 60000,
		[7] = 75000,
		[8] = 90000,
		[9] = 105000,
	},
	{--µÚ¶þ¹Ø
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--µÚÈý¹Ø
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--µÚËÄ¹Ø
		[5] = 30000,
		[6] = 120000,
		[7] = 150000,
		[8] = 180000,
		[9] = 210000,
	},
	{--µÚÎå¹Ø
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
	{--µÚÁù¹Ø
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
};

tNEW_AWARD_EX_2 = {
	{--µÚÒ»¹Ø
		[5] = 15000,
		[6] = 60000,
		[7] = 75000,
		[8] = 90000,
		[9] = 105000,
	},
	{--µÚ¶þ¹Ø
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--µÚÈý¹Ø
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--µÚËÄ¹Ø
		[5] = 2100000,
		[6] = 2300000,
		[7] = 2500000,
		[8] = 3000000,
		[9] = 3250000,
	},
	{--µÚÎå¹Ø
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
	{--µÚÁù¹Ø
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
};

--09Äê8ÔÂ²Ø½£µ÷ÕûÐÂÔö½±Àø
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
----------- ´Ë´¦ÎªÆÁ±ÎÎ´¿ª·ÅµÄ³¡¾°µÄÒ³ÃæÏÔÊ¾
	if nStageNext == 6 then
		nStageNext = 8
	elseif nStagePre == 7 then
		nStagePre = 5
	end
----------- --------------------------------
	return nStagePre, nStageNext
end

-- ¸ñÊ½»¯×Ö·û´®£ºÎª sStr Ìí¼Ó¿Õ¸ñ»òÕß"0"´ïµ½ nLen µÄ³¤¶È
-- sStr : Ô­Êý¾Ý(ÕûÊý¡¢×Ö·û´®¡­¡­)
-- nLen : ¸ñÊ½ºó³¤¶È
-- nMode : 1.ÔÚ´®ºó¼Ò¿Õ¸ñ(¿ÕÈ±Ä¬ÈÏ) 2.ÔÚ´®Ç°¼Ó¿Õ¸ñ 3.ÔÚ´®Ç°¼Ó¡°0¡±
-- ·µ»Ø¸ñÊ½»¯ºóµÄ×Ö·û´®
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

-- Õû³ý 
-- num : ³ýÊý
-- steps : ±»³ýÊý
-- ·µ»Ø ÉÌ ºÍ ÓàÊý
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

-- Õû³ý£ºÖ»ÄÜ³ýÒÔ10µÄÕû±¶Êý
-- num : ³ýÊý
-- steps : ±»³ýÊý
-- ·µ»Ø ÉÌ
function MU_Div(num, steps)
	if tonumber(num) == nil then						-- Õû³ý steps
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

-- ·´×ª£º·´×ª BOOLEAN
-- num : 0 or 1
-- ·µ»Ø (not num)
function MU_Inverse(num)
	if num == 0 then
		return 1
	else
		return 0
	end
end

-- ¶ÓÎéÐÅÏ¢£ºÏòµ±Ç°Íæ¼ÒËùÔÚ¶ÓÎé·¢ËÍÐÅÏ¢
-- msg : ÐèÒª·¢ËÍµÄÐÅÏ¢
-- msgtype : ·¢ËÍÐÅÏ¢µÄ·½Ê½: 0.Msg2Player(È±Ê¡Ä¬ÈÏ) 1.Say 2.Talk
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

-- Á½µã¼ä¾àÀë: È¡µÃÁ½µã¼äµÄ¾àÀë
function MU_Distance(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)		-- ÅÐ¶ÏÁ½µã¼ä¾àÀë
	if MapID1 ~= MapID2 then
		Msg2Player("Error: Khu vùc kh«ng phï hîp!")
		return 0
	else
		local dx = MapX2 - MapX1
		local dy = MapY2 - MapY1
		local nDist = (dx * dx + dy * dy)^(1/2)
		return nDist
	end
end

-- ÎÄ×ÖÉÏÉ«: ¸øÎÄ×Ö¶ÎÉÏÉ«ºó·µ»Ø
-- text : ÐèÒªÉÏÉ«µÄÎÄ×Ö¶Î
-- color : ÐèÒªµÄÑÕÉ«: gray red green blue yellow gold wood metal fire water earth ....
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
ST_FILE = new(KTabFile, "\\settings\\²Ø½£É½×¯\\spawner\\cangjian_spawner.txt")			-- ¼ÇÂ¼Ã¿¸ö¹Ø¿¨Ë¢¹ÖµãÐÅÏ¢µÄ±í¸ñ
ST_TYPE = {"SortID","UnitIndex","MapID","MapX","MapY","NpcID",							-- ±íÍ·£¨ÁÐÃû³Æ£©
		   "NpcName","RandomTable","SpawnPeriod","Amount","Limit","SpawnerCount"}
ST_ROWCOUNT = tonumber(ST_FILE:getRow())												-- ±í×ÜÐÐÊý
ST_LMD_INIT = {{0,0},{0,0},{0,0},{0,0},{0,0}, {0,0},{0,0},{0,0},{0,0}}					-- ¹ÖÎï³õÊ¼»¯¹Ø¿¨Çø¼ä£¨±íÖÐÎ»ÖÃ£©
ST_LMD_SPWN = {{0,0},{0,0},{0,0},{0,0},{0,0}, {0,0},{0,0},{0,0},{0,0}}					-- ¹ÖÎïË¢¹Öµã¹Ø¿¨Çø¼ä£¨±íÖÐÎ»ÖÃ£©

------------------------------------------------------------------------------------------------ FUNCTION ----
-- ¶Á±íµÄ³õÊ¼»¯´¦Àí
-- ¼ÆËã±í¸ñÖÐÃ¿Ò»¹ØµÄÐÅÏ¢µÄÎ»ÖÃÇø¼ä
function ST_Init()
	for i=2, ST_ROWCOUNT do												-- ¼ÆËã¹Ø¿¨Çø¼ä
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
ST_Init()	-------------------------------------------------------------- ³õÊ¼»¯Ö´ÐÐ

-- È¡µÃ¹Ì¶¨rowÐÐdatatypeÁÐµÄµ¥ÔªÄÚÈÝ
function ST_GetData(row, datatype)
	local tempdata = ST_FILE:getCell(row, ST_TYPE[datatype])
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end
end

-- Í¨¹ýdatatypeÁÐÈ¡µÃdataµÄÐÐÊý
function ST_GetRow(data, datatype)
	for i=2, ST_ROWCOUNT do
		if (data == ST_GetData(i, datatype)) then
			return i
		end
	end
end

-- È¡µÃÄ³Êý¾ÝµÄÐÐÊýºÍÁÐÊý(Èç¹û±íÖÐÓÐÖØ¸´Êý¾Ý,ÔòÈ¡×î¿¿½ü×óÉÏÎ»ÖÃµÄÊý¾Ý)
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
GT_FILE = new(KTabFile, "\\settings\\²Ø½£É½×¯\\gears\\cangjian_gears.txt")			-- ¼ÇÂ¼Ã¿¸ö¹Ø¿¨Ë¢¹ÖµãÐÅÏ¢µÄ±í¸ñ
GT_TYPE = {"¶i","Ng­êi bÞ rít","Sù kiÖn","Tr¹ng th¸i","Lo¹i h×nh ®¹o cô","Lo¹i phô r¬i ra","Lo¹i nhá phô thuéc",			-- ±íÍ·£¨ÁÐÃû³Æ£© 
		   "Tû lÖ r¬i30","Tû lÖ r¬i40","Tû lÖ r¬i50","Tû lÖ r¬i60","Tû lÖ r¬i70","Tû lÖ r¬i80","Tû lÖ r¬i90"}
GT_ROWCOUNT = tonumber(GT_FILE:getRow())											-- ±í×ÜÐÐÊý
GT_GEARSPART = {"§Çu", "Th©n thÓ", "Ch©n", "Kim hoµn", "Vò khÝ"}
GT_GEARFACTION = {"ThiÕu L©m tôc gia", "ThiÕu L©m tôc gia", "ThiÕu L©m thiÒn t¨ng", "ThiÕu L©m vâ t¨ng", "§­êng M«n", "Nga My phËt gia", "Nga My tôc gia", "C¸i Bang TÜnh y", "C¸i Bang ¤ Y", "Vâ §ang ®¹o gia", "Vâ §ang tôc gia", "D­¬ng M«n th­¬ng Kþ", "D­¬ng M«n Cung Kþ", "HiÖp §éc", "Tµ §éc"}
------------------------------------------------------------------------------------------------ FUNCTION ----
-- È¡µÃ¹Ì¶¨rowÐÐdatatypeÁÐµÄµ¥ÔªÄÚÈÝ
function GT_GetData(row, datatype)
	local tempdata = GT_FILE:getCell(row, GT_TYPE[datatype])
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end
end

-- Í¨¹ýdatatypeÁÐÈ¡µÃdataµÄÐÐÊý
function GT_GetRow(data, datatype)
	for i=2, GT_ROWCOUNT do
		if (data == GT_GetData(i, datatype)) then
			return i
		end
	end
end

-- È¡µÃÄ³Êý¾ÝµÄÐÐÊýºÍÁÐÊý(Èç¹û±íÖÐÓÐÖØ¸´Êý¾Ý,ÔòÈ¡×î¿¿½ü×óÉÏÎ»ÖÃµÄÊý¾Ý)
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

--ÐÂµÄ¸ø¶«Î÷ÐèÇó£¬¼ÓÔÚÕâÀï°É
function GT_BossGiveNew(name)

	-- Ô½ÄÏ2009	ÈýÔÂ»î¶¯
	if is_march_09_viet_open() == 1 then
		local tDropBag =
		{
			["Cöu TuyÖt KiÕm Ma"] = 80,
		}

		local nItemNum = tDropBag[name]
		if nItemNum == nil then
			nItemNum = 1
			local nRandom = random(1,100)
			if nRandom <= 30 then
				add_bag_march_09_viet(nItemNum, "Tµng KiÕm s¬n trang")
			end
		else
			local nOldPlayer = PlayerIndex
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i)
				if PlayerIndex > 0 then
					if GetTask(GS_RECORD_CHANCE) > 1 then
						add_bag_march_09_viet(nItemNum, "Tµng KiÕm s¬n trang")
					end
				end
			end
			PlayerIndex = nOldPlayer
		end
	end
end

--ÔÙÔÙºóÀ´µÄÐèÇó£¬É±ËÀbossºócallÒ»¸öNPC³öÀ´
function GT_NewBossDrop(name)
	local tDrop =
	{
		["Tæng qu¶n ngo¹i viÖn"] = {"LÖnh bµi tæng qu¶n ngo¹i viÖn", "LÖnh bµi tæng qu¶n ngo¹i viÖn", "\\script\\task\\tasklink\\taskitem.lua"},
		["Tæng qu¶n néi viÖn"] = {"LÖnh bµi tæng qu¶n néi viÖn", "LÖnh bµi tæng qu¶n néi viÖn", "\\script\\task\\tasklink\\taskitem.lua"},
		["§¹i tiÓu th­"] = {"ViÖt N÷ kiÕm", "ViÖt N÷ kiÕm", "\\script\\task\\tasklink\\taskitem.lua"},
		["§¹i trang chñ"] = {"Trang chñ kim Ên", "Trang chñ kim Ên", "\\script\\task\\tasklink\\taskitem.lua"},
		["Tr­ëng l·o Tµng KiÕm C¸c"] = {"Tr­ëng L·o ChØ Hoµn", "Tr­ëng L·o ChØ Hoµn", "\\script\\task\\tasklink\\taskitem.lua"},
	}
	
	if tDrop[name] == nil then
		return
	end
	
	local nMapID, nX, nY = GetNpcWorldPos(TT_TARGET_Index)
	local nChestIndex = CreateNpc(tDrop[name][1], tDrop[name][2], nMapID, nX - 2, nY - 2)
	SetNpcDeathScript(nChestIndex, tDrop[name][3])
	SetNpcLifeTime(nChestIndex, 5 * 60)		-- Í³Ò»NPC´æ»îÊ±¼äÎª5·ÖÖÓ
	WriteLog("[Tµng KiÕm s¬n trang] boss : "..name.."Sau khi ®¸nh b¹i CALL ra NPC:"..tDrop[name][1])
end

function GT_GoodDrop(name, level)
	-- bossµÄÐÂµôÂä
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
	
	local nChestIndex = CreateNpc("R­¬ng tiÒn", "R­¬ng", GetNpcWorldPos(TT_TARGET_Index))
	SetNpcScript(nChestIndex, SF_FILE)
	
	-- ÓÃµ½µÄNPCÊôÐÔ£¬ÇåÁãÏÈ
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
	local nDropTable = {}				-- ¼ÇÂ¼ËùÓÐ¿ÉÄÜµôÂäµÄµÀ¾ß£¨×îºó´ÓÖÐ³éÈ¡Ò»¶¨ÊýÁ¿¿ÉÒÔÊµ¼ÊµôÂäµÄµÀ¾ß£©
	local nDropTableCount = 0			-- ¼ÇÂ¼ËùÓÐ¿ÉÄÜµôÂäµÄµÀ¾ßÊýÁ¿

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
		if (nRecordState == nRecordFlag) and (nRnd <= nRndEnd) then		-- Ìõ¼þÂú×ãÔòDROP±í+1
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
	local aWeaponsTable = {3, 5, 8, 0, 1, 1, 3, 2, 10, 8, 0, 5, 9, 2, 9, 10, 6, 4, 0, 7, 11}		-- ÃÅÅÉÎäÆ÷
	local aGearsFactionTable = {1, 2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21}
	local nNpcIndex;
	for i=1, count do
		local nRnd = random(i, nDropTableCount)
		nDropTable[i], nDropTable[nRnd] = nDropTable[nRnd], nDropTable[i]
		local nChestIndex = CreateNpc("R­¬ng tiÒn", "R­¬ng tinh chÕ", GetNpcWorldPos(TT_TARGET_Index))
		nNpcIndex = nChestIndex
--		local nChestIndex = CreateNpc("Ïä×ÓÇ®", "¾«ÖÂµÄÏä×Ó", GetWorldPos())
		SetNpcDeathScript(nChestIndex, SF_FILE)
		MC_Add2Group(nChestIndex)
		-- Ê¹ÓÃ NPC µÄÊôÐÔÊý¾Ý¼ÍÂ¼µôÂäÎïÊý¾Ý
		-- 1 £ºÏêÏ¸Àà±ð
		-- 5 £º´óÀàÐÍ
		-- 6 £º¸±ÀàÐÍ
		-- 8 £ºbit1 - ÉÏËø / bit2 - ¶ÀÕ¼
		local nChestState = 0
		local nChestRow = nDropTable[i]
		local nSimData = GT_GetData(nChestRow, 7)
		local aSplitedData, nSplitedDataLen = MU_Split(nSimData, ",")
		local nChestType = aSplitedData[random(1, nSplitedDataLen)]
--		Msg2Player("nSimData: "..nSimData.." nSplitedDataLen: "..nSplitedDataLen.." nChestType: "..nChestType)
		local nGearsFaction = tonumber(nChestType)						-- Èç¹ûÊÇÌ××°£¬±íÊ¾ÃÅÅÉ
		local aGearsIndex = {0,0,0}							-- ÐÂ×°±¸µÄ±àºÅ
		local nIsLocked = 0
		if random(1,100000) <= 10000 then
			nIsLocked = 1
		end			
		------
		local nGearsLevel = tonumber(GT_GetData(nChestRow, 5))		-- Èç¹ûÊÇÌ××°£¬±íÊ¾µÈ¼¶¶Î
		if nGearsLevel == 0 then									-- Èç¹ûÊÇ 0 ±íÊ¾Ëæ»ú
			nGearsLevel = aGearsLevelTable[random(1, nGearsLevelTableLen)]
		end
		local nGearsSlot = tonumber(GT_GetData(nChestRow, 6))		-- ±íÊ¾×°±¸µÄ×°±¸Î»ÖÃ
		if nGearsSlot == 0 then
			nGearsSlot = random(1, 5)
		end	
		if tonumber(aSplitedData[1]) == 0 then								-- Ëæ»úÃÅÅÉ
			nGearsFaction = aGearsFactionTable[random(1, 15)]
		end
		if (nGearsSlot >= 1) and (nGearsSlot <= 4) then				-- ²»ÊÇÎäÆ÷
			aGearsIndex[2] = aGearsSlotTable[nGearsSlot]
		elseif (nGearsSlot == 5) then								-- ÊÇÎäÆ÷
			aGearsIndex[2] = aWeaponsTable[nGearsFaction]
		end
		if nGearsFaction == 1 then									-- ´¦ÀíÉÙÁÖµÄÁ½ÖÖÎäÆ÷±àºÅ
			nGearsFaction = 2
		end
		aGearsIndex[3] = nGearsFaction*100 + nGearsLevel*10	
		AddUnitStates(nChestIndex, 5, aGearsIndex[1])
		AddUnitStates(nChestIndex, 6, aGearsIndex[2])
		AddUnitStates(nChestIndex, 1, (aGearsIndex[3]-1))
		AddUnitStates(nChestIndex, 8, nIsLocked)			-- ÉÏËø
		WriteLog("#"..GetName().." "..GetWorldPos().."Më r­¬ng"..aGearsIndex[1].." "..aGearsIndex[2].." "..aGearsIndex[3])
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
TC_ZONE_MAX	= 5						-- ¼ÇÂ¼×Ü×éÊý£¨ÏàÍ¬µÄ³¡¾°»á¿ªN×é£©
TB_ZONE_TASKTEMP = 10				-- ÔÚÃ¿¸öÈËÉíÉÏµÄ¼ÇÂ¼×Ô¼ºËùÔÚ³¡µØµÄ TaskTemp Ë÷ÒýºÅ
TC_STAGE_Index = {0, 0, 0, 0, 0}	-- ¼ÇÂ¼µ±Ç°¹Ø¿¨Êý£¬0 ±íÊ¾»¹Ã»½øÉ½×¯
TC_STAGE_State = {0, 0, 0, 0, 0}	-- ¹Ø¿¨×´Ì¬£º0~9 »¹Î´¿ªÊ¼ / 10~19 ÒÑ¾­¿ªÊ¼ / 20~29 ÒÑ¾­Íê³É £¨¾ßÌåÏ¸½ÚµÄÖµ¸ù¾Ý²»Í¬ÐèÇó½âÊÍ£©
TC_KILL_Total = {0, 0, 0, 0, 0}		-- ËùÓÐ¹Ø¿¨×Ü¹²É±µÐÊýÁ¿
TC_KILL_Stage = {0, 0, 0, 0, 0}		-- µ±Ç°¹Ø¿¨×Ü¹²É±µÐÊýÁ¿
TC_KILL_KeyGot = {0, 0, 0, 0, 0}	-- µ±Ç°¹Ø¿¨ÄÜ»ñµÃµÄÔ¿³×ÊýÁ¿
TC_KILL_Player = {}					-- Íæ¼ÒÃ¿¹Ø¿¨É±µÐÈËÊýÁ¿
TC_TASK_EventCount = {}				-- ÈÎÎñ¼ÇÊý£¬²»Í¬¹Ø¿¨¿ÉÒÔÓÐ²»Í¬µÄÊýÁ¿ºÍÄÚÈÝµÄ¼ÇÊýÖµ
TC_TASK_Conditions = {}				-- ÈÎÎñÍê³ÉÌõ¼þ£¬¶ÔÓ¦ÉÏÃæµÄ¼ÇÊýÖµ£¬²»Í¬¹Ø¿¨ÓÐ²»Í¬µÄ½âÊÍ
TC_TIMER_Count = {0, 0, 0, 0, 0}	-- ×Ü¿Ø¼ÇÊ±Æ÷¼ÇÊý£¬Ã¿Ò»´Î¼ÇÊý±íÊ¾Ò»¸öÖÜÆÚ£º14Ãë
TC_TIMER_CountTotal = {0, 0, 0, 0, 0}	-- ×Ü¿Ø¼ÇÊ±Æ÷¼ÇÊý£¬ËùÓÐ¹Ø¿¨ÏûºÄÊ±¼ä
TC_TIMER_StartDate = {0, 0, 0, 0, 0}	-- ¹Ø¿¨¿ªÊ¼Ê±¼ä
TC_TIMER_Limit = {128, 128, 128, 128, 128}	-- ¼ÇÊ±Æ÷ÖÜÆÚÉÏÏÞ£¬Ò»¸ö¹Ø¿¨ÔÊÐíµÄ×î³¤Ê±¼ä
TC_TIMER_ALARM = {80, 80, 80, 80, 80, 80, 80, 40, 80}					-- ¼ÇÊ±Æ÷¾¯±¨£¬´ÓÕâ¸öÖÜÆÚ¿ªÊ¼Ã¿10¸öÖÜÆÚ×öÒ»´Î¾¯±¨
TC_TIMER_LIMIT_TABLE = {128, 128, 128, 128, 128, 128, 128, 64, 128}		-- Ã¿¹Ø¿¨µÄÊ±¼äÏÞÖÆ
TC_TIMER_LIMIT_TABLE_UI = {"30:00", "30:00", "30:00", "30:00", "30:00", "30:00", "30:00", "15:00", "30:00"}		-- Ã¿¹Ø¿¨µÄÊ±¼äÏÞÖÆµÄÓÃ»§½çÃæÏÔÊ¾Ê±¼ä£¨·ÖÖÓ£©

------------------------------------------------------------------------------------------------ FUNCTION ----
-- Ò»Ð©±äÁ¿µÄ³õÊ¼»¯
-- »ù±¾ÉÏÕâÀïÒÑ¾­²»»áÊ¹ÓÃÁË~~ÍÚ¹þ¹þ¹þ°¡¹þ¹þ
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

-- ÉèÖÃÍæ¼ÒËùÔÚµÄ³¡µØºÅ(½ö×÷Îª¼ÇÂ¼,²»±íÊ¾Íæ¼ÒÈ·ÊµÔÚÕâ¸ö³¡µØ)
function TC_SetTeamZone(nZone)
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		SetTaskTemp(TB_ZONE_TASKTEMP, nZone)
	end
	PlayerIndex = nOldIndex
end

-- È¡µÃÍæ¼ÒËùÔÚ³¡µØºÅµÄ¼ÇÂ¼(½ö×÷Îª¼ÇÂ¼,²»±íÊ¾Íæ¼ÒÈ·ÊµÔÚÕâ¸ö³¡µØ)
function TC_GetTeamZone()
	return GetTaskTemp(TB_ZONE_TASKTEMP)
end

-- Ë¢ÐÂÒ»Ð©Íæ¼ÒµÄÉ±µÐÐÅÏ¢,±ÈÈçÉ±µÐÊýÁ¿µÄ¼ÇÂ¼,»ý·Ö»ñµÃµÄ¼ÇÂ¼µÈ(Ö»ÊÇÁÙÊ±¼ÇÂ¼,Êµ¼Ê±£´æÔÚÍæ¼ÒÉíÉÏ»áÓÃ TB_AddScore ºÍ TB_StoreScore)
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
--	Msg2Player("È«¶ÓÀÛ»ý»ý·Ö +"..(GetUnitCurStates(TT_TARGET_Index, 6)/10).." ("..TB_BONUS_Total[nZone]..")")
	return TC_KILL_Player[PlayerIndex][nStage], TC_KILL_Stage[nZone], TC_KILL_Total[nZone], TB_BONUS_MemberTotal[nZone], TB_BONUS_Total[nZone]
end

-- ¼ì²éÍæ¼ÒÔÚµ±Ç°¹Ø¿¨ËùÏûºÄµÄÊ±¼äÊÇ·ñÐèÒª·¢³ö¾¯¸æ,ÒÑ¾­ÅÐ¶Ï³¬³ö¹Ø¿¨ÔÊÐíµÄÊ±¼ä²¢ÓèÒÔ½áÊø¹Ø¿¨
function TC_CheckTimer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	if (TC_TIMER_Count[nZone] >= TC_TIMER_ALARM[nStage]) and (mod(TC_TIMER_Count[nZone], 10) == 0) then
		MU_Msg2Team("C¶nh b¸o h¹n chÕ thêi gian qua ¶i:"..TC_TIMER_Count[nZone].."/"..TC_TIMER_LIMIT_TABLE[nStage])
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
TM_MEMBER_MAX = 8								-- ÔÊÐíµÄ¶ÓÔ±ÊýÁ¿
TM_MEMBER_Index = {}							-- ¼ÇÂ¼³õÊ¼¶ÓÔ±
TM_MEMBER_MaxLevel = {30, 30, 30, 30, 30}		-- ¼ÇÂ¼¶ÓÔ±×î¸ßµÈ¼¶
------------------------------------------------------------------------------------------------ FUNCTION ----
function TM_Init()
	TM_GetMaxLevel()
end

-- È¡µÃµ±Ç°¶ÓÎéÖÐµÄ×î¸ßµÈ¼¶,²ÎÊý nZone ±íÊ¾³¡µØ,¿ÉÒÔÊ¡ÂÔ(ÒÔºóÈôÃ»ÓÐÌØÊâËµÃ÷,nZone¶¼±íÊ¾³¡µØºÅÇÒ¶¼¿ÉÒÔÈ±Ê¡)
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

-- È¡µÃµ±Ç°¶ÓÎéÖÐµÄ×îµÍµÈ¼¶
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

-- ¼ÇÂ¼¸Õ½øÉ½×¯Ê±¶ÓÎéÀïÃæµÄ³ÉÔ±
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
	return TM_MEMBER_Index[nZone][9]			-- ·µ»Ø³õÊ¼¶ÓÔ±ÊýÁ¿
end

-- Í¨¹ýÍæ¼ÒË÷ÒýºÅ»ñµÃÍæ¼ÒÃû×Ö(µ±Ç°Íæ¼ÒµÄË÷ÒýºÅÍ¨¹ýÖ±½Ó·ÃÎÊÈ«¾Ö±äÁ¿ PlayerIndex »ñµÃ)
function TM_GetMemberName(nIndex)
	local nOldIndex = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	PlayerIndex = nOldIndex
	return sName
end

-- Í¨¹ýÍæ¼ÒµÄÃû×ÖÀ´»ñµÃ ¶ÓÎéÖÐ Íæ¼ÒµÄË÷ÒýºÅ(Ö»¶Ôµ±Ç°¶ÓÎéÓÐÐ§¹û)
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

-- ÅÐ¶Ïµ±Ç°Íæ¼ÒÊÇ·ñÊÇ¶Ó³¤
function TM_IsCaptain()
	local nIsCaptain = 0								-- ÊÇ·ñÊÇ¶Ó³¤
	local nCaptainIndex = GetTeamMember(0)
	if nCaptainIndex == 0 then
		WriteLog("[Tµng KiÕm]Can't find captain!!!"..GetName().." PlayerIndex="..PlayerIndex)
	end
	if nCaptainIndex == PlayerIndex then
		nIsCaptain = 1
	end
	return nIsCaptain
end

-- ÅÐ¶Ï´¥·¢¶ÔÏóÊÇ·ñÊÇÍæ¼Ò,Õâ¸öµÄÓÃ·¨±È½ÏÌØÊâ,±ÈÈç ¶Ô»°ÊÂ¼þ(ÓÐÄ¿±êÊÂ¼þ) ºÍ ²ÈTRAP(ÎÞÄ¿±êÊÂ¼þ) ÊÂ¼þ¶¼ÊÇµ÷ÓÃµÄ LUA ÖÐµÄ main º¯Êý, ËùÒÔ TM_IsPlayer() Îª 1 ±íÊ¾ÊÇ ²È TRAP ÊÂ¼þ,Îª 0 ±íÊ¾ÓÐÒ»¸öÄ¿±ê,ÔòÎª ¶Ô»°ÊÂ¼þ
function TM_IsPlayer()
	local nIsPlayer = 0
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
	if (TT_TARGET_ModID == "Nam tiªu chuÈn") or (TT_TARGET_ModID == "Nam kh«i ng«") or (TT_TARGET_ModID == "N÷ gîi c¶m") or (TT_TARGET_ModID == "KiÒu n÷") then
		nIsPlayer = 1
	end
	return nIsPlayer
end

-- ¼ÆËã²¢·µ»Ø¶ÓÎéÖÐµÄ ÄÐÐÔ Óë Å®ÐÔ ³ÉÔ±ÊýÁ¿
function TM_SexCount()
	local nFemale = 0	-- Å®ÐÔÈËÊý
	local nMale = 0		-- ÄÐÐÔÈËÊý
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

-- ¶ÔÍæ¼Ò Àë¿ªÉ½×¯/Àë¿ªµ±Ç°ËùÔÚnZone ½øÐÐ´¦Àí
-- nIndex ±íÊ¾¶ÔÄ³ÌØ¶¨Íæ¼Ò½øÐÐ´¦Àí,Èç¹û ´Ë²ÎÊýÈ±Ê¡,±íÊ¾¶ÔÈ«¶Ó½øÐÐ²Ù×÷
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
			
			WriteLog("#Tin tøc sö quan lÖnh GS_STAGE_USED["..nZone.."] = "..GS_STAGE_USED[nZone].."; PlayerIndex = "..PlayerIndex);
			
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
TT_TRIGGER_KILLER = 1101										-- ±íÊ¾ É±¹Ö´¥·¢Æ÷ µÄÍæ¼Ò×Ô¼º¶¨ÒåË÷ÒýºÅ
TT_TRIGGER_TIMER = 1102											-- ±íÊ¾ Ê±¼ä´¥·¢Æ÷ µÄÍæ¼Ò×Ô¼º¶¨ÒåË÷ÒýºÅ
TT_TRIGGER_RECT = 1103											-- ±íÊ¾ ÇøÓò´¥·¢Æ÷ µÄÍæ¼Ò×Ô¼º¶¨ÒåË÷ÒýºÅ
TT_TRIGGER_LOGOUT = 1104										-- ±íÊ¾ µÇ³ö´¥·¢Æ÷ µÄÍæ¼Ò×Ô¼º¶¨ÒåË÷ÒýºÅ

if SERVER_INDEX ~= nil then
	TT_TRIGGER_SortID = 1100 + SERVER_INDEX							-- µÃµ½ÔÚ´¥·¢Æ÷ÅäÖÃ±íÖÐµÄÁÐÊý
end

TT_TARGET_Index = 0												-- ÊÂ¼þ·¢ÉúºóÏà¹ØÄ¿±êNPCµÄË÷ÒýºÅ£ºINTEGER
TT_TARGET_ModID = ""											-- ÊÂ¼þ·¢ÉúºóÏà¹ØÄ¿±êNPCµÄÄ£°åID£ºSTRING
TT_TARGET_Name = ""												-- ÊÂ¼þ·¢ÉúºóÏà¹ØÄ¿±êNPCµÄÏÔÊ¾Ãû£ºSTRING
TT_TARGET_INDEX = 11											-- ÊÂ¼þ·¢ÉúºóÏà¹ØÄ¿±êNPCµÄË÷ÒýºÅÓÃµ½µÄ TASKTEMP ±àºÅ
TT_TARGET_MODID = 12											-- ÊÂ¼þ·¢ÉúºóÏà¹ØÄ¿±êNPCµÄÄ£°åIDÓÃµ½µÄ TASKTEMP ±àºÅ
TT_TARGET_NAME = 13												-- ÊÂ¼þ·¢ÉúºóÏà¹ØÄ¿±êNPCµÄÏÔÊ¾ÃûÓÃµ½µÄ TASKTEMP ±àºÅ
------------------------------------------------------------------------------------------------ FUNCTION ----
function TT_Init(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
end

-- ÉèÖÃµ±Ç°Íæ¼ÒÔÚÄ³ÊÂ¼þ´¥·¢ºóµÄÄ¿±êË÷ÒýºÅ(ÓÃÓÚÄÇÖÖ¶ÔÄ¿±êµÄ²Ù×÷²»ÊÇ¼´Ê±´¦ÀíµÄÇé¿ö,ÅäºÏ TT_GetTarget() Ê¹ÓÃ)
function TT_SetTarget(nIndex)
	SetTaskTemp(TT_TARGET_INDEX, nIndex)
end

-- È¡µÃ×î½üÒ»´ÎÓÃ TT_SetTarget º¯Êý±£´æµÄÄ¿±êË÷ÒýºÅ
function TT_GetTarget()
	return GetTaskTemp(TT_TARGET_INDEX)
end

-- ´¥·¢Æ÷@¿ªÊ¼Ê±¼ä´¥·¢Æ÷, Õâ¸ö´¥·¢Æ÷ÊÇ¹ÒÔÚ¶Ó³¤ÉíÉÏµÄ,×÷ÓÃÊÇ×÷Îª Õû¸ö¹Ø¿¨½ø³Ì ÖÐµÄÖÜÆÚÊ±¼ä¿ØÖÆ/´¥·¢ ,ÒÔÖÜÆÚÎªµ¥Î»,Ò»¸öÖÜÆÚ 14 Ãë
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

-- ´¥·¢Æ÷@É¾³ýÊ±¼ä´¥·¢Æ÷
function TT_RemoveTimer(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	RemoveTrigger(GetTrigger(TT_TRIGGER_TIMER))
	PlayerIndex = nOldIndex
end

-- ´¥·¢Æ÷@¿ªÊ¼Í¨ÓÃ´¥·¢Æ÷×é, Õâ×é´¥·¢Æ÷ÊÇ¹ÒÔÚËùÓÐ¶ÓÔ±ÉíÉÏµÄ,Ã¿¸öÈËµÄ´¥·¢Æ÷Ë½ÓÐ,Õâ¸ö´¥·¢Æ÷×é°üÀ¨ÁË: É±¹Ö/ÇøÓò/µÇÂ½
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

-- ´¥·¢Æ÷@É¾³ýÍ¨ÓÃ´¥·¢Æ÷×é, Õâ×é´¥·¢Æ÷ÊÇ¹ÒÔÚËùÓÐ¶ÓÔ±ÉíÉÏµÄ,Ã¿¸öÈËµÄ´¥·¢Æ÷Ë½ÓÐ,Õâ¸ö´¥·¢Æ÷×é°üÀ¨ÁË: É±¹Ö/ÇøÓò/µÇÂ½
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

-- ·Öµµ¼Ç²½Æ÷, ¾ÍÊÇÒ»¸ö Counter ~~Õâ¸öÀÛ¼ÓÆ÷ÊÇÓÃÀ´¼ÇÂ¼Ã¿¹Ø¿¨ÒÑ¾­¾­¹ýµÄÊ±¼äÖÜÆÚµÄ,³¬¹ýÉÏÏÞºó»áÖØÖÃ
function TT_Stepper(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local STEP_MAX = 8									-- Òª±£Ö¤ 8 STEP £¬Æä¼Ç²½³¤¶È±ØÐëÎª 1~8 ËùÓÐÊý×ÖµÄ ÈÎÒâ¹«±¶Êý
	local STEP_LENGTH_MAX = 840							-- ¼Ç²½³¤¶ÈÉÏÏÞ
	if TC_TIMER_Count[nZone] == nil then
		WriteLog("**[Tµng KiÕm b¸o lçi]TC_TIMER_Count[nZone]== nil, nZone == "..nZone)
	else
		if TC_TIMER_Count[nZone] < STEP_LENGTH_MAX then
			TC_TIMER_Count[nZone] = TC_TIMER_Count[nZone] + 1
			return TC_TIMER_Count[nZone]
		else
			TC_TIMER_Count[nZone] = 0
			return "Error: V­ît møc tèi ®a, reset l¹i sè b­íc!"
		end
	end
end

-- ·Öµµ¼Ç²½Æ÷¼ì²éÆ÷,×÷ÓÃÊÇ·µ»ØÒ»¸öÊÇ·ñ±»Õû³ýµÄÐÅÏ¢,ÓÃÓÚ¿ØÖÆÄÇÐ©¶àÖÜÆÚÖ´ÐÐÒ»´ÎµÄ´¦Àí¹ý³Ì
-- step : ±»¼ì²éµÄÊÇ·ñÄÜ±»µ±Ç°µÄÊ±¼äÖÜÆÚÕû³ýµÄÊý
function TT_StepperChecker(step, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if (type(step) == "number") and (step >= 1) and (step <= 8) then
		return mod(TC_TIMER_Count[nZone], step)
	else
		return "Error: KiÓm tra sè liÖu kh«ng chuÈn!"
	end
end

--============================================================================================== MONSTER CREATER ====
-- Monster Creater
MC_SPWN_Count = {}							-- Ã¿¸öË¢ÐÂµãÒÑ¾­Ë¢³öµÄ¹ÖÎïÊýÁ¿
MC_SPWN_Limit = {150,150,150,150,150}		-- µ±Ç°µØÍ¼ÔÊÐí³öÏÖµÄ¹ÖÎïÊýÁ¿
MC_SPWN_LIMIT_TABLE = {150, 150, 150, 150, 150, 150, 150, 150, 150}		-- Ã¿¹Ø¿¨µÄ×î´ó¹ÖÎïÊýÁ¿ÏÞÖÆ
MC_BOSS_POS = {
{"Tæng ngo¹i qu¶n", "Tæng qu¶n ngo¹i viÖn", 1, 1587, 3238},		-- 1 - Stage 1 boss
{"Tæng néi qu¶n", "Tæng qu¶n néi viÖn", 2, 1657, 3133},			-- 2 - Stage 2 boss
{"§¹i tiÓu th­", "§¹i tiÓu th­", 3, 1629, 3147},					-- 3 - Stage 3 boss
{"§¹i trang chñ", "§¹i trang chñ", 4, 1869, 2895},					-- 4 - Stage 4 boss
{"Tæng qu¶n Tµng KiÕm", "Tr­ëng l·o Tµng KiÕm C¸c", 5, 1602, 3193},			-- 5 - Stage 5 boss
{"", "", 0, 0, 0},										-- 6 - Stage 6 boss
{"", "", 0, 0, 0},										-- 7 - Stage 7 boss
{"", "", 0, 0, 0},										-- 8 - Stage 8 boss
{"KiÕm Hån", "Cöu TuyÖt KiÕm Ma", 9, 1567, 3245}}					-- 9 - Stage 9 boss

------------------------------------------------------------------------------------------------ FUNCTION ----
function MC_Init(nZone)
end

-- ½«Ò»¸öµ¥Î»Ìí¼Ó½øÒ»¸ö Group ÖÐ(Group ÊÇÒ»¸öÓÃÀ´¼ÇÂ¼ NPC INDEX µÄ¶ÔÏó,°Ñ¶à¸öNPC INDEX Ìí¼Ó½ø×éºó,¿ÉÒÔ¶Ô×é½øÐÐ²Ù×÷)
function MC_Add2Group(nUnitIndex, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	return AddGroupUnit(nZone, nUnitIndex)
end

-- ½«Ò»¸öNPC INDEX´Ó Group ÖÐÉ¾³ý,²¢ÇÒÉ¾µôNPCµÄÊµÌå±¾Éí
-- nLifeTime ±íÊ¾Êµ¼ÊÉ¾³ýÊµÌåµÄÊ±¼äÑÓ³Ù
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

-- ½«Ò»¸ö Group ÖÐµÄËùÓÐ NPC INDEX Çå³ý,²¢ÇÒÉ¾µôËùÓÐNPCÊµÌå
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

-- ¸ù¾Ý cangjian_spawner.txt ±í´´½¨Ò»¸öµ¥Î»
-- data : ±íÖÐµÄÈÎÒâÒ»¸öÊý¾ÝÏî
-- datatype : Õâ¸öÊý¾ÝËùÔÚµÄÁÐµÄ±àºÅ
-- nlevel : ±íÊ¾Õâ¸öNPCµÄµÈ¼¶,Õâ¸öµÈ¼¶½«È¥µô¸öÎ»Êýºó×÷Îª×Ö·û´®Ìí¼Óµ½NPCÄ£°åÃûºóÃæ
function MC_CreateUnit(data, datatype, nlevel, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nRow = ST_GetRow(data, datatype)
	local nMapID = GetWorldPos()			-- ²»Í¬µÄ³¡µØÈ·¶¨²»Í¬µÄ µØÍ¼ ID
	if nlevel == nil then
		return CreateNpc(ST_GetData(nRow, 6), ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
	else
		nlevel = MU_Div(nlevel) * 10
		sNpcTemp = ST_GetData(nRow, 6)..tostring(nlevel)
		return CreateNpc(sNpcTemp, ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
	end
end

-- ¸ù¾Ý cangjian_spawner.txt ±í´´½¨Ò»¸öÖ¸¶¨ÐÐµÄµ¥Î»
-- sNpctype : Èç¹û²»¿ÕÈ±Ôò±íÊ¾´ý´´½¨µÄµ¥Î»ÊÇ sNpctype Ö¸¶¨µÄ NPC Ê±²Å»á´´½¨
function MC_CreateUnitByRow(nRow, nlevel, sNpctype, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
--	local nMapID = ST_GetData(nRow, 3) + (nZone * 10) - 10			-- ²»Í¬µÄ³¡µØÈ·¶¨²»Í¬µÄ µØÍ¼ ID
--                   ·þÎñÆ÷        ³¡µØ×é            ¹Ø¿¨
	local nMapID = SF_MAPBASE + (nZone * 10) + ST_GetData(nRow, 3)		-- ²»Í¬µÄ³¡µØÈ·¶¨²»Í¬µÄ µØÍ¼ ID
	if nlevel == nil then
		if (sNpctype == ST_GetData(nRow, 6)) or (sNpctype == nil) then
			return CreateNpc(ST_GetData(nRow, 6), ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))
		end
	else
		nlevel = MU_Div(nlevel) * 10
		sNpcTemp = ST_GetData(nRow, 6)..tostring(nlevel)
--		if ST_GetData(nRow, 7) == "»ú¹Ø" then
--			sNpcTemp = ST_GetData(nRow, 6)
--		end
		if (sNpctype == ST_GetData(nRow, 6)) or (sNpctype == nil) then
			return CreateNpc(sNpcTemp, ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
		end
	end
end

-- ¸ù¾Ý cangjian_spawner.txt ±í´´½¨Ò»×é NPC ,ÕâÐ©NPC ²»»áÖÜÆÚÐÔµÄ´´½¨,Ö»»áÔÚÃ¿´Î¹Ø¿¨³õÊ¼»¯µÄÊ±ºò²Å»á´´½¨(ST_Init() »á¼ÆËã³öÃ¿¸ö¹Ø¿¨ÐèÒª´´½¨µÄÒ»ÅúNPC)
-- stage : ±íÊ¾ÐèÒª´´½¨µÄµÚstage¹ØµÄËùÓÐNPC
-- sNpctype : Èç¹û²»¿ÕÈ±Ôò±íÊ¾´ý´´½¨µÄµ¥Î»ÊÇ sNpctype Ö¸¶¨µÄ NPC Ê±²Å»á´´½¨
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

-- ¸ù¾Ý cangjian_spawner.txt ±í´´½¨Ò»×é NPC ,ÕâÐ©NPC »áÖÜÆÚÐÔµÄ½øÐÐ´´½¨(ST_Init() »á¼ÆËã³öÃ¿¸ö¹Ø¿¨ÐèÒª´´½¨µÄÒ»ÅúNPC)
-- stage : ±íÊ¾ÐèÒª´´½¨µÄµÚstage¹ØµÄËùÓÐNPC
-- sNpctype : Èç¹û²»¿ÕÈ±Ôò±íÊ¾´ý´´½¨µÄµ¥Î»ÊÇ sNpctype Ö¸¶¨µÄ NPC Ê±²Å»á´´½¨
-- nNoCheck : Èç¹û²ÎÊýÖµÎª 1 ±íÊ¾²»½øÐÐÖÜÆÚ¼ì²é,ÎÞÂÛÔÚÊ²Ã´ÖÜÆÚ¶¼»Ø´´½¨(ÖÜÆÚ¼ì²éÊÇ¼ì²éÄ³¸öNPC¾¿¾¹Òª¼¸¸öÖÜÆÚ²Å±»´´½¨Ò»´ÎµÄ)
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
						AddUnitStates(LastedCreatedUnit, 8, 1001)		-- ÊÓÒ°·¶Î§ÉèÖÃÎª´óÓÚ 1000
					else
						return "Error: §iÓm Refresh"..i.."Sè l­îng v­ît qu¸ tèi ®a:"..MC_SPWN_Count[nZone][i].."/"..nSpawnerCountMax
					end
				else
					return "Error: Sè qu¸i vËt ®¹t ®Õn møc tèi ®a:"..MC_SPWN_Limit[nZone]
				end
			else
				return "Error: Ch­a tíi chu kú kh«i phôc"..TT_StepperChecker(nSpawnPeriod).."/"..nSpawnPeriod
			end
		end
	end
end

-- ´´½¨Ä³¹ØµÄBOSS(Í¨³£Õâ¸öº¯Êý²»´ø²ÎÊý,µ÷ÓÃºó»á´´½¨Íæ¼ÒËùÔÚ¹Ø¿¨µÄBOSS)
-- nIndex : Í¨³£ÊÇ¹Ø¿¨ºÅ
-- nCheck : ÊÇ·ñ¼ì²éµÈ¼¶
function MC_CreateBoss(nIndex, nCheck, nStage, nZone)				-- Éú³ÉÃ¿¹Ø¿¨µÄË¢ÐÂµã¹ÖÎï
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
	local nMapID = GetWorldPos()				-- »ñÈ¡µ±Ç°µØÍ¼ID
	local nBossIndex = CreateNpc(MC_BOSS_POS[nIndex][1]..nlevel, MC_BOSS_POS[nIndex][2], nMapID, MC_BOSS_POS[nIndex][4], MC_BOSS_POS[nIndex][5])
	MC_Add2Group(nBossIndex)
	return nBossIndex
end

--============================================================================================== THE BONUS ====
-- The Bonus
TB_BONUS_TABLE =	{--s1	 s2		s3		s4		s5		s6		s7		s8		s9			-- ²»Í¬µÈ¼¶Ã¿¹Ø¿¨µÄ¶Ó³¤½±Àø±í
    				{1500,	3000,	4500,	6000,	7500,	0,		0,		9000,	12000   },	-- level 30
    				{3000,	6000,	9000,	12000,	15000,	0,		0,		18000,	21000   },	-- level 40
    				{25000,	32500,	42250,	54925,	71402,	0,		0,		107100,	160000   },	-- level 50
    				{50000,65000,	85000,	108000,	150000,	0,		0,		220000,	320000   },	-- level 60
    				{100000,130000,	170000,	220000,	320000, 0,		0,		500000,	700000  },	-- level 70
    				{200000,260000,	340000,	440000, 600000, 0,		0,		1000000,	1500000  },	-- level 80
    				{300000,390000,	510000, 660000, 900000, 0,		0,		1500000,	2250000  }}	-- level 90
TB_BONUS_CHANCE	= 14				-- ¼ÇÂ¼¶Ó³¤Áì½±»ú»áËùÓÃµ½µÄ TaskTemp Ë÷ÒýºÅ
TB_BONUS_LASTEDGOT = 15				-- ¼ÇÂ¼¶Ó³¤ÉÏ´ÎÁì½±¹Ø¿¨»ú»áÓÃµ½µÄ TaskTemp Ë÷ÒýºÅ
TB_BONUS_SCORE = 1801				-- Task Ë÷ÒýºÅ ÀÛ¼Æ»ý·Ö£¨Ö÷ÒªÓ°ÏìÒòËØ£ºÉ±µÐÈËÊý¡¢ÏûºÄÊ±¼ä¡¢¹Ø¿¨£©
TB_BONUS_TIME = 1802				-- Task Ë÷ÒýºÅ ¹²ÓÃÊ±¼ä£¨Ö÷ÒªÓ°ÏìÒòËØ£ºÏûºÄÊ±¼ä£©
TB_BONUS_RELATION = 1803			-- Task Ë÷ÒýºÅ ÓÑºÃ³Ì¶È£¨Ö÷ÒªÓ°ÏìÒòËØ£ºÉ±µÐÈËÊý¡¢¹Ø¿¨ÌØÊâÌõ¼þ£©
TB_BONUS_PLAYED = 1804				-- Task Ë÷ÒýºÅ ²ÎÓë´ÎÊý£¨Ö÷ÒªÓ°ÏìÒòËØ£º²ÎÓë´ÎÊý£©
TB_BONUS_FINISHED = 1805			-- Task Ë÷ÒýºÅ Í¨¹Ø´ÎÊý£¨Ö÷ÒªÓ°ÏìÒòËØ£ºÍêÈ«Íê³É´ÎÊý£©
TB_BONUS_STAGE = 1806				-- Task Ë÷ÒýºÅ ´³¹ØÊýÁ¿£¨Ö÷ÒªÓ°ÏìÒòËØ£º×Ü¹²Íê³ÉµÄµ¥¸ö¹Ø¿¨ÊýÁ¿£©
TB_BONUS_KILLED = 1807				-- Task Ë÷ÒýºÅ É±¹ÖÊýÁ¿£¨Ö÷ÒªÓ°ÏìÒòËØ£ºÉ±¹ÖÊýÁ¿£©
TB_BONUS_BECAPTAIN = 1808			-- Task Ë÷ÒýºÅ ¶Ó³¤´ÎÊý£¨Ö÷ÒªÓ°ÏìÒòËØ£º×÷Îª¶Ó³¤µÄ´ÎÊý£©
TB_BONUS_CAPTAINLEVEL = 1822		-- Task Ë÷ÒýºÅ Í¨¹ØµÈ¼¶£¨×î¶ÌÊ±¼äÍ¨¹ØÊ±µÄ¶Ó³¤µÈ¼¶£©
TB_BONUS_CAPTAINTIME = 1823			-- Task Ë÷ÒýºÅ Í¨¹ØÊ±¼ä
TB_BONUS_MemberTotal = {0, 0, 0, 0, 0}		-- ¶ÓÔ±½±Àø×ÜÖµ
TB_BONUS_Total = {0, 0, 0, 0, 0}			-- È«¹Ø¿¨½±Àø×ÜÖµ
------------------------------------------------------------------------------------------------ FUNCTION ----
-- ³õÊ¼»¯
-- Í¨³£ÔÚ¸Õ¿ªÊ¼µÄÊ±ºòµ÷ÓÃÒ»´Î,×÷ÓÃÊÇ±äÁ¿³õÊ¼»¯»¹ÓÐÉèÖÃ¶Ó³¤¿ÉÁì½±µÄ´ÎÊý
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

-- ÉèÖÃ¶Ó³¤Áì½±»ú»á
-- Ã¿¸ö¹Ø¿¨Íê³Éºó¶Ó³¤¶¼¿ÉÒÔÁìÈ¡Ò»´Î½±Àø,µ«ÊÇËùÓÐ¹Ø¿¨Ö»ÓÐN´Î»ú»á,Õâ¸ö N ¾ÍÊÇÓÃ´Ëº¯ÊýÉèÖÃ
function TB_SetBonusChance(nChance, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	SetTaskTemp(TB_BONUS_CHANCE, nChance)
	PlayerIndex = nOldIndex
end

-- È¡µÃ¶Ó³¤»¹Ê£ÓàµÄÁì½±»ú»á
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

-- ÉèÖÃ¶Ó³¤×î½üÒ»´ÎÄÃ½±Æ·µÄ¹Ø¿¨Êý
function TB_SetLastedGot(nStage, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	SetTaskTemp(TB_BONUS_LASTEDGOT, nStage)
	PlayerIndex = nOldIndex
end

-- È¡µÃ¶Ó³¤×î½üÒ»´ÎÄÃ½±Æ·µÄ¹Ø¿¨Êý
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

-- ¶Ó³¤Áì½±´¦Àí
-- ½±ÀøÄ¿Ç°°üÀ¨ ½ðÇ®/¾­Ñé
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
			local nETRow = MU_Div(GetLevel()) - 2					-- ¸ù¾Ý¶Ó³¤µÈ¼¶»ñÈ¡ TB_BONUS_TABLE ±íÖÐµÄÐÐ²ÎÊý
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
			-- ¶Ó³¤»ñµÃ¾­ÑéµÄ1/3
			ModifyExp(nCaptainExp)
			for i=1, GetTeamSize() do
				--ÆäËû¶ÓÔ±»ñµÃÊ£ÏÂµÄ2/3
				PlayerIndex = GetTeamMember(i)
				if PlayerIndex > 0 and PlayerIndex ~= GetTeamMember(0) then
					ModifyExp(nMemberExp)
				end
			end
			PlayerIndex = nOldIndex
			MU_Msg2Team(GetName().."NhËn phÇn th­ëng ®éi tr­ëng: §iÓm kinh nghiÖm ["..nCaptainExp.."], ®éi viªn nhËn ®­îc ®iÓm kinh nghiÖm["..nMemberExp.."]")
		else
			PlayerIndex = nOldIndex
			Msg2Player("¶i nµy ®· v­ît qua!")
		end
	else
		PlayerIndex = nOldIndex
		Msg2Player("§· dïng hÕt c¬ héi!")
	end
	PlayerIndex = nOldIndex
	return  nStage
end

-- È«¶ÓÍê³ÉÒ»¹Ø¿¨ºóµÄ»ý·Ö·ÖÅä´¦Àí
-- nBonus : È«¶Ó´ý·ÖÅä»ý·Ö
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
--		SetTask(TB_BONUS_SCORE, nSigle_Bonus)						-- ½±Àø»ý·Ö
--	end
--	PlayerIndex = nOldIndex
--	return nSigle_Bonus
--end

-- ¿ªÆôÃ¿¹Ø¶¼ÓÐµÄËæ»úÐ§¹ûµÄÐ¡±¦Ïä
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
		Msg2Player("T¨ng"..nCash.." ng©n l­îng")
	elseif nChoice == 2 then
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		ModifyExp(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("T¨ng"..nCash.." kinh nghiÖm")
	elseif nChoice == 3 then
		CastState("state_lost_life_per18",(GetLevel()^0.75),270,1)		-- 15 Ãë£¬Ã¿°ëÃë¿Û³ýÒ»¶¨µÄHP
		Msg2Player("15 gi©y, mçi nöa gi©y khÊu trõ sinh lùc nhÊt ®Þnh")
	elseif nChoice == 4 then
		CastState("state_lost_mana_per18",(GetLevel()^0.85),270,1)		-- 15 Ãë£¬Ã¿°ëÃë¿Û³ýÒ»¶¨µÄMP
		Msg2Player("15 gi©y, mçi nöa gi©y khÊu trõ néi lùc nhÊt ®Þnh")
	elseif nChoice == 5 then
		CastState("state_perfect_dodge_rate",50,540,1)					-- 30 Ãë£¬50%µÄÉÁ±Ü
		Msg2Player("30 gi©y, 50% tû lÖ nÐ tr¸nh")
	elseif nChoice == 6 then
		CastState("state_life_max_percent_add",25,1080,1)					-- 60 Ãë£¬HPÔö¼Ó25%
		Msg2Player("60 gi©y, HP t¨ng 25%")
	elseif nChoice == 7 then
		CastState("state_neili_max_percent_add",35,1080,1)				-- 60 Ãë£¬MPÔö¼Ó35%
		Msg2Player("60 gi©y, MP t¨ng 35%")
	elseif nChoice == 8 then
		CastState("state_attack_rate_percent_add",50,1080,1)				-- 60 Ãë£¬ÃüÖÐÔö¼Ó100
		Msg2Player("60 gi©y, chÝnh x¸c t¨ng 50%")
	elseif nChoice == 9 then
		CastState("state_critical_hit_rate",25,1080,1)					-- 60 Ãë£¬»áÐÄÔö¼Ó25
		Msg2Player("60 gi©y, chÝnh x¸c t¨ng 25")
	elseif nChoice == 10 then
		CastState("state_attack_speed_add",25,1080,1)						-- 60 Ãë£¬¹¥ËÙÔö¼Ó25%
		Msg2Player("60 gi©y, tèc ®é ®¸nh t¨ng 25%")
	elseif nChoice == 11 then
		CastState("state_attack_speed_dec",30,1080,1)						-- 60 Ãë£¬¹¥ËÙ½µµÍ30%
		Msg2Player("60 gi©y, tèc ®é ®¸nh gi¶m 30%")
	elseif nChoice == 12 then
		CastState("state_move_speed_percent_add",50,1080,1)				-- 60 Ãë£¬ÒÆ¶¯ËÙ¶ÈÔö¼Ó 50%
		Msg2Player("60 gi©y, tèc ®é di chuyÓn t¨ng 50%")
	elseif nChoice == 13 then
		CastState("state_slow",50,1080,1)									-- 60 Ãë£¬ÒÆ¶¯ËÙ¶È½µµÍ 50%
		Msg2Player("60 gi©y, tèc ®é di chuyÓn gi¶m 50%")
	elseif nChoice == 14 then
--      ´Ë¹¦ÄÜÎ´ÉúÐ§£¬ÁÙÊ±Ìæ»»³ÉÆäËû¹¦ÄÜ
--		CastState("state_maximumattack",100,180,1)						-- 10 Ãë£¬Íâ¹¦ÁÙÊ±´ïµ½×î´óÖµ
--		Msg2Player("10 Ãë£¬Íâ¹¦ÁÙÊ±´ïµ½×î´óÖµ")
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		Earn(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("T¨ng"..nCash.." ng©n l­îng")
	elseif nChoice == 15 then
		CastState("state_confusion",100,270,1)							-- 15 Ãë£¬ÁÙÊ±»ìÂÒ
		Msg2Player("15 gi©y, hçn lo¹n t¹m thêi")
	elseif nChoice == 16 then
		CastState("state_paralysis",100,270,1)							-- 15 Ãë£¬ÁÙÊ±Âé±Ô
		Msg2Player("15 gi©y, tª liÖt t¹m thêi")
	elseif nChoice == 17 then
		CastState("state_sleep",100,360,1)								-- 20 Ãë£¬ÁÙÊ±Ë¯Ãß
		Msg2Player("20 gi©y, h«n mª t¹m thêi")
	elseif nChoice == 18 then
		CastState("state_vertigo",100,180,1)								-- 15 Ãë£¬ÁÙÊ±Ñ£ÔÎ
		Msg2Player("15 gi©y, cho¸ng t¹m thêi")
	elseif nChoice == 19 then
		CastState("state_burst_enhance_rate",75,1080,1)					-- 60 Ãë£¬ÊÍ·ÅËÙ¶ÈÔö¼Ó 75%
		Msg2Player("60 gi©y, tèc ®é phãng t¨ng 75%")
	elseif nChoice == 20 then
		CastState("state_burst_enhance_rate",-25,1080,1)					-- 60 Ãë£¬ÊÍ·ÅËÙ¶È½µµÍ 25%
		Msg2Player("60 gi©y, tèc ®é phãng gi¶m 75%")
	elseif nChoice == 21 then
		CastState("state_p_attack_percent_add",25,1080,1)					-- 60 Ãë£¬Íâ¹¦×Ü¹¥»÷Á¦±ÈÀý¼Ó³É 25%
		Msg2Player("60 gi©y, tû lÖ ®¸nh ngo¹i c«ng t¨ng 25%")
	elseif nChoice == 22 then
		CastState("state_p_attack_percent_dec",25,1080,1)					-- 60 Ãë£¬Íâ¹¦×Ü¹¥»÷Á¦±ÈÀý¼õÉÙ 25%
		Msg2Player("60 gi©y, tû lÖ ®¸nh ngo¹i c«ng gi¶m 25%")
	elseif nChoice == 23 then
		CastState("state_m_attack_percent_add",25,1080,1)					-- 60 Ãë£¬ÄÚ¹¦×Ü¹¥»÷Á¦±ÈÀý¼Ó³É 25%
		Msg2Player("60 gi©y, tû lÖ ®¸nh néi c«ng t¨ng 25%")
	elseif nChoice == 24 then
		CastState("state_m_attack_percent_dec",25,1080,1)					-- 60 Ãë£¬ÄÚ¹¦×Ü¹¥»÷Á¦±ÈÀý¼õÉÙ 25%
		Msg2Player("60 gi©y, tû lÖ ®¸nh néi c«ng gi¶m 25%")
	elseif nChoice == 25 then
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		DoubleExpCount(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("T¨ng"..nCash.." ®iÓm kinh nghiÖm nh©n ®«i")
	end
end

-- Ôö¼ÓÍæ¼ÒµÄ¹Ø¿¨¼Ç·ÖÖÐÄ³ÏîÄ¿µÄÖµ (¼Ç·ÖÐÅÏ¢Í¨¹ýÊ¹ÓÃ AddItem(2,0,212,1) Ëù»ñµÃµÄµÀ¾ßÀ´²é¿´)
function TB_AddScore(nType, nValue, nIndex)
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if nIndex ~= nil then
			PlayerIndex = nIndex
		end
--- »ý·Ö¼ÇÂ¼
		if (nType == 1) or (nType == "§iÓm tÝch lòy") then
			SetTask(TB_BONUS_SCORE, GetTask(TB_BONUS_SCORE)+nValue)
--- Ê±¼ä¼ÇÂ¼
		elseif (nType == 2) or (nType == " thêi gian ") then
			SetTask(TB_BONUS_TIME, GetTask(TB_BONUS_TIME)+nValue)
--- ÓÑºÃ¼ÇÂ¼
		elseif (nType == 3) or (nType == "H¶o h÷u") then
			SetTask(TB_BONUS_RELATION, GetTask(TB_BONUS_RELATION)+nValue)
--- ²ÎÓë´ÎÊý
		elseif (nType == 4) or (nType == "Tham dù") then
			SetTask(TB_BONUS_PLAYED, GetTask(TB_BONUS_PLAYED)+nValue)
--- Í¨¹Ø´ÎÊý
		elseif (nType == 5) or (nType == "Qua ¶i") then
			SetTask(TB_BONUS_FINISHED, GetTask(TB_BONUS_FINISHED)+nValue)
--- ´³¹Ø´ÎÊý
		elseif (nType == 6) or (nType == "V­ît ¶i") then
			SetTask(TB_BONUS_STAGE, GetTask(TB_BONUS_STAGE)+nValue)
--- É±¹Ö×ÜÊý
		elseif (nType == 7) or (nType == "GiÕt qu¸i") then
			SetTask(TB_BONUS_KILLED, GetTask(TB_BONUS_KILLED)+nValue)
--- ¶Ó³¤´ÎÊý
		elseif (nType == 8) or (nType == "§éi tr­ëng") then
			SetTask(TB_BONUS_BECAPTAIN, GetTask(TB_BONUS_BECAPTAIN)+nValue)
--- ´¦ÀíÍê³É
		end
		if nIndex ~= nil then
			PlayerIndex = nOldIndex
			return
		end
	end
	PlayerIndex = nOldIndex
end

-- ±£´æÃ¿¹ØÍæ¼ÒµÄ¼Ç·ÖÐÅÏ¢
function TB_StoreScore()									-- È«¶Ó»ñµÃ¹Ø¿¨½±Àø
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nRanInt = random(0,14)
	local nOldIndex = PlayerIndex
	local nCaptain = {"", "§éi tr­ëng"}
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
--- »ý·Ö¼ÇÂ¼
		local nBonus = TB_BONUS_Total[nZone]
		local nSigle_Bonus = (nBonus / (GetTeamSize() * nStage)) * (1.2 - (TC_TIMER_Count[nZone] / TC_TIMER_LIMIT_TABLE[nStage]))
		nSigle_Bonus = (nSigle_Bonus * (15 + nStage * 1.5)) / 10
		nSigle_Bonus = GetTask(TB_BONUS_SCORE) + nSigle_Bonus
		SetTask(TB_BONUS_SCORE, nSigle_Bonus)						-- ½±Àø»ý·Ö
--- Ê±¼ä¼ÇÂ¼
		local nSigle_Time = GetTask(TB_BONUS_TIME) + (TC_TIMER_Count[nZone]) * 14 - 7 + nRanInt
		SetTask(TB_BONUS_TIME, nSigle_Time)
--- ²ÎÓë´ÎÊý
		if nStage == 1 then
			local nSigle_Played = GetTask(TB_BONUS_PLAYED) + 1
			SetTask(TB_BONUS_PLAYED, nSigle_Played)
		end
--- Í¨¹Ø´ÎÊý
		if nStage == 2 then
			local nSigle_Finished = GetTask(TB_BONUS_FINISHED) + 1
			SetTask(TB_BONUS_FINISHED, nSigle_Finished)
		end
--- ´³¹Ø´ÎÊý
		if (nStage >= 1) and (nStage <= 9) then
			local nSigle_Stage = GetTask(TB_BONUS_STAGE) + 1
			SetTask(TB_BONUS_STAGE, nSigle_Stage)
		end
--- É±¹Ö×ÜÊý
		if TC_KILL_Player[PlayerIndex] == nil then
			TC_KILL_Player[PlayerIndex] = {}
		end
		if TC_KILL_Player[PlayerIndex][nStage] == nil then
			TC_KILL_Player[PlayerIndex][nStage] = 0
		end
		local nSigle_Killed = GetTask(TB_BONUS_KILLED) + TC_KILL_Player[PlayerIndex][nStage]
		SetTask(TB_BONUS_KILLED, nSigle_Killed)
--- ¶Ó³¤´ÎÊý
		if (nStage == 1) and (TM_IsCaptain() == 1) then
			local nSigle_Becaptain = GetTask(TB_BONUS_BECAPTAIN) + 1
			SetTask(TB_BONUS_BECAPTAIN, nSigle_Becaptain)
		end
--- ´¦ÀíÍê³É
	end
	PlayerIndex = nOldIndex
end

--============================================================================================== GAME STAGES ====
-- Game Stages
GS_STAGE_START = {					-- ²Ø½£Ê¹Õß¿ªÊ¼¶Ô»°µÄÄÚÈÝ
	MU_GetColoredText("Tµng KiÕm s¬n trang. S¬n M«n", "gold").."\n §Õn Tµng KiÕm s¬n trang ®Òu lµ nh÷ng anh tµi kú n÷ trong giang hå, cã g× thÊt lÔ xin l­îng thø. \n Trang chñ muèn thö tµi c¸c vÞ. \n §¸nh b¹i 25"..MU_GetColoredText("Gia ®inh", "green").."\n. §¸nh b¹i"..MU_GetColoredText("Tæng qu¶n ngo¹i viÖn", "green"),
	MU_GetColoredText("§¹i ViÖn. Tµng KiÕm s¬n trang", "gold").."\n §¹i viÖn do Tæng qu¶n néi viÖn phô tr¸ch, cã g× cÇn xin ch­ vÞ cø tù nhiªn. \n. "..MU_GetColoredText("????", "green").."\n. §¸nh b¹i"..MU_GetColoredText("Tæng qu¶n néi viÖn", "green"),
	MU_GetColoredText("HËu Hoa Viªn. Tµng KiÕm s¬n trang", "gold").."\n HËu Hoa viªn kh«ng cho phÐp ng­êi ngoµi ra vµo. C¸c vÞ ®õng chäc giËn §¹i TiÓu Th­. \n §¹i tiÓu th­ xinh ®Ñp nh­ng do tõ nhá ®· theo cha häc vâ nªn tÝnh khÝ h¬i ngç ng­îc. \n. §¸nh b¹i 8"..MU_GetColoredText("L·o béc", "green").."\n. §¸nh b¹i"..MU_GetColoredText("§¹i tiÓu th­", "green"),
	MU_GetColoredText("Liªn Hoµn Sµo. Tµng KiÕm s¬n trang", "gold").."\n Trong Cöu Cung ®Æt 9 ®Ønh l­ h­¬ng cã ch¹m træ Tam s¾c kú th¹ch, tr·i qua nhiÒu ®êi ®­îc ng­ng kÕt bëi tia löa vµ khãi ®óc kiÕm ë s¬n trang. §õng nh×n vÎ ngoµi mµ xem th­êng! ChØ cÇn cã ng­êi ngang nhiªn ®ét nhËp vµo, Tam s¾c kú th¹ch sÏ ph¸t huy ma lùc. \n . Lµm bÓ"..MU_GetColoredText("L­ h­¬ng", "green").."\n. §¸nh b¹i"..MU_GetColoredText("???", "green"),
	MU_GetColoredText("Tµng KiÕm C¸c. Tµng KiÕm s¬n trang", "gold").."\n N¬i ®©y ®· tµng gi÷ v« sè ®ao kiÕm cã gi¸ trÞ liªn thµnh. \n §Æc biÖt lµ c¸c lo¹i vò khÝ thuéc hÖ ngò hµnh. \n Rót vò khÝ ra ®¸nh b¹i"..MU_GetColoredText("B¶o vÖ ngò hµnh", "green").."\n VÞ huynh ®Ö nµo cã thÓ thö søc \n ®¸nh b¹i"..MU_GetColoredText("Tr­ëng l·o Tµng KiÕm C¸c", "green"),
	MU_GetColoredText("Tµng KiÕm s¬n trang. Tö Tróc L©m", "gold").."\n Nghe nãi chèn nµy vèn lµ n¬i tró ngô cña mét vÞ tiªn nh©n, tæng céng 16 ph­¬ng vÞ, ®Òu cã Kh¾c Ên phï, dÔ vµo khã ra. \n NÕu c¸c vÞ cã thÓ ra ®­îc, l·o phu sÏ dÉn ®­êng ®Õn KiÕm Trñng. \n ®i t×m vµ"..MU_GetColoredText("Sø gi¶ Tµng KiÕm", "green").." ®èi tho¹i .",
	MU_GetColoredText("Tµng KiÕm s¬n trang. Tö Tróc L©m", "gold").."\n Nghe nãi chèn nµy vèn lµ n¬i tró ngô cña mét vÞ tiªn nh©n, tæng céng 16 ph­¬ng vÞ, ®Òu cã Kh¾c Ên phï, dÔ vµo khã ra. \n NÕu c¸c vÞ cã thÓ ra ®­îc, l·o phu sÏ dÉn ®­êng ®Õn KiÕm Trñng. \n ®i t×m vµ"..MU_GetColoredText("Sø gi¶ Tµng KiÕm", "green").." ®èi tho¹i .",
	MU_GetColoredText("Tµng KiÕm s¬n trang. Tö Tróc L©m", "gold").."\n Nghe nãi chèn nµy vèn lµ n¬i tró ngô cña mét vÞ tiªn nh©n, tæng céng 16 ph­¬ng vÞ, ®Òu cã Kh¾c Ên phï, dÔ vµo khã ra. \n NÕu c¸c vÞ cã thÓ ra ®­îc, l·o phu sÏ dÉn ®­êng ®Õn KiÕm Trñng. \n ®i t×m vµ"..MU_GetColoredText("Sø gi¶ Tµng KiÕm", "green").." ®èi tho¹i .",
	MU_GetColoredText("Tµng KiÕm s¬n trang. KiÕm Chñng", "gold").."\n KiÕm Chñng ®­îc xem lµ vïng cÊm mËt cña Tµng KiÕm S¬n Trang, bëi n¬i ®©y ®­îc cÊt nhiÒu thanh kiÕm quý. \n . Th¸o 5 c©y"..MU_GetColoredText("Ngò Hµnh kiÕm", "green").."\n. §¸nh b¹i"..MU_GetColoredText("Cöu TuyÖt KiÕm Ma", "green")}
GS_STAGE_END = {					-- ²Ø½£Ê¹Õß½áÊø¶Ô»°µÄÄÚÈÝ
	MU_GetColoredText("Tµng KiÕm s¬n trang. S¬n M«n", "gold").."\n Chóc mõng c¸c vÞ ®· v­ît qua thö th¸ch ®Çu tiªn, xin chuÈn bÞ cho thö th¸ch tiÕp theo!",
	MU_GetColoredText("§¹i ViÖn. Tµng KiÕm s¬n trang", "gold").."\n Chóc mõng c¸c vÞ ®· v­ît qua thö th¸ch thø 2, xin chuÈn bÞ cho thö th¸ch tiÕp theo!",
	MU_GetColoredText("HËu Hoa Viªn. Tµng KiÕm s¬n trang", "gold").."\n Chóc mõng c¸c vÞ ®· v­ît qua thö th¸ch thø 3, xin chuÈn bÞ cho thö th¸ch tiÕp theo!",
	MU_GetColoredText("Liªn Hoµn Sµo. Tµng KiÕm s¬n trang", "gold").."\n Chóc mõng c¸c vÞ ®· v­ît qua thö th¸ch thø 4, xin chuÈn bÞ cho thö th¸ch tiÕp theo!",
	MU_GetColoredText("Tµng KiÕm C¸c. Tµng KiÕm s¬n trang", "gold").."\n Chóc mõng c¸c vÞ ®· v­ît qua thö th¸ch thø 5, xin chuÈn bÞ cho thö th¸ch tiÕp theo!",
	MU_GetColoredText("Tµng KiÕm s¬n trang. Tö Tróc L©m", "gold").."\n Chóc mõng c¸c vÞ ®· v­ît qua thö th¸ch thø 6, xin chuÈn bÞ cho thö th¸ch tiÕp theo!",
	MU_GetColoredText("Tµng KiÕm s¬n trang. Tö Tróc L©m", "gold").."\n Chóc mõng c¸c vÞ ®· v­ît qua thö th¸ch thø 7, xin chuÈn bÞ cho thö th¸ch tiÕp theo!",
	MU_GetColoredText("Tµng KiÕm s¬n trang. Tö Tróc L©m", "gold").."\n Chóc mõng c¸c vÞ ®· v­ît qua thö th¸ch thø 8, xin chuÈn bÞ cho thö th¸ch tiÕp theo!",
	MU_GetColoredText("Tµng KiÕm s¬n trang. KiÕm Chñng", "gold").."\n Chóc mõng c¸c anh hïng v­ît ¶i thµnh c«ng! X­a nay, nhiÒu anh hïng h¶o h¸n còng khã lßng qua næi. C¸c vÞ xuÊt s¾c v­ît ¶i, lËp nªn ®¹i nghiÖp, danh chÊn giang hå! L·o phu hÕt lßng kÝnh phôc!!!"}
GS_FORSELECT = {					-- Óë²Ø½£Ê¹Õß¶Ô»°µÄÑ¡Ïî
"b¾t ®Çu thö th¸ch/GS_StartStage",
"vµo ¶i kÕ tiÕp./GS_NextStage",
"nhËn phÇn th­ëng ®éi tr­ëng.",
"§iÒu chØnh mua b¸n. (CÇn 1 anh hïng thiÕp cho c¶ ®éi cïng mua b¸n)/GS_Trade",
"§iÒu kiÖn mua b¸n./GS_Trade",
"nghØ ng¬i mét l¸t./GS_ExitSay",
"më r­¬ng chøa ®å. ( cÇn 1 Anh Hïng thiÕp)/GS_OpenBox"}
GS_ERRORMSG = {
"Ch­a ®ñ Anh Hïng thiÕp!",
""}

GS_RECORD_DATE = 1820				-- Task Ë÷ÒýºÅ Ã¿ÌìÄÜ½øÈë²Ø½£µÄÊ±¼ä¼ÇÂ¼ 
GS_RECORD_CHANCE = 1821				-- Task Ë÷ÒýºÅ Ã¿ÌìÄÜ½øÈë²Ø½£µÄ´ÎÊý¼ÇÂ¼
GS_STAGE_USED = {0,0,0,0,0}			-- ¼ÇÂ¼Ä³×é¹Ø¿¨ÊÇ·ñÒÑ¾­ÔÚÊ¹ÓÃÁË
GS_USEDNOTE_IMG = {"<color=green>0<color>", "<color=red>X<color>"}
GS_USEDNOTE_TXT = {" (ch­a sö dông, nhÊp chän vµo ¶i)", " (®ang sö dông, nhÊp chän kiÓm tra tr¹ng th¸i)"}
GS_ENTERTALK = "VÞ anh hïng nµy muèn vµo trËn ®Þa nµo? \n".."[TrËn ®Þa] TrËn ®Þa 1 TrËn ®Þa 2 TrËn ®Þa 3 TrËn ®Þa 4 TrËn ®Þa 5 \n".."[Tr¹ng th¸i]       "..GS_USEDNOTE_IMG[GS_STAGE_USED[1]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[2]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[3]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[4]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[5]+1]..""
GS_MESSENGER_MID = {"V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm"}
GS_MESSENGER_STARTPOS = {			-- ²Ø½£Ê¹ÕßÔÚÃ¿¹Ø¿ªÊ¼µÄÊ±ºò³öÏÖµÄÎ»ÖÃ
{1529, 3476}, {1613, 3182}, {1605, 3170}, {1697, 3067}, {1698, 3441}, {1,1}, {1,1}, {1477, 3170}, {1567, 3236}}
GS_MESSENGER_ENDPOS = {				-- ²Ø½£Ê¹ÕßÔÚÃ¿¹Ø½áÊøµÄÊ±ºò³öÏÖµÄÎ»ÖÃ
{1597, 3216}, {1659, 3128}, {1667, 3104}, {1860, 2899}, {1592, 3180}, {1,1}, {1,1}, {9999, 9999}, {1567, 3236}}
GS_PLAYER_STARTPOS = {				-- Íæ¼ÒÔÚÃ¿¹Ø¿ªÊ¼µÄÊ±ºò³öÏÖµÄÎ»ÖÃ
{1523, 3481}, {1609, 3188}, {1600, 3177}, {1690, 3073}, {1698, 3451}, {1,1}, {1,1}, {1487, 3169}, {1567, 3246}}

GS_IsAllowTrade = {0, 0, 0, 0, 0}			-- ÊÇ·ñÔÊÐí¹ºÂòµÀ¾ßµÄ±ê¼Ç
GS_HERO_TOKEN = {2, 0, 31}					-- Ó¢ÐÛÌû
GS_SALE_INDEX = {1,1,1,1,1,1,1,1,1}			-- Ã¿¹Ø¿¨µÄÉÌµê±àºÅ
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
		

-- ÔÚ½øÈëÉ½×¯Ç°ÅÐ¶ÏËùÓÐ¶ÓÔ±ÊÇ·ñÔÚ ÏåÑô³ÇÀï
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
	local nChance = 5	--½øÈë´ÎÊýÏÞÖÆ
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
			MU_Msg2Team(GetName().."Kh«ng thÓ vµo Tµng KiÕm s¬n trang (H«m nay ®· vµo 5 lÇn råi ). ["..GetTask(GS_RECORD_CHANCE).."/5]")
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
				MU_Msg2Team(GetName().."H«m nay ®· vµo S¬n Trang ["..GetTask(GS_RECORD_CHANCE).."] lÇn")
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
			MU_Msg2Team(GetName().."Kh«ng thÓ vµo Tµng KiÕm s¬n trang (§ang nghØ ng¬i).")
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

-- ÕâÀïÊÇÅÐ¶ÏÍæ¼ÒÊÇ·ñÂú×ã½øÈëÉ½×¯µÄÌõ¼þ
function GS_EnterCheck()
	local GS_TeamLeaderTxt = ""
	local GS_TeamSizeTxt = ""
	local GS_TeamLevelTxt = ""
	local GS_TeamItemTxt = ""
	local GS_TeamDateTxt = ""
	local nCheckPoint = {0, 0, 0, 0, 0, 0, 0}
-------------------------------------
	if TM_IsCaptain() == 1 then
		nCheckPoint[1] = 1
		GS_TeamLeaderTxt = "<color=green>§éi tr­ëng<color>"
	else
		GS_TeamLeaderTxt = "<color=red>§éi tr­ëng<color>"
	end
-------------------------------------
	local nTeamSize = GetTeamSize()
	if ((nTeamSize >= 5) and (GS_AreaCheck() == 1)) and (GS_CheckRoute() >= 5) then
		nCheckPoint[2] = 1
		GS_TeamSizeTxt = "<color=green>5 ng­êi trë lªn (®éi viªn ë"..SF_TOWNNAME..")<color> "
	else
		GS_TeamSizeTxt = "<color=red>Tèi thiÓu cã 5 hÖ ph¸i kh¸c nhau cïng ë ("..SF_TOWNNAME..")<color>"
	end
-------------------------------------
	local nLowestLevel = 50
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() <= nLowestLevel then
			nLowestLevel = GetLevel()
		end
	end
	PlayerIndex = nOldIndex
	if (nLowestLevel >= 50) and (nTeamSize > 0) then
		nCheckPoint[3] = 1
		GS_TeamLevelTxt = "<color=green>§¼ng cÊp lín h¬n hoÆc b»ng cÊp 50<color>"
	else
		GS_TeamLevelTxt = "<color=red>§¼ng cÊp lín h¬n hoÆc b»ng cÊp 50<color>"
	end
-------------------------------------
	local nItemCount = GetItemCount(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3])
	-- ¼ÆËãÒªÊÕÈ¡¶àÉÙÕÅÓ¢ÐÛÌû
	local nNeedCount = CalcYingXiongTie(1)

	if (nItemCount >= nNeedCount) then
		nCheckPoint[4] = 1
		GS_TeamItemTxt = "<color=green>"..nNeedCount.."Anh hïng thiÕp <color>"
	else
		GS_TeamItemTxt = "<color=red>"..nNeedCount.."Anh hïng thiÕp <color>"
	end
-------------------------------------
--	if GS_DateCheck() == 1 then
--		nCheckPoint[5] = 1
--		GS_TeamDateTxt = "<color=green>Ã¿ÌìÎå´Î<color>"
--	else
--		GS_TeamDateTxt = "<color=red>Ã¿ÌìÎå´Î<color>"
--	end
-------------------------------------
	if GS_SleepCheck() == 1 then
		nCheckPoint[6] = 1
	end
-------------------------------------

	if (nCheckPoint[1] == 1) and (nCheckPoint[2] == 1) and (nCheckPoint[3] == 1) and (nCheckPoint[4] == 1) then
		return 2
	else
		local GS_COMMONTALK = "ChØ cã tæ chøc"..GS_TeamSizeTxt.."Th¶"..GS_TeamLevelTxt.." (cÊp) ®· lËp tæ ®éi, do "..GS_TeamLeaderTxt.."Gîi ý"..GS_TeamItemTxt.."míi gÆp ®­îc trang chñ"..GS_TeamDateTxt..". \n \n<color=gray>(Ch÷ ®á biÓu thÞ ®éi ch­a ®ñ ®iÒu kiÖn, ch÷ xanh biÓu thÞ ®éi ®· ®ñ ®iÒu kiÖn)<color>"
		Talk(1, "", GS_COMMONTALK)
		return nCheckPoint[1], nCheckPoint[2], nCheckPoint[3], nCheckPoint[4], nCheckPoint[5]
	end
end

function GS_EnterTaskTalk()
	local GS_ENTERTASKTALK = "Ta theo lÖnh trang chñ ®Õn ®©y nghªnh tiÕp c¸c vÞ anh hïng, xin hái cã cÇn trî gióp g× kh«ng?"
	if (GetItemCount(2,0,333) == 0) then
		GS_ENTERTASKTALK = GS_ENTERTASKTALK.."Ta cã 1 quyÓn <Tµng KiÕm ChÝ>."
		Msg2Player("NhËn ®­îc 1 quyÓn <Tµng KiÕm ChÝ>")
		AddItem(2,0,333,1)
	end
	Say(GS_ENTERTASKTALK, 8, "Liªn quan Tµng KiÕm s¬n trang/GS_EnterTaskTalk_1", 
				 			 "Liªn quan Anh Hïng thiÕp/GS_EnterTaskTalk_2", 
							 "Liªn quan Tµng KiÕm thÊt ¶i/GS_EnterTaskTalk_3", 
							 "Liªn quan §iÒu kiÖn v­ît ¶i/GS_EnterTaskTalk_4", 
							 "\nTa muèn ®­a ng­êi v­ît ¶i \n /GS_EnterTaskTalk_5",  -- DongTinhNang
							 "NhËn thuëng tham gia 7 lÇn/get_Award7", 
							 "Ta muèn mua 1  Tµng KiÕm Anh Hïng ThiÕp ( 20 xu vËt phÈm )/GS_ChangeAHL",
							 "Ta muèn ®æi ®iÓm tÝch lòy Tµng KiÕm lÊy phÇn th­ëng/GS_EnterTaskTalk_6",
							 "V·n sinh nghe uy danh cña Sø gi¶ Tµng KiÕm nªn ®Æc biÖt ®Õn th¨m!/GS_EnterTaskTalk_7")	
end
	function DongTinhNang()
		Talk(1,"","TÝnh n¨ng V­ît ¶i Tµng KiÕm ®ang t¹m ®ãng, ®¹i hiÖp h·y quay l¹i sau !!!")
	end
	function GS_EnterTaskTalk_1()
		Say("Tµng KiÕm s¬n trang næi tiÕng víi nghÒ ®óc kiÕm nh­ng trong gian hå Ýt ai biÕt ®Õn. GÇn ®©y cã quyÓn <ThÕ Gia Phæ> cña B¸ch HiÓu Sinh cã nãi ®Õn kü n¨ng ®óc kiÕm cña bæn trang, nhiÒu vÞ anh hïng còng muèn ®Õn t×m hiÓu. Nh­ng ®Ó ®­îc vµo s¬n trang cÇn ph¶i v­ît qua 7 cöa ¶i. Xin hái ®¹i hiÖp cã cÇn ta gióp g× kh«ng?",2,"Ta muèn hái th¨m c¸i kh¸c/GS_EnterTaskTalk","KÕt thóc ®èi tho¹i/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_2()
		Say("Anh hïng thiÕp cã thÓ mua ë c¸c tiÖm t¹p hãa trong c¸c ®¹i thµnh thÞ",2,"Ta muèn hái th¨m c¸i kh¸c/GS_EnterTaskTalk","KÕt thóc ®èi tho¹i/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_3()
		Say("Tµng KiÕm ThÊt ¶i lµ 7 ¶i lín ®­îc x©y theo ®Þa h×nh cña S¬n Trang, néi hîp b¸t qu¸i, ©m chøa ngò hµnh, c¹m bÉy trïng trïng. Ng­êi ngoµi r¬i vµo cÇm ch¾c cöu tö nhÊt sinh. Ta thÊy ng­¬i hîp nh·n nªn cã chót høng thó. CÇn ta gióp g× n÷a kh«ng?",2,"Ta muèn hái th¨m c¸i kh¸c/GS_EnterTaskTalk","KÕt thóc ®èi tho¹i/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_4()
		Say("X©m nhËp Tµng KiÕm s¬n trang cÇn 5 chiÕn h÷u ®¼ng cÊp"..SF_TOWNNAME.."lín h¬n hoÆc b»ng cÊp 50, ®­îc ®éi tr­ëng xuÊt tr×nh Anh Hïng thiÕp. Mçi ngµy, chØ nhËn ®­îc 5 lÇn lêi mêi cña Tµng KiÕm s¬n trang trang chñ!",2,"Ta muèn hái th¨m c¸i kh¸c/GS_EnterTaskTalk","KÕt thóc ®èi tho¹i/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_5()
	--	local nMap = GetWorldPos()
--		if nMap ~= 350 and nMap ~= 100 then
--			Talk(1,"","C¸c h¹ chØ cã thÓ vµo Tµng KiÕm S¬n Trang tõ T­¬ng D­¬ng vµ TuyÒn Ch©u!")
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
				gf_Msg2Team("H«m nay "..GetName().." ®· ®i 7 lÇn.")
				return
			end
		end
		PlayerIndex = nOldIndex
		GS_EnterTask()
	end
	function GS_EnterTaskTalk_6()
		local nScore = GetTask(TB_BONUS_SCORE)
		if nScore < 0 then
			Talk(1,"","§iÓm tÝch lòy kh¸c th­êng, kh«ng thÓ ®æi phÇn th­ëng")
			WriteLog("[Tµng KiÕm]"..GetName().."®iÓm tÝch lòy kh¸c th­êng")
			return
		end
		
		local sTalk = "§iÓm tÝch lòy cña ng­¬i hiÖn lµ <color=gold>"..nScore.."<color> ®iÓm. Xin hái muèn ®æi phÇn th­ëng nµo?"
		Say(sTalk,9,SB_FormatStr("      Trang phôc cÊp 50",30).." 100000 ®iÓm tÝch lòy/GS_TaskReward_1", 
			    SB_FormatStr("      Trang phôc cÊp 70",30).."500000 ®iÓm tÝch lòy/GS_TaskReward_2", 
			    --SB_FormatStr("      ÑªÆÇ",30).."7500»ý·Ö/GS_TaskReward_3", 
			    --SB_FormatStr("      ±ù¾§",30).."8500»ý·Ö/GS_TaskReward_4", 
			    SB_FormatStr("       10000 ®iÓm kinh nghiÖm",30).." 1000 ®iÓm tÝch lòy/#GS_TaskReward_5(1000)",
			    SB_FormatStr("      50000 ®iÓm kinh nghiÖm",30).."5000 ®iÓm tÝch lòy/#GS_TaskReward_5(5000)",
			    SB_FormatStr("      100000 ®iÓm kinh nghiÖm",30).." 10000 ®iÓm tÝch lòy/#GS_TaskReward_5(10000)",
			    SB_FormatStr("     500000 ®iÓm kinh nghiÖm",30).."50000 ®iÓm tÝch lòy/#GS_TaskReward_5(50000)",
			    SB_FormatStr("®æi kinh nghiÖm 1 lÇn",30).."§iÓm tÝch lòy/#GS_TaskReward_5(-1)", 
			    "\nTa muèn hái th¨m c¸i kh¸c/GS_EnterTaskTalk",
			    "KÕt thóc ®èi tho¹i/GS_EnterTaskTalk_7")
	end
	
--	local aGearsLevelTable = {3, 5, 7, 10}
--	local nGearsLevelTableLen = 4
--	local aGearsSlotTable = {103, 100, 101, 102, -1}
--	local aWeaponsTable = {3, 5, 8, 0, 1, 1, 3, 2, 10, 8, 0, 5, 9, 2, 9, 10}		-- ÃÅÅÉÎäÆ÷
--	local aGearsFactionTable = {1, 2, 3, 4, 6, 8, 9, 11, 12, 14, 15}	

		function GS_TaskReward_1()
			local nGearIndex = {0,102, 0}
			local nFaction = GetPlayerRoute()
			local nBody = GetBody()
			nGearIndex[3] = nFaction*100 + 50 + nBody
			local nScore = GetTask(TB_BONUS_SCORE)
			--Äê¾ÃÊ§ÐÞÆÁ±ÎµôÅ¼Ò²¸ÉµÃºÃ
			if nFaction == 23 or nFaction == 29 or nFaction == 30 then
				Talk(1,"","T¹i h¹ h×nh nh­ kh«ng thÊy l­u ph¸i c¸c h¹ ®· häc, nªn kh«ng cã trang bÞ nµo danh cho c¸c h¹ ®æi");
				return 0;
			end
			if nFaction == 0 then
				Talk(1,"","Ng­¬ich­a gia nhËp m«n ph¸i, kh«ng thÓ nhËn phÇn th­ëng!")
			else
				if nScore >= 100000 then
					SetTask(TB_BONUS_SCORE, (nScore-100000))
					AddItem(nGearIndex[1], nGearIndex[2], nGearIndex[3], 1, 1, -1, -1, -1, -1, -1, -1)
					WriteLog("[Tµng KiÕm] "..GetAccount().. " / "..GetName().." : Trang phôc cÊp 50:"..nGearIndex[1]..nGearIndex[2]..nGearIndex[3]);
				else
					Talk(1,"","§iÓm tÝch lòy cña b¹n kh«ng ®ñ")
				end
			end
		end
		function GS_TaskReward_2()
			local nGearIndex = {0,102, 0}
			local nFaction = GetPlayerRoute()
			local nBody = GetBody()
			nGearIndex[3] = nFaction*100 + 70 + nBody
			local nScore = GetTask(TB_BONUS_SCORE)
			--Äê¾ÃÊ§ÐÞÆÁ±ÎµôÅ¼Ò²¸ÉµÃºÃ
			if nFaction == 23 or nFaction == 29 or nFaction == 30 then
				Talk(1,"","T¹i h¹ h×nh nh­ kh«ng thÊy l­u ph¸i c¸c h¹ ®· häc, nªn kh«ng cã trang bÞ nµo danh cho c¸c h¹ ®æi");
				return 0;
			end
			if nFaction == 0 then
				Talk(1,"","Ng­¬ich­a gia nhËp m«n ph¸i, kh«ng thÓ nhËn phÇn th­ëng!")
			else
				if nScore >= 500000 then
					SetTask(TB_BONUS_SCORE, (nScore-500000))
					AddItem(nGearIndex[1], nGearIndex[2], nGearIndex[3], 1, 1, -1, -1, -1, -1, -1, -1)
					WriteLog("[Tµng KiÕm] "..GetAccount().. " / "..GetName().." : Trang phôc cÊp 70:"..nGearIndex[1]..nGearIndex[2]..nGearIndex[3]);
				else
					Talk(1,"","§iÓm tÝch lòy cña b¹n kh«ng ®ñ")
				end
			end
		end
		function GS_TaskReward_3()
			local nScore = GetTask(TB_BONUS_SCORE)
			if nScore >= 7500 then
				SetTask(TB_BONUS_SCORE, (nScore-7500))
				AddItem(2, 0, 334, 1)
			else
				Talk(1,"","§iÓm tÝch lòy cña b¹n kh«ng ®ñ")
			end
		end
		function GS_TaskReward_4()
			local nScore = GetTask(TB_BONUS_SCORE)
			if nScore >= 8500 then
				SetTask(TB_BONUS_SCORE, (nScore-8500))
				AddItem(2, 0, 335, 1)
			else
				Talk(1,"","§iÓm tÝch lòy cña b¹n kh«ng ®ñ")
			end
		end
		function GS_TaskReward_5(nPoint)
			local nScore = GetTask(TB_BONUS_SCORE)
			if nPoint == -1 then
				SetTask(TB_BONUS_SCORE, 0)
				ModifyExp(nScore * 10)
				WriteLog("[Tµng KiÕm] "..GetAccount().. " / "..GetName().."Dïng ®iÓm tÝch lòy ®æi"..(nScore * 10).." ®iÓm kinh nghiÖm")
			elseif nScore >= nPoint then
				SetTask(TB_BONUS_SCORE, (nScore - nPoint))
				ModifyExp(nPoint * 10)
				WriteLog("[Tµng KiÕm] "..GetAccount().. " / "..GetName().."Dïng ®iÓm tÝch lòy ®æi"..(nPoint * 10).." ®iÓm kinh nghiÖm")
			else
				Talk(1,"","§iÓm tÝch lòy cña b¹n kh«ng ®ñ")
			end
		end
		
	function GS_EnterTaskTalk_7()
		--Talk(1,"","ÉÙÏÀ¿ÍÆøÁË£¡")
	end


-- Ìõ¼þÂú×ãºóÈÃÍæ¼ÒÑ¡Ôñ³¡µØµÄ½çÃæºÍ¿ØÖÆ²¿·Ö
function GS_EnterTask()
	local sInfo1 = "VÞ anh hïng nµy muèn vµo trËn ®Þa nµo? \n"..SF_TOWNNAME..", xin hái c¸c anh hïng muèn vµo trËn ®Þa nµo? \n".."[TrËn ®Þa] TrËn ®Þa 1 TrËn ®Þa 2 TrËn ®Þa 3 TrËn ®Þa 4 TrËn ®Þa 5 \n"
	local sInfo2 = "[Tr¹ng th¸i]       "..GS_USEDNOTE_IMG[GS_STAGE_USED[1]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[2]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[3]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[4]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[5]+1].."\n"
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
	local sInfo3 = "[TiÕn ®é]     "..GS_USEDNOTE_COT[1].."      "..GS_USEDNOTE_COT[2].."      "..GS_USEDNOTE_COT[3].."      "..GS_USEDNOTE_COT[4].."      "..GS_USEDNOTE_COT[5]
	GS_ENTERTALK = sInfo1..sInfo2..sInfo3
	if (GS_EnterCheck() == 2) then
		Say(GS_ENTERTALK, 6, "TrËn ®Þa nhãm thø 1"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_1", 
					 		 "TrËn ®Þa nhãm thø 2"..GS_USEDNOTE_TXT[GS_STAGE_USED[2]+1].."/GS_ZoneSelect_2", 
							 "TrËn ®Þa nhãm thø 3"..GS_USEDNOTE_TXT[GS_STAGE_USED[3]+1].."/GS_ZoneSelect_3", 
							 "TrËn ®Þa nhãm thø 4"..GS_USEDNOTE_TXT[GS_STAGE_USED[4]+1].."/GS_ZoneSelect_4", 
							 "TrËn ®Þa nhãm thø 5"..GS_USEDNOTE_TXT[GS_STAGE_USED[5]+1].."/GS_ZoneSelect_5",
							 "lÇn sau quay l¹i nhÐ!/GS_ExitSay")
--		Say(GS_ENTERTALK, 9, "µÚÒ»¹Ø³¡µØ"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_1", 
--					 		 "µÚ¶þ¹Ø³¡µØ"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_12", 
--							 "µÚÈý¹Ø³¡µØ"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_13", 
--							 "µÚËÄ¹Ø³¡µØ"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_14", 
--							 "µÚÎå¹Ø³¡µØ"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_15",
--							 "µÚ°Ë¹Ø³¡µØ"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_18",
--							 "µÚ¾Å¹Ø³¡µØ"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_19",
--							 "µÚ¶þ×é³¡µØ"..GS_USEDNOTE_TXT[GS_STAGE_USED[2]+1].."/GS_ZoneSelect_2",
--							 "ÏÂ´ÎÔÙÀ´¡£/GS_ExitSay")
	end
end
	-- ÒÔÏÂ5¸öÊÇÑ¡Ôñ²»Í¬µÄÑ¡ÏîºóµÄ´¦Àí
	function GS_ZoneSelect_1()
		if (GS_STAGE_USED[1] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(1, 0)
				MU_Msg2Team("§éi ngò ®ang chuyÓn vµo.. [TrËn ®Þa 1]")
				GS_StartFlag = 1
			else
				Msg2Player("Kh«ng ®ñ Anh Hïng thiÕp, kh«ng thÓ vµo S¬n Trang")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(1)
			Msg2Player("Kh«ng ®ñ ®iÒu kiÖn...")
		end
	end
	function GS_ZoneSelect_2()
		if (GS_STAGE_USED[2] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(2, 0)
				MU_Msg2Team("§éi ngò ®ang chuyÓn vµo.. [TrËn ®Þa 2]")
			else
				Msg2Player("Kh«ng ®ñ Anh Hïng thiÕp, kh«ng thÓ vµo S¬n Trang")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(2)
			Msg2Player("Kh«ng ®ñ ®iÒu kiÖn...")
		end
	end
	function GS_ZoneSelect_3()
		if (GS_STAGE_USED[3] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(3, 0)
				MU_Msg2Team("§éi ngò ®ang chuyÓn vµo.. [TrËn ®Þa 3]")
			else
				Msg2Player("Kh«ng ®ñ Anh Hïng thiÕp, kh«ng thÓ vµo S¬n Trang")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(3)
			Msg2Player("Kh«ng ®ñ ®iÒu kiÖn...")
		end
	end
	function GS_ZoneSelect_4()
		if (GS_STAGE_USED[4] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(4, 0)
				MU_Msg2Team("§éi ngò ®ang chuyÓn vµo.. [TrËn ®Þa 4]")
			else
				Msg2Player("Kh«ng ®ñ Anh Hïng thiÕp, kh«ng thÓ vµo S¬n Trang")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(4)
			Msg2Player("Kh«ng ®ñ ®iÒu kiÖn...")
		end
	end
	function GS_ZoneSelect_5()
		if (GS_STAGE_USED[5] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(5, 0)
				MU_Msg2Team("§éi ngò ®ang chuyÓn vµo.. [TrËn ®Þa 5]")
			else
				Msg2Player("Kh«ng ®ñ Anh Hïng thiÕp, kh«ng thÓ vµo S¬n Trang")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(5)
			Msg2Player("Kh«ng ®ñ ®iÒu kiÖn...")
		end
	end
--	function GS_ZoneSelect_12()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 1)
--			MU_Msg2Team("¶ÓÎé´«ËÍÖÐ¡­¡­ [³¡µØÒ»¹Ø¿¨¶þ]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("½øÈëÌõ¼þ²»Âú×ã...")
--		end
--	end
--	function GS_ZoneSelect_13()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 2)
--			MU_Msg2Team("¶ÓÎé´«ËÍÖÐ¡­¡­ [³¡µØÒ»¹Ø¿¨Èý]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("½øÈëÌõ¼þ²»Âú×ã...")
--		end
--	end
--	function GS_ZoneSelect_14()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 3)
--			MU_Msg2Team("¶ÓÎé´«ËÍÖÐ¡­¡­ [³¡µØÒ»¹Ø¿¨ËÄ]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("½øÈëÌõ¼þ²»Âú×ã...")
--		end
--	end
--	function GS_ZoneSelect_15()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 4)
--			MU_Msg2Team("¶ÓÎé´«ËÍÖÐ¡­¡­ [³¡µØÒ»¹Ø¿¨Îå]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("½øÈëÌõ¼þ²»Âú×ã...")
--		end
--	end
--	function GS_ZoneSelect_18()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 7)
--			MU_Msg2Team("¶ÓÎé´«ËÍÖÐ¡­¡­ [³¡µØÒ»¹Ø¿¨°Ë]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("½øÈëÌõ¼þ²»Âú×ã...")
--		end
--	end
--	function GS_ZoneSelect_19()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 8)
--			MU_Msg2Team("¶ÓÎé´«ËÍÖÐ¡­¡­ [³¡µØÒ»¹Ø¿¨¾Å]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("½øÈëÌõ¼þ²»Âú×ã...")
--		end
--	end

	-- Íæ¼Ò²é¿´ÒÑ¾­±»Ê¹ÓÃµÄ³¡µØÊ±µÄ½çÃæÏÔÊ¾
	function GS_ViewZone(nZone)
		--local sBNum = {"Ò¼", "·¡", "Èþ", "ËÁ", "Îé", "Â½", "Æâ", "°Æ", "¾Á", "Áã", "??"}
		local sBNum = {"mét", "hai", "ba", "bèn", "Ngò ", "s¸u", "b¶y", "t¸m", "chÝn", "0", "??"}
		local sSNam = {"S¬n m«n", "§¹i viÖn", "HËu hoa viªn", "Liªn Hoµn Sµo", "Tµng KiÕm c¸c", "????", "????", "Tö Tróc l©m", "KiÕm Chñng", "????", "????"}
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
--			Temp2 = TC_TIMER_LIMIT_TABLE[Temp]*14	-- Êµ¼ÊÊ±¼äÏÔÊ¾
--			Temp2 = ((Temp2-mod(Temp2, 60))/60)..":"..mod(Temp2, 60)
			Temp2 = TC_TIMER_LIMIT_TABLE_UI[Temp]	-- ½üËÆÕûÊýÊ±¼äÏÔÊ¾
		end
		local sLine1 = "                         M· sè trËn ®Þa: <color=gold>"..sBNum[nZone].."<color>\n"
		local sLine2 = "                         ¶i hiÖn t¹i: <color=gold>"..sSNam[Temp].."<color>("..sBNum[Temp]..")\n"
		Temp = TC_TIMER_Count[nZone]*14
		if (Temp < 1) or (Temp == nil) then
			Temp = "?:??"
		else
			Temp = ((Temp-mod(Temp, 60))/60)..":"..mod(Temp, 60)
		end
		local sLine3 = "                         Thêi gian qua ¶i: <color=gold>"..Temp.."<color>/"..Temp2.."\n"
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
		local sLine4 = "                         Tªn ®éi tr­ëng: <color=green>"..Temp.."<color> (CÊp:"..Temp2..")\n"
		Temp = TM_MEMBER_MaxLevel[nZone]
		Temp = MU_Div(Temp)
		if Temp <= 5 then
			Temp = "<color=green>"..Temp.."<color>"
		elseif Temp <= 7 then
			Temp = "<color=gold>"..Temp.."<color>"
		else
			Temp = "<color=red>"..Temp.."<color>"
		end
		local sLine5 = "                         Sè l­îng:  "..Temp3.."/<color=red>8<color>\n"
		local sLine6 = "                         §é khã:  "..Temp.."/<color=red>9<color>\n"
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
		local sLine7 = "                         §iÓm v­ît ¶i:  "..Temp.." (Sè l­îng ®¸nh b¹i:"..Temp2..")"
		local sLine8 = ""				
		Say(sLine1..sLine2..sLine3..sLine4..sLine5..sLine6..sLine7, 0)
	end
	
-- ´´½¨Ã¿¹Ø¿¨µÄ²Ø½£Ê¹Õß(Í¨³£ÊÇÈ±Ê¡ËùÓÐ²ÎÊý,»á¸ù¾ÝÍæ¼ÒÓÎÏ·µÄ½ø³Ì×Ô¶¯´´½¨ÐèÒªµÄ²Ø½£Ê¹Õß)
-- nMode : 0.¿ªÊ¼NPC 1.½áÊøNPC
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
--	local nMapID = 890 + (nZone * 10) + nStage		-- ²»Í¬µÄ³¡µØ\¹Ø¿¨È·¶¨²»Í¬µÄ µØÍ¼ ID
--                   ·þÎñÆ÷        ³¡µØ×é            ¹Ø¿¨
	local nMapID = SF_MAPBASE + (nZone * 10) + nStage		-- ²»Í¬µÄ³¡µØÈ·¶¨²»Í¬µÄ µØÍ¼ ID
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

-- Óë²Ø½£Ê¹Õß¶Ô»°@¿ªÊ¼¹Ø¿¨Ê±
function GS_Talk4Start(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if TM_IsCaptain() == 1 then							-- ÅÐ¶ÏÊÇ·ñÊÇ¶Ó³¤
		Say(GS_STAGE_START[nStage], 1, GS_FORSELECT[1])
	else
		Talk(1, "", GS_STAGE_START[nStage])
	end
end

-- Óë²Ø½£Ê¹Õß¶Ô»°@½áÊø¹Ø¿¨Ê±,ÕâÀï»á·ÖÅä¹Ø¿¨»ý·Ö
function GS_Talk4End(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	local sGCBonus = GS_FORSELECT[3].."("..TB_GetBonusChance()..")"
	sGCBonus = sGCBonus.."/GS_GetCaptainBonus"
	if TM_IsCaptain() == 1 then							-- ÅÐ¶ÏÊÇ·ñÊÇ¶Ó³¤
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

-- Óë²Ø½£Ê¹Õß¶Ô»°@ÅÐ¶ÏÊÇ½øÐÐ ¿ªÊ¼¶Ô»° »¹ÊÇ½øÐÐ ½áÊø¶Ô»°(Í¨³£ÊÇÈ±Ê¡ËùÓÐ²ÎÊý,»á¸ù¾ÝÍæ¼ÒÓÎÏ·µÄ½ø³Ì×Ô¶¯Ñ¡ÔñÐèÒª¶Ô»°ÄÚÈÝ)
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

-- ¹Ø¿¨Õý³£½áÊøºó,¿ªÊ¼ÏÂÒ»¹Ø¿¨(Ò»°ã±» GM_NextStageInit µ÷ÓÃ,²»µ¥¶ÀÊ¹ÓÃ)
-- nMode : -1.ËùÓÐ¶ÓÔ±·µ»ØÏåÑô 0.ËùÓÐ¶ÓÔ±µ½ÏÂÒ»¹Ø¿¨(È±Ê¡Ä¬ÈÏ) 1+.±íÊ¾°Ñµ±Ç°Íæ¼ÓËÍ»ØÏåÑô
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
--		local nMapID = 890 + nZone * 10 + nStage		-- ²»Í¬µÄ³¡µØ\¹Ø¿¨È·¶¨²»Í¬µÄ µØÍ¼ ID
--  	                 ·þÎñÆ÷        ³¡µØ×é            ¹Ø¿¨
		local nMapID = SF_MAPBASE + (nZone * 10) + nStage		-- ²»Í¬µÄ³¡µØÈ·¶¨²»Í¬µÄ µØÍ¼ ID
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

-- È«¶Ó´«ËÍµ½Ö¸¶¨×ø±ê
function GS_NewWorldTeam(nMap, nX, nY)
		local nOldIndex = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			local a,b,c = GetWorldPos()
			local nNewWorldResult = NewWorld(nMap, nX, nY)
		end
		PlayerIndex = nOldIndex
end

-- ½øÈëÏÂÒ»¹Ø¿¨µÄÑ¡ÏîËùµ÷ÓÃµÄ¹ý³Ì
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

-- ¶Ó³¤ÁìÈ¡½±ÀøµÄÑ¡ÏîËùµ÷ÓÃµÄ¹ý³Ì
function GS_GetCaptainBonus()
	TB_GetCaptainBonus()
end

-- ºÍ²Ø½£Ê¹Õß½øÐÐ½»Ò×µÄÑ¡ÏîËùµ÷ÓÃµÄ¹ý³Ì
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
			TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: Th«ng th­êng. Giao dÞch")
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
		Talk(1,"","Ng­¬i ch­a më r­¬ng, kh«ng thÓ sö dông chøc n¨ng nµy!")
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
		TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: Th«ng th­êng. R­¬ng chøa ®å")
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

-- ¿ªÊ¼Ò»¸ö¹Ø¿¨,°üÀ¨ÁË¹Ø¿¨ËùÐèÒªµÄ³õÊ¼»¯²¿·Ö
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
--		MC_NoSpawnNPCs(nStage, nMaxLevel, "¿´ÃÅ¹·")
--		MC_NoSpawnNPCs(nStage, nMaxLevel, "ÆÕÍ¨Ïä×Ó")
--		MC_BeSpawnNPCs(nStage, nMaxLevel, "¿´ÃÅ¹·", nZone, 1)
		ACT1_BOSS_Index[nZone] = 0
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = 25	-- ³öÏÖBOSSÐèÒªÉ±ËÀµÄ»¤Ôº¼Ò¶¡ÊýÁ¿
		TC_TASK_EventCount[nZone][2] = 0
		TC_TASK_EventCount[nZone][3] = 0
		TC_TASK_Conditions[nZone][3] = random(5, 10)	-- ³öÏÖ Event£º·ßÅ­µÄ¼Ò¶¡ ÐèÒªÉ±ËÀµÄ¹·µÄÊýÁ¿
		TC_TASK_Conditions[nZone][4] = random(120, 120)	-- ³öÏÖ Event£º·ßÅ­µÄÍâÔº×Ü¹Ü ÐèÒªÉ±ËÀµÄÈËÊý
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel, "Gia ®inh", nZone, 1)
		ACT2_GotSword[nZone] = 0
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = random(10, 15)	-- µôÂäÈÎÎñµÀ¾ßÐèÒªÉ±ËÀµÄÉ½×¯½ÌÍ·ÊýÁ¿
		TC_TASK_Conditions[nZone][2] = TC_TASK_Conditions[nZone][1] + random(15, 20)	-- ±Ø¶¨µôÂäÈÎÎñµÀ¾ßÐèÒªÉ±ËÀµÄÉ½×¯½ÌÍ·ÊýÁ¿
		local nMapID = GetWorldPos()
		local nBossIndex = CreateNpc("Néi qu¶n_®èi tho¹i", "Tæng qu¶n néi viÖn", nMapID, 1657, 3133)
--		local nBossIndex = CreateNpc("½­ºþºÀ½Ü", "ÄÚÔº×Ü¹Ü", nMapID, 1657, 3133)
		MC_Add2Group(nBossIndex)
		SetNpcDeathScript(nBossIndex, SF_FILE)
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		MC_BeSpawnNPCs(nStage, nMaxLevel, "Gia ®inh", nZone, 1)
		ACT3_CalculateOdderTable()
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = 16	-- Ë¢³öËùÓÐÀÏÅ®ÆÍÐèÒªÉ±ËÀµÄ»¤Ôº¼Ò¶¡ÊýÁ¿£¬Ã¿10¸öË¢Ò»¸öÅ®ÆÍ
		TC_TASK_EventCount[nZone][2] = 0	-- ¼ÇÂ¼ÒÑ¾­Ë¢µ½µÚN¸öÀÏÅ®ÆÍ
		ACT3_Keeper[nZone] = 0				-- ºó»¨Ô°Ö´ÊÂÊÇ·ñ¾ª¶¯
		ACT3_Traped[nZone] = 0				-- ²Èµ½»¨ÆÔµÄ´ÎÊý
		ACT3_ContrackSent[nZone] = 0		-- ÊÇ·ñÒÑ¾­½»»¹¹ýÂôÉíÆõÔ¼
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
		MU_Msg2Team("Do cã ng­êi l¹ x©m nhËp, Liªn Hoµn trËn ®· ph¸t huy hÕt ma lùc m¹nh mÏ.", 1)
		TC_TASK_EventCount[nZone][1] = 0	-- ¼ÇÂ¼»÷»îµÄ»ú¹ØÊýÁ¿
		TC_TASK_Conditions[nZone][1] = 0	-- ¼ÇÂ¼±»»÷»îµÄ»ú¹ØÀàÐÍ
		TC_TASK_EventCount[nZone][2] = 0	-- ¼ÇÂ¼½£ÁéµÄËÀÍö¸öÊý
		TC_TASK_Conditions[nZone][2] = 3	-- ¼ÇÂ¼½£ÁéµÄËÀÍö¸öÊýÐèÇó
		TC_TASK_Conditions[nZone][3] = TC_TIMER_LIMIT_TABLE[nStage]	-- ¿ªÆô»ú¹ØµÄÊ±¼äÏÞÖÆ
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_CreateSword()
		TC_TASK_EventCount[nZone][1] = 0	-- ¼ÇÂ¼°Î½£µÄ¸öÊý
		TC_TASK_EventCount[nZone][2] = 1	-- ¼ÇÂ¼²å½£µÄ¸öÊý
		TC_TASK_Conditions[nZone][2] = 6	-- ³öÏÖBOSSµÄ²å½£¸öÊý
		ACT5_DROP_ROW[nZone] = 0			-- ¼ÇÂ¼²å½£µÄ ÏàÎ»ÀàÐÍ
		ACT5_CHACUOLE[nZone] = {}			-- ¼ÇÂ¼²å´í½£µÄ´ÎÊý
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
--		Msg2Player("¿ªÊ¼µã£º"..nStartPoint.."  ½áÊøµã£º"..nEndPoint)
		GS_NewWorldTeam(nMapID, ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][2], ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][3])
		local nEndMessenger = CreateNpc("V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm", nMapID, ACT8_PATH_PortOut[ACT8_GetSnEIndex(1)][2], ACT8_PATH_PortOut[ACT8_GetSnEIndex(1)][3])
		SetNpcDeathScript(nEndMessenger, SF_FILE)
		MC_Add2Group(nEndMessenger)
		TC_STAGE_State[nZone] = 20
		ACT8_CreateLargeChest()
		ACT8_CreateSmallChest()
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		local nMapID = GetWorldPos()
		local nLevel = MU_Div(nMaxLevel)*10
		local aSLoca = {{1505, 3154}, {1473, 3335}, {1612, 3374}, {1677, 3218}, {1589, 3116}}
		local aSName = {"Kim KiÕm phong kh¾c", "Méc KiÕm phong kh¾c", "Thñy KiÕm phong kh¾c", "Háa KiÕm phong kh¾c", "Thæ KiÕm phong kh¾c"}
		SWORD_SEALTIME[nZone] = {0,0,0,0,0}
		SWORD_SEALINDEX[nZone] = {0,0,0,0,0}
		SWORD_BOSSSPWANED[nZone] = 0
		for i=1, 5 do
			local nBossIndex = CreateNpc("KiÕm ®µi"..nLevel, aSName[i], nMapID, aSLoca[i][1], aSLoca[i][2])
			MC_Add2Group(nBossIndex)
			local nCHP = -1*(GetUnitCurStates(nBossIndex, 1) - 1)
			AddUnitStates(nBossIndex, 1, nCHP)
		end
		local nBossIndex = CreateNpc("Bµn Long Trô", "KiÕm Ma ngñ mª", nMapID, 1567, 3240)
		SWORD_SleepOne[nZone] = nBossIndex
		MC_Add2Group(nBossIndex)
		SetNpcDeathScript(nBossIndex, SF_FILE)
	end
end
--============================================================================================== GAME MAIN ====
------------------------------------------------------------------------------------------------ FUNCTION ----
-- ÉèÖÃ¶ÓÎé¹æÔò
-- nMode : 0.¿ªÆô¹æÔò 1.¹Ø±Õ¹æÔò
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
		Msg2Player("Trong quy t¾c bè trÝ ¶i……")
		CleanInteractive()						-- ½â³ý»¥¶¯
--		SetLogoutRV(MU_Inverse(nMode))			-- ÖÐÍ¾ÖÐ¶Ïºó»Ø³Ç
		SetFightState(MU_Inverse(nMode))		-- ÉèÖÃÎª¿ÉÕ½¶·
		SetCreateTeam(MU_Inverse(nMode))		-- ¹Ø±Õ×é¶Ó¹¦ÄÜ
		UseScrollEnable(nMode)					-- ½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	    InteractiveEnable(nMode)				-- ½»»¥¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª
	    StallEnable(nMode)		   				-- °ÚÌ¯¿ª¹Ø
		ForbitTrade(MU_Inverse(nMode))			-- ½ûÖ¹½»Ò×
		--SetDeathScript("")					-- ÉèÖÃµ±Ç°Íæ¼ÒµÄËÀÍö½Å±¾
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
		SetFightState(nMode)		-- ÉèÖÃÎª¿ÉÕ½¶·
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

-- ¶ÓÎé½øÈëÏÂÒ»¹Ø¿¨,´ø³õÊ¼»¯²¿·Ö
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
				WriteLog("[Tµng KiÕm] "..GetName().."'s team is somthing wrong.")
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
			Msg2Player("§æi míi ghi nhí thêi gian ng¾n nhÊt: §¼ng cÊp-"..GetTask(TB_BONUS_CAPTAINLEVEL).." Thêi gian-"..GetTask(TB_BONUS_CAPTAINTIME))
		else
			Msg2Player("Ghi nhí thêi gian ng¾n nhÊt hiÖn t¹i: §¼ng c©p-"..GetTask(TB_BONUS_CAPTAINLEVEL).." Thêi gian-"..GetTask(TB_BONUS_CAPTAINTIME))
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
		MU_Msg2Team(" Hoµn thµnh tÊt c¶ cöa ¶i! TÊt c¶ chiÕn h÷u quay l¹i"..SF_TOWNNAME..".")
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
-- ¼ÆËãµÚÈý¹Ø³öÏÖ²»Í¬Î»ÖÃµÄ ÀÏÅ®ÆÍ µÄËæ»úË³Ðò
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

-- ´´½¨ ÀÏÅ®ÆÍ ,»á×Ô¶¯´¦Àí ÀÛ¼ÓÆ÷
function ACT3_CreateOdder(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	TC_TASK_EventCount[nZone][2] = TC_TASK_EventCount[nZone][2] + 1
	local nOdderFlag = ACT3_ODDER_Table[nZone][TC_TASK_EventCount[nZone][2]]
	local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
	local nOdderIndex = CreateNpc("L·o béc"..nlevel, "L·o béc", nMapID, ACT3_ODDER_POS[nOdderFlag][1], ACT3_ODDER_POS[nOdderFlag][2])
	MC_Add2Group(nOdderIndex)
	return nOdderIndex
end

-- ------------------------------------------------------------------------------------------------ <Act IV> ----
-- ------------------------------------------------------------------------------------------------ <Act IV Function> ----
-- ¼ÆËãµÚËÄ¹ØµÄ ÈýÖÖÆæÊ¯ µÄËæ»úÅÅ²¼
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
			CastState("state_slow",50,aTimes[1],1)								-- ÒÆ¶¯ËÙ¶È½µµÍ 50%
		end
		if ACT4_SWITCH_DEBUFF[nZone][2] == 0 and random(1,1000) <= nRndEnd then
			CastState("state_paralysis",100,aTimes[2],1)							-- ÁÙÊ±Âé±Ô
		end
		if ACT4_SWITCH_DEBUFF[nZone][3] == 0 and random(1,1000) <= nRndEnd then
			CastState("state_sleep",100,aTimes[3],1)								-- ÁÙÊ±Ë¯Ãß
		end
	end
	PlayerIndex = nOldIndex
end

-- ´´½¨ËùÓÐ ÆæÊ¯
function ACT4_CreateSwitch(nZone, nType)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	for i=1, 9 do
		local nType = ACT4_SWITCH_Table[nZone][i]
		local nSwitchIndex = CreateNpc("Ng­êi V« h×nh2", ACT4_SWITCH_Name[nType], nMapID, ACT4_SWITCH_POS[i][1], ACT4_SWITCH_POS[i][2])
		ACT4_SWITCH_Count[nZone][nType] = ACT4_SWITCH_Count[nZone][nType] + 1			-- ÀÛ¼Æ²»Í¬ÖÖÀàÓñµÄÊýÁ¿
		ACT4_SWITCH_Index[nZone][nType][ACT4_SWITCH_Count[nType]] = nSwitchIndex
		MC_Add2Group(nSwitchIndex)
		AddUnitStates(nSwitchIndex, 8, i)
--		Msg2Player("CreateSwitch: "..nType.." - "..ACT4_SWITCH_Count[nZone][nType].." - "..ACT4_SWITCH_Index[nZone][nType][ACT4_SWITCH_Count[nType]])
	end
end

-- ´´½¨µ¥Àà ÆæÊ¯
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
		local nSwitchIndex = CreateNpc("Ng­êi V« h×nh2", ACT4_SWITCH_Name[nType], nMapID, ACT4_SWITCH_POS[nLoc][1], ACT4_SWITCH_POS[nLoc][2])
		ACT4_SWITCH_Index[nZone][nType][i] = nSwitchIndex
		MC_Add2Group(nSwitchIndex)
		AddUnitStates(nSwitchIndex, 8, nLoc)
	end
end

-- È¡µÃ ÆæÊ¯ µÄÀàÐÍ
function ACT4_GetSwitchType(nName, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if (nName == nil) or (nName == "<Tö Thanh L­ h­¬ng >") then 
		return 1
	elseif(nName == "<Thanh Lam L­ h­¬ng >") then 
		return 2
	elseif(nName == "<Tö Lam L­ h­¬ng >") then 
		return 3
	end
	return 0
end

-- È¡µÃ ÆæÊ¯ µÄÎ»ÖÃ±àºÅ
function ACT4_GetSwitchFlag(nIndex, nZone)
	return GetUnitCurStates(nIndex, 8)
end

-- ´´½¨ÊØ»¤Ä³Î»ÖÃµÄÆæÊ¯µÄÊØÎÀNPC  ---ÒÑ¾­·ÏÆú
--function ACT4_CreateDefender(nFlag, nZone)
--	if nZone == nil then
--		nZone = TC_GetTeamZone()
--	end
--	local nMapID = GetWorldPos()
--	local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
--	local nSoulIndex = CreateNpc("½£Áé"..nlevel, "½£Áé", nMapID, ACT4_SWITCH_POS[nFlag][1], ----ACT4_SWITCH_POS[nFlag][2])
--	MC_Add2Group(nSoulIndex)
--	for i=1, 4 do
--		local nDefenderIndex = CreateNpc("Á¬»·ÚùÊØÎÀ"..nlevel, "Á¬»·ÎëÊØÎÀ", nMapID, --ACT4_SWITCH_DEFENDER[nFlag][i][1], ACT4_SWITCH_DEFENDER[nFlag][i][2])
--		MC_Add2Group(nDefenderIndex)
--	end
--end

-- ------------------------------------------------------------------------------------------------ <Act V> ----
-- ------------------------------------------------------------------------------------------------ <Act V Function> ----
function ACT5_GetSwordFlag(nIndex)
	return GetUnitCurStates(nIndex, 8)
end
function ACT5_Word2Num(nWN)
	if nWN == "Kim kiÕm" then
		return 1
	elseif nWN == "Méc kiÕm" then
		return 2
	elseif nWN == "Thñy kiÕm" then
		return 3
	elseif nWN == "Háa KiÕm" then
		return 4
	elseif nWN == "Thæ kiÕm" then
		return 5
	elseif nWN == 1 then
		return "Kim kiÕm"
	elseif nWN == 2 then
		return "Méc kiÕm"
	elseif nWN == 3 then
		return "Thñy kiÕm"
	elseif nWN == 4 then
		return "Háa KiÕm"
	elseif nWN == 5 then
		return "Thæ kiÕm"
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
	local nSword_Name = {"Kim kiÕm","Méc kiÕm","Thñy kiÕm","Háa KiÕm","Thæ kiÕm"}
	for i=1, 5 do
		local nTempRND = random(i, 5)
		local nTempEXC = nOrder_Table[nTempRND]
		nOrder_Table[nTempRND] = nOrder_Table[i]
		nOrder_Table[i] = nTempEXC
	end
--	Msg2Player(nOrder_Table[1].." "..nOrder_Table[2].." "..nOrder_Table[3].." "..nOrder_Table[4].." "..nOrder_Table[5])
	for i=1, 5 do
		local nOrderIndex = nOrder_Table[i]
		local nSwordIndex = CreateNpc("§èi tho¹i KiÕm §µi", nSword_Name[nOrderIndex], nMapID, ACT5_SWORD_PICKPOS[i][1], ACT5_SWORD_PICKPOS[i][2])
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
		local nDeskIndex = CreateNpc("Ng­êi V« h×nh", "KiÕm ®µi", nMapID, ACT5_SWORD_DROPPOS[i][1], ACT5_SWORD_DROPPOS[i][2])
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
	local nSword_Name = {"Kim kiÕm","Méc kiÕm","Thñy kiÕm","Háa KiÕm","Thæ kiÕm"}
	local nMapID = GetWorldPos()
	local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
	if TC_STAGE_State[nZone] < 15 then
		if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
			local nDefIndex = CreateNpc(sEffc..nlevel, "B¶o vÖ ngò hµnh", nMapID, ACT5_SWORD_PICKDEFENDER[nFlag][1][1], ACT5_SWORD_PICKDEFENDER[nFlag][1][2])
			MC_Add2Group(nDefIndex)
		end
		for j=1, 2 do
			for i=2, 6 do
				if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
					local nDefenderIndex = CreateNpc("§Ö tö cao cÊp"..nlevel, "§Ö tö s¬n trang", nMapID, ACT5_SWORD_PICKDEFENDER[nFlag][i][1], ACT5_SWORD_PICKDEFENDER[nFlag][i][2])
					MC_Add2Group(nDefenderIndex)
				end
			end
		end
	else
		if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
			local nDefIndex = CreateNpc(nSword_Name[nFlag]..nlevel, "B¶o vÖ ngò hµnh", nMapID, ACT5_SWORD_DROPDEFENDER[nFlag][1][1], ACT5_SWORD_DROPDEFENDER[nFlag][1][2])
			MC_Add2Group(nDefIndex)
		end
		for j=1, 2 do
			for i=2, 6 do
				if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
					local nDefenderIndex = CreateNpc("§Ö tö cao cÊp"..nlevel, "§Ö tö s¬n trang", nMapID, ACT5_SWORD_DROPDEFENDER[nFlag][i][1], ACT5_SWORD_DROPDEFENDER[nFlag][i][2])
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
		local nChestIndex = CreateNpc("R­¬ng vËt phÈm-cao", "Hoµng Kim b¶o r­¬ng", nMapID, ACT8_CHEST_L_Pos[nRandomTable[i]][1], ACT8_CHEST_L_Pos[nRandomTable[i]][2])
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
		local nChestIndex = CreateNpc("R­¬ng vËt phÈm-trung", "R­¬ng b¹c", nMapID, ACT8_CHEST_S_Pos[nRandomTable[i]][1], ACT8_CHEST_S_Pos[nRandomTable[i]][2])
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
		---ÊÕ·Ñ½øÈë
		local szLogTitle = "[Hoat dong trung thu 2009]";
		local nRetCode = 0;
		local nOldPlayer = PlayerIndex;
		if nStage == 1 then										--½øÈëµÚÒ»¹Ø¿¨
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				if PlayerIndex > 0 then
					nRetCode = AddItem(2, 1, 30106, 30);			
					if nRetCode == 1 then
						Msg2Player("§¹i hiÖp nhËn 30 bét m×");
					else
						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] thu ®­îc 30 bét m× thÊt b¹i, trë l¹i trÞ= "..nRetCode);
					end
				end
			end
			PlayerIndex = nOldPlayer;
		elseif nStage == 2 then 							--Í¨¹ØµÚÒ»¹Ø¿¨
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				if PlayerIndex > 0 then
					nRetCode = AddItem(2, 1, 30106, 30);			
					if nRetCode == 1 then
						Msg2Player("§¹i hiÖp nhËn 30 bét m×");
					else
						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] thu ®­îc 30 bét m× thÊt b¹i, trë l¹i trÞ= "..nRetCode);
					end
				end
			end
			PlayerIndex = nOldPlayer;
		elseif nStage == 5 then 							--Í¨¹ØµÚËÄ¹Ø¿¨
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				if PlayerIndex > 0 then
					nRetCode = AddItem(2, 1, 30106, 60);			
					if nRetCode == 1 then
						Msg2Player("§¹i hiÖp nhËn 60 bét m×");
					else
						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Thu ®­îc 60 bét m×, tr¶ l¹i trÞ = "..nRetCode);
					end
				end
			end
			PlayerIndex = nOldPlayer;
		end
	end
end

--09Äê8ÔÂ²Ø½£µ÷Õû½±Àø¸øÓè
function add_award_ex_0908(nStage)
	if nStage <= 1 then--½øÈëµÚÒ»¹ØÃ»½±Àø
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
					AddItem(2, 1, 30115, 1);--¸ø²Ø½£Áî			
					Msg2Player("B¹n nhËn ®­îc 1 Tµng KiÕm LÖnh");							
					WriteLogEx("Tang Kiem", "nhËn", 1, "Tµng KiÕm LÖnh");
				end
				--Modify by Trungbt
				if nNumVuotAi >= 2 then
					if nStage > 7 then
						local nExp_more = 5000000
						ModifyExp(nExp_more) --phÇn th­ëng 5 triÖu khi v­ît ¶i thµnh c«ng thu phÝ
						Msg2Player("B¹n nhËn ®­îc "..nExp_more.." ®iÓm kinh nghiÖm");		
						Earn(390000)
					end
				end
				if nStage == 5 then
					gf_WriteLogEx("Tang Kiem", "tham gia v­ît ¶i", 1, "Sè lÇn v­ît ¶i 4 thµnh c«ng lÇn"..nNumVuotAi.."_"..nLevel.."x")
				elseif nStage >= 7 then
					gf_WriteLogEx("Tang Kiem", "tham gia v­ît ¶i", 1, "Sè lÇn v­ît ¶i 7 thµnh c«ng lÇn"..nNumVuotAi.."_"..nLevel.."x")
				end
			
				--
				if nLevel >= 5 then
					local nExp = 0;
					if nStage == 66 then
						if GetTask(GS_RECORD_CHANCE) > 1 then
							nExp = tNEW_AWARD_EX_STAGE_7_2[nLevel];
						else
							nExp = tNEW_AWARD_EX_STAGE_7_NEW[nLevel];	
							Msg2Player("B¹n hoµn thµnh xong ¶i 7 lÇn miÔn phÝ")						
						end
						-- nhiÖm vô lµm giµu
						if CFG_NhiemVuLamGiau == 1 then	
								if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 3) == 0 then
									gf_SetTaskBit(TSK_LAMGIAU, 3, 1, 0)
									TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Hoµn thµnh nhiÖm vô tµng kiÕm.")
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
					Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");					
					WriteLogEx("Tang Kiem", "nhËn", nExp, "®iÓm kinh nghiÖm");
				end
			end
		end
		--ÆäËû½±Àø»ã×Ü
		aw_cjsz_award(nStage);
	end
	PlayerIndex = nOldPlayer;
end

-- Mua anh Hïng ThiÕp
function GS_ChangeAHL()
	if gf_Judge_Room_Weight(10,20)~= 1 or GetItemCount(2,1,30230) < 20 then
		Talk(1,"","B¹n kh«ng cã 20 xu vËt phÈm hoÆc hµnh trang b¹n kh«ng ®ñ « trèng , ®é nÆng ")
		return	
	end
	if DelItem(2,1,30230,20) == 1 then
		gf_AddItemEx2({2,0,31,1}, "Tµng KiÕm Anh Hïng ThiÕp", "Tang Kiem Son Trang", "nhËn")
	end
end

function get_Award7()
	if gf_Judge_Room_Weight(5,20)~= 1 then
		Talk(1,"","Hµnh trang b¹n kh«ng ®ñ « trèng , ®é nÆng ")
		return	
	end
	local nNumVuotAi = GetTask(GS_RECORD_CHANCE)
	if nNumVuotAi == 7 then
		Earn(1000000)
		AddItem(2,1,30230, 10) --Xu vËt phÈm
		AddItem(2,0,398, 2) --B¸t nh· lín
		AddItem(2,1,30497, 10) --Ma tinh
		local nExp_more2 = 10000000
		ModifyExp(nExp_more2) --phÇn th­ëng 10 triÖu khi v­ît ¶i thµnh c«ng thu phÝ
		Msg2Player("B¹n nhËn ®­îc "..nExp_more2.." ®iÓm kinh nghiÖm");		
		gf_WriteLogEx("Tang Kiem", "nhËn th­ëng thµnh c«ng", 1, "Hoµn thµnh 7 lÇn")
		SetTask(GS_RECORD_CHANCE, 100) --settask cho kh¸c gi¸ trÞ 7, qua ngµy tù reset
		--=============== Chuçi nhiÖm vô Phôc Sinh 2 =============
		if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 22 and PhucSinh2_GetMissionPart() > 0 then
			PhucSinh2_SetMissionPart()
		end
		--====================================================
	else
		Talk(1,"","§¹i hiÖp ch­a tham gia ®ñ 7 lÇn V­ît ¶i Tµng KiÕm !!!!")
		return
	end
end