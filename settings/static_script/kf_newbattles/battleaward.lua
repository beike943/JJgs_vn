--Create date:2007-3-2
--Author:yanjun
--Describe:Õ½³¡½±ÀøÄ£¿é
--note:´Ë½Å±¾²»ÒËÂÒ±»Include
SONG_ID = 1;
LIAO_ID = 2;

if IB_VERSION == 1 then
	g_szNeedItemName = "N÷ Oa Tinh Th¹ch";
	g_nItemID = 504;
else
	g_szNeedItemName = "N÷ Oa Tinh Th¹ch";
	g_nItemID = 504;
end;

tEquipInfo = 
{
	[1] = 	{	--¶¼Í³×°			
		[SONG_ID] = {--×°±¸ÐÅÏ¢,ÐèÒª¾üÏÎ,ÏûºÄ»ý·Ö,ÏûºÄ½ð×Ó,ÏûºÄÎïÆ·ÐÅÏ¢
					{{"Tèng §« thèng chiÕn kh«i",0,103,2231},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"Tèng §« thèng chiÕn bµo",0,100,2231},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"Tèng §« thèng chiÕn phôc",0,101,2231},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					},
		[LIAO_ID] = {
					{{"Liªu §« thèng chiÕn kh«i",0,103,2235},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"Liªu §« thèng chiÕn bµo",0,100,2235},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"Liªu §« thèng chiÕn phôc",0,101,2235},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},					
					}
			},
	[2] = 	{	--ÏÈ·æ×°			
		[SONG_ID] = {--×°±¸ÐÅÏ¢,ÐèÒª¾üÏÎ,ÏûºÄ»ý·Ö,ÏûºÄ½ð×Ó,ÏûºÄÎïÆ·
					{{"Tèng tiªn phong hiÖu kú",0,102,2261},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					{{"Tèng tiªn phong hiÖu phï",0,102,2265},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					},
		[LIAO_ID] = {
					{{"Liªu tiªn phong hiÖu kú",0,102,2271},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					{{"Liªu tiªn phong hiÖu phï",0,102,2275},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					}
			},
	[3] = 	{	--½«¾ü×°			
		[SONG_ID] = {--×°±¸ÐÅÏ¢,ÐèÒª¾üÏÎ,ÏûºÄ»ý·Ö,ÏûºÄ½ð×Ó,ÏûºÄÎïÆ·
					{{"Tèng t­íng qu©n ®Çu kh«i",0,103,2241},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Tèng t­íng qu©n chiÕn bµo",0,100,2241},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Tèng t­íng qu©n chiÕn phôc",0,101,2241},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Tèng t­íng qu©n lÖnh bµi",0,102,2281},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Tèng t­íng qu©n cê lÖnh",0,102,2285},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Tèng lÖnh phï",0,102,2521},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					},
		[LIAO_ID] = {
					{{"Liªu t­íng qu©n ®Çu kh«i",0,103,2245},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Liªu t­íng qu©n chiÕn bµo",0,100,2245},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Liªu t­íng qu©n chiÕn phôc",0,101,2245},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Liªu t­íng qu©n lÖnh bµi",0,102,2291},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Liªu t­íng qu©n cê lÖnh",0,102,2295},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Liªu lÖnh phï",0,102,2531},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					}
			},
	[4] = 	{	--ÔªË§×°
		[SONG_ID] = {
					{{"Tèng nguyªn so¸i ®Çu kh«i",0,103,2251},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Tèng nguyªn so¸i chiÕn bµo",0,100,2251},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Tèng nguyªn so¸i chiÕn phôc",0,101,2251},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Tèng nguyªn so¸i hæ phï",0,102,2301},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Tèng nguyªn so¸i lÖnh kú",0,102,2305},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Tèng so¸i phï",0,102,2501},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Tèng so¸i kú",0,102,2505},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					},
		[LIAO_ID] = {
					{{"Liªu nguyªn so¸i ®Çu kh«i",0,103,2255},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Liªu nguyªn so¸i chiÕn bµo",0,100,2255},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Liªu nguyªn so¸i chiÕn phôc",0,101,2255},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Liªu nguyªn so¸i hæ phï",0,102,2311},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Liªu nguyªn so¸i lÖnh kú",0,102,2315},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Liªu so¸i phï",0,102,2511},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Liªu so¸i kú",0,102,2515},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					}	
			}
}
--Õ½³¡½±ÀøÖ÷Èë¿Ú
function BTA_Main()
	CalcBattleRank();
	local nCurRank = BT_GetData(PT_CURRANK);
	local selTab = {
			"Ta muèn ®æi trang bÞ §« thèng/#BTA_WantEquip(1)",
			"Ta muèn ®æi trang bÞ Tiªn phong/#BTA_WantEquip(2)",
			"Ta muèn ®æi trang bÞ T­íng qu©n/#BTA_WantEquip(3)",
			"Ta muèn ®æi trang bÞ Nguyªn so¸i/#BTA_WantEquip(4)",
			"Ta muèn biÕt quy t¾c ®æi phÇn th­ëng/BTA_KnowRule",
			"Ta sÏ quay l¹i sau!/nothing",
			}
	if abs(nCurRank) <= 2 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Qu©n hµm cña ng­¬i cßn thÊp, kh«ng thÓ ®æi phÇn th­ëng.");
		return 0;
	end;
	for i=1,6-abs(nCurRank) do	--Õâ¸öÊÇÓÃÀ´È¥µôÒ»Ð©Ñ¡ÏîµÄ£¬¿´ÆðÀ´±È½Ï¹Ö£¬¿´²»¶®¾ÍËãÁË
		tremove(selTab,abs(nCurRank)-1);	
	end;
	if (g_nNpcCamp == SONG_ID and nCurRank <= 0) or (g_nNpcCamp == LIAO_ID and nCurRank >= 0) then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng­¬i kh«ng ®ñ ®iÒu kiÖn ®æi trang bÞ phe <color=yellow>"..tCampNameZ[g_nNpcCamp].."<color> . Xin x¸c nhËn l¹i qu©n hµm cã ph¶i lµ phe <color=yellow>"..tCampNameZ[g_nNpcCamp].."<color>.a");
		return 0;
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i cÇn ®æi phÇn th­ëng g×?",getn(selTab),selTab);
end;
--Õ½³¡½±Àø¶Ò»»¹æÔòËµÃ÷
function BTA_KnowRule()
	Talk(1,"BTA_KnowRule2","<color=green>"..g_sNpcName.."<color>: <enter> §æi <color=yellow>Trang bÞ §« thèng<color> qu©n hµm ph¶i tõ <color=yellow>Tèng §« Thèng<color> trë lªn. Mçi trang bÞ cÇn <color=yellow>500 vµng<color>, <color=yellow>15000 ®iÓm tÝch lòy<color> vµ <color=yellow>"..g_szNeedItemName.."<color><enter>§æi <color=yellow>Trang bÞ Tiªn phong<color> qu©n hµm ph¶i tõ <color=yellow>Tèng Tiªn Phong<color> trë lªn. Mçi trang bÞ cÇn <color=yellow>1300 vµng<color>, <color=yellow>30000 ®iÓm tÝch lòy<color>; vµ <color=yellow>"..g_szNeedItemName.."<color> 40!");
