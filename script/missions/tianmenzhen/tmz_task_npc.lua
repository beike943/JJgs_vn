--ÌìÃÅÕóºóĞøÈÎÎñnpc£ºÒ®ÂÉ±£Í¼
--by vivi
--2009-08-04
Include("\\script\\task\\world\\task_award.lua");

function OnDeath()
	local nOldPlayer = PlayerIndex;
	if GetTeamSize() == 1 or GetTeamSize() == 0 then
		if GetTask(1401) == 139 then
			TMZ_Task_Deal()
		end
	else
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetTask(1401) == 139 then
					TMZ_Task_Deal()
				end
			end
		end
		PlayerIndex = nOldPlayer;	
	end
end
--Ò®ÂÉ±£Í¼ÈÎÎñ´¦Àí
function TMZ_Task_Deal()
	SetTask(1401,140);
	GivePlayerExp(SkeyTianmenzhen,"liaojunjunguan")
	Msg2Player("S¨n t×m kh¾p n¬i còng kh«ng ph¸t hiÖn g×, h·y quay vÒ t×m Méc QuÕ Anh hái th¨m tin tøc.");
	TaskTip("S¨n t×m kh¾p n¬i còng kh«ng ph¸t hiÖn g×, h·y quay vÒ t×m Méc QuÕ Anh hái th¨m tin tøc.");
end