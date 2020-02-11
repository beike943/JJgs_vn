Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function main()
	local nState = GetMissionV(MV_BATTLE_STATE);
	local nMapID = GetWorldPos();
	if MS_STATE_PEACE == nState or MS_STATE_READY == nState then
		local nLoop = GetMissionV(MV_BATTLE_TIMER_LOOP);
		local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID,CampOne_ID);
		local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID,CampTwo_ID);	
		local szTitle="<color=green>Li™u Ti“n Tuy’n Binh<color>".." cﬂn "..tostring(READY_TIME/18*nLoop).."s, chi’n tr≠Íng li™n Æ u ch›nh th¯c bæt Æ«u. SË ng≠Íi hi÷n tπi lµ: "..CampOne_Name.."["..nPlayerOne.."]:"..CampTwo_Name.."["..nPlayerTwo.."]"
		Say(szTitle, 0);
	else
		if MS_STATE_COMPLETE ~= nState and GetFightState() == 0 then
			local tSay = {};
			local nMapID, nX, nY = GetNpcWorldPos(GetTargetNpc());
			local nCamp = KF_GetCamp();
			if nCamp ~= CampOne_ID and nCamp ~= CampTwo_ID then
				return 0;
			end
			if nX == 1864 and nY == 3331 then
				tinsert(tSay, format("ß≠a ta Æ’n tr≠Ìc Æπi doanh/#KF_TransmitPlayer(%d,%d,%d)", 0, 1850, 3360));
			else
				tinsert(tSay, format("ß≠a ta Æ’n b™n g«n Æπi doanh/#KF_TransmitPlayer(%d,%d,%d)", 0, 1843, 3243));
			end
			local tRevivePos = {
				[1] = {1606, 3309, "C∂nh M´n TrÀn K˙"},
				[2] = {1827, 3370, "Di÷t M´n TrÀn K˙"},
				[3] = {1888, 3754, "Sinh M´n TrÀn K˙"},
				[4] = {1656, 3676, "Tˆ M´n TrÀn K˙"},
				[5] = {1736, 3537, "ßπi TrÀn K˙"},
			};
			local tTemp = {
				MV_BATTLE_FLAG_JM, --’Û∆Ï0÷–¡¢£¨1ÀŒ£¨2¡…
				MV_BATTLE_FLAG_MM, --’Û∆Ï0÷–¡¢£¨1ÀŒ£¨2¡…
				MV_BATTLE_FLAG_SM,	--’Û∆Ï0÷–¡¢£¨1ÀŒ£¨2¡…
				MV_BATTLE_FLAG_SI,	--’Û∆Ï0÷–¡¢£¨1ÀŒ£¨2¡…
				MV_BATTLE_FLAG_DA,	--’Û∆Ï0÷–¡¢£¨1ÀŒ£¨2¡…
			}
			for i = 1, getn(tTemp) do
				if GetMissionV(tTemp[i]) == nCamp then
					tinsert(tSay, format("ß≠a ta Æ’n %s/#KF_TransmitPlayer(%d,%d,%d)", tRevivePos[i][3], i, tRevivePos[i][1], tRevivePos[i][2]));
				end
			end
			--–¬‘ˆ∞≤»´¥´ÀÕ
			local nSongScore = GetMissionV(MV_BATTLE_SONG_SCORE);
			local nLiaoScore = GetMissionV(MV_BATTLE_LIAO_SCORE);
			local nPointIndex = GetMissionV(MV_BATTLE_TEMP_SAFE_POS_INDEX_LIAO);
			if nPointIndex > 0 and nPointIndex <= getn(KF_TEMP_SAFE_POS[nCamp]) and nSongScore - nLiaoScore > KF_TEMP_SAFE_POS_CONDITION then
				tinsert(tSay, format("ß≠a ta Æ’n Æi”m truy“n tËng kh∏c/#KF_SafeTransmitPlayer(%d)", nPointIndex));
			end
			tinsert(tSay, "Tπi hπ chÿ xem qua th´i/nothing");
			Say("<color=green>Li™u Ti“n Tuy’n Binh<color>".."Thi’u hi÷p quy’t Æﬁnh Æ’n chi’n tr≠Íng ?", getn(tSay), tSay);
		end
	end
end