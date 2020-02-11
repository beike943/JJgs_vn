--Include("\\script\\pet\\pet_book_exchange.lua")
--Include("\\script\\pet\\pet_update.lua")
--Include("\\script\\pet\\forget_pet_skill.lua")
--ENABLE_PET_NPC_TEST=1

--Í¨¹ı³èÎï¼¼ÄÜÊéÑ§Ï°³èÎï¼¼ÄÜ
--MONEY_NEED_RATE = 50000
MONTE_TO_GOLD_RATE = 10000

function OnUse(id)
	local tbSay = {}
	local nPetCount,tbPetList = GetPetList()
	local szBookName = GetItemName(id)
	if nPetCount > 0 then
		local nLevel = GetItemLevel(id)
		local nNeedMoney = _get_need_money(nLevel)
		local nNeedGold = floor(nNeedMoney / MONTE_TO_GOLD_RATE)
		local szTitle = format("H·y chän kü n¨ng cÇn luyÖn <color=yellow>[%s]<color> cho b¹n ®ång hµnh (luyÖn kü n¨ng cÇn tiªu hao %d vµng). §èi víi nh÷ng kü n¨ng ®· cã víi cÊp ®é thÊp h¬n ®­îc n©ng cÊp thµnh c«ng sÏ ®­îc nhËn l¹i t­ chÊt ®· chiÕm dông. <enter><color=red>Chó ı, kü n¨ng luyÖn thµnh c«ng cã tû lÖ nhÊt ®Şnh thay thÕ kü n¨ng hç trî hiÖn cã.<color>", szBookName, nNeedGold);
		for i = 1, getn(tbPetList) do
			local szItem = format("%s(T­ chÊt cßn l¹i:%d/%d)/#_OnLearnOnPet(%d, %d)", tbPetList[i].szName, tbPetList[i].nCurTianZi, tbPetList[i].nMaxTianZi, id, tbPetList[i].nIndex)
			tinsert(tbSay, szItem)
		end
--		if ENABLE_PET_NPC_TEST then
--			tinsert(tbSay, "ÎÒÒªÉı¼¶»ï°é/PetUpdateMain")
--			tinsert(tbSay, "ÎÒÒª¶Ò»»»ï°é¼¼ÄÜÊé/PetBookExchangeMain")
--			tinsert(tbSay, "ÎÒÒªÒÅÍü»ï°é¼¼ÄÜ/ForgetPetSkillMain")
--		end
		tinsert(tbSay, "Th«i ®i, ta kh«ng muèn häc/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		Talk(1,"","C¸c h¹ ch­a cã b¹n ®ång hµnh, kh«ng thÓ sö dông s¸ch kÜ n¨ng nµy!")
	end
end

function _OnLearnOnPet(nBookId, nPetIndex)
	local nLevel = GetItemLevel(nBookId)
	local nNeedMoney = _get_need_money(nLevel)
	local nCash = GetCash()
	if nCash < nNeedMoney then
		Msg2Player(format("Sè vµng hiÖn cã cña c¸c h¹ kh«ng ®ñ %d vµng", floor(nNeedMoney/MONTE_TO_GOLD_RATE)))
		return
	end
	
	local nRet = LearnPetSkill(nBookId, nPetIndex)
	if nRet > 0 then
		DelItemByIndex(nBookId, -1)--ÏÈÉ¾³ı¼¼ÄÜÊé
		Pay(nNeedMoney)
		if nRet > 1 then
			Msg2Player("LuyÖn kÜ n¨ng b¹n ®ång hµnh thµnh c«ng!")
		else
			Msg2Player("LuyÖn kÜ n¨ng b¹n ®ång hµnh thÊt b¹i!")
		end
		WriteLog(format("[Account:%s Role:%s]Use pet skill book %s(%d,%d,%d) ItemIdx=%d, PayMoney=%d, RetValue=%d(2=success)"
			, GetAccount(), GetName(), GetItemName(nBookId), GetItemGenre(nBookId), GetItemDetail(nBookId), GetItemParticular(nBookId)
			, nBookId, nNeedMoney, nRet
			))
	end
end

function _get_need_money(nLevel)
	local tMoney = {
		2*10000,
		4*10000,
		10*10000,
		50*10000,
		200*10000,
	}
	if nLevel>=1 and nLevel<=getn(tMoney) then
		return tMoney[nLevel]
	else
		return 999999*10000
	end
end

function no()
end