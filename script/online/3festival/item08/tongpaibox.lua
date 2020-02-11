--»Ô»ÍÖ®Í­ÅÆºÐ½Å±¾
--by vivi
--09/13/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function OnUse()
	Say("Më Hép §ång Bµi Huy Hoµng ph¶i cã Huy Hoµng §ång Th­îc Chuû, b¹n muèn më chø?",
		2,
		"§ång ý/confirm_open",
		"Kh«ng cã g×/nothing")
end

function confirm_open()
	if GetItemCount(2,0,1073) < 1 then
		Talk(1,"","Më Hép §ång Bµi Huy Hoµng ph¶i cã Ch×a Khãa §ång Huy Hoµng, b¹n kh«ng cã nã!");
		return
	else 
		if Zgc_pub_goods_add_chk(6,35) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
			return
		end	
		if DelItem(2,0,1077,1) == 1 and DelItem(2,0,1073,1) == 1 then
			AddItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],2);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tItemInfo[19][1].."2 tÊm!");
			local nRand = random(1,6);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("B¹n nhËn ®­îc "..nRand.." - (cÊp) 1 viªn Linh th¹ch, ®· bá vµo Tô Linh ®Ønh.");
		
			local nRandOne = random(1,1000000);
			local nTimes = GetTask(TASK_USE_TONG_BOX);
			local nProbOne = tBoxProb[2][1]*(1+nTimes*BOX_PROB_INCREASE);
			local nProbTwo = tBoxProb[2][2];
			local nRetCode = 0;		
			if nRandOne <= nProbOne then --»ñµÃ¼«Æ·ÎïÆ·
				local nRandTT = random(1,100);
				if nRandTT <= 40 then
					local nRoute = GetPlayerRoute();
					local nRandRing = random(1,getn(tbHuangDiRing1[nRoute]));
					local nRetCode = AddItem(tbHuangDiRing1[nRoute][nRandRing][2],tbHuangDiRing1[nRoute][nRandRing][3],tbHuangDiRing1[nRoute][nRandRing][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						SetTask(TASK_USE_TONG_BOX,0);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing1[nRoute][nRandRing][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép §ång Bµi Huy Hoµng nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing1[nRoute][nRandRing][1].."!");
						WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép §ång Bµi Huy Hoµng nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing1[nRoute][nRandRing][1]);
					else
						WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép §ång Bµi Huy Hoµng nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing1[nRoute][nRandRing][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
					end					
				else
					nRetCode = AddItem(tItemInfo[25][2],tItemInfo[25][3],tItemInfo[25][4],1);
					if nRetCode == 1 then
						SetTask(TASK_USE_TONG_BOX,0);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 "..tItemInfo[25][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép §ång Bµi Huy Hoµng nhËn ®­îc 1 "..tItemInfo[25][1]);
						WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép §ång Bµi Huy Hoµng nhËn ®­îc 1 "..tItemInfo[25][1]);
					else
						WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép §ång Bµi Huy Hoµng nhËn ®­îc 1 "..tItemInfo[25][1].." thÊt b¹i, ký hiÖu:"..nRetCode);
					end
				end
			elseif nRandOne <= nProbTwo then --»ñµÃ³£¹æ½±Àø
				local nRandTwo = random(1,1000);
				for i=1,getn(tBoxChangGui[2]) do
					if nRandTwo <= tBoxChangGui[2][i] then
						for j=1,getn(tBoxTong[i]) do
							nRetCode = AddItem(tBoxTong[i][j][2],tBoxTong[i][j][3],tBoxTong[i][j][4],1);
							if nRetCode == 1 then
								Msg2Player("B¹n nhËn ®­îc 1 "..tBoxTong[i][j][1]);
							else
								WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép §ång Bµi Huy Hoµng nhËn ®­îc "..tBoxTong[i][j][1].." thÊt b¹i, ký hiÖu"..nRetCode);
							end
						end
						break
					end
				end	
				SetTask(TASK_USE_TONG_BOX,GetTask(TASK_USE_TONG_BOX)+1);
				local nProbShow =  format("%.4f",(500/10000)*GetTask(TASK_USE_TONG_BOX)*BOX_PROB_INCREASE);
				Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_TONG_BOX).." lÇn më Hép §ång Bµi Huy Hoµng, tû lÖ nhËn ®­îc cùc phÈm (Hiªn Viªn chiÕn, Viªm Hoµng ThiÕt Hån) t¨ng lªn<color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");					
			else
				nRetCode = AddItem(tItemInfo[17][2],tItemInfo[17][3],tItemInfo[17][4],1);
				if nRetCode == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[17][1]);
					SetTask(TASK_USE_TONG_BOX,GetTask(TASK_USE_TONG_BOX)+1);
					local nProbShow =  format("%.4f",(500/10000)*GetTask(TASK_USE_TONG_BOX)*BOX_PROB_INCREASE);
					Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_TONG_BOX).." lÇn më Hép §ång Bµi Huy Hoµng, tû lÖ nhËn ®­îc cùc phÈm (Hiªn Viªn chiÕn, Viªm Hoµng ThiÕt Hån) t¨ng lªn<color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");					
				else
					WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép §ång Bµi Huy Hoµng nhËn ®­îc "..tItemInfo[17][1].." thÊt b¹i, ký hiÖu"..nRetCode);
				end
			end						
		end
	end
end