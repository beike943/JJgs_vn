Include("\\script\\online_activites\\201204\\changkuaishujia\\changkuaishujia.lua")
Include("\\script\\online_activites\\201205\\exchange_award.lua")
Include("\\script\\vng\\doinguyenlieu.lua")

function main()
	local tbSay = {};
	local nDate = tonumber(date("%Y%m%d"))
	--²åÈëtable
	if gf_CheckEventDateEx(VET_CKSJ_ACITIVITY_ID) == 1 then
		for i=1,getn(Vet_CKSJ_Say_Tb) do
			tinsert(tbSay,Vet_CKSJ_Say_Tb[i]);
		end
	end
	--2012Äê6ÔÂ»î¶¯
	if gf_CheckEventDateEx(VET_ExcAw_ACITIVITY_ID) == 1 then
		for i=1,getn(Vet_ExcAw_Say_Tb) do
			tinsert(tbSay,Vet_ExcAw_Say_Tb[i]);
		end
	end

	tinsert(tbSay, "Thu ®æi Qu©n dông/Trade_Material_Menu3")

	tinsert(tbSay,"Kh«ng cÇn ®©u/cancel");
	Say("Tr¨ng thanh giã m¸t nh­ thÕ nµy…sao kh«ng cïng ta ®i t¶n bé chø?",
		getn(tbSay),tbSay)
		--"ÌıËµÄúÀÏÕâÀïÓĞÒ»Ğ©ÎäÁÖÊ§´«µÄ¶«Î÷£¿ÎÒÏëÂò¼¸¸ö¡£/Suiyinbuy",
		--"ÌıËµÄúÀÏÕâÀïÓĞÒ»Ğ©ÉÏºÃµÄÍâ×°ÒÂ·ş£¿ÎÒÏë¿´¿´¡£/ClothBuy",
		--"ÌıËµÄúÀÏÕâÀïÓĞÒ»Ğ©ÉÏºÃµÄÍâ×°·¢¹Ú£¿ÎÒÏë¿´¿´¡£/CapBuy",
		--"ÌıËµÄúÀÏÕâÀïÓĞÒ»Ğ©ÉÏºÃµÄÍâ×°¿ãÈ¹£¿ÎÒÏë¿´¿´¡£/ShoeBuy",
		--"ÌıËµÄúÀÏÕâÀïÓĞÒ»Ğ©Ò£Ô¶µÄÒì¹úÕ½ÅÛ£¿ÎÒÏë¿´¿´¡£/ShijieBuy",
		--"Àë¿ªÃ»ÊÂ¡£/cancel")
end

function cancel()
end

function Suiyinbuy()
   Sale(53)
end
function ClothBuy()
   Sale(56)
end
function CapBuy()
   Sale(57)
end
function ShoeBuy()
   Sale(58)
end
function ShijieBuy()
   Sale(87)
end