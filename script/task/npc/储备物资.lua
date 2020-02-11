Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

tbNpcIndex = {};

function main()
	local npcIndex = GetTargetNpc();
	for _,npcPoint in tbNpcIndex do
		if npcIndex == npcPoint then
			Talk(1,"","Bªn trong kh«ng cã g× c¶");
			return 0;
		end 
	end
	if getn(tbNpcIndex) >= 8 then
		for i = 1,getn(tbNpcIndex) do
			tremove(tbNpcIndex,i);
		end
		if getn(tbNpcIndex) ~= 0 then
			print("Error!need reload script.")
		end
	end
	if tGtTask:check_cur_task(68) == 1 and GetTask(Task_id_006) < 10 then		
		SetTask(Task_id_012,npcIndex);
		tinsert(tbNpcIndex,npcIndex);
		DoWait(24,25,5);
	else
		Talk(1,"","Bªn trong kh«ng cã g× c¶");
	end
end

function shaohui_wuzi()	
	if GetTask(Task_id_006) >= 10 then 
		return 0;
	end
	local npcIndex = GetTask(Task_id_012);
	if npcIndex == nil then 
		print("Error npcIndex"); 
		return 0;
  end
	SetTask(Task_id_006,GetTask(Task_id_006)+1);
	local tSex = gf_GetPlayerSexName();
	Msg2Player(tSex.."§· thµnh tiªu hñy thµnh c«ng lÇn thø"..GetTask(Task_id_006).."/10 vËt t­ trï bÞ");
end