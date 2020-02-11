--ÁéÊ¯Åä·½ÏÔÊ¾½Å±¾
--by vivi
--08/10/2007

Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\string.lua");
lingshi_pf = new(KTabFile,"\\settings\\item\\lingshipeifang.txt")
lingshi_attri = new(KTabFile,"\\settings\\item\\item_attribute.txt")


--ÏâÇ¶Î»ÖÃ¶ÔÓ¦table
tXqPos = {
	{"VÞ trÝ tøng øng bÊt kú",-1},
	{"M·o",0},
	{"Y phôc",1},
	{"Vò khÝ",2},
	{"H¹ y",3},
	{"Tïy ý",4}
	}

function OnUse(nItemIndex)
	local nParticular = GetItemParticular(nItemIndex); --ÏêÏ¸ÀàID£¬×÷ÎªÎ¨Ò»±êÊ¶
	local nPartRow = lingshi_pf:selectRowNum(43,nParticular); --»ñµÃ¸ÃÅä·½ËùÔÚµÄÐÐÊý
	local nId = tonumber(lingshi_pf:getCell(nPartRow,1)); --Ä§·¨ÊôÐÔ
	local nPos = tonumber(lingshi_pf:getCell(nPartRow,2)); --ÏâÇ¶Î»ÖÃ
	local nLv = tonumber(lingshi_pf:getCell(nPartRow,3));		--ÁéÊ¯µÈ¼¶
	local nNum = tonumber(lingshi_pf:getCell(nPartRow,4));  --ÐèÒªµÄÁéÊ¯ÊýÁ¿
	local nScId = tonumber(lingshi_pf:getCell(nPartRow,44)); --Éú³ÉºóµÄÄ§·¨ÊôÐÔ
	local nScPos = tonumber(lingshi_pf:getCell(nPartRow,45)); --Éú³ÉºóµÄÏâÇ¶Î»ÖÃ
	local nScLv = tonumber(lingshi_pf:getCell(nPartRow,46));  --Éú³ÉºóµÄÁéÊ¯µÈ¼¶
	local nId2 = tonumber(lingshi_pf:getCell(nPartRow,5)); --Ä§·¨ÊôÐÔ
	local nPos2 = tonumber(lingshi_pf:getCell(nPartRow,6)); --ÏâÇ¶Î»ÖÃ
	local nLv2 = tonumber(lingshi_pf:getCell(nPartRow,7));		--ÁéÊ¯µÈ¼¶
	local nNum2 = tonumber(lingshi_pf:getCell(nPartRow,8));  --ÐèÒªµÄÁéÊ¯ÊýÁ¿
	
	local sReName = "";                            --ÏÔÊ¾¸øÍæ¼ÒµÄ
	if nId ~= -1 then
		local sName = lingshi_attri:getCell(nId+1,20); --»ñÈ¡Ä§·¨idÃû
		local sFlogOne = strfind(sName,"/1");
		local sFlogTwo = strfind(sName,"/t");
		if sFlogOne ~= nil and sFlogTwo == nil then
			local sAttriOne = lingshi_attri:getCell(nId+1,11); --»ñÈ¡ÊôÐÔÒ»
			local sAttriTwo = "";  --ÊôÐÔ¶þ
			if lingshi_attri:getCell(nId+1,15) ~= "" then
				sAttriTwo = lingshi_attri:getCell(nId+1,15);
			end
			local nMinLv = tonumber(lingshi_attri:getCell(nId+1,28)); --»ñÈ¡×îµÍµÈ¼¶
			if nMinLv == nil then
				nMinLv = 1;
			end
			local nIsRand = tonumber(lingshi_attri:getCell(nId+1,29));--»ñÈ¡ÊÇ·ñËæ»ú 0ÎªËæ»ú 1Îª²»Ëæ»ú
			local tOne = split(sAttriOne); --·Ö¸îÊôÐÔÒ»£¬Ä¬ÈÏ","Îª·Ö¸î·û£¬·Ö¸îºóÎªtOne[1],tOne[2]..
			local nOneMin = tonumber(tOne[1])/10;
			local nOneAdd = tonumber(tOne[2])/10;
			local tTwo = {};
			local nTwoMin = 0;
			local nTwoAdd = 0;
			if sAttriTwo ~= "" then
				tTwo = split(sAttriTwo);
				nTwoMin = tonumber(tTwo[1])/10;
				nTwoAdd = tonumber(tTwo[2])/10;
			end
			local sReOne = "";--Ìæ´úµÄ×Ö·û´®
			local sReTwo = "";
			if nIsRand == 0 then	
				if nLv > nMinLv then
					if nOneAdd == 1 then
						sReOne = nOneMin+nOneAdd*(nLv-nMinLv);
					else	
						sReOne = tostring((nOneMin+nOneAdd*(nLv-nMinLv-1)+1).."-"..(nOneMin+nOneAdd*(nLv-nMinLv)));
					end
					if sAttriTwo ~= "" then	
						if nTwoAdd == 1 then
							sReTwo = nTwoMin+nTwoAdd*(nLv-nMinLv);
						else	
							sReTwo = tostring((nTwoMin+nTwoAdd*(nLv-nMinLv-1)+1).."-"..(nTwoMin+nTwoAdd*(nLv-nMinLv)));
						end
					end
				elseif nLv == nMinLv then
					sReOne = tostring(floor(nOneMin/2).."-"..nOneMin);
					if sAttriTwo ~= "" then
						sReTwo = tostring(floor(nTwoMin/2).."-"..nTwoMin);
					end
				end
			else
				sReOne = tostring(nOneMin+nOneAdd*(nLv-nMinLv));
				if sAttriTwo ~= "" then	
					sReTwo = tostring(nTwoMin+nTwoAdd*(nLv-nMinLv));
				end
			end
			sReName = replace(sName,"/1",sReOne);
			if sAttriTwo ~= "" then
				sReName = replace(sReName,"/2",sReTwo);
			end
		elseif sFlogOne == nil and sFlogTwo ~= nil then
			local sReOne = lingshi_attri:getCell(nId+1,nLv);--Ìæ´úµÄ×Ö·û´®
			sReName = replace(sName,"/t",sReOne);
		end
	else
	 sReName = "Thuéc tÝnh t­íng øng bÊt kú";
	end
	
	local sReName2 = "";                            --ÏÔÊ¾¸øÍæ¼ÒµÄ
	if nScId ~= -1 then
		local sName = lingshi_attri:getCell(nScId+1,20); --»ñÈ¡Ä§·¨idÃû
		local sFlogOne = strfind(sName,"/1");
		local sFlogTwo = strfind(sName,"/t");
		if sFlogOne ~= nil and sFlogTwo == nil then
			local sAttriOne = lingshi_attri:getCell(nScId+1,11); --»ñÈ¡ÊôÐÔÒ»
			local sAttriTwo = "";  --ÊôÐÔ¶þ
			if lingshi_attri:getCell(nScId+1,15) ~= "" then
				sAttriTwo = lingshi_attri:getCell(nScId+1,15);
			end
			local nMinLv = tonumber(lingshi_attri:getCell(nScId+1,28)); --»ñÈ¡×îµÍµÈ¼¶
			if nMinLv == nil then
				nMinLv = 1;
			end			
			local nIsRand = tonumber(lingshi_attri:getCell(nScId+1,29));--»ñÈ¡ÊÇ·ñËæ»ú 0ÎªËæ»ú 1Îª²»Ëæ»ú
			local tOne = split(sAttriOne); --·Ö¸îÊôÐÔÒ»£¬Ä¬ÈÏ","Îª·Ö¸î·û£¬·Ö¸îºóÎªtOne[1],tOne[2]..
			local nOneMin = tonumber(tOne[1])/10;
			local nOneAdd = tonumber(tOne[2])/10;
			local tTwo = {};
			local nTwoMin = 0;
			local nTwoAdd = 0;
			if sAttriTwo ~= "" then
				tTwo = split(sAttriTwo);
				nTwoMin = tonumber(tTwo[1])/10;
				nTwoAdd = tonumber(tTwo[2])/10;
			end
			local sReOne = "";--Ìæ´úµÄ×Ö·û´®
			local sReTwo = "";
			if nIsRand == 0 then	
				if nScLv > nMinLv then
					if nOneAdd == 1 then
						sReOne = nOneMin+nOneAdd*(nScLv-nMinLv);
					else	
						sReOne = tostring((nOneMin+nOneAdd*(nScLv-nMinLv-1)+1).."-"..(nOneMin+nOneAdd*(nScLv-nMinLv)));
					end
					if sAttriTwo ~= "" then	
						if nTwoAdd == 1 then
							sReTwo = nTwoMin+nTwoAdd*(nScLv-nMinLv);
						else
							sReTwo = tostring((nTwoMin+nTwoAdd*(nScLv-nMinLv-1)+1).."-"..(nTwoMin+nTwoAdd*(nScLv-nMinLv)));
						end
					end
				elseif nScLv == nMinLv then
					sReOne = tostring(floor(nOneMin/2).."-"..nOneMin);
					if sAttriTwo ~= "" then
						sReTwo = tostring(floor(nTwoMin/2).."-"..nTwoMin);
					end
				end				
			else
				sReOne = tostring(nOneMin+nOneAdd*(nScLv-nMinLv));
				if sAttriTwo ~= "" then	
					sReTwo = tostring(nTwoMin+nTwoAdd*(nScLv-nMinLv));
				end
			end
			sReName2 = replace(sName,"/1",sReOne);
			if sAttriTwo ~= "" then
				sReName2 = replace(sReName2,"/2",sReTwo);
			end
		elseif sFlogOne == nil and sFlogTwo ~= nil then
			local sReOne = lingshi_attri:getCell(nScId+1,nScLv);--Ìæ´úµÄ×Ö·û´®
			sReName2 = replace(sName,"/t",sReOne);
		end
	else
	 sReName2 = "Thuéc tÝnh t­íng øng bÊt kú";
	end
	
	local sReName3 = "";                            --ÏÔÊ¾¸øÍæ¼ÒµÄ
	if nId2 ~= nil then
		if nId2 ~= -1 then
			local sName = lingshi_attri:getCell(nId2+1,20); --»ñÈ¡Ä§·¨idÃû
			local sFlogOne = strfind(sName,"/1");
			local sFlogTwo = strfind(sName,"/t");
			if sFlogOne ~= nil and sFlogTwo == nil then
				local sAttriOne = lingshi_attri:getCell(nId2+1,11); --»ñÈ¡ÊôÐÔÒ»
				local sAttriTwo = "";  --ÊôÐÔ¶þ
				if lingshi_attri:getCell(nId2+1,15) ~= "" then
					sAttriTwo = lingshi_attri:getCell(nId2+1,15);
				end
				local nMinLv = tonumber(lingshi_attri:getCell(nId2+1,28)); --»ñÈ¡×îµÍµÈ¼¶
				if nMinLv == nil then
					nMinLv = 1;
				end			
				local nIsRand = tonumber(lingshi_attri:getCell(nId2+1,29));--»ñÈ¡ÊÇ·ñËæ»ú 0ÎªËæ»ú 1Îª²»Ëæ»ú
				local tOne = split(sAttriOne); --·Ö¸îÊôÐÔÒ»£¬Ä¬ÈÏ","Îª·Ö¸î·û£¬·Ö¸îºóÎªtOne[1],tOne[2]..
				local nOneMin = tonumber(tOne[1])/10;
				local nOneAdd = tonumber(tOne[2])/10;
				local tTwo = {};
				local nTwoMin = 0;
				local nTwoAdd = 0;
				if sAttriTwo ~= "" then
					tTwo = split(sAttriTwo);
					nTwoMin = tonumber(tTwo[1])/10;
					nTwoAdd = tonumber(tTwo[2])/10;
				end
				local sReOne = "";--Ìæ´úµÄ×Ö·û´®
				local sReTwo = "";
				if nIsRand == 0 then	
					if nScLv > nMinLv then
						if nOneAdd == 1 then
							sReOne = nOneMin+nOneAdd*(nScLv-nMinLv);
						else	
							sReOne = tostring((nOneMin+nOneAdd*(nScLv-nMinLv-1)+1).."-"..(nOneMin+nOneAdd*(nScLv-nMinLv)));
						end
						if sAttriTwo ~= "" then	
							if nTwoAdd == 1 then
								sReTwo = nTwoMin+nTwoAdd*(nScLv-nMinLv);
							else
								sReTwo = tostring((nTwoMin+nTwoAdd*(nScLv-nMinLv-1)+1).."-"..(nTwoMin+nTwoAdd*(nScLv-nMinLv)));
							end
						end
					elseif nScLv == nMinLv then
						sReOne = tostring(floor(nOneMin/2).."-"..nOneMin);
						if sAttriTwo ~= "" then
							sReTwo = tostring(floor(nTwoMin/2).."-"..nTwoMin);
						end
					end				
				else
					sReOne = tostring(nOneMin+nOneAdd*(nScLv-nMinLv));
					if sAttriTwo ~= "" then	
						sReTwo = tostring(nTwoMin+nTwoAdd*(nScLv-nMinLv));
					end
				end
				sReName3 = replace(sName,"/1",sReOne);
				if sAttriTwo ~= "" then
					sReName3 = replace(sReName2,"/2",sReTwo);
				end
			elseif sFlogOne == nil and sFlogTwo ~= nil then
				local sReOne = lingshi_attri:getCell(nScId+1,nScLv);--Ìæ´úµÄ×Ö·û´®
				sReName3 = replace(sName,"/t",sReOne);
			end
		else
		 sReName3 = "Thuéc tÝnh t­íng øng bÊt kú";
		end
	end	
	
	local nXqRow = 1;   --tXqPos±í¶ÔÓ¦µÄÐÐÊý
	local nScXqRow = 1; --Éú³Éºó
	for j=1,getn(tXqPos) do
		if nPos == tXqPos[j][2] then
			nXqRow = j;
			break
		end
	end
	for p=1,getn(tXqPos) do
		if nScPos == tXqPos[p][2] then
			nScXqRow = p;
			break
		end
	end
	local nXqRow2 = 1;
	if nPos2 ~= nil then
		for q=1,getn(tXqPos) do
			if nPos2 == tXqPos[q][2] then
				nXqRow2 = q;
				break
			end
		end
	end
	
	if nId2 == nil then 		
		Talk(1,"","<color=green>Yªu cÇu nguyªn liÖu<color>: cÇn <color=yellow>"..nNum.."<color> linh th¹ch cÊp <color=yellow>"..nLv.."<color> cã thuéc tÝnh linh th¹ch lµ <color=yellow>"..sReName.."<color>, vÞ trÝ kh¶m lµ <color=yellow> "..tXqPos[nXqRow][1].."<color>. \n<color=green>Linh th¹ch sinh thµnh<color>: nhËn ®­îc linh th¹ch cÊp <color=yellow>"..nScLv.."<color>, thuéc tÝnh linh th¹ch lµ <color=yellow>"..sReName2.."<color>, vÞ trÝ kh¶m lµ <color=yellow> "..tXqPos[nScXqRow][1].."<color> \n<color=red>§em linh th¹ch phèi ph­¬ng vµ nguyªn liÖu yªu cÇu nÐm vµo trong Hîp Thµnh t¹i C«ng D· Binh, mçi lÇn chØ dùa theo 1 lo¹i phèi ph­¬ng hîp thµnh, nÕu kh«ng dùa theo th× ngÉu nhiªn mµ hîp thµnh linh th¹ch. Chó ý: ngoµi thuéc tÝnh linh th¹ch ra, ®¼ng cÊp linh th¹ch ph¶i phï hîp víi yªu cÇu.<color>");	
	else
		Talk(1,"","<color=green>Yªu cÇu nguyªn liÖu<color>: cÇn <color=yellow>"..nNum.."<color> linh th¹ch cÊp <color=yellow>"..nLv.."<color> cã thuéc tÝnh linh th¹ch lµ <color=yellow>"..sReName.."<color>, vÞ trÝ kh¶m lµ <color=yellow> "..tXqPos[nXqRow][1].."<color> vµ <color=yellow>"..nNum2.."<color> linh th¹ch cÊp <color=yellow>"..nLv2.."<color> cã thuéc tÝnh linh th¹ch lµ <color=yellow>"..sReName3.."<color>, vÞ trÝ kh¶m lµ <color=yellow> "..tXqPos[nXqRow2][1].."<color>. \n<color=green>Linh th¹ch sinh thµnh<color>: nhËn ®­îc linh th¹ch cÊp <color=yellow>"..nScLv.."<color>, thuéc tÝnh linh th¹ch lµ <color=yellow>"..sReName2.."<color>, vÞ trÝ kh¶m lµ <color=yellow> "..tXqPos[nScXqRow][1].."<color> \n<color=red>§em linh th¹ch phèi ph­¬ng vµ nguyªn liÖu yªu cÇu nÐm vµo trong Hîp Thµnh t¹i C«ng D· Binh, mçi lÇn chØ dùa theo 1 lo¹i phèi ph­¬ng hîp thµnh, nÕu kh«ng dùa theo th× ngÉu nhiªn mµ hîp thµnh linh th¹ch. Chó ý: ngoµi thuéc tÝnh linh th¹ch ra, ®¼ng cÊp linh th¹ch ph¶i phï hîp víi yªu cÇu.<color>");		
	end
end