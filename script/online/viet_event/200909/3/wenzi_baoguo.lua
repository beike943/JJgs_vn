GET_WENZI_ID = 2434

function main()
	if GetLevel() < 10 then
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		return 0
	end
	
	local nDate = tonumber(date("%Y%m%d"));
	local nTaskVal = GetTask(GET_WENZI_ID)
		
	if nTaskVal == nDate then
		Talk(1,"","Mçi ngµy chØ cã thÓ nhÆt 1 V¨n Tö Bao.")
		return 0	
	end	
	
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)	
	SetTask(GET_WENZI_ID,nDate)
	
	local nExp = 500000
	ModifyExp(nExp)
	Msg2Player("B¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
end