
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 门派任务头文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================
Include("\\script\\global\\技能树操作.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
--越南09年11月活动
Include("\\script\\online\\viet_event\\200911\\event_head.lua");

--各门派的任务变量

FN_SL 	= 1001; --少林
FN_WD 	= 1002; --武当
FN_EM 	= 1003; --峨眉
FN_GB 	= 1004; --丐帮
FN_TM 	= 1005; --唐门
FN_YM 	= 1031; --杨门男
FN_YMM  = 1032; --杨门女
FN_WP   = 1033; --五毒

-- 子函数，用以获取门派任务的进展程度
function FN_GetTaskState(fn)

	return GetTask(fn)

end

-- 子函数，用以设置门派任务的进展程度
function FN_SetTaskState(fn, nValue)

	SetTask(fn, nValue)

end


-- 子函数，使门派任务进展到下一步
function FN_SetTaskAdd(fn)
	SetTask(fn, GetTask(fn) + 1)
	return
end


-- 子函数，用于扩展对话 TALK 函数的功能
function TE_Talk(num,fun,szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg .. format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"
	dostring(szmsg)
end	

--越南09年11月活动给掌门东西
function GiveItemToMaster(szHeader, nPlayerRoute)
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091113 and nDate < 091130 then
		if GetPlayerFaction() ~= nPlayerRoute then
			Talk(1, "", szHeader.."你不是本门弟子.");
			return 0;
		end
		if GetItemCount(2, 1, 30119) < 20 or GetItemCount(2, 1, 30120) < 20 then
			Talk(1, "", szHeader.."你在开玩笑吗?  Kh玭g ph秈 t苙g ta tr? v韎 b竛h hay sao?")
			return 0;
		end
		if GetTask(VIET_0911_TASK_ZHANGMEN_DATE) >= nDate then
			if GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) >= 2 then
				Talk(1, "", szHeader.."C竎 h? h玬 nay t苙g ta b竛h v? tr? 2 l莕 r錳, h穣 i ng祔 mai r錳 ti誴 t鬰.");
				return 0;
			else
				if GetTime() - GetTask(VIET_0911_TASK_ZHANGMEN_TIME) < 3600 then
					Talk(1, "", szHeader.."Gi穘 c竎h t苙g tr? v? b竛h c莕 60 ph髏, h穣 i th猰 ch髏 x輚 n鱝 nh?.");
					return 0;
				else
					if DelItem(2, 1, 30119, 20) == 1 and DelItem(2, 1, 30120, 20) == 1 then
						ModifyExp(3000000);
						SetTask(336, GetTask(336) + 20);
						SetTask(VIET_0911_TASK_ZHANGMEN_TIME, GetTime());
						SetTask(VIET_0911_TASK_ZHANGMEN_DATE, nDate);
						SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) + 1);
					end
				end
			end
		else
			SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, 0);
			if DelItem(2, 1, 30119, 20) == 1 and DelItem(2, 1, 30120, 20) == 1 then
				ModifyExp(3000000);
				SetTask(336, GetTask(336) + 20);
				SetTask(VIET_0911_TASK_ZHANGMEN_TIME, GetTime());
				SetTask(VIET_0911_TASK_ZHANGMEN_DATE, nDate);
				SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) + 1);
			end
		end
	end
end
--脚本功能：流派加入NPC相关功能统一处理
--功能设计：村长
--代码开发：村长
--开发时间：2009-3-14
--我问佛祖：bug为什么改不完？佛祖曰：策划乃bug之母。我问：bug之父呢？佛祖曰：非你莫属！
--门派名称
--====================门派传送人===============
g_szInfoHead = "<color=green>Ti誴 d蒼 m玭 ph竔<color>:";
MAX_SEL_PER_PAGE = 5;	--每页门派数量

TB_FACTION_PLACE =
{	--{门派名字,{坐标点信息},战斗状态,门派编号}
	{"Thi誹 L﹎",{204,1501,3328},1,1},
	{"V? ng",{312,1713,3469},1,2},
	{"Nga My",{303,1603,3240},1,3},
	{"C竔 Bang",{209,1528,3246},1,4},
	{"Л阯g M玭",{305,1532,2915},1,5},
	{"Thi猲 Ba Dng ph?",{219,1630,3274},1,6},
	{"Ng? чc Gi竜",{407,1555,3282},1,7},
	{"C玭 L玭",{509,1513,3285},0,8},
--	{"明教",{152,1518,3078},0,9},
	{"Th髖 Y猲",{404,1507,2788},0,10},
}
TB_FACTION_PLACE_INDEX = nil
function _init_TB_FACTION_PLACE_INDEX()
	if not TB_FACTION_PLACE_INDEX then
		TB_FACTION_PLACE_INDEX = {}
		for i=1,getn(TB_FACTION_PLACE) do
			local t = TB_FACTION_PLACE[i]
			TB_FACTION_PLACE_INDEX[t[4]] = t;
		end
		return 1
	end
