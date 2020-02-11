--作者：严军
--创建日期：07年11月13日14:50
--师傅脚本
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
g_szThisFile = "\\script\\task\\faction_back_room\\npc_master.lua";	--默认值
g_szInforHeader = "";	--默认值
g_nBackRoomEntryType = 1;	--入口类型，分两种。1表示从师傅处进入，2表示从道具处进入

function main()
	--do return end
	backroom_main();
end;

function backroom_main()
	--do return end
	Talk(1,"backroom_main_entry"," \n  少侠可是要挑战师门密室？");
end;

g_tbDialog = 
{
	[0] = {[0] = "",[1] = "",[2] = "",[3] = ""},
	[1] = 
		{	--少林
			[0] = "<color=green>玄空<color>:",
			[1] = "师门秘室，只可本门弟子前往，秘室内皆是本门前辈高手，千万要小心了！",	
			[2] = "T? khi Thi誹 L﹎ t? 頲 s竛g l藀, Чt Ma vi謓, La H竛 阯g 頲 d鵱g l猲 n nay, v? ngh? Thi誹 L﹎ b総 u danh tr蕁 thi猲 h?. La H竛 阯g l? n琲 c? ng? c馻 c竎 h? t? v? t╪g. H? t? v? t╪g 頲 tuy觧 l鵤 kh総 khe t? c竎 t? vi謓, v? ngh? cao th﹎, c? tr竎h nhi謒 canh gi? an to祅 cho Thi誹 L﹎ t?. B﹜ gi? vi謈 tu s鯽  xong, h? ki猰 th猰 vi謈 ? S? m玭 m藅 th蕋, gi髉 ch髇g  t? r蘮 luy謓 v? ngh?.",
			[3] = "少侠可是要挑战师门秘室？",
		},	
	[2] = 
		{	--武当
			[0] = "<color=green>薛云铮<color>:",
			[1] = "师门秘室，只可本门弟子前往，秘室内皆是本门前辈高手，千万要小心了！",	
			[2] = "Trong b秠 mi hai nh n骾 ? V? ng s琻, ch? c? Huy襫 V? Phong m﹜ ph? t? b?, p nh? ti猲 c秐h. C? r蕋 nhi襲 cao s? trong ph竔 l竛h xa c鈏 i t鬰 lu?, 萵 th﹏ tu luy謓 t筰 Huy襫 V? Phong, ﹎ th莔 b秓 v? an to祅 cho t玭g ph竔. N誹 c竎  t? c? g? ch璦 r? trong l骳 luy謓 v?, ho芻 mu鑞 ki觤 tra th鵦 l鵦 c馻 m譶h, u c? th? n Huy襫 V? Phong th? m閠 phen.",
			[3] = "少侠可是要挑战师门秘室？",
		},	
	[3] = 
		{	--峨嵋
			[0] = "<color=green>慧芸师太<color>:",
			[1] = "师门秘室，只可本门弟子前往，秘室内皆是本门前辈高手，千万要小心了！",	
			[2] = "Ph藅 ph竝 r阨 xa th藀 tng, kh玭g ng? tng, kh玭g ch髇g sinh tng,  g鋓 l? v? tng. V? Tng Gian  頲 ki課 t筼 t? l骳 b鎛 ph竔 khai s琻 l藀 ph竔. Ph竔 ta nh藀 Ph藅 o,  t鮪g g苝 bi誸 bao nhi猽 th╪g tr莔, cho n猲 v? c玭g c馻 Nga My ph竔 ngo礽 vi謈 cng th﹏ h? th?, c遪 d飊g  c鴘 nh﹏  th?. Trong V? Tng Gian c? r蕋 nhi襲 ti襫 b鑙 c馻 b鎛 ph竔, l? nh鱪g ngi t礽 n╪g xu蕋 ch髇g trong s? m玭, ch髇g  t? c? th? n  tham thi襫 ng? Ph藅, tu luy謓 v? ngh?.",
			[3] = "少侠可是要挑战师门秘室？",
		},	
	[4] = 
		{	--丐帮
			[0] = "<color=green>彭虏望<color>:",
			[1] = "师门秘室，只可本门弟子前往，秘室内皆是本门前辈高手，千万要小心了！",	
			[2] = "N╩  bang ch髇g ta t? ngh躠 ? H祇 Tung C鑓, th藅 l? r莔 r? ch璦 t鮪g th蕐,  t n襫 m鉵g cho C竔 Bang ta tr? th祅h Thi猲 h?  nh蕋 bang! Trong bang quy誸 nh ch鋘 H祇 Tung C鑓 l祄 s? m玭 tu luy謓 trng, cho t藀 h頿 truy襫 c玭g trng l穙, thi誸 k? ra nhi襲 c? quan,  ch髇g  t? c? ch鑞 tu luy謓, nh? l筰 s? anh d騨g c馻 c竎 ti襫 b鑙, th骳 gi鬰 ch髇g  t? si猲g n╪g tu luy謓 v? c玭g, l藀 danh tr猲 ch鑞 giang h?!",
			[3] = "少侠可是要挑战师门秘室？",
		},	
	[5] = 
		{ 	--唐门	
			[0] = "<color=green>唐苏幕<color>:",
			[1] = "师门秘室，只可本门弟子前往，秘室内皆是本门前辈高手，千万要小心了！",	
			[2] = "333312",
			[3] = "少侠可是要挑战师门秘室？",
		},	
	[6] = 
		{	--杨门
			[0] = "<color=green>杨延昭<color>:",
			[1] = "师门秘室，只可本门弟子前往，秘室内皆是本门前辈高手，千万要小心了！",	
			[2] = "Gia ph? Dng Nghi謕 nh薾 th? phong c馻 tri襲 nh, m閠 l遪g b竜 qu鑓, tr蕁 th? thi猲 m玭 tr薾. Con ch竨 Dng gia ph秈 c莕 m蒼 luy謓 v?, b竜 琻 tri襲 nh, l祄 r筺g uy danh Dng.Gia qu﹏.",
			[3] = "少侠可是要挑战师门秘室？",
		},	
	[7] = 
		{	--五毒
			[0] = "<color=green>勾册<color>:",
			[1] = "师门秘室，只可本门弟子前往，秘室内皆是本门前辈高手，千万要小心了！",	
			[2] = "B鎛 gi竜 t? l骳 Thi Thng, C? Thng s竛g l藀, v蒼 thng g苝 ph秈 m閠 s? hung th莕 竎 thi v? thi猲 ni猲 c c? r蕋 kh? thu ph鬰. Nh璶g  m韎 l? c? s? c莕 thi誸  cho v? c玭g c馻 b鎛 m玭 ng祔 m閠 ph竧 tri觧. Cho n猲  cho thu th藀 nh鱪g thi c? hi誱 th蕐, t祅g tr? ? U Nan Qu藅, ng th阨 ph竔 nh鱪g cao th? ti襫 b鑙 trong gi竜 ph竔 n nghi猲 c鴘. D莕 d?, nh鱪g ti襫 b鑙 n祔 u b? m蕋 h誸 tr? nh?. е t? b鎛 gi竜 c? th? n y  tu luy謓. Nh璶g s鑞g ch誸 do tr阨 nh, n誹 kh玭g th? tr? ra, th? c騨g ng tr竎h s? m玭 kh玭g b竜 trc, ho芻 l? th蕐 ch誸 m? kh玭g c鴘!",
			[3] = "少侠可是要挑战师门秘室？",
		},	
}

