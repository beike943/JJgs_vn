
CITYWAR_MAX_STEP = 120

CITYWAR_STEP_TRIGGER = 261
CITYWAR_ENTER_PRISON = 263
CITYWAR_LEAVE_PRISON = 264

tCityWarPrisonPos = {1381, 3137}

Include("\\script\\lib\\string.lua")

function init_citywar_prison()
	-- 获取当前服务器属于第几台
	IniFile_Load("\\servercfg.ini")
	local ServerCount = IniFile_GetData("\\servercfg.ini", "Server", "ServerCount")
	local ServerIndex = IniFile_GetData("\\servercfg.ini", "Server", "ServerIndex")
	IniFile_Unload("\\servercfg.ini")
	
	-- 注意：这里没有对一个地图属于很多服务器进行处理！！
	-- 获取监狱地图在哪个服务器上
	local nPrison1 = 730
	local nPrison2 = 731
	local nPrison3 = 732
	local nPrison4 = 733
	local nPrison5 = 734
	
	local szWorldSet = "\\maps\\worldset_"..ServerCount..".ini"
	IniFile_Load(szWorldSet)
	local WorldPrison1 = IniFile_GetData(szWorldSet, "WorldList", "World_"..nPrison1)
	local WorldPrison2 = IniFile_GetData(szWorldSet, "WorldList", "World_"..nPrison2)
	local WorldPrison3 = IniFile_GetData(szWorldSet, "WorldList", "World_"..nPrison3)
	local WorldPrison4 = IniFile_GetData(szWorldSet, "WorldList", "World_"..nPrison4)
	local WorldPrison5 = IniFile_GetData(szWorldSet, "WorldList", "World_"..nPrison5)
	IniFile_Unload(szWorldSet)
	
	-- 计算这台服务器要扔哪个监狱
	local tServerIndex = split(ServerIndex, ",")
	for index, value in tServerIndex do
		if WorldPrison1 == value then
			g_ThrowPrison = nPrison1
			break
		elseif WorldPrison2 == value then
			g_ThrowPrison = nPrison2
			break
		elseif WorldPrison3 == value then
			g_ThrowPrison = nPrison3
			break
		elseif WorldPrison4 == value then
			g_ThrowPrison = nPrison4
			break
		elseif WorldPrison5 == value then
			g_ThrowPrison = nPrison5
			break
		end
	end
end

function citywar_get_throw_where()
	return tonumber(g_ThrowPrison)
end

init_citywar_prison()