end
--获得选项table
function get_list()
	local nFaction = GetPlayerFaction();
	local tbRetTb = {};
	local tbFactionTb = get_faction_list();
	local szFactionName = "";
	local nFactionIdx = 0;
	_init_TB_FACTION_PLACE_INDEX()
	for i=1,getn(tbFactionTb) do
		nFactionIdx = tbFactionTb[i];
		szFactionName = TB_FACTION_PLACE_INDEX[nFactionIdx][1];
		if i == 1 and nFaction ~= 0 then
			tinsert(tbRetTb,"关于师门("..szFactionName..")/#go_to_faction("..nFactionIdx..")");
		else
			tinsert(tbRetTb,szFactionName.."/#go_to_faction("..nFactionIdx..")");
		end;
	end;
	return tbRetTb;
end;
--获得门派对应的对话顺序table
function get_faction_list()
	local nFaction = GetPlayerFaction();
	local tbRetTb = {};	--返回table
	local tbInitTb = {};	--基础table，用作中间处理
	for i=1,getn(TB_FACTION_PLACE) do
		tbInitTb[i] = TB_FACTION_PLACE[i][4];
	end;
	if nFaction == 0 then
		tbRetTb = tbInitTb;
	else
		tinsert(tbRetTb,nFaction);	--先把对应的门派放第一位
		--tbInitTb[nFaction] = 0;	--标记对应的门派已放进tbRetTb
		for i=1,getn(tbInitTb) do
			if tbInitTb[i] ~= nFaction then
				tinsert(tbRetTb,tbInitTb[i])	--把剩下未放进tbRetTb的门派按顺序放进tbRetTb
			end;
		end;
	end;
	return tbRetTb;
end;
--列出对话选项
function list_content(nPageNum)
	local tbList = get_list();
	local nRecordCount = getn(tbList);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,format("\上一页/#list_content(%d)",nPageNum-1));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\下一页/#list_content(%d)",nPageNum+1));
	end;
	tinsert(selTab,"我想取消当前的入门任务./cancel_faction");
	tinsert(selTab,"我哪儿也不去./no");
	Say(g_szInfoHead.." 江湖各门派各有优势, 你想去哪个门派?",getn(selTab),selTab);
end
function moneygo()
	--if GetLevel()<70 then
		--return 1
	--elseif GetCash()>=500 then
		--PrePay(500)
		--return 1
	--else
		--return 0
	--end
	
	return 1
end;
--去目的地
function go_to_faction(nFaction)
	if moneygo() == 1 then
		CleanInteractive();
		local nMapID,nMapX,nMapY = 0,0,0;
		local nFightState = 0;
		_init_TB_FACTION_PLACE_INDEX()
		nMapID = TB_FACTION_PLACE_INDEX[nFaction][2][1];
		nMapX = TB_FACTION_PLACE_INDEX[nFaction][2][2];
		nMapY = TB_FACTION_PLACE_INDEX[nFaction][2][3];
		nFightState = TB_FACTION_PLACE_INDEX[nFaction][3];
		NewWorld(nMapID,nMapX,nMapY);
		SetFightState(nFightState);
	else
		Talk(1,"",g_szInfoHead.."你身上银两不足，赚够足够的银两再来!")
	end;
end;

function no()
end;

--取消目前所有入门任务进度
function cancel_faction()
	if GetPlayerFaction()~=0 then
		Say("你已加入门派, 你难道想退出?",0);
	else
		Say("现在你可以选择其他门派!",0);
		for i = 1,getn(TB_FACTION_TASKID_LIST) do
			SetTask(TB_FACTION_TASKID_LIST[i],0)
		end
		if GetNpcName(GetFollower())  == "小貂" then
			KillFollower()
		end
	end
