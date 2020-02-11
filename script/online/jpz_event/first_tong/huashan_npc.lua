Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");

g_InfoHeader = "<color=green>Vâ L©m §Æc Sø<color>: "

function main()
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,HUASHAN_MAP_ID) == 2 then
		Say(g_InfoHeader.."Ho¹t ®éng bang héi tinh anh ®ang tiÕn hµnh, c¸c h¹ kh«ng thÓ rêi khái b¶n ®å Hoa S¬n.",0);
		return
	end

	Say(g_InfoHeader.."Hoa S¬n c¶nh ®Ñp tuyÖt mü, ng­¬i muèn rêi khái ch¨ng?",
	2,
	"§óng! Ta muèn rêi khái/LeaveMap",
	"KÕt thóc ®èi tho¹i/end_dialog"
	)
end

--Íæ¼ÒÒªÇóÀë¿ª±ÈÈü³¡µØ
function LeaveMap()
	--µ±Ç°ÉêÇëÈË²»ÊÇ¶Ó³¤
	if PlayerIndex ~= GetTeamMember(0) then
		LeaveTeam();
	end

	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,HUASHAN_MAP_ID) == 0 then
		MS_SetPlayerState(3);
		NewWorld(100,1420,2989);
		return
	end

	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(HUASHAN_MAP_ID);
	if SubWorld >= 0 then
		DelMSPlayer(MISSION_ID,0);
	end;
	SubWorld = nOldSubWorld;
end

function end_dialog()
end
