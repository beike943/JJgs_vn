-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ü��������ɶ������ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_em.lua");


function main()

local nTaskValue = FN_GetTaskState(FN_EM);
local strMain = {

		"�Һÿɰ�...�٣� ������!",
		"�ð�!"

	}
	if (nTaskValue==3) then
		TE_Talk(getn(strMain), "task_010", strMain);
		return
	else
		Say("û���߿�...!",0);
	end

end