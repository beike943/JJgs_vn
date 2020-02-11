--create date:07-11-23
--author:yanjun
--describe:use the battle title
Include("\\script\\newbattles\\functions.lua");
TB_NEW_TITLE = 
{
	[1] = 
		{
			{2,1,9961,"Hé lÖnh Ph¸ trËn ®èc","Ph¸ trËn ®èc hé"},
			{--ÊÇ·ñĞèÓÀ¾ÃÔªË§¾üÏÎ£¬ÊôĞÔÃèÊö£¬¶ÔÓ¦³ÆºÅ±íÄÚµÄ´óÀà£¬¸±Àà£¬³ÖĞøÊ±¼ä(ÕæÊµÊ±¼ä)£¬ËùĞè¾ü¹¦£¨¾ø¶ÔÖµ£©
				{1,"Thªm 15% néi, ngo¹i c«ng",	30,13,3600 * 24 * 30,	300000},
				{1,"thªm 100 ®iÓm S¸t th­¬ng",	30,15,3600 * 24 * 30,	300000},
			},
		},
	[2] = 
		{
			{2,1,9963,"TrÊn qu©n Hæ kú lÖnh","TrÊn qu©n Hæ kú"},
			{
				{0,"Tû lÖ s¸t th­¬ng gi¶m 25%",30,17,3600 * 24 * 30,	450000},
			},
		},
	[3] = 
		{
			{2,1,9962,"ThiÕt cæ long vÖ lÖnh","ThiÕt cæ long vÖ"},
			{
				{0,"T¨ng 60 ®iÓm thuéc tİnh",30,19,3600 * 24 * 30,	400000},
			},
		},
	[4] = 
		{
			{2,1,9964,"V« Song Phi T­íng lÖnh","V« Song Phi T­íng"},
			{
				{0,"T¨ng 10000 ®iÓm sinh lùc tèi ®a",30,21,3600 * 24 * 30,	500000},
			},
		},
	[5] = 
		{
			{2,1,9960,"Ngù ®Şch m·nh sÜ lÖnh","Ngù ®Şch m·nh sÜ"},
			{
				{1,"T¨ng 40 ®iÓm thuéc tİnh",30,23,3600 * 24 * 30,	250000},
			},
		},
}

function OnUse(nItemIdx)
	nItemIdx = tonumber(nItemIdx);
	local nType = get_item_info(nItemIdx);
	local nCurCamp = BT_GetCurCamp();
	if nType == 0 then
		Talk(1,"","B¹n kh«ng sö dông Phong Th­ëng LÖnh.");
		return 0;
	end;
	if nType == 1 then	--ÌØÀı£ºÈç¹ûÊÇÆÆÕó¶½»¤Áî
		local selTab = {
					format("T¨ng 15##néi, ngo¹i lùc/#use_confirm(%d,%d)",nItemIdx,1),
					format("thªm 100 ®iÓm S¸t th­¬ng/#use_confirm(%d,%d)",nItemIdx,2),
					"Hñy bá/nothing",
					}
		Say("sö dông <color=yellow>"..TB_NEW_TITLE[nType][1][4].."<color>B¹n sÏ nhËn ®­îc <color=yellow>®¹i"..tCampNameZ[nCurCamp]..TB_NEW_TITLE[nType][1][4].."<color>danh hiÖu, h·y chän thuéc tİnh b¹n cÇn: ",getn(selTab),selTab);
	else
		local selTab = {
					format("§ång ı/#use_confirm(%d,%d)",nItemIdx,1),
					"Hñy bá/nothing",
					}
		Say("sö dông <color=yellow>"..TB_NEW_TITLE[nType][1][4].."<color>B¹n sÏ nhËn ®­îc <color=yellow>®¹i"..tCampNameZ[nCurCamp]..TB_NEW_TITLE[nType][1][5].."<color>danh hiÖu, b¹n muèn sö dông ngay kh«ng?",getn(selTab),selTab);
	end;
end;

function get_item_info(nItemIdx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(TB_NEW_TITLE) do
		if TB_NEW_TITLE[i][1][1] == nGenre and TB_NEW_TITLE[i][1][2] == nDetail and TB_NEW_TITLE[i][1][3] == nParticular then
			return i;
		end;
	end;
	return 0;
end;

function check_player_state(nItemType,nTitleIdx)
	local nNeedJunGong = TB_NEW_TITLE[nItemType][2][nTitleIdx][6];
	local nNeedEverRank = TB_NEW_TITLE[nItemType][2][nTitleIdx][1];
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	local bEverMarshal = 0;
	local nCurCamp = BT_GetCurCamp();
--	if BT_GetData(PT_MARSHAL_WEEK) >= 15 then
--		bEverMarshal = 1;	--ÊÇÓÀ¾ÃÔªË§
--	end;
	if nNeedEverRank == 1 then
		if bEverMarshal == 0 and abs(nCurJunGong) < nNeedJunGong then
			Talk(1,"","B¹n ph¶i ®¹t ®­îc "..tCampNameZ[nCurCamp].." <color=yellow>"..nNeedJunGong.."<color>chiÕn c«ng hoÆc cã<color=yellow>"..tCampNameZ[nCurCamp].."_Qu©n hµm VÜnh Cöu Nguyªn so¸i<color>míi cã thÓ sö dông danh hiÖu nµy.");				
			return 0;
		end;
	else
		if abs(nCurJunGong) < nNeedJunGong then
			Talk(1,"","B¹n ph¶i ®¹t ®­îc "..tCampNameZ[nCurCamp].." <color=yellow>"..nNeedJunGong.."<color> Qu©n c«ng míi sö dông danh hiÖu nµy.");				
			return 0;
		end;
	end;
	return 1;
end;

function use_confirm(nItemIdx,nTitleIdx)
	local nType = get_item_info(nItemIdx);
	if check_player_state(nType,nTitleIdx) ~= 1 then
		return 0;
	end;
	local nCurCamp = BT_GetCurCamp();
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nGenre,nDetail = TB_NEW_TITLE[nType][2][nTitleIdx][3],TB_NEW_TITLE[nType][2][nTitleIdx][4];
		if nCurCamp == LIAO_ID then
			nDetail = nDetail + 1;
		end;
		if mod(nDetail,2) == 1 then	--ËÎ·½µÄ
			for i=7,12 do
				RemoveTitle(30,2*i);	--°ÑÁÉµÄÈ«É¾µô
			end;
		else	--ÁÉ·½µÄ
			for i=6,11 do
				RemoveTitle(30,2*i+1);	--°ÑËÎµÄÈ«É¾µô
			end;			
		end;
		if nDetail <= 16 then	--Èç¹ûÊÇ´óËÎ/ÁÉÆÆÕó¶½»¤Áî
			for i=13,16 do
				RemoveTitle(30,i);
			end;
		end;
		local nTime = TB_NEW_TITLE[nType][2][nTitleIdx][5];
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("B¹n nhËn ®­îc danh hiÖu:"..TB_NEW_TITLE[nType][1][5]);
		SetCurTitle(nGenre, nDetail);
	end;
end;