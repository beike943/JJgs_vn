Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
IB_VERSION = 1;	--免费区

g_szItemName = "传功";
g_nMaxUseTime = 100;	--每周最大使用次数

function OnUse(nItemIdx)
	local nLevel = GetLevel();
	BWT_WeeklyClear();
	local nUseXinDeNum = GetTask(TSK_USE_CHUANGONG_XINDE);
	if nUseXinDeNum >= g_nMaxUseTime then
		Talk(1,"","这周你使用了100次"..g_nMaxUseTime.."传功心得"..g_szItemName..",现在你不能再使用");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"","你等级太低了，到<color=yellow>60<color>级后才能使用"..g_szItemName..".");
		return 0;
	end;
	local selTab = {
			"使用它/ask_number",
			"暂时不使用/nothing",
			}
	local szString = "";
	if IB_VERSION == 1 then
		local nExp = floor((nLevel^4)/300);
		szString = "你同意使用吗<color=yellow>"..g_szItemName.."<color>？你可以获得<color=yellow>所有一次性的"..nExp.."<color>经验点";
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor(((nLevel^4)*200000)/(80^4));
		szString = "你同意使用吗<color=yellow>"..g_szItemName.."<color>?最大可兑换<color=yellow>所有的"..nGoldenExp.."<color>健康点<color=yellow>"..nCurGoldenExp.."<color>.";
	end;
	Say(szString,getn(selTab),selTab);
end;

function ask_number()
	local nUseXinDeNum = GetTask(TSK_USE_CHUANGONG_XINDE);
	local	nItemNum = GetItemCount(2,1,3353);
	
	local nMaxNum = 0;
	
	if g_nMaxUseTime - nUseXinDeNum > nItemNum then
		nMaxNum = nItemNum;
	else
		nMaxNum = g_nMaxUseTime - nUseXinDeNum;
	end;
	
	AskClientForNumber("use",1,nMaxNum,"请问要使用几个？");
	
end

function use(nCount)
	local nLevel = GetLevel();
	if IB_VERSION == 0 then
		local nGoldenExp = floor(((nLevel^4)*200000)/(80^4)) * nCount;
		if GetGoldenExp() < nGoldenExp then
			Say("你的健康点<color=yellow>"..GetGoldenExp().."<color>不够<color=yellow>"..nGoldenExp.."<color>,要换吗?",2,"同意/#use_shoufei("..nCount..")","取消/nothing")
			return
		else
			use_shoufei(nCount);
			return
		end;
	end
	if DelItem(2,1,3353,nCount) == 1 then
		if IB_VERSION == 1 then
			local nExp = floor((nLevel^4)/300) * nCount;--这里是先向下取整还是先乘以nCount呢？
			ModifyExp(nExp);
			Msg2Player("你获得"..nExp.."经验点");
		else
			
		end;
		SetTask(TSK_USE_CHUANGONG_XINDE,GetTask(TSK_USE_CHUANGONG_XINDE)+nCount);
		Msg2Player("这周你使用了100次"..GetTask(TSK_USE_CHUANGONG_XINDE).."传功心得"..g_szItemName..",你只能每周用100次 "..g_nMaxUseTime.."传功心得"..g_szItemName);	

	end;
end;

function use_shoufei(nCount)
	if DelItem(2,1,3353,nCount) == 1 then
		local nGoldenExp = floor(((GetLevel()^4)*200000)/(80^4)) * nCount;
		gf_GoldenExp2Exp(nGoldenExp);
		SetTask(TSK_USE_CHUANGONG_XINDE,GetTask(TSK_USE_CHUANGONG_XINDE)+nCount);
		Msg2Player("这周你使用了100次"..GetTask(TSK_USE_CHUANGONG_XINDE).."传功心得"..g_szItemName..",你只能每周用100次"..g_nMaxUseTime.."传功心得"..g_szItemName);	
	end;
end
function nothing()

end;

--2,1,3353
