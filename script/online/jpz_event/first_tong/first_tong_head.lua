--File name:	first_tong_head.lua
--Describe:		第一帮活动head文件
--Create Date:	2008-07-17
--Author:		chenbenqian

SWITCH_08_FIRSTTONG_JPZ	= 1;								--第一帮活动开关(1是打开0是关闭)

--ENTER_TIMES 	= 1											--总进入次数
START_TIME 		= 17.5*3600									--华山活动开始时间17:30
PREPARE_TIME 	= 1800										--华山活动准备时间30分钟(1800秒)
OPENBOX_TIME	= 240										--拾取宝箱动作时间4分钟(240秒)

--MAX_TEAM_NUM 	= 200										--能进入的最大队伍数

RELAY_DB_FIRSTTONG_JPZ 		= "first_tong_event_viet"		--共享数据库字符串标识
g_LogTitle 					= "[Ho箃 ng bang h閕 tinh anh] : "


--DATE_08_FIRSTTONG_JPZ_START	= 2008083000;					-- 第一帮活动开始日期
--DATE_08_FIRSTTONG_JPZ_END	= 2018083000;					-- 第一帮活动结束日期

--第一帮活动开放返回1，关闭返回0
function is_first_tong_jpz_open()
	return SWITCH_08_FIRSTTONG_JPZ
end