end;

function BTA_KnowRule2()
	Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: <enter>§æi <color=yellow>Trang bÞ T­íng qu©n<color> qu©n hµm ph¶i tõ <color=yellow>Tèng T­íng Qu©n<color> trë lªn. Mçi trang bÞ cÇn <color=yellow>2500 vµng<color>, <color=yellow>60000 ®iÓm tÝch lòy<color> vµ <color=yellow>"..g_szNeedItemName.."<color> 10!<enter> §æi <color=yellow>Trang bÞ Nguyªn so¸i <color> qu©n hµm ph¶i tõ <color=yellow>Tèng Nguyªn So¸i<color> trë lªn. Mçi trang bÞ cÇn <color=yellow>4000 vµng<color>, <color=yellow>100000 ®iÓm tÝch lòy<color> vµ <color=yellow>"..g_szNeedItemName.."<color> 20!");
end;

function BTA_WantEquip(nType)
	local selTab = {};
	for i=1,getn(tEquipInfo[nType][1]) do
		tinsert(selTab,format(tEquipInfo[nType][g_nNpcCamp][i][1][1].."/#BTA_AffirmEquip(%d,%d)",nType,i));
	end;
	tinsert(selTab,"Ta muèn xem trang bÞ kh¸c/BTA_Main");
	tinsert(selTab,"Ta sÏ quay l¹i sau!/nothing");
	Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i cÇn ®æi trang bÞ nµo",getn(selTab),selTab);
