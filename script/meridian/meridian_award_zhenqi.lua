--经脉系统真气产出接口
Include ("\\script\\meridian\\meridian_script_api.lua")

--interface to vng begin
-------------------------------------------------------
--资源争夺战,给越方接口
t_award_ziyuanzhengduozhan = {10}
function AwardZhenQi_ResourceProtect(nType)
	return _award(t_award_ziyuanzhengduozhan, nType)
end

-------------------------------------------------------
--interface to vng end

--梁山
--type==1 初演任务
--type==2 忠勇任务
--type==3 夺军任务
t_award_liangshan = {100, 200, 300}
function AwardZhenQi_LiangShan(nType)
	return _award(t_award_liangshan, nType)
end

--武林使者任务
--type==1 personal
--type==2 team
t_award_wulingshizhe = {5, 10}
function AwardZhenQi_WuLingShiZhe(nType)
	return _award(t_award_wulingshizhe, nType)
end

--战场
t_award_zhanchang = {5, 15, 10, 30}
function AwardZhenQi_ZhanChang(nIsMainBattle, nIsWinner)
	local nIndex = nIsMainBattle * 2 + nIsWinner + 1
	return _award(t_award_zhanchang, nIndex)
end

--天门阵
t_award_tianmenzhen = {0, 180, 240, 300, 360, 420}
function AwardZhenQi_TianMenZhen(nType, bIsWin)
	if bIsWin and 1 == bIsWin then--只有获胜才给奖励
		return _award(t_award_tianmenzhen, nType)
	end
	return 0
end

function _award(tblAward, nIndex)
	if not tblAward then
		return 0
	end
	local nAward = tblAward[nIndex] or 0
	if nAward > 0 then
		return AwardGenuineQiByType(nAward, AWARD_QENUINEQI_DAILY_TASK)
	end
	return 0
end

