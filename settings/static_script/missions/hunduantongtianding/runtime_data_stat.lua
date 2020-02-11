--通天幻境数据统计

Include("\\settings\\static_script\\missions\\base\\runtime_data_stat.lua")

MAIN_ID = 5
--开启时对玩家的统计
function _stat_on_player_when_open_misson()
	AddRuntimeStat(MAIN_ID, 4, 0, 1) --开启人数
	AddRuntimeStat(MAIN_ID, 15, GetPlayerRoute(), 1) --开启人数
	_stat_trans_player_count(MAIN_ID, 9, 1, 100)
	_stat_level_player_count(MAIN_ID, 7, 80, 89)
	_stat_level_player_count(MAIN_ID, 8, 90, 99)
end

--全通时对玩家的统计
function _stat_on_player_when_all_pass()
	AddRuntimeStat(MAIN_ID, 6, 0, 1) --人数
	AddRuntimeStat(MAIN_ID, 16, GetPlayerRoute(), 1) --人数
end

function _stat_on_player_when_stage_pass(nStage)
	AddRuntimeStat(MAIN_ID, 5, nStage, 1) --人数
end

function _stat_when_stage_pass(nStage)
	AddRuntimeStat(MAIN_ID, 2, nStage, 1) --通关次数
end

--开启时的统计
function _stat_when_open_mission()
	AddRuntimeStat(MAIN_ID, 1, 0, 1)
end

--全通时的统计
function _stat_when_all_pass()
	AddRuntimeStat(MAIN_ID, 3, 0, 1)
end

--免费翻盘统计
function _stat_when_open_free_card()
	AddRuntimeStat(MAIN_ID, 10, 0, 1)
end

--收费翻盘统计
function _stat_when_open_ib_card()
	AddRuntimeStat(MAIN_ID, 11, 0, 1)
end

--ib消耗计数
function _stat_when_ib_consume(nConsume)
	AddRuntimeStat(MAIN_ID, 12, 0, nConsume)
end


--ib产出1计数
function _stat_when_ib_produce_tianmenjinling(nProduce)
	AddRuntimeStat(MAIN_ID, 13, 0, nProduce)
end

--ib产出2计数
function _stat_when_ib_produce_tianmensuipian(nProduce)
	AddRuntimeStat(MAIN_ID, 14, 0, nProduce)
end

