-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 昆仑NPC周不惑Script
-- By StarryNight
-- 2007/08/16 AM 10:26

-- 能做掌门又如何……

-- ======================================================
--村长2009-3-12增加实质东西
--还没有做策划NB
-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- 门派任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>Chu B蕋 Ho芻<color>: "
PLAYER_NAME = "<color=green>Ngi ch琲<color>: Л頲, ta 甶 ngay!"
KUN_FACTION_ID = 8
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
KUN_FACTION_TASK_FINISH = 5

function main()
	local dia_sel = {
		"昆仑起源/say1_1",
		"昆仑武功/say1_2",
		"入门条件/say1_3",
		--"我要加入昆仑/say1_4",
		"开始师门任务/#ftask_repeat_main(8)",
		--"闭关修炼/#practice_main(8)",
		"我打算成亲，所以我想出师/#faction_graduate(8)",
		"跟掌门打个招呼/end_dialog",
	}
	Say(NPC_NAME.."巍项昆仑，有瑶池玉虚，气象历干，仙气绕缭，为修心养性之胜地。.",
		getn(dia_sel),dia_sel
	)
end;
--昆仑派起源
function say1_1()
	Talk(3,"main",
		NPC_NAME.."我派远处西域，很少选足中原，创派祖师已无从考证。由于与中原相隔甚远，其他门派体派并不了解，直到后来我派出了个百年不遇的奇人，在中原武林词下了赫赫威名，我派才开始闻名，引起中原各大门派的关注。.",
		NPC_NAME.."但是，我派一贯提倡避世，无欲无为，在不为人知的地方潜色修行，本派弟子都不为世俗名利所扰，飘然着仙。但是一旦出现妖魔则要尽力扑杀，对于剿灭魔物非常执着.",
		NPC_NAME.."而今中原动荡选生，不少地方都有妖魔出现，因此派了不少弟子远赴中原各地降妖除魔，但是此举却引起不少门派的警惕，他们对我派心存芥蒂，所以本派在武林中并没有盟友。."
	)
end
--昆仑派武功
function say1_2()
	Talk(3,"main",
		NPC_NAME.."本门武学有天师和剑尊两脉。天师上映天象，分为风，雷二诀，剑尊以气御剑，毕生追求人剑合一的武学至高之境。.",
		NPC_NAME.."天师雷诀威猛绝伦，乃本门折妖除魔之决，与人相斗，对手为了抵抗天雷之威，也要额外的损耗内力。若被天雷击中，即便是武林高手，也会神智昏述。风诀则灵活多变，可隐藏自身，御风而行。本门武学本就身法机变多样，叉以风诀来提升自己的身行速度，更是不可琢磨。更可以吹起狂风，禁对手，使其无法行动。剑尊可炼化灵剑，以气御剑，而本身亦修行本门剑术，本门剑术飘逸，将就以快打慢，步步抢占先机，而灵剑剑法刚猛，断金碎玉无人可挡，剑尊修炼至人剑合一之境，如两大高手合一，各自剑招之破绽将化为无形.",
		NPC_NAME.."昆仑<color=yellow>天师<color>武功由<color=yellow>秦不智<color>传授，可学得镇派技能<color=yellow>无极风雷诀<color>!昆仑<color=yellow>剑尊<color>武功由<color=yellow>云羲和<color>传授，可学得镇派技能<color=yellow>万剑化雨阵<color>!"
	)
end
--入门条件
function say1_3()
	Talk(1,"",NPC_NAME.."昆仑派武功历来<color=yellow>传男不传女<color>, 故本教只允许<color=yellow>男性<color>加入，只要没加入其他门源且非本派叛徒便可加入。.")
end
--我要加入昆仑
function say1_4()
	--等级判断
	if GetLevel() <10 then
		Talk(1,"",NPC_NAME.."你等级不足<color=yellow>10<color>级.")
		return
	end
	--性别判断
	if GetSex() == 2 then
		Talk(1,"",NPC_NAME.."本门不收女弟子.")
		return
	end
	--本门判断
	if GetPlayerFaction() == KUN_FACTION_ID then
		Talk(1,"",NPC_NAME.."你已经是昆仑弟子，快去练功.")
		return
	end
	--流派判断
	if GetPlayerFaction() > 0 then
		Talk(1,"",NPC_NAME.."你已加入门派.")
		return
	end
	--入门任务判断
	local faction_task_step = without_other_factask(KUN_FACTION_ID) 
	if faction_task_step == -1 then
		Talk(1,"",NPC_NAME.."你已接受了入门申请.")
		return
	elseif faction_task_step == KUN_FACTION_TASK_FINISH then
		Talk(4,"",
			NPC_NAME.."弟子们须清心静，尽心修德，尽心修炼.",
			PLAYER_NAME.."弟子谨记教诲，一定好好修炼.",
			NPC_NAME.."请找 <color=green>秦不智<color> 学习，<color=yellow>昆仑天师<color> 由他传授.",
			PLAYER_NAME.."谢谢掌门."
		)
		TaskTip("已经加入了昆仑派")
		SetPlayerFaction(8)
		SetPlayerRoute(22)
		SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],6)
	else
		if faction_task_step == 0 then
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],1)
			TaskTip("去找马不前接受考验")
			Msg2Player("去找马不前(197/203)接受考验")
		end
		Talk(1,"",NPC_NAME.."昆仑山乃修身之圣地，每个人都想加入本门。<color=yellow>马不前<color>(197/203) 答应让你加入.")
	end
end
--处理函数
function without_other_factask(faction_diff)
	for i = 1,getn(TB_FACTION_TASKID_LIST) do
		if i ~= faction_diff and GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
			return -1
		end
	end
	return GetTask(TB_FACTION_TASKID_LIST[faction_diff])
end
