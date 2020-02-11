-- Created by TuanNA5
-- 17-03-2010
-- Shop tiÒn lÎ

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");

BIG_EXCHANGE_RATE = 105
EXCHANGE_RATE = 20

tSliver_Exchange = {
	{40,"Thiªn Th¹ch Tinh Th¹ch",{2,1,1009,1},0},
	{5,"Th¸i H­ §a MËt Qu¶",{2,1,387,1},24*3600},
	{5,"Tµng KiÕm Anh Hïng ThiÕp",{2,0,31,1},24*3600},
	{20,"V¨n CÈm H¹p",{2,1,1100,1},30*24*3600},
	{160,"Qu©n C«ng Huy Hoµng",{2,1,9977,1,4},24*3600},
	{15,"Tö Kim Hång Bao (trèng)",{2,1,536,1},7*24*3600},
	{40,"Hoµng Kim §¹i Hång Bao (trèng)",{2,1,538,1},7*24*3600},	
}

tSilver_Exp = {
	{1,240},
	{5,1200},
	{25,6000},
	{125,30000},
	{250,62500},
	{500,125000},
	{1000,250000},
	{2000,500000},
}

function Check_Silver(nNumber)
	if GetItemCount(2,1,198) >= nNumber then
		return 1
	end
	return 0
end


