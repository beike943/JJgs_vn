
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ͷ�ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================
Include("\\script\\global\\����������.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�
--Խ��09��11�»
Include("\\script\\online\\viet_event\\200911\\event_head.lua");

--�����ɵ��������

FN_SL 	= 1001; --����
FN_WD 	= 1002; --�䵱
FN_EM 	= 1003; --��ü
FN_GB 	= 1004; --ؤ��
FN_TM 	= 1005; --����
FN_YM 	= 1031; --������
FN_YMM  = 1032; --����Ů
FN_WP   = 1033; --�嶾

-- �Ӻ��������Ի�ȡ��������Ľ�չ�̶�
function FN_GetTaskState(fn)

	return GetTask(fn)

end

-- �Ӻ���������������������Ľ�չ�̶�
function FN_SetTaskState(fn, nValue)

	SetTask(fn, nValue)

end


-- �Ӻ�����ʹ���������չ����һ��
function FN_SetTaskAdd(fn)
	SetTask(fn, GetTask(fn) + 1)
	return
end


-- �Ӻ�����������չ�Ի� TALK �����Ĺ���
function TE_Talk(num,fun,szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg .. format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"
	dostring(szmsg)
end	

--Խ��09��11�»�����Ŷ���
function GiveItemToMaster(szHeader, nPlayerRoute)
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091113 and nDate < 091130 then
		if GetPlayerFaction() ~= nPlayerRoute then
			Talk(1, "", szHeader.."�㲻�Ǳ��ŵ���.");
			return 0;
		end
		if GetItemCount(2, 1, 30119) < 20 or GetItemCount(2, 1, 30120) < 20 then
			Talk(1, "", szHeader.."���ڿ���Ц��?  Kh�ng ph�i t�ng ta tr? v�i b�nh hay sao?")
			return 0;
		end
		if GetTask(VIET_0911_TASK_ZHANGMEN_DATE) >= nDate then
			if GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) >= 2 then
				Talk(1, "", szHeader.."C�c h? h�m nay t�ng ta b�nh v? tr? 2 l�n r�i, h�y ��i ng�y mai r�i ti�p t�c.");
				return 0;
			else
				if GetTime() - GetTask(VIET_0911_TASK_ZHANGMEN_TIME) < 3600 then
					Talk(1, "", szHeader.."Gi�n c�ch t�ng tr? v? b�nh c�n 60 ph�t, h�y ��i th�m ch�t x�u n�a nh?.");
					return 0;
				else
					if DelItem(2, 1, 30119, 20) == 1 and DelItem(2, 1, 30120, 20) == 1 then
						ModifyExp(3000000);
						SetTask(336, GetTask(336) + 20);
						SetTask(VIET_0911_TASK_ZHANGMEN_TIME, GetTime());
						SetTask(VIET_0911_TASK_ZHANGMEN_DATE, nDate);
						SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) + 1);
					end
				end
			end
		else
			SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, 0);
			if DelItem(2, 1, 30119, 20) == 1 and DelItem(2, 1, 30120, 20) == 1 then
				ModifyExp(3000000);
				SetTask(336, GetTask(336) + 20);
				SetTask(VIET_0911_TASK_ZHANGMEN_TIME, GetTime());
				SetTask(VIET_0911_TASK_ZHANGMEN_DATE, nDate);
				SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) + 1);
			end
		end
	end
end
--�ű����ܣ����ɼ���NPC��ع���ͳһ����
--������ƣ��峤
--���뿪�����峤
--����ʱ�䣺2009-3-14
--���ʷ��棺bugΪʲô�Ĳ��ꣿ����Ի���߻���bug֮ĸ�����ʣ�bug֮���أ�����Ի������Ī����
--��������
--====================���ɴ�����===============
g_szInfoHead = "<color=green>Ti�p d�n m�n ph�i<color>:";
MAX_SEL_PER_PAGE = 5;	--ÿҳ��������

TB_FACTION_PLACE =
{	--{��������,{�������Ϣ},ս��״̬,���ɱ��}
	{"Thi�u L�m",{204,1501,3328},1,1},
	{"V? �ang",{312,1713,3469},1,2},
	{"Nga My",{303,1603,3240},1,3},
	{"C�i Bang",{209,1528,3246},1,4},
	{"���ng M�n",{305,1532,2915},1,5},
	{"Thi�n Ba D��ng ph?",{219,1630,3274},1,6},
	{"Ng? ��c Gi�o",{407,1555,3282},1,7},
	{"C�n L�n",{509,1513,3285},0,8},
--	{"����",{152,1518,3078},0,9},
	{"Th�y Y�n",{404,1507,2788},0,10},
}
TB_FACTION_PLACE_INDEX = nil
function _init_TB_FACTION_PLACE_INDEX()
	if not TB_FACTION_PLACE_INDEX then
		TB_FACTION_PLACE_INDEX = {}
		for i=1,getn(TB_FACTION_PLACE) do
			local t = TB_FACTION_PLACE[i]
			TB_FACTION_PLACE_INDEX[t[4]] = t;
		end
		return 1
	end