end
--====================新门派其它功能===========
TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018,1019}
TB_FACTION_INFO = {
	"Thi誹 L﹎","V? ng","Nga My","C竔 Bang","Л阯g M玭","Dng M玭","Ng? чc","C玭 L玭","Minh gi竜","Th髖 Y猲",
}
--流派名称
TB_ROUTE_INFO = {
	"Thi誹 L﹎","Thi誹 T鬰","Thi襫 t╪g","V? t╪g","Л阯g M玭","Л阯g M玭","Nga My","Ph藅 Gia","T鬰 gia","C竔 Bang",
	"T辬h Y","? Y","V? ng","Чo Gia","T鬰 gia","Dng M玭","Thng K?","Cung K?","Ng? чc","T? hi謕",
	"C? s?","C玭 L玭","Thi猲 S?","Minh gi竜","Th竛h Chi課","Tr薾 Binh","Huy誸 Nh﹏","Th髖 Y猲","V? Ti猲","Linh N?",
	"Nh薽 Hi謕","Ki誱 T玭"
}
--门派对应的流派
TB_FACTION_ROUTE = {
	[8] = 22,
	[9] = 24,
	[10] = 28,
}
--掌门人NPC
TB_FACTION_MASTER_NAME = {
	[8] = "Chu B蕋 Ho芻",
	[9] = "Phng L筽",
	[10] = "S礽 Ho祅g Nhi",
}
--师门重复任务的对应难度
TB_FACTION_TASK_DIFF = {
	[23] = TASK_ID_KUNLUN_TIANSHI,
	[25] = TASK_ID_MINGJIAO_SHENGZHAN,
	[26] = TASK_ID_MINGJIAO_ZHENBING,
	[27] = TASK_ID_MINGJIAO_XUEREN,
	[29] = TASK_ID_CUIYAN_WUXIAN,
	[30] = TASK_ID_CUIYAN_LINGNV,
}
--师门密室NPC
TB_FACTION_BACK_NAME = {
	[8] = "Tr莕 B蕋 Vi",
	[9] = "L璾 Thanh Mi",
	[10] = "Th筩h B秓",
}
--流派入门相关
TB_ROUTE_IN_INFO = {
	[23] = {
		npc_name = "T莕 B蕋 Tri",
		bewrite = "昆仑景色清幽，正是修身养性之地！本脉武功只传天师弟子，通过焚化符现索祀风和雷两种再施展对应技能，风系技能以控制与防护为主，政击技能伤害偏低；雷系技能以伤害输出为主，攻击较高，技能多以群攻为主。本脉功夫以<color=yellow>内功<color>为基, ，武器以 <color=yellow>剑<color>来提升攻击.",
		in_route_talk = "现在我正式收你为弟子，并帮你重新洗髓，现在你可以回去见掌门了.",
		skill = {{4,"Ki誱 t蕁 c玭g b譶h thng"},{1017,"Th竔 蕋 T﹎ Ph竝"},{1018,"L玦 T?"},{1020,"Thi猲 L玦 Ph?"}},
		book={0,112,192,"Phong L玦 Ch﹗"},
		book_chip = {
			{2,95,1 ,"Phong L玦 Ch﹗ T祅 Quy觧-Thng"},
			{2,95,2 ,"Phong L玦 Ch﹗ T祅 Quy觧-Trung"},
			{2,95,3 ,"Phong L玦 Ch﹗ T祅 Quy觧-H?"},
		},
		equip = 2,
	},
	[25] = {
		npc_name = "L? Thi猲 Nhu薾",
		bewrite = "明教圣火经久不息，教内弟子皆为热血之人！本脉武功只传圣战弟子，通过积攒怨气择刀打击敌人，攻击时刚劲而威猛，防守时犹如讯墙铁壁。本脉功夫以<color=yellow>力量<color>为基,武器以<color=yellow>刀<color>来提升攻击能力。.",
		in_route_talk = "现在我正式收你为弟子，并帮你重新洗髓，现在你可以回去见教主了.",
		skill = {{3,"o t蕁 c玭g b譶h thng"},{1053,"Th竛h H醓 Kim L? C玭g"},{1054,"Th竛h H醓 o Ph竝"}},
		book={0,112,193,"C祅 Kh玭 Чi Na Di T﹎ Ph竝"},
		book_chip = {
			{2,95,4 ,"C祅 Kh玭 Чi Na Di T﹎ Ph竝 T祅 Quy觧-Thng"},
			{2,95,5 ,"C祅 Kh玭 Чi Na Di T﹎ Ph竝 T祅 Quy觧-Trung"},
			{2,95,6 ,"C祅 Kh玭 Чi Na Di T﹎ Ph竝 T祅 Quy觧-H?"},
		},
		equip = 3,
	},
	[26] = {
		npc_name = "Vng D莕",
		bewrite = "明教阵兵为教内的精锐之师，政无不克，战无不胜！本脉武功只传阵兵弟子，精通五行相生相克之理，笔雀质指，给敌人予以沉重。本脉功夫以洞察为基，武器以笔来提升政击能力。.",
		in_route_talk = "现在我正式收你为弟子，并帮你重新洗髓，现在你可以回去见教主了.",
		skill = {{8,"B髏 t蕁 c玭g b譶h thng"},{1083,"Quang Minh Ti猽 Dao C玭g"},{1084,"Quang Minh B髏 Ph竝"}},
		book = {0,112,194,"Quang Minh Ng? H祅h L謓h"},
		book_chip = {
			{2,95,7 ,"Quang Minh Ng? H祅h L謓h T祅 Quy觧-Thng"},
			{2,95,8 ,"Quang Minh Ng? H祅h L謓h T祅 Quy觧-Trung"},
			{2,95,9 ,"Quang Minh Ng? H祅h L謓h T祅 Quy觧-H?"},
			},
		equip = 9,
	},
	[27] = {
		npc_name = "T? H祅h Phng",
		bewrite = "明教教众亲如兄弟，而对敌人则要狠之又狠！本脉武功只待血人弟子，讲求动作迅速，身法敏据，用利瓜给敌人施以印记，则施展武功致敌于死地。本脉功夫以<color=yellow>身法<color>为基，以<color=yellow>瓜子<color>来提升攻击能力。.",
		in_route_talk = "现在我正式收你为弟子，并帮你重新洗髓，现在你可以回去见教主了.",
		skill = {{14,"Tr秓 t蕁 c玭g b譶h thng"},{1131,"H祅 B╪g T﹎ Ph竝"},{1132,"筺 C鑤 Tr秓"}},
		book={0,112,195,"H祅 B╪g Ng璶g Huy誸 Ch?"},
		book_chip = {
			{2,95,10,"H祅 B╪g Ng璶g Huy誸 Ch? T祅 Quy觧-Thng"},
			{2,95,11,"H祅 B╪g Ng璶g Huy誸 Ch? T祅 Quy觧-Trung"},
			{2,95,12,"H祅 B╪g Ng璶g Huy誸 Ch? T祅 Quy觧-H?"},
		},
		equip = 11,
	},
	[29] = {
		npc_name = "Chu T? V╪",
		bewrite = "烟繁花似锦，落英缤纷，正是练习舞蹈绝美之境！本脉武功只传舞仙弟子，讲求身法，可在武功施展过程中移动，醉人的舞蹈会削弱敌人，并且提高友方属性。本脉功夫以<color=yellow>身法<color>为基，以武器<color=yellow>灵枝<color>来提升攻击能力。.",
		in_route_talk = "现在我正式收你为弟子，并帮你重新洗髓，现在你可以回去见掌门了.",
		skill = {{15,"Linh Chi c玭g k輈h"},{1165,"Phong V? T﹎ Ph竝"},{1166,"Kh雐 V?"},{1167,"Linh Mi猽 V薾"}},
		book={0,112,196,"Ph鬾g Minh Ph?"},
		book_chip = {
			{2,95,13,"Ph鬾g Minh Ph? T祅 Quy觧-Thng"},
			{2,95,14,"Ph鬾g Minh Ph? T祅 Quy觧-Trung"},
			{2,95,15,"Ph鬾g Minh Ph? T祅 Quy觧-H?"},
		},
		equip = 13,
	},
	[30] = {
		npc_name = "H? Man Th祅h",
		bewrite = "只有拥有自然之心，才能与小绍和睦相处！本脉武功只传灵女弟子，平时学习喂养小绍，伴随其成长，战斗时可通过笛子召唤小招施展武功攻击敌人。本脉功夫以<color=yellow>洞察<color>为基，武器以<color=yellow>笛子<color>来提升攻击能力。.",
		in_route_talk = "现在我正式收你为弟子，并帮你重新洗髓，现在你可以回去见掌门了.",
		skill = {{16,"S竜 c玭g k輈h b譶h thng"},{1217,"B竎h Hoa Ng鋍 L? C玭g"},{1218,"Nu玦 Ti觰 猽"},{1219,"L筩 Hoa Quy誸"}},
		book={0,112,197,"Hoa Ti猲 T﹎ Kinh"},
		book_chip = {
			{2,95,16,"Hoa Ti猲 T﹎ Kinh T祅 Quy觧-Thng"},
			{2,95,17,"Hoa Ti猲 T﹎ Kinh T祅 Quy觧-Trung"},
			{2,95,18,"Hoa Ti猲 T﹎ Kinh T祅 Quy觧-H?"},
		},
		equip = 12,
	},
	[31] = {
		npc_name = "Л阯g L閚g Nguy謙",
		bewrite = "Х v祇 h? ph竔 ta th? ng c﹗ n? l? c? nh? Л阯g, c? t飝 ? h祅h t萿 giang h?. Ch駓 th? l? v? kh? s? trng c馻 ph竔 ta.",
	},
	[32] = {
		npc_name = "V﹏ Hi H遖",
		bewrite = "Х v祇 h? ph竔 ta ph秈 th? c? i mang ki誱 tu h祅h, th鵦 thi ch輓h ngh躠. Ki誱 l? v? kh? s? trng c馻 ph竔 ta.",
	},
}
--师门外装
TB_FACTION_SUIT_INFO = {
	[8] = 530,
	[9] = 534,
	[10] = 532,
}
--镇派秘籍兑换几率
TB_BOOK_CHG_ODD = {
	{1,5,50},
	{5,3,60},
	{50,60,40},
}
--师门售卖
TB_FACTION_SALE = {
	[1]={44,66,67},
	[2]={46,78,79},
	[3]={45,72,73},
	[4]={47,75,76},
	[5]={48,69,70},
	[6]={51,81,82},
	[7]={55,84,85},
	[8]={112,113,114},
	[9]={116,117,118},
	[10]={120,121,122},
}
--师门售卖NPC
TB_FACTION_SALE_NPC = {
	[1] = "T? V╪ Чt",
	[2] = "Y猲 Nh?",
	[3] = "Di謕 T? Hinh",
	[4] = "V璾 Tri V?",
	[5] = "Л阯g Thi猲 H秈",
	[6] = "Dng B礽 Phong",
	[7] = "Th竔 Quang",
	[8] = "Mai B蕋 Dung",
	[9] = "Phng Th蕋 Ph藅",
	[10] = "H? H礽",
}
--师门传送
TB_TRANSPORT_INFO = {
	[8] = {"<color=green>Vng B蕋 Ph祄<color>: Зy l? n骾 C玭 L玭, gi竜 ph竔 ta tuy ch璦 thu nh薾  t? nh璶g  c? nhi襲 v? l﹎ trung nh﹏ y tham quan, ngi c? th? v祇 y th╩ th?. Л阯g n骾 hi觤 tr?, n誹 mu鑞 xu鑞g n骾 ta s? d蒼 阯g.",
		{
			{300,1793,3544},
			{300,1755,3518},
			{300,1718,3534},
			{300,1744,3562},
		}
	},
	[9] = {"<color=green>Phng B竎h Hoa<color>: N琲 n祔 nguy hi觤,  ta a ngi m閠 畂筺.",
		{
			{100,1460,2967},
			{100,1429,3005},
			{100,1398,2979},
			{100,1433,2947},
		}
	},
	[10] = {"<color=green>X秓 X秓<color>: Th髖 Y猲 phong c秐h h鱱 t譶h nh璶g d? l筩 阯g,  ta a ngi ra",
		{
			{400,1549,2968},
			{400,1512,2980},
			{400,1533,2993},
			{400,1541,2935},
		}
	}
}

