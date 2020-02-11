Include("\\script\\newbattles\\functions.lua");

function main()
	local selTab = {
				"Më r­¬ng chøa ®å/open_box",
				"Söa ch÷a/repair",
				"NhËn d­îc phÈm chiÕn tr­êng/want_medicine",
				"§æi ®iÓm tÝch lòy lÊy d­îc phÈm/buy_medicine",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	local szSaySth = "";
	local nCurMapID = GetWorldPos();
	if nCurMapID == VILLAGE_MAP_ID then

	elseif nCurMapID == RESOURCE_MAP_ID then
		tremove(selTab,3);	--²Ý¹È³¡Õ½Ã»ÓÐÁìÈ¡Ò©Æ·ºÍ»ý·Ö»»Ò©¹¦ÄÜ
		tremove(selTab,3);
	elseif nCurMapID == EMPLACEMENT_MAP_ID then
		
	elseif nCurMapID == MAIN_MAP_ID then	--Ö÷Õ½³¡¶Ô»°Ñ¡ÏîÅÐ¶Ï

	end;
	szSaySth = "Cã cÇn gióp g× kh«ng?";
	Say("<color=green>Qu©n nhu quan<color>:"..szSaySth,getn(selTab),selTab);
end;

function want_medicine()
	if BT_GetData(PTNC_GOT_MEDICINE) == 1 then
		--Talk(1,"","<color=green>¾üÐè¹Ù<color>£º¾üÖÐÒ©Æ·ÊýÁ¿²»¶à£¬Ã¿³¡Õ½³¡Ã¿ÈËÖ»ÄÜÁìÈ¡Ò»´ÎÒ©Æ·¡£");
		--return 0;
	end;
	local nCount = 0;
	local nCurMapID = GetWorldPos();
	if nCurMapID == MAIN_MAP_ID then
		local nPlayerCamp = BT_GetCamp();
		local nResourceCamp = GetGlbValue(GLB_RESOURCE);
		if nPlayerCamp == nResourceCamp then
			nCount = 50;	--Ê¤·½¿É»ñ50¸ö
		elseif nResourceCamp == 0 then
			nCount = 40;	--Æ½¾Ö¿É»ñ40¸ö
		else
			nCount = 25;	--°Ü·½¿É»ñ25¸ö
		end;
	else
		nCount = 30;
	end;
	if gf_Judge_Room_Weight(3,300) == 1 then	
		BT_SetData(PTNC_GOT_MEDICINE,1);
		AddItem(tBattleItem[9][2],tBattleItem[9][3],tBattleItem[9][4],nCount);
		Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..tBattleItem[9][1]);	
		AddItem(tBattleItem[10][2],tBattleItem[10][3],tBattleItem[10][4],nCount);
		Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..tBattleItem[10][1]);	
		AddItem(tBattleItem[11][2],tBattleItem[11][3],tBattleItem[11][4],nCount);
		Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..tBattleItem[11][1]);	
	else
		Talk(1,"","Hµnh trang hoÆc søc lùc cña ng­¬i kh«ng ®ñ, xin kiÓm tra l¹i tr­íc!");
	end;
end;

function buy_medicine()
	local selTab = {
				"Ta muèn ®æi d­îc phÈm chiÕn tr­êng/want_battle_medicine",
				"Ta muèn ®æi d­îc phÈm th«ng dông/want_pk_medicine",
				"Kh«ng cÇn/nothing",
				}
	Say("Ng­¬i muèn ®æi d­îc phÈm nµo?",getn(selTab),selTab);
end;
--===========================================================================================
function want_battle_medicine()
	list_battle_medicine(1,getn(tBattleMed));
end;

function list_battle_medicine(nPageNum,nCount)
	local tMedList = get_battle_medicine_list();
	local selTab = {};
	local nItemPerPage = 4;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊýÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊýµÄ×î´óÏÔÊ¾ÏîÄ¿ÊýµÄ
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang tr­íc \n /#list_battle_medicine(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tMedList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#list_battle_medicine(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"\n Ta muèn xem d­îc phÈm kh¸c/buy_medicine");
	tinsert(selTab,"§Ó ta nghÜ l¹i/nothing");
	Say("Ng­¬i muèn ®æi d­îc phÈm nµo?",getn(selTab),selTab);
