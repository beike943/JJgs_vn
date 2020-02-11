--Äý±ù¾÷
Include("\\script\\lib\\define.lua");
function OnUse(index)
	if 0 == GetItemCount(2, 95, 1510) then
		return 0;
	end
	if CheckCanUse_1() ~= 1 then
		Talk(1, "", "VËt phÈm nµy chØ ®­îc dïng trong Th¸i NhÊt Th¸p!");
		return 0;
	end
	
	SetItemUseLapse(tonumber(index), 8*18);
	CastState("state_invincibility", 100, 4*18, 0, 10001);
end

function CheckCanUse_1()
	local nMap = GetMapTemplate(SubWorld);
	if 6075 ~= nMap or 1 == GetTask(TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN) then
		return 0;
	end
	
	if 5 ~= GetMissionV(99) then
		return 0;
	end
	
	return 1;
end