function backroom_main_entry()
	local nFaction = 0;
	if g_nBackRoomEntryType == 2 then
		nFaction = GetPlayerFaction();
	else
		nFaction = backroom_get_faction();
	end;
	local szInforHeader = backroom_get_infoheader();
	BR_WeeklyClear();
	local selTab = {
				". 挑战师门秘境/backroom_challenge",
				--". 师门秘境背景和介绍/backroom_know_detail",
				--". 换取师门令牌/BR_KnowLimit",
				". 查看失败次数/backroom_reset_award_num",
				--". 师门背景？/backroom_know_background",
				". 查看排行榜/backroom_see_all_faction_rank",
				". 换取师门秘室奖励/backroom_get_reward",
				". 获得师门秘室传送令/backroom_get_smmscsl",
				"我就是过来看看你!/nothing",
				}
	if g_nBackRoomEntryType == 2 then
		tremove(selTab,5);	--去掉师门秘室背景
		tremove(selTab,5);	--去掉查看排行榜
		tremove(selTab,5);	--去掉换取奖励
	end;
	local szDialog = "";
	if nFaction == 0 then
		szDialog = "S? m玭 m藅 th蕋 l? n琲 tu luy謓 d祅h cho  t? b鎛 ph竔, m鏸 l莕 tu luy謓 xong ngi s? c秏 th蕐 th﹏ th? i kh竎, c玭g l鵦 t╪g cao!";
	else
		szDialog = g_tbDialog[nFaction][1];
	end;
	Say(szInforHeader..szDialog.."<color=yellow>目前只开放前9个难度",getn(selTab),selTab);
end;

function backroom_get_smmscsl()
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,0,1054,1) >= 1 then
		Talk(1,"",szInforHeader.."B筺  c? 1 S? m玭 m藅 th蕋 truy襫 t鑞g l謓h trong h祅h trang.");
		return 0;
	end;
	AddItem(2,0,1054,1);
	Msg2Player("你获得了一个师门秘室传送令");
end;

function backroom_know_background()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = backroom_get_faction();
	local szDialog = "";
	szDialog = g_tbDialog[nFaction][2]
	Talk(1,"backroom_main_entry",szInforHeader..szDialog);
end;

function backroom_see_all_faction_rank()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = backroom_get_faction();
	if nFaction == 0 then
		nFaction = GetPlayerFaction();
	end;
	if g_nBackRoomEntryType == 1 then	--如果是从师傅处进入
		backroom_see_faction_rank(nFaction);
		return 0;
	end;
	--下面是处理从道具处进入，从道具处进入可以查看任意流派的排行榜
	local selTab = {};
	for i=1,getn(TB_FACTION_NAME) do
		tinsert(selTab,TB_FACTION_NAME[i].."/#backroom_see_faction_rank("..i..")");
	end;
	tinsert(selTab,"打扰了./nothing");
	Say(szInforHeader.."B筺 mu鑞 ki觤 tra th玭g tin x誴 h筺g c馻 l璾 ph竔 n祇?",getn(selTab),selTab);
end;

function backroom_reset_award_num()
	local szInforHeader = backroom_get_infoheader();
	if GetTask(TSK_WC_FAIL_TIMES) < MAX_FAILURE_TIMES then
		Talk(1,"",szInforHeader.."您本周还剩余<color=yellow>"..MAX_FAILURE_TIMES.."<color>次挑战次数。");
		return 0;
	end;
	local selTab = {
				"确定./backroom_reset_award_num_confirm",
				"打扰了. /nothing",
				}
	Say(szInforHeader.."Xo? d? li謚 1 tu莕 <color=yellow>"..MAX_FAILURE_TIMES.."<color> l莕 tr? l猲 m韎 c? th? s? d鬾g, m鏸 l莕 ti猽 hao <color=yellow>"..TB_ITEM[1][1].." 50<color> c竔, sau khi s? d鬾g, b筺 c? th? nh薾 頲 b秓 rng ? m藅 th蕋 m閠 l莕 n鱝. <color=yellow>T╪g s? l莕 nh薾 ph莕 thng, s? t? ng xo? d? li謚<color>. B筺 x竎 nh薾 mu鑞 s? d鬾g?",getn(selTab),selTab);
end;

function backroom_reset_award_num_confirm()
	local szInforHeader = backroom_get_infoheader();
	if DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],50) == 1 then
		SetTask(TSK_WC_FAIL_TIMES,0);
		SetTask(TSK_WC_LAST_RECORD,0);
		Say(szInforHeader.."Х t╪g s? l莕 nh薾 ph莕 thng th祅h c玭g, tu莕 n祔 b筺 c? th? v祇 m藅 th蕋 nh薾 b秓 rng th猰 m閠 l莕 n鱝.",0);
		Msg2Player("Х t╪g s? l莕 nh薾 ph莕 thng th祅h c玭g, tu莕 n祔 b筺 c? th? v祇 m藅 th蕋 nh薾 b秓 rng th猰 m閠 l莕 n鱝");
		WriteLog(LOG_HEADER..GetName().."S? d鬾g S? m玭 m藅 l謓h  t╪g s? l莕 nh薾 ph莕 thng");
	else
		Talk(1,"",szInforHeader.."B筺 c莕 c? <color=yellow>50 c竔 "..TB_ITEM[1][1].."<color>.");
	end;
end;

function backroom_challenge()
	local szInforHeader = backroom_get_infoheader();
	if GetPKValue() >= 4 then
		Talk(1,"",szInforHeader.."Tr? PK c馻 b筺 <color=yellow>l韓 h琻 ho芻 b籲g 4<color>, kh玭g th? v祇 m藅 th蕋.");
		return 0;
	end;
	local nPlayerFaction = GetPlayerFaction();
	local nFaction = backroom_get_faction();
	if nPlayerFaction ~= nFaction and nFaction ~= 0 and g_nBackRoomEntryType == 1 then
		Talk(1,"",szInforHeader.."B筺 kh玭g ph秈 l?  t? b鎛 ph竔, xin h穣 quay v? 甶!");
		return 0;
	end;
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"backroom_main_entry",szInforHeader.."B筺 h穣 t譵 m閠 s? ph? h鋍 v礽 chi猽 r錳 h穣 v祇 m藅 th蕋 tu luy謓.");
		return 0;
	end;
	local selTab = {
				"\n. 继续上一次的秘境挑战/backroom_continue_last_record",
				". 选择师门秘境难度/backroom_select_difficulty",
				"\n. 返回主页/backroom_main_entry",
				". 抱歉打扰了！/nothing",
				}
	if GetTask(TSK_WC_LAST_RECORD) == 0 then
		tremove(selTab,1);	--如果上次没有保存记录
	else
		tremove(selTab,2);	--如果上次有保存记录
		tinsert(selTab,2,"\n. 清除挑战记录/backroom_clear_record");
	end;
	if g_nBackRoomEntryType == 2 then
		nFaction = nPlayerFaction;
	end;
	Say(szInforHeader..g_tbDialog[nFaction][3].."你本周已进入关卡 <color=yellow>"..GetTask(TSK_WC_ATTEND_TIMES).."<color> 次, 清档 <color=yellow>"..GetTask(TSK_WC_FAIL_TIMES).."<color> 次. 本周还可挑战 <color=yellow>"..MAX_FAILURE_TIMES.."<color> 次，请注意，每周只有第一次通关可以领取宝箱奖励.",getn(selTab),selTab);
end;

function backroom_clear_record()
	local szInforHeader = backroom_get_infoheader();
	local selTab = {
				"你确定要清除挑战记录吗？/backroom_clear_record_confirm",
				"我再想一想/nothing",
				}
	local nLastDiff,nLastStage = BR_GetSaveRecord();
	Say(szInforHeader.."你本周已进入关卡 <color=yellow>"..TB_DIFF_NAME[nLastDiff].."<color>  kh? 秈 <color=yellow>"..nLastStage.."<color>, b筺 mu鑞 x鉧 d? li謚 n祔 kh玭g? Ch? ?, s? l莕 x鉧 d? li謚 tu莕 vt qu? <color=yellow>"..MAX_FAILURE_TIMES.."<color> l莕 s? kh玭g th? l蕐 b秓 rng trong m藅 th蕋. Tu莕 n祔 b筺  x鉧 d? li謚 <color=yellow>"..GetTask(TSK_WC_FAIL_TIMES).."<color> l莕.",getn(selTab),selTab);
