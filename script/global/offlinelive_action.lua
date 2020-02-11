Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")


TASKVAL_EXP_LEFT = 2288		-- 加经验的剩余时间
TASKVAL_BAIJUWAN = 2501		-- 该任务变量保存白驹丸的剩余时间（分钟）
TASKVAL_SHENNONG = 2502		-- 该任务变量保存神农丹的剩余时间（分钟）
TASKVAL_BAIJU_TIME = 2504	-- 该任务变量保存此次离线托管白驹使用了多少时间(分钟)
TASKVAL_BAIJUWAN1 = 2507	-- 大白驹丸的时间
TASKVAL_BAIJUWAN2 = 2508	-- 白驹仙丹的时间
TASKVAL_BAIJUWAN3 = 2511	-- 小白驹的时间
TASKVAL_BAIJUWAN3_DATA = 2512	-- 小白驹领取时间

keepsake_num_TaskID = 1227		--2007端午，挂白驹信物增加
keepsake_date_TaskID = 1241

TASKVAL_BAIJU_LASTACTIVE_TIME = 2292		-- 记录最近一次获得白驹经验的时间
TASKVAL_LIUSHEN_LASTACTIVE_TIME = 2293		-- 记录最近一次获得六神经验的时间
TASKVAL_SANQING_LASTACTIVE_TIME = 2294		-- 记录最近一次获得三清经验的时间

TASKVAL_BAIJU_OFFLINE_TIME = 2295			-- 离线白驹时间（累积）分钟
TASKVAL_LIUSHEN_OFFLINE_TIME = 2296			-- 离线六神时间（累积）分钟
TASKVAL_SANQING_OFFLINE_TIME = 2297			-- 离线三清时间（累积）分钟

function main(nBaiju, nNoBaijuLeave, nLiushen, nNoLiushenExp, nSanqin, nNoSanqinExp, nZhenQi, nbLeaveWhenNoZhenQiDan)
--	print(format("\n%s nBaiju=%d, nNoBaijuLeave=%d, nLiushen=%d, nNoLiushenExp=%d, nSanqin=%d, nNoSanqinExp=%d, nZhenQi=%d, nbLeaveWhenNoZhenQiDan=%d"
--		,GetName(), nBaiju, nNoBaijuLeave, nLiushen, nNoLiushenExp, nSanqin, nNoSanqinExp, nZhenQi, nbLeaveWhenNoZhenQiDan))

	local ret = 1
	local nSelect = nBaiju + nZhenQi

	-- 防成谜角色到3小时T下线
	--local nLimit, OnlineTime = GetAntiEnthrallmentInfo()
	--if nLimit > 0 and OnlineTime >= 10800 then
	--	return 0
	--end

	local bai_ju_left_time = GetTask(TASKVAL_BAIJUWAN)
	local bai_ju_left_time1 = GetTask(TASKVAL_BAIJUWAN1)
	local bai_ju_left_time2 = GetTask(TASKVAL_BAIJUWAN2)
	local bai_ju_left_time3 = GetTask(TASKVAL_BAIJUWAN3)
	local bai_ju_all = bai_ju_left_time + bai_ju_left_time1 + bai_ju_left_time2 + bai_ju_left_time3

	
	if nBaiju > 0 then
    	if bai_ju_all > 0 then
    		activate()
    	elseif nNoBaijuLeave > 0 then
    		ret = 0
    	elseif IsGathering() == 0 then	-- 如果没有在采集,没时间了则T下线
    		nSelect = nSelect - nBaiju
    		if nSelect <= 0 then
    			ret = 0
    		end
    	end
	end

	if nZhenQi > 0 then
    	local zhenqi_left_time_all = GetJuLingWanAllTime()
    	if zhenqi_left_time_all > 0 then
    		if ZhenQiActivate() <= 0 then
    			nSelect = nSelect - nZhenQi
    			if nSelect <= 0 then
    				ret = 0
    			end
    		end
    	elseif nbLeaveWhenNoZhenQiDan > 0 then
    		nSelect = nSelect - nZhenQi
    		ret = 0 --不用再判断了，直接T
    	end
	end

	if nLiushen > 0 and GetWorldPos() ~= 701 then
		local ActiveLiuShenRet = ActiveLiuShen()
		
		if ActiveLiuShenRet == 1 then
			SetTask(TASKVAL_LIUSHEN_LASTACTIVE_TIME, GetTime())
		elseif ActiveLiuShenRet < 0 and nNoLiushenExp > 0 then
			ret = 0
		end
	end

	if nSanqin > 0 and GetWorldPos() ~= 701 then
 		local ActiveSanqingRet = ActiveSanqin()
		
		if ActiveSanqingRet == 1 then
			SetTask(TASKVAL_SANQING_LASTACTIVE_TIME, GetTime())
		elseif ActiveSanqingRet < 0 and nNoSanqinExp > 0 then
			ret = 0
		end
	end
	
