Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\online\\tong_feast\\npc\\tf_npc_exchg_meat.lua")

function main()
	if tf_IsOpen() ~= 1 then
		main_not_open();
	else
		main_open();
	end
end

function main_not_open()
	local tSay = {
		"YÕn tiÖc bang héi lµ g×/what_tong_feast",
		"Ta cã thÓ thu thËp ®å ¨n ë ®©u/where_collect",
		"Ta muèn ®æi thøc ¨n/npc_talk_exchg_meat",
		"Chän ®Çu bÕp bang héi nh­ thÕ nµo/how_select",
		"Ta cã thÓ nhËn ®­îc nh÷ng phÇn th­ëng nµo/what_award",
		"Ta chØ tiÖn ®­êng ghĞ ngang/nothing",
	}
	Say("Ta cã thÓ nãi cho ng­¬i biÕt th«ng tin vÒ YÕn TiÖc Bao Héi, ®¹i hiÖp muèn biÕt c¸i g× nµo?", getn(tSay), tSay);
end

function what_tong_feast()
	local tSay = {};
	tSay.msg = "YÕn TiÖc Bang Héi lµ mét ho¹t ®éng lín, c¸c anh em trong bang héi cã thÓ tô häp l¹i víi nhau sau nhiÒu ngµy b«n tÈu giang hå viÔn xø cïng nhau chia sÏ b÷a c¬m ®oµn tô, chóc r­îu vµ trß chuyÖn víi nhau. B×nh th­êng th× c¸c anh em trong bang héi ®i thu thËp c¸c lo¹i thøc ¨n, trong thêi gian bang chñ dù kiÕn ®Õn NPC ®Ó d©ng tÆng nguyªn liÖu, khi tæng sè ®¹t ®Õn møc ®é nhÊt ®Şnh th× cã thÓ thµnh c«ng më ra mét ®¹i tiÖc thŞnh so¹n, sau ®ã c¸c anh em trong bang héi cã thÓ dù tiÖc vµ cïng nhau nhËn th­ëng.";
	tSay.msg = tSay.msg.."Vµo lóc 18:00, 19:00, 20:00 ngµy Thø B¶y vµ Chñ NhËt, ng­¬i cã thÓ ®Õn c¸c b¶n ®å xung quanh BiÖn Kinh, Thµnh §«, TuyÒn Ch©u ®Ó t×m §Çu bÕp, tiÕn hµnh chØ ®Şnh ®Çu bÕp, vµ d©ng tÆng nguyªn liÖu ®Ó lµm ®¹i tiÖc cña bang héi.";
	tSay.sel = {
		{"trë l¹i", "main_not_open"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end

function where_collect()
	local tSay = {};
	tSay.msg = "§å ¨n ®­îc chia ra thµnh 4 phÇn, ®å ¨n sÏ sinh ra ë nh÷ng n¬i kh¸c nhau. \n Tµng KiÕm S¬n Trang vµ V¹n KiÕm Tròng sinh ra Lîn C¾p N¸ch; \n L­¬ng S¬n B¹c vµ §Şa HuyÒn Cung sinh ra Bß KoBe; \n Th¸i H­ HuyÔn C¶nh vµ Th«ng Thiªn §Ønh r¬i ra Dª B¶y Në; \n tham gia ChiÕn Tr­êng Liªn Server vµ ChiÕn Tr­êng Tèng Liªu sÏ nhËn ®­îc ThŞt Nguéi. ";
	tSay.sel = {
		{"trë l¹i", "main_not_open"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end

function how_select()
	local tSay = {};
	tSay.msg = "Khi yÕn tiÖc bang héi b¾t ®Çu, ®èi tho¹i víi NPC, chän ta lµ ®Çu bÕp bang héi, ta sÏ biÕn thµnh ®Çu bÕp chuyªn nghiÖp ®Ó phôc vô cho quı bang.";
	tSay.msg = tSay.msg.."Sau khi yÕn tiÖc ®­îc më ra, néi trong 10min cã thÓ ®Æt ®Çu bÕp bang héi, sau khi ®Æt xong, néi trong 15min cã thÓ d©ng tÆng nguyªn liÖu ®å ¨n vµ ®å nÊu bÕp, 15min ®Õn 20min cã thÓ d©ng tÆng bµn ghÕ, sau khi tÊt c¶ ®· chuÈn bŞ xong, th× yÕn tiÖc bang héi sÏ ®­îc diÔn ra!";
	tSay.sel = {
		{"trë l¹i", "main_not_open"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end

function what_award()
	local tSay = {};
	tSay.msg = "Khi d©ng tÆng ®å ¨n vµ c¸c ®¹o cô, cã thÓ nhËn ®­îc kinh nghiÖm, ch©n khİ, ®iÓm luyÖn mËt tŞch. Trong qu¸ tr×nh dù tiÖc còng cã thÓ nhËn ®­îc kinh nghiÖm, ch©n khİ, ®iÓm luyÖn mËt tŞch, lÖnh bµi bang héi vµ c¸c phÇn th­ëng kh¸c, lÖnh bµi bang héi cã thÓ ®æi phÇn th­ëng t¹i Th­¬ng Nh©n Bang Héi. Vµ cã thÓ nhËn ®­îc hiÖu qu¶ t¨ng thªm, n©ng cao hiÖu qu¶ thuéc tİnh cña nh©n vËt.";
	tSay.sel = {
		{"trë l¹i", "main_not_open"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end

function main_open()
	local x, y = tf_GetNpcTablePos();
	DebugOutput("main_open() x,y =", x, y)
	if x == 0 and y == 0 then
		return 0;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 0);
	s:apply2(callout(main_open_cb, x, y));
end

function main_open_cb(x, y, nCount, sdb)
	DebugOutput("main_open_cb", x, y, nCount, sdb);
	if nCount <= 0 then
		order_chef(x, y);
		return 0;
	end
	nCount = min(nCount, TF_CHEF_NUM_MAX);
	local nTimestamp = tf_GetTimestamp();
	local szTongName = nil;
	for i = 1, nCount do
		local tData = sdb[i-1];
		if tData then
			DebugOutput(tData[1], tData[2], tData[3], tData[4], tData[5]);
			DebugOutput("tData[4],nTimestamp =",tData[4],nTimestamp)
			if tData[4] < nTimestamp then
				DebugOutput("ThiÕt ®Æt l¹i §Çu bÕp bang ")
				local s = SDB(TF_FEAST_CHEF, 0, 0);
				s:delete();
				DebugOutput("ThiÕt ®Æt l¹i sè bµn tiÖc");
				local s1 = SDB(TF_FEAST_CHEF, 0, 2);
				s1:delete(); 
				DebugOutput("ThiÕt ®Æt l¹i ®å ¨n"); 
				local s2 = SDB(TF_FEAST_CHEF, 0, 3);
				s2:delete();
				DebugOutput("ThiÕt ®Æt l¹i sè ng­êi ch¬i");
				local s3 = SDB(TF_FEAST_CHEF, 0, 4);
				s3:delete();
				return 0;
			end
			if tData[2] == x and tData[3] == y then
				szTongName = tData[1];
			end
		end
	end
	DebugOutput("szTongName =", szTongName);
	if szTongName then
		if GetTongName() == szTongName then
			main_do();
		else
			for i = 1, nCount do
				local tData = sdb[i-1];
				if tData then
					if tData[1] == GetTongName() then
						goto_my_chef(tData[2], tData[3]);
						return 1;
					end
				end
			end
			--Ã»ÓĞÕÒµ½
			Talk(1,"","Quı bang kh«ng cã ®Çu bÕp, nhanh ch©n th«ng b¸o cho ng­êi qu¶n lı bang héi ®Æt ®Çu bÕp ®i!")
		end
	else
		for i = 1, nCount do
			local tData = sdb[i-1];
			if tData then
				if tData[1] == GetTongName() then
					goto_my_chef(tData[2], tData[3]);
					return 1;
				end
			end
		end
		if nCount < TF_CHEF_NUM_MAX then
			order_chef(x, y);
		end
	end
end

function goto_my_chef(x, y)
	DebugOutput("goto_my_chef(x,y)", x, y)
	local tSay = {
		format("LËp tøc ®Õn ®ã/#NewWorld(%d,%d,%d)", TF_NPC_POS[x][y][1], TF_NPC_POS[x][y][2], TF_NPC_POS[x][y][3]),
		"Bµn l¹i sau/nothing",
	}
	Say(format("§Çu bÕp chuyªn nghiÖp cña bang héi kh«ng cã ë ®©y, ®Çu bÕp phôc vô cho quı bang t¹i <color=green> %s <color> ®ã th«i. §¹i hiÖp h·y nhanh ch©n ®Õn ®ã.",TF_NPC_POS[x][y][4]), getn(tSay), tSay);
end

function order_chef(x, y)
	DebugOutput("order_chef()", x, y);
	if tf_IsChefTime() ~= 1 then
		main_not_open();
		return 0;
	end
	local tSay = {
		format("§­îc råi, quyÕt ®Şnh lµ nhµ ng­¬i råi/#order_chef_deal(%d, %d)", x, y),
		"§Ó ta suy nghÜ l¹i/nothing",	
	}
	Say("Ng­¬i muèn chän ta lµ ®Çu bÕp chuyªn nghiÖp cña quı bang chø?", getn(tSay), tSay);
end

function order_chef_deal(x, y)
	if tf_IsTongManager() ~= 1 then
		Talk(1,"","ChØ cã thµnh viªn qu¶n lı bang héi míi cã thÓ ®Æt ®Çu bÕp!");
		return 0;
	end
	if tf_CheckCondition() ~= 1 then
		return 0;
	end
	if tf_IsChefTime() ~= 1 then
		Talk(1,"","Thêi gian ®Æt ®Çu bÕp lµ vµo ®Çu mçi giê néi trong vßng 10min, hiÖn t¹i kh«ng ph¶i trong thêi gian ®Æt, dù ®Æt thÊt b¹i.")
		return 1;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 1);
	s:apply2(callout(order_chef_deal_cb, x, y))
end

function order_chef_deal_cb(x, y, nCount, sdb)
	if tf_IsChefTime() ~= 1 then
		Talk(1,"","Thêi gian ®Æt ®Çu bÕp lµ vµo ®Çu mçi giê néi trong vßng 10min, hiÖn t¹i kh«ng ph¶i trong thêi gian ®Æt, dù ®Æt thÊt b¹i.")
		return 1;
	end
	local sData = sdb[GetTongName()];
	if sData and sData[1] == 1 then
		Talk(1,"","Mét tuÇn mçi bang héi chØ ®­îc tham gia yÕn tiÖc 1 lÇn, tuÇn nµy bang héi cña ng­¬i ®· tham gia 1 lÇn råi, kh«ng thÓ tiÕp tôc tham gia thªm!");
		return 0;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 0);
	local szTong = GetTongName();
	DebugOutput("order_chef_deal_cb", szTong, x, y, tf_GetTimestamp(), 0);
	s[szTong] = {TF_SHAREDATA_STRING00, x, y, tf_GetTimestamp(), 0};
	Talk(1,"main_do","Ng­¬i ®· thµnh c«ng ®Æt ®Çu bÕp nµy lµm ®Çu bÕp chuyªn nghiÖp cña quı bang!")
	Msg2Tong("YÕn tiÖc bang héi b¾t ®Çu, nhanh chãng d©ng tÆng ®å ¨n!")
	local _s = SDB(TF_FEAST_CHEF, 0, 1);
	_s[szTong] = {TF_SHAREDATA_STRING01, 1};
	local nHour = tonumber(date("%H"));
	if nHour == 18 then
		AddRuntimeStat(7,31,0,1);
	elseif nHour == 19 then
		AddRuntimeStat(7,32,0,1);
	elseif nHour == 20 then
		AddRuntimeStat(7,33,0,1);
	end
end

function main_do()
	local tSay = {
		"Ta muèn xem nguyªn liÖu bang héi ®· d©ng tÆng/check_tong_material",
		"Ta muèn xem nguyªn liÖu b¶n th©n ®· d©ng tÆng/check_player_material",
		"T×m hiÓu tin tøc yÕn tiÖc bang héi/main_not_open",
		"Ta chØ tiÖn ®­êng ghĞ ngang/nothing",
	}
	if tf_IsHangInTime() ~= 0 then
		tinsert(tSay, 1, "Ta muèn d©ng tÆng nguyªn liÖu/hang_in_material");
	end
	if tf_IsStartTime() ~= 0 then
		tinsert(tSay, 1, "Lµm tiÖc thŞnh so¹n/make_dinner");
	end	
	Say("Thêi kh¾c ®· ®Õn, nÕu nhËn ®­îc ®Çy ®ñ nguyªn liÖu, ta cã thÓ lµm cho quı bang mét b÷a tiÖc thŞnh so¹n nhÊt trong thiªn h¹.", getn(tSay), tSay);
end

function check_tong_material()
	local x, y = tf_GetNpcTablePos();
	if x == 0 and y == 0 then
		return 0;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s:apply2(check_tong_material_cb);
end

function check_tong_material_cb(nCount, sdb)
	if nCount <= 0 then
		Talk(1,"","HiÖn t¹i kh«ng cã ghi nhËn d©ng tÆng nµo");
		return 0;
	end
	local sData = sdb[GetTongName()];
	local tSay = {
		"trë l¹i/main_do",
		"Ta chØ tiÖn ®­êng ghĞ ngang/nothing",	
	}
	if sData then
		local szTemp = "";
		if sData[7] and sData[7] > 0 then
			szTemp = "<color=green> ®· <color>";
		else
			szTemp = "<color=red> vÉn ch­a <color>";
		end
		local nRet1, nRet2 = tf_GetTableNum(sData[1], sData[2], sData[3], sData[4]);
		local msg =format("HiÖn t¹i c¸c h¹ ®· d©ng tÆng %d Lîn C¾p N¸ch, %d Bß KoBe, %d Dª B¶y Në, %d ThŞt Nguéi, quı bang ®· sö dông %s Bé NÊu BÕp, c¨n cø vµo sè l­îng nguyªn liÖu ®å ¨n d©ng tÆng, cã thÓ lµm ®­îc %d bµn tiÖc, quı bang cßn ph¶i d©ng tÆng thªm Bµn TiÖc víi sè l­îng lµ %d.", 
			sData[1], sData[2], sData[3], sData[4], szTemp, nRet1, nRet2);
		local nNeedHandCount = nRet2 - sData[6];
		if nNeedHandCount > 0 then
			msg = msg..format("(<color=red> cÇn ph¶i d©ng tÆng Bµn TiÖc víi sè l­îng lµ %d c¸i <color>)", nNeedHandCount);
		else
			msg = msg.."(<color=green> sè l­îng d©ng tÆng Bµn TiÖc t¹m thêi ®· ®ñ <color>)";
		end
		Say(msg, getn(tSay), tSay);
	else
		Say("HiÖn t¹i quı bang kh«ng cã bÊt cø ghi nhËn nµo", getn(tSay), tSay);
	end
end

function check_player_material()
	local nPig = tf_GetPig();
	local nCow = tf_GetCow();
	local nSheep = tf_GetSheep();
	local nBacon = tf_GetBacon();
	local nTotal = nPig + nCow + nSheep + nBacon;
	local nCooker = tf_GetCooker();
	local nTc = tf_GetTc();
	local nWine = tf_GetWine();
	local nTableware = tf_GetIsUseTw();
	local tSay = {
		"trë l¹i/main_do",
		"Ta chØ tiÖn ®­êng ghĞ ngang/nothing",	
	}
	Say(format("Tæng sè thøc ¨n ®¹i hiÖp ®· d©ng tÆng lµ %d<color=red> (giíi h¹n lµ %d)<color>, ®· d©ng tÆng Lîn C¾p N¸ch %d, Bß KoBe %d, Dª B¶y Në %d, ThŞt Nguéi %d, d©ng tÆng Bé NÊu BÕp lµ %d, d©ng tÆng Bµn TiÖc lµ %d, sè lÇn kİnh töu lµ %d lÇn, sö dông Bé §å ¡n lµ %d lÇn.",
		nTotal, TF_HANG_IN_FOOD_MAX, nPig, nCow, nSheep, nBacon, nCooker, nTc, nWine, nTableware), getn(tSay), tSay);
end

function hang_in_material()
	local nKind = tf_IsHangInTime();
	if nKind ==  0 then return 0; end
	local tSay = {};
	if nKind == 1 then
		tSay = {
			"Ta muèn d©ng tÆng ®å ¨n/hang_in_material_food_say",
			"Ta muèn d©ng tÆng Bé NÊu BÕp/hang_in_material_cooker_say",
			"Ta muèn d©ng tÆng Bµn TiÖc/hang_in_material_tc_say",
			"trë l¹i/main_do",
			"Ta chØ tiÖn ®­êng ghĞ ngang/nothing",	
		}
	elseif nKind == 2 then
		tSay = {
			"Ta muèn d©ng tÆng Bµn TiÖc/hang_in_material_tc_say",
			"trë l¹i/main_do",
			"Ta chØ tiÖn ®­êng ghĞ ngang/nothing",	
		}
	end
	local szMsg = "\n giai ®o¹n nµy lµ <color=green>%s<color>, kho¶ng c¸ch giai ®o¹n nµy kÕt thóc v©n cßn <color=green>%d phót %d gi©y <color>, giai ®o¹n kÕ tiÕp lµ <color=red>%s<color>";
	local tTemp = {
		{"D©ng tÆng thøc ¨n vµ Bé Nêu BÕp", "D©ng tÆng Bµn TiÖc"},
		{"D©ng tÆng Bµn TiÖc", "Lµm tiÖc thŞnh so¹n"},
	}
	local nMinute = tonumber(date("%M"));
	local nSecond = tonumber(date("%S"));
	local tTime = {16,21};
	szMsg = format(szMsg, tTemp[nKind][1], tTime[nKind] - nMinute - 1, 60 - nSecond, tTemp[nKind][2]);
	Say("H·y chän d©ng tÆng vËt phÈm:"..szMsg, getn(tSay), tSay);
end

function hang_in_material_food_say()
	local tSay = {
		"D©ng tÆng Lîn C¾p N¸ch/hang_in_material_food_1",
		"D©ng tÆng Bß KoBe/hang_in_material_food_2",
		"D©ng tÆng Dª B¶y Në/hang_in_material_food_3",	
		"D©ng tÆng ThŞt Nguéi/hang_in_material_food_4",
		"\n Ph¶n håi/hang_in_material",
		"Ra khái/nothing",
	}
	Say("Xin hái ®¹i hiÖp ng­¬i muèn d©ng tÆng lo¹i thøc ¨n nµo?", getn(tSay), tSay);
end

function hang_in_material_food_1()
	local nCount = GetItemCount(TF_ITEM_PIG[1], TF_ITEM_PIG[2], TF_ITEM_PIG[3]);
	local nMax = max(TF_HANG_IN_FOOD_MAX - (tf_GetPig() + tf_GetCow() + tf_GetSheep() + tf_GetBacon()), 0);
	AskClientForNumber("hang_in_material_food_1_cb", 0, min(nCount, nMax), "H·y nhËp sè l­îng d©ng tÆng:", "");
end

function hang_in_material_food_2()
	local nCount = GetItemCount(TF_ITEM_COW[1], TF_ITEM_COW[2], TF_ITEM_COW[3]);
	local nMax = max(TF_HANG_IN_FOOD_MAX - (tf_GetPig() + tf_GetCow() + tf_GetSheep() + tf_GetBacon()), 0);
	AskClientForNumber("hang_in_material_food_2_cb", 0, min(nCount, nMax), "H·y nhËp sè l­îng d©ng tÆng:", "");
end

function hang_in_material_food_3()
	local nCount = GetItemCount(TF_ITEM_SHEEP[1], TF_ITEM_SHEEP[2], TF_ITEM_SHEEP[3]);
	local nMax = max(TF_HANG_IN_FOOD_MAX - (tf_GetPig() + tf_GetCow() + tf_GetSheep() + tf_GetBacon()), 0);
	AskClientForNumber("hang_in_material_food_3_cb", 0, min(nCount, nMax), "H·y nhËp sè l­îng d©ng tÆng:", "");
end

function hang_in_material_food_4()
	local nCount = GetItemCount(TF_ITEM_BACON[1], TF_ITEM_BACON[2], TF_ITEM_BACON[3]);
	local nMax = max(TF_HANG_IN_FOOD_MAX - (tf_GetPig() + tf_GetCow() + tf_GetSheep() + tf_GetBacon()), 0);
	AskClientForNumber("hang_in_material_food_4_cb", 0, min(nCount, nMax), "H·y nhËp sè l­îng d©ng tÆng:", "");
end

function hang_in_material_food_1_cb(nNum)
	if nNum > 0 then
		hang_in_material_food(1, nNum);
	end
end

function hang_in_material_food_2_cb(nNum)
	if nNum > 0 then
		hang_in_material_food(2, nNum);
	end
end

function hang_in_material_food_3_cb(nNum)
	if nNum > 0 then
		hang_in_material_food(3, nNum);
	end
end

function hang_in_material_food_4_cb(nNum)
	if nNum > 0 then
		hang_in_material_food(4, nNum);
	end
end

function hang_in_material_food(nKind, nNum)
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s:apply2(callout(hang_in_material_food_cb, tonumber(nKind), tonumber(nNum)));
end

function hang_in_material_food_cb(nKind, nNum, nCount, sdb)
	local sData = sdb[GetTongName()];
	if not sData[1] or nCount <= 0 then
		sData = {0,0,0,0,0,0,0,0}; --Ã»ÓĞÈÎºÎ¼ÇÂ¼£¬ÖÃÁã
	end
	local tFood = {
		[1] = TF_ITEM_PIG,
		[2] = TF_ITEM_COW,
		[3] = TF_ITEM_SHEEP,
		[4] = TF_ITEM_BACON,
	}
	if DelItem(tFood[nKind][1], tFood[nKind][2], tFood[nKind][3], nNum) ~= 1 then
		Talk(1, "", format("Kh«ng ®ñ %s",tFood[nKind][4]));
		return 0;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	DebugOutput("s[GetTongName()] =", sData[1], sData[2], sData[3], sData[4], sData[5], sData[6], sData[7], sData[8])
	sData[nKind] = sData[nKind] + nNum;
	s[GetTongName()] = {TF_SHAREDATA_STRING03, sData[1], sData[2], sData[3], sData[4], sData[5], sData[6], sData[7], sData[8]}; 
	if nKind == 1 then
		tf_SetPig(tf_GetPig() + nNum);
		AddRuntimeStat(7,25,0,nNum);
	elseif nKind == 2 then
		tf_SetCow(tf_GetCow() + nNum);
		AddRuntimeStat(7,26,0,nNum);
	elseif nKind == 3 then
		tf_SetSheep(tf_GetSheep() + nNum);
		AddRuntimeStat(7,27,0,nNum);
	elseif nKind == 4 then
		tf_SetBacon(tf_GetBacon() + nNum);
		AddRuntimeStat(7,28,0,nNum);
	end	
	Talk(1,"",format("Ng­¬i ®· d©ng tÆng %s*%d!", tFood[nKind][4], nNum));
	--½±Àø
	tf_Award_ShiCai(nNum);
end

function hang_in_material_cooker_say()
	Say("Ng­¬i x¸c ®Şnh muèn d©ng tÆng 1 Bé NÊu BÕp chø?", 3, "§ång ı/hang_in_material_cooker", "\n Ph¶n håi/hang_in_material", "Ra khái/nothing");
end

function hang_in_material_cooker()
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s:apply2(hang_in_material_cooker_cb);
end

function hang_in_material_cooker_cb(nCount, sdb)
	local sData = sdb[GetTongName()];
	if not sData[1] or nCount <= 0 then
		Talk(1,"","T¹m thêi kh«ng cÇn d©ng tÆng Bé NÊu BÕp")
		return 0;
	end
	if sData[7] > 0 then
		Talk(1, "", "Bé NÊu BÕp mét lÇn n­íng thŞt chØ cã thÓ d©ng tÆng mét lÇn, quı bang ®· d©ng tÆng, kh«ng cÇn ph¶i tÆng thªm.");
		return 1;
	end
	if DelItem(TF_ITEM_COOKER[1], TF_ITEM_COOKER[2], TF_ITEM_COOKER[3], 1) ~= 1 then
		Talk(1,"","Trong hµnh trang kh«ng cã Bé NÊu BÕp, kh«ng thÓ d©ng tÆng!")
		return 0;
	end		
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s[GetTongName()] = {TF_SHAREDATA_STRING03, sData[1], sData[2], sData[3], 
		sData[4], sData[5], sData[6], 1, sData[8]};
	tf_SetCooker(1);
	Talk(1,"","Ng­¬i ®· thµnh c«ng d©ng tÆng Bé NÊu BÕp, nh­ vËy sÏ n©ng cao tØ lÖ cña YÕn TiÖc Linh §×nh vµ YÕn TiÖc Hµo Hoa!");
	Msg2Tong(format("§Ó th­ëng thøc b÷a tiÖc ngon h¬n, %s ®· d©ng tÆng %s !",GetName(),"Bé NÊu BÕp"))
	--½±Àø
	tf_Award_JingZhiCooker();
	--Í³¼Æ
	AddRuntimeStat(7,30,0,1)
end

function hang_in_material_tc_say()
	Say("Ng­¬i x¸c ®Şnh muèn d©ng tÆng 1 Bµn TiÖc chø?", 3, "§ång ı/hang_in_material_tc", "\n Ph¶n håi/hang_in_material", "Ra khái/nothing");
end

function hang_in_material_tc()
	local nKind = tf_IsHangInTime();
	if nKind ~= 2 then
		Talk(1,"","T¹m thêi vÉn ch­a thÓ d©ng tÆng Bµn TiÖc");
		return 0;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s:apply2(hang_in_material_tc_cb);
end

function hang_in_material_tc_cb(nCount, sdb)
	local sData = sdb[GetTongName()];
	if not sData[1] or nCount <= 0 then
		Talk(1,"","Do sè l­îng d©ng tÆng ®å ¨n kh«ng ®ñ, kh«ng cÇn ph¶i d©ng tÆng bÊt cø Bµn TiÖc nµo hÕt!")
		return 0;
	end
	DebugOutput("hang_in_material_cooker_cb", sData[1], sData[2], sData[3], sData[4], sData[5], sData[6], sData[7], sData[8]);
	local nTcTotal, nTcNeed = tf_GetTableNum(sData[1], sData[2], sData[3], sData[4]);
	if nTcNeed > sData[6] then
		local s = SDB(TF_FEAST_CHEF, 0, 3);
		if DelItem(TF_ITEM_TC[1], TF_ITEM_TC[2], TF_ITEM_TC[3], 1) ~= 1 then
			Talk(1,"","Trong hµnh trang kh«ng cã Bµn TiÖc, kh«ng thÓ d©ng tÆng!")
			return 0;
		end
		s[GetTongName()] = {TF_SHAREDATA_STRING03, sData[1], sData[2], sData[3], sData[4], sData[5], sData[6] + 1, sData[7], sData[8]};
		tf_SetTc(tf_GetTc() + 1);
		Talk(1,"","Ng­¬i ®· thµnh c«ng d©ng tÆng mét Bµn TiÖc!")
		Msg2Tong(format("§Ó th­ëng thøc b÷a tiÖc ngon h¬n, %s ®· d©ng tÆng %s !",GetName(),"Bµn TiÖc"));
		--½±Àø
		tf_Award_JingzhiTableChair();
		--Í³¼Æ
		AddRuntimeStat(7,29,0,1);
	else
		Talk(1,"","Sè l­îng Bµn TiÖc quı bang d©ng tÆng ®· ®¹t ®Õn giíi h¹n cho phĞp, kh«ng thÓ d©ng tÆng thªm.")
	end
end

function make_dinner()
	local s = SDB(TF_FEAST_CHEF, 0, 0);
	s:apply2(make_dinner_cb);
end

function make_dinner_cb(nCount, sdb)
	if nCount <= 0 then
		print("UDERROR: make_dinner nCount error!");
		return 0;
	end
	local sData = sdb[GetTongName()];
	if not sData[1] then
		print("UDERROR: make_dinner sData error!");
		return 0;
	end
	local x, y = tf_GetNpcTablePos();
	if sData[1] ~= x and sData[2] ~= y then
		print("UDERROR: make_dinner x, y error")
		return 0;
	end
	if sData[4] == 2 then
		Talk(1,"","Do sè l­îng d©ng tÆng ®å ¨n kh«ng ®ñ, më yÕn tiÖc bang héi thÊt b¹i!");
		return 0;
	end
	if sData[4] == 1 then
		Talk(1,"","YÕn tiÖc bang héi ®· më, mêi c¸c ch­ vŞ ®¹i hiÖp cïng th­ëng thøc!");
		return 1;
	end
	if sData[4] == 0 then
		tf_OpenBanquet_Pre(x, y);
		return 1;
	end
	print("UDERROR: make_dinner sData[4] error!");
end

