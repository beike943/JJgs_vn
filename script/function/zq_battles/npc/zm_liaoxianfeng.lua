Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if ZQ_GetCamp() ~= LIAO_ID then
		return 0;
	end
	if GetItemCount(ZQ_ITEM_FLAG[LIAO_ID][1], ZQ_ITEM_FLAG[LIAO_ID][2], ZQ_ITEM_FLAG[LIAO_ID][3]) < 1 then
		Say(format("<color=green>Tèng Tiªn Phong:<color> ThiÕu hiÖp trªn ng­êi kh«ng mang %s, kh«ng thÓ trë vÒ doanh tr¹i. C¸c h¹ x¸c ®Þnh b¾t ®Çu chiÕn ®Êu?", ZQ_ITEM_FLAG[LIAO_ID][4]), 2, "§ång ý/xianfeng_dialog", "Ra khi/do_nothing")
		return 0;
	end
	xianfeng_dialog();
end

function xianfeng_dialog()
	local tSay = {
		"Ta muèn lªn chiÕn tr­êng tõ cöa chÝnh/#fighting_start(1)",
		"Ta muèn lªn chiÕn tr­êng tõ cöa phô/#fighting_start(2)",
		"Ra khi/do_nothing",
	}
	Say("<color=green>Liªu Tiªn Phong:<color> thiÕu hiÖp muèn ®i ®¸nh 1 trËn hoµnh tr¸ng chø kh«ng?", getn(tSay), tSay);
end

function fighting_start(nIndex)
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	local tPos = {
		{1850, 3360},
		{1843, 3243},
	};
	if nIndex < 1 or nIndex > getn(tPos) then return 0; end
	SetPos(tPos[nIndex][1], tPos[nIndex][2]);
	RestoreAll();
	SetFightState(1);
end

function do_nothing()
	--do nothing()
end