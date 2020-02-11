Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function Qht_Trigger()
	--»î¶¯ÊÇ·ñ¹ýÆÚ
	if qht_activity_isopen() ~= 1 then
		RemoveTrigger(GetTrigger(1277 * 2));
		return 0;
	end
	local nMapId,nX,nY = GetWorldPos();
	--µØÍ¼ÅÐ¶Ï
	if qht_map_allow({6021,6022,6023}, nMapId) ~= 1 then
		return 0;
	end
	--Ïà¹ØÉèÖÃ
	SetDeathScript("\\script\\online\\qianhe_tower\\qht_playerdeath.lua");
	SetDeathPunish(0);
	--´¥·¢
	local nNpcIdx,sMoban,sName = GetTriggeringUnit();
	
	if sName == "Tr× §ao Hé VÖ" then
		qht_add_exp(3000)
	elseif sName == "Tr× M©u Hé VÖ" then
		qht_add_exp(3500)
	elseif sName == "Thiªn TÇm Vâ T¨ng" then
		qht_add_exp(3500)
	elseif sName == "Thiªn TÇm Ph¸p T¨ng" then
		qht_add_exp(4000)
	elseif sName == "Ma Ni T¨ng" then
		qht_add_exp(4000)
	elseif sName == "§µ La Ni T¨ng" then
		qht_add_exp(4500)
	end
	
	local nRand = random(1,100);
	if nRand <= 20 then
		if nMapId == 6021 then
			if sName == "Tr× §ao Hé VÖ" then
				qht_kill_6021_monster();
			elseif sName == "Tr× M©u Hé VÖ" then
				qht_kill_6021_monster();
			end
		end
		if nMapId == 6022 then
			if sName == "Thiªn TÇm Vâ T¨ng" then
				qht_kill_6022_monster();
			elseif sName == "Thiªn TÇm Ph¸p T¨ng" then
				qht_kill_6022_monster();
			end
		end
		if nMapId == 6023 then
			if sName == "Ma Ni T¨ng" then
				qht_kill_6023_monster();
			elseif sName == "§µ La Ni T¨ng" then
				qht_kill_6023_monster();
			end
		end		
	end
end