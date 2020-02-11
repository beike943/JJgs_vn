--File name:	pearl.lua
--Describe:		’‰÷ÈΩ≈±æ
--Item ID:		2,1,30067
--Create Date:	2009-02-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

TYPE_NULL 	= 0;	--√ª”–Ω±¿¯
TYPE_ITEM 	= 1;	--∆’Õ®ŒÔ∆∑
TYPE_EQUIP 	= 2;	--¥¯ Ù–‘◊∞±∏¿‡ŒÔ∆∑
TYPE_CMD 	= 3;	--√¸¡Ó

--=========================================================================================
g_szLogTitle = "Event th∏ng 3"			--¥À¥¶∑÷Œ™2∂Œ÷ª «Œ™¡À≤ª‘ˆº”–¬µƒ∑≠“Î
g_nVietUseBoxEnd = 2009041300					-- π”√Ωÿ÷π»’∆⁄
g_nExpNum = 500000								-- π”√“ª∏ˆ’‰÷ÈªÒµ√µƒæ≠—È÷µ

g_szFileName = "pearl.lua"						--Œƒº˛√˚

--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
		Msg2Player("VÀt ph»m nµy Æ∑ qu∏ hπn, kh´ng th” sˆ dÙng th™m n˜a.")
		return
	end

	local nExp = g_nExpNum
	local nExpTotal = GetTask(PEARL_TOTALEXP_09_MARCH_VIET)
	if nExpTotal >= PEARL_EXP_LIMIT_09_MARCH_VIET then
		Msg2Player("C∏c hπ Æ∑ thu Æ≠Óc kinh nghi÷m cao nh t tı vÀt ph»m Ng‰c Trai "..PEARL_EXP_LIMIT_09_MARCH_VIET.." , C∏c hπ hi÷n nay kh´ng th” thu Æ≠Óc ph«n th≠Îng kinh nghi÷m.");
		nExp = 0;
		return
	elseif nExpTotal + g_nExpNum > PEARL_EXP_LIMIT_09_MARCH_VIET then
		nExp = PEARL_EXP_LIMIT_09_MARCH_VIET - nExpTotal;
	end

	if nExp ~= 0 and nExp ~= nil then
		if DelItemByIndex(nItemIdx,1) == 1 then
			ModifyExp(nExp);
			SetTask( PEARL_TOTALEXP_09_MARCH_VIET, (nExpTotal+nExp) )
			Msg2Player("Bπn nhÀn Æ≠Óc  "..nExp.."  Æi”m kinh nghi÷m");

			local szItemName = "Æi”m kinh nghi÷m"
			local nItemNum = nExp
			local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
			WriteLogEx(g_szLogTitle, "Ng‰c Trai", nItemNum, szItemName, szInfoDescribe, GetTongName() )
		end
	end
end

