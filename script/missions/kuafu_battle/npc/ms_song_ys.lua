Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function main()
	local tSay = {}
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		tinsert(tSay, "Mêi Tiªn Phong xuÊt trËn/order_xianfeng");
		tinsert(tSay, "Mêi §« Thèng phßng thñ/order_duwei");
	end
	local tTemp = {
		[ALL_ID] = "Trung lËp",
		[CampOne_ID] = "Tèng qu©n chiÕm lÜnh",
		[CampTwo_ID] = "Liªu qu©n chiÕm lÜnh",	
	}
	--tinsert(tSay, "\nÀë¿ªÕ½³¡/del_player_from_mision")
	tinsert(tSay, "\nTa suy nghÜ l¹i/nothing")
	Say("<color=green>Tèng Nguyªn So¸i: <color>"..
		format("Cuéc chiÕn v« cïng khèc liÖt, c¸c h¹ muèn hç trî g×? Ng­êi cã qu©n hµm <color=%s>T­íng Qu©n<color> trë lªn cã thÓ ®iÒu binh khiÓn t­íng. HiÖn t¹i t×nh h×nh c¸c trËn nh·n chiÕm lÜnh nh­ sau:", (abs(GetTask(704)) >= KF_TITIL_JIANGJUN and "green") or "red")..
		format("C¶nh M«n (%s), DiÖt M«n (%s), Sinh M«n (%s), Tö M«n (%s), §¹i TrËn Kú (%s).", tTemp[GetMissionV(MV_BATTLE_FLAG_JM)], 
		tTemp[GetMissionV(MV_BATTLE_FLAG_MM)], tTemp[GetMissionV(MV_BATTLE_FLAG_SM)], tTemp[GetMissionV(MV_BATTLE_FLAG_SI)], tTemp[GetMissionV(MV_BATTLE_FLAG_DA)]),
		getn(tSay), tSay)
end

function check_title()
	if abs(GetTask(704)) >= KF_TITIL_JIANGJUN then
		return 1;
	else
		return 0;
	end
end

function order_xianfeng()
	if check_title() == 0 then
		Talk(1,"","Qu©n hµm cña c¸c h¹ kh«ng ®ñ! Kh«ng thÓ triÖu håi.")
		return 0;
	end
	local nCamp = KF_GetCamp();
	local tSay = KF_GetSayTale(nCamp, 1, 0);
	local nTime = KF_GetXianfengCD();
	local nCount = 1;
	if nTime > 0 then 
		nCount = 0;
	end
	Say("<color=green>Tèng Nguyªn So¸i: <color>"..
		format("Tiªn Phong cã thÓ ph¸i ®Õn mét trËn nh·n bÊt kú, bÊt kÓ trËn nh·n ®ã cã ph¶i lµ phe ta chiÕm lÜnh hay kh«ng. HiÖn t¹i phe ta chØ cã %d vÞ tiªn phong, cã %d phót thêi gian gäi l¹i", nCount, ceil(nTime/60)), getn(tSay), tSay);
end

function order_duwei()
	if check_title() == 0 then
		Talk(1,"","Qu©n hµm cña c¸c h¹ kh«ng ®ñ! Kh«ng thÓ triÖu håi.")
		return 0;
	end
	local nCamp = KF_GetCamp();
	local tSay = KF_GetSayTale(nCamp, 2, 1);
	local nTime = KF_GetDuWeiCD();
	local nCount = 1;
	if nTime > 0 then 
		nCount = 0;
	end
	Say("<color=green>Tèng Nguyªn So¸i: <color>"..
		format("§« óy chØ cã thÓ ®Õn TrËn Kú phe ta ®· chiÕm. HiÖn cã %d §« óy, thêi gian chê %d phót", nCount, ceil(nTime/60)), getn(tSay), tSay);
end

function del_player_from_mision()
	local nCamp = KF_GetCamp();
	DelMSPlayer(KF_MISSION_ID, nCamp);
end