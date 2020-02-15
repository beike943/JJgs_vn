-- �书����ʩ�Żص�ʱ���
--
-- ˵��: �Ӽ��ܿ�ʼʩ�ŵ����ܽ���,�Լ��ܿ�ʼʩ��ʱ��Ϊʱ��ο���,����ָ���ļ�����ָ��ʱ��,���ص��˽ű��е�ʱ����Ӧ����on_skill(nSkillID, nTime)
--
-- ��ʽ:
-- Skill_ID_Callback_Timetable =
-- {
--	{skill_id = skill_id_1, time_table = {time_1, time_2, time_3, ...}},
--	{skill_id = skill_id_2, time_table = {time_4, time_5, time_6, ...}},
--	...
-- }
-- ����,skill_id_n : ����ID. ��skills.txt���еĺϷ�ID.���Ƿ�,���ID���ܵĻص�ʱ������
--      time_n     : ָ���ص�ʱ��. ���༼��ʩ��ʱ�̵�ʱ��(��λ:֡).��ʱ��Ϊ����ԭʼ�ٶ��µ�ʱ��,�����ݼ���ʩ�ŵ�ʵ���ٶȽ��мӳ�.��Ϊ��,����
--
-- ����:
-- Skill_ID_Callback_Timetable =
-- {
--	{skill_id = 101, time_table = {10}},
--	{skill_id = 102, time_table = {11, 12}},
--	{skill_id = 103, time_table = {1, 2, 3}},
-- }

Skill_ID_Callback_Timetable =
{
}


-- �书����ʩ�Żص��¼���(����ID)
--
-- ˵��: �Ӽ��ܿ�ʼʩ�ŵ����ܽ���,����ָ���ļ�����ָ���ļ�������¼�����ʱ,���ص��˽ű�����Ӧ���¼���Ӧ����
--
-- ��ʽ:
-- Skill_ID_Callback_Events =
-- {
--	{skill_id = skill_id_1, time_table = {event_1, event_2, event_3, ...}},
--	{skill_id = skill_id_2, time_table = {event_4, event_5, event_6, ...}},
--	...
-- }
-- ����,skill_id_n : ����ID. ��skills.txt���еĺϷ�ID.���Ƿ�,���ID���ܵĻص��¼������
--      event_n    : ����ʩ������¼�.ö������:
--                   "burst"    : ���ܿ�ʼ����
--                   "effect"   : ����ʵ�ʴ���(���ӵ���Ч���������ӵ����ӵ�����)
--                   "ankylose" : ���ܿ�ʼ����
--                   "finish"   : ���ܽ���
--                   ��Ϊ�������б��е��¼�,����
--                   �ر��, "effect"(����ʵ�ʴ���), ��Ҫ����Ӽ��ܻ���ʽ���ܵĴ���.��Ϊ�Ӽ��ܻ���ʽ����û��"burst", "ankylose", "finish"�¼�
-- �¼�/��Ӧ���� ��Ӧ��ϵ:
--                   "burst"    : do_skill_burst(nSkillID, nSkillType)
--                   "effect"   : do_skill_effect(nSkillID, nSkillType)
--                   "ankylose" : do_skill_ankylose(nSkillID, nSkillType)
--                   "finish"   : do_skill_finish(nSkillID, nSkillType)
--
--
-- ����:
-- Skill_ID_Callback_Events =
-- {
--	{skill_id = 201, events = {"burst"}},
--	{skill_id = 202, events = {"effect", "ankylose"},
--	{skill_id = 203, events = {"ankylose", "finish"}},
-- }

Skill_ID_Callback_Events =
{
}


-- �书����ʩ�Żص��¼���(��������)
--
-- ˵��: �Ӽ��ܿ�ʼʩ�ŵ����ܽ���,����ָ�����͵ļ�����ָ���ļ�������¼�����ʱ,���ص��˽ű�����Ӧ���¼���Ӧ����
--
-- ��ʽ:
-- Skill_Type_Callback_Events =
-- {
--	{skill_type = skill_type_1, events = {event_1, event_2, event_3, ...}},
--	{skill_type = skill_type_2, events = {event_4, event_5, event_6, ...}},
--	...
-- }
-- ����,skill_type_n : ��������. ��Ӧ��skills.txt�м��ܵ�"Type".���Ƿ�,������ͼ��ܵĻص��¼������
--      event_n      : ����ʩ������¼�.ö������:
--                     "burst"    : ���ܿ�ʼ����
--                     "effect"   : ����ʵ�ʴ���(���ӵ���Ч���������ӵ����ӵ�����)
--                     "ankylose" : ���ܿ�ʼ����
--                     "finish"   : ���ܽ���
--                     ��Ϊ�������б��е��¼�,����
--                     �ر��, "effect"(����ʵ�ʴ���), ��Ҫ����Ӽ��ܻ���ʽ���ܵĴ���.��Ϊ�Ӽ��ܻ���ʽ����û��"burst", "ankylose", "finish"�¼�
-- �¼�/��Ӧ���� ��Ӧ��ϵ:
--                     "burst"    : do_skill_burst(nSkillID, nSkillType)
--                     "effect"   : do_skill_effect(nSkillID, nSkillType)
--                     "ankylose" : do_skill_ankylose(nSkillID, nSkillType)
--                     "finish"   : do_skill_finish(nSkillID, nSkillType)
--
-- ����:
-- Skill_Type_Callback_Events =
-- {
--	{skill_type = 1, events = {"burst", "effect"}},
--	{skill_type = 2, events = {"ankylose", "finish"}},
--	{skill_type = 3, events = {"burst", "effect", "ankylose", "finish"}},
-- }

Skill_Type_Callback_Events =
{
}


-- �书����ʩ�Żص��¼������
--
-- ˵��: ָ����Ӧ��"�书����ʩ�Żص��¼���(��������)"�е�ָ������������Ӧ���ų��ļ���
--
-- ��ʽ:
-- Skill_Type_Callback_Exceptions =
-- {
--	{skill_type = skill_type_1, exceptions = {skill_id_1, skill_id_2, skill_id_3, ...}},
--	{skill_type = skill_type_2, exceptions = {skill_id_4, skill_id_5, skill_id_6, ...}},
--	...
-- }
-- ����,skill_type_n : ��������. ��Ӧ��skills.txt�м��ܵ�"Type".���Ƿ�,������ͼ��ܵĻص��¼���������
--      skill_id_n   : ����ID. ��skills.txt���еĺϷ�ID, ��ID���ܵ�����Ӧ�ú�skill_type��ָ��������һ��.���Ƿ����ID���ܵ����Ͳ�Ϊskill_type��ָ��������,�����
--
-- ����:
-- Skill_Type_Callback_Exceptions =
-- {
--	{skill_type = 1, exceptions = {101, 102, 103}},
--	{skill_type = 2, exceptions = {104}},
--	{skill_type = 3, exceptions = {105, 106}},
-- }

Skill_Type_Callback_Exceptions =
{
}


--�书����ʩ��ʱ��ص�����
function on_skill(nSkillID, nTime)
end


--�书����ʩ�ŷ��лص�����
function do_skill_burst(nSkillID, nSkillType)
end


--�书����ʩ��Ч�����ֻص�����
function do_skill_effect(nSkillID, nSkillType)
end


--�书����ʩ�����лص�����
function do_skill_ankylose(nSkillID, nSkillType)
end


--�书����ʩ�Ž����ص�����
function do_skill_finish(nSkillID, nSkillType)
end