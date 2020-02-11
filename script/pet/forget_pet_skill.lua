--ÒÅÍü³èÎï¼¼ÄÜ

NEED_GOLD = 10
MONTE_TO_GOLD_RATE = 10000

t_player_pet_list = {}

function ForgetPetSkillMain()
	_ChoosePet()
end

function _ChoosePet()
	local tbSay = {}
	local nPetCount,tbPetList = GetPetList()
	t_player_pet_list[PlayerIndex] = tbPetList--¸üÐÂ³èÎïÁÐ±í
	if nPetCount > 0 then
		local szTitle = format("Cã ph¶i b¹n ®ång hµnh cña c¸c h¹ së h÷u nh÷ng kü n¨ng hç trî kh«ng ®­îc ­ng ý, kh«ng cÇn lo l¾ng, ta cã thÓ gióp ng­¬i xãa bá nh÷ng kü n¨ng b×nh th­êng ®ã dµnh vÞ trÝ cho kü n¨ng cao cÊp h¬n. Chi phÝ cho mçi lÇn xãa kü n¨ng lµ %d vµng. <color=red>Kü n¨ng bÞ xãa ®i sÏ kh«ng thÓ kh«i phôc l¹i, chØ cã thÓ luyÖn l¹i tõ ®Çu.<color> H·y chän kü n¨ng b¹n ®ång hµnh cÇn xãa bá:", NEED_GOLD);
		for i = 1, getn(tbPetList) do
			local szItem = format("%s(T­ chÊt cßn l¹i:%d/%d)/#_ChooseSkill(%d)", tbPetList[i].szName, tbPetList[i].nCurTianZi, tbPetList[i].nMaxTianZi, i)
			tinsert(tbSay, szItem)
		end
		tinsert(tbSay, "Tho¸t/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		Talk(1,"","C¸c h¹ ch­a cã b¹n ®ång hµnh kh«ng thÓ xãa kü n¨ng!")
	end
end

function _ChooseSkill(nPetListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 then
		local szTitle = format("C¸c h¹ x¸c ®Þnh xãa kü n¨ng b¹n ®ång hµnh <color=yellow>%s(t­ chÊt cßn l¹i:%d/%d)<color> kh«ng?<color=red>kü n¨ng bÞ xãa sÏ kh«ng thÓ kh«i phôc l¹i, cã thÓ thÓ luyÖn l¹i tõ ®Çu<color>H·y chän kü n¨ng cÇn xãa (xãa kü n¨ng cÇn tiªu hao %d vµng):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi, NEED_GOLD);
		for i = 1, getn(tbPetSkill) do
			local szItem = format("D·y %d: %s%d cÊp (ChiÕm t­ chÊt: %d)/#_ConfirmDelPetSkill(%d, %d)"
				, tbPetSkill[i].nSkillIndex + 1, tbPetSkill[i].szSkillName, tbPetSkill[i].nSkillLv, tbPetSkill[i].nNeedTianZi
				, nPetListIndex, i)
			tinsert(tbSay, szItem)
		end
		tinsert(tbSay, "trë l¹i/_ChoosePet")
		tinsert(tbSay, "Tho¸t/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		local szMsg = format("B¹n ®ång hµnh <color=yellow>%s<color> vÉn ch­a cã kü n¨ng hç trî, kh«ng thÓ xãa", tbPetInfo.szName)
		Talk(1,"",szMsg)
	end
end

function _ConfirmDelPetSkill(nPetListIndex, nSkillListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 and getn(tbPetSkill) >= nSkillListIndex then
		local szTitle = format("X¸c ®Þnh cho b¹n ®ång hµnh <color=yellow>%s (T­ chÊt cßn l¹i: %d/%d)<color>xãa kü n¨ng<color=yellow>d·y thø %d: %s%d cÊp (chiÕm t­ chÊt %d)<color> kh«ng? Thµnh c«ng xãa bá <color=yellow>®­îc nhËn l¹i ®iÓm t­ chÊt: %d<color>. <color=red>Kü n¨ng bÞ xãa ®i sÏ kh«ng thÓ kh«i phôc l¹i, chØ cã thÓ luyÖn l¹i tõ ®Çu.<color>H·y x¸c ®Þnh lÇn cuèi (xãa kü n¨ng cÇn tiªu hao %d vµng):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi
			, tbPetSkill[nSkillListIndex].nSkillIndex + 1, tbPetSkill[nSkillListIndex].szSkillName, tbPetSkill[nSkillListIndex].nSkillLv, tbPetSkill[nSkillListIndex].nNeedTianZi
			, tbPetSkill[nSkillListIndex].nNeedTianZi, NEED_GOLD);
		local szItem = format("X¸c ®Þnh xãa/#_OnDelPetSkill(%d, %d)", nPetListIndex, nSkillListIndex)
		tinsert(tbSay, szItem)
		szItem = format("trë l¹i/#_ChooseSkill(%d)", nPetListIndex)
		tinsert(tbSay, szItem)
		tinsert(tbSay, "Tho¸t/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
	end
end

function _OnDelPetSkill(nPetListIndex, nSkillListIndex)
	local nNeedMoney = NEED_GOLD * MONTE_TO_GOLD_RATE
	local nCash = GetCash()
	if nCash < nNeedMoney then
		Msg2Player(format("Sè vµng hiÖn cã cña c¸c h¹ kh«ng ®ñ %d vµng", NEED_GOLD))
		t_player_pet_list[PlayerIndex] = nil
		return
	end
	
	local tbPetInfo =t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) >= nSkillListIndex then
		local nResult = ForgetPetSkill(tbPetInfo.nIndex, tbPetSkill[nSkillListIndex].nSkillIndex, tbPetSkill[nSkillListIndex].nSkillId, tbPetSkill[nSkillListIndex].nSkillLv)
		if nResult == tbPetSkill[nSkillListIndex].nSkillIndex and nSkillListIndex >= 0 then
			Pay(nNeedMoney)
			local szMsg = format("B¹n ®ång hµnh %s ®· xãa kü n¨ng %s thµnh c«ng", tbPetInfo.szName, tbPetSkill[nSkillListIndex].szSkillName)
			Msg2Player(szMsg)
		end
	end
	
	t_player_pet_list[PlayerIndex] = nil
end

function no()
	t_player_pet_list[PlayerIndex] = nil
end