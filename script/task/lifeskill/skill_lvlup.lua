--生活技能升级任务变量
TASKID_LIFESKILL_LEV = 1931;
TASKID_LIFESKILL_FLG = 1932;
TASKID_LIFESKILL_TSK = 1933

function check_lifeskill_level( tbPlayer )	--是否符合该任务生活技能要求
	if( getn(tbPlayer) ~= 3 ) then
print("getn<3")
		return
	end
	
	if( tbPlayer[1][2] >=41 and tbPlayer[2][3] >= 41 and tbPlayer[3][4] >=41 ) then
		return 1
	elseif( tbPlayer[1][2] >=41 and tbPlayer[2][4] >= 41 and tbPlayer[3][3] >=41 ) then
		return 1
	elseif( tbPlayer[1][3] >=41 and tbPlayer[2][2] >= 41 and tbPlayer[3][4] >=41 ) then
		return 1
	elseif( tbPlayer[1][3] >=41 and tbPlayer[2][4] >= 41 and tbPlayer[3][2] >=41 ) then
		return 1
	elseif( tbPlayer[1][4] >=41 and tbPlayer[2][2] >= 41 and tbPlayer[3][3] >=41 ) then
		return 1
	elseif( tbPlayer[1][4] >=41 and tbPlayer[2][3] >= 41 and tbPlayer[3][2] >=41 ) then
		return 1
	end
	
	return nil
end

function check_over_lifeskill()
	if( GetTeamSize() ~= 3 ) then	--如果没有队伍，或者队伍人数不是3人，则不满足条件
		return nil
	end
	if( GetTask(TASKID_LIFESKILL_TSK) ~= LIFESKILL_TSK_VALUE ) then
		return nil
	end
	local tbPlayer = {}
	local oldPlayerIndex = PlayerIndex
	for i = 1, 3 do
		tbPlayer[ i ] = {}
		tbPlayer[ i ][1] = GetTeamMember(i)
		PlayerIndex = tbPlayer[ i ][1]
		tbPlayer[ i ][2] = GetTask( TASKID_LIFESKILL_LEV )
		tbPlayer[ i ][3] = GetTask( TASKID_LIFESKILL_FLG )
	end
	
	PlayerIndex = oldPlayerIndex
	if( tbPlayer[1][2] == tbPlayer[2][2] == tbPlayer[3][2] == 2 and tbPlayer[1][3] == tbPlayer[2][3] == tbPlayer[3][3] ) then
		return 1
	end
	return nil
end


function check_mainlifeskill(ntype, nskill)
	local nGene, nSkillid = GetMainLifeSkill()
	print("mainlifeskill ng="..nGene..";nskill="..nSkillid)
	if( nGene ~= ntype and nSkillid ~= nskill ) then
		return 0
	else
		print("mainlifelevel = "..GetLifeSkillLevel(ntype, nskill))
		return GetLifeSkillLevel(ntype, nskill)
	end
end

function goto_takelifeskill_task()
	if( GetTeamSize() ~= 3 ) then	--如果没有队伍，或者队伍人数不是3人，则不满足条件
		return nil
	end
	if( GetTask(TASKID_LIFESKILL_TSK) ~= LIFESKILL_TSK_VALUE ) then
		return nil
	end
	local tbPlayer = {}
	local oldPlayerIndex = PlayerIndex
	for i = 1, 3 do
		tbPlayer[ i ] = {}
		tbPlayer[ i ][1] = GetTeamMember(i)
		PlayerIndex = tbPlayer[ i ][1]
		tbPlayer[ i ][2] = GetTask( TASKID_LIFESKILL_LEV )
		tbPlayer[ i ][3] = GetTask( TASKID_LIFESKILL_FLG )
	end
	
	PlayerIndex = oldPlayerIndex

	local bpass = 0
	for i = 1, 2 do
		if (tbPlayer[i][2] ~= tbPlayer[i+1][2] or tbPlayer[i][2] ~= 0) then
			bpass = -1
		end
		if (tbPlayer[i][3] ~= tbPlayer[i+1][3]) then
			bpass = -1
		end
	end
	if(bpass == 0) then
		print(bpass)
		return 1
	end

	return nil
end

function OnCancel()
end

