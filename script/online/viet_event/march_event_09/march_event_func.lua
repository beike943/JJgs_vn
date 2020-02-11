--File name:	march_event_func.lua
--Describe:		三月活动函数文件
--Create Date:	2009-02-17
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\march_event_09\\march_event_head.lua")
Include("\\script\\lib\\writelog.lua")

--添加原料包
function add_bag_march_09_viet(nItemNum, szLog)
	local szLogTitle = "Event th竛g 3"
	local szItemName = "Bao nguy猲 li謚"
	local G, D, P = 2, 1, 30061
	local nRetCode = 0
	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName)
		WriteLogEx(szLogTitle, szLog, nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(szLogTitle,"", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
end