end
--���ѡ��table
function get_list()
	local nFaction = GetPlayerFaction();
	local tbRetTb = {};
	local tbFactionTb = get_faction_list();
	local szFactionName = "";
	local nFactionIdx = 0;
	_init_TB_FACTION_PLACE_INDEX()
	for i=1,getn(tbFactionTb) do
		nFactionIdx = tbFactionTb[i];
		szFactionName = TB_FACTION_PLACE_INDEX[nFactionIdx][1];
		if i == 1 and nFaction ~= 0 then
			tinsert(tbRetTb,"����ʦ��("..szFactionName..")/#go_to_faction("..nFactionIdx..")");
		else
			tinsert(tbRetTb,szFactionName.."/#go_to_faction("..nFactionIdx..")");
		end;
	end;
	return tbRetTb;
end;
--������ɶ�Ӧ�ĶԻ�˳��table
function get_faction_list()
	local nFaction = GetPlayerFaction();
	local tbRetTb = {};	--����table
	local tbInitTb = {};	--����table�������м䴦��
	for i=1,getn(TB_FACTION_PLACE) do
		tbInitTb[i] = TB_FACTION_PLACE[i][4];
	end;
	if nFaction == 0 then
		tbRetTb = tbInitTb;
	else
		tinsert(tbRetTb,nFaction);	--�ȰѶ�Ӧ�����ɷŵ�һλ
		--tbInitTb[nFaction] = 0;	--��Ƕ�Ӧ�������ѷŽ�tbRetTb
		for i=1,getn(tbInitTb) do
			if tbInitTb[i] ~= nFaction then
				tinsert(tbRetTb,tbInitTb[i])	--��ʣ��δ�Ž�tbRetTb�����ɰ�˳��Ž�tbRetTb
			end;
		end;
	end;
	return tbRetTb;
end;
--�г��Ի�ѡ��
function list_content(nPageNum)
	local tbList = get_list();
	local nRecordCount = getn(tbList);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--���������������õ�ǰҳ���������ʾ��Ŀ����
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,format("\��һҳ/#list_content(%d)",nPageNum-1));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\��һҳ/#list_content(%d)",nPageNum+1));
	end;
	tinsert(selTab,"����ȡ����ǰ����������./cancel_faction");
	tinsert(selTab,"���Ķ�Ҳ��ȥ./no");
	Say(g_szInfoHead.." ���������ɸ�������, ����ȥ�ĸ�����?",getn(selTab),selTab);
end
function moneygo()
	--if GetLevel()<70 then
		--return 1
	--elseif GetCash()>=500 then
		--PrePay(500)
		--return 1
	--else
		--return 0
	--end
	
	return 1
end;
--ȥĿ�ĵ�
function go_to_faction(nFaction)
	if moneygo() == 1 then
		CleanInteractive();
		local nMapID,nMapX,nMapY = 0,0,0;
		local nFightState = 0;
		_init_TB_FACTION_PLACE_INDEX()
		nMapID = TB_FACTION_PLACE_INDEX[nFaction][2][1];
		nMapX = TB_FACTION_PLACE_INDEX[nFaction][2][2];
		nMapY = TB_FACTION_PLACE_INDEX[nFaction][2][3];
		nFightState = TB_FACTION_PLACE_INDEX[nFaction][3];
		NewWorld(nMapID,nMapX,nMapY);
		SetFightState(nFightState);
	else
		Talk(1,"",g_szInfoHead.."�������������㣬׬���㹻����������!")
	end;
end;

function no()
end;

--ȡ��Ŀǰ���������������
function cancel_faction()
	if GetPlayerFaction()~=0 then
		Say("���Ѽ�������, ���ѵ����˳�?",0);
	else
		Say("���������ѡ����������!",0);
		for i = 1,getn(TB_FACTION_TASKID_LIST) do
			SetTask(TB_FACTION_TASKID_LIST[i],0)
		end
		if GetNpcName(GetFollower())  == "С��" then
			KillFollower()
		end
	end
