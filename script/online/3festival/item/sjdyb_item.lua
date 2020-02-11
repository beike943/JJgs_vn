Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyExp(1);
		Msg2Player("B¹n nhËn ®­îc1 ®iÓm kinh nghiÖm");
		local nRand = random(1,100);
		CastState("state_damage_life_max",99,30*18,1,214000);	--ÉúÃüÉÏÏŞ½µµÍ99%³ÖĞø30Ãë
		Msg2Player("Sinh lùc tèi ®a gi¶m 99% trong 30 gi©y");
		if nRand <= 75 then
			CastState("state_m_attack_percent_add",100,10*18,1,197000);
			CastState("state_p_attack_percent_add",100,10*18,1,196000);
			Msg2Player("C«ng kİch t¨ng 100%, duy tr× 10 gi©y");
		elseif nRand <= 95 then
			CastState("state_m_attack_percent_add",200,10*18,1,197000);
			CastState("state_p_attack_percent_add",200,10*18,1,196000);
			Msg2Player("C«ng kİch 200%, duy tr× 10 gi©y");	
		else
			CastState("state_m_attack_percent_add",500,10*18,1,197000);
			CastState("state_p_attack_percent_add",500,10*18,1,196000);
			Msg2Player("C«ng kİch 500%, duy tr× 10 gi©y");	
		end;
		Msg2_LeiTai("B¸nh trung thu khĞt");
	end;
end;