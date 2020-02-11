--Ììî¸ËéÆ¬
Include("\\script\\lib\\globalfunctions.lua")

Item_table1 = {2,1,30390,"M¶nh Thiªn Cang"};
Item_table2 = {2,95,204,"Thiªn Cang LÖnh"};
Exp_cost = 400000;
Item_cost = 999;
Exp_Max = 2000000000

function OnUse(nItem)
	local tbSay = {
	"§æi kinh nghiÖm (1 m¶nh Thiªn Cang=400,000 kinh nghiÖm)/exchange_exp",
	"§æi Thiªn Cang LÖnh (999 m¶nh Thiªn Cang=1 Thiªn Cang LÖnh)/exchange_tgl",
	"Tho¸t/nothing",
	};
	Say("C¸c h¹ muèn lµm g× ®ã?",getn(tbSay),tbSay);
end

function exchange_exp()
	AskClientForNumber("give_exp_award",0,GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]),"NhËp sè l­îng ®æi","")
end

function give_exp_award(nNum)
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < nNum then
		Talk(1,"",format("%s Sè l­îng kh«ng ®ñ %d c¸i",Item_table1[4],nNum));
		return 0;
	end
	---------
	local nExpTemp = nNum * Exp_cost
	if (GetExp() + nExpTemp) > Exp_Max then
			Talk(1,"", "§iÓm kinh nghiÖm nhËn ®­îc kh«ng thÓ v­ît qu¸ 2 tû !!!")
			return 0
	end
	---------	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],nNum) == 1 then
		gf_Modify("Exp",nNum * Exp_cost);
	end
end

function exchange_tgl()
	AskClientForNumber("give_tgl_award",0,floor(GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) / Item_cost),"NhËp sè l­îng ®æi","")
end

function give_tgl_award(nNum)
	if floor(GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) / Item_cost) < nNum then
		Talk(1,"",format("%s Sè l­îng kh«ng ®ñ %d c¸i",Item_table1[4],nNum * Item_cost));
		return 0;
	end
	if gf_Judge_Room_Weight(ceil(nNum /10),nNum," ") ~= 1 then
    Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
  end
	if nNum ~= 0 and DelItem(Item_table1[1],Item_table1[2],Item_table1[3],nNum * Item_cost) == 1 then
		gf_AddItemEx2({Item_table2[1],Item_table2[2],Item_table2[3],nNum}, Item_table2[4], "§æi m¶nh Thiªn Cang ", "§æi Thiªn Cang LÖnh", 0, 1);
		Msg2Global(format("Chóc mõng ng­êi ch¬i %s dïng M¶nh Thiªn Cang ®æi thµnh c«ng %d c¸i Thiªn Cang LÖnh",GetName(),nNum));
		AddRuntimeStat(14, 1, 0, nNum)
	end
end