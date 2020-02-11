Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
function main()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local sSubString = sNpcName;
	if sSubString == "N¹n d©n Tèng" and nCamp ~= SONG_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ng­êi ®©u, b¾t lÊy chóng!");
		return 0;
	elseif sSubString == "N¹n d©n Liªu" and nCamp ~= LIAO_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ng­êi ®©u, b¾t lÊy chóng!");
		return 0;
	end;
	local selTab = {
				"T×m ng­êi kh¸c gióp ®i/get_assistant",
				"Ta kh«ng tin/nothing",
				}
	Say("<color=green>"..sNpcName.."<color>: CÇn gióp ®ì kh«ng? Ta cã thÓ gióp ng­¬i t×m vµi tr¸ng sÜ kháe m¹nh.",getn(selTab),selTab);
end;

function get_assistant()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	Talk(1,"","<color=green>"..sNpcName.."<color>: Xin lçi! LÝnh ®¸nh thuª ch­a ®­îc triÖu tËp");
end;