end;

function backroom_clear_record_confirm()
	local szInforHeader = backroom_get_infoheader();
	SetTask(TSK_WC_LAST_RECORD,0);
	SetTask(TSK_WC_FAIL_TIMES,GetTask(TSK_WC_FAIL_TIMES)+1);
	Talk(1,"",szInforHeader.."D? li謚 c馻 b筺  x鉧, trong tu莕 n祔 y l? l莕 th? "..GetTask(TSK_WC_FAIL_TIMES).." x鉧 d? li謚, ngi c? th? ch鋘 l筰   kh?  vt 秈.");
end;

function backroom_select_difficulty()
	local szInforHeader = backroom_get_infoheader();
	local nLevel = GetLevel();
	if nLevel < 50 then
		Talk(1,"",szInforHeader.."Ъng c蕄 c馻 ngi qu? th蕄, kh玭g th? v祇 m藅 th蕋.");
		return 0;
	end;
	local selTab = {};
	if DEBUG_VERSION == 0 then
		selTab = {
				"[1]"..TB_DIFF_NAME[1].."/#backroom_enter_back_room(1)",
				"[2]"..TB_DIFF_NAME[2].."/#backroom_enter_back_room(2)",
				"[3]"..TB_DIFF_NAME[3].."/#backroom_enter_back_room(3)",
				"[4]"..TB_DIFF_NAME[4].."/#backroom_enter_back_room(4)",
				}
	else
		for i=1,getn(TB_DIFF_NAME) do
			tinsert(selTab,"["..i.."]"..TB_DIFF_NAME[i].."/#backroom_enter_back_room("..i..")");
		end;
	end;
	tinsert(selTab,"\n 我再想想！/nothing");
	if nLevel >= 50 and nLevel < 70 then
		tremove(selTab,2);
		tremove(selTab,2);
		tremove(selTab,2);
	elseif nLevel >= 70 and nLevel < 80 then
		tremove(selTab,3);
		tremove(selTab,3);		
	elseif nLevel >= 80 and nLevel < 90 then
		tremove(selTab,4);	
	end;
	Say(szInforHeader.."请选择挑战难度：",getn(selTab),selTab);
end;

function backroom_continue_last_record()
	local szInforHeader = backroom_get_infoheader();
	local nLastDiff,nLastStage = BR_GetSaveRecord();
	if nLastDiff <= 0 then
		Talk(1,"backroom_challenge",szInforHeader.."L莕 trc b筺 kh玭g l璾 ti課 .");
		return 0;
	end;
	local selTab = {
				format("Л頲/#backroom_enter_back_room(%d,%d)",nLastDiff,nLastStage),
				"算了./nothing",
				}
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
		nNeedItemNum = 3;
	end;
	Say(szInforHeader.."Ti課  l莕 trc b筺 l璾 l? <color=yellow>"..TB_DIFF_NAME[nLastDiff].."<color>  kh? 秈 <color=yellow>"..nLastStage.."<color> 秈, c ti課  kh玭g nh薾 n鱝"..TB_ITEM[1][1]..". Trong tu莕 n祔 y l? l莕 c ti課  th? <color=yellow>"..nReadRecordTimes.."<color>. B﹜ gi? ngi mu鑞 v祇 秈 n祔  luy謓 ph秈 kh玭g?",getn(selTab),selTab);
end;

function backroom_enter_back_room(nDiff,nStage)
	local szInforHeader = backroom_get_infoheader();
	local nNeedToken = 0;
	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
		Say(szInforHeader.."B筺 hi謓 kh玭g  甶襲 ki謓  v祇 秈, xin h穣 ki觤 tra gi韎 h筺 vt 秈 ? Ti誴 d蒼 m藅 th蕋 s? m玭.",0);
		Msg2Player("B筺 hi謓 kh玭g  甶襲 ki謓  v祇 秈, xin h穣 ki觤 tra gi韎 h筺 vt 秈 ? Ti誴 d蒼 m藅 th蕋 s? m玭.");
		return 0;
	end;
	local selTab = {};
	if nStage == nil then
		nNeedToken = 1;	--如果不是读档进的，需要1个师门令牌
		nStage = 1;
		tinsert(selTab,"我要挑战秘室!/#backroom_enter_back_room_confirm("..nDiff..")");	
	else
		tinsert(selTab,"备用444/#backroom_enter_back_room_confirm("..nDiff..","..nStage..")");
	end;
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
--	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
--		nNeedItemNum = 3;
--	end;
	local szInfo = "";
	local nNeedItemNumEx = 0;
	local szItemName = TB_ITEM[1][1];
	if g_nBackRoomEntryType == 2 then
		nNeedItemNumEx = 2;
		szInfo = "<color=yellow> d飊g h錳 ph? m藅 th蕋 v祇 秈 c莕 t鑞 "..szItemName..nNeedItemNumEx.." <color>.";
	end;
	local nTotalNeedNum = nNeedItemNum+nNeedItemNumEx;
	tinsert(selTab,"我再想想!/nothing");
	Say(szInforHeader.."本周你已进入<color=yellow>"..TB_DIFF_NAME[nDiff].."<color>关卡<color=yellow>"..nStage.."<color>次"..szInfo.."清档<color=yellow>"..nNeedToken.."<color>次，<color=yellow>"..szItemName..nTotalNeedNum.."<color>.",getn(selTab),selTab);
end;

function backroom_enter_back_room_confirm(nDiff,nStage)	--param1:difficulty，从中断处进时，nStage不为nil
	local szInforHeader = backroom_get_infoheader();
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
	local nNeedItemNumEx = 0;
--	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
--		nNeedItemNum = 3
--	end;
	local szItemName = TB_ITEM[1][1];
	local szInfo = "";
	if g_nBackRoomEntryType == 2 then
		nNeedItemNumEx = 2;
		szInfo = "<color=yellow> d飊g h錳 ph? m藅 th蕋 v祇 秈 c莕 t鑞 "..szItemName..nNeedItemNumEx.." <color>,";
	end;
	local nTotalNeedNum = nNeedItemNum + nNeedItemNumEx;
	if nStage ~= nil then	--如果是读档进的
		if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < nTotalNeedNum then
			Talk(1,"",szInforHeader.."Tu莕 n祔 ngi  i <color=yellow>"..nReadRecordTimes.."<color> l莕 c ti課 , c莕 <color=yellow>"..nNeedItemNum.."<color> c竔"..szItemName.."."..szInfo.."S? lng "..szItemName.."S? lng kh玭g , t鎛g c閚g c莕 "..nTotalNeedNum.."c竔"..szItemName..".");
			return 0;
		end;
	else
		if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < nNeedItemNumEx then
			Talk(1,"",szInforHeader..szInfo.."S? lng "..szItemName.."S? lng kh玭g .");
			return 0;
		end;
	end;
	local nFaction = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nCurMapID = GetWorldPos();
	local nRoomID,nRoomIdx,nRoomCount = BR_FindIdleRoom(nFaction,g_nBackRoomEntryType);
	if nRoomID == 0 then
		Talk(1,"",szInforHeader.."T筸 th阨 kh玭g c? khu thi u  luy謓, v祇 sau nh?.");
		return 0;
	end;
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nRoomID) == MS_STATE_IDEL then
		if nStage == nil then	--如果不是读档进的就要收师门令牌
			if BR_DelLingPai(nFaction,1) ~= 1 then
				Talk(1,"",szInforHeader.."Ngi c莕 ph秈 c? l謓h b礽 s? m玭 m韎 c? th? v祇 m藅 th蕋.");
				return 0;
			end;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],nTotalNeedNum);
			if nStage == nil then
				nStage = 1;
				SetTask(TSK_ENTER_TYPE,0);	--非读档进的
			else	--用这个来判断是不是从中断处进的
				SetTask(TSK_WC_READ_RECORD_TIMES,nReadRecordTimes);
				SetTask(TSK_ENTER_TYPE,1);	--读档进的
			end;
			if g_nBackRoomEntryType == 1 then	--从门派处进
				mf_SetMissionV(MISSION_ID,MV_MAP_TYPE,nRoute,nRoomID);
			else	--从道具处进
				mf_SetMissionV(MISSION_ID,MV_MAP_TYPE,0,nRoomID);
			end;
			mf_SetMissionV(MISSION_ID,MV_CUR_DIFF,nDiff,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_CUR_STAGE,nStage,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_MAPID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_MAPIDX,nRoomIdx,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_ENTRY_MAPID,nCurMapID,nRoomID);
			mf_JoinMission(MISSION_ID,0,nRoomID);
		end;
	end;
