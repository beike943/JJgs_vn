--¾­ÂöÖØÖÃNPC»á»°½Å±¾
Include ("\\script\\system_switch_config.lua")

MONEY_TO_GOLD_RATE = 10000
t_need_gold = 
{
	[1] = 9,
	[2] = 99,
}

function OnNpcTalkToRestore()
	local tbSay = {}
	local szTitle = ""
	if 1 == IsMeridianSystemOpen() and MeridianGetLevel() >= 1 then
		szTitle = format("Ta cã thÓ gióp ng­¬i dŞch c©n tÈy tñy, c¶nh giíi Vâ Gi¶ cÇn hao phİ 9 vµng, c¶nh giíi Vâ T­íng cÇn hao phİ 99 vµng.")
		tinsert(tbSay, format("Ta muèn dŞch c©n tÈy tñy/_DoRestore"))
		tinsert(tbSay, "Ta chØ ghĞ ch¬i/no")
	else
		szTitle = format("HiÖn t¹i c¸c h¹ vÉn ch­a kİch ho¹t c¶nh giíi, rÊt tiÕc ta kh«ng thÓ gióp ng­¬i dŞch c©n tÈy tñy.")
		tinsert(tbSay, "Tho¸t/no")
	end
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _DoRestore()
	if 1 == _CheckConsume() then
		if 1 == _DoConsume() then
			MeridianRestore(-1)
		end
	end
end

function _CheckConsume()
	local nNeedGold = _GetNeedGold()
	local nCash = GetCash()
	if nCash < (nNeedGold * MONEY_TO_GOLD_RATE) then
		Msg2Player(format("Sè vµng hiÖn cã cña c¸c h¹ kh«ng ®ñ %d vµng", nNeedGold))
		return 0
	end
	return 1
end

function _DoConsume()
	local nNeedMoney = _GetNeedGold() * MONEY_TO_GOLD_RATE
	local nPayStatue = Pay(nNeedMoney) or 0
	return nPayStatue
end

function _GetNeedGold()
	local nLevel = MeridianGetLevel()
	local nRet = t_need_gold[nLevel] or -1
	return nRet
end



function no()
end
