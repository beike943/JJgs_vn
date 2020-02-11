Include("\\script\\online\\zgc_public_fun.lua")
function OnUse(goods_index)
	Say("Xin chän <color=yellow>m«n ph¸i<color> øng víi trang bÞ Tr­êng Kh«ng:",
		8,
		"Trang bÞ Tr­êng Kh«ng-ThiÕu L©m/#chongk_att_route(1)",
		"Trang bÞ Tr­êng Kh«ng-Vâ §ang/#chongk_att_route(2)",
		"Trang bÞ Tr­êng Kh«ng-Nga My/#chongk_att_route(3)",
		"Trang bÞ Tr­êng Kh«ng-C¸i Bang/#chongk_att_route(4)",
		"Trang bÞ Tr­êng Kh«ng-§­êng M«n/#chongk_att_route(5)",
		"Trang bÞ Tr­êng Kh«ng-D­¬ng M«n/#chongk_att_route(6)",
		"Trang bÞ Tr­êng Kh«ng-Ngò §éc/#chongk_att_route(7)",
		"Kh«ng cÇn/end_dialog"
	)	
end
function chongk_att_route(conf_diff)
	local way_name = {"ThiÕu L©m","Vâ §ang","Nga My","C¸i Bang","§­êng M«n","D­¬ng M«n","Ngò §éc"}
	local body_dialog = {}
	if conf_diff ~= 1 and conf_diff ~= 3 then
		body_dialog[1] = "Muèn"..way_name[conf_diff].."Trang bÞ Tr­êng Kh«ng-nam tiªu chuÈn/#changk_add(1,"..conf_diff..")"
		body_dialog[2] = "Muèn"..way_name[conf_diff].."Trang bÞ Tr­êng Kh«ng-nam kh«i ng«/#changk_add(2,"..conf_diff..")"
		body_dialog[3] = "Muèn"..way_name[conf_diff].."Trang bÞ Tr­êng Kh«ng-KiÒu n÷/#changk_add(4,"..conf_diff..")"
		body_dialog[4] = "Muèn"..way_name[conf_diff].."Trang bÞ Tr­êng Kh«ng-n÷ gîi c¶m/#changk_add(3,"..conf_diff..")"
		body_dialog[5] = "Ta muèn chän l¹i m«n ph¸i/#OnUse(0)"
		body_dialog[6] = "§Ó ta suy nghÜ l¹i/end_dialog"
	elseif conf_diff == 1 then
		body_dialog[1] = "Muèn"..way_name[conf_diff].."Trang bÞ Tr­êng Kh«ng-nam tiªu chuÈn/#changk_add(1,"..conf_diff..")"
		body_dialog[2] = "Muèn"..way_name[conf_diff].."Trang bÞ Tr­êng Kh«ng-nam kh«i ng«/#changk_add(2,"..conf_diff..")"
		body_dialog[3] = "Ta muèn chän l¹i m«n ph¸i/#OnUse(0)"
		body_dialog[4] = "§Ó ta suy nghÜ l¹i/end_dialog"	
	elseif conf_diff == 3 then
		body_dialog[1] = "Muèn"..way_name[conf_diff].."Trang bÞ Tr­êng Kh«ng-KiÒu n÷/#changk_add(2,"..conf_diff..")"
		body_dialog[2] = "Muèn"..way_name[conf_diff].."Trang bÞ Tr­êng Kh«ng-n÷ gîi c¶m/#changk_add(1,"..conf_diff..")"
		body_dialog[3] = "Ta muèn chän l¹i m«n ph¸i/#OnUse(0)"
		body_dialog[4] = "§Ó ta suy nghÜ l¹i/end_dialog"	
	end
	Say("M«n ph¸i b¹n chän lµ: <color=yellow>"..way_name[conf_diff].."<color>, kÕ ®Õn lµ <color=yellow>thÓ h×nh<color>:",
		getn(body_dialog),
		body_dialog
	)
end
function changk_add(body_diff,conf_diff)
	--ÅÐ¶ÏÊÇ·ñÓÐ³¤¿Õ°ü--
	if GetItemCount(2,0,596) == 0 then
		Talk(1,"end_dilog","Xin x¸c nhËn trªn ng­êi cã Tr­êng Kh«ng bao!")
		return
	end
	if Zgc_pub_goods_add_chk(2,100) ~= 1 then
		return
	end
	if DelItem(2,0,596,1) ~= 1 then
		Talk(1,"end_dilog","Xin x¸c nhËn trªn ng­êi cã Tr­êng Kh«ng bao!")
		return
	end
	--½áÊø--
	local changknog_att_table = {
		{{0,109,89,0,108,89},{0,109,90,0,108,90},},													--ÉÙÁÖ		
		{{0,109,91,0,108,91},{0,109,92,0,108,92},{0,109,93,0,108,93},{0,109,94,0,108,94},}, 		--Îäµ±
		{{0,109,95,0,108,95},{0,109,96,0,108,96},},													--¶ðÃ¼
		{{0,109,97,0,108,97},{0,109,98,0,108,98},{0,109,99,0,108,99},{0,109,100,0,108,100},},		--Ø¤°ï
		{{0,109,101,0,108,101},{0,109,102,0,108,102},{0,109,103,0,108,103},{0,109,104,0,108,104},},	--ÌÆÃÅ
		{{0,109,117,0,108,113},{0,109,118,0,108,114},{0,109,119,0,108,115},{0,109,120,0,108,116},},	--ÑîÃÅ
		{{0,109,129,0,108,127},{0,109,130,0,108,128},{0,109,131,0,108,129},{0,109,132,0,108,130},},	--Îå¶¾
	}
	local add_flag = 0 
	add_flag = AddItem(changknog_att_table[conf_diff][body_diff][1],changknog_att_table[conf_diff][body_diff][2],changknog_att_table[conf_diff][body_diff][3],1)
	if add_flag == 0 then
		WriteLog(GetName()..":§æi Tr­êng Kh«ng chiÕn gi¸p:"..conf_diff..":"..body_diff..":ThÊt b¹i!")
	else
		Msg2Player("Chóc mõng b¹n nhËn ®­îc Tr­êng Kh«ng chiÕn gi¸p.")
	end
	add_flag = AddItem(changknog_att_table[conf_diff][body_diff][4],changknog_att_table[conf_diff][body_diff][5],changknog_att_table[conf_diff][body_diff][6],1)
	if add_flag == 0 then
		WriteLog(GetName()..":§æi Tr­êng Kh«ng chiÕn kh«i:"..conf_diff..":"..body_diff..":ThÊt b¹i!")
	else
		Msg2Player("Chóc mõng b¹n nhËn ®­îc Tr­êng Kh«ng chiÕn kh«i.")
	end	
end