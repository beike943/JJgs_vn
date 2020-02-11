--½Å±¾Ãû³Æ£º°ï»á¹Ø¿¨½±Àø½Å±¾
--½Å±¾¹¦ÄÜ:°ï»á¹Ø¿¨½±Àø°üµÄ¸øÓÚºÍ¿ªÆô½Å±¾
--²ß»®ÈË£ººî¶Ü
--´úÂë¿ªÈËÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-07-26
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
--¶Ô»°Ôö¼ÓÏä×Ó
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı

Tb_equip_mertiral = 		--²ÄÁÏÁĞ±í
	{
		{"Tö Quang LiÖt DiÖm CÈm",2,0,735},
		{"Tö Quang Kú L©n Vò",2,0,736},
		{"Tö Quang Kim ThiÒn Ti",2,0,737},
		{"M¶nh TiÖt Hoµnh Thó",2,0,738},
		{"Th­îng Cæ Kú L©n HuyÕt",2,0,739},
	}
Tb_prize_toll = 
	{	--²ÄÁÏĞòºÅ¡¢¼¸ÂÊ(¹²Èı¸öÎïÆ·)
		{{{100,1}},	{{50,1}},			{{50,1}}},
		{{{100,1}},	{{60,2}},			{{40,2}}},
		{{{100,2}},	{{50,2},{100,3}},	{{50,3}}},
		{{{100,3}},	{{50,3},{100,2}},	{{50,4}}},
		{{{100,4}},	{{75,4}},			{{50,4}}},
		{{{100,5}},	{{75,5}},			{{50,5}}},
	}
Prize_box_start_id = 740
Tb_prize_box_name =
	{
	"B¶o r­¬ng tÇng 1 Tö Quang C¸c",	"B¶o r­¬ng tÇng 2 Tö Quang C¸c",	"B¶o r­¬ng tÇng 3 Tö Quang C¸c",
	"B¶o r­¬ng tÇng 4 Tö Quang C¸c",	"B¶o r­¬ng tÇng 5 Tö Quang C¸c",	"B¶o r­¬ng tÇng 6 Tö Quang C¸c",
	}
