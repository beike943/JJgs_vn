-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����NPC��ǰScript
-- By StarryNight
-- 2007/08/16 AM 10:24

-- ���������Ҫ��������

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
KUN_FACTION_ID = 8
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
NPC_NAME = "<color=green>M? B�t Ti�n<color>: "
PLAYER_NAME = "<color=green>Ng��i ch�i<color>: ���c, ta �i ngay!"
function main()
	if tGtTask:check_cur_task(139) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end	
	--һ������µĶԻ�
	strTalk = {
		{"V? c�ng c�a ta trong ph�i kh�ng nh�t c�ng nh? nh�ng tr��ng m�n s? huynh l�i kh�ng ch�u nh��ng ch�c tr��ng m�n, th�t l? t�c."},
		{"N�u ta ���c l�m tr��ng m�n nh�t ��nh C�n L�n s? th�nh v? l�m �� nh�t ��i ph�i."},
		}
	local i = random(1,getn(strTalk));
	local n_task_step = GetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID])
	if n_task_step == 0 or GetPlayerFaction() == KUN_FACTION_ID then
		TalkEx("",strTalk[i]);
		return
	elseif n_task_step == 1 then
		Talk(6,"",
			NPC_NAME.."�㲻�Ǳ��ŵ���, ������ʲô��?",
			PLAYER_NAME.."��Ҫ����<color=yellow>������<color>, ���Ž�������.",
			NPC_NAME.."�����<color=yellow>������<color>����ͨ���ҵĲ���.",
			PLAYER_NAME.."��Ҫ����ʲô�������Ͼ�ȥ.",
			NPC_NAME.."��,������������,�����ɽ<color=yellow>��Ԫ����<color> ��<color=yellow>����<color>��Ҫ���Ʒ�ӡ����Ԫ����, ��Ҫ<color=yellow>����<color> ά��, ��ȥ��<color=green>÷����<color> (195/204)��һ����ʦ��.",
			PLAYER_NAME.."�õģ������ȥ."
		)
		SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],2)
		TaskTip("��÷����ά����Ԫ����")
		Msg2Player("��÷����(195/204) ��1����ʦ����������ǰ (197/203)")
		return
	elseif n_task_step == 2 and GetItemCount(2,0,779) == 1 then
		Talk(5,"",
			NPC_NAME.."���c l�m, nh�ng ng��i ph�i qua kh�o nghi�m 2 c�a ta.",
			PLAYER_NAME.."��",
			NPC_NAME.."<color=yellow>C�n L�n Ph�i<color> ta v�n chia 2 h? Luy�n Thu�c v? Thi�n S?, ti�c r�ng Luy�n Thu�c �� th�t truy�n, ch? c�n l�i Thi�n S?, ng��i mu�n gia nh�p <color=yellow>C�n L�n Ph�i<color> th? ph�i c? can ��m ��i m�t v�i y�u ma.",
			NPC_NAME.."Ng��i mang Thi�n S? Ph? n�y t�i h�u s�n <color=yellow>Thi�n Nguy�n Th�p<color> t�m <color=yellow>Thi�n Nguy�n Ph�p Tr�n<color> (197/194), d�n <color=yellow>Thi�n S? Ph?<color> Th�ch Tr?, ph�p tr�n s? ti�p t�c phong �n <color=yellow>H? Y�u<color>. N�u l�m m�t Thi�n S? Ph?, c? th? t�m <color=green>Mai B�t Dung<color> l�y th�m.",
			PLAYER_NAME.."Ta s? l�m theo l�i d�n c�a ��o tr��ng."
		)
			TaskTip("ȥ��Ԫ�����ӡ����")
			Msg2Player("T�i h�u s�n Thi�n Nguy�n Th�p (197/194) d�ng Thi�n S? Ph? k�ch ho�t Thi�n Nguy�n Ph�p Tr�n phong �n H? Y�u")
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],3)
			return
	elseif n_task_step == 4 then
		Talk(2,"",
			NPC_NAME.."��ɫ���������, �����ɻ�ӭ�����, ����������ע��, ���Ի�ȥ������ʦ���� (199/200).",
			PLAYER_NAME.."лл����."
			)
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],5)
		TaskTip("��ȥ���ܲ���")
		Msg2Player("��ȥ���ܲ���(199/200)")
	else
		Talk(1,"",NPC_NAME.."�������ɱ���ͨ���ҵĲ���!")
		return
	end	
end
