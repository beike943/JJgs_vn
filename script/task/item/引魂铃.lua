Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
function OnUse(nIndex)
	if tGtTask:check_cur_task(12) ~= 1 or GetTask(Task_id_004) ~= 0 then
		return 0;
	end
	local nMap,nX,nY = GetWorldPos();
	if nMap ~= 507 then
		Talk(1,"","DÉn Hån Linh chØ ®­îc sö dông t¹i Long M«n TrÊn");
		return 0;
	end
	if DelItem(2,0,30010,1) == 1 and DelItem(2,0,30028,1) == 1 then
		SetTask(Task_id_004,2);
		local tSex = gf_GetPlayerSexName();
		Talk(1,"",tSex.."§· sö dông DÉn Hån Linh.");
		Msg2Player(tSex.."§· sö dông DÉn Hån Linh.");
	end
end