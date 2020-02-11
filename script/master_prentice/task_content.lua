-- Ê¦Í½ÈÎÎñµÄÄÚÈÝ

Include("\\script\\global\\battlefield_callback.lua")

-- ÒÔÏÂÈÎÎñ±äÁ¿ÔÚ	\script\master_prentice\some_op.lua ÖÐ¶¨Òå¹ý
TASK_SEED = 1290
TASK_CONTENT = 1291

tTaskContent =
{
	[1] = 
	{
		"mp_do_shimen(2)",				-- Íê³É2´Î³õ¼¶Ê¦ÃÅÈÎÎñ
		"mp_do_shanghui(20)",			-- Íê³É20´ÎÉÌ»áÈÎÎñ
	},

	[2] = 
	{
		"mp_do_shashou(5)",				-- Íê³É5´ÎÉ±ÊÖÈÎÎñ
		"mp_do_shanghui(20)",			-- Íê³É20´ÎÉÌ»áÈÎÎñ
	},

	[3] = 
	{
		"mp_do_battle(1)",				-- ´òÍê1´ÎÕ½³¡
		"mp_do_shanghui(20)",			-- Íê³É20´ÎÉÌ»áÈÎÎñ
	},
	
	[4] =
	{
		"mp_do_cangjian(2)",			-- ²Ø½£¹ý2¹Ø
		"mp_do_shanghui(20)",			-- Íê³É20´ÎÉÌ»áÈÎÎñ
	},

	[5] =
	{
		"mp_do_taixu(4)",				-- Ì«Ðé¹ý4Åú¹Ö
		"mp_do_shanghui(20)",			-- Íê³É20´ÎÉÌ»áÈÎÎñ
	},

	[6] =
	{
		"mp_do_longzhou(4)",			-- ÅÜÍê4´ÎÁúÖÛ
		"mp_do_shanghui(20)",			-- Íê³É20´ÎÉÌ»áÈÎÎñ
	},

	[7] =
	{
		"mp_do_leitai(5)",				-- µ¥ÈËÀÞÌ¨5´Î
		"mp_do_shanghui(20)",			-- Íê³É20´ÎÉÌ»áÈÎÎñ
	},
}

tTaskCustomSave =
{
	"mp_shimen",
	"mp_shashou",
	"mp_battle",
	"mp_cangjian",
	"mp_taixu",
	"mp_longzhou",
	"mp_leitai",
	"mp_shanghui",
}

function _gettask(nRet, nParam1, nParam2)
	if nRet == 15 then
		Say("§Ö tö t¹m thêi kh«ng ®­îc nhËn NhiÖm vô S­ ®å", 0)
		return
	elseif nRet == 23 then
		Say("Theo ®¼ng cÊp thô nghiÖp vµ sè l­îng ®å ®Ö cña s­ phô, hiÖn chØ cã thÓ c«ng bè "..nParam2.." NhiÖm vô S­ ®å, nh÷ng NhiÖm vô S­ ®å nµy hiÖn ®· ®­îc l·nh hÕt", 0)
		return
	elseif nRet == 1 and nParam1 == 0 then
		Say("S­ phô hiÖn vÉn ch­a c«ng bè nhiÖm vô", 0)
		return
	elseif nRet == 1 and GetTask(TASK_SEED) == nParam1 and CustomDataRead("mp_shanghui") == nil then
		Say("B¹n ®· hoµn thµnh NhiÖm vô S­ ®å", 0)
		return
	elseif nRet == 1 and GetTask(TASK_SEED) == nParam1 and CustomDataRead("mp_shanghui") ~= nil then
		Say("B¹n ®· nhËn NhiÖm vô S­ ®å nµy råi", 0)
		return
	end
	
	SetTask(TASK_SEED, nParam1)
	SetTask(TASK_CONTENT, nParam2)
	Say("B¹n ®· tiÕp nhËn NhiÖm vô S­ ®å", 0)
	
	for index, value in tTaskCustomSave do
		CustomDataRemove(value)
	end
	
	if tTaskContent[nParam2] ~= nil then
		dostring(tTaskContent[nParam2][1])
		dostring(tTaskContent[nParam2][2])
	else
		Msg2Player("NhiÖm vô nµy kh«ng tån t¹i, vui lßng liªn hÖ víi bé phËn phôc vô kh¸ch hµng!")
	end
	SaveNow()
end

function mp_do_shimen(nChance)
	CustomDataSave("mp_shimen", "dd", 0, nChance)
end

function mp_do_shashou(nChance)
	CustomDataSave("mp_shashou", "dd", 0, nChance)
end

function mp_do_battle(nChance)
	CustomDataSave("mp_battle", "d", nChance)
end

function mp_do_cangjian(nStep)
	CustomDataSave("mp_cangjian", "d", nStep)
end

function mp_do_taixu(nStep)
	CustomDataSave("mp_taixu", "d", nStep)
end

function mp_do_longzhou(nChance)
	CustomDataSave("mp_longzhou", "dd", 0, nChance)
end

function mp_do_leitai(nChance)
	CustomDataSave("mp_leitai", "dd", 0, nChance)
end

