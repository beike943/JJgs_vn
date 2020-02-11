--File name:	feiyan_clear_award.lua
--Describe:		春节活动系统抽奖文件(飞燕仙子)
--Create Date:	2008-12-29
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_head.lua")

g_szThisFile = "\\script\\online\\viet_event\\new_year_09\\feiyan_clear_award.lua"

function main()
	if is_new_year_09_viet_open() == 0 then
		return
	end
	
	SubWorld = SubWorldID2Idx(300)
	if SubWorld >= 0 then
		local ret = nil
		PlayerIndex = 1
		for i=1,100 do
			local lv = GetLevel()
			if lv ~= nil and lv > 0 then
				break
			end
			PlayerIndex = PlayerIndex + 1
		end
		ClearRelayShareData(RELAY_DB_09_NEWYEAR_VIET,0,0,"","")
		DelRelayShareDataCopy(RELAY_DB_09_NEWYEAR_VIET,0,0)
	end
end

