-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 翠烟门NPC彩凤儿Script
-- By StarryNight
-- 2006/03/22 PM 17:20

-- 直面自己的内心吧！

--村长：2009-03-09 增加实质的东西
--以前都是几个策划搞一个开发，现在随着时代的进步，变成了一个策划搞几个开发！
-- ======================================================
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- 门派任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")
TASKID_CUIYAN_JOIN_TASK = 1019
TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018}
NPC_NAME = "<color=green>S礽 Ho祅g Nhi<color>: "
function main()
	local t_dia_sel = {
		"翠烟起源/say1_1",
		"翠烟武功/say1_2",
		"入门条件/say1_3",
		--"我要加入翠烟/say1_4",
		"开始师门任务/#ftask_repeat_main(10)",
		--"闭关修炼/#practice_main(10)",
		"我打算成亲，所以我想出师/#faction_graduate(10)",
		"跟掌门打个招呼/end_dialog"
	}
		Say(NPC_NAME.."翠烟风光旖旅，四季如春，落花缤纷，佳人云集，令人陶醉。.",
			getn(t_dia_sel),
			t_dia_sel
			)
end;	
function say1_1()
	Talk(4,"main",
		NPC_NAME.."唐明皇年间，安禄山叛乱，普通民众陷入水深火热之中。他们为了自保形成了各种民间团体，其中就有由“舞娘”所组成的翠烟门。战乱中各大门派都处境艰难，本门出身市并风显得较为灵活，在乱世中获得了生存空间，因而吸引了越来越多的武林人士加入。.",
		NPC_NAME.."但是，直到景和刘莫两个武学天才的出现，才将我门建设成真正的武林门派。刘氏兄妹将本门武功整理为滨于控制小名的灵女和精通舞蹈的舞仙两个方向，我们后盛将刘丙祝妹并称为“坚烟二祖”。后来刘景早逝，刘蒙又遭温情变，一怨之下区逐了所有的男性弟子，只接纳女性拜入门下。.",
		NPC_NAME.."唐末，战乱又起，各大门派担心我门趁着混乱的局面扩大势力，将本门排挤出中原。自此与各大门派结下深怨，加上现任靠门柴凰儿一直对来延心存茶蒂，所以本门对中原各个门派包括朝政都持敌视态度，在江湖中并没盟友。.",
		NPC_NAME.."本门之所以名动江湖，不仅因为武功精妙绝伦，更是因为门中弟子皆为绝色美女，让无数江湖男子心驰神住，梦寐以求。而门中各位百花使，乃为绝色中之绝色，个个闭月羞花，须鱼薯雁。."
		)
end
function say1_2()
	Talk(3,"main",
		NPC_NAME.."本门武功分为两大流派，分别为 <color=yellow>舞仙<color> 和 <color=yellow>灵女。<color>. <color=yellow>牡丹使周子雯<color>教授 <color=yellow>舞仙<color>武功。而<color=yellow>灵女<color> 武功则由 <color=yellow>蔷薇使胡曼成<color>传授。.",
		"<color=yellow>舞仙<color>只有本门中有舞者之心的女子才可修行。唐时有公孙大娘，一舞剑气动四方。本门之舞，乃儿意之舞，将自己之心意融入舞中，观者随舞者之心而动。与之敌者观之，则战意全失，.为舞者所惑，不知身归何处。而与之为友者观之，则战意高张，与之共进退，可学得镇派技能<color=yellow>鸾凤九天<color>.",
		"<color=yellow>灵女<color>只有本门中有自然之心的女子才可修行。灵女于天地万物相合，因此颇得小动物们喜爱，她们养绍为伴，战斗时也控制小品伤敌。人与招相配合，其威力远超常人想象，绍以人之令行动，可以如人般使用各种手段，是敌人后退，打断其使用的武功，甚至使人昏迷，所以万万不可小视，可学得镇派武功<color=yellow>九尾花仙诀<color>."
		)
end
function say1_3()
	Talk(1,"main","<color=green>柴凰儿<color>:天下红粉佳人，只要心地善良，非本门叛徒，皆可加入本门，但是入派后门内弟子要互相爱护，不得轻易与男子来往。.")
end 
function say1_4()
	local task_step = GetTask(TASKID_CUIYAN_JOIN_TASK)
	local s_dia_no_pass = ""
	if GetSex() == 1 then
		 s_dia_no_pass = " 本门不收<color=red>男弟子<color>."
	elseif GetLevel() < 10 then
		s_dia_no_pass = "你等级不足<color=red>10<color>级."
	elseif GetPlayerRoute() ~= 0 then
		s_dia_no_pass =  "N? hi謕  c? <color=red>m玭 ph竔<color>, ta kh玭g th? nh薾."
	elseif GetPlayerFaction() == 8 then
		s_dia_no_pass =  "你已加入翠烟派, 快去练功."
	else
		for i = 1,getn(TB_FACTION_TASKID_LIST) do
			if GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
				s_dia_no_pass = "你已加入门派."
				break
			end
		end
	end
	if task_step == 5 then
		Talk(2,"",
			NPC_NAME.."没错, 两个<color=green>百合花<color> 我对你很满意, 加入翠烟派不得与男性交往.",
			NPC_NAME.."本门武功包括 <color=yellow>翠烟舞仙<color>和<color=yellow>灵女<color>, 你可以找到<color=yellow>周子雯<color> 或<color=yellow>胡曼成<color>学习, <color=yellow>周子雯<color>擅长舞蹈; <color=yellow>胡曼成<color> 驱使<color=yellow>小貂<color> ."
		)
		SetPlayerFaction(10)
		SetPlayerRoute(28)
		TaskTip("你已经加入翠烟派")
		SetTask(TASKID_CUIYAN_JOIN_TASK,6)
	elseif s_dia_no_pass == "" then
		if task_step == 0 then
			Talk(2,"",NPC_NAME.."Giai nh﹏ tuy謙 s綾 trong thi猲 h? c? th? gia nh藀 b鎛 m玭, nh璶g ngi ph秈 b竔 ki課 hai v? <color=green>B竎h Hoa S?<color> trong Th髖 Y猲 M玭, h? s? n鉯 ngi bi誸 n猲 l祄 th? n祇, h穣 t譵 <color=green>M蓇 Кn S? Chu T? V╪<color> (190/170) trc.","<color=green>Ngi ch琲<color>: Л頲, ta 甶 ngay!")
			TaskTip("找周子雯")
			Msg2Player("找周子雯(190/170)")
			SetTask(TASKID_CUIYAN_JOIN_TASK,1)
			return
		else
			Talk(1,"",NPC_NAME.."Mu鑞 v祇 b鎛 m玭 h穣 t譵 <color=yellow>Chu T? V╪<color> ho芻 <color=yellow>H? Man Th祅h<color>!")
			return
		end
	else
		Talk(1,"",NPC_NAME..s_dia_no_pass)
		return
	end
end

function say1_5()
	
end

function say1_6()
	
end

