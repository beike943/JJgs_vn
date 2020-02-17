-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����NPC�ܲ���Script
-- By StarryNight
-- 2007/08/16 AM 10:26

-- ������������Ρ���

-- ======================================================
--�峤2009-3-12����ʵ�ʶ���
--��û�����߻�NB
-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- ��������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>Chu B�t Ho�c<color>: "
PLAYER_NAME = "<color=green>Ng��i ch�i<color>: ���c, ta �i ngay!"
KUN_FACTION_ID = 8
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
KUN_FACTION_TASK_FINISH = 5

function main()
	local dia_sel = {
		"������Դ/say1_1",
		"�����书/say1_2",
		"��������/say1_3",
		--"��Ҫ��������/say1_4",
		"��ʼʦ������/#ftask_repeat_main(8)",
		--"�չ�����/#practice_main(8)",
		"�Ҵ�����ף����������ʦ/#faction_graduate(8)",
		"�����Ŵ���к�/end_dialog",
	}
	Say(NPC_NAME.."Ρ�����أ����������飬�������ɣ��������ԣ�Ϊ��������֮ʤ�ء�.",
		getn(dia_sel),dia_sel
	)
end;
--��������Դ
function say1_1()
	Talk(3,"main",
		NPC_NAME.."����Զ�����򣬺���ѡ����ԭ��������ʦ���޴ӿ�֤����������ԭ�����Զ�������������ɲ����˽⣬ֱ���������ɳ��˸����겻�������ˣ�����ԭ���ִ����˺պ����������ɲſ�ʼ������������ԭ�������ɵĹ�ע��.",
		NPC_NAME.."���ǣ�����һ���ᳫ������������Ϊ���ڲ�Ϊ��֪�ĵط�Ǳɫ���У����ɵ��Ӷ���Ϊ�����������ţ�ƮȻ���ɡ�����һ��������ħ��Ҫ������ɱ�����ڽ���ħ��ǳ�ִ��.",
		NPC_NAME.."������ԭ����ѡ�������ٵط�������ħ���֣�������˲��ٵ���Զ����ԭ���ؽ�����ħ�����Ǵ˾�ȴ���������ɵľ��裬���Ƕ������Ĵ��٣����Ա����������в�û�����ѡ�."
	)
end
--�������书
function say1_2()
	Talk(3,"main",
		NPC_NAME.."������ѧ����ʦ�ͽ�����������ʦ��ӳ���󣬷�Ϊ�磬�׶�����������������������׷���˽���һ����ѧ����֮����.",
		NPC_NAME.."��ʦ�׾����;��ף��˱���������ħ֮���������භ������Ϊ�˵ֿ�����֮����ҲҪ���������������������׻��У����������ָ��֣�Ҳ�����ǻ��������������䣬����������������С�������ѧ������������������Է���������Լ��������ٶȣ����ǲ�����ĥ�������Դ����磬�����֣�ʹ���޷��ж�������������齣�����������������������б��Ž��������Ž���Ʈ�ݣ������Կ������������ռ�Ȼ������齣�������ͣ��Ͻ��������˿ɵ��������������˽���һ֮������������ֺ�һ�����Խ���֮��������Ϊ����.",
		NPC_NAME.."����<color=yellow>��ʦ<color>�书��<color=yellow>�ز���<color>���ڣ���ѧ�����ɼ���<color=yellow>�޼����׾�<color>!����<color=yellow>����<color>�书��<color=yellow>���˺�<color>���ڣ���ѧ�����ɼ���<color=yellow>�򽣻�����<color>!"
	)
end
--��������
function say1_3()
	Talk(1,"",NPC_NAME.."�������书����<color=yellow>���в���Ů<color>, �ʱ���ֻ����<color=yellow>����<color>���룬ֻҪû����������Դ�ҷǱ�����ͽ��ɼ��롣.")
end
--��Ҫ��������
function say1_4()
	--�ȼ��ж�
	if GetLevel() <10 then
		Talk(1,"",NPC_NAME.."��ȼ�����<color=yellow>10<color>��.")
		return
	end
	--�Ա��ж�
	if GetSex() == 2 then
		Talk(1,"",NPC_NAME.."���Ų���Ů����.")
		return
	end
	--�����ж�
	if GetPlayerFaction() == KUN_FACTION_ID then
		Talk(1,"",NPC_NAME.."���Ѿ������ص��ӣ���ȥ����.")
		return
	end
	--�����ж�
	if GetPlayerFaction() > 0 then
		Talk(1,"",NPC_NAME.."���Ѽ�������.")
		return
	end
	--���������ж�
	local faction_task_step = without_other_factask(KUN_FACTION_ID) 
	if faction_task_step == -1 then
		Talk(1,"",NPC_NAME.."���ѽ�������������.")
		return
	elseif faction_task_step == KUN_FACTION_TASK_FINISH then
		Talk(4,"",
			NPC_NAME.."�����������ľ��������޵£���������.",
			PLAYER_NAME.."���ӽ��ǽ̻壬һ���ú�����.",
			NPC_NAME.."���� <color=green>�ز���<color> ѧϰ��<color=yellow>������ʦ<color> ��������.",
			PLAYER_NAME.."лл����."
		)
		TaskTip("�Ѿ�������������")
		SetPlayerFaction(8)
		SetPlayerRoute(22)
		SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],6)
	else
		if faction_task_step == 0 then
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],1)
			TaskTip("ȥ����ǰ���ܿ���")
			Msg2Player("ȥ����ǰ(197/203)���ܿ���")
		end
		Talk(1,"",NPC_NAME.."����ɽ������֮ʥ�أ�ÿ���˶�����뱾�š�<color=yellow>��ǰ<color>(197/203) ��Ӧ�������.")
	end
end
--������
function without_other_factask(faction_diff)
	for i = 1,getn(TB_FACTION_TASKID_LIST) do
		if i ~= faction_diff and GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
			return -1
		end
	end
	return GetTask(TB_FACTION_TASKID_LIST[faction_diff])
end
