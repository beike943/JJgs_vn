--filename:qryx_trigger.lua
--create date:2006-01-18
--author:yanjun
--describe:ÇéÈË½Ú£¦ÔªÏü½Ú»î¶¯´¥·¢Æ÷½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function chocolate_drop()
	if Is_QRYX_Activity() == 1 then
		if IsLoversTeam() == 1 then
			local DropRate = GetLoversDropRate()
			local OldPlayerIndex = PlayerIndex
			DebugOutput("current droprate is:"..DropRate)
			if GetSex() == 2 then
				local maleIndex = GetLoversIndex()
				if IsPlayerNear(maleIndex) > 0 then	--Èç¹ûÁíÒ»°ëÔÚ×Ô¼ºµÄ¸½½ü
					if IsLucky(1*DropRate,100*100) == 1 then
						local nDay = tonumber(date("%d"))			
						if GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1) < nDay then
							SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1,0))
						end
						if GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1) == 0 then
							if AddItem(2,0,361,1) == 1 then
								SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1,nDay))
								Msg2Player("B¹n nhËn ®­îc 1 thái S«c«la")
								WriteLog("[Ho¹t ®éng lÔ t×nh nh©n vµ TÕt Nguyªn Tiªu]"..GetName().."§¸nh qu¸i nhËn ®­îc 1 S«c«la")
							end
						end
					end
				end
			end
		end
	end
end


function drop_libing()
	if Is_QRYX_Activity() == 1 then
		if IsLoversTeam() == 1 then
			local DropRate = GetLoversDropRate()
			local OldPlayerIndex = PlayerIndex
			DebugOutput("current droprate is:"..DropRate)
			PlayerIndex = GetTeamMember(1)
			if IsPlayerNear(GetTeamMember(2)) > 0 then	--Èç¹ûÁíÒ»°ëÔÚ×Ô¼ºµÄ¸½½ü
				PlayerIndex = OldPlayerIndex
				if IsLucky(20*DropRate,100*100) == 1 then
					AddItem(2,0,360,1)	--Àñ±ı
				end	
			end
			PlayerIndex = OldPlayerIndex
		end
	end
end

function drop_hzmty()
	if Is_QRYX_Activity() == 1 then
		if IsLoversTeam() == 1 then
			local DropRate = GetLoversDropRate()
			local OldPlayerIndex = PlayerIndex
			DebugOutput("current droprate is:"..DropRate)
			PlayerIndex = GetTeamMember(1)
			if IsPlayerNear(GetTeamMember(2)) > 0 then	--Èç¹ûÁíÒ»°ëÔÚ×Ô¼ºµÄ¸½½ü
				PlayerIndex = OldPlayerIndex
				if IsLucky(3*DropRate,100*100) == 1 then
					AddItem(2,0,355,1)	--ºÚÖ¥ÂéÌÀÔ²
				end	
			end
			PlayerIndex = OldPlayerIndex
		end
	end
end