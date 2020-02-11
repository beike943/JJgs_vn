Include("\\script\\online\\qixi08\\box\\mission_head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

szNpcName = "<color=green>ThuyÒn phu §«ng H¶i<color>: "

function main()
	local tSay = 
	{
		"Mau ®­a ta tíi C« §¶o (tèn 1 vµng)/go_island",
		"§¨ng ký tíi khu vùc §«ng H¶i - §¶o HiÖp Kh¸ch/go_oversea",
		"T¹m thêi ta ch­a muèn ®i/gf_DoNothing",
	}
	if GetTaskTrans() == 15 then
		trans_talk_15()
	else
		Say(szNpcName.."ThuyÒn ®i kh«ng ®îi ng­êi. Mêi c¸c vÞ ®¹i hiÖp mau chãng lªn ®­êng.",getn(tSay),tSay)
	end
end

function go_island()
	if mf_GetMissionV(MISSION_ID,MV_STATE,MAP_ID) == MS_STATE_BEGIN then
		Talk(1,"",szNpcName.."H«m nay biÓn cã nhiÒu biÕn ®éng, tèt nhÊt kh«ng nªn ®i!");
		return 0;
	end;
	if GetCash() < 10000 then
		Talk(1,"",szNpcName.."VÞ ®¹i hiÖp ®©y h×nh nh­ kh«ng mang theo tiÒn vµng trong ng­êi?")
		return
	end	
	if GetPKValue() >= 9 then	
		Talk(1,"",szNpcName.."VÞ ®¹i hiÖp ®©y ®· g©y rÊt nhiÒu téi ¸c. Thø lçi t¹i h¹ kh«ng thÓ ®­a lªn thuyÒn ®­îc! Xin h·y gi¶m ®iÓm PK!");
		return 0;
	end;
	if floor(GetTask(TASK_VNG_PET) / 100) < 200 then
		Talk(1,"",szNpcName.."B¹n §ång Hµnh cña ®¹i hiÖp ch­a ®ñ 200 ®iÓm N©ng CÊp, ch­a thÓ lªn ®¶o!");
		return 0;
	end
	if Pay(10000) ==1 then			
		mf_JoinMission(MISSION_ID,CAMP_1,MAP_ID);		
	end
end

function go_oversea()
	Talk(1,"",szNpcName.."ThuyÒn ®· rêi bÕn. Mêi ®¹i hiÖp quay l¹i sau!")
end