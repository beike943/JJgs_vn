-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");

Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szThisFile = "\\script\\������\\����\\npc\\�²�Ϊ.lua";	--Ĭ��ֵ
g_szInforHeader = "<color=green>Tr�n B�t Vi<color>:";	--Ĭ��ֵ
g_nBackRoomEntryType = 1;	--������ͣ������֡�1��ʾ��ʦ�������룬2��ʾ�ӵ��ߴ�����

function main()
	--backroom_main();
	
	--һ������µĶԻ�
	strTalk = {
		{"�²�Ϊ: �ϴ����ǳ�������̫��Ȥ��."},
		{"����֮�������֮�����徲��Ȼ����Ϊ���ޡ�̫�����������Ȼ������еĵط�����ǰ����ϲ��������ε������������Թ������ĵ�����΢����������������������ǰȥ�ؾ�����Ҫ��ǰ����������̣�ǧ��Ҫ³ç���°���. "},
		{"V�n phi�u t�n th�ng h? ca dao, ti�u di�u t? ph��ng?"},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
end