end;

function backroom_know_detail()
	local szInforHeader = backroom_get_infoheader();
	Talk(2,"backroom_know_detail_2",szInforHeader.."\n    师门秘室分为1-9关. ");
end;

function backroom_know_detail_2()
	local szInforHeader = backroom_get_infoheader();
	Talk(2,"backroom_main_entry",szInforHeader.."\n    ");
end;

function backroom_see_faction_rank(nFaction)
	local szInforHeader = backroom_get_infoheader();
	local selTab = {};
	for i=1,getn(TB_FACTION_ROUTE[nFaction]) do
		selTab[i] = TB_FACTION_ROUTE[nFaction][i][2].."/#backroom_see_route_rank("..TB_FACTION_ROUTE[nFaction][i][1]..")";
	end;
	tinsert(selTab,"\n 结束对话/nothing");
	Say(szInforHeader.."你要看哪个流派的排行榜信息？",getn(selTab),selTab);
end;

function backroom_see_route_rank(nRoute)
	local szInforHeader = backroom_get_infoheader();
	local selTab = {}
	for i=1,getn(TB_DIFF_NAME) do
		tinsert(selTab,"查看 ["..i.."]"..TB_DIFF_NAME[i].." 难度排名/#backroom_get_rank("..nRoute..","..i..")");
	end;
	tinsert(selTab,"返回上一步/backroom_see_all_faction_rank");
	tinsert(selTab,"结束对话/nothing");
	for i=1,9 do
		DelRelayShareDataCopy(BACKROOM_RELAY_KEY,nRoute,i);
	end;
	Say(szInforHeader.."你要看哪个难度的排行榜信息？",getn(selTab),selTab);
end;

function backroom_get_rank(nRoute,nDiff)
	ApplyRelayShareData(BACKROOM_RELAY_KEY,nRoute,nDiff,g_szThisFile,"backroom_callback_get_rank");
end;

function backroom_callback_get_rank(szKey,nKey1,nKey2,nRecordCount)
	local szInforHeader = backroom_get_infoheader();
	if nRecordCount == 0 then
		Talk(1,"backroom_see_all_faction_rank",szInforHeader.."Hi謓 t筸 th阨 kh玭g c? th玭g tin danh s竎h li猲 quan");
		return 0;
	end;
	local szString = "";
	if nRecordCount > 8 then
		nRecordCount = 8;	--只排前8名
	end;
	local szName = "";
	local nTime = 0;
	local szFormatTime = "";
	for i=1,nRecordCount do
		szName,nTime = GetRelayShareDataByIndex(szKey,nKey1,nKey2,i-1);
		szFormatTime = tf_GetTimeString(nTime);
		szString = szString..gf_FormatStringLength(i,6);
		szString = szString..gf_FormatStringLength(szName,18);
		szString = szString..gf_FormatStringLength(szFormatTime,20);
		szString = szString.."\n";
	end;
	Talk(1,"#backroom_see_route_rank("..nKey1..")",gf_GetRouteName(nKey1).."M藅 th蕋 s? m玭 ["..nKey2.."]"..TB_DIFF_NAME[nKey2].." 8 ngi d蒼 u  kh?: \n"..gf_FormatStringLength("H筺g",6)..gf_FormatStringLength("T猲",18)..gf_FormatStringLength("T鎛g th阨 gian",20).."\n"..szString);
end;

function backroom_get_reward()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."少侠想要兑换什么？");
		return 0;
	end;
	local selTab = {
				". ф 换取消耗品/backroom_exchange_normal_item",
				". ф 换取师门秘籍心法诀要/backroom_exchange_faction_item",
				". ф 换取师门套装/backroom_equip_reward",
				". ф 高级物品兑换一级物品/backroom_exchange_totem",
				". ф 换取镇派秘籍残篇/backroom_exchange_zhenpai",
				". ф 调整师门武器攻击力/backroom_exchange_attack",
				"返回上一步/backroom_main_entry",
				"暂不兑换/nothing",
				}
	Say(szInforHeader.."你要兑换哪些奖励?",getn(selTab),selTab);
end;

function backroom_exchange_totem()
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 trc m韎 c? th? i trang b? s? m玭.");
		return 0;
	end;
	local szInforHeader = backroom_get_infoheader();
	local selTab = {
			". 2级物品兑换1级物品 (兑换比例 1:1)/#backroom_exchange_totem_type(2)",
			". 2级物品兑换1级物品 (兑换比例 1:2)/#backroom_exchange_totem_type(3)",
			"返回上一步/backroom_get_reward",
			"暂不兑换/nothing",
			};
	Say(szInforHeader.."你可以把多余的师门秘室高级物品换成1级物用以换取师门消耗品.",getn(selTab),selTab);
end;

function backroom_exchange_totem_type(nType)
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	local nID1 = TB_TOTEM_INFO[nFaction][nType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nType][3];
	local szTotemName = TB_TOTEM_INFO[nFaction][nType][4];
	local nTotemCount = GetItemCount(nID1,nID2,nID3);
	if nTotemCount <= 0 then
		Talk(1,"backroom_exchange_totem",szInforHeader.."你身上并没有<color=yellow>"..szTotemName.."<color> !");
		return 0;
	end;
	SetTaskTemp(TTSK_NORMAL_ITEM_TYPE,nType);
	AskClientForNumber("backroom_exchange_totem_confirm",1,min(nTotemCount,100),"Ngi mu鑞 d飊g bao nhi猽  i?");	--１次最多换１００个
end;

function backroom_exchange_totem_confirm(nCount)
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 m韎 c? th? i.");
		return 0;
	end;
	local nFaction = GetPlayerFaction();
	local nType = GetTaskTemp(TTSK_NORMAL_ITEM_TYPE);
	local nID1 = TB_TOTEM_INFO[nFaction][nType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nType][3];
	local szTotemName = TB_TOTEM_INFO[nFaction][nType][4];
	local nTotemCount = GetItemCount(nID1,nID2,nID3);
	if nTotemCount < nCount then
		Talk(1,"backroom_exchange_totem",szInforHeader.."Ngi  i <color=yellow>"..szTotemName.."<color> kh玭g  <color=yellow>"..nCount.."<color> ?!!");
		return 0;
	end;
	local nLV1ID1 = TB_TOTEM_INFO[nFaction][1][1];
	local nLV1ID2 = TB_TOTEM_INFO[nFaction][1][2];
	local nLV1ID3 = TB_TOTEM_INFO[nFaction][1][3];
	local szLV1TotemName = 	TB_TOTEM_INFO[nFaction][1][4];
	local nLV1TotemCount = 0;
	if nType == 2 then
		nLV1TotemCount = nCount;	--比率1：1
	else
		nLV1TotemCount = 2*nCount;	--比率1：2
	end;
	if gf_JudgeRoomWeight(2,nLV1TotemCount*5,"") == 0 then
		return 0;
	end;
	if DelItem(nID1,nID2,nID3,nCount) == 1 then
		AddItem(nLV1ID1,nLV1ID2,nLV1ID3,nLV1TotemCount);
		Msg2Player("B筺 i "..nCount.."个"..szTotemName.." r錳"..nLV1TotemCount.."个"..szLV1TotemName);
		WriteLog(LOG_HEADER..GetName().."(m玭 ph竔:"..nFaction..") d飊g "..nCount.."个"..szTotemName.." r錳"..nLV1TotemCount.."c竔"..szLV1TotemName);
	end;
