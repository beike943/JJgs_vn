--function main()
--	Talk(1,"","<color=green>Ó×Í¯<color>£ºÎÒ¶Ç×ÓºÃ¶ö¡­¡­")
--end;

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho¹t ®éng trung thu : ".."TiÓu ®ång"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓĞÂµÄ·­Òë
g_szInfoHead = "<color=green>§øa bĞ<color>: "

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	local selTab = {
				"Ta sÏ “l× x×” cho muéi, muéi ®æi cho ta 1 c©y NÕn Vµng nhĞ!/bug_candle",
				"Ta sÏ quay l¹i sau.!/no",
				}
	Say(g_szInfoHead.."Ho¹t ®éng \"Truy t×m lång ®Ìn may m¾n\" diÔn ra tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008. Lång §Ìn sÏ xuÊt hiÖn Tõ 11:00 ®Õn 14:00 vµ tõ 21:00 ®Õn 24:00 vµo c¸c ngµy Thø 6, Thø 7 vµ Chñ nhËt h»ng tuÇn. Trong thêi gian nµy, ng­êi ch¬i ®Õn NPC TiÓu §ång ®Ó nhËn “NÕn vµng”. ë tr¹ng th¸i chiÕn ®Êu, ng­êi ch¬i mang NÕn Vµng ®Õn c¸c b¶n ®å ®Ó th¾p s¸ng Lång §Ìn May M¾n, sÏ cã c¬ héi nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm vµ c¸c vËt phÈm cã gi¸ trŞ.",getn(selTab),selTab);
end

function bug_candle()
	if GetCash() < 1000 then
		Say(g_szInfoHead.."Muéi kh«ng ®æi ®©u v× s­ huynh (tû tû) ch­a l× x× cho muéi.",1,"¤i! Ta quªn mÊt./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end
	if pay_ex(1000) == 1 then
		add_item_ex("NÕn vµng",2,1,30029,1)
	else
		Say(g_szInfoHead.."Muéi kh«ng ®æi ®©u v× s­ huynh (tû tû) ch­a l× x× cho muéi.",1,"¤i! Ta quªn mÊt./no")
		return
	end
end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Pay("..nNum..") Failed, return value = "..nRetCode);
		return 0
	end
end

function no()
end

