--ÁºÉ½boss»î¶¯´óÊ¹
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\online\\liangshanboss\\lsb_daliy_task.lua")

Activity_Npc_Name = "<color=green>§¹i Sø ho¹t ®éng: <color>";

Item_table1 = {2,1,30384,"L­¬ng S¬n MËt B¶o R­¬ng"};
Item_table2 = {2,1,30385,"Ch×a khãa vµng L­¬ng S¬n"};
Coin_cost = 50;
Item_cost = 100;


tbSay_201206 = {
		"\n Giíi thiÖu ho¹t ®éng/introduce_201206",
		"\n NhiÖm vô ngµy/daily_task_201206",
		"\n Dïng L­¬ng S¬n MËt B¶o R­¬ng ®æi ch×a khãa vµng L­¬ng S¬n/exchange_201206",
		};
		
sTitle_201206 = "Hoan nghªnh tham gia ho¹t ®éng chµo mõng Phiªn B¶n míi. PhÇn th­ëng lµ Thiªn Cang LÖnh, trang bŞ Hiªn Viªn, cßn c¸c phÇn th­ëng phong phó kh¸c ®ang chê b¹n, h·y mau tham gia"


function introduce_201206()
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"",Activity_Npc_Name.."Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
	"\n Ho¹t ®éng 1: Khiªu chiÕn Boss §¹i Hoµng Kim/Activity1_201206",
	"\n Ho¹t ®éng 2: TriÖu gäi L­¬ng S¬n hµo kiÖt/Activity2_201206",
	"\n Ho¹t ®éng 3: Më L­¬ng S¬n MËt B¶o R­¬ng/Activity3_201206",
	--"\n·µ»ØÉÏÒ»¼¶/main",
	"\n T¹i h¹ chØ xem qua th«i/nothing",
	};
	Say(Activity_Npc_Name.."Phiªn b¶n míi më, T©y B¾c liÒn dËy sãng, L­¬ng S¬n hµo kiÖt mang theo b¶o vËt kh¾p n¬i th¨m dß tin tøc. Ho¹t ®éng nµy chØ dµnh cho ng­êi ch¬i cÊp <color=red>80<color> trë lªn ®· gia nhËp hÖ ph¸i. ",getn(tbSay),tbSay);
end

function Activity1_201206()
	local tbSay = {
	"\n Quay vÒ cÊp ®é tr­íc /introduce_201206",
	"T¹i h¹ chØ xem qua th«i/nothing",
	};
	Say(Activity_Npc_Name.."Mçi ngµy 12:30, 15:30, 19:30, 22:30 sÏ xuÊt hiÖn Boss §¹i Hoµng Kim L­¬ng S¬n, ®¸nh b¹i sÏ nhËn ®­îc Thiªn Cang LÖnh, trang bŞ Hiªn Viªn. ",getn(tbSay),tbSay);
end

function Activity2_201206()
	local tbSay = {
	"\n Quay vÒ cÊp ®é tr­íc /introduce_201206",
	"T¹i h¹ chØ xem qua th«i/nothing",
	};
	Say(Activity_Npc_Name.."\n\t Mçi ngµy giÕt qu¸i ë xung quanh Ph­îng T­êng Phñ nhËn ®­îc L­¬ng S¬n tİn vËt, thu thËp ®ñ 9 c¸i cã thÓ triÖu gäi L­¬ng S¬n hµo kiÖt, mçi ngµy 5 lÇn. \n\t Còng cã thÓ mua Xuyªn V©n TiÔn ë Ngù C¸c ®Ó triÖu gäi L­¬ng S¬n hµo kiÖt--kh«ng h¹n chÕ sè lÇn mua.\n Dïng c¸ch thøc nµo còng cã thÓ triÖu gäi Hoµng Kim §¹i Boss, ng­êi gäi ra sÏ nhËn ®­îc Thiªn Cang LÖnh.",getn(tbSay),tbSay);
end

