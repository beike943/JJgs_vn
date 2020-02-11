--½Å±¾Ãû³Æ£º·ÉĞÇÆ×Ê¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£º·ÉĞÇÆ×µÄÊ¹ÓÃ½Å±¾£¬°üº¬²éÕÒËéÆ¬×ø±ê¡¢ºÏ³É±¦ÎïµÈ¹¦ÄÜ
--²ß»®ÈË£ºÌúÑò
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-05-17
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\task\\marriage\\map_att_head.lua")					--½á»é¶şÆÚÍ·ÎÄ¼ş
--================================¹«¹²±äÁ¿¶¨ÒåÇø================================
	task_map_id_TaskID = 1217
	task_att_seq_TaskID = 1218
	Frag_att_num_TaskID = 1220
	Tb_goods_compose = {}
	Tb_goods_compose[583] = {{573,"§ång T©m Hoµn","Sö dông trŞ §ång t©m t¨ng <color=yellow>125<color> ®iÓm!","trŞ §ång t©m t¨ng 125 ®iÓm"},{568,6,"Gi¸p Méc d­¬ng"},{569,2,"Êt Méc ©m"},{570,1,"Bİnh háa d­¬ng"}}
	Tb_goods_compose[584] = {{574,"§¹i §ång T©m Hoµn","Sö dông trŞ §ång t©m t¨ng <color=yellow>300<color> ®iÓm!","trŞ §ång t©m t¨ng 300 ®iÓm"},{568,9,"Gi¸p Méc d­¬ng"},{569,5,"Êt Méc ©m"},{570,2,"Bİnh háa d­¬ng"}}
	Tb_goods_compose[585] = {{575,"§ång T©m ®¬n","Sö dông trŞ §ång t©m t¨ng <color=yellow>125<color> ®iÓm!","TrŞ §ång T©m t¨ng tèi ®a 125 ®iÓm"},{568,3,"Gi¸p Méc d­¬ng"},{569,4,"Êt Méc ©m"},{570,2,"Bİnh háa d­¬ng"}}
	Tb_goods_compose[586] = {{576,"§¹i §ång T©m ®¬n","Sö dông trŞ §ång t©m t¨ng <color=yellow>300<color> ®iÓm!","TrŞ §ång T©m t¨ng tèi ®a 300 ®iÓm"},{568,4,"Gi¸p Méc d­¬ng"},{569,8,"Êt Méc ©m"},{570,4,"Bİnh háa d­¬ng"}}
	Tb_goods_compose[587] = {{577,"T­ t­ëng b¶n quyÓn","Sö dông sÏ <color=red>häc ®­îc<color>: <color=yellow>kü n¨ng TruyÒn tèng<color>!","Häc ®­îc phu thª truyÒn tèng"},{568,4,"Gi¸p Méc d­¬ng"},{569,4,"Êt Méc ©m"},{570,8,"Bİnh háa d­¬ng"}}
	Tb_goods_compose[588] = {{578,"T­ t­ëng tµn quyÓn","Sö dông sÏ <color=red>th¨ng cÊp<color>: <color=yellow>kü n¨ng TruyÒn tèng<color>!","Th¨ng cÊp kü n¨ng phu thª truyÒn tèng"},{568,5,"Gi¸p Méc d­¬ng"},{569,2,"Êt Méc ©m"},{570,8,"Bİnh háa d­¬ng"},{571,5,"§inh Háa ©m"}}
	Tb_goods_compose[589] = {{579,"Hãa §iÖp b¶n quyÓn","Sö dông sÏ <color=red>häc ®­îc<color>: <color=yellow>kü n¨ng håi sinh<color>!","Häc ®­îc kü n¨ng phu thª håi sinh"},{568,2,"Gi¸p Méc d­¬ng"},{569,5,"Êt Méc ©m"},{570,9,"Bİnh háa d­¬ng"}}
	Tb_goods_compose[590] = {{580,"Hãa §iÖp tµn quyÓn","Sö dông sÏ <color=red>th¨ng cÊp<color>: <color=yellow>kü n¨ng håi sinh<color>!","Th¨ng cÊp kü n¨ng phu thª håi sinh"},{568,2,"Gi¸p Méc d­¬ng"},{569,5,"Êt Méc ©m"},{570,8,"Bİnh háa d­¬ng"},{571,5,"§inh Háa ©m"}}
	Tb_goods_compose[591] = {{581,"§iÖp LuyÕn b¶n quyÓn","Sö dông sÏ <color=red>häc ®­îc<color>: <color=yellow>kü n¨ng Hç trî<color>!","Häc ®­îc kü n¨ng phu thª c­êng hãa"},{568,5,"Gi¸p Méc d­¬ng"},{569,3,"Êt Méc ©m"},{570,6,"Bİnh háa d­¬ng"},{571,9,"§inh Háa ©m"}}
	Tb_goods_compose[592] = {{582,"§iÖp LuyÕn tµn quyÓn","Sö dông sÏ <color=red>th¨ng cÊp<color>: <color=yellow>kü n¨ng Hç trî<color>!","Th¨ng cÊp kü n¨ng phu thª c­êng hãa"},{568,3,"Gi¸p Méc d­¬ng"},{569,5,"Êt Méc ©m"},{570,5,"Bİnh háa d­¬ng"},{571,10,"§inh Háa ©m"}}
	Tb_player_sex_att = {
		{"X","Y"},
		{"Y","X"},
	}
	goods_id_tasktempID = 167
	Tb_frag = {}
	Tb_frag[568] = "Gi¸p Méc d­¬ng"
	Tb_frag[569] = "Êt Méc ©m"
	Tb_frag[570] = "Bİnh háa d­¬ng"
	Tb_frag[571] = "§inh Háa ©m"
