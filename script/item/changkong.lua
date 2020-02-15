Include("\\script\\online\\zgc_public_fun.lua")
function OnUse(goods_index)
	Say("请选择<color=yellow>门派<color>外装:",
		8,
		"长空战甲-少林/#chongk_att_route(1)",
		"长空战甲-武当/#chongk_att_route(2)",
		"长空战甲-峨眉/#chongk_att_route(3)",
		"长空战甲-丐帮/#chongk_att_route(4)",
		"长空战甲-唐门/#chongk_att_route(5)",
		"长空战甲-杨门/#chongk_att_route(6)",
		"长空战甲-五毒/#chongk_att_route(7)",
		"不需要/end_dialog"
	)	
end
function chongk_att_route(conf_diff)
	local way_name = {"少林","武当","峨眉","丐帮","唐门","杨门","五毒"}
	local body_dialog = {}
	if conf_diff ~= 1 and conf_diff ~= 3 then
		body_dialog[1] = "想要"..way_name[conf_diff].."长空战甲-标准男/#changk_add(1,"..conf_diff..")"
		body_dialog[2] = "想要"..way_name[conf_diff].."长空战甲-魁梧男/#changk_add(2,"..conf_diff..")"
		body_dialog[3] = "想要"..way_name[conf_diff].."长空战甲-娇小女/#changk_add(4,"..conf_diff..")"
		body_dialog[4] = "想要"..way_name[conf_diff].."长空战甲-性感女/#changk_add(3,"..conf_diff..")"
		body_dialog[5] = "重新选择/#OnUse(0)"
		body_dialog[6] = "让我想想/end_dialog"
	elseif conf_diff == 1 then
		body_dialog[1] = "想要"..way_name[conf_diff].."长空战甲-标准男/#changk_add(1,"..conf_diff..")"
		body_dialog[2] = "想要"..way_name[conf_diff].."长空战甲-魁梧男/#changk_add(2,"..conf_diff..")"
		body_dialog[3] = "重新选择/#OnUse(0)"
		body_dialog[4] = "让我想想/end_dialog"	
	elseif conf_diff == 3 then
		body_dialog[1] = "想要"..way_name[conf_diff].."长空战甲-娇小女/#changk_add(2,"..conf_diff..")"
		body_dialog[2] = "想要"..way_name[conf_diff].."长空战甲-性感女/#changk_add(1,"..conf_diff..")"
		body_dialog[3] = "重新选择/#OnUse(0)"
		body_dialog[4] = "让我想想/end_dialog"	
	end
	Say("你选择的派别是: <color=yellow>"..way_name[conf_diff].."<color>,下一个是<color=yellow>体型<color>:",
		getn(body_dialog),
		body_dialog
	)
end
function changk_add(body_diff,conf_diff)
	--判断是否有长空包--
	if GetItemCount(2,0,596) == 0 then
		Talk(1,"end_dilog","请确认你是否有长空包")
		return
	end
	if Zgc_pub_goods_add_chk(2,100) ~= 1 then
		return
	end
	if DelItem(2,0,596,1) ~= 1 then
		Talk(1,"end_dilog","请确认你是否有长空包")
		return
	end
	--结束--
	local changknog_att_table = {
		{{0,109,89,0,108,89},{0,109,90,0,108,90},},													--少林		
		{{0,109,91,0,108,91},{0,109,92,0,108,92},{0,109,93,0,108,93},{0,109,94,0,108,94},}, 		--武当
		{{0,109,95,0,108,95},{0,109,96,0,108,96},},													--娥眉
		{{0,109,97,0,108,97},{0,109,98,0,108,98},{0,109,99,0,108,99},{0,109,100,0,108,100},},		--丐帮
		{{0,109,101,0,108,101},{0,109,102,0,108,102},{0,109,103,0,108,103},{0,109,104,0,108,104},},	--唐门
		{{0,109,117,0,108,113},{0,109,118,0,108,114},{0,109,119,0,108,115},{0,109,120,0,108,116},},	--杨门
		{{0,109,129,0,108,127},{0,109,130,0,108,128},{0,109,131,0,108,129},{0,109,132,0,108,130},},	--五毒
	}
	local add_flag = 0 
	add_flag = AddItem(changknog_att_table[conf_diff][body_diff][1],changknog_att_table[conf_diff][body_diff][2],changknog_att_table[conf_diff][body_diff][3],1)
	if add_flag == 0 then
		WriteLog(GetName()..":改变门派外装:"..conf_diff..":"..body_diff..":失败")
	else
		Msg2Player("恭喜你获得长空战甲")
	end
	add_flag = AddItem(changknog_att_table[conf_diff][body_diff][4],changknog_att_table[conf_diff][body_diff][5],changknog_att_table[conf_diff][body_diff][6],1)
	if add_flag == 0 then
		WriteLog(GetName()..":改变门派外装:"..conf_diff..":"..body_diff..":失败")
	else
		Msg2Player("恭喜你获得长空战盔")
	end	
end
