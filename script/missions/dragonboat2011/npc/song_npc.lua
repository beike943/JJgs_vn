--宋军军需官NPC脚本
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function main()
	Say(sNpcNameNeeder..tSTRING_DRAG_NPC[2],getn(tSTRING_NEEDER_DLG),tSTRING_NEEDER_DLG)
end

function do_nothing()
end

--龙舟战玩法介绍
function introduce()
	Say(sNpcNameNeeder..tSTRING_DRAG_NPC[4],getn(tSTRING_BATTLE_RULE),tSTRING_BATTLE_RULE)
end

function fight_rule()
	Say(sNpcNameNeeder..tSTRING_RULE_DETAIL[1],1,tSTRING_BATTLE_RULE[4])
end

function firedrag_rule()
	Say(sNpcNameNeeder..tSTRING_RULE_DETAIL[2],1,tSTRING_BATTLE_RULE[4])
end

function sf_rule()
	Say(sNpcNameNeeder..tSTRING_RULE_DETAIL[3],1,tSTRING_BATTLE_RULE[4])
end

--龙舟特点介绍
function drag_specialty()
	Talk(4,"",tSTRING_DRAG_SPECAIL[1],tSTRING_DRAG_SPECAIL[2],tSTRING_DRAG_SPECAIL[3],tSTRING_DRAG_SPECAIL[4])
end

--领取龙舟
function get_drag()
	--判断背包空间
	if gf_Judge_Room_Weight(1,1,"") == 0 then 
		Talk(1,"",sNpcNamePilot..tSTRING_DRAG_NPC[11])
		return 0
	end	
	--是否已经领取过
	if GetTask(VET_LZZ_PLAYER_DRAG) ~= 0 then
		Talk(1,"",sNpcNameNeeder..tSTRING_DRAG_NPC[1])
		return 0
	end
	Say(sNpcNameNeeder..tSTRING_DRAG_NPC[3],getn(tSTRING_DRAG_KIND),tSTRING_DRAG_KIND)
end

--退出战场
function exit_battle()
	Say(sNpcNameNeeder..tSTRING_DRAG_NPC[5],2,tSTRING_DRAG_NPC[6],tSTRING_BATTLE_RULE[4])
end

function exit_ensure()
	local nCamp = gf_GetCurMapID()
	DelMSPlayer(MISSIONID,nCmap)
end

function qing_long()
	--是否在地图
	local nMapID,nX,nY= GetWorldPos()
	if GetTask(VET_LZZ_MISSION_MAPID) ~= nMapID then
		return 0
	end
	--添加龙舟
	local nRezult,nIdxItm =	AddItem(0,105,30034,1,1,-1,-1,-1,-1,-1,-1)
	if nRezult ~= 1 then
		return 0
	end
	--设置领取过了龙舟
	SetTask(VET_LZZ_PLAYER_DRAG,nIdxItm)
	SetTask(VET_LZZ_DRAGBOAT_KIND,1)
end

function xuan_wu()
	--是否在地图
	local nMapID,nX,nY= GetWorldPos()
	if GetTask(VET_LZZ_MISSION_MAPID) ~= nMapID then
		return 0
	end
	--添加龙舟
	local nRezult,nIdxItm =	AddItem(0,105,30035,1,1,-1,-1,-1,-1,-1,-1)
	if nRezult ~= 1 then
		return 0
	end
	--设置领取过了龙舟
	SetTask(VET_LZZ_PLAYER_DRAG,nIdxItm)
	SetTask(VET_LZZ_DRAGBOAT_KIND,2)
end

function bai_hu()
	--是否在地图
	local nMapID,nX,nY= GetWorldPos()
	if GetTask(VET_LZZ_MISSION_MAPID) ~= nMapID then
		return 0
	end
	--添加龙舟
	local nRezult,nIdxItm =	AddItem(0,105,30036,1,1,-1,-1,-1,-1,-1,-1)
	if nRezult ~= 1 then
		return 0
	end
	--设置领取过了龙舟
	SetTask(VET_LZZ_PLAYER_DRAG,nIdxItm)
	SetTask(VET_LZZ_DRAGBOAT_KIND,3)
end

function zhu_que()
	--是否在地图
	local nMapID,nX,nY= GetWorldPos()
	if GetTask(VET_LZZ_MISSION_MAPID) ~= nMapID then
		return 0
	end
	--添加龙舟
	local nRezult,nIdxItm =	AddItem(0,105,30037,1,1,-1,-1,-1,-1,-1,-1)
	if nRezult ~= 1 then
		return 0
	end
	--设置领取过了龙舟
	SetTask(VET_LZZ_PLAYER_DRAG,nIdxItm)
	SetTask(VET_LZZ_DRAGBOAT_KIND,4)
end