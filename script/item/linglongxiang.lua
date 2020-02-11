--Ãµ¹åºÐ×Ó
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")

function OnUse(nItemIdx)
	local nRose = 0;
	local tRose = { "Hoa Hång TÝm", "Hoa Hång Lam" }
	local tChenghao = { 2, 1 }
	local flag,nTime = GetAntiEnthrallmentInfo()
	if flag == 1 and nTime >= 10800 then
		Talk(1,"","<color=green>r­¬ng hoa hång<color>: Xin më r­¬ng ra trong tr¹ng th¸i kháe m¹nh!")
		return
	end
	if GetItemParam(nItemIdx,0) == 1 then  --Èç¹ûÊÇ×ÏÃµ¹å
		nRose = 1;
	elseif GetItemParam(nItemIdx,0) == 2 then  --Èç¹ûÊÇÀ¶Ãµ¹å
		nRose = 2;
	end
	if nRose == 0 then
		Say("R­¬ng hoa hång cã vÊn ®Ò. Xin liªn hÖ ®Ó kh¾c phôc.",0)
		return
	end
	Say("<color=green>"..tRose[nRose].."r­¬ng<color>: trang phôc trong r­¬ng nµy lµ <color=yellow>"..tRose[nRose].."<color>Trång lo¹i hoa nµy rÊt khã, ®Ó chøng minh t×nh yªu cña 2 ng­êi, ng­¬i cã chÊp nhËn 1 lÇn thö th¸ch kh«ng? §iÓm tÝch lòy cña ng­¬i sÏ bÞ gi¶m <color=yellow>"..tChenghao[nRose].."<color> cÊp.",
		2,
		"\n §­îc, ta chÊp nhËn/#rose_open("..nRose..")",
		"\n §Ó ta suy nghÜ/end_say"
	)
end

function rose_open(nType)
	if GetFreeItemRoom() < 2 then
		Talk (1,"main","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < 10 then			--ÅÐ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
		Talk (1,"main","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
		return 0
	end
	local tRose = {
		{204,206},
		{203,205}
	}
	local tJifen = { 5000,3000,1500,1000,500,200,100,0,-10,-100 }
	local nOldJifen = GetTask(ABLUEMOON_JIFEN);
	local nTojifen = nOldJifen;
	for i = 1,8 do
		if nOldJifen >= tJifen[i] then
			nTojifen = tJifen[i+3-nType]
			break
		end
	end
	local nDetail = tRose[nType][GetBody()-2]
	if DelItem(2,0,1161,1) == 1 then
		if AddItem(0,108,nDetail,1) == 1 then
			if nOldJifen > nTojifen then
				jifen_reduce(nOldJifen - nTojifen)
				--SetTask(ABLUEMOON_JIFEN, nTojifen)			
			else
				jifen_reduce((3-nType)*200)
				--SetTask(ABLUEMOON_JIFEN, GetTask(ABLUEMOON_JIFEN)-(3-nType)*200)
			end
			abluemoon_jifen()
			WriteLog("[R­¬ng Hoa Hång]: Ng­êi ch¬i  "..GetName().." më hép ra nhËn ®­îc 1 hoa hång sè hiÖu lµ "..nDetail..", ®iÓm tÝch lòy tr­íc lµ :"..nOldJifen)		
		else
			WriteLog("[R­¬ng Hoa Hång]: Ng­êi ch¬i  "..GetName().." më hép ra nhËn ®­îc 1 hoa hång sè hiÖu lµ "..nDetail.." (hoa hång) thÊt b¹i!!! §iÓm tÝch lòy tr­íc lµ:"..nOldJifen)
		end
	end
end

function abluemoon_jifen()
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local nTitleLevel = jifen2level(jifen)
	for i = 1,getn(tTitle) do --É¾³ýÔ­ÓÐµÄ³ÆºÅ
		RemoveTitle(50,i)
	end
	if AddTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]) == 1 then
		SetCurTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]);
		Msg2Player("B¹n nhËn ®­îc danh hiÖu"..tTitle[nTitleLevel][3].."{X­ng hiÖu}");
	end;
end

function end_say()
end