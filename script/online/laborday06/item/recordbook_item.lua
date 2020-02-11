--File name:recordbook_item.lua
--Describe:¾Û±¦Õ«¹¦ÀÍ²áÎïÆ·½Å±¾
--Create Date:2006-4-10
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

function OnUse()
	local selTab = {
				"Ch­¬ng 1: danh môc vËt thu thËp lo¹i 1/#seetype(1)",
				"Ch­¬ng 2: danh môc vËt thu thËp lo¹i 2/#seetype(2)",
				"Ch­¬ng 3: danh môc vËt thu thËp lo¹i 3/#seetype(3)",
				"Ch­¬ng 4: danh môc vËt thu thËp lo¹i 4/#seetype(4)",
				"Ch­¬ng 5: danh môc vËt thu thËp lo¹i 5/#seetype(5)",
				"Ch­¬ng 6: danh môc vËt thu thËp lo¹i 6/#seetype(6)",
				"Ch­¬ng 7: danh môc vËt thu thËp lo¹i 7/#seetype(7)",
				"Ch­¬ng 8: phÇn th­ëng/#knowrule(3)",
				"Ch­¬ng 9: thuyÕt minh ho¹t ®éng/#knowdetail(3)",
				"§ãng/nothing",
				}
	Say("B¹n ®· nép "..g_TotalItemNum.."<color=yellow>"..GetTask(ITEMNUM).."<color> lo¹i vËt thu thËp.",getn(selTab),selTab);
end;

function seetype(nType)
	seenext(nType,1);
end;

function seenext(nType,nPageNo)
	if nPageNo == 0 then	--Ä¿Ç°Ã»Æð×÷ÓÃ£¬²»¹ý»¹ÊÇ±£Áô×Å°É
		queryinfor();
		return 1;
	end;
	local nTaskID = LABORDAY_ITEM_BEGIN+nType-1;
	local sYes = "<color=yellow>®· nép<color> ";
	local sNo = "<color=red>ch­a nép<color>";
	local sContent = "";
	local selTab = {};
	local nSelNum = 1;
	local nMaxPage = 5;	--Ä¬ÈÏ×î´ó·­Ò³£¨Ð¡Ò³£©Êý
	local tNumTab = {
			"mét",
			"hai",
			"ba",
			"bèn",
			"Ngò ",
			"s¸u",
			"b¶y"
			};
	if nType == LABORDAY_ITEM_END-LABORDAY_ITEM_BEGIN+1 then	--Èç¹ûÎª×îºóÒ»Ò³£¨´óÒ³£©
		nMaxPage = floor(((g_TotalItemNum-30*(nType-1))-1)/6)+1;
	end;						
	if nPageNo ~= nMaxPage then
		selTab[nSelNum] = "Trang kÕ/#seenext("..nType..","..(nPageNo+1)..")";
		nSelNum = nSelNum + 1;
	end;
	if nPageNo ~= 1 then
		selTab[nSelNum] = "Trang tr­íc/#seenext("..nType..","..(nPageNo-1)..")";
		nSelNum = nSelNum + 1;
	end;
	selTab[nSelNum] = "Quay l¹i môc lôc tr­íc./OnUse";
	nSelNum = nSelNum + 1;
	selTab[nSelNum] = "§ãng./nothing";
	nSelNum = nSelNum + 1;
	local ItemNumPerPage = 6;
	if (nType-1)*30+nPageNo*6 > g_TotalItemNum then	
		ItemNumPerPage = mod(g_TotalItemNum,6);
	end;
	for i=1,ItemNumPerPage do	--6 item per page
		local sTail = "";
		if i ~= ItemNumPerPage then
			sTail = "<enter>";
		end;
		local nItemNo = (nType-1)*30+((nPageNo-1)*6+i);
		if ItemTab[nItemNo][5] ~= nil then
			if GetBit(GetTask(nTaskID),(nPageNo-1)*6+i) == 1 then
				sContent = sContent.."sè:"..nItemNo.." <color=green>"..ItemTab[nItemNo][5].."<color>("..ItemTab[nItemNo][4].."):"..sYes..sTail;
			else
				sContent = sContent.."sè:"..nItemNo.." <color=green>"..ItemTab[nItemNo][5].."<color>("..ItemTab[nItemNo][4].."):"..sNo..sTail;
			end;
		end;
	end;
	Say("Danh môc thu thËp, lo¹i <color=yellow>"..tNumTab[nType].."<color>, trang <color=yellow>"..nPageNo.."<color>:<enter>"..sContent,getn(selTab),selTab);
end;


