Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
Include("\\script\\lib\\lingshi_head.lua");
IB_VERSION = 1;
g_nMaxUseTime = 100;	--Ã¿ÖÜ×î´óÊ¹ÓÃ´ÎÊý

function OnUse(nItemIdx)
	local nLevel = GetLevel();
	BWT_WeeklyClear();
	local nUseXinDeNum = GetTask(TSK_USE_XINDE);
	if nUseXinDeNum >= g_nMaxUseTime then
		Talk(1,"","TuÇn nµy b¹n ®· dïng "..g_nMaxUseTime.."Kh«ng thÓ dïng l¹i Thùc ChiÕn T©m §¾c nµy.");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"","§¼ng cÊp cña ng­¬i qu¸ thÊp, ng­¬i ph¶i ®¹t ®Õn cÊp <color=yellow>60<color> míi cã thÓ dïng Thùc ChiÕn T©m §¾c.");
		return 0;
	end;
	local szIntro = "";
	if IB_VERSION == 1 then
		local nExp = floor(nLevel^4/200);--µÈ¼¶µÄËÄ´Î·½/200
		local selTab = {};
		if nLevel == 99 then
			tinsert(selTab,"Ta muèn ®æi thµnh Tû vâ ®¹i héi bµi vµ TruyÒn C«ng T©m §¾c/#use_confirm("..nItemIdx..",1)");
		else
			tinsert(selTab,"Ta muèn ®æi thµnh Tû vâ ®¹i héi bµi vµ kinh nghiÖm ( "..floor(nExp/2).." ®iÓm/cuèn)/#use_confirm("..nItemIdx..",1)");
			tinsert(selTab,"Ta muèn ®æi thµnh kinh nghiÖm ( "..nExp.." ®iÓm/cuèn)/#use_confirm("..nItemIdx..",2)");		
		end;
		tinsert(selTab,"\nT¹m thêi kh«ng dïng/nothing");
		Say(szIntro.."TuÇn nµy ng­¬i ®· ®æi <color=yellow>"..(nUseXinDeNum+1).."<color> lÇn dïng Thùc ChiÕn T©m §¾c, b¹n cã muèn dïng Thùc ChiÕn T©m §¾c kh«ng?",getn(selTab),selTab);
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor((nLevel^4)*300000/(80^4));	--Íæ¼ÒµÈ¼¶µÄËÄ´Î·½*30w/80µÄËÄ´Î·½
		local selTab = {};
		if nLevel == 99 then
			tinsert(selTab,"Ta muèn ®æi thµnh Tû vâ ®¹i héi bµi vµ TruyÒn C«ng T©m §¾c/#use_confirm("..nItemIdx..",1)");
		else
			tinsert(selTab,"Ta muèn ®æi thµnh Tû vâ ®¹i héi bµi vµ lÊy ®iÓm søc kháe ( "..floor(nGoldenExp/2).." ®iÓm/cuèn) ®æi thµnh kinh nghiÖm/#use_confirm("..nItemIdx..",1)");
			tinsert(selTab,"Ta muèn lÊy ®iÓm søc kháe ( "..nGoldenExp.." ®iÓm/cuèn) ®æi thµnh kinh nghiÖm/#use_confirm("..nItemIdx..",2)");		
		end;
		tinsert(selTab,"\nT¹m thêi kh«ng dïng/nothing");
		Say(szIntro.."§©y lµ cuèn Thùc ChiÕn T©m §¾c thø <color=yellow>"..(nUseXinDeNum+1).."<color> mµ b¹n dïng trong tuÇn nµy, ®iÓm søc kháe hiÖn t¹i lµ <color=yellow>"..nCurGoldenExp.."<color>. B©y giê b¹n cã muèn dïng Thùc ChiÕn T©m §¾c kh«ng?",getn(selTab),selTab);
	end;
end;

function use_confirm(nItemIdx,nUseType)
	nUseType = nUseType or 0;
	local nUseXinDeNum = GetTask(TSK_USE_XINDE);
	local nItemNum = GetItemCount(2,1,1101);
	local nMax = 0;
	if g_nMaxUseTime - nUseXinDeNum > nItemNum then
		nMax = nItemNum;
	else
		nMax = g_nMaxUseTime - nUseXinDeNum;
	end;
	if nUseType == 1 then
		AskClientForNumber("use_real_1",1,nMax,"Xin hái dïng mÊy c¸i");
		return
	elseif nUseType == 2 then
		AskClientForNumber("use_real_2",1,nMax,"Xin hái dïng mÊy c¸i");
		return
	end;
	return
	
	
	
end;

