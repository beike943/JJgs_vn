--filename:汴京雪仗传送人in.lua
--create date:2006-01-12
--author:yanjun
--describe:汴京雪仗传送人（进场）脚本
--modify:2007-01-04
--reason:雪仗改版
--mender:yanjun
Include("\\script\\online\\春节活动\\snowwar\\snowwar_worker_npc.lua");
g_sNpcName = "Xa phu_n衜 tuy誸";
g_CurMapID = 0;
function main()
	g_CurMapID = GetWorldPos();
	snowwar_enter_main();
end