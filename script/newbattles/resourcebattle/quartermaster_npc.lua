--filename:quartermaster_npc.lua
--create date:2006-06-05
--describe:Á¸²ÝÕù¶áÕ½³¡ÖÐË«·½¾üÐè¹Ù½Å±¾
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

function main()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nNpcCamp = 0;
	if nNpcName == "Mé L­¬ng Quan-Tèng" then
		nNpcCamp = SONG_ID;
	else
		nNpcCamp = LIAO_ID;
	end;
	local nCamp = BT_GetCamp();
	if nCamp ~= nNpcCamp then	--Èç¹ûÍæ¼ÒµÄÕóÓªÓëNPCÕóÓª²»Í¬
		Talk(1,"","<color=green>"..nNpcName.."<color>: To gan! D¸m ®ét nhËp vµo ®©y, ng­êi ®©u b¾t lÊy h¾n!");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Say("<color=green>"..nNpcName.."<color>: L­¬ng th¶o ®· ®­îc chuyÓn ra tiÒn tuyÕn, lÇn sau nhí nép sím nhÐ!",0);
		return 0;
	end;
	local nResourceCount1 = GetItemCount(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4]);
	local nResourceCount2 = GetItemCount(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4]);
	local nResourceCount3 = GetItemCount(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4]);
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	local selTab = {
			"Nép toµn bé l­¬ng th¶o/#handin(0)",
			"Nép l­¬ng th¶o-s¬ cÊp ("..nResourceCount1.." phÇn)/#handin(1)",
			"Nép l­¬ng th¶o-trung cÊp ("..nResourceCount2.." phÇn)/#handin(2)",
			"Nép l­¬ng th¶o-cao cÊp ("..nResourceCount3.." phÇn)/#handin(3)",
			"Nép HuyÒn thiÕt kho¸ng th¹ch ("..nStoneCount.." phÇn)/handin_stone",
			"NhËn cuèc/get_hoe",
			"trë l¹i"..tCampNameZ[nCamp].."_hËu doanh/back_to_home",
			"§ang thu thËp/nothing"
			}
	Say("<color=green>"..nNpcName.."<color>: Thêi gian gÊp b¸ch, mau giao nép l­¬ng th¶o.",getn(selTab),selTab);
end;

function handin(nType)
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nResourceCount1 = GetItemCount(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4]);
	local nResourceCount2 = GetItemCount(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4]);
	local nResourceCount3 = GetItemCount(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4]);
	if nType == 0 and nResourceCount1 == 0 and nResourceCount2 == 0 and nResourceCount3 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ng­¬i kh«ng mang theo l­¬ng th¶o, mau ®i t×m vÒ ®©y!")
		return 0;
	elseif nType == 1 and nResourceCount1 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ng­¬i kh«ng mang theo l­¬ng th¶o-s¬ cÊp, mau ®i t×m vÒ ®©y!")
		return 0;
	elseif nType == 2 and nResourceCount2 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ng­¬i kh«ng mang theo l­¬ng th¶o-trung cÊp, mau ®i t×m vÒ ®©y!")
		return 0;
	elseif nType == 3 and nResourceCount3 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ng­¬i kh«ng mang theo l­¬ng th¶o-cao cÊp, mau ®i t×m vÒ ®©y!")
		return 0;
	end;
	local nBattlePoint = 0;	--Á¸²ÝÊýÁ¿
	local nPersonalPoint = 0;
	local str1 = "";
	local str2 = "";
	local str3 = "";
	if nType == 0 or nType == 1 then
		if nResourceCount1 > 0 then
			if DelItem(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4],nResourceCount1) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES1]*nResourceCount1;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES1]*nResourceCount1;
				str1 = "L­¬ng th¶o-s¬ cÊp"..nResourceCount1.." phÇn,";
			end;
		end;
	end;
	if nType == 0 or nType == 2 then
		if nResourceCount2 > 0 then
			if DelItem(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4],nResourceCount2) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES2]*nResourceCount2;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES2]*nResourceCount2;
				str2 = "L­¬ng th¶o-trung cÊp"..nResourceCount2.." phÇn,";
			end;
		end;
	end;
	if nType == 0 or nType == 3 then
		if nResourceCount3 > 0 then
			if DelItem(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4],nResourceCount3) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES3]*nResourceCount3;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES3]*nResourceCount3;
				str3 = "L­¬ng th¶o-cao cÊp"..nResourceCount3.." phÇn,";
			end;
		end;
	end;
	local nProbability = 0;
	if nBattlePoint <= 19 then
		nProbability = 0;
	elseif nBattlePoint <= 79 then
		nProbability = 1;				
	else
		nProbability = 3;
	end;
	BT_EmperorAward(nProbability);
	local nCamp = BT_GetCamp();
	Add_Resource(nCamp,nBattlePoint);
	BT_SetData(PT_HANDIN_RESOURCE,BT_GetData(PT_HANDIN_RESOURCE)+nBattlePoint);
	BT_AddPersonalPoint(nPersonalPoint);
	Talk(1,"","<color=green>"..nNpcName.."<color>: Giao nép <color=yellow>"..str1..str2..str3.."<color> gióp phe m×nh t¨ng thªm <color=yellow>"..nBattlePoint.."<color> ®iÓm tÝch lòy. Tæng ®iÓm tÝch lòy <color=yellow>"..Get_ResCount(nCamp).."<color>");
	Msg2MSGroup(MISSION_ID,GetName().." Nép"..str1..str2..str3.."§iÓm tÝch lòy hiÖn t¹i"..Get_ResCount(nCamp),nCamp);
