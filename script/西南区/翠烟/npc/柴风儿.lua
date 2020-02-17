Include("\\script\\task\\global_task\\gtask_head.lua");
function main()
	if tGtTask:check_cur_task(134) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end
	local t_dia_sel = {
		"<color=green>柴风儿<color>: 我母亲给我姐姐取名柴凰儿，给我取名柴凤儿，可我不喜欢这个名字，所以我改名为柴风儿.",
		"<color=green>柴风儿<color>: 我想做自由自在的风，像风一样无声无息地吹过，像风一样在这个世界任意穿梭."
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end
