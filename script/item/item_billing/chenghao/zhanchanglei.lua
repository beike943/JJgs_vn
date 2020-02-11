--create date:07-04-03
--author:yanjun
--describe:use the battle title
tTab =
{
--ÎïÆ·´óÀà£¬¸±Àà£¬ÏêÏ¸Àà±ð£¬ÐèÒª¾üÏÎ£¬ÎïÆ·Ãû³Æ£¬³ÆºÅÃû³Æ£¬¶ÔÓ¦³ÆºÅ±íÄÚµÄ´óÀà£¬¸±Àà£¬³ÖÐøÊ±¼ä(ÕæÊµÊ±¼ä)
	{2,1,9990,	 2,	"§¹i Tèng Phong Th­ëng lÖnh (HiÖu óy)",	"Tèng_Vâ Dòng HiÖu óy",		30,	 2,	3600 * 24 * 30},
	{2,1,9989,	-2,	"§¹i Liªu Phong Th­ëng lÖnh (HiÖu óy)",	"Liªu_Kiªu Dòng §« óy",		30,	 8,	3600 * 24 * 30},
	{2,1,9988,	 3,	"§¹i Tèng Phong Th­ëng lÖnh (§« thèng)",	"Tèng_Th­êng Th¾ng §« thèng",		30,	 3,	3600 * 24 * 30},
	{2,1,9987,	-3,	"§¹i Liªu Phong Th­ëng lÖnh (§« thèng)",	"Liªu_TuyÖt trÇn §« thèng",		30,	 9,	3600 * 24 * 30},
	{2,1,9986,	 4,	"§¹i Tèng Phong Th­ëng lÖnh (Tiªn phong)",	"Tèng_§Þnh B¾c ®¹i Tiªn phong",	30,	 4,	3600 * 24 * 30},
	{2,1,9985,	-4,	"§¹i Liªu Phong Th­ëng lÖnh (Tiªn phong)",	"Liªu_B×nh Nam ®¹i Tiªn phong",	30,	10,	3600 * 24 * 30},	
	{2,1,9984,	 5,	"§¹i Tèng Phong Th­ëng lÖnh (T­íng qu©n)",	"Tèng_V« Song §¹i t­íng qu©n",	30,	 5,	3600 * 24 * 30},	
	{2,1,9983,	-5,	"§¹i Liªu Phong Th­ëng lÖnh (T­íng qu©n)",	"Liªu_Th«ng Thiªn §¹i t­íng qu©n",	30,	11,	3600 * 24 * 30},	
	{2,1,9982,	 6,	"§¹i Tèng Phong Th­ëng lÖnh (Nguyªn so¸i)",	"Tèng_Hé Quèc §¹i nguyªn so¸i",	30,	 6,	3600 * 24 * 30},	
	{2,1,9981,	-6,	"§¹i Liªu Phong Th­ëng lÖnh (Nguyªn so¸i)",	"Nam ViÖn ®¹i V­¬ng",			30,	12,	3600 * 24 * 30},
} 

tRank = {
	[0] = "Binh sÜ",
	[1] = "Binh sÜ",
	[2] = "HiÖu óy",
	[3] = "§« thèng",
	[4] = "Tiªn phong",
	[5] = "T­íng qu©n",
	[6] = "Nguyªn So¸i",
	}
function OnUse(nItemIdx)
	local nTitleIdx = get_title_index(nItemIdx);
	if nTitleIdx == 0 then
		Talk(1,"","B¹n kh«ng sö dông Phong Th­ëng LÖnh.");
		return 0;
	end;
	local selTab = {
				format("§ång ý/#use_confirm(%d,%d)",nItemIdx,nTitleIdx),
				"Ta suy nghÜ l¹i!/nothing",
				}
	if check_player_state(nTitleIdx) == 1 then
		Say("sö dông <color=yellow>"..tTab[nTitleIdx][5].."<color> b¹n nhËn ®­îc <color=yellow>"..tTab[nTitleIdx][6].."<color> danh hiÖu, <color=red>danh hiÖu tr­íc ®©y còng bÞ xãa<color>, cã cßn muèn sö dông kh«ng?",getn(selTab),selTab);
	end;
end;

function get_title_index(nItemIdx)
	nItemIdx = tonumber(nItemIdx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	for i,v in tTab do
		if tTab[i][1] == nGenre and tTab[i][2] == nDetail and tTab[i][3] == nParticular then
			return i;
		end;
	end;
	return 0;
end;

function check_player_state(nTitleIdx)
	local nCurRank = GetTask(704);
	local nNeedRank = tTab[nTitleIdx][4];
	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	
	if nCurRank > 0 then
		if nNeedRank < 0 then
			Talk(1,"","B¹n hiÖn thuéc phe <color=yellow>Tèng<color>, kh«ng thÓ dïng danh hiÖu cña phe Liªu");
			return 0
		end
	elseif nCurRank < 0 then
		if nNeedRank > 0 then
			Talk(1,"","B¹n hiÖn thuéc phe <color=yellow>Liªu<color>, kh«ng thÓ dïng danh hiÖu cña phe Tèng");
			return 0;
		end
	end
	nCurRank = abs(nCurRank)
	nNeedRank = abs(nNeedRank)
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end
	if nCurRank < nNeedRank then
		Talk(1,"","Qu©n hµm cña b¹n qu¸ thÊp kh«ng thÓ sö dông danh hiÖu nµy.");
		return 0
	end
	return 1
end;

function use_confirm(nItemIdx,nTitleIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		for i=2,12 do
			RemoveTitle(30,i);
		end;
		local nGenre,nDetail = tTab[nTitleIdx][7],tTab[nTitleIdx][8];
		local nTime = tTab[nTitleIdx][9];
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("B¹n nhËn ®­îc x­ng hiÖu"..tTab[nTitleIdx][6]);
		SetCurTitle(nGenre, nDetail);
	end;
end;