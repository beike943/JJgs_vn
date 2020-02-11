--作者：严军
--创建日期：07年11月13日14:50
--接引弟子脚本
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
g_szInforHeader = "<color=green>秘室接引人<color>: ";

function main()
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	local nDiff = BR_GetCurDiff();
	local nStage = BR_GetCurStage();
	local selTab = {
				"打开储物箱/open_box",
				"检测当前装备能否进入下一关/#check_equipment("..nDiff..","..nStage..")",
				"挑战限制详细查询/BR_KnowLimit",
				"\n 开始闯关/start_stage",
				"我要离开秘室/leave_stage",
				}
	local szSay = "";
	if nPlayerState == MS_STATE_END_WAITING then
		tremove(selTab,1);
		tremove(selTab,1);
		tremove(selTab,1);
		tremove(selTab,1);
		szSay = "有什么可以帮助你的?";
	else
		szSay = "你即将挑战<color=yellow>"..TB_DIFF_NAME[nDiff].."<color>难度的弟<color=yellow>"..nStage.." <color>关."
	end;
	if DEBUG_VERSION == 1 and nPlayerState == MS_STATE_STARTED then
		tinsert(selTab,"V祇 秈 k?ti誴 (th?luy謓)/next_stage");
	end;
	tinsert(selTab,"没什么事/nothing");
	Say(g_szInforHeader..szSay,getn(selTab),selTab);
end;

function next_stage()
	BR_EndStage();
end;

function leave_stage()
	local selTab = {
				"我要出去/leave_confirm",
				"我再想想/nothing",
				}
	Say(g_szInforHeader.."你确定要放弃挑战,离开秘室吗?",getn(selTab),selTab);				
end;

function start_stage()
	local nDiff,nStage = 0,0;
	nDiff = BR_GetCurDiff();
	nStage = BR_GetCurStage();
	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
		Say("Tr筺g th竔 hi謓 t筰 c馻 b筺 kh玭g  甶襲 ki謓  v祇 秈, xin h穣 ki觤 tra gi韎 h筺 vt 秈.",0)
		return 0;
	end;
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	if nPlayerState == MS_STATE_READY or DEBUG_VERSION == 1 then
		BR_NextStage();
	end;
end;

function leave_confirm()
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	if nPlayerState == MS_STATE_END_WAITING then

	end;
	BR_CloseStage();
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_szInforHeader.."Ngi v蒼 ch璦 thu閏 v?rng c馻 m譶h.");
		return 0;
	end;
	OpenBox();
end;

function check_equipment(nDiff,nStage)
	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
		Say("Tr筺g th竔 hi謓 t筰 c馻 b筺 kh玭g  甶襲 ki謓  v祇 秈, xin h穣 ki觤 tra gi韎 h筺 vt 秈.",0)
	else
		Say("Tr筺g th竔 hi謓 t筰 c馻 b筺 kh玭g  甶襲 ki謓  v祇 秈.",0);
	end;
end;
