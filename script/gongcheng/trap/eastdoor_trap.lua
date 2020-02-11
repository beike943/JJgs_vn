--create date:07-04-13
--author:yanjun
--describe:¶«ÃÅTrapµã
Include("\\script\\gongcheng\\gongcheng_function.lua");

tReturnPos = {{1259,3015},{1259,3015}};

function main()
	local nPlayerCamp = GCZ_GetPlayerCamp()
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_READY then	--Èç¹ûÊÇ×¼±¸½×¶Î¶¼²»ÄÜÍ¨¹ý
		SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
		Msg2Player(" hiÖn ®ang trong giai ®o¹n chuÈn bÞ, kh«ng thÓ ®i qua");
		return 0;
	end;
	local nTrapState = GetMissionV(MV_TRAP_EAST_DOOR);
	if GetMissionV(MV_DESTROY_EAST_DOOR) == 1 then	--Èç¹û³ÇÃÅ±»´Ý»Ù
		return 0;
	end;
	if nTrapState == 0 or nPlayerCamp == nTrapState then	--Èç¹û¶ÔË«·½¿ª·Å»ò¶Ô±¾ÕóÓª¿ª·Å
		return 0;
	end;
	SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
	Msg2Player("Thµnh m«n nµy hiÖn do bang héi phe ®Þch trÊn thñ, kh«ng thÓ v­ît qua ");
end;