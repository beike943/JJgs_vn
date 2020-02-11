Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
IB_VERSION = 1;	--Ãâ·ÑÇø

g_szItemName = "TruyÒn C«ng T©m §¾c";
g_nMaxUseTime = 100;	--Ã¿ÖÜ×î´óÊ¹ÓÃ´ÎÊý

function OnUse(nItemIdx)
	local nLevel = GetLevel();
	BWT_WeeklyClear();
	local nUseXinDeNum = GetTask(TSK_USE_CHUANGONG_XINDE);
	if nUseXinDeNum >= g_nMaxUseTime then
		Talk(1,"","TuÇn nµy b¹n ®· dïng "..g_nMaxUseTime.." cuèn"..g_szItemName..", kh«ng thÓ dïng n÷a.");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"","§¼ng cÊp qu¸ thÊp, ®Õn cÊp <color=yellow>60<color> míi dïng ®­îc "..g_szItemName..".");
		return 0;
	end;
	local selTab = {
			"Sö dông/ask_number",
			"T¹m thêi ch­a sö dông!/nothing",
			}
	local szString = "";
	if IB_VERSION == 1 then
		local nExp = floor((nLevel^4)/300);
		szString = "Ng­¬i ®ång ý sö dông <color=yellow>"..g_szItemName.."<color>? Ng­¬i cã thÓ nhËn <color=yellow>mçi ®¹o cô "..nExp.."<color> ®iÓm kinh nghiÖm.";
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor(((nLevel^4)*200000)/(80^4));
		szString = "Ng­¬i ®ång ý sö dông <color=yellow>"..g_szItemName.."<color>? Tèi ®a cã thÓ chuyÓn <color=yellow>mçi ®¹o cô "..nGoldenExp.."<color> ®iÓm søc kháe, ®iÓm søc kháe hiÖn t¹i <color=yellow>"..nCurGoldenExp.."<color>.";
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
	
	AskClientForNumber("use",1,nMaxNum,"Xin hái dïng mÊy c¸i");
	
end

function use(nCount)
	local nLevel = GetLevel();
	if IB_VERSION == 0 then
		local nGoldenExp = floor(((nLevel^4)*200000)/(80^4)) * nCount;
		if GetGoldenExp() < nGoldenExp then
			Say("§iÓm søc kháe cña b¹n <color=yellow>"..GetGoldenExp().."<color> kh«ng ®ñ <color=yellow>"..nGoldenExp.."<color>, cã muèn ®æi kh«ng?",2,"§ång ý/#use_shoufei("..nCount..")","Hñy bá/nothing")
			return
		else
			use_shoufei(nCount);
			return
		end;
	end
	if DelItem(2,1,3353,nCount) == 1 then
		if IB_VERSION == 1 then
			local nExp = floor((nLevel^4)/300) * nCount;--ÕâÀïÊÇÏÈÏòÏÂÈ¡Õû»¹ÊÇÏÈ³ËÒÔnCountÄØ£¿
			ModifyExp(nExp);
			Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		else
			
		end;
		SetTask(TSK_USE_CHUANGONG_XINDE,GetTask(TSK_USE_CHUANGONG_XINDE)+nCount);
		Msg2Player("Trong tuÇn nµy b¹n ®· dïng cuèn thø "..GetTask(TSK_USE_CHUANGONG_XINDE).." cuèn"..g_szItemName..", mçi tuÇn chØ cã thÓ dïng "..g_nMaxUseTime.." cuèn"..g_szItemName);	

	end;
end;

function use_shoufei(nCount)
	if DelItem(2,1,3353,nCount) == 1 then
		local nGoldenExp = floor(((GetLevel()^4)*200000)/(80^4)) * nCount;
		gf_GoldenExp2Exp(nGoldenExp);
		SetTask(TSK_USE_CHUANGONG_XINDE,GetTask(TSK_USE_CHUANGONG_XINDE)+nCount);
		Msg2Player("Trong tuÇn nµy b¹n ®· dïng cuèn thø "..GetTask(TSK_USE_CHUANGONG_XINDE).." cuèn"..g_szItemName..", mçi tuÇn chØ cã thÓ dïng "..g_nMaxUseTime.." cuèn"..g_szItemName);	
	end;
end
function nothing()

end;

--2,1,3353