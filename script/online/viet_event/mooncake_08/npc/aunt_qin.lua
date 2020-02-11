--File name:	shop_manager.lua
--Describe:		ÖĞÇï»î¶¯ÇØ´óÉônpcÎÄ¼ş
--Create Date:	2008-08-25
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho¹t ®éng trung thu : ".."TÇn ®¹i thÈm"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓĞÂµÄ·­Òë
g_szInfoHead = "<color=green>TÇn ®¹i thÈm<color>: "


function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	local selTab = {
				"Nhê §¹i ThÈm gióp t¹i h¹ lµm ra B¸nh trung thu ch­a n­íng lo¹i th­êng./#make_mooncake(1)",
				"Nhê §¹i ThÈm gióp t¹i h¹ lµm ra B¸nh trung thu ch­a n­íng lo¹i ®Æc biÖt./#make_mooncake(2)",
				"C¸ch lµm B¸nh trung thu/mooncake_guide",
				"T¹i h¹ muèn mua 1 bã cñi (1 bã cñi = 10 b¹c)/bug_wood",
				"Ta chØ ®Õn xem thö/no",
				}
	Say(g_szInfoHead.."Ho¹t ®éng lµm B¸nh Trung Thu diÔn ra tõ ngµy 05-09-2008 ®Õn 24:00 ngµy 05-10-2008. Trong thêi gian nµy, ng­êi ch¬i tham gia c¸c ho¹t ®éng trong trß ch¬i ®Ó thu thËp c¸c Tói Nguyªn LiÖu, bªn trong cã chøa c¸c nguyªn liÖu cÇn thiÕt ®Ó lµm B¸nh Trung Thu. Ngoµi ra, ng­êi ch¬i cã thÓ lµm ra nh÷ng chiÕc b¸nh trung thu ®Æc biÖt khi mua gãi Gia VŞ tõ Ngù C¸c. Sö dông c¸c lo¹i B¸nh Trung Thu sÏ ®­îc ®iÓm kinh nghiÖm vµ vËt phÈm cã gi¸ trŞ.",getn(selTab),selTab);
end

