Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local selTab = {				
				"Söa ch÷a/repair",
				"KÕt thóc ®èi tho¹i/gf_DoNothing",
				}
	local szSaySth = "Cã cÇn gióp g× kh«ng?";
	if GLB_TMZ_RealmCheck() ~= 1 then
		tinsert(selTab,1,"Më r­¬ng chøa ®å/open_box");
		tinsert(selTab,3,"Mua thuèc/#Sale(30)");
	end
	Say("<color=green>Qu©n nhu quan<color>:"..szSaySth,getn(selTab),selTab);
end;

function want_medicine()
	if gf_Judge_Room_Weight(3,300) == 1 then	
		AddItem(1,0,204,30);
		Msg2Player("NhËn ®­îc 30 H¾c Ngäc §o¹n Tôc Cao chiÕn tr­êng chuyªn dông");	
		AddItem(1,0,205,30);
		Msg2Player("NhËn ®­îc 30 Sinh Sinh T¹o Hãa T¸n chiÕn tr­êng chuyªn dông");	
		AddItem(1,0,206,30);
		Msg2Player("NhËn ®­îc 30 V¹n VËt Quy Nguyªn §¬n chiÕn tr­êng chuyªn dông");	
	else
		Talk(1,"","<color=green>Qu©n Nhu Quan<color>: kh«ng gian hµnh trang kh«ng ®ñ, h·y chØnh lý l¹i. ");
	end;
end;

function gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,szMsgHead)
	if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight()-GetCurItemWeight() < nNeedWeight then
		if szMsgHead ~= nil then	--Èç¹ûÌîÁËµÚÈý¸ö²ÎÊý
			Talk(1,"",szMsgHead.."Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i hµnh trang!");
		end;
		return 0;
	else
		return 1;
	end;
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"","Xin lçi! Ng­¬i ch­a cã r­¬ng chøa ®å.");
		return 0;
	end;
	OpenBox();
end;

function repair()
	local selTab = {
			"Söa miÔn ph?(®é bÒn tr­íc ®©y >0)/repair1",
			"T¨ng cÊp/repair2",
			"Söa miÔn phÝ (®é bÒn tr­íc ®©y =0)/repair3",
			"trë l¹i/main"
			};
	Say("Kh¸ch quan xem kü trang bÞ khi söa ch÷a.",getn(selTab),selTab)
end;

function repair1()
	AdvanceRepair(1);
end;

function repair2()
	AdvanceRepair(2);
end;

function repair3()
	AdvanceRepair(3);
end;