end;

function backroom_exchange_normal_item()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 m韎 c? th? i ph莕 thng.");
		return 0;
	end;
	backroom_list_normal_item(1,getn(TB_NORMAL_ITEM));
end;

function backroom_list_normal_item(nPageNum,nCount)
	local szInforHeader = backroom_get_infoheader();
	local tMedList = backroom_get_normal_item_list();
	local selTab = {};
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("上一页 \n /#backroom_list_normal_item(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tMedList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n 下一页/#backroom_list_normal_item(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"暂不兑换/nothing");
	Say(szInforHeader.."你要换取哪种消耗品?",getn(selTab),selTab);
end;

function backroom_get_normal_item(nType)
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	local nTotemCount = GetItemCount(TB_TOTEM_INFO[nFaction][1][1],TB_TOTEM_INFO[nFaction][1][2],TB_TOTEM_INFO[nFaction][1][3]);
	local nNeedNum = TB_NORMAL_ITEM[nType][5];
	local nMedCount = floor(nTotemCount/nNeedNum);
	if nMedCount <= 0 then
		Talk(1,"backroom_exchange_normal_item",szInforHeader.."请确认你身上至少有<color=yellow>"..nNeedNum.."个"..TB_TOTEM_INFO[nFaction][1][4].."<color>.");
		return 0;
	end;
	SetTaskTemp(TTSK_NORMAL_ITEM_TYPE,nType);
	AskClientForNumber("backroom_get_normal_item_confirm",1,min(nMedCount,100),"B筺 mu鑞 i bao nhi猽?");	--１次最多换１００个
end;

function backroom_get_normal_item_list()
	local nFaction = GetPlayerFaction();
	local tSelTab = {};
	for i=1,getn(TB_NORMAL_ITEM) do
		tinsert(tSelTab,format(TB_NORMAL_ITEM[i][1].."("..TB_NORMAL_ITEM[i][5].."个"..TB_TOTEM_INFO[nFaction][1][4].."加"..TB_NORMAL_ITEM[i][6].."金)/#backroom_get_normal_item(%d)",i));
	end;
	return tSelTab;
end;

function backroom_get_normal_item_confirm(nCount)
	local szInforHeader = backroom_get_infoheader();
	if nCount <= 0 then
		return 0;
	end;
	local nFaction = GetPlayerFaction();
	local nType = GetTaskTemp(TTSK_NORMAL_ITEM_TYPE);
	local nNeedMoney = TB_NORMAL_ITEM[nType][6]*nCount;
	local nNeedNum = TB_NORMAL_ITEM[nType][5]*nCount;
	local nTotemID1 = TB_TOTEM_INFO[nFaction][1][1];
	local nTotemID2 = TB_TOTEM_INFO[nFaction][1][2];
	local nTotemID3 = TB_TOTEM_INFO[nFaction][1][3];
	if GetItemCount(nTotemID1,nTotemID2,nTotemID3) < nNeedNum then
		Talk(1,"backroom_exchange_normal_item",szInforHeader.."S?lng huy hi謚 c馻 ngi kh玭g , x竎 nh薾 tr猲 ngi ngi 輙 nh蕋 c?<color=yellow>"..nNeedNum.."c竔"..TB_TOTEM_INFO[nFaction][1][4].."<color>.")	
		return 0;
	end;
	if GetCash() < nNeedMoney*10000 then
		Talk(1,"",szInforHeader.."V祅g kh玭g , x竎 nh薾 輙 nh蕋 ngi c?<color=yellow>"..(nNeedMoney).."v祅g<color>.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,nCount*5,"") == 0 then
		return 0;
	end;
	local szItemName = TB_NORMAL_ITEM[nType][1];
	local nItemID1 = TB_NORMAL_ITEM[nType][2];
	local nItemID2 = TB_NORMAL_ITEM[nType][3];
	local nItemID3 = TB_NORMAL_ITEM[nType][4];
	Pay(nNeedMoney*10000);
	if DelItem(nTotemID1,nTotemID2,nTotemID3,nNeedNum) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,nCount);
		Msg2Player("Ngi  i "..nCount.."c竔"..szItemName);
		WriteLog(LOG_HEADER..GetName().."(m玭 ph竔:"..nFaction..") r錳"..nCount.."c竔"..szItemName);
	end;
end;

backroom_tbNeedTotem = 
{
	[4] = 
	{
		[1] = {0,110,0},	--师门第4套帽子
		[2] = {0,130,0},	--师门第4套衣服
		[3] = {0,110,0},	--师门第4套裤子
		[4] = {0,150,0},	--师门第4套首饰1
		[5] = {0,150,0},	--师门第4套首饰2
		[6] = {0,240,0},	--师门第4套武器
	},
	[5] = 
	{
		[1] = {0,0,240},	--师门第5套帽子
		[2] = {0,0,360},	--师门第5套衣服
		[3] = {0,0,240},	--师门第5套裤子
		[4] = {0,0,480},	--师门第5套首饰1
		[5] = {0,0,480},	--师门第5套首饰2
		[6] = {0,0,720},	--师门第5套武器
	},
}

function backroom_equip_reward()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 trc m韎 c?th?i trang b?s?m玭.");
		return 0;
	end;
	local selTab = {
				--"查看师门套装属性/backroom_see_equip_info",
				"兑换新师门装备/backroom_exchange_equip",
				"返回上一步/backroom_get_reward",
				"暂不兑换/nothing",
				}
	Say(szInforHeader.."你要兑换师门装备吗?",getn(selTab),selTab);
end;

function backroom_see_equip_info()
	local nFaction = backroom_get_faction();
	local szInforHeader = backroom_get_infoheader();
	local tb = {90,94,92,93,91,95,96};
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."?y kh玭g th?xem thu閏 t輓h trang b?m韎.");
		return 0;
	end;
	Sale(tb[nFaction],100,1);
end;

function backroom_exchange_equip()
	local szInforHeader = backroom_get_infoheader();
	local nPlayerFaction = GetPlayerFaction();
	local nFaction = backroom_get_faction();
	if nPlayerFaction ~= nFaction and nFaction ~= 0 and g_nBackRoomEntryType == 1 then
		Talk(1,"",szInforHeader.."Ngi kh玭g ph秈  t?b鎛 ph竔, kh玭g th?i trang b?s?m玭!");
		return 0;
	end;
	local selTab = {
				"师门第四套/#backroom_get_equip_reward(4)",
				"师门第五套/#backroom_get_equip_reward(5)",
				"师门第六套/#backroom_get_equip_reward(6)",
				"返回上一步/backroom_equip_reward",
				"暂不兑换/nothing",
				}
	Say(szInforHeader.."你要兑换哪套师门套装?",getn(selTab),selTab);
end;

function backroom_get_equip_reward(nGeneration)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local selTab = {
				backroom_get_equip_name(nRoute,nGeneration,1).."/#backroom_get_equip("..nGeneration..",1)",
				backroom_get_equip_name(nRoute,nGeneration,2).."/#backroom_get_equip("..nGeneration..",2)",
				backroom_get_equip_name(nRoute,nGeneration,3).."/#backroom_get_equip("..nGeneration..",3)",
				backroom_get_equip_name(nRoute,nGeneration,4).."/#backroom_get_equip("..nGeneration..",4)",
				backroom_get_equip_name(nRoute,nGeneration,5).."/#backroom_get_equip("..nGeneration..",5)",
				backroom_get_equip_name(nRoute,nGeneration,6).."/#backroom_get_equip("..nGeneration..",6)",
				"返回上一步/backroom_exchange_equip",
				"暂不兑换/nothing",
				}
	Say(szInforHeader.."你要兑换以下哪一件?",getn(selTab),selTab);