--===============================Ö÷Âß¼­Çø============================
function OnUse()
	if GetMateName() == "" or GetMateName() == nil then
		Talk(1,"","<color=green>Chó ı<color>: Ch­a kÕt h«n ch­a thÓ sö dông vËt phÈm nµy!")
		return
	end
	Say("<color=green>Chó ı<color>: <color=yellow>Khiªn V©n Phi Tinh phæ<color> lµ B¶o vËt ph¶i t×m trong <color=yellow>B¶o VËt phu thª<color>, nã sÏ chØ ra <color=yellow>täa ®é L­u tinh ®Ó ®Õn ®ã t×m L­u tinh to¸i phiÕn<color>, còng cã thÓ dïng nã ®Ó t×m L­u tinh to¸i phiÕn<color=yellow> hîp thµnh B¶o VËt phu thª<color>. C¸c h¹ muèn <color=yellow>t×m to¸i phiÕn<color> hay <color=yellow>hîp thµnh B¶o vËt<color>",
	8,
	"NhiÖm vô Phu thª/get_att_dia",
	"Hîp thµnh b¶o vËt/#cowry_comp_dia(583)",
	"LÊy ra To¸i phiÕn /ma_frag_get_out",
	"Tra xem sè to¸i phiÕn phæ/get_frag_num",
	"Tra xem sè lÇn nhiÖm vô cßn d­/get_att_num",
	"ThuyÕt minh NhiÖm vô Phu thª/get_att_info",
	"ThuyÕt minh trŞ §ång t©m/same_heart_value_info",
	"Tho¸t/end_dialog"
	)
