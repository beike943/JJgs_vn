Include("\\script\\task\\global_task\\gtask_head.lua");
function main()
	if tGtTask:check_cur_task(134) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end
	local t_dia_sel = {
		"<color=green>Sµi Phong Nhi<color>: MÑ ta ®Æt tªn cho tû tû lµ Hoµng Nhi, cßn ta lµ Ph­îng Nhi, nh­ng ta kh«ng thÝch tªn nµy nªn ®æi thµnh Phong Nhi.",
		"<color=green>Sµi Phong Nhi<color>: Ta muèn lµm c¬n giã tù do tù t¹i, thæi nhÌ nhÑ, nhën nh¬ n¬i thÕ gian nµy."
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end