end;

function backroom_get_equip(nGeneration,nType)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local szEquipName = backroom_get_equip_name(nRoute,nGeneration,nType);
	local selTab = {};
	local nTotemNum = 0;
	local szTotemName = "";
	for i=1,3 do
		nTotemNum = backroom_tbNeedTotem[nGeneration][nType][i];
		if nTotemNum > 0 then
			szTotemName = TB_TOTEM_INFO[nFaction][i][4];
			tinsert(selTab,"确定兑换(消耗"..nTotemNum.."个"..szTotemName..")/#backroom_get_equip_confirm("..nGeneration..","..nType..","..i..")");
		end;
	end;
	tinsert(selTab,"返回上一步/#backroom_get_equip_reward("..nGeneration..")");
	tinsert(selTab,"暂不兑换/nothing");
	Say(szInforHeader.."你确定要换取<color=yellow>"..szEquipName.."<color>吗?",getn(selTab),selTab);
end;

function backroom_get_equip_name(nRoute,nGeneration,nType)
	local szName = fe_tbFactionEquipExName[nRoute][nGeneration][nType];
	return szName;
end;

function backroom_get_equip_confirm(nGeneration,nType,nTotemType)
	local szInforHeader = backroom_get_infoheader();
	if gf_JudgeRoomWeight(3,500,"") ~= 1 then
		return 0;
	end;
	local nFaction = GetPlayerFaction();
	local tb = TB_TOTEM_INFO[nFaction][nTotemType];
	local nNeedTotemNum = backroom_tbNeedTotem[nGeneration][nType][nTotemType];
	local szTotemName = tb[4];
	if GetItemCount(tb[1],tb[2],tb[3]) < nNeedTotemNum then
		Talk(1,"#backroom_get_equip_reward("..nGeneration..")",szInforHeader.."<color=yellow>"..szTotemName.."<color>的数量不够.")	
		return 0;	   
	end;
	DelItem(tb[1],tb[2],tb[3],nNeedTotemNum);
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	fe_AddFactionEquipmentEx(nRoute,nBody,nGeneration,nType);
	local szEquipName = backroom_get_equip_name(nRoute,nGeneration,nType);
	Msg2Player("B筺 nh薾 頲 "..szEquipName);
	WriteLog(LOG_HEADER..GetName().."Nh薾 頲 1 trang b?s?m玭:"..szEquipName..",nGeneration:"..nGeneration..",nType:"..nType);
end;
--根据当前地图来判断这个师傅是哪个门派的
function backroom_get_faction()
	local nMapID = GetWorldPos();
	local tbFactionMapID = {204,312,303,209,305,219,407};
	for i=1,getn(tbFactionMapID) do
		if nMapID == tbFactionMapID[i] then
			return i;
		end;
	end;
	return 0;
end;

function backroom_get_infoheader()
	if g_nBackRoomEntryType == 2 then	--如果是从道具处打开
		return "";
	end;
	local nFaction = backroom_get_faction();
	local szInfoHeader = g_tbDialog[nFaction][0];
	return szInfoHeader;
end;

function backroom_exchange_faction_item()
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."备用111.");
		return 0;
	end;
	local szTotemName = TB_TOTEM_INFO[nFaction][1][4];	
	local selTab = {
				". ф 换取师门秘籍 ("..szTotemName..TB_FACTION_ITEM[1][0][2].."个)/#backroom_exchange_faction_item_type(1)",
				". ф 换取师门心法 ("..szTotemName..TB_FACTION_ITEM[2][0][2].."个)/#backroom_exchange_faction_item_type(2)",
				". ф 换取自己门派诀要包 ("..gf_GetFactionName(nFaction).." ) ("..szTotemName..TB_FACTION_ITEM[3][0][2].."个)/#backroom_exchange_faction_item_type(3)",
				". ф 换取师门高级秘籍 ("..TB_TOTEM_INFO[nFaction][3][4]..TB_FACTION_ITEM[4][0][2].." )/#backroom_exchange_faction_item_type(4)",
				". ф 换取师门高级秘籍 ("..TB_TOTEM_INFO[nFaction][3][4].."120个和2000金)/#backroom_exchange_book(1,4)",
				"返回上一步/backroom_get_reward",
				"暂不兑换/nothing",
				}
	local szInforHeader = backroom_get_infoheader();
	Say(szInforHeader.."你要换取什么物品?",getn(selTab),selTab);
end;

function backroom_exchange_faction_item_type(nItemType)
	local nFaction = GetPlayerFaction();
	if nItemType == 3 then	--如果是诀要包
		backroom_get_faction_item(nItemType,nFaction);
	else
		backroom_list_faction_item(1,nItemType);
	end;
end;

function backroom_list_faction_item(nPageNum,nItemType)
	local szInforHeader = backroom_get_infoheader();
	local tbList = backroom_get_faction_item_list(nItemType);
	local selTab = {};
	local nItemNum = getn(tbList);
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nItemNum);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("上一页 \n /#backroom_list_faction_item(%d,%d)",nPageNum-1,nItemType));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= ceil(nItemNum/nItemPerPage) then
		tinsert(selTab,format("\n 下一页/#backroom_list_faction_item(%d,%d)",nPageNum+1,nItemType));	
	end;
	tinsert(selTab,"\n 暂不兑换/nothing");
	Say(szInforHeader.."你想要换取以下哪个物品?",getn(selTab),selTab);
end;

function backroom_get_faction_item_list(nItemType)
	local tbItem = TB_FACTION_ITEM[nItemType];
	local tbRetTb = {};
	for i=1,getn(tbItem) do
		tinsert(tbRetTb,tbItem[i][1].."/#backroom_get_faction_item("..nItemType..","..i..")");
	end;
	return tbRetTb;
end;

function backroom_get_faction_item(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local szItemName = tbItem[nItemIdx][1];
	local nFaction = GetPlayerFaction();
	local nNeedItemNum = tbItem[0][2];
	local nTotemType = tbItem[0][1];
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local selTab = {
				"确定兑换/#backroom_get_faction_item_confirm("..nItemType..","..nItemIdx..")",
				"暂不兑换/nothing",
				}
	Say(szInforHeader.."你确定要兑换 <color=yellow>"..szItemName.."<color>吗? 兑换需要<color=yellow>"..nNeedItemNum.."个"..szNeedItemName.."<color>.",getn(selTab),selTab);
end;

function backroom_get_faction_item_confirm(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local nNeedItemNum = tbItem[0][2];
	local nTotemType = tbItem[0][1];
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."Ngi v?m玭 v?ph竔 kh玭g 頲 i v藅 ph萴 n祔.");
		return 0;
	end;
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local nID1 = TB_TOTEM_INFO[nFaction][nTotemType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nTotemType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nTotemType][3];
	local nCurItemNum = GetItemCount(nID1,nID2,nID3);
	if nCurItemNum < nNeedItemNum then
		Talk(1,"",szInforHeader.."Ngi c莕 <color=yellow>"..nNeedItemNum.."c竔"..szNeedItemName.."<color> m韎 c?th?i v藅 ph萴 n祔.");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,15,szInforHeader) == 0 then
		return 0;
	end;
	local szItemName = tbItem[nItemIdx][1];
	local nItemID1 = tbItem[nItemIdx][2];
	local nItemID2 = tbItem[nItemIdx][3];
	local nItemID3 = tbItem[nItemIdx][4];
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,1);
		Msg2Player("B筺 i "..nNeedItemNum.."c竔"..szNeedItemName.."i "..szItemName);
		WriteLog(LOG_HEADER..GetName().."(m玭 ph竔:"..nFaction..") d飊g "..nNeedItemNum.."c竔"..szNeedItemName.." r錳"..szItemName);
	end;