function use_real_1(nCount)
	local nLevel = GetLevel();
	local nExp = floor(nLevel^4/200);--µÈ¼¶µÄËÄ´Î·½/200
	local nGoldenExp = floor((nLevel^4)*300000/(80^4));
	--ÊÕ·ÑÇø½¡¿µ¾­ÑéÅÐ¶Ï
	if IB_VERSION == 0 then
		if nLevel == 99  then
			if DelItem(2,1,1101,nCount) == 1 then
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
				AddItem(2,1,3353,nCount);
				Msg2Player("B¹n nhËn ®­îc "..nCount.." Tû vâ ®¹i héi bµi vµ "..nCount.." TruyÒn C«ng T©m §¾c");
				SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
				Msg2Player("TuÇn nµy ng­¬i ®· dïng "..GetTask(TSK_USE_XINDE).." Thùc ChiÕn T©m §¾c, mçi tuÇn chØ cã thÓ dïng "..g_nMaxUseTime.." quyÓn Thùc ChiÕn T©m §¾c");	
				return
			else
		
				Say("X¸c nhËn b¹n cã ®ñ Thùc ChiÕn T©m §¾c kh«ng!",1,"§ång ý/nothing");
				
				return
			end;
		elseif floor(nGoldenExp/2)*nCount > GetGoldenExp() then
			Say("§iÓm søc kháe cña b¹n <color=yellow>"..GetGoldenExp().."<color> kh«ng ®ñ <color=yellow>"..(floor(nGoldenExp/2)*nCount).."<color>, cã muèn ®æi kh«ng?",2,"§ång ý/#use_shoufei("..nCount..",1)","Hñy bá/nothing");
			return
		else
			use_shoufei(nCount,1);
			return
		end;
	elseif IB_VERSION == 1 then
		if  DelItem(2,1,1101,nCount) == 1 then
			if nLevel == 99 then
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
				AddItem(2,1,3353,nCount);
				Msg2Player("B¹n nhËn ®­îc "..nCount.." Tû vâ ®¹i héi bµi vµ "..nCount.." TruyÒn C«ng T©m §¾c");
			else
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
					
				ModifyExp(floor(nExp/2) * nCount);
				local nTemp = floor(nExp/2) * nCount;
				Msg2Player("B¹n nhËn ®­îc "..nCount.." Tû vâ ®¹i héi bµi vµ "..nTemp.." ®iÓm kinh nghiÖm");
			end;
		else
		
			Say("X¸c nhËn b¹n cã ®ñ Thùc ChiÕn T©m §¾c kh«ng!",1,"§ång ý/nothing");
		
			return
		end;
	
	end;


	SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
	Msg2Player("TuÇn nµy ng­¬i ®· dïng "..GetTask(TSK_USE_XINDE).." Thùc ChiÕn T©m §¾c, mçi tuÇn chØ cã thÓ dïng "..g_nMaxUseTime.." quyÓn Thùc ChiÕn T©m §¾c");	

end
function use_real_2(nCount)
	local nLevel = GetLevel();
	local nExp = floor(nLevel^4/200);--µÈ¼¶µÄËÄ´Î·½/200
	local nGoldenExp = floor((nLevel^4)*300000/(80^4));
	--ÊÕ·ÑÇø½¡¿µ¾­ÑéÅÐ¶Ï
	if IB_VERSION == 0 then
		if nGoldenExp*nCount > GetGoldenExp() then
			Say("§iÓm søc kháe cña b¹n <color=yellow>"..GetGoldenExp().."<color> kh«ng ®ñ <color=yellow>"..(nGoldenExp*nCount).."<color>, cã muèn ®æi kh«ng?",2,"§ång ý/#use_shoufei("..nCount..",2)","Hñy bá/nothing");
			return
		else
			use_shoufei(nCount,2);
			return
		end;
	end;
	if DelItem(2,1,1101,nCount) == 1 then
		if IB_VERSION == 1 then	
			ModifyExp(nExp * nCount);
			Msg2Player("B¹n nhËn ®­îc "..(nExp * nCount).." ®iÓm kinh nghiÖm");
		end;
	else
		WriteLog("Dïng Thùc ChiÕn T©m §¾c:"..GetName().."Hñy Thùc ChiÕn T©m §¾c thÊt b¹i!");
		Say("X¸c nhËn b¹n cã ®ñ Thùc ChiÕn T©m §¾c kh«ng!",1,"§ång ý/nothing")
		
		return
	end;
	SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
	Msg2Player("TuÇn nµy ng­¬i ®· dïng "..GetTask(TSK_USE_XINDE).." Thùc ChiÕn T©m §¾c, mçi tuÇn chØ cã thÓ dïng "..g_nMaxUseTime.." quyÓn Thùc ChiÕn T©m §¾c");	

end

function use_shoufei(nCount,nType)
	local nGoldenExp = 0;
	if DelItem(2,1,1101,nCount) == 1 then
		
		if nType == 1 then
			AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
			Msg2Player("B¹n nhËn ®­îc "..nCount.." Tû vâ ®¹i héi bµi");
			nGoldenExp =  floor((GetLevel()^4)*300000/(80^4)/2)*nCount;
		else
			nGoldenExp =  floor((GetLevel()^4)*300000/(80^4))*nCount;
		end;
		gf_GoldenExp2Exp(nGoldenExp);
		
		SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
		Msg2Player("TuÇn nµy ng­¬i ®· dïng "..GetTask(TSK_USE_XINDE).." Thùc ChiÕn T©m §¾c, mçi tuÇn chØ cã thÓ dïng "..g_nMaxUseTime.." quyÓn Thùc ChiÕn T©m §¾c");	
	end;

end

function nothing()

end;

-- 2,1,1101