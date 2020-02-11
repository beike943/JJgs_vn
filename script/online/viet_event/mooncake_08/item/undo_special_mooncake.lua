--File name:	undo_common_mooncake.lua
--Describe:		Œ¥ ÏµƒÃÿ±‘¬±˝Ω≈±æ
--Item ID:		2,1,30028
--Create Date:	2008-08-20
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")

--=========================================================================================
g_szLogTitle = "Hoπt ÆÈng trung thu : ".."B∏nh ch≠a ch›n loπi Æ∆c bi÷t"		--¥À¥¶∑÷Œ™2∂Œ÷ª «Œ™¡À≤ª‘ˆº”–¬µƒ∑≠“Î
g_nVietUseMoonCakeEnd = 2008101300					--‘¬±˝µƒ π”√Ωÿ÷π»’∆⁄
g_nExpNum = 25000									-- π”√“ª∏ˆ‘¬±˝ªÒµ√µƒæ≠—È÷µ

--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseMoonCakeEnd then
		return
	end
	if GetLevel() < 20 then
		Talk(1,"","Chÿ c„ ng≠Íi ch¨i Æπt Æºng c p tı 20 trÎ l™n mÌi c„ th” sˆ dÙng vÀt ph»m nµy.")
		return
	end
	if GetTask(TOTALEXP_08_MOONCAKE_VIET) >= g_nExpTotal_MoonCakeViet then
		Msg2Player("Bπn Æ∑ Æπt giÌi hπn Æi”m kinh nghi÷m c„ th” nhÀn Æ≠Óc trong hoπt ÆÈng Trung thu l«n nµy. "..g_nExpTotal_MoonCakeViet.." , Kh´ng th” ti’p tÙc sˆ dÙng vÀt ph»m nµy.");
		Talk(1,"","Bπn Æ∑ Æπt giÌi hπn Æi”m kinh nghi÷m c„ th” nhÀn Æ≠Óc trong hoπt ÆÈng Trung thu l«n nµy. "..g_nExpTotal_MoonCakeViet.." , Kh´ng th” ti’p tÙc sˆ dÙng vÀt ph»m nµy.");
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		use_it()
	end
end

function use_it()
	--æ≠—ÈΩ±¿¯≤ø∑÷
	local nExp = g_nExpNum
	local nExpTotal = GetTask(TOTALEXP_08_MOONCAKE_VIET)
	if nExpTotal + g_nExpNum > g_nExpTotal_MoonCakeViet then
		nExp = g_nExpTotal_MoonCakeViet - nExpTotal
	elseif nExpTotal >= g_nExpTotal_MoonCakeViet then
		nExp = 0
	end
	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( TOTALEXP_08_MOONCAKE_VIET, (nExpTotal+nExp) )
		Msg2Player("Bπn nhÀn Æ≠Óc  "..nExp.."  Æi”m kinh nghi÷m");
		WriteLogEx(szLogTrungThuName,"nhÀn",nExp,"Æi”m kinh nghi÷m")		
	end
	--∏Ωº”–ßπ˚≤ø∑÷
	local nRandom = random(1,100)
	if nRandom <= 25 then
		CastState("state_vertigo", 1, 18*3)
	elseif nRandom <= 75 then
		CastState("state_confusion", 1, 18*3)
	else
		CastState("state_sleep", 1, 18*3)
	end
end



function nothing()

end
