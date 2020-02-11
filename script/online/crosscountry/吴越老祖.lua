-- ÎâÔ½ÀÏ×æ

function OnDeath()
	local nPreservedPlayerIndex	= PlayerIndex
	local nMemCount	= GetTeamSize()
	local nMapId, nX, nY = GetWorldPos()

	if nMemCount ==	0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(1402) ==	85 then
			SetTask(1402, 90)
			Msg2Player("Thµnh c«ng ®¸nh b¹i Ng« ViÖt l·o tæ")
			TaskTip("Thµnh c«ng ®¸nh b¹i Ng« ViÖt l·o tæ")
		end
	else
		for	i=1,nMemCount do
			PlayerIndex	= GetTeamMember(i)
			local nTeamMapId, nTeamX, nTeamY = GetWorldPos()
			local nDist	= DistanceBetweenPoints(nMapId,	nX,	nY,	nTeamMapId,	nTeamX,	nTeamY)
			if GetTask(1402) == 85 and nDist >= 0 and nDist <=	50 then
				SetTask(1402, 90)
				Msg2Player("Thµnh c«ng ®¸nh b¹i Ng« ViÖt l·o tæ")
				TaskTip("Thµnh c«ng ®¸nh b¹i Ng« ViÖt l·o tæ")
			end
		end
		PlayerIndex	= nPreservedPlayerIndex 	-- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
	end
end