--=============流派师父相关=================
function master_main(faction_seq,route_seq)
	local t_dia_sel = {
--		"弟子参拜师傅/#get_in_route("..faction_seq..","..route_seq..")",
		"学习"..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].."武功/#learn_skill("..route_seq..")",
--		"我得到了本门镇派秘籍的残卷/#book_chg("..route_seq..")",
		"打个招呼/end_dialog",
	}
	local t_dia_show = {}
	local s_dia_main = "<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: "..TB_ROUTE_IN_INFO[route_seq].bewrite
	if GetPlayerFaction() == faction_seq then
		--if GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq] then
			--tinsert(t_dia_show,t_dia_sel[1])
		--elseif GetPlayerRoute()  == route_seq then
		if GetPlayerRoute()  == route_seq then
			tinsert(t_dia_show,t_dia_sel[1])
--			tinsert(t_dia_show,t_dia_sel[3])
			if route_seq == 30 then
				tinsert(t_dia_show,"H穣 a ta 1 <Dng 猽 Ch? Nam>/give_yangdiao_book"); --养貂指南
			end
			if route_seq == 32 then
				tinsert(t_dia_show,"Nh薾 頲 nguy猲 li謚 luy謓 ki誱/#show_equip_shop(80)"); --炼剑材料
			end
		end
	end
	tinsert(t_dia_show,t_dia_sel[2])
	if getn(t_dia_show) == 1 then
		Talk(1,"",s_dia_main)
	else
		Say(s_dia_main,
			getn(t_dia_show),
			t_dia_show
		)
	end
