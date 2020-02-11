--Ê¹ÓÃ¿É´«ËÍÖÁÉñÊÞ¿´»¤Õß
Include("\\script\\missions\\tong_melee\\tm_head.lua")

function OnUse(nItem)
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local nMapId, nMapTemplteId = SubWorldIdx2ID(SubWorld);
	if nMapTemplteId ~= 6074 then
		Talk(1,"","B¶n ®å nµy kh«ng thÓ sö dông");
		return 0;
	end
	local oldPlayerIdx = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2, 1, 30616) >= 1 then
			local nMapId, nX, nY = GetWorldPos();
			PlayerIndex = oldPlayerIdx;
			SetPos(nX, nY);
			Msg2Player("Ng­¬i sö dông Tø Linh Thæ §Þa Phï truyÒn tèng ®Õn chç ThÇn Thó Khan Hé Gi¶!");
			break;
		end
	end
	PlayerIndex = oldPlayerIdx;
	SetItemUseLapse(nItem, 30*18);
end