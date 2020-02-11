Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");

function main()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	if BT_GetTempData(PTT_LOCK) == 1 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Gi÷ lÊy m¹ng sèng råi míi nãi.");
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local sSubString = sNpcName;
	if sSubString == "N¹n d©n Tèng" and nCamp ~= SONG_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Hõ! DÉu ta cã bÞ giÕt còng kh«ng theo ng­¬i!");
		return 0;
	elseif sSubString == "N¹n d©n Liªu" and nCamp ~= LIAO_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Hõ! DÉu ta cã bÞ giÕt còng kh«ng theo ng­¬i!");
		return 0;
	end;
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ng­¬i ®­a b¹n ta ®Õn chç an toµn råi quay l¹i ®©y.");
		return 0;
	end
	local selTab = {
				"Mau theo ta ®Õn n¬i an toµn/get_refugee",
				"§îi gi©y l¸t sÏ cã ng­êi ®Õn cøu/nothing",
				}
	Say("<color=green>N¹n d©n<color>:"..tSexName[GetSex()].."Xin cøu m¹ng!",getn(selTab),selTab);
end;

function get_refugee()
	local nCamp = BT_GetCamp();
	if nCamp == 0 then
		return 0;
	end;
	local nNpcIndex = GetTargetNpc();
	local bExist = GetUnitCurStates(nNpcIndex,0);	--Ê¹ÓÃµÈ¼¶ÊôÐÔ×÷ÊÇ·ñ´æÔÚµÄ±ê¼Ç
	if bExist ~= 99 then
		return 0;
	end;
	SetNpcLifeTime(nNpcIndex,0);
	AddUnitStates(nNpcIndex,0,-bExist);	--ÖÃ0
	local tRefugeeModel = {"N¹n d©n-Tèng ®­îc cøu tho¸t","N¹n d©n-Liªu ®­îc cøu tho¸t"};
	local tRefugeeName = {"N¹n d©n Tèng","N¹n d©n Liªu"};
	SummonNpc(tRefugeeModel[nCamp],tRefugeeName[nCamp]);
	BT_AddBattleActivity(BA_MAIN_HELP_NATIVE);
	BT_SetTempData(PTT_FOLLOWER,1);
end;