end
--拜师
function get_in_route(faction_seq,route_seq)
	Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Х ho祅 th祅h <color=yellow>nhi謒 v? nh藀 m玭<color>, ngi  l? ngi c馻 <color=yellow>"..TB_FACTION_INFO[faction_seq].."<color> ta, m閠 khi  v祇 s? th? thay i, suy ngh? k? ch璦?",
		2,
		"我已经考虑好了,想拜您为师"..TB_ROUTE_INFO[route_seq].."/#in_route_dtm("..faction_seq..","..route_seq..")",
		"我再想一想/end_dialog"
	)
end
function in_route_dtm(faction_seq,route_seq)
	if GetFreeItemRoom() < 8 then
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: N誹  quy誸 v祇 m玭 ph竔 ta, b鎛 s? s? t苙g ngi m閠 v礽 trang b? t﹏ th? xem nh? l? qu? nh藀 m玭, h穣 s緋 x誴 l筰 h祅h trang r錳 quay l筰 nh薾 (C莕 <color=yellow>8<color> ? t骾 tr鑞g!)")
		return
	end
	if GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq] and GetPlayerFaction() == faction_seq then
		SetPlayerRoute(route_seq)
		ResetProperty()        --洗潜能点
		--技能学习
		for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].skill) do
			LearnSkill(TB_ROUTE_IN_INFO[route_seq].skill[i][1])
			Msg2Player("C竎 h?  l躰h h閕"..TB_ROUTE_IN_INFO[route_seq].skill[i][2])
		end
		--师门第一套
		local particular_id = route_seq*1000+100+GetBody()
		local suit_id = TB_FACTION_SUIT_INFO[faction_seq] - 1+GetBody()
		if faction_seq == 10 then
			particular_id = particular_id - 2
			suit_id = suit_id - 2
		end
			--师门外装增加
			AddItem(0,108,suit_id,1)
			AddItem(0,109,suit_id,1)
			--头
			AddItem(0,103,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--衣服
			AddItem(0,100,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--下装
			AddItem(0,101,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--武器
			AddItem(0,TB_ROUTE_IN_INFO[route_seq].equip,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--增加貂
			if route_seq == 30 then
				AddItem(2,20,1,1)
			end
		--对话
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: ".. TB_ROUTE_IN_INFO[route_seq].in_route_talk)
	else
		return
	end
end
--学习技能
function learn_skill(route_seq)
	if GetPlayerRoute() ~= route_seq then	--流派检测
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ngi kh玭g ph秈  t? c馻 ta, kh玭g th? h鋍 v? c玭g V? ng o gia.")
	else
		Say(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: G鉩 ph秈 bi觰 tng v? c玭g hi謓 # l? v? c玭g c? th? h鋍, hi謓 # l? c? th? t╪g c蕄, nh蕄 chu閠 tr竔 v祇 l? 頲.")
		AllowLearnSkill()
	end
end
--===============镇派秘籍相关===========
function book_chg(route_seq)
	if GetPlayerRoute() ~= route_seq then	--流派检测
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Kh玭g ph秈  t? c馻 ta, M藅 T辌h Tr蕁 Ph竔 n祔 kh玭g th? giao cho ngi!")
		return
	end
	--残卷拥有检测
	for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].book_chip) do
		if GetItemCount(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3]) > 0 then
			Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Th藅 kh玭g ng? th玭g qua th? luy謓 ngi l筰 c? th? nh薾 頲 M藅 T辌h Tr蕁 Ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Ta s? gi髉 ngi ng l筰 th祅h m閠 quy觧 ho祅 ch豱h nh璶g th祅h c玭g hay kh玭g c遪 xem ngi c? may m緉 kh玭g.",
				2,
				"Лa c竎 trang s竎h cho s? ph?/#hand_up("..route_seq..")",
				"Kh玭g c莕 u/no"
				)
			return
		end
	end
	Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ngi ch璦 t鮪g nh薾 頲 M藅 T辌h V? C玭g T祅 Quy觧 n祇.")
end
function hand_up(route_seq)
	Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: N誹 nh? ngi c?  3 t藀 thng, trung, h?, ta nh蕋 nh s? ng l筰 th祅h m閠 quy觧 ho祅 ch豱h.",
		2,
		"уng ? ng s竎h/#hand_up_dtm("..route_seq..")",
		"Kh玭g c莕 u/no"
	)
