Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_define.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	local tSay = {}
	for i = 1, getn(ZQ_CAIJI_ITEM) do
		tinsert(tSay, format("Mua %s/#buy_item(", ZQ_CAIJI_ITEM[i][4])..i..")")
	end
	tinsert(tSay, "\n T¹i h¹ chØ xem qua th«i/do_nothing");
	Say("<color=green>Liªu th­¬ng nh©n: <color>muèn lµm tèt c«ng viÖc tr­íc tiªn ph¶i cã c«ng cô tèt!", getn(tSay), tSay);
end

function buy_item(nIndex)
	gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 28, 29, nIndex, TASK_ACCESS_CODE_ZQBATTLE);
	local nRoom = GetFreeItemRoom();
	local nPay = floor(GetCash() / ZQ_CAIJI_ITEM[nIndex][5]);
	AskClientForNumber("buy_item_deal", 1, min(nRoom, nPay),"H·y nhËp sè l­îng mua: ","")
end

function buy_item_deal(nNum)
	local nIndex = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 28, 29);
	if nIndex < 1 or nIndex > getn(ZQ_CAIJI_ITEM) then
		return 0;
	end
	if not ZQ_CAIJI_ITEM or getn(ZQ_CAIJI_ITEM[nIndex]) ~= 5 then
		return 0;
	end
	if gf_Judge_Room_Weight(nNum, 2*nNum, " ") ~= 1 then
		return 0;
	end
	if GetCash() < nNum * ZQ_CAIJI_ITEM[nIndex][5] then
		Talk(1,"","Ng©n l­îng trong hµnh trang kh«ng ®ñ");
		return 0;
	end
	if Pay(ZQ_CAIJI_ITEM[nIndex][5] * nNum) == 1 then
		gf_AddItemEx2({ZQ_CAIJI_ITEM[nIndex][1], ZQ_CAIJI_ITEM[nIndex][2], ZQ_CAIJI_ITEM[nIndex][3], nNum}, ZQ_CAIJI_ITEM[nIndex][4], ZQ_szLogTitle, "Mua dông cô thu thËp", 0, 1);
	end
end

function do_nothing()
end