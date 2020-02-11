Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local selTab = {
				"Rêi khái chiÕn tr­êng/ask_reason",
				"KÕt thóc ®èi tho¹i/gf_DoNothing",
				}
	Say("<color=green>bang chóng hËu cÇn<color>: c¸c vÞ anh hïng nªn ®oµn kÕt víi nhau cïng kh¸ng ngo¹i ®Þch!",getn(selTab),selTab);
end;

function ask_reason()
	if GetMissionV(MV_TMZ_STATE) == MS_STATE_COMPLETE then
		Talk(1,"","<color=green>bang chóng hËu cÇn<color>: Thiªn M«n TrËn ®· kÕt thóc, h·y ®îi hÖ thèng chuyÓn ra ngoµi.");
		return 0;
	end
	AskClientForString("leave","NhÑ nhµng rêi khái...",1,32,"Sao ph¶i rêi khái?");
end;	

function leave(sLeaveMsg)
	local nCmap = TMZ_GetCamp();
	if GetMissionV(MV_TMZ_STATE) ~= MS_STATE_PEACE then --·ÇµÈ´ý½×¶ÎÍË³ö
		SetTask(TASKID_TMZ_JOIN_TIME,GetTime()); --³ÜÈè×´Ì¬
	end
	DelMSPlayer(MISSION_ID,nCmap);
	Msg2MSAll(MISSION_ID,GetName().."Rêi khái ®Ó l¹i tin nh¾n:"..sLeaveMsg);
end;

function nothing()

end;