function Activity3_201206()
	local tbSay = {
	"\n Quay vÒ cÊp ®é tr­íc /introduce_201206",
	"T¹i h¹ chØ xem qua th«i/nothing",
	};
	Say(Activity_Npc_Name.."\n\t Tham gia ho¹t ®éng nhËn ®­îc L­¬ng S¬n MËt B¶o R­¬ng, dïng ch×a khãa vµng më B¶o R­¬ng ®Ó nhËn phÇn th­ëng. \n\t Më 1 B¶o R­¬ng nhËn ®­îc 1 m¶nh Thiªn Cang (dïng ®Ó ®æi Thiªn Cang LÖnh), phÇn th­ëng lín nhÊt lµ Thiªn Cang LÖnh, §¹i §Şnh Hån Thiªn Th¹ch ThÇn Th¹ch.\n\t Cã thÓ mua ch×a khãa vµng L­¬ng S¬n ë  Ngù C¸c, còng cã thÓ dïng L­¬ng S¬n MËt B¶o R­¬ng ®æi víi t¹i h¹. ",getn(tbSay),tbSay);
end

function daily_task_201206()
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"",Activity_Npc_Name.."Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
	"\n NhÆt §¹i B¶o R­¬ng cña Boss Hoµng Kim (%s)/task_1",
	"\n TriÖu gäi 5 lÇn L­¬ng S¬n hµo kiÖt (%s)/task_2",
	"\n Më 1 L­¬ng S¬n MËt B¶o R­¬ng (%s)/task_3",
	--"\n·µ»ØÉÏÒ»¼¶/main",
	"\n T¹i h¹ chØ xem qua th«i/nothing",
	};
	tbSay[1] = format(tbSay[1],return_status(89));
	tbSay[2] = format(tbSay[2],return_status(90));
	tbSay[3] = format(tbSay[3],return_status(91));
	Say(Activity_Npc_Name.."TiÕp nhËn nhiÖm vô ngµy ®Ó nhËn thªm phÇn th­ëng. ",getn(tbSay),tbSay);
end

function exchange_201206()
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"",Activity_Npc_Name.."Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
	"\n T¹i h¹ muèn ®æi/deal_exchange_201206",
	--"\n·µ»ØÉÏÒ»¼¶/main",
	"\n T¹i h¹ chØ xem qua th«i/nothing",
	};
	Say(Activity_Npc_Name.."\n\t Dïng L­¬ng S¬n MËt B¶o R­¬ng ®æi ch×a khãa vµng víi t¹i h¹. \n\t 100 c¸i L­¬ng MËt B¶o R­¬ng + 50 vµng=1 ch×a khãa vµng L­¬ng S¬n",getn(tbSay),tbSay);
end

function deal_exchange_201206()
	local nCount1 = floor(GetCash() / Coin_cost*10000);
	local nCount2 = floor(GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) / Item_cost);--ÁºÉ½ÃÜ±¦ÏäÊıÄ¿
	AskClientForNumber("call_exchage_201206",0,min(nCount1,nCount2),"NhËp sè l­îng ®æi","");
end

function call_exchage_201206(nNum)
	if gf_Judge_Room_Weight(1,nNum," ") ~= 1 then
    Talk(1,"",Activity_Npc_Name.."Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
  end
  if GetCash() < nNum * Coin_cost * 10000 then
  	Talk(1,"",Activity_Npc_Name..format("Vµng trong hµnh trang kh«ng ®ñ %d",nNum * Coin_cost ));
  	return 0;
  end
  if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < nNum * Item_cost then
  	Talk(1,"",Activity_Npc_Name..format("Sè l­îng %s trong hµnh trang kh«ng ®ñ %d c¸i",Item_table1[4],nNum * Item_cost));
  	return 0;
  end
	if Pay(nNum * Coin_cost * 10000) == 1 and DelItem(Item_table1[1],Item_table1[2],Item_table1[3],nNum * Item_cost) == 1 then
		gf_AddItemEx2({Item_table2[1],Item_table2[2],Item_table2[3],nNum}, Item_table2[4], "§¹i Sø ho¹t ®éng", "§æi L­¬ng S¬n MËt B¶o R­¬ng", 0, 1)
	end
end