end
--**********************»ñÈ¡Á÷ĞÇ×ø±ê¶Ô»°***********************
function get_att_dia()
	local task_num_remain = GetTask(Frag_att_num_TaskID)
	if task_num_remain <= 0 or task_num_remain == nil then
		Talk(1,"","<color=green>Chó ı<color>: Sè lÇn nhËn nhiÖm vô cña ng­¬i ®· hÕt. Xin ®Õn chç <color=green>X¶o N÷<color> ®Ó nhËn tiÕp nhiÖm vô!")
		return
	elseif task_num_remain >= 200 then
		SetTask(Frag_att_num_TaskID,200)
	end
	local map_ID_save = GetTask(task_map_id_TaskID)
	if map_ID_save == nil or map_ID_save == 0 then
		Say("<color=green>Chó ı<color>: B¹n x¸c ®Şnh sö dông <color=yellow>Khiªn V©n Phi Tinh phæ<color> ®Ó nhËn ®­îc <color=yellow>täa ®é to¸i phiÕn<color>. LÇn nµy sÏ khiÕn sè lÇn täa ®é trong Khiªn V©n Phi Tinh phæ <color=green>gi¶m xuèng 1 lÇn<color>. B¹n sÏ nhËn ®­îc täa ®é <color=red>"..Tb_player_sex_att[GetSex()][1].."<color>, ı trung nh©n cña b¹n sÏ nhËn ®­îc täa ®é <color=red>"..Tb_player_sex_att[GetSex()][2].."<color>",
		2,
		"§ång ı/get_att",
		"Hñy bá/end_dialog"
		)
	else
		Say("<color=green>Chó ı<color>: <color=yellow>Khiªn V©n Phi Tinh phæ<color> mçi lÇn chØ chØ ra 1 täa ®é, nÕu nh­ quªn täa ®é, cã thÓ tra l¹i t¹i ®©y. Còng cã thÓ sö dông <color=yellow>Khiªn V©n Phi Tinh phæ<color> ®Ó nhËn ®­îc <color=yellow>täa ®é L­u tinh<color> míi! Nh­ng sÏ khiÕn cho täa ®é cña to¸i phiÕn lÇn tr­íc mÊt t¸c dông",
		3,
		"Ta muèn nhËn ®­îc täa ®é L­u tinh míi/get_att",
		"Ta muèn t×m l¹i täa ®é L­u tinh lÇn tr­íc/star_att_inq",
		"Hñy bá/end_dialog"
		)
	end
end
--**********************Á÷ĞÇ×ø±ê²éÑ¯***************************
function star_att_inq()
	local map_ID_save = GetTask(task_map_id_TaskID)
	local att_seq_save = GetTask(task_att_seq_TaskID)
	--Ã»ÓĞ×ø±ê±£´æµÄÇé¿ö
	if map_ID_save == 0 or map_ID_save == nil or att_seq_save == 0 or att_seq_save == nil then
		Talk(1,"","<color=green>Chó ı<color>: <color=yellow>L­u tinh to¸i phiÕn<color> lÇn nµy ®· t×m thÊy, hay lµ ®i t×m <color=yellow>to¸i phiÕn<color> kÕ tiÕp ®i!")
		return
	end
	--·òÆŞ×é¶Ó²âÊÔ
	local mate_name = GetMateName()
	local team_member_num = GetTeamSize()
	local player_index_save = PlayerIndex
	local player_mate_index = 0
	local player_mate_mapID = 0
	if team_member_num ~= 2 then
		if team_member_num == 0 then
			Talk(1,"","<color=green>Chó ı<color>: Xin x¸c nhËn b¹n vµ ı trung nh©n ®· tæ ®éi!" )
			return
		else
			Talk(1,"","<color=green>Chó ı<color>: Xin x¸c nhËn trong tæ ®éi chØ cã <color=yellow>ı trung nh©n cña b¹n<color>!" )
			return
		end
	else
		for i = 1 , 2 do
			PlayerIndex = GetTeamMember(i)
			if mate_name == GetName() then
				player_mate_index = PlayerIndex
				player_mate_mapID = GetWorldPos()
				PlayerIndex = player_index_save
				break
			end
		end
		PlayerIndex = player_index_save
	end
	if player_mate_index == 0 then
		Talk(1,"","<color=green>Chó ı<color>: Xin x¸c nhËn b¹n vµ ı trung nh©n ®· tæ ®éi!" )
		return
	end
	local map_ID = GetWorldPos()
	if player_mate_mapID ~= map_ID then
		Talk(1,"","<color=green>Chó ı<color>: Xin x¸c nhËn b¹n vµ ı trung nh©n ë cïng mét khu vùc!")
		return
	end
	local player_sex = GetSex()
	Talk(1,"","<color=green>Chó ı<color>: HiÖn t¹i <color=yellow>Khiªn V©n Phi Tinh phæ<color>-täa ®é L­u tinh lµ:? (<color=red>"..Tb_task_reel_att[map_ID_save].map_att[1].."<color>,<color=yellow>"..Tb_player_sex_att[player_sex][1].."<color> täa ®é lµ <color=red>"..Tb_task_reel_att[map_ID_save][att_seq_save][player_sex].."<color>),<color=yellow>"..Tb_player_sex_att[player_sex][2].."<color>, ®i hái l¹i ı trung nh©n th«i! §Õn ®­îc täa ®é th× hai ng­êi lµm 1 ®éng t¸c t×nh tø, sÏ nhËn ®­îc to¸i phiÕn!")
	PlayerIndex = player_mate_index
	player_sex = GetSex()
	Talk(1,"","<color=green>Chó ı<color>: ı trung nh©n cña b¹n sö dông <color=yellow>Khiªn V©n Phi Tinh phæ<color> t×m thÊy 1 täa ®é L­u tinh: <color=yellow>"..Tb_player_sex_att[player_sex][1].."<color> täa ®é lµ <color=red>"..Tb_task_reel_att[map_ID_save][att_seq_save][player_sex].."<color>. §Õn ®­îc täa ®é nhí nh¾c ı trung nh©n lµm 1 ®éng t¸c t×nh tø, sÏ nhËn ®­îc to¸i phiÕn!")
	PlayerIndex = player_index_save	
