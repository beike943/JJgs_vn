Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

tbNpcIdex = {}

function main()
	local npcIndex = GetTargetNpc();
	for _,npcPos in tbNpcIdex do
		if npcIndex == npcPos then
			Talk(1,"","<color=green>N«i øng:<color>t«i ®· ®­îc cøu råi");
			return 0;
		end
	end
	if tGtTask:check_cur_task(69) == 1 and GetTask(Task_id_007) < 8 then
--		local tbRand = {
--			"<color=green>ÄÚÓ¦£º<color>Îª½ÌÖ÷Ğ§ÃüÔÚËù²»´Ç",
--			"<color=green>ÄÚÓ¦£º<color>½ÌÖ÷»¹ºÃ°É£¡",
--			"<color=green>ÄÚÓ¦£º<color>½ÌÖ÷´ó¶÷ÓÀÊÀ²»Íü£¡",
--		}
		tinsert(tbNpcIdex,npcIndex);
--		local nTemp1 = mod(random(100),3) or 0;
--		Talk(1,"",tbRand[nTemp1 +1]);
		SetTask(Task_id_007,GetTask(Task_id_007)+1);
		local tSex = gf_GetPlayerSexName();
		Msg2Player(tSex..format("§· cøu ®­îc %d/8 néi øng.",GetTask(Task_id_007)));
		Talk(1,"",tSex..format("§· cøu ®­îc %d/8 néi øng.",GetTask(Task_id_007)));
		if getn(tbNpcIdex) >= 8 then
			for i = 1,getn(tbNpcIdex) do
				tremove(tbNpcIdex,i);
			end
			if getn(tbNpcIdex) ~= 0 then
				print("Error!need reload script.");
			end
		end
	else
		Talk(1,"","<color=green>Néi øng: <color>lÖnh cña gi¸o chñ quyÕt kh«ng tõ nan");
	end
end