end
--====================��������������===========
TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018,1019}
TB_FACTION_INFO = {
	"Thi�u L�m","V? �ang","Nga My","C�i Bang","���ng M�n","D��ng M�n","Ng? ��c","C�n L�n","Minh gi�o","Th�y Y�n",
}
--��������
TB_ROUTE_INFO = {
	"Thi�u L�m","Thi�u T�c","Thi�n t�ng","V? t�ng","���ng M�n","���ng M�n","Nga My","Ph�t Gia","T�c gia","C�i Bang",
	"T�nh Y","? Y","V? �ang","��o Gia","T�c gia","D��ng M�n","Th��ng K?","Cung K?","Ng? ��c","T? hi�p",
	"C? s?","C�n L�n","Thi�n S?","Minh gi�o","Th�nh Chi�n","Tr�n Binh","Huy�t Nh�n","Th�y Y�n","V? Ti�n","Linh N?",
	"Nh�m Hi�p","Ki�m T�n"
}
--���ɶ�Ӧ������
TB_FACTION_ROUTE = {
	[8] = 22,
	[9] = 24,
	[10] = 28,
}
--������NPC
TB_FACTION_MASTER_NAME = {
	[8] = "Chu B�t Ho�c",
	[9] = "Ph��ng L�p",
	[10] = "S�i Ho�ng Nhi",
}
--ʦ���ظ�����Ķ�Ӧ�Ѷ�
TB_FACTION_TASK_DIFF = {
	[23] = TASK_ID_KUNLUN_TIANSHI,
	[25] = TASK_ID_MINGJIAO_SHENGZHAN,
	[26] = TASK_ID_MINGJIAO_ZHENBING,
	[27] = TASK_ID_MINGJIAO_XUEREN,
	[29] = TASK_ID_CUIYAN_WUXIAN,
	[30] = TASK_ID_CUIYAN_LINGNV,
}
--ʦ������NPC
TB_FACTION_BACK_NAME = {
	[8] = "Tr�n B�t Vi",
	[9] = "L�u Thanh Mi",
	[10] = "Th�ch B�o",
}
--�����������
TB_ROUTE_IN_INFO = {
	[23] = {
		npc_name = "T�n B�t Tri",
		bewrite = "���ؾ�ɫ���ģ�������������֮�أ������书ֻ����ʦ���ӣ�ͨ���ٻ�������������������ʩչ��Ӧ���ܣ���ϵ�����Կ��������Ϊ�������������˺�ƫ�ͣ���ϵ�������˺����Ϊ���������ϸߣ����ܶ���Ⱥ��Ϊ��������������<color=yellow>�ڹ�<color>Ϊ��, �������� <color=yellow>��<color>����������.",
		in_route_talk = "��������ʽ����Ϊ���ӣ�����������ϴ�裬��������Ի�ȥ��������.",
		skill = {{4,"Ki�m t�n c�ng b�nh th��ng"},{1017,"Th�i �t T�m Ph�p"},{1018,"L�i T?"},{1020,"Thi�n L�i Ph?"}},
		book={0,112,192,"Phong L�i Ch�u"},
		book_chip = {
			{2,95,1 ,"Phong L�i Ch�u T�n Quy�n-Th��ng"},
			{2,95,2 ,"Phong L�i Ch�u T�n Quy�n-Trung"},
			{2,95,3 ,"Phong L�i Ch�u T�n Quy�n-H?"},
		},
		equip = 2,
	},
	[25] = {
		npc_name = "L? Thi�n Nhu�n",
		bewrite = "����ʥ�𾭾ò�Ϣ�����ڵ��ӽ�Ϊ��Ѫ֮�ˣ������书ֻ��ʥս���ӣ�ͨ������Թ���񵶴�����ˣ�����ʱ�վ������ͣ�����ʱ����Ѷǽ���ڡ�����������<color=yellow>����<color>Ϊ��,������<color=yellow>��<color>����������������.",
		in_route_talk = "��������ʽ����Ϊ���ӣ�����������ϴ�裬��������Ի�ȥ��������.",
		skill = {{3,"�ao t�n c�ng b�nh th��ng"},{1053,"Th�nh H�a Kim L? C�ng"},{1054,"Th�nh H�a �ao Ph�p"}},
		book={0,112,193,"C�n Kh�n ��i Na Di T�m Ph�p"},
		book_chip = {
			{2,95,4 ,"C�n Kh�n ��i Na Di T�m Ph�p T�n Quy�n-Th��ng"},
			{2,95,5 ,"C�n Kh�n ��i Na Di T�m Ph�p T�n Quy�n-Trung"},
			{2,95,6 ,"C�n Kh�n ��i Na Di T�m Ph�p T�n Quy�n-H?"},
		},
		equip = 3,
	},
	[26] = {
		npc_name = "V��ng D�n",
		bewrite = "�������Ϊ���ڵľ���֮ʦ�����޲��ˣ�ս�޲�ʤ�������书ֻ��������ӣ���ͨ�����������֮����ȸ��ָ�����������Գ��ء����������Զ���Ϊ���������Ա�����������������.",
		in_route_talk = "��������ʽ����Ϊ���ӣ�����������ϴ�裬��������Ի�ȥ��������.",
		skill = {{8,"B�t t�n c�ng b�nh th��ng"},{1083,"Quang Minh Ti�u Dao C�ng"},{1084,"Quang Minh B�t Ph�p"}},
		book = {0,112,194,"Quang Minh Ng? H�nh L�nh"},
		book_chip = {
			{2,95,7 ,"Quang Minh Ng? H�nh L�nh T�n Quy�n-Th��ng"},
			{2,95,8 ,"Quang Minh Ng? H�nh L�nh T�n Quy�n-Trung"},
			{2,95,9 ,"Quang Minh Ng? H�nh L�nh T�n Quy�n-H?"},
			},
		equip = 9,
	},
	[27] = {
		npc_name = "T? H�nh Ph��ng",
		bewrite = "���̽��������ֵܣ����Ե�����Ҫ��֮�ֺݣ������书ֻ��Ѫ�˵��ӣ�������Ѹ�٣������ݣ������ϸ�����ʩ��ӡ�ǣ���ʩչ�书�µ������ء�����������<color=yellow>��<color>Ϊ������<color=yellow>����<color>����������������.",
		in_route_talk = "��������ʽ����Ϊ���ӣ�����������ϴ�裬��������Ի�ȥ��������.",
		skill = {{14,"Tr�o t�n c�ng b�nh th��ng"},{1131,"H�n B�ng T�m Ph�p"},{1132,"�o�n C�t Tr�o"}},
		book={0,112,195,"H�n B�ng Ng�ng Huy�t Ch?"},
		book_chip = {
			{2,95,10,"H�n B�ng Ng�ng Huy�t Ch? T�n Quy�n-Th��ng"},
			{2,95,11,"H�n B�ng Ng�ng Huy�t Ch? T�n Quy�n-Trung"},
			{2,95,12,"H�n B�ng Ng�ng Huy�t Ch? T�n Quy�n-H?"},
		},
		equip = 11,
	},
	[29] = {
		npc_name = "Chu T? V�n",
		bewrite = "�̷����ƽ�����Ӣ�ͷף�������ϰ�赸����֮���������书ֻ�����ɵ��ӣ��������������书ʩչ�������ƶ������˵��赸���������ˣ���������ѷ����ԡ�����������<color=yellow>��<color>Ϊ����������<color=yellow>��֦<color>����������������.",
		in_route_talk = "��������ʽ����Ϊ���ӣ�����������ϴ�裬��������Ի�ȥ��������.",
		skill = {{15,"Linh Chi c�ng k�ch"},{1165,"Phong V? T�m Ph�p"},{1166,"Kh�i V?"},{1167,"Linh Mi�u V�n"}},
		book={0,112,196,"Ph�ng Minh Ph?"},
		book_chip = {
			{2,95,13,"Ph�ng Minh Ph? T�n Quy�n-Th��ng"},
			{2,95,14,"Ph�ng Minh Ph? T�n Quy�n-Trung"},
			{2,95,15,"Ph�ng Minh Ph? T�n Quy�n-H?"},
		},
		equip = 13,
	},
	[30] = {
		npc_name = "H? Man Th�nh",
		bewrite = "ֻ��ӵ����Ȼ֮�ģ�������С�ܺ����ദ�������书ֻ����Ů���ӣ�ƽʱѧϰι��С�ܣ�������ɳ���ս��ʱ��ͨ�������ٻ�С��ʩչ�书�������ˡ�����������<color=yellow>����<color>Ϊ����������<color=yellow>����<color>����������������.",
		in_route_talk = "��������ʽ����Ϊ���ӣ�����������ϴ�裬��������Ի�ȥ��������.",
		skill = {{16,"S�o c�ng k�ch b�nh th��ng"},{1217,"B�ch Hoa Ng�c L? C�ng"},{1218,"Nu�i Ti�u �i�u"},{1219,"L�c Hoa Quy�t"}},
		book={0,112,197,"Hoa Ti�n T�m Kinh"},
		book_chip = {
			{2,95,16,"Hoa Ti�n T�m Kinh T�n Quy�n-Th��ng"},
			{2,95,17,"Hoa Ti�n T�m Kinh T�n Quy�n-Trung"},
			{2,95,18,"Hoa Ti�n T�m Kinh T�n Quy�n-H?"},
		},
		equip = 12,
	},
	[31] = {
		npc_name = "���ng L�ng Nguy�t",
		bewrite = "�� v�o h? ph�i ta th? ��ng c�u n? l? c? nh? ���ng, c? t�y ? h�nh t�u giang h?. Ch�y th? l? v? kh? s? tr��ng c�a ph�i ta.",
	},
	[32] = {
		npc_name = "V�n Hi H�a",
		bewrite = "�� v�o h? ph�i ta ph�i th? c? ��i mang ki�m tu h�nh, th�c thi ch�nh ngh�a. Ki�m l? v? kh? s? tr��ng c�a ph�i ta.",
	},
}
--ʦ����װ
TB_FACTION_SUIT_INFO = {
	[8] = 530,
	[9] = 534,
	[10] = 532,
}
--�����ؼ��һ�����
TB_BOOK_CHG_ODD = {
	{1,5,50},
	{5,3,60},
	{50,60,40},
}
--ʦ������
TB_FACTION_SALE = {
	[1]={44,66,67},
	[2]={46,78,79},
	[3]={45,72,73},
	[4]={47,75,76},
	[5]={48,69,70},
	[6]={51,81,82},
	[7]={55,84,85},
	[8]={112,113,114},
	[9]={116,117,118},
	[10]={120,121,122},
}
--ʦ������NPC
TB_FACTION_SALE_NPC = {
	[1] = "T? V�n ��t",
	[2] = "Y�n Nh?",
	[3] = "Di�p T? Hinh",
	[4] = "V�u Tri V?",
	[5] = "���ng Thi�n H�i",
	[6] = "D��ng B�i Phong",
	[7] = "Th�i Quang",
	[8] = "Mai B�t Dung",
	[9] = "Ph��ng Th�t Ph�t",
	[10] = "H? H�i",
}
--ʦ�Ŵ���
TB_TRANSPORT_INFO = {
	[8] = {"<color=green>V��ng B�t Ph�m<color>: ��y l? n�i C�n L�n, gi�o ph�i ta tuy ch�a thu nh�n �� t? nh�ng �� c? nhi�u v? l�m trung nh�n ��y tham quan, ng��i c? th? v�o ��y th�m th?. ���ng n�i hi�m tr?, n�u mu�n xu�ng n�i ta s? d�n ���ng.",
		{
			{300,1793,3544},
			{300,1755,3518},
			{300,1718,3534},
			{300,1744,3562},
		}
	},
	[9] = {"<color=green>Ph��ng B�ch Hoa<color>: N�i n�y nguy hi�m, �� ta ��a ng��i m�t �o�n.",
		{
			{100,1460,2967},
			{100,1429,3005},
			{100,1398,2979},
			{100,1433,2947},
		}
	},
	[10] = {"<color=green>X�o X�o<color>: Th�y Y�n phong c�nh h�u t�nh nh�ng d? l�c ���ng, �� ta ��a ng��i ra",
		{
			{400,1549,2968},
			{400,1512,2980},
			{400,1533,2993},
			{400,1541,2935},
		}
	}
}

