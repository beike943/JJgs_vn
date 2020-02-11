Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
function main()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local sSubString = sNpcName;
	if sSubString == "N¹n d©n Tèng" and nCamp ~= SONG_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: ë ®©y kh«ng nhËn n¹n d©n phe ®Þch");
		return 0;
	elseif sSubString == "N¹n d©n Liªu" and nCamp ~= LIAO_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: ë ®©y kh«ng nhËn n¹n d©n phe ®Þch");
		return 0;
	end;
	local selTab = {
				"§· lµm phiÒn/give_refugee",
				"§Ó khi kh¸c vËy/nothing",
				}
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		Say("<color=green>"..sNpcName.."<color>: "..tSexName[GetSex()].." vÊt v¶ qu¸! Giao h¾n cho ta lµ ®­îc!",getn(selTab),selTab);
	else
		Talk(1,"","<color=green>"..sNpcName.."<color>: ChiÕn tranh th­êng gieo t¹i häa cho b¸ t¸nh v« téi"..tSexName[GetSex()].."NÕu gÆp n¹n d©n, nhê b»ng h÷u dÉn hä ®Õn, ta sÏ s¾p xÕp!");
	end;
end;

function give_refugee()
	local nCamp = BT_GetCamp();
	SetMissionV(MV_HELP_REFUGEE_COUNT_SONG+nCamp-1,GetMissionV(MV_HELP_REFUGEE_COUNT_SONG+nCamp-1)+1)
	KillFollower();
	BT_SetTempData(PTT_FOLLOWER,0);
	BT_SetData(PT_HELP_REFUGEE,BT_GetData(PT_HELP_REFUGEE)+1);
	BT_SetData(PTNC_HELP_REFUGEE,BT_GetData(PTNC_HELP_REFUGEE)+1);
	BT_EmperorAward(1);
	BT_AddBattleEvenPoint(BP_MAIN_HELP_REFUGEE);
	local nPoint = BT_GetBattleEvenPoint(BP_MAIN_HELP_REFUGEE);
	BT_AddMissionPoint(nCamp,nPoint);
	Create_Refugee(nCamp,1);	
	Judge_State_By_Point(nCamp);
end;