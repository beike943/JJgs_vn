-- TSK_NIENTHU20101201_TIME = 2175
-- TSK_NIENTHU20101201_INFO = 2176

Include ("\\script\\lib\\globalfunctions.lua");
Include ("\\script\\online\\viet_event\\vng_task_control.lua ") 

function main()

	-- cÊp 80 trë lªn míi cã thÓ nhËn ®­îc phÇn th­ëng
	if GetLevel() < 80 then
		Talk(1, "", "§¼ng cÊp 80 trë lªn míi cã thÓ nhËn th­ëng!")
		return 0
	end
	
	-- gia nhËp m«n ph¸i míi nhËn phÇn thuêng
	if GetPlayerRoute() == 0 then
		Talk(1, "", "ChØ cã ng­êi ®· gia nhËp m«n ph¸i míi cã thÓ nhËn th­ëng!")
		return 0
	end
	
	-- thoi gian gian cach hai lÇn nhËn thuëng lµ 30 phót
	if GetTime() - GetTask(TSK_NIENTHU20101201_TIME) < 30 * 60 then
		Talk(1,"","B¹n cßn "..GetTask(TSK_NIENTHU20101201_TIME) + (30*60) - GetTime().." gi©y míi cã thÓ tiÕp tôc nhËn th­ëng tõ tiÓu niªn thó.")
		return 0
	end
	
	-- set thêi gian gi·n c¸ch nhËn th­ëng
	SetTask(TSK_NIENTHU20101201_TIME,GetTime())
	
	-- local nDate = tonumber(date("%d"));
	-- local nTaskVal = GetTask(TSK_NIENTHU20101201_INFO)	
	----------------------------------------------------------------------------------------
	--if GetByte(nTaskVal,1) ~= nDate then
--		nTaskVal  = SetByte(nTaskVal,1,nDate)
		--nTaskVal  = SetByte(nTaskVal,2,0)
		--nTaskVal  = SetByte(nTaskVal,3,0)
		--SetTask(TSK_NIENTHU20101201_INFO, nTaskVal)
	--end	
	--nTaskVal = GetTask(TSK_NIENTHU20101201_INFO)	
	----------------------------------------------------------------------------------------
	
	local nDate = tonumber( date( "%y%m%d" ) ) --101116
	
	-- hai sè cuèi cña task lµ sè lÇn sö dông trong ngµy
	local nCurDate = floor ( GetTask( TSK_NIENTHU20101201_INFO ) / 100 ) -- lÊy 6 sè ®Çu tiªn
	
	-- Thùc hiÖn reset sè lÇn sö dông trong ngµy vµ thêi gian gi·n c¸ch sö dông . nÕu kh«ng ph¶i lµ ngµy hiÖn t¹i
	if nCurDate ~= nDate then
		SetTask ( TSK_NIENTHU20101201_INFO, nDate * 100 )
	end	
		
	-- Vuît qu¸ sè lÇn sö dông --> tho¸t 	
	local nCount = mod ( GetTask(TSK_NIENTHU20101201_INFO), 100 ) 
	if nCount >= 12 then
		Talk(1,"","Mçi ngµy chØ cã thÓ nhËn th­ëng tõ 12 con TiÓu niªn thó.")
		return 0
	end
	
	--if GetByte(nTaskVal,3) >= 12 then
	--	Talk(1,"","Mçi ngµy chØ cã thÓ nhËn th­ëng tõ 12 con TiÓu niªn thó.")
	--	return 0
	--end
			
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)
	SetNpcScript(nSelfIndex, "")

	-- SetTask(GET_PANGTUZI_ID, SetByte(nTaskVal,3,1))	
	SetTask(TSK_NIENTHU20101201_INFO, GetTask(TSK_NIENTHU20101201_INFO) + 1)
	
	ModifyExp(1000000)
	WriteLogEx("Hoat dong Thang 12","TiÓu niªn thó",1000000,"®iÓm kinh nghiÖm")
	Msg2Player("B¹n nhËn ®­îc 1000000 ®iÓm kinh nghiÖm!")
	
	-- doi 30*60 gi©y míi cã thÓ ¨n ®­îc n÷a	
	StartTimeGuage("TiÓu niªn thó", 30*60 ,0,1)	
end
-- ================================================