end
function hand_up_dtm(route_seq)
	--携带、删除判断
	local s_del_log = "[S? M玭 M藅 T辌h]  ngi ch琲"..GetNpcName()
	local t_del_num = {}
	for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].book_chip) do
		if GetItemCount(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3]) > 0 then
			if DelItem(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3],1) == 1 then
				s_del_log = s_del_log.."H駓 1 quy觧"..TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][4].." th祅h c玭g "
				tinsert(t_del_num,i)
			end
		end
	end
	-- 啥也没有
	if getn(t_del_num) == 0  then
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ngi ch璦 t鮪g nh薾 頲 M藅 T辌h V? C玭g T祅 Quy觧 n祇.")
		return
	end
	--几率判断
	local ran_num = random(100)
	local add_odds = 0
	if getn(t_del_num) == 3 then
		add_odds = 100
	else
		if getn(t_del_num) == 1 then
			tinsert(t_del_num,t_del_num[1])
		end
		add_odds = TB_BOOK_CHG_ODD[t_del_num[1]][t_del_num[2]]
	end
	-- 可以给秘籍
	if (add_odds >= ran_num) then
		local add_flag = AddItem(TB_ROUTE_IN_INFO[route_seq].book[1],TB_ROUTE_IN_INFO[route_seq].book[2],TB_ROUTE_IN_INFO[route_seq].book[3], 1)
		if add_flag == 1 then
			Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ngi th藅 may m緉, M藅 T辌h Tr蕁 Ph竔 S? M玭 xin giao cho ngi!")
			Msg2Player("Nh薾 頲 M藅 T辌h Tr蕁 Ph竔 S? M玭: "..TB_ROUTE_IN_INFO[route_seq].book[4].."1 quy觧!")
		else
			WriteLog(s_del_log.."	Th猰 M藅 T辌h S? M玭 th蕋 b筰, nh d蕌 th蕋 b筰: "..add_flag)
		end
	else
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: фi M藅 T辌h Tr蕁 Ph竔 th蕋 b筰!")
	end;