function bug_wood()
	if GetCash() < 1000 then
		Say(g_szInfoHead.."1 Bã Cñi = 10 B¹c, c¸c h¹ mang theo kh«ng ®ñ B¹c th× ph¶i!",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end
	if pay_ex(1000) == 1 then
		add_item_ex("Cñi",2,1,30022,1)
	else
		Say(g_szInfoHead.."1 Bã Cñi = 10 B¹c, c¸c h¹ mang theo kh«ng ®ñ B¹c th× ph¶i!",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no")
		return
	end
end

function mooncake_guide()
	Say(g_szInfoHead.."Nguyªn liÖu cÇn thiÕt:\n- 1 B¸nh trung thu ch­a n­íng lo¹i th­êng cÇn cã: 2 Bét M× + 1 §­êng C¸t + 1 Trøng Muèi + 1 Nguyªn LiÖu ThËp CÈm + 40B¹c\n- 1 B¸nh trung thu ch­a n­íng lo¹i ®Æc biÖt cÇn cã: 2 Bét M× + 1 §­êng C¸t + 1 Trøng Muèi + 1 Nguyªn LiÖu ThËp CÈm + 1 Gãi Gia VŞ\nNg­êi ch¬i mua mét İt Bã Cñi ®Ó n­íng b¸nh, mét lÇn cã thÓ n­íng 8 B¸nh. Tïy theo sè lÇn bá cñi thµnh c«ng trong qu¸ tr×nh n­íng b¸nh mµ ng­êi ch¬i sÏ nhËn ®­îc nh÷ng chiÕc B¸nh trung thu th¬m ngon.",1,"C¸m ¬n TÇn §¹i ThÈm ®· tËn t×nh h­íng dÉn!/no");
end

function make_mooncake(nType)
	if GetLevel() < 20 then
		Talk(1,"",g_szInfoHead.."Ng­êi ch¬i ph¶i cÊp 20 trë lªn míi cã thÓ tiÕn hµnh n­íng B¸nh trung thu");
		return
	end

	local nRetCode = 0;
	if nType == 1 then
		if GetItemCount(2,1,30017) < 2 or GetItemCount(2,1,30018) < 1 or GetItemCount(2,1,30019) < 1 or GetItemCount(2,1,30020) < 1 or GetCash() < 4000 then
			Say(g_szInfoHead.."Kh«ng ®ñ c¸c nguyªn liÖu cÇn thiÕt th× ta kh«ng thÓ lµm ra nh÷ng chiÕc B¸nh trung thu ch­a n­íng ®­îc. H·y cè g¾ng t×m thªm nguyªn liÖu nhĞ!",1,"V©ng! T¹i h¹ sÏ quay l¹i sau khi cã ®ñ nguyªn liÖu!!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
				return
			end;
			if del_item_ex("Bét m×",2,1,30017,2) == 1 and del_item_ex("§­êng c¸t",2,1,30018,1) == 1 and del_item_ex("Trøng muèi",2,1,30019,1) == 1 and del_item_ex("Nguyªn liÖu thËp cÈm",2,1,30020,1) == 1 and pay_ex(4000) == 1 then
				add_item_ex("B¸nh ch­a n­íng th­êng",2,1,30023,1)
			else
				Say(g_szInfoHead.."Kh«ng ®ñ c¸c nguyªn liÖu cÇn thiÕt th× ta kh«ng thÓ lµm ra nh÷ng chiÕc B¸nh trung thu ch­a n­íng ®­îc. H·y cè g¾ng t×m thªm nguyªn liÖu nhĞ!",1,"V©ng! T¹i h¹ sÏ quay l¹i sau khi cã ®ñ nguyªn liÖu!!/no");
				return
			end
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30017) < 2 or GetItemCount(2,1,30018) < 1 or GetItemCount(2,1,30019) < 1 or GetItemCount(2,1,30020) < 1 or GetItemCount(2,1,30021) < 1 then
			Say(g_szInfoHead.."Kh«ng ®ñ c¸c nguyªn liÖu cÇn thiÕt th× ta kh«ng thÓ lµm ra nh÷ng chiÕc B¸nh trung thu ch­a n­íng ®­îc. H·y cè g¾ng t×m thªm nguyªn liÖu nhĞ!",1,"V©ng! T¹i h¹ sÏ quay l¹i sau khi cã ®ñ nguyªn liÖu!!/no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
				return
			end;
			if del_item_ex("Bét m×",2,1,30017,2) == 1 and del_item_ex("§­êng c¸t",2,1,30018,1) == 1 and del_item_ex("Trøng muèi",2,1,30019,1) == 1 and del_item_ex("Nguyªn liÖu thËp cÈm",2,1,30020,1) == 1 and del_item_ex("Gãi gia vŞ",2,1,30021,1) == 1 then
				add_item_ex("B¸nh ch­a n­íng §B",2,1,30024,1)
			else
				Say(g_szInfoHead.."Kh«ng ®ñ c¸c nguyªn liÖu cÇn thiÕt th× ta kh«ng thÓ lµm ra nh÷ng chiÕc B¸nh trung thu ch­a n­íng ®­îc. H·y cè g¾ng t×m thªm nguyªn liÖu nhĞ!",1,"V©ng! T¹i h¹ sÏ quay l¹i sau khi cã ®ñ nguyªn liÖu!!/no");
				return
			end
		end
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function make_mooncake(nType), parameter nType error, nType = "..nType);
	end
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLogEx(szLogTrungThuName,"nhËn",nItemNum,szItemName)
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function del_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = DelItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		return 1;
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] delete "..nItemNum.." "..szItemName.." Failed, DelItem("..genre..", "..detail..", "..particular..", "..nItemNum..") return value = "..nRetCode);
		return 0;
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