--Ê¹ÓÃÏä×Ó
function OnUse(goods_index)
	--Ê¹ÓÃÈ¨ÏŞ¼ì²â
	local tong_att = IsTongMember()
	if tong_att ~= 1 and tong_att ~= 2 and tong_att ~= 3 then
		Talk(1,"","<color=green>Chó ı<color>: ChØ cã <color=yellow>bang chñ<color>, <color=yellow>phã bang chñ <color>vµ <color=yellow>tr­ëng l·o<color> míi cã thÓ sö dông b¶o r­¬ng nµy!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	local goods_seq = goods_id - 739		--ÎïÆ·ĞòºÅ
	--ÎïÆ·½Å±¾ÊÇ·ñÕıÈ·
	if goods_id < Prize_box_start_id or goods_id > (Prize_box_start_id + 6) then
		return
	end
	--¸ÃÎïÆ·ÊÇ·ñµÚÒ»´ÎÊ¹ÓÃ
	if GetItemParam(goods_index,0) > 5 or GetItemParam(goods_index,0) < 0 then
		for i = 0,2 do
			for j = 1,getn(Tb_prize_toll[goods_seq][i+1]) do
				local ran_num = random(1,100)
				if ran_num <= Tb_prize_toll[goods_seq][i+1][j][1] then
					SetItemParam(goods_index,i,Tb_prize_toll[goods_seq][i+1][j][2])
				else
					SetItemParam(goods_index,i,0)
				end
			end
		end
	end
	--¿ª±¦ÏäµÄ¶Ô»°Éú³É
	local prize_list = {}
	local dia_prize =""
	for i = 0,2 do
		local param_num = GetItemParam(goods_index,i)
		if param_num > 0 and param_num < 6 then
			tinsert(prize_list,Tb_equip_mertiral[param_num][1].."/#prize_distr("..goods_index..","..i..")")
			SendTongMessage(GetName().."B¾t ®Çu"..Tb_prize_box_name[goods_seq]..", ph¸t hiÖn 2 nhãm "..Tb_equip_mertiral[param_num][1].."!")
		end
	end
	tinsert(prize_list,"Thu/end_dialog")
	--ÒÑ¾­·ÖÅäÍê¾Ídelµô
	local prize_num = (getn(prize_list)-1)
	if prize_num == 0 then
		DelItemByIndex(goods_index,1)
		return
	end
	--¶Ô»°
	Say("<color=green>"..Tb_prize_box_name[goods_seq].."<color>: B¹n ®· më ®­îc <color=yellow>"..prize_num.."<color>nhãm vËt phÈm, xin mêi bÊm vµo ®Ó ph©n phèi!",
	getn(prize_list),
	prize_list
	)
end
--½øÈë·ÖÅä½çÃæ
function prize_distr(goods_index,param_seq)
	local goods_seq = GetItemParam(goods_index,param_seq)
	if GetTeamSize() == 0 then
		Say("<color=green>Chó ı<color>: Ng­¬i cã thÓ ph©n chia <color=yellow>"..Tb_equip_mertiral[goods_seq][1].."<color> cho nh÷ng thµnh viªn trong <color=yellow>tæ ®éi<color> cña <color=yellow>bæn bang<color> ! HiÖn t¹i ng­¬i chØ cã thÓ ph©n ph¸t cho <color=red>chİnh m×nh<color>, ng­¬i cã ch¾c ch¾n?",
			2,
			"Ta muèn ph©n chia cho chİnh m×nh./#prize_get("..goods_index..","..param_seq..","..PlayerIndex..")",
			"§Ó ta suy nghÜ l¹i/end_dialog"
			)
	else
		--¶Ô»°µÄtalble,ÓÃÀ´ÕûÀí¿ÉÒÔ·ÖÅäµÄÈË
		local team_member_dia = {}
		local player_index_save = PlayerIndex
		local player_tong_name = GetTongName()
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			player_name = GetName()
			player_name = zgc_pub_name_replace(player_name,"/","-")
			player_name = zgc_pub_name_replace(player_name,"|","-")
			player_name = zgc_pub_name_replace(player_name,":","-")
			tinsert(team_member_dia,player_name.."/#prize_get("..goods_index..","..param_seq..","..PlayerIndex..")")
		end
		tinsert(team_member_dia,"§Ó ta suy nghÜ l¹i/end_dialog")
		PlayerIndex = player_index_save
		--ÁĞ³ö¶Ô»°
		Say("<color=green>Chó ı<color>: Ng­¬i cã thÓ ph©n chia <color=yellow>"..Tb_equip_mertiral[goods_seq][1].."<color> cho nh÷ng thµnh viªn trong <color=yellow>tæ ®éi<color> cña <color=yellow>bæn bang<color>! Xin mêi hay chän ng­êi ®Ó ph©n chia.",
		getn(team_member_dia),
		team_member_dia
		)
	end	
end
--¿ªÊ¼·ÖÅäÄñ
function prize_get(goods_index,param_seq,player_index)
	local player_index_save = PlayerIndex
	--ÅĞ¶Ï¸ÃË÷ÒıÊÇ·ñ»¹ÊÇÔÚ¸Ã¶ÓÎéÖĞ
	local index_chg_chk_flag = 0
	local team_size = GetTeamSize()
	if team_size ~= 0 then
		index_chg_chk_flag = zgc_pub_same_team_chk(player_index) 
	else
		index_chg_chk_flag = 1
	end
	if index_chg_chk_flag ~= 1 then
		Talk(1,"","<color=green>Chó ı<color>: Xin mêi h·y kiÓm tra l¹i nh÷ng ng­êi mµ b¹n ph©n chia cã ph¶i cã cïng <color=yellow>tæ ®éi<color> víi b¹n!")
		return
	end
	--·ÖÅä¶ÔÏóµÄ¿Õ¼ä¸ºÖØ¼ì²â
	PlayerIndex = player_index
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--ÎïÆ·¶ÔÓ¦É¾³ı
	local goods_seq = GetItemParam(goods_index,param_seq)
	--Êı¾İ³ö´í´¦Àí
	PlayerIndex = player_index_save
	if goods_seq < 0 or goods_seq > getn(Tb_equip_mertiral) then
		DelItemByIndex(goods_index,1)
		WriteLog("PhÈn th­ëng bang héi v­ît ¶i: Ng­êi ch¬i ["..GetName().."]"..Tb_prize_box_name[GetItemParticular(goods_index)-739].."Do lçi nªn d÷ liÖu ®· bŞ xãa 1 c¸i, d÷ liÖu bŞ xãa lµ:"..goods_seq)
	end
	--¿ªÊ¼Êı¾İ´¦Àí
		--if SetItemParam(goods_index,param_seq,0) == 1 then
			SetItemParam(goods_index,param_seq,0)

			--¿ªÊ¼Ôö¼ÓÎïÆ·
			PlayerIndex = player_index
			local add_flag = AddItem(Tb_equip_mertiral[goods_seq][2],Tb_equip_mertiral[goods_seq][3],Tb_equip_mertiral[goods_seq][4],2)
			local prize_get_name = GetName()
			Msg2Player("Chóc mõng ®¹i hiÖp ®· ®­îc 2 	"..Tb_equip_mertiral[goods_seq][1].."!")
			PlayerIndex = player_index_save
			if add_flag == 1 then
				SendTongMessage(GetName().."2"..Tb_equip_mertiral[goods_seq][1].." ph©n chia cho:"..prize_get_name)
			else
				WriteLog("PhÈn th­ëng bang héi v­ît ¶i: Ng­êi ch¬i ["..prize_get_name.."] t¨ng"..Tb_equip_mertiral[goods_seq][1].." thÊt b¹i, kı hiÖu:"..add_flag)
			end
			--·ÖÅäÍê±Ï¾ÍÉ¾³ıµôÎïÆ·
			if prize_box_remain(goods_index) == 0 then
				return
			end
		--else
		--	return
		--end
end
--¼ì²âÊÇ·ñ»¹ÓĞ½±Àø
function prize_box_remain(box_index)
	local prize_remain = 0
	for i = 0, 2 do
		if GetItemParam(box_index,i) ~= 0 then
			prize_remain = (prize_remain + 1)
		end
	end
	if prize_remain == 0 then
		DelItemByIndex(box_index,1)
	end
	return prize_remain
end