end
--对话结束
function end_dialog()
end
TB_FACTION_WEAPON_ROUTE = {
	[2] = {3,5},
	[3] = {8},
	[4] = {0},
	[6] = {1},
	[8] = {2},
	[9] = {10},
	[11] = {0},
	[12] = {5},
	[14] = {2},
	[15] = {9},
	[17] = {6},
	[18] = {4},
	[20] = {7},
	[21] = {11},
	[23] = {2},
	[29] = {13},
	[30] = {12},
}
--老门派师门第一套增加
function old_route_equip_add(route_seq)
	--判断输入正确性
	if TB_FACTION_WEAPON_ROUTE[route_seq] == nil then
		return 0
	end
	--增加空间负重检测
	if GetFreeItemRoom() <  8 then
		Talk(1,"","<color=green>"..GetTargetNpcName().."<color>: N誹  quy誸 v祇 m玭 ph竔 ta, b鎛 s? s? t苙g ngi m閠 v礽 trang b? t﹏ th? xem nh? l? qu? nh藀 m玭, h穣 s緋 x誴 l筰 h祅h trang r錳 quay l筰 nh薾 (C莕 <color=yellow>8<color> ? t骾 tr鑞g!)")
		return 0
	end
	--增加装备
		--师门第一套
	local particular_id = route_seq*100+GetBody()
	if route_seq == 8 or route_seq == 9 then
		particular_id = particular_id - 2
	end
	--头
	AddItem(0,103,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--衣服
	AddItem(0,100,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--下装
	AddItem(0,101,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--武器
	for i = 1,getn(TB_FACTION_WEAPON_ROUTE[route_seq]) do
		AddItem(0,TB_FACTION_WEAPON_ROUTE[route_seq][i],particular_id,1,1,-1,-1,-1,-1,-1,-1)
	end
	return 1
end
--=============师门重复任务相关==========
function ftask_repeat_main(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Tr? gian l? nhi謒 v? c馻 ch輓h ph竔 ch髇g ta, ng l祄 m蕋 thanh danh s? m玭!",
		4,
		"开始师门任务/#start_faction("..faction_seq..")",
		"师门贡献度检查./#check_query("..faction_seq..")",
		"师门任务说明./shimenshuoming",
		"   /#repair_faction("..faction_seq..")",
		"离开/end_dialog"
		)
end
function start_faction(faction_seq)
	if (GetPlayerFaction() ~= faction_seq) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Ch? c?"..TB_FACTION_INFO[faction_seq].." t? ta m韎 頲 c鑞g hi課 b鎛 m玭!")
		return
	elseif (GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq]) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: H穣 b竔 s? h鋍 ngh? trc, r錳 h穣 g鉷 s鴆 cho s? m玭!")
		return
	else
		task_main_entrance(TB_FACTION_TASK_DIFF[GetPlayerRoute()])
	end
end
function check_query(faction_seq)
	if (GetPlayerFaction() == 0) then	-- 没有加入门派
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Mu鑞 c鑞g hi課 cho b鎛 m玭 th? ph秈 gia nh藀 b鎛 m玭 trc. Gia nh藀 ph竔 b蕋 k? c? th? t韎 y nh薾 nhi謒 v?. Ho祅 th祅h nhi謒 v? s? m玭 s? nh薾 頲 甶觤 s? m玭, t輈h l騳  mua v藅 ph萴 b? truy襫 c馻 b鎛 m玭.")
		return
	end

	if (GetPlayerFaction() ~= faction_seq) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Kh玭g ph秈  t? b鎛 m玭, h穣 t韎 m玭 ph竔 c馻 m譶h xem 甶觤 s? m玭. F3 m? giao di謓 xem 甶觤 s? m玭.")
		return
	end
	query_faction_contribute()
end
function shimenshuoming()
	Talk(1,"shuoming2","<color=green>Thuy誸 minh  c鑞g hi課 s? m玭<color>: \n <color=yellow>ч c鑞g hi課 s? m玭<color>: Th玭g qua vi謈 ho祅 th祅h nhi謒 v? S? M玭 t n m閠 ng c蕄 nh蕋 nh, b筺 c? th? nh薾 頲 trang ph鬰 ho芻 v? kh? c馻 S? M玭. \n <color=yellow>Gi韎 h筺  c鑞g hi課 s? m玭<color>: Hi謓 nay  c鑞g hi課 S? M玭 kh玭g b? h筺 ch?, ch? c莕 ho祅 th祅h nhi謒 v? th? c? th? n﹏g cao  c鑞g hi課. \n <color=yellow>S? ki謓 V? L﹎<color>: L祄 xong nhi謒 v? c? nh s? nh薾 th猰 m閠 nhi謒 v? ng蓇 nhi猲, ho祅 th祅h s? nh薾 頲 50 甶觤 c鑞g hi課 S? m玭 v? c? kh? n╪g nh薾 頲 m藅 t辌h s? m玭.")
end
function shuoming2()
	Talk(1,"","<color=green>Thuy誸 minh  c鑞g hi課 s? m玭<color>: \n <color=yellow>Gi韎 h筺 ng c蕄  c鑞g hi課 S? M玭<color>: Ъng c蕄 kh竎 nhau th? 甶觤 t輈h l騳  c鑞g hi課 c騨g kh玭g gi鑞g nhau. ч c鑞g hi課 S? M玭 c祅g cao c祅g n﹏g cao ng c蕄 c馻 m譶h, t? sau c蕄 75 th? kh玭g c遪 gi韎 h筺  c鑞g hi課 n鱝. \n <color=yellow>觤 kinh nghi謒 ng蓇 nhi猲<color>. L祄 nhi襲 nhi謒 v? s? m玭  c鑞g hi課 c祅g cao 甶觤 kinh nghi謒 c祅g nhi襲. 觤 c鑞g hi課 <3000 <color=yellow>觤 kinh nghi謒 tng i<color>, >3000 <color=yellow>甶觤 kinh nghi謒 c祅g nhi襲<color>.")
end
-- 修复杀怪任务无法完成的bug
function repair_faction(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Do b薾 r閚 c玭g v? n猲 qu猲 chuy謓 ngi l祄 nhi謒 v?. Зy c騨g l?  ngi r蘮 luy謓! Gi? ta s? gi髉 ngi h駓 nhi謒 v? trc, nh璶g ph秈 tr? 5 甶觤 s? m玭, ng ? kh玭g?",
		2,
		"Л頲, ta ng ?/#cfm_repair_bug("..faction_seq..")",
		"в ta ngh? c竎h kh竎/no")
end;

function cfm_repair_bug(faction_seq)
	RepairAllChainTask()
	Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Л頲, ta  h駓 gi髉 ngi r錳!")
end;
--==============闭关修炼=================
cards_table = {
    {2, 0, 205},
    {2, 0, 206},
    {2, 0, 207},
    {2, 0, 208},
    {2, 0, 209},
    {2, 0, 350},
    {2, 0, 390},
    {2, 0, 787},
    {2, 0, 788},
    {2, 0, 789},
}
function practice_main(faction_seq)
		if GetPlayerFaction() == 0 then return 0; end
    if GetPlayerFaction() ~= faction_seq then
       Talk(1, "", "<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Th? ch? kh玭g ph秈"..TB_FACTION_INFO[faction_seq].." t? c馻 ta, kh玭g th? tu luy謓 ? b鎛 ph竔.");
    else
        if GetItemCount(cards_table[faction_seq][1],cards_table[faction_seq][2],cards_table[faction_seq][3]) >= 1 then  --师门令牌
            Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: V祇 tu luy謓 kh玭g?",
            	2,
            	"ng/practice_start",
            	"Sai/no_practice");
        else
            Talk(1, "", "<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Ngi kh玭g c?<color=yellow>"..TB_FACTION_INFO[faction_seq].."L謓h B礽 S? M玭<color>, kh玭g th? b? quan tu luy謓.");
        end;
    end;
end
--=============师门密室NPC对话==========
function backdoor_main(faction_seq)

end
--=============师门售卖=================
function sale_main(faction_seq)
	local player_sex_name = "Чi hi謕"
	if GetSex() == 2 then
		player_sex_name = "N? hi謕 "
	end
	if GetPlayerFaction() == faction_seq  then
		Say("<color=green>"..TB_FACTION_SALE_NPC[faction_seq].."<color>: <color=yellow>"..player_sex_name.."<color>, c? th? gi髉 頲 g? cho ngi?",
		4,
		"我想买些师门用品./#Sale("..TB_FACTION_SALE[faction_seq][1]..")",
		"我听说师门有一套适合江湖新手的神兵宝甲？我想看看./#Sale("..TB_FACTION_SALE[faction_seq][2]..")",
		"我听说师门有一套适合江湖老手的神兵宝甲？我想看看/#Sale("..TB_FACTION_SALE[faction_seq][3]..")",
		"我只是随便看看/end_dialog"
		)
	else
		Say("<color=green>"..TB_FACTION_SALE_NPC[faction_seq].."<color>:有什么能帮到你?",
		2,
		"我想买些师门用品./#Sale("..TB_FACTION_SALE[faction_seq][1]..")",
		"我只是随便看看/end_dialog"
		)
	end
end
--==============师门传送==================
function transport_main(faction_seq)
	Say(TB_TRANSPORT_INFO[faction_seq][1],
		2,
		"请送我一程吧/#trans_2_city("..faction_seq..")",
		"我要看看风景/end_dialog"
	)
end
--传送走
function trans_2_city(faction_seq)
	if(GetPKValue() >3 ) then
		Msg2Player("恶人不得在此出入.")
	end
    SetFightState(0)
	local n_ran_att = random(getn(TB_TRANSPORT_INFO[faction_seq][2]))
	NewWorld(TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][1],TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][2],TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][3])