--=============����ʦ�����=================
function master_main(faction_seq,route_seq)
	local t_dia_sel = {
--		"���Ӳΰ�ʦ��/#get_in_route("..faction_seq..","..route_seq..")",
		"ѧϰ"..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].."�书/#learn_skill("..route_seq..")",
--		"�ҵõ��˱��������ؼ��Ĳо�/#book_chg("..route_seq..")",
		"����к�/end_dialog",
	}
	local t_dia_show = {}
	local s_dia_main = "<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: "..TB_ROUTE_IN_INFO[route_seq].bewrite
	if GetPlayerFaction() == faction_seq then
		--if GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq] then
			--tinsert(t_dia_show,t_dia_sel[1])
		--elseif GetPlayerRoute()  == route_seq then
		if GetPlayerRoute()  == route_seq then
			tinsert(t_dia_show,t_dia_sel[1])
--			tinsert(t_dia_show,t_dia_sel[3])
			if route_seq == 30 then
				tinsert(t_dia_show,"H�y ��a ta 1 <D��ng �i�u Ch? Nam>/give_yangdiao_book"); --����ָ��
			end
			if route_seq == 32 then
				tinsert(t_dia_show,"Nh�n ���c nguy�n li�u luy�n ki�m/#show_equip_shop(80)"); --��������
			end
		end
	end
	tinsert(t_dia_show,t_dia_sel[2])
	if getn(t_dia_show) == 1 then
		Talk(1,"",s_dia_main)
	else
		Say(s_dia_main,
			getn(t_dia_show),
			t_dia_show
		)
	end
