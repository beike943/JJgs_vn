--gtask¹¦ÄÜ½Å±¾
--¼ÓÈë´äÑÌÃÅÅÉ
--taskid 141

function JoinFaction()
	if GetLevel() < 10 then
		Talk(1,"","Ch­a ®¹t cÊp 10, kh«ng thÓ gia nhËp m«n ph¸i.");
		return 0;
	end
	
	if GetPlayerFaction() > 0 then
		Talk(1,"",format("ThiÕu hiÖp ®· gia nhËp vµo m«n ph¸i kh¸c, kh«ng thÓ gia nhËp %s råi.", "Thóy Yªn"));
		return 0;
	end
	
	--²»ÊÇÅ®ºÅ
	if GetSex() ~= 2 then
		return 0;
	end
	
	--¼ÓÈë´äÑÌÃÅÅÉ
	SetPlayerFaction(10);
	SetCurrentNpcSFX(PIdx2NpcIdx(), 921, 1, 0, 18 *3);
	TaskTip(format("C¸c h¹ ®· gia nhËp %s, hiÖn t¹i cã thÓ t×m s­ phô b¸i s­ häc vâ råi!", "Thóy Yªn"));
	Msg2Player(format("C¸c h¹ ®· gia nhËp %s, hiÖn t¹i cã thÓ t×m s­ phô b¸i s­ häc vâ råi!", "Thóy Yªn"));
end

dostring("JoinFaction()");
