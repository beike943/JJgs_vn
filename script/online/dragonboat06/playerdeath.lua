Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnDeath(Launcher)
	DelMSPlayer(MISSION_ID,CAMP_PLAYER);
	return 1;
end;