end

function showlimit(n)	--师门说话
--	if n==1 then
--		Say(NPC_NAME.."你的武功精进了！",0)
	if n==2 then
		Say("你的等级不足，请加倍努力!",0)
	elseif n==3 then
		Say("你的经验值不足，请加倍努力!",0)
	elseif n==4 then
		Say("你的声望不足，请继续努力!",0)
	elseif n==5 then
		Say("V? c玭g trc y vi s? d箉 ngi ch璦 luy謓 th祅h, kh玭g th? d箉 ngi v? c玭g m韎!",0)
	elseif n==6 then
		Say("你的银两不足，请赚够钱再来",0)
	else
	end
end;
function beforelearnskill(id)
end

function afterlearnskill(id)
	if id == 1032 or id == 1196 or id == 1066 or id == 1230 or id == 1213 or id == 1096 or id == 1883 or id == 1897 then
		if GetSkillLevel(id) == 1 then
			SetMomentum(10)
			RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
		end
	end
end

function give_yangdiao_book()
	if BigGetItemCount(2,100,33) >= 1 then
		Talk(1,"","<color=green>H? Man Th祅h<color>: Ngi  c? 1 cu鑞 trong rng r錳 th? ph秈?");
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","<color=green>H? Man Th祅h<color>: H穣 s緋 x誴 l筰 ? t骾.");
		return 0;
	end
	AddItem(2,100,33,1);
	Talk(1,"","<color=green>H? Man Th祅h<color>: Зy l? <Dng 猽 Ch? Nam>, h穣 gi? k?");
end
