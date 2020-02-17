-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 昆仑NPC马不前Script
-- By StarryNight
-- 2007/08/16 AM 10:24

-- 这个世界需要净化……

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
KUN_FACTION_ID = 8
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
NPC_NAME = "<color=green>M? B蕋 Ti襫<color>: "
PLAYER_NAME = "<color=green>Ngi ch琲<color>: Л頲, ta 甶 ngay!"
function main()
	if tGtTask:check_cur_task(139) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end	
	--一般情况下的对话
	strTalk = {
		{"V? c玭g c馻 ta trong ph竔 kh玭g nh蕋 c騨g nh? nh璶g trng m玭 s? huynh l筰 kh玭g ch辵 nhng ch鴆 trng m玭, th藅 l? t鴆."},
		{"N誹 ta 頲 l祄 trng m玭 nh蕋 nh C玭 L玭 s? th祅h v? l﹎  nh蕋 i ph竔."},
		}
	local i = random(1,getn(strTalk));
	local n_task_step = GetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID])
	if n_task_step == 0 or GetPlayerFaction() == KUN_FACTION_ID then
		TalkEx("",strTalk[i]);
		return
	elseif n_task_step == 1 then
		Talk(6,"",
			NPC_NAME.."你不是本门弟子, 找我有什么事?",
			PLAYER_NAME.."我要加入<color=yellow>昆仑派<color>, 掌门叫我找你.",
			NPC_NAME.."想加入<color=yellow>昆仑派<color>必须通过我的测试.",
			PLAYER_NAME.."需要测试什么，我马上就去.",
			NPC_NAME.."嗯,那你来的正好,最近后山<color=yellow>天元法阵<color> 处<color=yellow>妖狐<color>想要打破封印的天元法阵, 需要<color=yellow>法力<color> 维持, 你去找<color=green>梅不容<color> (195/204)拿一张天师符.",
			PLAYER_NAME.."好的，我这就去."
		)
		SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],2)
		TaskTip("找梅不容维持天元法阵")
		Msg2Player("找梅不容(195/204) 拿1张天师符，交给马不前 (197/203)")
		return
	elseif n_task_step == 2 and GetItemCount(2,0,779) == 1 then
		Talk(5,"",
			NPC_NAME.."Л頲 l緈, nh璶g ngi ph秈 qua kh秓 nghi謒 2 c馻 ta.",
			PLAYER_NAME.."厖",
			NPC_NAME.."<color=yellow>C玭 L玭 Ph竔<color> ta v鑞 chia 2 h? Luy謓 Thu鑓 v? Thi猲 S?, ti誧 r籲g Luy謓 Thu鑓  th蕋 truy襫, ch? c遪 l筰 Thi猲 S?, ngi mu鑞 gia nh藀 <color=yellow>C玭 L玭 Ph竔<color> th? ph秈 c? can m i m苩 v韎 y猽 ma.",
			NPC_NAME.."Ngi mang Thi猲 S? Ph? n祔 t韎 h藆 s琻 <color=yellow>Thi猲 Nguy猲 Th竝<color> t譵 <color=yellow>Thi猲 Nguy猲 Ph竝 Tr薾<color> (197/194), d竛 <color=yellow>Thi猲 S? Ph?<color> Th筩h Tr?, ph竝 tr薾 s? ti誴 t鬰 phong 蕁 <color=yellow>H? Y猽<color>. N誹 l祄 m蕋 Thi猲 S? Ph?, c? th? t譵 <color=green>Mai B蕋 Dung<color> l蕐 th猰.",
			PLAYER_NAME.."Ta s? l祄 theo l阨 d苙 c馻 o trng."
		)
			TaskTip("去天元法阵封印妖狐")
			Msg2Player("T韎 h藆 s琻 Thi猲 Nguy猲 Th竝 (197/194) d飊g Thi猲 S? Ph? k輈h ho箃 Thi猲 Nguy猲 Ph竝 Tr薾 phong 蕁 H? Y猽")
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],3)
			return
	elseif n_task_step == 4 then
		Talk(2,"",
			NPC_NAME.."出色的完成任务, 昆仑派欢迎你加入, 入门手续已注册, 可以回去见掌门师兄了 (199/200).",
			PLAYER_NAME.."谢谢道长."
			)
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],5)
		TaskTip("回去见周不惑")
		Msg2Player("回去见周不惑(199/200)")
	else
		Talk(1,"",NPC_NAME.."加入门派必须通过我的测试!")
		return
	end	
end
