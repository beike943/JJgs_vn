--宋火船NPC死亡脚本
--by liubo
Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")
function OnDeath(nIndex)
	--print("OnDeath SBoat")
	--非开战状态死的
	local nBattleState = GetMissionV(MV_LZZ_STATE) 
	if nBattleState ~= MS_STATE_FIGHT then	
		return 0 
	end 
	SetNpcLifeTime(nIndex,0)
	SetMissionV(MV_LZZ_SONGBOAT_IDX,0)
	--获得杀死NPC的PlayerIndex的阵营
	local nCampPlace = LZZ_GetCamp()
	--参与战斗，设置进行标识
	--LZZ_OperateAllPlayer(lzz_set_fight,{},nCampPlace)
	SetMissionV(MV_LZZ_CAMPTWO_POINT,GetMissionV(MV_LZZ_CAMPTWO_POINT)+FIREBOAT_POINT)
	--面板显示
	LZZ_Panel_Show()
	Msg2MSAll(MISSIONID,tSTRING_MISSION[24])
end