end
--��ʦ
function get_in_route(faction_seq,route_seq)
	Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: �� ho�n th�nh <color=yellow>nhi�m v? nh�p m�n<color>, ng��i �� l? ng��i c�a <color=yellow>"..TB_FACTION_INFO[faction_seq].."<color> ta, m�t khi �� v�o s? th? thay ��i, suy ngh? k? ch�a?",
		2,
		"���Ѿ����Ǻ���,�����Ϊʦ"..TB_ROUTE_INFO[route_seq].."/#in_route_dtm("..faction_seq..","..route_seq..")",
		"������һ��/end_dialog"
	)
end
function in_route_dtm(faction_seq,route_seq)
	if GetFreeItemRoom() < 8 then
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: N�u �� quy�t v�o m�n ph�i ta, b�n s? s? t�ng ng��i m�t v�i trang b? t�n th? xem nh? l? qu? nh�p m�n, h�y s�p x�p l�i h�nh trang r�i quay l�i nh�n (C�n <color=yellow>8<color> ? t�i tr�ng!)")
		return
	end
	if GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq] and GetPlayerFaction() == faction_seq then
		SetPlayerRoute(route_seq)
		ResetProperty()        --ϴǱ�ܵ�
		--����ѧϰ
		for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].skill) do
			LearnSkill(TB_ROUTE_IN_INFO[route_seq].skill[i][1])
			Msg2Player("C�c h? �� l�nh h�i"..TB_ROUTE_IN_INFO[route_seq].skill[i][2])
		end
		--ʦ�ŵ�һ��
		local particular_id = route_seq*1000+100+GetBody()
		local suit_id = TB_FACTION_SUIT_INFO[faction_seq] - 1+GetBody()
		if faction_seq == 10 then
			particular_id = particular_id - 2
			suit_id = suit_id - 2
		end
			--ʦ����װ����
			AddItem(0,108,suit_id,1)
			AddItem(0,109,suit_id,1)
			--ͷ
			AddItem(0,103,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--�·�
			AddItem(0,100,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--��װ
			AddItem(0,101,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--����
			AddItem(0,TB_ROUTE_IN_INFO[route_seq].equip,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--������
			if route_seq == 30 then
				AddItem(2,20,1,1)
			end
		--�Ի�
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: ".. TB_ROUTE_IN_INFO[route_seq].in_route_talk)
	else
		return
	end
end
--ѧϰ����
function learn_skill(route_seq)
	if GetPlayerRoute() ~= route_seq then	--���ɼ��
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ng��i kh�ng ph�i �� t? c�a ta, kh�ng th? h�c v? c�ng V? �ang ��o gia.")
	else
		Say(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: G�c ph�i bi�u t��ng v? c�ng hi�n # l? v? c�ng c? th? h�c, hi�n # l? c? th? t�ng c�p, nh�p chu�t tr�i v�o l? ���c.")
		AllowLearnSkill()
	end
end
--===============�����ؼ����===========
function book_chg(route_seq)
	if GetPlayerRoute() ~= route_seq then	--���ɼ��
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Kh�ng ph�i �� t? c�a ta, M�t T�ch Tr�n Ph�i n�y kh�ng th? giao cho ng��i!")
		return
	end
	--�о�ӵ�м��
	for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].book_chip) do
		if GetItemCount(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3]) > 0 then
			Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Th�t kh�ng ng? th�ng qua th? luy�n ng��i l�i c? th? nh�n ���c M�t T�ch Tr�n Ph�i, th�t x�ng ��ng l? �� �� c�a b�n m�n. Ta s? gi�p ng��i ��ng l�i th�nh m�t quy�n ho�n ch�nh nh�ng th�nh c�ng hay kh�ng c�n xem ng��i c? may m�n kh�ng.",
				2,
				"��a c�c trang s�ch cho s? ph?/#hand_up("..route_seq..")",
				"Kh�ng c�n ��u/no"
				)
			return
		end
	end
	Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ng��i ch�a t�ng nh�n ���c M�t T�ch V? C�ng T�n Quy�n n�o.")
end
function hand_up(route_seq)
	Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: N�u nh? ng��i c? �� 3 t�p th��ng, trung, h?, ta nh�t ��nh s? ��ng l�i th�nh m�t quy�n ho�n ch�nh.",
		2,
		"��ng ? ��ng s�ch/#hand_up_dtm("..route_seq..")",
		"Kh�ng c�n ��u/no"
	)
