Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
function OnUse()
	local selTab = {
				"Xem cßn bao nhiªu thêi gian míi cã thÓ n¾m tay/cïng c­ìi ngùa/see_time1",
				"Xem cßn bao nhiªu thêi gian cã thÓ nhËn phÇn th­ëng/see_time2",
				"Xem h«m bay cßn bao nhiªu c¬ héi nhËn thÎ/see_get_card_times",
				"Xem thêi gian sinh tån cßn l¹i cña thó c­ng/see_pet_life",
				"Bá thó c­ng/kill_follower",
				"§ãng h­íng dÉn/nothing",
				}
	if Is_HandInHand_Open() == 1 then
		Say("<color=green>H­íng dÉn ho¹t ®éng cóp thÕ giíi<color>: Ho¹t ®éng cóp thÕ giíi tiÕn hµnh tõ <color=yellow>ngµy 14 th¸ng 7 ®Õn 23 th¸ng 7<color>.",getn(selTab),selTab);
	else
		for i=1,3 do
			tremove(selTab,1);
		end;
		Say("<color=green>H­íng dÉn ho¹t ®éng cóp thÕ giíi<color>: Ho¹t ®éng cóp thÕ giíi ®· kÕt thóc, ng­êi ch¬i ch­a nhËn phËn th­ëng tr­íc ngµy <color=yellow>6 th¸ng 8<color> ®Õn gÆp §øa bÐ bªn c¹nh D· TÈu ®æi th­ëng.",getn(selTab),selTab);
	end;
end;

function see_pet_life()
	local nSecLeft = 60*60*24-GetTime()+GetTask(TASK_GOTPET_TIME);
	if GetTask(TASK_GOTPET_TIME) == 0 then
		Talk(1,"OnUse","HiÖn b¹n kh«ng cã thó c­ng");
	else
		if nSecLeft < 0 then
			nSecLeft = 0;
		end;
		local nHour = floor(nSecLeft/3600)
		local nMin = 0;
		local nSec = mod(nSecLeft,60);
		local sStrTime = "";
		if nHour >= 1 then
			sStrTime = nHour.."h ";
		end;
		nMin = floor((mod(nSecLeft,3600))/60);
		if nMin >= 1 then
			sStrTime = sStrTime..nMin.." phót "..nSec.." Gi©y ";
		else
			sStrTime = sStrTime..nSec.." Gi©y ";
		end;
		Talk(1,"OnUse","Thêi gian sinh tån thó c­ng cña b¹n cßn <color=yellow>"..sStrTime.."<color>.");
	end;
end;

function see_get_card_times()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_GOTCARD_DATE) < nDate then
		SetTask(TASK_GOTCARD_COUNT,0);
	end;
	Talk(1,"OnUse","H«m nay b¹n cßn cã thÓ nhËn thÎ <color=yellow>"..(6-GetTask(TASK_GOTCARD_COUNT)).."<color> lÇn");
end;

function see_time1()
	local nSecLeft = WAIT_TIME-GetTime()+GetTask(TASK_GOTCARD_TIME);
	if GetTask(TASK_GOTCARD_TIME) == 0 then
		Talk(1,"OnUse","Kho¶ng c¸ch thêi gian lÇn n¾m tay/cïng c­ìi ngùa kÕ tiÕp cßn <color=yellow>0 gi©y<color>");
	else
		if nSecLeft < 0 then
			nSecLeft = 0;
		end;
		local nMin = floor(nSecLeft/60);
		local nSec = mod(nSecLeft,60);
		local sStrTime = "";
		if nMin >= 1 then
			sStrTime = nMin.." phót "..nSec.." Gi©y ";
		else
			sStrTime = nSec.." Gi©y ";
		end;
		Talk(1,"OnUse","Thêi gian n¾m tay/cïng c­ìi thó kÕ tiÕp cßn <color=yellow>"..sStrTime.."<color>");
	end;
end;

function see_time2()
	local nSecLeft = GET_AWARD_INTERVAL-GetTime()+GetTask(TASK_GOTAWARD_TIME);
	if GetTask(TASK_GOTAWARD_TIME) == 0 then
		Talk(1,"OnUse","Thêi gian ®æi phÇn th­ëng kÕ tiÕp cßn <color=yellow>0<color> gi©y");
	else
		if nSecLeft < 0 then
			nSecLeft = 0;
		end;
		local nMin = floor(nSecLeft/60);
		local nSec = mod(nSecLeft,60);
		local sStrTime = "";
		if nMin >= 1 then
			sStrTime = nMin.." phót "..nSec.." Gi©y ";
		else
			sStrTime = nSec.." Gi©y ";
		end;
		Talk(1,"OnUse","Thêi gian ®Ó ®æi phÇn th­ëng kÕ tiÕp cßn <color=yellow>"..sStrTime.."<color>");
	end;
end;

function kill_follower()
	local selTab = {
				"§óng vËy! PhiÒn phøc qu¸!/confirm_to_kill",
				"Kh«ng cÇn/nothing",
				}
	Say("B¹n muèn bá thó c­ng?",getn(selTab),selTab);
end;

function confirm_to_kill()
	KillFollower();
	SetTask(TASK_GOTPET_TIME,0);
end;