--	print(format("\n%s ret=%d",GetName(), ret))
	return ret
end

function ZhenQiActivate()
	-- 牢房中使用聚灵丸无效
	local nMapID = GetWorldPos();
	if (nMapID == 701) then
		return 0
	end
	
	local nRet = 0
	for i=1, getn(t_ZhenQiWanPara) do
		local nTime = GetJuLingWanTime(i)
		if nTime > 0 then
			local nAdd = GetJuLingWanEffect(t_ZhenQiWanPara[i])
			nRet = AwardGenuineQi(nAdd)
			if 1 == nRet then
				SetJuLingWanTime(i, nTime -1)
				UpdateAwardJuLingExpTime()--更新获得聚灵经验的时间
			end
			return nRet
		end
	end
	return 0
end

function activate()
	-- 牢房中使用白驹无效
	local nMapID = GetWorldPos();
	if (nMapID == 701) then
		return
	end

	local level = GetLevel()
	if (level>= 1 and level <= 99) then
		SetTask(TASKVAL_BAIJU_LASTACTIVE_TIME, GetTime())
		-- 每分钟加一次经验
		local bai_ju_left_time = GetTask(TASKVAL_BAIJUWAN)
		local bai_ju_left_time1 = GetTask(TASKVAL_BAIJUWAN1)
		local bai_ju_left_time2 = GetTask(TASKVAL_BAIJUWAN2)
		local bai_ju_left_time3 = GetTask(TASKVAL_BAIJUWAN3)
		local nGiveExp = 0
		
		if level >= 90 then
			nGiveExp = 5000
		else
			nGiveExp = ceil(level * level / 2)
		end
		
		local dragon_boat_flag = GetTask(keepsake_date_TaskID)
		local ran_num = random(1,10)
		local nDate = tonumber(date("%Y%m%d"))
		
		if bai_ju_left_time2 > 0 then--白驹仙丹			
			--加入08年国庆节白驹丸加倍效果
			if GetTask(934) >= nDate and GetTask(935) > 0 and nDate <= 20081007 then
				ModifyExp(nGiveExp * 3)
				SetTask(935,GetTask(935)-1)
			else
				ModifyExp(nGiveExp * 2)
			end
			SetTask(TASKVAL_BAIJUWAN2, bai_ju_left_time2 - 1)
			if dragon_boat_flag ~= 0 and dragon_boat_flag ~= nil then
				if ran_num >= 5 then
					SetTask(keepsake_num_TaskID,(GetTask(keepsake_num_TaskID) + 2))
				else
					SetTask(keepsake_num_TaskID,(GetTask(keepsake_num_TaskID) + 1))
				end
			end

		elseif bai_ju_left_time1 > 0 then--大白驹丸
			--加入08年国庆节白驹丸加倍效果
			if GetTask(934) >= nDate and GetTask(935) > 0 and nDate <= 20081007 then
				ModifyExp(nGiveExp * 2.5)
				SetTask(935,GetTask(935)-1)
			else
				ModifyExp(nGiveExp * 1.5)
			end			
			SetTask(TASKVAL_BAIJUWAN1, bai_ju_left_time1 - 1)
			if dragon_boat_flag ~= 0 and dragon_boat_flag ~= nil then
				SetTask(keepsake_num_TaskID,(GetTask(keepsake_num_TaskID) + 1))
			end

		elseif bai_ju_left_time > 0 then--白驹丸
			--加入08年国庆节白驹丸加倍效果
			if GetTask(934) >= nDate and GetTask(935) > 0 and nDate <= 20081007 then
				ModifyExp(nGiveExp * 2)
				SetTask(935,GetTask(935)-1)
			else
				ModifyExp(nGiveExp)
			end			
			SetTask(TASKVAL_BAIJUWAN, bai_ju_left_time - 1)
			if dragon_boat_flag ~= 0 and dragon_boat_flag ~= nil and ran_num >= 6 then
				SetTask(keepsake_num_TaskID,(GetTask(keepsake_num_TaskID) + 1))
			end

		elseif bai_ju_left_time3 > 0 then--小白驹丸
			ModifyExp(floor(nGiveExp / 4))
			SetTask(TASKVAL_BAIJUWAN3, bai_ju_left_time3 - 1)
		end
	end
end
