Include("\\script\\lib\\globalfunctions.lua")

JLMD_TABLE = {
	[2] = {15, {5, 100000000, 500}, 0},
	[3] = {10, {10, 200000000, 1000}, 0},
	[4] = {4, {15, 400000000, 3000}, 0},
	[5] = {2, {20, 1000000000, 8000}, 1},
};

function OnUse(nItem)
	local nLevel = gf_GetPetSkillLevel();
	if nLevel < 1 then
		Say("Ng­¬i vÉn ch­a häc Gi¸ng Linh ThuËt!", 0);
		return
	end
	if not JLMD_TABLE[nLevel + 1] then
		Say("T¹m thêi ch­a më tÝnh n¨ng lÜnh ngé Gi¸ng Linh ThuËt cÊp hiÖn t¹i!", 0);
		return
	end
	local tCost = JLMD_TABLE[nLevel + 1][2];
	Say(format("§ång ý tiªu hao <color=red>%s*%d, EXP %d, ®iÓm tu luyÖn %d<color> ®Ó lÜnh ngé Gi¸ng Linh ThuËt cÊp cao h¬n kh«ng?", "Gi¸ng Linh BÝ §iÓn", tCost[1], tCost[2], tCost[3]), 2, format("§ång ý/#try_update_jinglingshu(%d)", nLevel + 1), "Hñy bá/nothing");
end

function try_update_jinglingshu(nIndex)
	local tCost = JLMD_TABLE[nIndex][2];
	if not tCost then
		return 
	end
	if GetItemCount(2, 1, 30725) < tCost[1] then
		Say(format("Sè l­îng <color=gold>%s<color> kh«ng ®ñ <color=red>%d<color>", "Gi¸ng Linh BÝ §iÓn", tCost[1]), 0);
		return
	end
	if GetExp() < tCost[2] then
		Say(format("Sè l­îng <color=gold>%s<color> kh«ng ®ñ <color=red>%d<color>", "Kinh nghiÖm", tCost[2]), 0);
		return
	end
	if GetPopur() < tCost[3] then
		Say(format("Sè l­îng <color=gold>%s<color> kh«ng ®ñ <color=red>%d<color>", "LuyÖn", tCost[3]), 0);
		return
	end
	if DelItem(2, 1, 30725, tCost[1]) ~= 1 then
		return
	end
	
	AddRuntimeStat(28, 1, nIndex, 1);--³å»÷½µÁéÊõX¼¶µÄ´ÎÊý
	AddRuntimeStat(28, 2, 0, tCost[1]); --ÏûºÄ½µÁéÃØµäÊýÁ¿
	
	ModifyExp(-tCost[2]);
	ModifyPopur(-tCost[3]);
	local rand = random(100);
	if rand <= JLMD_TABLE[nIndex][1] then
		gf_SetPetSkillLevel(nIndex);
		if JLMD_TABLE[nIndex][3] == 1 then
			Msg2Global(format("Chóc mõng [%s] sö dông Gi¸ng Linh MËt TÞch lÜnh ngé Gi¸ng Linh ThuËt cÊp %d", GetName(), nIndex));
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		Say("LÜnh ngé thÊt b¹i Gi¸ng Linh ThuËt cÊp cao h¬n!", 0);
	end
end