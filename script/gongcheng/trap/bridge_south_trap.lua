--create date:07-04-27
--author:yanjun
--describe:ÄÏ±ßÇÅÁºTrapµã
Include("\\script\\gongcheng\\gongcheng_function.lua");

tReturnPos = {{1114,2944},{1114,2944}};

function main()
	local nPlayerCamp = GCZ_GetPlayerCamp()
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_READY then	--Èç¹ûÊÇ×¼±¸½×¶Î¶¼²»ÄÜÍ¨¹ý
		SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
		Msg2Player(" hiÖn ®ang trong giai ®o¹n chuÈn bÞ, kh«ng thÓ ®i qua");
		return 0;
	end;
end;