Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")

function OnUse()
	local nMapID = GetWorldPos()
	if nMapID >= 700 then
		Talk(1,"","ë ®©y kh«ng thÓ sö dông thó c­ng!");
		return 0;
	end;
	if GetTask(TASK_PET_BORN) ~= 0 then
		Say("B¹n ®· cã thó c­ng, kh«ng thÓ gäi thªm thó c­ng kh¸c.",0)
	else
		AddPet()
	end
end

function AddPet()
	if DelItem(2,1,242,1) == 1 then
		CreateTrigger(1,500,3106)
		ContinueTimer(GetTrigger(3106))
		SetTask(TASK_PET_BORN,GetTime())	--¼ÇÂ¼³èÎïµÄ³öÉúÊ±¼ä
		SummonNpc("Sãi xanh","®Çy nhµ")
		WriteLog("[Ho¹t ®éng mïa xu©n (s¸o tróc)]:"..GetName().."B¹n ®· sö dông s¸o tróc gäi ra Sãi xanh.")
		Msg2Player("C¹nh b¹n ®· xuÊt hiÖn 1 thó c­ng ®¸ng yªu.")
	end
end


