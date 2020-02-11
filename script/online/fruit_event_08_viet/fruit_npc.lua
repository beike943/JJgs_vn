--File name:	fruit_npc.lua
--Describe:		Ë®¹ûÑç»á»î¶¯npc½Å±¾
--Create Date:	2008-06-23
--Author:		chenbenqian

Include("\\script\\online\\fruit_event_08_viet\\fruit_event_head.lua");
Include("\\script\\lib\\globalfunctions.lua")

g_LogTitle = "LÔ héi tr¸i c©y : ".."§æi";		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë

function main()
	if is_fruit_event_viet_open() == 0 then
		return
	end
	local selTab = {
				"T×m hiÓu c¸ch thøc ®æi tr¸i c©y./fruit_event",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say("<color=green>Th­¬ng nh©n tr¸i c©y<color>: ".."Tõ 04-07-2008 ®Õn 24:00 27-07-2008, ".."Trong thêi gian LÔ héi tr¸i c©y, ng­êi ch¬i cã thÓ th«ng qua tham gia NhiÖm vô s­ m«n, Tµng kiÕm s¬n trang vµ trång c©y B¸t nh· ®Ó thu thËp Tói tr¸i c©y. Sau khi më Tói tr¸i c©y sÏ nhËn ®­îc 1 trong 5 lo¹i tr¸i c©y, nh­: Nho, M·ng cÇu, M¨ng côt, Vó s÷a, SÇu riªng. Sau khi sö dông tr¸i c©y sÏ nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm vµ vËt phÈm quý b¸u.",getn(selTab),selTab);
end

function fruit_event()
		local selTab = {
					"§æi tr¸i c©y theo h×nh thøc 1/#exchange_fruit(1)",
					"§æi tr¸i c©y theo h×nh thøc 2/#exchange_fruit(2)",
					"§æi tr¸i c©y theo h×nh thøc 3/#exchange_fruit(3)",
					"§æi tr¸i c©y theo h×nh thøc 4/#exchange_fruit(4)",
					"KÕt thóc ®èi tho¹i/no",
					}
		Say("<color=green>Th­¬ng nh©n tr¸i c©y<color>: Cã 4 c¸ch ®æi:\n<color=yellow>C¸ch thøc 1<color>: 3 Nho = 1 M·ng cÇu.\n<color=yellow>C¸ch thøc 2<color>: 3 M·ng cÇu + 1 Nho = 1 M¨ng côt.\n<color=yellow>C¸ch thøc 3<color>: 3 M¨ng côt + 1 M·ng cÇu + 1 Nho + 10 B¹c = 1 Vó s÷a.\n<color=yellow>C¸ch thøc 4<color>: 3 Vó s÷a + 1 M¨ng côt + 1 M·ng cÇu + 1 Nho + 80 B¹c = 1 SÇu riªng.",getn(selTab),selTab);
end

function exchange_fruit(nType)
	local nRetCode = 0;
	if nType == 1 then
		if GetItemCount(2,1,30009) < 3 then
			Say("<color=green>Th­¬ng nh©n tr¸i c©y<color>: Nguyªn liÖu mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Th­¬ng nh©n tr¸i c©y<color>: H·y ®¶m b¶o hµnh trang ®ñ chç trèng vµ träng l­îng ®Ó tr¸nh l·ng phÝ kh«ng cÇn thiÕt.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,3) == 1 then
				add_item_ex("M·ng cÇu",2,1,30010,1)
			else
				Say("<color=green>Th­¬ng nh©n tr¸i c©y<color>: Nguyªn liÖu mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
				return
			end
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30009) < 1 or GetItemCount(2,1,30010) < 3 then
			Say("<color=green>Th­¬ng nh©n tr¸i c©y<color>: Nguyªn liÖu mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Th­¬ng nh©n tr¸i c©y<color>: H·y ®¶m b¶o hµnh trang ®ñ chç trèng vµ träng l­îng ®Ó tr¸nh l·ng phÝ kh«ng cÇn thiÕt.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,1) == 1 and del_item_ex("M·ng cÇu",2,1,30010,3) then
				add_item_ex("M¨ng côt",2,1,30011,1)
			else
				Say("<color=green>Th­¬ng nh©n tr¸i c©y<color>: Nguyªn liÖu mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
				return
			end
		end
	elseif nType == 3 then
		if GetItemCount(2,1,30009) < 1 or GetItemCount(2,1,30010) < 1 or GetItemCount(2,1,30011) < 3 or GetCash() < 1000 then
			Say("<color=green>Th­¬ng nh©n tr¸i c©y<color>: Nguyªn liÖu mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Th­¬ng nh©n tr¸i c©y<color>: H·y ®¶m b¶o hµnh trang ®ñ chç trèng vµ träng l­îng ®Ó tr¸nh l·ng phÝ kh«ng cÇn thiÕt.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,1) == 1 and del_item_ex("M·ng cÇu",2,1,30010,1) and del_item_ex("M¨ng côt",2,1,30011,3) and pay_ex(1000) then
				add_item_ex("Vó s÷a",2,1,30012,1)
			else
				Say("<color=green>Th­¬ng nh©n tr¸i c©y<color>: Nguyªn liÖu mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
				return
			end
		end
	elseif nType == 4 then
		if GetItemCount(2,1,30009) < 1 or GetItemCount(2,1,30010) < 1 or GetItemCount(2,1,30011) < 1 or GetItemCount(2,1,30012) < 3 or GetCash() < 8000 then
			Say("<color=green>Th­¬ng nh©n tr¸i c©y<color>: Nguyªn liÖu mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"","<color=green>Th­¬ng nh©n tr¸i c©y<color>: H·y ®¶m b¶o hµnh trang ®ñ chç trèng vµ träng l­îng ®Ó tr¸nh l·ng phÝ kh«ng cÇn thiÕt.");
				return
			end;
			if del_item_ex("Nho",2,1,30009,1) == 1 and del_item_ex("M·ng cÇu",2,1,30010,1) and del_item_ex("M¨ng côt",2,1,30011,1) and del_item_ex("Vó s÷a",2,1,30012,3) and pay_ex(8000) then
				add_item_ex("SÇu riªng",2,1,30013,1)
			else
				Say("<color=green>Th­¬ng nh©n tr¸i c©y<color>: Nguyªn liÖu mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
				return
			end
		end
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function exchange_fruit(nType), parameter nType error, nType = "..nType);
	end
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function del_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = DelItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		return 1;
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] delete "..nItemNum.." "..szItemName.." Failed, DelItem("..genre..", "..detail..", "..particular..", "..nItemNum..") return value = "..nRetCode);
		return 0;
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Pay("..nNum..") Failed, return value = "..nRetCode);
		return 0
	end
end

function no()
end