function mp_do_shanghui(nChance)
	CustomDataSave("mp_shanghui", "dd", 0, nChance)
end

function mp_give_award(nTaskIndex)
	local nLevel = GetLevel()
	local nMulti = 1
	if nLevel >= 80 then
		Msg2Player("B¹n ®· ®¹t cÊp 80, kh«ng thÓ nhËn thªm phÇn th­ëng cña NhiÖm vô S­ ®å.")
		return
	elseif nLevel >= 73 then
		nMulti = 0.5
		Msg2Player("§¼ng cÊp ®· ®¹t cÊp 73, hoµn thµnh nhiÖm vô s­ m«n chØ nhËn ®­îc mét nöa phÇn th­ëng.")
	end
	
	if nTaskIndex == 1 then				-- Í½µÜ½±Àø£ºÊ¦ÃÅ¹±Ï×¶È
		if GetPlayerRoute() == 0 then
			local n = floor(50 * nMulti)
			ModifyReputation(n, 0)
			Msg2Player("B¹n nhËn ®­îc phÇn th­ëng NhiÖm vô S­ ®å:"..n.." ®iÓm danh väng")
		else
			local n = floor(15 * nMulti)
			SetTask(336, GetTask(336) + n)
			Msg2Player("B¹n nhËn ®­îc phÇn th­ëng NhiÖm vô S­ ®å:"..n.." ®iÓm cèng hiÕn S­ M«n ")
		end
	elseif nTaskIndex == 2 then			-- Í½µÜ½±Àø£ºÉùÍû
		local n = floor(50 * nMulti)
		ModifyReputation(n, 0)
		Msg2Player("B¹n nhËn ®­îc phÇn th­ëng NhiÖm vô S­ ®å:"..n.." ®iÓm danh väng")
	elseif nTaskIndex == 3 then			-- Í½µÜ½±Àø£º¾ü¹¦
		if GetPlayerRoute() == 0 then
			local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
			ModifyExp(nAddExp)
			Msg2Player("B¹n nhËn ®­îc phÇn th­ëng NhiÖm vô S­ ®å:"..nAddExp.." ®iÓm kinh nghiÖm")
		else
			SetRankPoint(5, 701, 1)	-- Ë¥¼õ²Ù×÷ÔÚSetRankPointµÄÊ±ºò²Å½øÐÐ,ËùÒÔÒªÏÈË¥¼õ,ÔÙ¿Û
			CalcBattleRank()
			local n = GetTask(701)
			local nn = floor(150 * nMulti)
			if n >= 0 then
				SetTask(701, n + nn)
			else
				SetTask(701, n - nn)
			end
			Msg2Player("B¹n nhËn ®­îc phÇn th­ëng NhiÖm vô S­ ®å:"..nn.." ®iÓm c«ng tr¹ng")
		end
	elseif nTaskIndex == 4 then			-- Í½µÜ½±Àø£º¾­Ñé
		local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B¹n nhËn ®­îc phÇn th­ëng NhiÖm vô S­ ®å:"..nAddExp.." ®iÓm kinh nghiÖm")
	elseif nTaskIndex == 5 then			-- Í½µÜ½±Àø£º¾­Ñé
		local nAddExp = floor(nLevel * nLevel * 120 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B¹n nhËn ®­îc phÇn th­ëng NhiÖm vô S­ ®å:"..nAddExp.." ®iÓm kinh nghiÖm")
--	elseif nTaskIndex == 5 then			-- Í½µÜ½±Àø£º½¡¿µ¾­Ñé×ª¾­Ñé
--		local nGolden = GetGoldenExp()
--		local nAddExp = nLevel * nLevel * 200
--		if nAddExp > nGolden then
--			nAddExp = nGolden
--		end
--		ModifyGoldenExp(-nAddExp)
--		ModifyExp(nAddExp)
--		Msg2Player("Äú»ñµÃÁËÊ¦Í½ÈÎÎñ½±Àø£º°Ñ"..nAddExp.."µã½¡¿µ¾­Ñé×ªÎªÁË¾­Ñé")
	elseif nTaskIndex == 6 then			-- Í½µÜ½±Àø£º¾­Ñé
		local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B¹n nhËn ®­îc phÇn th­ëng NhiÖm vô S­ ®å:"..nAddExp.." ®iÓm kinh nghiÖm")
	elseif nTaskIndex == 7 then			-- Í½µÜ½±Àø£º¾­Ñé
		local nAddExp = floor(nLevel * nLevel * 100 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B¹n nhËn ®­îc phÇn th­ëng NhiÖm vô S­ ®å:"..nAddExp.." ®iÓm kinh nghiÖm")
	end
	SaveNow()
end

function _complete_task(nRet)
	for index, value in tTaskCustomSave do
		CustomDataRemove(value)
	end
	
	if nRet ~= 0 then
		Msg2Player("B¹n kh«ng hoµn thµnh NhiÖm vô S­ ®å theo thêi gian quy ®Þnh")
		return
	end
	
	local nParam = GetTask(TASK_CONTENT)
	local nTaskIndex = mod(nParam, 256)
	mp_give_award(nTaskIndex)
	SetTask(TASK_CONTENT, 0)
	SaveNow()
end