end;

function get_battle_medicine_list()
	local tSelTab = {};
	for i=1,getn(tBattleMed) do
		tinsert(tSelTab,format(tBattleMed[i][1].."/#select_battle_medicine(%d)",i));
	end;
	return tSelTab;
end;

function select_battle_medicine(nMedIdx)
	local selTab = {
					format("Ta muèn ®æi 1/#get_battle_medicine(%d,%d)",nMedIdx,1),
					format("Ta muèn ®æi 2/#get_battle_medicine(%d,%d)",nMedIdx,2),
					format("Ta muèn ®æi 5/#get_battle_medicine(%d,%d)",nMedIdx,5),
					format("Ta muèn ®æi 10/#get_battle_medicine(%d,%d)",nMedIdx,10),
					format("Ta muèn ®æi 20/#get_battle_medicine(%d,%d)",nMedIdx,20),
					"\nTa muèn xem d­îc phÈm chuyªn dông kh¸c/want_battle_medicine",
					"Kh«ng cÇn/nothing",
					}
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tBattleMed[nMedIdx][1];
	local nNeedPoint = tBattleMed[nMedIdx][5];
	local nMaxCount = floor(nCurPoint/nNeedPoint);
	local szEffect = tBattleMed[nMedIdx][6];
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	local nNeedRank = tBattleMed[nMedIdx][7];
	if nCurRank < nNeedRank then
		Talk(1,"want_battle_medicine","Qu©n hµm cña ng­¬i qu¸ thÊp, cÇn ph¶i ®¹t ®Õn cÊp <color=yellow>"..tRankName[nNeedRank].."<color> trë lªn míi cã thÓ ®æi nh÷ng d­îc phÈm nµy.");
		return 0;
	end;
	Say("Mçi <color=yellow>"..szItemName.."<color> cÇn <color=yellow>"..nNeedPoint.."<color> ®iÓm tÝch lòy chiÕn tr­êng, b¹n hiÖn cã <color=yellow>"..nCurPoint.."<color> ®iÓm tÝch lòy chiÕn tr­êng, tèi ®a cã thÓ ®æi <color=yellow>"..nMaxCount.."<color> c¸i"..szItemName..". HiÖu qu¶ d­îc phÈm: <color=yellow>"..szEffect.."<color>.",getn(selTab),selTab);
end;

function get_battle_medicine(nMedIdx,nCount)
	local nNeedPoint = tBattleMed[nMedIdx][5];
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tBattleMed[nMedIdx][1];
	if gf_JudgeRoomWeight(2,nCount*2) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc cña ng­¬i kh«ng ®ñ, xin kiÓm tra l¹i tr­íc!");
		return 0;
	end;
	local nNeedTotalPoint = nNeedPoint*nCount;
	if nCurPoint < nNeedTotalPoint then
		Talk(1,"","§iÓm tÝch lòy cña ng­¬i kh«ng ®ñ!");
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedTotalPoint);
	AddItem(tBattleMed[nMedIdx][2],tBattleMed[nMedIdx][3],tBattleMed[nMedIdx][4],nCount);
	Msg2Player("B¹n tiªu hao"..nNeedTotalPoint.." ®iÓm tÝch lòy chiÕn tr­êng")
	Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..szItemName);
end;
--===========================================================================================
function want_pk_medicine()
	list_pk_medicine(1,getn(tPKMed));
end;

