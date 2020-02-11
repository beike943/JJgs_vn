Include("\\script\\online_activites\\2010_04\\activities_01\\head.lua");
function donate_vicbox()
    --init
    local nDate = tonumber(date("%Y%m%d"));
    if GetTask(VET_201004_01_TASK_DATE_DONATE_VICBOX) < nDate then
        SetTask(VET_201004_01_TASK_TIMES_DONATE_VICBOX, 0);
        SetTask(VET_201004_01_TASK_DATE_DONATE_VICBOX, nDate);
    end
    local szSay = VET_201004_01_STR_NPC_NAME..VET_201004_01_TB_STRINGS[3][1];
    local tbSays = {
        [1] = VET_201004_01_TB_STRINGS[3][2].."/vet_2010_01_donate_vicbox",
        [2] = VET_201004_01_TB_STRINGS[3][3].."/gf_DoNothing",
    };
    Say(szSay, getn(tbSays), tbSays);
end

function vet_2010_01_donate_vicbox()
	--负重检测
	if gf_Judge_Room_Weight(2, 10, "") == 0 then
	  return 0;
	end
	--次数判断
	if GetTask(VET_201004_01_TASK_TIMES_DONATE_VICBOX) >= 3 then
	  Talk(1, "", VET_201004_01_TB_STRINGS[3][5]);
	  return 0;
	end
	if DEBUG ~= 1 then                      --非DEBUG进入
	--检测胜利礼盒个数
	if GetItemCount(VET_201004_01_TB_ITEMS[1][2], VET_201004_01_TB_ITEMS[1][3], VET_201004_01_TB_ITEMS[1][4]) < 10 then
	    Talk(1, "", VET_201004_01_TB_STRINGS[3][6]);
	    return 0;
	end
	--删除胜利之盒
	if DelItem(VET_201004_01_TB_ITEMS[1][2], VET_201004_01_TB_ITEMS[1][3], VET_201004_01_TB_ITEMS[1][4], 10) == 0 then
	    Talk(1, "", VET_201004_01_TB_STRINGS[3][6]);
	    return 0;
	end
	end
	SetTask(VET_201004_01_TASK_TIMES_DONATE_VICBOX, GetTask(VET_201004_01_TASK_TIMES_DONATE_VICBOX) + 1);
	--给经验
	ModifyExp(2000000);
	Msg2Player(1, "", format(VET_201004_01_TB_STRINGS[1][8], 2000000));
	--给物品
	gf_EventGiveRandAward(VET_201004_01_TB_AWARD_DONATE_VICBOX, 100, 1, VET_201004_01_STR_LOG_TITLE, VET_201004_01_TB_LOG_ACTION_LIST[7]);
	
	return 1;
end