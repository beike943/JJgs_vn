-- 武功技能施放回调时间表
--
-- 说明: 从技能开始施放到技能结束,以技能开始施放时刻为时间参考点,表中指定的技能在指定时刻,将回调此脚本中的时间响应函数on_skill(nSkillID, nTime)
--
-- 格式:
-- Skill_ID_Callback_Timetable =
-- {
--	{skill_id = skill_id_1, time_table = {time_1, time_2, time_3, ...}},
--	{skill_id = skill_id_2, time_table = {time_4, time_5, time_6, ...}},
--	...
-- }
-- 其中,skill_id_n : 技能ID. 即skills.txt中有的合法ID.若非法,则此ID技能的回调时间表忽略
--      time_n     : 指定回调时刻. 即距技能施放时刻的时间(单位:帧).此时间为技能原始速度下的时间,将根据技能施放的实际速度进行加成.若为负,忽略
--
-- 例如:
-- Skill_ID_Callback_Timetable =
-- {
--	{skill_id = 101, time_table = {10}},
--	{skill_id = 102, time_table = {11, 12}},
--	{skill_id = 103, time_table = {1, 2, 3}},
-- }

Skill_ID_Callback_Timetable =
{
}


-- 武功技能施放回调事件表(技能ID)
--
-- 说明: 从技能开始施放到技能结束,表中指定的技能在指定的技能相关事件发生时,将回调此脚本中相应的事件响应函数
--
-- 格式:
-- Skill_ID_Callback_Events =
-- {
--	{skill_id = skill_id_1, time_table = {event_1, event_2, event_3, ...}},
--	{skill_id = skill_id_2, time_table = {event_4, event_5, event_6, ...}},
--	...
-- }
-- 其中,skill_id_n : 技能ID. 即skills.txt中有的合法ID.若非法,则此ID技能的回调事件表忽略
--      event_n    : 技能施放相关事件.枚举如下:
--                   "burst"    : 技能开始发招
--                   "effect"   : 技能实际触发(非子弹技效果触发或子弹技子弹生成)
--                   "ankylose" : 技能开始收招
--                   "finish"   : 技能结束
--                   若为非以上列表中的事件,忽略
--                   特别地, "effect"(技能实际触发), 主要针对子技能或招式技能的触发.因为子技能或招式技能没有"burst", "ankylose", "finish"事件
-- 事件/响应函数 对应关系:
--                   "burst"    : do_skill_burst(nSkillID, nSkillType)
--                   "effect"   : do_skill_effect(nSkillID, nSkillType)
--                   "ankylose" : do_skill_ankylose(nSkillID, nSkillType)
--                   "finish"   : do_skill_finish(nSkillID, nSkillType)
--
--
-- 例如:
-- Skill_ID_Callback_Events =
-- {
--	{skill_id = 201, events = {"burst"}},
--	{skill_id = 202, events = {"effect", "ankylose"},
--	{skill_id = 203, events = {"ankylose", "finish"}},
-- }

Skill_ID_Callback_Events =
{
}


-- 武功技能施放回调事件表(技能类型)
--
-- 说明: 从技能开始施放到技能结束,表中指定类型的技能在指定的技能相关事件发生时,将回调此脚本中相应的事件响应函数
--
-- 格式:
-- Skill_Type_Callback_Events =
-- {
--	{skill_type = skill_type_1, events = {event_1, event_2, event_3, ...}},
--	{skill_type = skill_type_2, events = {event_4, event_5, event_6, ...}},
--	...
-- }
-- 其中,skill_type_n : 技能类型. 对应于skills.txt中技能的"Type".若非法,则此类型技能的回调事件表忽略
--      event_n      : 技能施放相关事件.枚举如下:
--                     "burst"    : 技能开始发招
--                     "effect"   : 技能实际触发(非子弹技效果触发或子弹技子弹生成)
--                     "ankylose" : 技能开始收招
--                     "finish"   : 技能结束
--                     若为非以上列表中的事件,忽略
--                     特别地, "effect"(技能实际触发), 主要针对子技能或招式技能的触发.因为子技能或招式技能没有"burst", "ankylose", "finish"事件
-- 事件/响应函数 对应关系:
--                     "burst"    : do_skill_burst(nSkillID, nSkillType)
--                     "effect"   : do_skill_effect(nSkillID, nSkillType)
--                     "ankylose" : do_skill_ankylose(nSkillID, nSkillType)
--                     "finish"   : do_skill_finish(nSkillID, nSkillType)
--
-- 例如:
-- Skill_Type_Callback_Events =
-- {
--	{skill_type = 1, events = {"burst", "effect"}},
--	{skill_type = 2, events = {"ankylose", "finish"}},
--	{skill_type = 3, events = {"burst", "effect", "ankylose", "finish"}},
-- }

Skill_Type_Callback_Events =
{
}


-- 武功技能施放回调事件例外表
--
-- 说明: 指定对应于"武功技能施放回调事件表(技能类型)"中的指定技能类型中应该排除的技能
--
-- 格式:
-- Skill_Type_Callback_Exceptions =
-- {
--	{skill_type = skill_type_1, exceptions = {skill_id_1, skill_id_2, skill_id_3, ...}},
--	{skill_type = skill_type_2, exceptions = {skill_id_4, skill_id_5, skill_id_6, ...}},
--	...
-- }
-- 其中,skill_type_n : 技能类型. 对应于skills.txt中技能的"Type".若非法,则此类型技能的回调事件例外表忽略
--      skill_id_n   : 技能ID. 即skills.txt中有的合法ID, 此ID技能的类型应该和skill_type所指定的类型一致.若非法或此ID技能的类型不为skill_type所指定的类型,则忽略
--
-- 例如:
-- Skill_Type_Callback_Exceptions =
-- {
--	{skill_type = 1, exceptions = {101, 102, 103}},
--	{skill_type = 2, exceptions = {104}},
--	{skill_type = 3, exceptions = {105, 106}},
-- }

Skill_Type_Callback_Exceptions =
{
}


--武功技能施放时间回调函数
function on_skill(nSkillID, nTime)
end


--武功技能施放发招回调函数
function do_skill_burst(nSkillID, nSkillType)
end


--武功技能施放效果出现回调函数
function do_skill_effect(nSkillID, nSkillType)
end


--武功技能施放收招回调函数
function do_skill_ankylose(nSkillID, nSkillType)
end


--武功技能施放结束回调函数
function do_skill_finish(nSkillID, nSkillType)
end