--File name:	first_tong_func.lua
--Describe:		第一帮活动公共函数文件
--Create Date:	2008-07-17
--Author:		chenbenqian

Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")


-- 是否为队长
function is_team_captain()
	if GetTeamSize() < 1 then
		return 0
	end

	local nCaptain = GetTeamMember(0)
	if nCaptain == PlayerIndex then
		return 1
	else
		return 0
	end
end

-- 是否为帮主
function is_tong_captain()
	if IsTongMember() == 1 then
		return 1
	else
		return 0
	end
end

-- 向队伍的每个成员发送消息
function msg_2_team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    local OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end

function create_map_trigger()
	if GetTrigger(2502) == 0 then
		if CreateTrigger(2,3001,2502) == 0 then
			WriteLog(g_LogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] CreateTrigger(2,3001,2502) Failed. ")
		end
	end;
	if GetTrigger(2503) == 0 then
		if CreateTrigger(2,3002,2503) == 0 then
			WriteLog(g_LogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] CreateTrigger(2,3002,2503) Failed. ")
		end
	end;
end;

function check_time()
	local nHour = tonumber(date("%H"));
	if nHour == 17 or nHour == 18 then	--  17：00-18：00 龙泉村地图无pk惩罚
		return 1;
	else
		return 0;
	end;
end;

function check_place()	--是否在指定地点: 龙泉村
	local nMapID = GetWorldPos();
	if nMapID == 106 then
		return 1;
	else
		return 0;
	end;
end;