end
function hand_up_dtm(route_seq)
	--Я����ɾ���ж�
	local s_del_log = "[S? M�n M�t T�ch]  ng��i ch�i"..GetNpcName()
	local t_del_num = {}
	for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].book_chip) do
		if GetItemCount(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3]) > 0 then
			if DelItem(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3],1) == 1 then
				s_del_log = s_del_log.."H�y 1 quy�n"..TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][4].." th�nh c�ng "
				tinsert(t_del_num,i)
			end
		end
	end
	-- ɶҲû��
	if getn(t_del_num) == 0  then
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ng��i ch�a t�ng nh�n ���c M�t T�ch V? C�ng T�n Quy�n n�o.")
		return
	end
	--�����ж�
	local ran_num = random(100)
	local add_odds = 0
	if getn(t_del_num) == 3 then
		add_odds = 100
	else
		if getn(t_del_num) == 1 then
			tinsert(t_del_num,t_del_num[1])
		end
		add_odds = TB_BOOK_CHG_ODD[t_del_num[1]][t_del_num[2]]
	end
	-- ���Ը��ؼ�
	if (add_odds >= ran_num) then
		local add_flag = AddItem(TB_ROUTE_IN_INFO[route_seq].book[1],TB_ROUTE_IN_INFO[route_seq].book[2],TB_ROUTE_IN_INFO[route_seq].book[3], 1)
		if add_flag == 1 then
			Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ng��i th�t may m�n, M�t T�ch Tr�n Ph�i S? M�n xin giao cho ng��i!")
			Msg2Player("Nh�n ���c M�t T�ch Tr�n Ph�i S? M�n: "..TB_ROUTE_IN_INFO[route_seq].book[4].."1 quy�n!")
		else
			WriteLog(s_del_log.."	Th�m M�t T�ch S? M�n th�t b�i, ��nh d�u th�t b�i: "..add_flag)
		end
	else
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: ��i M�t T�ch Tr�n Ph�i th�t b�i!")
	end;
