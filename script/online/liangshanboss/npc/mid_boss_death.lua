--ÖÐbossËÀÍö½Å±¾
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function OnDeath(Index,f,x)
--	print(Index,f,x)
	if f ~= 0 then return 0; end
	local nTeamSize = GetTeamSize();
	local nNpcIndex;
	if nTeamSize == 0 then
		nNpcIndex = GetTaskTemp(Mid_Boss_Index);
		if tonumber(nNpcIndex) == tonumber(Index) then
			create_mid_box();
		end
	else
		local OldPlayerIndex = PlayerIndex;
		for i= 1, nTeamSize do 
			PlayerIndex = GetTeamMember(i);
			nNpcIndex = GetTaskTemp(Mid_Boss_Index);
			if tonumber(nNpcIndex) == tonumber(Index) then
				create_mid_box();
			end
		end
		PlayerIndex = OldPlayerIndex;
	end
	SetNpcLifeTime(Index,0);
end

function create_mid_box()
	local nMapId,nX,nY = GetWorldPos();
	local nNpcIdx = CreateNpc("B¶o r­¬ng Tµi nguyªn", format("§¹i B¶o R­¬ng cña %s",GetName()), nMapId, nX + 2, nY + 2);
	SetNpcLifeTime(nNpcIdx,3 * 60);
	SetTaskTemp(Mid_Boss_Index,nNpcIdx);
	SetNpcScript(nNpcIdx,Box_D_Script);
end