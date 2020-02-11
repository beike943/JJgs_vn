--=============================================
--create by baiyun 2010.08.24
--describe:Ô½ÄÏ°æËÄÁéµÆ»áÊ±¼ä´¥·¢Æ÷½Å±¾
--===========================================
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online_activites\\2010_09\\activites_02\\head.lua")

tLuckyRewardExp =
{
	[1] = 2000000,
	[2] = 2000000,
	[3] = 2000000,
	[4] = 4000000,
	[5] = 5000000,
	[6] = 5000000,
	[7] = 5000000,
	[8] = 8000000,	
	[9] = 2000000,
	[10] = 2000000,
	[11] = 2000000,
	[12] = 4000000,
	[13] = 5000000,
	[14] = 5000000,
	[15] = 5000000,
	[16] = 10000000,
}

-- TSK_LUCKY_STAR_201011 
-- hai so ( hang chuc + hang don vi ) luu so lan su dung trong ngay
-- so (hang tram) luu timer trigger : 
--     + 0: giay thu 15s 
--     + 1: giay thu 30s 
--     + 2: giay thu 45s 
--     + 3: giay thu 60s

-- moi 15 giay se thuc hien ham nay 1 lan
function OnTimer()
    local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
    
    -- local nTimes = floor(mod(GetTask(TSK_LUCKY_STAR_201011), 100) / 10)		-- lay so hang chuc
    local nTimes = floor(mod(GetTask(TSK_LUCKY_STAR_201011), 1000) / 100)	   	-- lay so hang tram - luu timer 
        
    -- local nUsed = mod(GetTask(TSK_LUCKY_STAR_201011), 10)							-- lay so hang don vi
    local nUsed = mod(GetTask(TSK_LUCKY_STAR_201011), 100)							-- lay hai so cuoi cung
    nUsed = mod(nUsed, 16)
    if nUsed == 0 then
    		nUsed = 16
    end
    
    -- vuot qua 60 giay thi remove timer 
    if nTimes > 3 or (nPlayerMapId ~= 100 and nPlayerMapId ~= 150 and nPlayerMapId ~= 200 and nPlayerMapId ~= 300 and nPlayerMapId ~= 350 and nPlayerMapId ~= 400 and nPlayerMapId ~= 500) then
        RemoveTrigger(GetTrigger(VET_201009_02_TIME_USER_DEFINE))
        return 0
    end
    
    -- neu la so giay thu 15,30,45
    local nRecvExp = tLuckyRewardExp[nUsed]
    ModifyExp(nRecvExp)
    Msg2Player("B¹n nhËn ®­îc "..nRecvExp.." ®iÓm kinh nghiÖm.")
    
    -- SetTask(TSK_LUCKY_STAR_201011, GetTask(TSK_LUCKY_STAR_201011) + 10) -- 
    SetTask(TSK_LUCKY_STAR_201011, GetTask(TSK_LUCKY_STAR_201011) + 100)  -- T¨ng lªn 1 ë  so hµng tr¨m cho biÕt lÇn thø mÊy v« hµm nµy (hµm nµy mçi 15s sÏ v« mét lÇn) 
    
    if nTimes == 3 then						-- neu la giay thu 60
    	
        local nPetCurLevel = mod(GetTask(TASK_VNG_PET), 100)
        if nPetCurLevel == 1 then
            SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (100))
		 Msg2Player("B¹n nhËn ®­îc 1 ®iÓm n©ng cÊp B¹n §ång Hµnh!")
        end
        
        -- lan su dung thu 8 va pet cap 2
        -- if ( nUsed == 8 and nPetCurLevel >= 2 ) then
        
        -- lan su dung so 8 hay 16 va co pet cap 2
        if ( nUsed == 8 or nUsed == 16 ) and ( nPetCurLevel >= 2 ) then
        	Pet_AddGP(1)
			Msg2Player("B¹n nhËn ®­îc 1 ®iÓm linh lùc!")
        end
        
        RemoveTrigger(GetTrigger(VET_201009_02_TIME_USER_DEFINE))
        return 0
    end
end

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
    if MapID1 ~= MapID2 then
        return -1
    else
	local dx = MapX2 - MapX1
        local dy = MapY2 - MapY1
        local nDist = (dx * dx + dy * dy)^(1/2);
        return nDist;
    end;
end