end;

function get_hoe()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	if BigGetItemCount(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4]) > 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ng­¬i kh«ng ph¶i cã c©y"..tBattleItem[4][1].."? NÕu kh«ng mang theo th× mau chuÈn bÞ, thêi gian kh«ng cßn nhiÒu!");
	else
		if AddItem(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4],1) == 1 then
			BT_SetData(PTNC_USE_HOE_TIMES,0);
			Msg2Player("B¹n nhËn ®­îc 1 "..tBattleItem[4][1]);
		end;
	end;
end;

function back_to_home()
	local nCamp = BT_GetCamp()
	SetPos(ENTRANCE_POINT[nCamp][2],ENTRANCE_POINT[nCamp][3]);
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetFightState(0);
end;

function handin_stone()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	if nStoneCount <= 0 then
		Talk(1,"main","<color=green>"..nNpcName.."<color>: H×nh nh­ ng­¬i kh«ng mang theo HuyÒn thiÕt kho¸ng th¹ch.");
	else
		local selTab = {
					"Ta muèn nép/handin_stone_confirm",
					"ChuyÖn s¬n tÆc ®Çu môc/know_cateran_header",
					"Ta suy nghÜ l¹i!/main",
					}
		Say("<color=green>"..nNpcName.."<color>: Ng­¬i thËt sù muèn nép tÊt c¶ HuyÒn thiÕt kho¸ng th¹ch (<color=yellow>"..nStoneCount.."<color> viªn)? Nghe nãi s¬n tÆc ®Çu môc rÊt thÝch chóng.",getn(selTab),selTab);
	end;
end;

function handin_stone_confirm()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	local nBattlePoint = tBPEven[BP_RESOURCE_HAND_STONE_QM]*nStoneCount;
	if nStoneCount <= 0 then
		Talk(1,"main","<color=green>"..nNpcName.."<color>: H×nh nh­ ng­¬i kh«ng mang theo HuyÒn thiÕt kho¸ng th¹ch.");
	else
		if DelItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],nStoneCount) == 1 then
			BT_AddPersonalPoint(nBattlePoint);	--ÕâÀïÔÝ²»Ê¹ÓÃBT_AddBattleEvenPoint
			Add_Resource(nCamp,nBattlePoint);
		end;
	end;
end;

function know_cateran_header()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	Talk(1,"main","<color=green>"..nNpcName.."<color>: S¬n tÆc ®Çu môc còng ®ang thu thËp HuyÒn thiÕt kho¸ng th¹ch, nghe nãi y cã nhiÒu mãn b¶o bèi, b»ng h÷u cã thÓ ®Õn t×m h¾n.");
end;