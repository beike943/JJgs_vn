--gtask¹¦ÄÜ½Å±¾
--¼ÓÈëÀ¥ÂØÃÅÅÉ
--taskid 135

function JoinFaction()
	if GetLevel() < 10 then
		Talk(1,"","Ch­a ®¹t cÊp 10, kh«ng thÓ gia nhËp m«n ph¸i.");
		return 0;
	end
	
	if GetPlayerFaction() > 0 then
		Talk(1,"",format("ThiÕu hiÖp ®· gia nhËp vµo m«n ph¸i kh¸c, kh«ng thÓ gia nhËp %s råi.", "C«n L«n"));
		return 0;
	end
	
	--²»ÊÇÄĞºÅ
	if GetSex() ~= 1 then
		return 0;
	end
	
	--¼ÓÈëÀ¥ÂØÃÅÅÉ
	SetPlayerFaction(8);
	SetCurrentNpcSFX(PIdx2NpcIdx(), 921, 1, 0, 18 *3);
	TaskTip(format("C¸c h¹ ®· gia nhËp %s, hiÖn t¹i cã thÓ t×m s­ phô b¸i s­ häc vâ råi!", "C«n L«n"));
	Msg2Player(format("C¸c h¹ ®· gia nhËp %s, hiÖn t¹i cã thÓ t×m s­ phô b¸i s­ häc vâ råi!", "C«n L«n"));
end

dostring("JoinFaction()");