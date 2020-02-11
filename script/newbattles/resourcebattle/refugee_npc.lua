Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Say("Ta thËt ®¸ng th­¬ng lµm sao!",0);
		return 0;
	end;
	local selTab = {
				"ThËt téi nghiÖp, tÆng h¾n 10 bao l­¬ng th¶o/#give_resource(1,10)",
				"ThËt téi nghiÖp, tÆng h¾n 10 bao l­¬ng th¶o-trung cÊp/#give_resource(2,10)",
				"ThËt téi nghiÖp, tÆng h¾n 10 bao l­¬ng th¶o-cao cÊp/#give_resource(3,10)",
				"Kh«ng gióp ®ì/nothing",
				}
	Say("MÊy ngµy tr­íc quan binh kh«ng biÕt tõ ®©u Ëp ®Õn ®ßi b¾t thñ lÜnh thæ d©n, chóng ®Ëp ph¸, lôc xÐt tõng c¨n nhµ, ta ph¶i trèn ch¹y ®Õn ®©y.",getn(selTab),selTab);
end;

function give_resource(nType,nCount)
	local nRand = random(1,100);
	local nTime = GetTime();
	if DelItem(tBattleItem[nType][2],tBattleItem[nType][3],tBattleItem[nType][4],nCount) == 1 then	
		if nType == 1 then
			if nRand <= 30 then
				BT_AddBattleEvenPoint(BP_RESOURCE_HAND_IN_RES1_REFUGEE);
			elseif nRand <= 50 then
				clear_all_state();
				BT_SetData(PT_1MIN2TYPE,nTime);--Íæ¼ÒÔÚÒ»·ÖÖÓÄÚËùÍÚµÄËùÓÐÁ¸²Ý¶¼ÊÇÖÐ¼¶Á¸²Ý
				Msg2Player("B¹n sÏ ®µo ®­îc l­¬ng th¶o-trung cÊp trong 1 phót, xin tranh thñ!");
			elseif nRand <= 60 then
				clear_all_state();
				BT_SetData(PT_1MINDOUBLE,nTime);--Íæ¼ÒÔÚÒ»·ÖÖÓÄÚËùÍÚµÄËùÓÐÁ¸²ÝÊýÁ¿x2
				Msg2Player("B¹n sÏ ®µo ®­îc sè l­îng l­¬ng th¶o gÊp ®«i trong 1 phót, xin tranh thñ!");
			else	
				AddItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],1);
				Msg2Player("B¹n nhËn ®­îc 1 HuyÒn thiÕt kho¸ng th¹ch");
			end;
		elseif nType == 2 then
			if nRand <= 20 then
				BT_AddBattleEvenPoint(BP_RESOURCE_HAND_IN_RES2_REFUGEE);
			elseif nRand <= 50 then
				clear_all_state();
				BT_SetData(PT_1MINDOUBLE,nTime);--Íæ¼ÒÔÚÒ»·ÖÖÓÄÚËùÍÚµÄËùÓÐÁ¸²ÝÊýÁ¿x2
				Msg2Player("B¹n sÏ ®µo ®­îc sè l­îng l­¬ng th¶o gÊp ®«i trong 1 phót, xin tranh thñ!");
			elseif nRand <= 60 then
				clear_all_state();
				BT_SetData(PT_1MIN3TYPE,nTime);--Íæ¼ÒÔÚÒ»·ÖÖÓÄÚËùÍÚµÄËùÓÐÁ¸²Ý¶¼ÊÇ¸ß¼¶Á¸²Ý
				Msg2Player("B¹n sÏ ®µo ®­îc l­¬ng th¶o-cao cÊp trong 1 phót, xin tranh thñ!");
			else
				AddItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],2);
				Msg2Player("B¹n nhËn ®­îc 2 viªn HuyÒn thiÕt kho¸ng th¹ch");
			end;
		elseif nType == 3 then
			if nRand <= 15 then
				BT_AddBattleEvenPoint(BP_RESOURCE_HAND_IN_RES3_REFUGEE);
			elseif nRand <= 50 then
				clear_all_state();
				BT_SetData(PT_3MINDOUBLE,nTime);--Íæ¼ÒÔÚÈý·ÖÖÓÄÚËùÍÚµÄËùÓÐÁ¸²ÝÊýÁ¿x2
				Msg2Player("B¹n sÏ ®µo ®­îc sè l­îng l­¬ng th¶o gÊp ®«i trong 3 phót, xin tranh thñ!");
			elseif nRand <= 60 then
				clear_all_state();
				BT_SetData(PT_1MIN3TYPEDOUBLE,nTime);--Íæ¼ÒÔÚÒ»·ÖÖÓÄÚËùÍÚµÄËùÓÐÁ¸²Ý¶¼ÊÇ¸ß¼¶Á¸²ÝÇÒËùÍÚÁ¸²ÝÊýÁ¿x2
				Msg2Player("B¹n sÏ ®µo ®­îc sè l­îng l­¬ng th¶o-cao cÊp gÊp ®«i trong 1 phót, xin tranh thñ!");
			else
				AddItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],6);
				Msg2Player("B¹n nhËn ®­îc 6 viªn HuyÒn thiÕt kho¸ng th¹ch");
			end;	
		end;
	else
		Talk(1,"main","Hõ! Sè l­¬ng th¶o cña ng­¬i mang theo kh«ng ®ñ!");
	end;
end;

function clear_all_state()
	for i=PT_1MIN2TYPE,PT_3MINDOUBLE do
		BT_SetData(i,0);
	end;
end;