end
--*************************ËéÆ¬È¡³ö****************************
function ma_frag_get_out()
	Say("<color=green>Chó ı<color>: B¹n cã thÓ lÊy <color=yellow>to¸i phiÕn<color> trong <color=yellow>Khiªn V©n Phi Tinh phæ<color> ®Æt trong ng­êi. Xin hái muèn lÊy ra <color=yellow>to¸i phiÕn<color> nµo?",
	5,
	"LÊy ra Gi¸p Méc D­¬ng/#get_out_num_in(568)",
	"LÊy ra Êt Méc ¢m/#get_out_num_in(569)",
	"LÊy ra Bİnh Háa D­¬ng/#get_out_num_in(570)",
	"LÊy ra §inh Háa ¢m/#get_out_num_in(571)",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--**********************È¡³öÊıÁ¿ÊäÈë***************************
function get_out_num_in(goods_id)
	local goods_num_save = GetTask(goods_id + 653)
	if goods_num_save <= 0 then
		Talk(1,"","<color=green>Chó ı<color>: Trong <color=yellow>Khiªn V©n Phi Tinh phæ<color> cña b¹n c¬ b¶n kh«ng cã <color=yelllow>"..Tb_frag[goods_id].."<color>!")
		return
	end
	SetTaskTemp(goods_id_tasktempID,goods_id)
	AskClientForNumber("put_out",1,goods_num_save,"Xin nhËp sè l­îng muèn lÊy!")
end
--**************************È¡³ö²Ù×÷***************************
function put_out(goods_num)
	--Èç¹ûÊäÈë0ÔòÖ±½Ó·µ»Ø
	if goods_num == 0 then
		return
	end
	local goods_id = GetTaskTemp(goods_id_tasktempID)
	SetTaskTemp(goods_id_tasktempID,0)
	--ÊıÁ¿ÅĞ¶Ï
	local goods_num_save = GetTask(goods_id + 653)
	if goods_num_save < goods_num then
		Talk(1,"","<color=green>Chó ı<color>: Trong <color=yellow>Khiªn V©n Phi Tinh phæ<color> cña b¹n kh«ng cã ®ñ <color=yelllow>"..Tb_frag[goods_id].."<color>!")
		return
	end
	--¿Õ¼ä¸ºÖØÅĞ¶Ï
	if Zgc_pub_goods_add_chk(1,goods_num) ~= 1 then
		return
	end
	--´æ·ÅÊıÁ¿¼õÉÙ
	SetTask((goods_id + 653),(goods_num_save - goods_num))
	--ÎïÆ·Ôö¼Ó
	if AddItem(2,1,goods_id,goods_num) == 1 then
		Msg2Player("B¹n lÊy ra thµnh c«ng "..goods_num.."c¸i"..Tb_frag[goods_id].."!")
	end
end
--**********************»ñÈ¡Á÷ĞÇ×ø±ê***************************
function get_att()
	--ËùÔÚµØÍ¼²âÊÔ
	local map_id = GetWorldPos()
	if Tb_task_reel_att[map_id] == nil then
		Talk(1,"","<color=green>Chó ı<color>: Khu vùc nµy kh«ng cã L­u tinh to¸i phiÕn")
		return
	end
	--·òÆŞ×é¶Ó²âÊÔ
	local mate_name = GetMateName()
	local team_member_num = GetTeamSize()
	local player_index_save = PlayerIndex
	local player_mate_index = 0
	local player_mate_mapID = 0
	if team_member_num ~= 2 then
		if team_member_num == 0 then
			Talk(1,"","<color=green>Chó ı<color>: Xin x¸c nhËn b¹n vµ ı trung nh©n ®· tæ ®éi!" )
			return
		else
			Talk(1,"","<color=green>Chó ı<color>: Xin x¸c nhËn trong tæ ®éi chØ cã <color=yellow>ı trung nh©n cña b¹n<color>!" )
			return
		end
	else
		for i = 1 , 2 do
			PlayerIndex = GetTeamMember(i)
			if mate_name == GetName() then
				player_mate_index = PlayerIndex
				player_mate_mapID = GetWorldPos()
				PlayerIndex = player_index_save
				break
			end
		end
		PlayerIndex = player_index_save
	end
	if player_mate_index == 0 then
		Talk(1,"","<color=green>Chó ı<color>: Xin x¸c nhËn b¹n vµ ı trung nh©n ®· tæ ®éi!" )
		return
	end
	local map_ID = GetWorldPos()
	if player_mate_mapID ~= map_ID then
		Talk(1,"","<color=green>Chó ı<color>: Xin x¸c nhËn b¹n vµ ı trung nh©n ë cïng mét khu vùc!")
		return
	end
	--¼õÉÙÈÎÎñ¾íÖáÈÎÎñ´ÎÊı
	local fra_att_num = GetTask(Frag_att_num_TaskID) - 1
	SetTask(Frag_att_num_TaskID , fra_att_num)
	--Ğ´Èë²¢±¨¸æ×ø±ê
	local att_seq = random(1,getn(Tb_task_reel_att[map_id]))
	SetTask(task_map_id_TaskID,map_id)
	SetTask(task_att_seq_TaskID,att_seq)
	local player_sex = GetSex()
	TaskTip("NhËn ®­îc täa ®é 2 viªn L­u Tinh"..Tb_player_sex_att[player_sex][1].." täa ®é lµ: "..Tb_task_reel_att[map_id][att_seq][player_sex])
	Talk(1,"","<color=green>Chó ı<color>: HiÖn t¹i täa ®é L­u tinh trong <color=yellow>Khiªn V©n Phi Tinh phæ<color> sè l­îng cßn <color=yellow>"..fra_att_num.."<color>, lÇn nµy t×m thÊy to¸i phiÕn <color=yellow>"..Tb_player_sex_att[player_sex][1].." (täa ®é) <color> lµ <color=red>"..Tb_task_reel_att[map_id][att_seq][player_sex].."<color>,<color=yellow>"..Tb_player_sex_att[player_sex][2].."<color>, ®i hái l¹i ı trung nh©n th«i! §Õn ®­îc täa ®é th× hai ng­êi lµm 1 ®éng t¸c t×nh tø, sÏ nhËn ®­îc to¸i phiÕn!")
	Msg2Player("NhiÖm vô lÇn nµy-"..Tb_player_sex_att[player_sex][1].." täa ®é lµ: "..Tb_task_reel_att[map_id][att_seq][player_sex].."§Õn ®­îc täa ®é th× lµm 1 ®éng t¸c t×nh tø, sÏ nhËn ®­îc to¸i phiÕn!")
	PlayerIndex = player_mate_index
	player_sex = GetSex()
	Talk(1,"","<color=green>Chó ı<color>: ı trung nh©n cña b¹n sö dông <color=yellow>Khiªn V©n Phi Tinh phæ<color>, nhËn ®­îc 1 täa ®é to¸i phiÕn, <color=yellow>"..Tb_player_sex_att[player_sex][1].."<color> täa ®é lµ <color=yellow>"..Tb_task_reel_att[map_id][att_seq][player_sex].."<color> §Õn ®­îc täa ®é xin nh¾c ı trung nh©n cña b¹n <color=yellow>lµm 1 ®éng t¸c t×nh tø bÊt kú<color> sÏ <color=yellow> nhËn ®­îc To¸i phiÕn<color>")
	Msg2Player("ı trung nh©n cña b¹n sö dông Khiªn V©n Phi Tinh phæ, nhËn ®­îc 1 täa ®é to¸i phiÕn, "..Tb_player_sex_att[player_sex][1].." täa ®é lµ "..Tb_task_reel_att[map_id][att_seq][player_sex].."§Õn ®­îc täa ®é nhí nh¾c ı trung nh©n lµm 1 ®éng t¸c t×nh tø, sÏ nhËn ®­îc to¸i phiÕn!")
	PlayerIndex = player_index_save	
end
--***********************±¦ÎïºÏ³É¶Ô»°**************************
function cowry_comp_dia(page_diff)
	local tb_dia = {}
	local dia_add_num = 3
	if page_diff == 587 then
		dia_add_num = 5
	end
	for i = page_diff,(page_diff + dia_add_num) do
		tinsert(tb_dia,Tb_goods_compose[i][1][2].."("..Tb_goods_compose[i][1][4]..")/#cowry_comp_dtm("..i..")")
	end
	if page_diff == 583 then
		tinsert(tb_dia,"Trang kÕ/#cowry_comp_dia(587)")
	else
		tinsert(tb_dia,"Trang tr­íc/#cowry_comp_dia(583)")
	end
		tinsert(tb_dia,"Tho¸t/end_dialog")
	Say("<color=green>Gîi ı<color>: Mçi lo¹i b¶o vËt sÏ tiªu hao sè l­îng <color=yellow>m¶nh nhÊt ®Şnh<color>, chän chuét ph¶i <color=yellow>m¶nh<color> ®Ó cho vµo <color=yellow>Khiªn V©n Phi Tinh Phæ<color>. B¹n muèn hîp thµnh b¶o vËt nµo?",
		getn(tb_dia),
		tb_dia
	)
end
--*******************±¦ÎïºÏ³ÉÈ·ÈÏ******************************
function cowry_comp_dtm(cowry_id)
	local compose_goods_need_dia = ""
	local compose_goods_save_dia = ""
	for i = 2 ,getn(Tb_goods_compose[cowry_id]) do
		local color = "<color=green>"
		local num_save = GetTask(Tb_goods_compose[cowry_id][i][1] + 653)
		if num_save < Tb_goods_compose[cowry_id][i][2] then
			color = "<color=red>"
		end
		compose_goods_need_dia = compose_goods_need_dia.."<color=yellow>"..Tb_goods_compose[cowry_id][i][2].."<color> c¸i"..Tb_goods_compose[cowry_id][i][3]..";"
		compose_goods_save_dia = compose_goods_save_dia..color..GetTask(Tb_goods_compose[cowry_id][i][1] + 653).."<color> c¸i"..Tb_goods_compose[cowry_id][i][3]..";"
	end
	Say("<color=green>Gîi ı<color>: B¹n muèn dïng nguyªn liÖu trong <color=yellow>Khiªn V©n Phi Tinh Phæ<color> hîp thµnh 1 <color=yellow>"..Tb_goods_compose[cowry_id][1][2].."<color>? \n Nguyªn liÖu cÇn ®Ó hîp thµnh:"..compose_goods_need_dia.."\n Nguyªn liÖu hiÖn t¹i trong Khiªn V©n Phi Tinh Phæ:"..compose_goods_save_dia.."\n HiÖu qu¶ sö dông:"..Tb_goods_compose[cowry_id][1][3],
		2,
		"T«i muèn hîp thµnh/#cowry_comp("..cowry_id..")",
		"T«i ch­a chuÈn bŞ xong/end_dialog"
	)	
end
--*****************************¿ªÊ¼ºÏ³É************************
function cowry_comp(goods_id)
	--ĞèÒªµÄÎïÆ·¶Ô»°
	--local goods_need_dia = ""
	--for i = 2,getn(Tb_goods_compose[goods_id]) do
	--	goods_need_dia = goods_need_dia.."<color=yellow>"..Tb_goods_compose[goods_id][i][2].."<color>¸ö<color=yellow>"..Tb_goods_compose[goods_id][i][3].."<color>£»"
	--end
	--ËùĞèÒªµÄ²ÄÁÏ¼ì²â
	for i = 2 ,getn(Tb_goods_compose[goods_id]) do
		if GetTask(Tb_goods_compose[goods_id][i][1] + 653) < Tb_goods_compose[goods_id][i][2] then
			Talk(1,"","<color=green>Gîi ı<color>: Xin x¸c nhËn cã ®ñ nguyªn liÖu trong <color=yellow>Khiªn V©n Phi Tinh Phæ<color> <color=yellow>"..Tb_goods_compose[goods_id][i][3].."<color>!")
			return
		end
	end
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--ºÏ³ÉËùĞè²ÄÁÏÉ¾³ı¼ì²â
	for i = 2, getn(Tb_goods_compose[goods_id]) do
		SetTask((Tb_goods_compose[goods_id][i][1] + 653),(GetTask((Tb_goods_compose[goods_id][i][1] + 653))-Tb_goods_compose[goods_id][i][2]))
	end
	--¶ÔÓ¦±¦ÎïÔö¼Ó
	if AddItem(2,1,Tb_goods_compose[goods_id][1][1],1) == 1 then
		Msg2Player("Chóc mõng b¹n ®· hîp thµnh 1"..Tb_goods_compose[goods_id][1][2].."!")
	end
end
--*****************************Æ×ÄÚÔªËØ²éÑ¯********************
function get_frag_num()
	Talk(1,"OnUse","<color=green>Gîi ı<color>: T×nh tr¹ng hiÖn t¹i m¶nh vì trong <color=yellow>Khiªn V©n Phi Tinh Phæ<color> lµ: \n sè l­îng <color=yellow>Gi¸p Méc D­¬ng<color> <color=yellow>"..GetTask(1221).."<color>\n sè l­îng <color=yellow>Êt Méc ¢m<color>: <color=yellow>"..GetTask(1222).."<color>\n sè l­îng <color=yellow>Bİnh Háa D­¬ng<color> <color=yellow>"..GetTask(1223).."<color>\n sè l­îng <color=yellow>§inh Háa D­¬ng<color>: <color=yellow>"..GetTask(1224).."<color>")
end
--**************************Á÷ĞÇÆ×Ê£ÓàÊıÁ¿²éÑ¯*****************
function get_att_num()
	Talk(1,"OnUse","<color=green>Gîi ı<color>: HiÖn t¹i sè l­îng täa ®é L­u tinh trong <color=yellow>Khiªn V©n Phi Tinh Phæ<color> lµ: <color=yellow>"..GetTask(Frag_att_num_TaskID).."<color>!")
end
--**************************Á÷ĞÇ²É¼¯ËµÃ÷************************
function get_att_info()
	Talk(2,"get_att_info_1",	"<color=green>Gîi ı<color>: T¸c dông cña <color=yellow>NhiÖm vô Phu thª<color> lµ nhËn ®­îc <color=yellow>B¶o vËt Phu thª<color>, cã <color=yellow>2 b­íc<color> ®Ó ®¹t ®­îc b¶o vËt .<color=yellow> B­íc 1<color> nhËn ®­îc <color=yellow>m¶nh L­u tinh<color> trong rõng; <color=yellow>B­íc 2<color> dïng nh÷ng m¶nh nµy <color=yellow>hîp thµnh B¶o vËt Phu thª<color>.",
					"<color=green>Gîi ı<color>: ®a sè <color=yellow>Ngoµi thµnh<color> ®Òu cã L­u tinh r¬i xuèng, b¹n ®õng ng¹i thö sö dông <color=yellow>Khiªn V©n Phi Tinh Phæ<color>, xem n¬i nµo cã m¶nh L­u tinh. <color=yellow>M¶nh L­u tinh<color> t×m ®­îc ë <color=yellow>mçi khu vùc<color> kh«ng gièng nhau, <color=green>khu vùc cã ®¼ng cÊp cµng cao th× cã thÓ t×m ®­îc to¸i phiÕn cã ®¼ng cÊp cµng cao<color>."
		)
end
function get_att_info_1()
	Talk(1,"OnUse","<color=green>Gîi ı<color>: NhiÖm vô Phu thª yªu cÇu <color=yellow>phu thª ph¶i tæ ®éi<color>, kh«ng cã ng­êi kh¸c trong ®éi. Sau ®ã 1 ng­êi dïng Khiªn V©n Phi Tinh Phæ khëi x­íng NhiÖm vô Phu thª, <color=yellow>Mçi ng­êi cã thÓ nhËn ®­îc mét nöa ®Şa ®iÓm täa ®é L­u tinh<color>. <color=red>Chång nhËn ®­îc täa ®é X, vî nhËn ®­îc täa ®é Y<color>. <color=yellow>Ng­êi dïng Khiªn V©n Phi Tinh Phæ<color> tïy ı thùc hiÖn 1 <color=yellow>®éng t¸c<color> trong täa ®é m×nh ®Ó nhËn ®­îc <color=yellow>m¶nh L­u tinh<color>. Chó ı: <color=yellow>khi nhËn täa ®é m¶nh vì, ph¶i lµ ®éi vî chång , cïng ë trong 1 khu vùc<color>, kh«ng ®­îc gia nhËp ®éi kh¸c."
		)
end
--**************************Í¬ĞÄÖµËµÃ÷***********************
function same_heart_value_info()
	Talk(2,"same_heart_value_info_2",	"<color=green>Gîi ı<color>: <color=yellow>TrŞ sè ®ång t©m<color> t­îng tr­ng cho t×nh c¶m vî chång, t×nh c¶m vî chång cµng s©u nÆng <color=yellow>®iÓm TrŞ sè ®ång t©m<color> cµng cao. Sö dông <color=yellow>Khiªn V©n Phi Tinh Phæ<color> hîp thµnh <color=yellow>§ång T©m §¬n<color>, <color=yellow>§¹i §ång T©m §¬n<color>, <color=yellow>§ång T©m Hoµn<color>, <color=yellow>§¹i §ång T©m Hoµn<color> ®Òu cã thÓ lµm t¨ng TrŞ sè ®ång t©m",
					"<color=green>Gîi ı<color>: T¸c dông cña <color=yellow>§ång T©m §¬n<color> vµ <color=yellow>§¹i §ång T©m §¬n<color> lµ <color=green>t¨ng giíi h¹n TrŞ sè ®ång t©m<color>, <color=yellow>§ång T©m Hoµn<color> vµ <color=yellow>§¹i §ång T©m Hoµn<color> lµm t¨ng <color=green>®iÓm TrŞ sè ®ång t©m<color>. Sö dông phèi hîp mÊy lo¹i §ång T©m §¬n nµy sÏ liªn tôc t¨ng TrŞ sè ®ång t©m lªn ®Õn <color=green>5000<color>."
	)
end
function same_heart_value_info_2()
	Talk(2,"OnUse",	"<color=green>Gîi ı<color>: TrŞ sè ®ång t©m <color=green>d­íi 500<color>: ®«i vî chång T©n H«n YÕn NhÜ, TrŞ sè ®ång t©m sÏ kh«ng ngõng t¨ng tr­ëng, chØ cã qua 1 ngµy sÏ gi¶m 4 ®iÓm, chØ cÇn TrŞ sè ®ång t©m <color=green>v­ît qua 500<color> sÏ kh«ng t¨ng theo thêi gian n÷a, ph¶i hîp thµnh §ång T©m §¬n §ång T©m Hoµn ®Ó gia t¨ng. Mçi tuÇn gi¶m <color=green>6%<color>; mét khi <color=green>v­ît qu¸ 2000<color>, TrŞ sè ®ång t©m gi¶m <color=green>12%<color> mçi tuÇn",
					"<color=green>Gîi ı<color>: TÊt c¶ <color=yellow>kü n¨ng Phu thª<color> ®Òu ph¸t huy t¸c dông theo t×nh c¶m vî chång, nÕu <color=yellow>TrŞ sè ®ång t©m<color> kh«ng ®¹t tíi ®iÓm nhÊt ®Şnh sÏ <color=yellow>kh«ng ph¸t huy ®­îc<color> c¸c kü n¨ng ®ã. Cã kü n¨ng <color=yellow>c¨n cø vµo møc cao thÊp cña TrŞ sè ®ång t©m ph¸t huy søc m¹nh<color>. §Ó kü n¨ng Phu thª cµng m¹nh. Ph¶i næ lùc n©ng cao <color=yellow>TrŞ sè ®ång t©m<color>."
		)
end
