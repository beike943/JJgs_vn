--File name:
--Describe:±ÈÈü³¡µØ¹¤×÷Õß
--Create Date:2006-4-26
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local selTab = {
				"§óng! Ta muèn rêi khái/leave",
				"TiÕp tôc tham gia thi ®Êu/nothing",
				}
	Say("B¹n muèn rêi khái tr­êng ®Êu ngay b©y giê?",getn(selTab),selTab);
end;

function leave()
	if GetTask(STATUS) == CAMP_PLAYER then
		DelMSPlayer(MISSION_ID,CAMP_PLAYER);
	else
		local MapID = GetWorldPos();
		local MapIndex = floor(MapID/1000);
		if MapIndex == 1 then
			MapIndex = 3;
		elseif MapIndex == 3 then
			MapIndex = 1;
		end;
		NewWorld(LeavePoint[MapIndex][1],LeavePoint[MapIndex][2],LeavePoint[MapIndex][3]);
		Restore_Player_State();
		WriteLog("[Lçi ho¹t ®éng tÕt §oan Ngä]: Cã ng­êi ch¬i kh«ng ph¶i lµ tuyÓn thñ tham gia trong khu vùc ®ua thuyÒn Rång, tªn nh©n vËt:"..GetName());
	end;
end;