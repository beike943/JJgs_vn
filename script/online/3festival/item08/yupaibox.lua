--»Ô»ÍÖ®ÓñÅÆºÐ½Å±¾
--by vivi
--09/13/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function OnUse()
	Say("Më Hép Ngäc Bµi Huy Hoµng ph¶i cã Ch×a Khãa Ngäc Huy Hoµng, b¹n muèn më chø?",
		2,
		"§ång ý/confirm_open",
		"Kh«ng cã g×/nothing")
end

function confirm_open()
	if GetItemCount(2,0,1072) < 1 then
		Talk(1,"","Më Hép Ngäc Bµi Huy Hoµng cÇn Ch×a Khãa Ngäc Huy Hoµng, ng­¬i kh«ng cã Ch×a Khãa Ngäc Huy Hoµng µ!");
		return
	else 
		if Zgc_pub_goods_add_chk(6,35) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
			return
		end	
		if DelItem(2,0,1076,1) == 1 and DelItem(2,0,1072,1) == 1 then
			AddItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tItemInfo[19][1].."1 tÊm!");
			local nRand = random(1,5);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("B¹n nhËn ®­îc "..nRand.." - (cÊp) 1 viªn Linh th¹ch, ®· bá vµo Tô Linh ®Ønh.");
			
			local nRandOne = random(1,1000000);
			local nTimes = GetTask(TASK_USE_TIE_BOX);
			local nProbOne = tBoxProb[1][1]*(1+nTimes*BOX_PROB_INCREASE);
			local nProbTwo = tBoxProb[1][2];
			local nRetCode = 0;
			if nRandOne <= nProbOne then --»ñµÃ¼«Æ·ÎïÆ·
				nRetCode = AddItem(tItemInfo[25][2],tItemInfo[25][3],tItemInfo[25][4],1);
				if nRetCode == 1 then
					SetTask(TASK_USE_TIE_BOX,0);
					Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 "..tItemInfo[25][1]);
					Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Ngäc Bµi Huy Hoµng nhËn ®­îc 1 "..tItemInfo[25][1]);
					WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ngäc Bµi Huy Hoµng nhËn ®­îc 1 "..tItemInfo[25][1]);
				else
					WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ngäc Bµi Huy Hoµng nhËn ®­îc 1 "..tItemInfo[25][1].." thÊt b¹i, ký hiÖu:"..nRetCode);
				end
			elseif nRandOne <= nProbTwo then --»ñµÃ³£¹æ½±Àø
				local nRandTwo = random(1,1000);
				for i=1,getn(tBoxChangGui[1]) do
					if nRandTwo <= tBoxChangGui[1][i] then
						for j=1,getn(tBoxTie[i]) do
							nRetCode = AddItem(tBoxTie[i][j][2],tBoxTie[i][j][3],tBoxTie[i][j][4],1);
							if nRetCode == 1 then
								Msg2Player("B¹n nhËn ®­îc 1 "..tBoxTie[i][j][1]);
							else
								WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ngäc Bµi Huy Hoµng nhËn ®­îc "..tBoxTie[i][j][1].." thÊt b¹i, ký hiÖu"..nRetCode);
							end
						end
						break
					end
				end
				SetTask(TASK_USE_TIE_BOX,GetTask(TASK_USE_TIE_BOX)+1);
				local nProbShow = format("%.4f",(100/10000)*GetTask(TASK_USE_TIE_BOX)*BOX_PROB_INCREASE);
				Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_TIE_BOX).." më Hép Ngäc Bµi Huy Hoµng, tû lÖ nhËn ®­îc cùc phÈm (Viªm Hoµng ThiÕt Hån) t¨ng <color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");						
			else
				nRetCode = AddItem(tItemInfo[16][2],tItemInfo[16][3],tItemInfo[16][4],1);
				if nRetCode == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[16][1]);
					SetTask(TASK_USE_TIE_BOX,GetTask(TASK_USE_TIE_BOX)+1);
					local nProbShow = format("%.4f",(100/10000)*GetTask(TASK_USE_TIE_BOX)*BOX_PROB_INCREASE);
					Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_TIE_BOX).." më Hép Ngäc Bµi Huy Hoµng, tû lÖ nhËn ®­îc cùc phÈm (Viªm Hoµng ThiÕt Hån) t¨ng <color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");					
				else
					WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ngäc Bµi Huy Hoµng nhËn ®­îc "..tItemInfo[16][1].." thÊt b¹i, ký hiÖu"..nRetCode);
				end
			end	
		end
	end
end
