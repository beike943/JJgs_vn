--by liubo 
--财神宝箱触发器脚本
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\online_activites\\treasure_box\\head.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
VET_TREASUREBOX_SPACE_TIME = 3600 --获得木箱间隔时间

function OnTimer()
--	do return end
	if gf_CheckEventDateEx(46) ~= 1 then
		return 0
	end	
	local nTemp1,nTotalTime,nTemp2 = GetAntiEnthrallmentInfo()
	local nNum = GetTask(VET_TREASURE_BOX_PNUM)
	local nAddTime = nTotalTime - (nNum * VET_TREASUREBOX_SPACE_TIME)
	while nAddTime >= VET_TREASUREBOX_SPACE_TIME do
		if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Msg2Player(tSTRING_TREASUER_BOX[7])
			return 0
		end	
		get_award_woodenbox()
		nAddTime =nAddTime - VET_TREASUREBOX_SPACE_TIME
		SetTask(VET_TREASURE_BOX_PNUM,GetTask(VET_TREASURE_BOX_PNUM)+1)
	end	
end
