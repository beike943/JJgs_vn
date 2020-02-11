
tbITEMINFO = 
{
	[1] = {"H¾c Ngäc Ngäc Cao t¸n",2,1,9994,100,{"Ngäc Cao t¸n (chiÕn tr­êng)",1,0,200}},
	[2] = {"Sinh Sinh Hãa T¸n",2,1,9993,100,{"Sinh Sinh Hãa T¸n (chiÕn tr­êng)",1,0,201}},
	[3] = {"V¹n VËt Quy Nguyªn ®¬n",2,1,9992,100,{"V¹n VËt Quy Nguyªn ®¬n (chiÕn tr­êng)",1,0,202}},
	[4] = {"Cöu ChuyÓn Håi Hån §¬n",2,1,9991,100,{"Cöu ChuyÓn Håi Hån §¬n (chiÕn tr­êng)",1,0,203}},
}

function OnUse(nItemIdx)
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","B¹n sö dông kh«ng ph¶i lµ chiÕn d­îc");
		return 0;
	end;
	local selTab = {
				format("§ång ý/#use(%d,%d)",nItemIdx,nType),
				"Hñy bá/nothing",
				}
	Say("Ng­¬i ®ång ý sö dông <color=yellow>"..tbITEMINFO[nType][1].."<color> chø?",getn(selTab),selTab);
end;

function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(tbITEMINFO) do
		if genre == tbITEMINFO[i][2] and detail == tbITEMINFO[i][3] and particular == tbITEMINFO[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nItemIdx,nType)
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(tbITEMINFO[nType][6][2],tbITEMINFO[nType][6][3],tbITEMINFO[nType][6][4],tbITEMINFO[nType][5]);
		Msg2Player("B¹n nhËn ®­îc "..tbITEMINFO[nType][5].."c¸i"..tbITEMINFO[nType][6][1])
	end;
end;