end;

function backroom_exchange_zhenpai()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 trc m韎 c?th?i M藅 t辌h tr蕁 ph竔.");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = 0;
	local strtab = {};
	nIdx = TB_BOOK_REQUIRE[1][1];			
	tinsert(strtab,"@ "..TB_BOOK_LIST[nRoute][1][1].."(需要 "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[1][2].."个)/#backroom_exchange_zhenpai_ask(1)");
	nIdx = TB_BOOK_REQUIRE[2][1];
	tinsert(strtab,"@ "..TB_BOOK_LIST[nRoute][2][1].."(需要 "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[2][2].."个)/#backroom_exchange_zhenpai_ask(2)");
	nIdx = TB_BOOK_REQUIRE[3][1];
	tinsert(strtab,"@ "..TB_BOOK_LIST[nRoute][3][1].."(需要 "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[3][2].."个)/#backroom_exchange_zhenpai_ask(3)");
	tinsert(strtab,"暂不兑换/nothing");
	Say(szInforHeader.."你要换取哪一本?",getn(strtab),strtab);	
end

function backroom_exchange_zhenpai_ask(nType)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = TB_BOOK_REQUIRE[nType][1];
	if GetItemCount(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3]) < TB_BOOK_REQUIRE[nType][2] then
		Talk(1,"",szInforHeader.."ф "..TB_BOOK_LIST[nRoute][nType][1].."需要"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].."个,你身上不够哦.");
		return 0;
	end	
	Say(szInforHeader.."Ngi d飊g <color=yellow>"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].." <color> i <color=yellow>"..TB_BOOK_LIST[nRoute][nType][1].."<color> ch?",
			3,
			"Л頲/#backroom_exchange_zhenpai_confirm("..nType..")",
			"Kh玭g, ta nh莔!/backroom_exchange_zhenpai",
			"Kh玭g i/nothing")	
end

function backroom_exchange_zhenpai_confirm(nType)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = TB_BOOK_REQUIRE[nType][1];
	if GetItemCount(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3]) < TB_BOOK_REQUIRE[nType][2] then
		Talk(1,"",szInforHeader.."ф "..TB_BOOK_LIST[nRoute][nType][1].."需要"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].."个,你身上不够哦.");
		return 0;
	end	
	if gf_JudgeRoomWeight(1,50,szInforHeader) == 0 then
		return 0;
	end;  
	if DelItem(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3],TB_BOOK_REQUIRE[nType][2]) == 1 then
		AddItem(TB_BOOK_LIST[nRoute][nType][2],TB_BOOK_LIST[nRoute][nType][3],TB_BOOK_LIST[nRoute][nType][4],1);
		Msg2Player("B筺 nh薾 頲 "..TB_BOOK_LIST[nRoute][nType][1]);
		WriteLog(LOG_HEADER..GetName().."(m玭 ph竔:"..nFaction..") d飊g "..TB_BOOK_REQUIRE[nType][2].."c竔"..TB_TOTEM_INFO[nFaction][nIdx][4].." r錳"..TB_BOOK_LIST[nRoute][nType][1]);
	end
end

function backroom_exchange_book(nPageNum,nItemType)
	local szInforHeader = backroom_get_infoheader();
	local tbList = backroom_exchange_book_list(nItemType);
	local selTab = {};
	local nItemNum = getn(tbList);
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nItemNum);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("上一页 \n /#backroom_exchange_book(%d,%d)",nPageNum-1,nItemType));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= ceil(nItemNum/nItemPerPage) then
		tinsert(selTab,format("\n 下一页/#backroom_exchange_book(%d,%d)",nPageNum+1,nItemType));	
	end;
	tinsert(selTab,"\n в ta suy ngh?nothing");
	Say(szInforHeader.."你想要换取以下哪样?",getn(selTab),selTab);
end;

function backroom_exchange_book_list(nItemType)
	local tbItem = TB_FACTION_ITEM[nItemType];
	local tbRetTb = {};
	for i=1,getn(tbItem) do
		tinsert(tbRetTb,tbItem[i][1].."/#backroom_exchange_book_item("..nItemType..","..i..")");
	end;
	return tbRetTb;
end;

function backroom_exchange_book_item(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local szItemName = tbItem[nItemIdx][1];
	local nFaction = GetPlayerFaction();
	local nNeedItemNum = 120;
	local nTotemType = tbItem[0][1];
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local selTab = {
				"уng ?#backroom_exchange_book_item_confirm("..nItemType..","..nItemIdx..")",
				"H駓 b?nothing",
				}
	Say(szInforHeader.."Ngi mu鑞 i <color=yellow>"..szItemName.."<color>? C莕 ph秈 c?<color=yellow>"..nNeedItemNum.."c竔"..szNeedItemName.." v?2000 v祅g<color>.",getn(selTab),selTab);
end;

function backroom_exchange_book_item_confirm(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local nNeedItemNum = 120;
	local nTotemType = tbItem[0][1];
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."Ngi v?m玭 v?ph竔 kh玭g 頲 i v藅 ph萴 n祔.");
		return 0;
	end;
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local nID1 = TB_TOTEM_INFO[nFaction][nTotemType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nTotemType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nTotemType][3];
	local nCurItemNum = GetItemCount(nID1,nID2,nID3);
	if nCurItemNum < nNeedItemNum then
		Talk(1,"",szInforHeader.."Ngi c莕 <color=yellow>"..nNeedItemNum.."c竔"..szNeedItemName.."<color> m韎 c?th?i v藅 ph萴 n祔.");
		return 0;
	end;
	if GetCash() < 20000000 then
		Talk(1,"",szInforHeader.."Ngi ph秈 c?<color=yellow>2000 v祅g<color> m韎 c?th?i v藅 ph萴 n祔.");
		return 0;
	end
	if gf_JudgeRoomWeight(1,15,szInforHeader) == 0 then
		return 0;
	end;
	local szItemName = tbItem[nItemIdx][1];
	local nItemID1 = tbItem[nItemIdx][2];
	local nItemID2 = tbItem[nItemIdx][3];
	local nItemID3 = tbItem[nItemIdx][4];
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 and Pay(20000000) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,1);
		Msg2Player("B筺 i "..nNeedItemNum.."c竔"..szNeedItemName.." v?2000 v祅g i "..szItemName);
		WriteLog(LOG_HEADER..GetName().."(m玭 ph竔:"..nFaction..") d飊g "..nNeedItemNum.."c竔"..szNeedItemName.." v?2000 v祅g i "..szItemName);
	end;
end;

function backroom_exchange_attack()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."Ngi ph秈 gia nh藀 l璾 ph竔 trc m韎 c?th?甶襲 ch豱h l鵦 nh v?kh?s?m玭.");
		return 0;
	end;	
	local strtab = {
			". 我要调整师门第四套装备武器/#backroom_exchange_attack_ask(4)",
			". 我要调整师门第五套装备武器/#backroom_exchange_attack_ask(5)",
			"我再想想/nothing"
	};
	Say(szInforHeader.."你要用1个精炼金犀来调整师门第四套，第五套武器的攻击力吗？调整后武器的强化度保留，定魂保留，武器攻击力会重新随机。注意，锁定或者锁魂的武器无法进行调整，调整时需要把武器装备放在身上。",getn(strtab),strtab);
end

