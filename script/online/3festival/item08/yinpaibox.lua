--ÈÙÒ«Ö®ÒøÅÆºÐ½Å±¾
--by vivi
--09/13/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function OnUse()
	Say("Më Hép Ng©n Bµi Vinh Dù ph¶i cã Ch×a Khãa B¹c Vinh Dù, b¹n muèn më chø?",
		2,
		"§ång ý/confirm_open",
		"Kh«ng cã g×/nothing")
end

function confirm_open()
	if GetItemCount(2,0,1074) < 1 then
		Talk(1,"","Më Hép Ng©n Bµi Vinh Dù ph¶i cã Ch×a Khãa B¹c Vinh Dù, b¹n kh«ng cã nã!");
		return
	else 
		if Zgc_pub_goods_add_chk(6,60) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
			return
		end	
		if DelItem(2,0,1078,1) == 1 and DelItem(2,0,1074,1) == 1 then
			AddItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],50);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tItemInfo[19][1].."50 tÊm!");
			
			local nRandOne = random(1,1000000);
			local nTimes = GetTask(TASK_USE_YIN_BOX);
			local nProbOne = tBoxProb[3][1]*(1+nTimes*BOX_PROB_INCREASE);
			local nProbTwo = tBoxProb[3][2];
			local nRetCode = 0;				
			
			if nRandOne <= nProbOne then --»ñµÃ¼«Æ·ÎïÆ·
				local nRandTT = random(1,100);
				if nRandTT <= 35 then
					local nRoute = GetPlayerRoute();
					local nRandRing = random(1,getn(tbHuangDiRing1[nRoute]));
					local nRetCode = AddItem(tbHuangDiRing1[nRoute][nRandRing][2],tbHuangDiRing1[nRoute][nRandRing][3],tbHuangDiRing1[nRoute][nRandRing][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						SetTask(TASK_USE_YIN_BOX,0);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing1[nRoute][nRandRing][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing1[nRoute][nRandRing][1].."!");
						WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing1[nRoute][nRandRing][1]);
					else
						WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing1[nRoute][nRandRing][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
					end				
				elseif nRandTT <= 60 then
					local nRoute = GetPlayerRoute();
					local nRandRing = random(1,getn(tbHuangDiRing2[nRoute]));
					local nRetCode = AddItem(tbHuangDiRing2[nRoute][nRandRing][2],tbHuangDiRing2[nRoute][nRandRing][3],tbHuangDiRing2[nRoute][nRandRing][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						SetTask(TASK_USE_YIN_BOX,0);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing2[nRoute][nRandRing][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing2[nRoute][nRandRing][1].."!");
						WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing2[nRoute][nRandRing][1]);
					else
						WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing2[nRoute][nRandRing][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
					end									
				else
					nRetCode = AddItem(tItemInfo[25][2],tItemInfo[25][3],tItemInfo[25][4],1);
					if nRetCode == 1 then
						SetTask(TASK_USE_YIN_BOX,0);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 "..tItemInfo[25][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[25][1]);
						WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[25][1]);
					else
						WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[25][1].." thÊt b¹i, ký hiÖu:"..nRetCode);
					end				
				end
			elseif nRandOne <= nProbTwo then --»ñµÃ³£¹æ½±Àø
				local nRandTwo = random(1,1000);
				if nRandTwo <= tBoxChangGui[3][1] then
					local nRandStone = random(1,100);
					if nRandStone <= 20 then
						lspf_AddLingShiInBottle(7,1);
						Msg2Player("B¹n nhËn ®­îc 1 Linh th¹ch cÊp 7, nã ë trong Tô Linh ®Ønh.");
					else
						lspf_AddLingShiInBottle(6,1);
						Msg2Player("B¹n nhËn ®­îc 1 viªn Linh th¹ch cÊp 6, nã ë trong Tô Linh ®Ønh.");
					end
					SetTask(TASK_USE_YIN_BOX,GetTask(TASK_USE_YIN_BOX)+1);
					local nProbShow = format("%.4f",(20000/10000)*GetTask(TASK_USE_YIN_BOX)*BOX_PROB_INCREASE);
					Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_YIN_BOX).." lÇn më Hép Ng©n Bµi Vinh Dù, tû lÖ nhËn ®­îc cùc phÈm (Hiªn Viªn chiÕn, Hiªn Viªn ®Êu, Viªm Hoµng ThiÕt Hån) t¨ng lªn <color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");					
				elseif nRandTwo <= tBoxChangGui[3][2] then
					nRetCode = AddItem(tItemInfo[30][2],tItemInfo[30][3],tItemInfo[30][4],1);
					if nRetCode == 1 then
						Msg2Player("B¹n nhËn ®­îc 1 quyÓn "..tItemInfo[30][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc 1 quyÓn "..tItemInfo[30][1]);
						SetTask(TASK_USE_YIN_BOX,GetTask(TASK_USE_YIN_BOX)+1);
						local nProbShow = format("%.4f",(20000/10000)*GetTask(TASK_USE_YIN_BOX)*BOX_PROB_INCREASE);
						Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_YIN_BOX).." lÇn më Hép Ng©n Bµi Vinh Dù, tû lÖ nhËn ®­îc cùc phÈm (Hiªn Viªn chiÕn, Hiªn Viªn ®Êu, Viªm Hoµng ThiÕt Hån) t¨ng lªn <color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");											
					else
						WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[30][1].." thÊt b¹i, ký hiÖu:"..nRetCode)
					end
				else
					if IB_VERSION == 1 then --Ãâ·ÑÇø
						nRetCode = AddItem(tItemInfo[38][2],tItemInfo[38][3],tItemInfo[38][4],1);
						if nRetCode == 1 then
							Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[38][1]);
							Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[38][1]);
						end
					else
						nRetCode = AddItem(tItemInfo[39][2],tItemInfo[39][3],tItemInfo[39][4],1);
						if nRetCode == 1 then
							Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[39][1]);
							Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[39][1]);
						end
					end
					if nRetCode == 1 then
						SetTask(TASK_USE_YIN_BOX,GetTask(TASK_USE_YIN_BOX)+1);
						local nProbShow = format("%.4f",(20000/10000)*GetTask(TASK_USE_YIN_BOX)*BOX_PROB_INCREASE);
						Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_YIN_BOX).." lÇn më Hép Ng©n Bµi Vinh Dù, tû lÖ nhËn ®­îc cùc phÈm (Hiªn Viªn chiÕn, Hiªn Viªn ®Êu, Viªm Hoµng ThiÕt Hån) t¨ng lªn <color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");
					else
						WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn Tµng kiÕm B¶o R­¬ng thÊt b¹i, vÞ trÝ thÊt b¹i: "..nRetCode);
					end
				end
			else
				nRetCode = AddItem(tItemInfo[18][2],tItemInfo[18][3],tItemInfo[18][4],1);
				if nRetCode == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[18][1]);
						SetTask(TASK_USE_YIN_BOX,GetTask(TASK_USE_YIN_BOX)+1);
						local nProbShow = format("%.4f",(20000/10000)*GetTask(TASK_USE_YIN_BOX)*BOX_PROB_INCREASE);
						Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_YIN_BOX).." lÇn më Hép Ng©n Bµi Vinh Dù, tû lÖ nhËn ®­îc cùc phÈm (Hiªn Viªn chiÕn, Hiªn Viªn ®Êu, Viªm Hoµng ThiÕt Hån) t¨ng lªn <color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");				
				else
					WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Ng©n Bµi Vinh Dù nhËn "..tItemInfo[18][1].." thÊt b¹i, ký hiÖu"..nRetCode);
				end				
			end
		end
	end
end