function list_pk_medicine(nPageNum,nCount)
	local tMedList = get_pk_medicine_list();
	local selTab = {};
	local nItemPerPage = 4;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊýÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊýµÄ×î´óÏÔÊ¾ÏîÄ¿ÊýµÄ
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang tr­íc \n /#list_pk_medicine(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tMedList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#list_pk_medicine(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"\n Ta muèn xem d­îc phÈm kh¸c/buy_medicine");
	tinsert(selTab,"§Ó ta nghÜ l¹i/nothing");
	Say("Ng­¬i muèn ®æi d­îc phÈm nµo?",getn(selTab),selTab);
end;

function get_pk_medicine_list()
	local tSelTab = {};
	for i=1,getn(tPKMed) do
		tinsert(tSelTab,format(tPKMed[i][1].."/#select_pk_medicine(%d)",i));
	end;
	return tSelTab;
end;

function select_pk_medicine(nMedIdx)
	local selTab = {
					format("Ta muèn ®æi 1/#get_pk_medicine(%d,%d)",nMedIdx,1),
					format("Ta muèn ®æi 2/#get_pk_medicine(%d,%d)",nMedIdx,2),
					format("Ta muèn ®æi 5/#get_pk_medicine(%d,%d)",nMedIdx,5),
					format("Ta muèn ®æi 10/#get_pk_medicine(%d,%d)",nMedIdx,10),
					format("Ta muèn ®æi 20/#get_pk_medicine(%d,%d)",nMedIdx,20),
					"\n Ta muèn xem d­îc phÈm th«ng dông kh¸c/want_pk_medicine",
					"Kh«ng cÇn/nothing",
					}
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tPKMed[nMedIdx][1];
	local nNeedPoint = tPKMed[nMedIdx][5];
	local nMaxCount = floor(nCurPoint/nNeedPoint);
	local szEffect = tPKMed[nMedIdx][6];
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	local nNeedRank = tPKMed[nMedIdx][7];
	if nCurRank < nNeedRank then
		Talk(1,"want_pk_medicine","Qu©n hµm cña ng­¬i qu¸ thÊp, cÇn ph¶i ®¹t ®Õn cÊp <color=yellow>"..tRankName[nNeedRank].."<color> trë lªn míi cã thÓ ®æi nh÷ng d­îc phÈm nµy.");
		return 0;
	end;
	Say("Mçi <color=yellow>"..szItemName.."<color> cÇn <color=yellow>"..nNeedPoint.."<color> ®iÓm tÝch lòy chiÕn tr­êng, b¹n hiÖn cã <color=yellow>"..nCurPoint.."<color> ®iÓm tÝch lòy chiÕn tr­êng, tèi ®a cã thÓ ®æi <color=yellow>"..nMaxCount.."<color> c¸i"..szItemName..". HiÖu qu¶ d­îc phÈm: <color=yellow>"..szEffect.."<color>.",getn(selTab),selTab);
end;

function get_pk_medicine(nMedIdx,nCount)
	local nNeedPoint = tPKMed[nMedIdx][5];
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tPKMed[nMedIdx][1];
	if gf_JudgeRoomWeight(2,nCount*2) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc cña ng­¬i kh«ng ®ñ, xin kiÓm tra l¹i tr­íc!");
		return 0;
	end;
	local nNeedTotalPoint = nNeedPoint*nCount;
	if nCurPoint < nNeedTotalPoint then
		Talk(1,"","§iÓm tÝch lòy cña ng­¬i kh«ng ®ñ!");
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedTotalPoint);
	AddItem(tPKMed[nMedIdx][2],tPKMed[nMedIdx][3],tPKMed[nMedIdx][4],nCount);
	Msg2Player("B¹n tiªu hao"..nNeedTotalPoint.." ®iÓm tÝch lòy chiÕn tr­êng")
	Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..szItemName);
end;
--===========================================================================================
function open_box()
	if GetTask(805) == 0 then
		Talk(1,"","Xin lçi! Ng­¬i ch­a cã r­¬ng chøa ®å.");
		return 0;
	end;
	OpenBox();
end;

function repair()
	local selTab = {
			"Söa miÔn phÝ (®é bÒn tr­íc ®©y =0)/repair1",
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

function nothing()

end;