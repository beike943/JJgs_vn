-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������NPC�ʷ��Script
-- By StarryNight
-- 2006/03/22 PM 17:20

-- ֱ���Լ������İɣ�

-- ======================================================
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
		if g_akct_GetTaskStep(bTag) then
			return
		end
	
		local t_dialog = {
			"<color=green>����<color>: ���̸ս�����ԭ�������˺ܶ��вŻ�����ʿ���룬���ַǷ�.",
			"<color=green>����<color>: �����ŷ����ã���ɫ���ˣ��Ǹ���ϰ�赸��ι��С���ĺõط���.",
			}
		Talk(1,"",t_dialog[random(getn(t_dialog))])
end;		
