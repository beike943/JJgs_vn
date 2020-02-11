Include ("\\script\\meridian\\meridian_script_api.lua")
Include ("\\script\\system_switch_config.lua")

MERIDIAN_ZHENQI_LIMIT=150000
MERIDIAN_ZHENQI_UNIT=400
THIS_ITEM={2, 1, 30613}
N_ADD_ZHENQI_TYPE = AWARD_QENUINEQI_IB

function OnUse_Real(id)
	if _check_canuse(1) == 1 then
		local nCount = GetItemCount(THIS_ITEM[1],THIS_ITEM[2], THIS_ITEM[3])
		AskClientForNumber("_request_number_call_back", 1, nCount, "H·y nhËp sè lÇn sö dông")
	end
end

function _check_canuse(bLotify)
	if 1 ~= IsMeridianSystemOpen() then
		if 1 == bLotify then
			Talk(1,"",format("HÖ thèng kinh m¹ch vÉn ch­a khai th«ng, hiÖn vÉn ch­a thÓ sö dông vËt phÈm nµy!"))
		end
		return 0
	end
	if MeridianGetLevel() < 1 then
		if 1 == bLotify then
			Talk(1,"",format("Ch­a ph¶i c¶nh giíi kÝch ho¹t, t¹m thêi kh«ng thÓ sö dông vËt phÈm nµy!"))
		end
		return 0
	end
	local nDailiCapacity = GetTodayAwardGenuineQiLeftCapacityByType(N_ADD_ZHENQI_TYPE)
	if nDailiCapacity <= 0 then
		if 1 == bLotify then
			Talk(1,"",format("Th«ng qua %s trong ngµy h«m nay ®· kh«ng thÓ nhËn thªm ch©n khÝ!", t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5]))
		end
		return 0
	end
	local nZhenQi =  MeridianGetQiHai()+MeridianGetDanTian()
	if nZhenQi >= MERIDIAN_ZHENQI_LIMIT then
		if 1 == bLotify then
			Talk(1,"",format("§¬n d­îc nµy chØ cã hiÖu lùc ®èi víi ®iÓm ch©n khÝ tæng ®iÓm nhá h¬n %d nh©n sÜ. §iÓm luyÖn cña ng­¬i ®· qu¸ ®Çy ®ñ thuèc nµy kh«ng thÓ sö dông ®­îc n÷a.", MERIDIAN_ZHENQI_LIMIT))
		end
		return 0
	end
	
	return 1
end

function _request_number_call_back(nNum)
	if _check_canuse(0) == 1 then
		local nLeft = MERIDIAN_ZHENQI_LIMIT - MeridianGetQiHai() - MeridianGetDanTian()
		local nDailiCapacity = GetTodayAwardGenuineQiLeftCapacityByType(N_ADD_ZHENQI_TYPE)
		local nLeftZhenQiCanGet = min(nLeft, nDailiCapacity)
		local nMaxNum = floor((nLeftZhenQiCanGet + MERIDIAN_ZHENQI_UNIT - 1)/MERIDIAN_ZHENQI_UNIT)
		
		local nUseNumReal = min(nNum, nMaxNum)
		local nDelResult = DelItem(THIS_ITEM[1],THIS_ITEM[2], THIS_ITEM[3], nUseNumReal)
		if  nDelResult and nDelResult == 1 then
			AwardGenuineQiByType(nUseNumReal * MERIDIAN_ZHENQI_UNIT, N_ADD_ZHENQI_TYPE)
		end
		return nUseNumReal
	end
	return 0
end