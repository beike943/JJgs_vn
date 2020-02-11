--½Å±¾Ãû³Æ£ºÎ÷±±Çø¹Ø¿¨Íæ¼ÒËÀÍö½Å±¾
--½Å±¾¹¦ÄÜ£ºÍæ¼ÒËÀÍöºó²âÊÔÊÇ·ñËùÓĞµÄÍæ¼Ò¶¼ËÀÍö£¬Èç¹ûÊÇÔò´³¹ØÊ§°Ü
--²ß»®ÈË£º³Â¹«×Ó
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-11-09
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\missions\\northwest_mission\\stage\\stage_time.lua")
function OnDeath()
	--µÚÁù¹ØËÀÍöÉ¾³ı
		local minor_num = BigGetItemCount(2,0,1041)
		if minor_num  ~=0 then
			BigDelItem(2,0,1041,minor_num)
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().." tö vong, 'Ph¸ ¶o ¶nh' do kh«ng cã linh khİ nªn tù biÕn mÊt!\")")
		end
	--½áÊø
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	local death_chk_flag = 1
	local player_index_save = PlayerIndex
	for i = 1, getn(player) do
		if player[i] ~= player_index_save then
			PlayerIndex = player[i]
			death_chk_flag = (death_chk_flag * IsPlayerDeath())
		end
	end
	--Èç¹ûÈ«ÌåËÀÍö
	if death_chk_flag == 1 then
		local mission_count = GetMapTaskTemp(nMapID,1)
		WriteLog("[¶i T©y B¾c]thèng kª thÊt b¹i: ID ¶i	"..GetMissionV(MS_STATE_DIFF_ID)..":"..nMapID..":"..mission_count.."	Sè ng­êi ch¬i	"..GetTeamSize().."	thêi gian tr¶i qua	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
		SetMissionV(MS_TIMMER_LOOP_ID,6)
		stage_mission_fail(GetMissionV(MS_STATE_DIFF_ID))
		ClearMapNpc(nMapID)
		--×¼±¸¹Ø¿¨½áÊø
	end
	PlayerIndex = player_index_save
end

