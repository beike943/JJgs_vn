--Íò±¦¸óÍò±¦²á½Å±¾
--by vivi
--08/23/2007

Include("\\script\\lib\\lingshipeifang_info.lua")
TB_LINGSHI_PEIFANG_NAME = new(KTabFile,"\\settings\\item\\quest.txt")

function OnUse()
	Say("<color=green>V¹n B¶o C¸c V¹n B¶o S¸ch<color>: B¹n muèn sö dông V¹n B¶o C¸c V¹n B¶o S¸ch ®æi lÊy mét Linh Th¹ch phèi ph­¬ng cÊp 7 bÊt kú chØ ®Þnh kh«ng?",
		2,
		"Cã, ta muèn vµo giao diÖn lùa chän phèi ph­¬ng cÊp 7/#choose_peifang(0)",
		"T¹m thêi kh«ng ®æi/nothing")
end

function choose_peifang(nPage)
	local tPeifang = lspf_GetPeiFangTable(SYS_TB_LINGSHI_PF_LEVEL,7);
	if type(tPeifang) ~= "table" then
		return 0;
	end
	local strtab = {};
	local nPageNum = 7; --Ò»Ò³ÏÔÊ¾µÄÊýÁ¿
	local nRemaidNum = getn(tPeifang)-nPage*nPageNum;
	local nDiaNum = 7;
	if nRemaidNum <= nDiaNum then
		nDiaNum = nRemaidNum;
	end
	local sPfName = "";
	for i=1,nDiaNum do
		for j=2,(TB_LINGSHI_PEIFANG_NAME:getRow()) do
			local nId3 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(j,4));
			if nId3 == tPeifang[nPage*nPageNum+i][3] then
				local nId2 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(j,3));
				if nId2 == tPeifang[nPage*nPageNum+i][2] then
					local nId1 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(j,2));
					if nId1 == tPeifang[nPage*nPageNum+i][1] then			
						sPfName = TB_LINGSHI_PEIFANG_NAME:getCell(j,1);
						tinsert(strtab,sPfName.."/#give_peifang("..j..")");
						break
					end
				end
			end
		end
	end
	if nPage ~= 0 then		
		tinsert(strtab,"Trang tr­íc/#choose_peifang("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum then
		tinsert(strtab,"Trang kÕ/#choose_peifang("..(nPage+1)..")");
	end
		tinsert(strtab,"Bá ®i, t¹m thêi kh«ng ®æi/nothing");	
		Say("Xin chän Linh Th¹ch phèi ph­¬ng cÊp 7 b¹n muèn ®æi",
			getn(strtab),
			strtab)
end

function give_peifang(nRow)
	if GetItemCount(2,1,2641) < 1000 then
		Talk(1,"","B¹n kh«ng cã ®ñ <color=yellow>m¶nh Linh Th¹ch phèi ph­¬ng<color>");
		return
	end
	if DelItem(2,1,2645,1) == 1 and DelItem(2,1,2641,1000) == 1 then 
		local nId3 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(nRow,4));
		local nId2 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(nRow,3));
		local nId1 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(nRow,2));		
		local add_flog = AddItem(nId1,nId2,nId3,1,1);
		if add_flog == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch phèi ph­¬ng cÊp 7");
		else
			WriteLog("V¹n B¶o C¸c V¹n B¶o S¸ch: ng­êi ch¬i "..GetName().."LÊy Linh Th¹ch phèi ph­¬ng cÊp 7 thÊt b¹i, tiªu chÝ thÊt b¹i:"..add_flog);
		end
	end
end

function nothing()

end