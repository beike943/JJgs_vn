Include("\\script\\task\\global_task\\gtask_head.lua");
function main()
	if tGtTask:check_cur_task(134) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end
	local t_dia_sel = {
		"<color=green>����<color>: ��ĸ�׸��ҽ��ȡ����˶�������ȡ�����������Ҳ�ϲ��������֣������Ҹ���Ϊ����.",
		"<color=green>����<color>: �������������ڵķ磬���һ��������Ϣ�ش��������һ��������������⴩��."
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end