end
--�Ի�����
function end_dialog()
end
TB_FACTION_WEAPON_ROUTE = {
	[2] = {3,5},
	[3] = {8},
	[4] = {0},
	[6] = {1},
	[8] = {2},
	[9] = {10},
	[11] = {0},
	[12] = {5},
	[14] = {2},
	[15] = {9},
	[17] = {6},
	[18] = {4},
	[20] = {7},
	[21] = {11},
	[23] = {2},
	[29] = {13},
	[30] = {12},
}
--������ʦ�ŵ�һ������
function old_route_equip_add(route_seq)
	--�ж�������ȷ��
	if TB_FACTION_WEAPON_ROUTE[route_seq] == nil then
		return 0
	end
	--���ӿռ为�ؼ��
	if GetFreeItemRoom() <  8 then
		Talk(1,"","<color=green>"..GetTargetNpcName().."<color>: N�u �� quy�t v�o m�n ph�i ta, b�n s? s? t�ng ng��i m�t v�i trang b? t�n th? xem nh? l? qu? nh�p m�n, h�y s�p x�p l�i h�nh trang r�i quay l�i nh�n (C�n <color=yellow>8<color> ? t�i tr�ng!)")
		return 0
	end
	--����װ��
		--ʦ�ŵ�һ��
	local particular_id = route_seq*100+GetBody()
	if route_seq == 8 or route_seq == 9 then
		particular_id = particular_id - 2
	end
	--ͷ
	AddItem(0,103,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--�·�
	AddItem(0,100,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--��װ
	AddItem(0,101,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--����
	for i = 1,getn(TB_FACTION_WEAPON_ROUTE[route_seq]) do
		AddItem(0,TB_FACTION_WEAPON_ROUTE[route_seq][i],particular_id,1,1,-1,-1,-1,-1,-1,-1)
	end
	return 1
end
--=============ʦ���ظ��������==========
function ftask_repeat_main(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Tr? gian l? nhi�m v? c�a ch�nh ph�i ch�ng ta, ��ng l�m m�t thanh danh s? m�n!",
		4,
		"��ʼʦ������/#start_faction("..faction_seq..")",
		"ʦ�Ź��׶ȼ��./#check_query("..faction_seq..")",
		"ʦ������˵��./shimenshuoming",
		"   /#repair_faction("..faction_seq..")",
		"�뿪/end_dialog"
		)
end
function start_faction(faction_seq)
	if (GetPlayerFaction() ~= faction_seq) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Ch? c?"..TB_FACTION_INFO[faction_seq].."�� t? ta m�i ���c c�ng hi�n b�n m�n!")
		return
	elseif (GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq]) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: H�y b�i s? h�c ngh? tr��c, r�i h�y g�p s�c cho s? m�n!")
		return
	else
		task_main_entrance(TB_FACTION_TASK_DIFF[GetPlayerRoute()])
	end
end
function check_query(faction_seq)
	if (GetPlayerFaction() == 0) then	-- û�м�������
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Mu�n c�ng hi�n cho b�n m�n th? ph�i gia nh�p b�n m�n tr��c. Gia nh�p ph�i b�t k? c? th? t�i ��y nh�n nhi�m v?. Ho�n th�nh nhi�m v? s? m�n s? nh�n ���c �i�m s? m�n, t�ch l�y �� mua v�t ph�m b? truy�n c�a b�n m�n.")
		return
	end

	if (GetPlayerFaction() ~= faction_seq) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Kh�ng ph�i �� t? b�n m�n, h�y t�i m�n ph�i c�a m�nh xem �i�m s? m�n. F3 m? giao di�n xem �i�m s? m�n.")
		return
	end
	query_faction_contribute()
end
function shimenshuoming()
	Talk(1,"shuoming2","<color=green>Thuy�t minh �� c�ng hi�n s? m�n<color>: \n <color=yellow>�� c�ng hi�n s? m�n<color>: Th�ng qua vi�c ho�n th�nh nhi�m v? S? M�n ��t ��n m�t ��ng c�p nh�t ��nh, b�n c? th? nh�n ���c trang ph�c ho�c v? kh? c�a S? M�n. \n <color=yellow>Gi�i h�n �� c�ng hi�n s? m�n<color>: Hi�n nay �� c�ng hi�n S? M�n kh�ng b? h�n ch?, ch? c�n ho�n th�nh nhi�m v? th? c? th? n�ng cao �� c�ng hi�n. \n <color=yellow>S? ki�n V? L�m<color>: L�m xong nhi�m v? c? ��nh s? nh�n th�m m�t nhi�m v? ng�u nhi�n, ho�n th�nh s? nh�n ���c 50 �i�m c�ng hi�n S? m�n v? c? kh? n�ng nh�n ���c m�t t�ch s? m�n.")
end
function shuoming2()
	Talk(1,"","<color=green>Thuy�t minh �� c�ng hi�n s? m�n<color>: \n <color=yellow>Gi�i h�n ��ng c�p �� c�ng hi�n S? M�n<color>: ��ng c�p kh�c nhau th? �i�m t�ch l�y �� c�ng hi�n c�ng kh�ng gi�ng nhau. �� c�ng hi�n S? M�n c�ng cao c�ng n�ng cao ��ng c�p c�a m�nh, t? sau c�p 75 th? kh�ng c�n gi�i h�n �� c�ng hi�n n�a. \n <color=yellow>�i�m kinh nghi�m ng�u nhi�n<color>. L�m nhi�u nhi�m v? s? m�n �� c�ng hi�n c�ng cao �i�m kinh nghi�m c�ng nhi�u. �i�m c�ng hi�n <3000 <color=yellow>�i�m kinh nghi�m t��ng ��i<color>, >3000 <color=yellow>�i�m kinh nghi�m c�ng nhi�u<color>.")
end
-- �޸�ɱ�������޷���ɵ�bug
function repair_faction(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Do b�n r�n c�ng v? n�n qu�n chuy�n ng��i l�m nhi�m v?. ��y c�ng l? �� ng��i r�n luy�n! Gi? ta s? gi�p ng��i h�y nhi�m v? tr��c, nh�ng ph�i tr? 5 �i�m s? m�n, ��ng ? kh�ng?",
		2,
		"���c, ta ��ng ?/#cfm_repair_bug("..faction_seq..")",
		"�� ta ngh? c�ch kh�c/no")
end;

function cfm_repair_bug(faction_seq)
	RepairAllChainTask()
	Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: ���c, ta �� h�y gi�p ng��i r�i!")
end;
--==============�չ�����=================
cards_table = {
    {2, 0, 205},
    {2, 0, 206},
    {2, 0, 207},
    {2, 0, 208},
    {2, 0, 209},
    {2, 0, 350},
    {2, 0, 390},
    {2, 0, 787},
    {2, 0, 788},
    {2, 0, 789},
}
function practice_main(faction_seq)
		if GetPlayerFaction() == 0 then return 0; end
    if GetPlayerFaction() ~= faction_seq then
       Talk(1, "", "<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Th? ch? kh�ng ph�i"..TB_FACTION_INFO[faction_seq].."�� t? c�a ta, kh�ng th? tu luy�n ? b�n ph�i.");
    else
        if GetItemCount(cards_table[faction_seq][1],cards_table[faction_seq][2],cards_table[faction_seq][3]) >= 1 then  --ʦ������
            Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: V�o tu luy�n kh�ng?",
            	2,
            	"��ng/practice_start",
            	"Sai/no_practice");
        else
            Talk(1, "", "<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Ng��i kh�ng c?<color=yellow>"..TB_FACTION_INFO[faction_seq].."L�nh B�i S? M�n<color>, kh�ng th? b? quan tu luy�n.");
        end;
    end;
end
--=============ʦ������NPC�Ի�==========
function backdoor_main(faction_seq)

end
--=============ʦ������=================
function sale_main(faction_seq)
	local player_sex_name = "��i hi�p"
	if GetSex() == 2 then
		player_sex_name = "N? hi�p "
	end
	if GetPlayerFaction() == faction_seq  then
		Say("<color=green>"..TB_FACTION_SALE_NPC[faction_seq].."<color>: <color=yellow>"..player_sex_name.."<color>, c? th? gi�p ���c g? cho ng��i?",
		4,
		"������Щʦ����Ʒ./#Sale("..TB_FACTION_SALE[faction_seq][1]..")",
		"����˵ʦ����һ���ʺϽ������ֵ�������ף����뿴��./#Sale("..TB_FACTION_SALE[faction_seq][2]..")",
		"����˵ʦ����һ���ʺϽ������ֵ�������ף����뿴��/#Sale("..TB_FACTION_SALE[faction_seq][3]..")",
		"��ֻ����㿴��/end_dialog"
		)
	else
		Say("<color=green>"..TB_FACTION_SALE_NPC[faction_seq].."<color>:��ʲô�ܰﵽ��?",
		2,
		"������Щʦ����Ʒ./#Sale("..TB_FACTION_SALE[faction_seq][1]..")",
		"��ֻ����㿴��/end_dialog"
		)
	end
end
--==============ʦ�Ŵ���==================
function transport_main(faction_seq)
	Say(TB_TRANSPORT_INFO[faction_seq][1],
		2,
		"������һ�̰�/#trans_2_city("..faction_seq..")",
		"��Ҫ�����羰/end_dialog"
	)
end
--������
function trans_2_city(faction_seq)
	if(GetPKValue() >3 ) then
		Msg2Player("���˲����ڴ˳���.")
	end
    SetFightState(0)
	local n_ran_att = random(getn(TB_TRANSPORT_INFO[faction_seq][2]))
	NewWorld(TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][1],TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][2],TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][3])
