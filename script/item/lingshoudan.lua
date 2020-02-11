Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItem)
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch­a hoµn thµnh nhiÖm vô phôc sinh ®ång hµnh, t¹m thêi kh«ng thÓ më!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("Sè l­îng b¹n ®ång hµnh hiÖn t¹i v­ît qu¸ 5");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		local tPetIndex = {24,25,26};
		local tPetName = {"Thá tr¾ng","Thá x¸m","Thá ®en"};
		local nIndex = random(getn(tPetIndex));
		AddPet(tPetIndex[nIndex]);
		Msg2Player(format("Ng­¬i nhËn ®­îc [%s] b¹n ®ång hµnh",tPetName[nIndex]));
	end
end