end;

function BTA_AffirmEquip(nType,nEquipIndex)
	local tEquip = tEquipInfo[nType][g_nNpcCamp][nEquipIndex][1];
	local selTab = {
				format("§ång ý ®æi /#BTA_AffirmEquipFinal(%d,%d)",nType,nEquipIndex),
				"§Ó ta suy nghÜ l¹i/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: Ng­¬i ®ång ý ®æi <color=yellow>"..tEquip[1].."<color> chø?",getn(selTab),selTab);
end;

function BTA_AffirmEquipFinal(nType,nEquipIndex)
	if BTA_CheckCondition(nType,nEquipIndex) == 1 then
		local tEquip = tEquipInfo[nType][g_nNpcCamp][nEquipIndex][1];
		local nBody = GetBody();
		local nRetCode = AddItem(tEquip[2],tEquip[3],tEquip[4]-1+nBody,1,1,-1,-1,-1,-1,-1,-1);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 trang bÞ:"..tEquip[1]);
			WriteLog("[phÇn th­ëng chiÕn trËn]:"..GetName().."nhËn ®­îc trang bÞ chiÕn tr­êng:"..tEquip[1]);
		else
			WriteLog("[phÇn th­ëng bÞ lçi]:"..GetName().."nhËn ®­îc trang bÞ ("..tEquip[1]..") lçi, nRetCode:"..nRetCode);
		end;
	end;
end;
--¼ì²éÊÇ·ñÂú×ã¶Ò»»Õ½³¡×°±¸µÄËùÓÐÒªÇó
function BTA_CheckCondition(nType,nEquipIndex)
	if gf_JudgeRoomWeight(2,200) == 1 then
		local t = tEquipInfo[nType][g_nNpcCamp][nEquipIndex];
		local nNeedRank = t[2];
		local nNeedPoint = t[3];
		local nNeedMoney = t[4];
		local nNeedItemCount = t[5][5];
		local nCurRank = abs(BT_GetData(PT_CURRANK));	--ÒòÎªÈë¿Ú´¦±£Ö¤ÁËÏàÓ¦¾üÏÎÁìÈ¡ÏàÓ¦×°±¸£¬ËùÒÔÕâÀï²»ÓÃÅÐ¶ÏËÎÁÉÕóÓªÁË
		local nCurPoint = BT_GetData(PT_TOTALPOINT);
		local nCurMoney = GetCash();
		local szItemName,nItemID1,nItemID2,nItemID3 = t[5][1],t[5][2],t[5][3],t[5][4];
		local nCurItemCount = GetItemCount(nItemID1,nItemID2,nItemID3);
		local szEquipName = t[1][1];
		if nCurRank < nNeedRank then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: Qu©n hµm cña b¹n cßn thÊp kh«ng thÓ ®æi <color=yellow>"..szEquipName.."<color>.");
			return 0;
		end;
		if nCurPoint < nNeedPoint then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: §iÓm tÝch lòy cña b¹n cßn thÊp qu¸, kh«ng thÓ ®æi <color=yellow>"..szEquipName.."<color>. B¹n cÇn cã thªm <color=red>"..nNeedPoint.."<color> ®iÓm tÝch lòy");
			return 0;
		end;
		if nCurMoney < nNeedMoney*10000 then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: TiÒn vµng kh«ng ®ñ, kh«ng thÓ ®æi <color=yellow>"..szEquipName.."<color>. B¹n cÇn cã thªm <color=red>"..nNeedMoney.."<color> vµng");
			return 0;
		end;
		if nCurItemCount < nNeedItemCount then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: B¹n cÇn <color=yellow>"..nNeedItemCount.."<color> <color=yellow>"..szItemName.."<color> míi cã thÓ ®æi<color=yellow>"..szEquipName.."<color>.");
			return 0;
		end;
		BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);	--¿Û»ý·Ö
		Pay(nNeedMoney*10000);	--¿Û½ð×Ó
		DelItem(nItemID1,nItemID2,nItemID3,nNeedItemCount);	--¿ÛÎïÆ·
		return 1;
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Kho¶ng trèng trong hµnh trang kh«ng ®ñ!");
		return 0;
	end;
end;