end

function showlimit(n)	--ʦ��˵��
--	if n==1 then
--		Say(NPC_NAME.."����书�����ˣ�",0)
	if n==2 then
		Say("��ĵȼ����㣬��ӱ�Ŭ��!",0)
	elseif n==3 then
		Say("��ľ���ֵ���㣬��ӱ�Ŭ��!",0)
	elseif n==4 then
		Say("����������㣬�����Ŭ��!",0)
	elseif n==5 then
		Say("V? c�ng tr��c ��y vi s? d�y ng��i ch�a luy�n th�nh, kh�ng th? d�y ng��i v? c�ng m�i!",0)
	elseif n==6 then
		Say("����������㣬��׬��Ǯ����",0)
	else
	end
end;
function beforelearnskill(id)
end

function afterlearnskill(id)
	if id == 1032 or id == 1196 or id == 1066 or id == 1230 or id == 1213 or id == 1096 or id == 1883 or id == 1897 then
		if GetSkillLevel(id) == 1 then
			SetMomentum(10)
			RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh? s? ph? truy�n cho", "momentumtip")
		end
	end
end

function give_yangdiao_book()
	if BigGetItemCount(2,100,33) >= 1 then
		Talk(1,"","<color=green>H? Man Th�nh<color>: Ng��i �� c? 1 cu�n trong r��ng r�i th? ph�i?");
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","<color=green>H? Man Th�nh<color>: H�y s�p x�p l�i ? t�i.");
		return 0;
	end
	AddItem(2,100,33,1);
	Talk(1,"","<color=green>H? Man Th�nh<color>: ��y l? <D��ng �i�u Ch? Nam>, h�y gi? k?");
end
