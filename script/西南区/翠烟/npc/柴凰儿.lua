-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������NPC�ʷ��Script
-- By StarryNight
-- 2006/03/22 PM 17:20

-- ֱ���Լ������İɣ�

--�峤��2009-03-09 ����ʵ�ʵĶ���
--��ǰ���Ǽ����߻���һ����������������ʱ���Ľ����������һ���߻��㼸��������
-- ======================================================
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- ��������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")
TASKID_CUIYAN_JOIN_TASK = 1019
TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018}
NPC_NAME = "<color=green>S�i Ho�ng Nhi<color>: "
function main()
	local t_dia_sel = {
		"������Դ/say1_1",
		"�����书/say1_2",
		"��������/say1_3",
		--"��Ҫ�������/say1_4",
		"��ʼʦ������/#ftask_repeat_main(10)",
		--"�չ�����/#practice_main(10)",
		"�Ҵ�����ף����������ʦ/#faction_graduate(10)",
		"�����Ŵ���к�/end_dialog"
	}
		Say(NPC_NAME.."���̷����ã��ļ��紺���仨�ͷף������Ƽ�����������.",
			getn(t_dia_sel),
			t_dia_sel
			)
end;	
function say1_1()
	Talk(4,"main",
		NPC_NAME.."��������䣬��»ɽ���ң���ͨ��������ˮ�����֮�С�����Ϊ���Ա��γ��˸���������壬���о����ɡ��������ɵĴ����š�ս���и������ɶ��������ѣ����ų����в����Եý�Ϊ���������л��������ռ䣬���������Խ��Խ���������ʿ���롣.",
		NPC_NAME.."���ǣ�ֱ��������Ī������ѧ��ŵĳ��֣��Ž����Ž�����������������ɡ��������ý������书����Ϊ���ڿ���С������Ů�;�ͨ�赸�����������������Ǻ�ʢ������ף�ò���Ϊ�����̶��桱�������������ţ�������������䣬һԹ֮�����������е����Ե��ӣ�ֻ����Ů�԰������¡�.",
		NPC_NAME.."��ĩ��ս�����𣬸������ɵ������ų��Ż��ҵľ��������������������ż�����ԭ���Դ���������ɽ�����Թ���������ο��Ų�˶�һֱ�������Ĵ��٣����Ա��Ŷ���ԭ�������ɰ����������ֵ���̬�ȣ��ڽ����в�û���ѡ�.",
		NPC_NAME.."����֮��������������������Ϊ�书������ף�������Ϊ���е��ӽ�Ϊ��ɫ��Ů�����������������ĳ���ס���������󡣶����и�λ�ٻ�ʹ����Ϊ��ɫ��֮��ɫ�����������߻����������㡣."
		)
end
function say1_2()
	Talk(3,"main",
		NPC_NAME.."�����书��Ϊ�������ɣ��ֱ�Ϊ <color=yellow>����<color> �� <color=yellow>��Ů��<color>. <color=yellow>ĵ��ʹ������<color>���� <color=yellow>����<color>�书����<color=yellow>��Ů<color> �书���� <color=yellow>Ǿޱʹ������<color>���ڡ�.",
		"<color=yellow>����<color>ֻ�б�����������֮�ĵ�Ů�Ӳſ����С���ʱ�й�����һ�轣�����ķ�������֮�裬�˶���֮�裬���Լ�֮�����������У�����������֮�Ķ�������֮���߹�֮����ս��ȫʧ��.Ϊ�������󣬲�֪���δ�������֮Ϊ���߹�֮����ս����ţ���֮�����ˣ���ѧ�����ɼ���<color=yellow>�����<color>.",
		"<color=yellow>��Ů<color>ֻ�б���������Ȼ֮�ĵ�Ů�Ӳſ����С���Ů�����������ϣ�����ĵ�С������ϲ������������Ϊ�飬ս��ʱҲ����СƷ�˵С�����������ϣ�������Զ����������������֮���ж����������˰�ʹ�ø����ֶΣ��ǵ��˺��ˣ������ʹ�õ��书������ʹ�˻��ԣ��������򲻿�С�ӣ���ѧ�������书<color=yellow>��β���ɾ�<color>."
		)
end
function say1_3()
	Talk(1,"main","<color=green>��˶�<color>:���º�ۼ��ˣ�ֻҪ�ĵ��������Ǳ�����ͽ���Կɼ��뱾�ţ��������ɺ����ڵ���Ҫ���మ������������������������.")
end 
function say1_4()
	local task_step = GetTask(TASKID_CUIYAN_JOIN_TASK)
	local s_dia_no_pass = ""
	if GetSex() == 1 then
		 s_dia_no_pass = " ���Ų���<color=red>�е���<color>."
	elseif GetLevel() < 10 then
		s_dia_no_pass = "��ȼ�����<color=red>10<color>��."
	elseif GetPlayerRoute() ~= 0 then
		s_dia_no_pass =  "N? hi�p �� c? <color=red>m�n ph�i<color>, ta kh�ng th? nh�n."
	elseif GetPlayerFaction() == 8 then
		s_dia_no_pass =  "���Ѽ��������, ��ȥ����."
	else
		for i = 1,getn(TB_FACTION_TASKID_LIST) do
			if GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
				s_dia_no_pass = "���Ѽ�������."
				break
			end
		end
	end
	if task_step == 5 then
		Talk(2,"",
			NPC_NAME.."û��, ����<color=green>�ٺϻ�<color> �Ҷ��������, ��������ɲ��������Խ���.",
			NPC_NAME.."�����书���� <color=yellow>��������<color>��<color=yellow>��Ů<color>, ������ҵ�<color=yellow>������<color> ��<color=yellow>������<color>ѧϰ, <color=yellow>������<color>�ó��赸; <color=yellow>������<color> ��ʹ<color=yellow>С��<color> ."
		)
		SetPlayerFaction(10)
		SetPlayerRoute(28)
		TaskTip("���Ѿ����������")
		SetTask(TASKID_CUIYAN_JOIN_TASK,6)
	elseif s_dia_no_pass == "" then
		if task_step == 0 then
			Talk(2,"",NPC_NAME.."Giai nh�n tuy�t s�c trong thi�n h? c? th? gia nh�p b�n m�n, nh�ng ng��i ph�i b�i ki�n hai v? <color=green>B�ch Hoa S?<color> trong Th�y Y�n M�n, h? s? n�i ng��i bi�t n�n l�m th? n�o, h�y t�m <color=green>M�u ��n S? Chu T? V�n<color> (190/170) tr��c.","<color=green>Ng��i ch�i<color>: ���c, ta �i ngay!")
			TaskTip("��������")
			Msg2Player("��������(190/170)")
			SetTask(TASKID_CUIYAN_JOIN_TASK,1)
			return
		else
			Talk(1,"",NPC_NAME.."Mu�n v�o b�n m�n h�y t�m <color=yellow>Chu T? V�n<color> ho�c <color=yellow>H? Man Th�nh<color>!")
			return
		end
	else
		Talk(1,"",NPC_NAME..s_dia_no_pass)
		return
	end
end

function say1_5()
	
end

function say1_6()
	
end