function backroom_exchange_attack_ask(nType)
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,1,533) < 1 then
		Talk(1,"",szInforHeader.."调整武器攻击需要1个精炼金犀，你身上没有哦。");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nID2,nID3 = 0,0;
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11};
	nID2 = tbWeaponID2[nRoute];
	if nRoute == 8 or nRoute == 9 then	--峨嵋特殊处理
		nID3 = nRoute*100+(nType-1)*10+nBody-2;
	else
		nID3 = nRoute*100+(nType-1)*10+nBody;
	end;
	local nIndex = GetPlayerEquipIndex(2);
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nEquipId1,nEquipId2,nEquipId3 = GetPlayerEquipInfo(2); --获取装备id	
	if nRoute == 2 then	--该死的少林俗家
		if nEquipId1 ~= 0 or (nEquipId2 ~= 3 and nEquipId2 ~= 5) or nEquipId3 ~= nID3 then
			if nType == 4 then
				Talk(1,"","Ngi ch鋘 甶襲 ch豱h l鵦 nh v?kh?trang b?s?m玭 4, tr猲 ngi ngi hi謓 kh玭g ph秈.");
				return 0;
			elseif nType == 5 then
				Talk(1,"","Ngi ch鋘 甶襲 ch豱h l鵦 nh v?kh?trang b?s?m玭 5, tr猲 ngi ngi hi謓 kh玭g ph秈.");
				return 0;				
			end
		end
	else
		if nEquipId1 ~= 0 or nEquipId2 ~= nID2 or nEquipId3 ~= nID3 then
			if nType == 4 then
				Talk(1,"","Ngi ch鋘 甶襲 ch豱h l鵦 nh v?kh?trang b?s?m玭 4, tr猲 ngi ngi hi謓 kh玭g ph秈.");
				return 0;
			elseif nType == 5 then
				Talk(1,"","Ngi ch鋘 甶襲 ch豱h l鵦 nh v?kh?trang b?s?m玭 5, tr猲 ngi ngi hi謓 kh玭g ph秈.");
				return 0;				
			end
		end
	end
	if nLock == 1 then
		Talk(1,"","Trang b?tr猲 ngi ngi  kh鉧, c莕 m?kh鉧 m韎 c?th?th╪g c蕄.");
		return
	end
	local nItemName = GetItemName(nIndex);
	Say(szInforHeader.."Ngi s?d鬾g 1 Tinh Luy謓 B╪g Th筩h  甶襲 ch豱h l鵦 nh c馻 <color=yellow>"..nItemName.."<color> ph秈 kh玭g?",
		3,
		"Л頲/#backroom_exchange_attack_confirm("..nType..")",
		"Kh玭g, ta nh莔!/backroom_exchange_attack",
		"暂不兑换/nothing")	
end

function backroom_exchange_attack_confirm(nType)
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,1,533) < 1 then
		Talk(1,"",szInforHeader.."襲 ch豱h l鵦 nh c馻 v?kh?c蕁 1 Tinh Luy謓 B╪g Th筩h, tr猲 ngi ngi kh玭g c?");
		return 0;
	end
	if gf_JudgeRoomWeight(1,200,szInforHeader) == 0 then
		return 0;
	end;	
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nID2,nID3 = 0,0;
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11};
	nID2 = tbWeaponID2[nRoute];
	if nRoute == 8 or nRoute == 9 then	--峨嵋特殊处理
		nID3 = nRoute*100+(nType-1)*10+nBody-2;
	else
		nID3 = nRoute*100+(nType-1)*10+nBody;
	end;		
	local nIndex = GetPlayerEquipIndex(2);
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nEquipId1,nEquipId2,nEquipId3 = GetPlayerEquipInfo(2); --获取装备id	
	if DelItemByIndex(nIndex,-1) == 1 and DelItem(2,1,533,1) == 1 then
		local nAddFlag,nItemIdx = AddItem(nEquipId1,nEquipId2,nEquipId3,1,1,-1,-1,-1,-1,-1,-1,0,nQianghua);
		if nDing == 1 then
			SetItemSpecialAttr(nItemIdx,"DING7",1); --定魂
		end
		Msg2Player("L鵦 nh c馻 v?kh? 甶襲 ch豱h.");
	end
end

TB_FACTION_ITEM = 
{
	[1] = --师门秘籍
	{
		[0] = {1,60},	--所需物品等级和数量
		[1] = {"金刚伏魔经(少林俗家)",0,107,1},	
		[2] = {"无尘秘籍(少林禅僧)",0,107,5},	
		[3] = {"潜龙秘籍(少林武僧)",0,107,3},	
		[4] = {"天罗秘籍(唐门)",0,107,7},	
		[5] = {"如意秘籍(峨嵋佛家)",0,107,9},	
		[6] = {"碧海谱(峨嵋俗家)",0,107,11},
		[7] = {"混沌秘籍(丐帮净衣)",0,107,13},	
		[8] = {"揆天秘籍(丐帮污衣)",0,107,15},	
		[9] = {"幻影秘籍(武当道家)",0,107,17},	
		[10] = {"君子秘籍(武当俗家)",0,107,19},	
		[11] = {"镇军秘籍(杨门枪骑)",0,107,21},	
		[12] = {"穿云秘籍(杨门弓骑)",0,107,23},	
		[13] = {"幽冥鬼录(五毒邪侠)",0,107,25},	
		[14] = {"灵蛊秘籍(五毒蛊师)",0,107,27},
	},
 	[2] = 	--师门心法
	{
		[0] = {1,60},
		[1] = {"金刚伏魔心法(少林俗家)",0,107,2},	
		[2] = {"无尘心法(少林禅僧)",0,107,6},	
		[3] = {"潜龙心法(少林武僧)",0,107,4},
		[4] = {"天罗心法(唐门)",0,107,8},	
		[5] = {"如意心法(峨嵋佛家)",0,107,10},
		[6] = {"碧海心法(峨嵋俗家)",0,107,12},
		[7] = {"混沌心法(丐帮净衣)",0,107,14},
		[8] = {"揆天心法(丐帮污衣)",0,107,16},		
		[9] = {"幻影心法(武当道家)",0,107,18},	
		[10] = {"君子心法(武当俗家)",0,107,20},
		[11] = {"镇军心法(杨门枪骑)",0,107,22},	
		[12] = {"穿云心法(杨门弓骑)",0,107,24},	
		[13] = {"幽冥心法(五毒邪侠)",0,107,26},
		[14] = {"灵蛊心法(五毒蛊师)",0,107,28},	
	},
	[3] = 	--门派诀要包
	{
		[0] = {1,80},
		[1] = {"少林诀要包",2,0,607},	
		[2] = {"武当诀要包",2,0,611},
		[3] = {"峨嵋诀要包",2,0,609},	
		[4] = {"丐帮诀要包",2,0,610},	
		[5] = {"唐门诀要包",2,0,608},		
		[6] = {"杨门诀要包",2,0,612},	
		[7] = {"五毒诀要包",2,0,613},	
	},
	[4] = --高级师门秘籍
	{
		[0] = {3,600},
		[1] = {"金刚般若经(少林俗家)",0,107,166},
		[2] = {"无尘菩提经(少林禅僧)",0,107,168},	
		[3] =	{"潜龙寂灭经(少林武僧)",0,107,167},
		[4] = {"天罗连珠录(唐门)",0,107,169},	
		[5] = {"如意金顶秘籍(峨嵋佛家)",0,107,170},
		[6] = {"碧海绝音谱(峨嵋俗家)",0,107,171},
		[7] = {"混沌镇岳秘籍(丐帮净衣)",0,107,172},
		[8] = {"揆天游龙秘籍(丐帮污衣)",0,107,173},		
		[9] = {"幻影迷踪秘籍(武当道家)",0,107,174},	
		[10] = {"君子截风秘籍(武当俗家)",0,107,175},
		[11] = {"镇军飞龙枪谱(杨门枪骑)",0,107,176},	
		[12] = {"穿云落虹秘籍(杨门弓骑)",0,107,177},	
		[13] = {"幽冥封魔录(五毒邪侠)",0,107,178},
		[14] = {"灵蛊幻邪录(五毒蛊师)",0,107,179},			
	},
}