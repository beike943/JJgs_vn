--ÈÙÒ«Ö®½ðÅÆºÐ½Å±¾
--by vivi
--09/13/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function OnUse()
	Say("Më Hép Kim Bµi Vinh Dù ph¶i cã Ch×a Khãa Vµng Vinh Dù. B¹n muèn më chø?",
		3,
		"§ång ý! Ta muèn nhËn ®­îc vò khÝ Hiªn Viªn/#ask_choose_weapon(1)",
		"§ång ý! Nh­ng ta kh«ng muèn nhËn vò khÝ Hiªn viªn (t¨ng tû lÖ nhËn ®­îc Viªn Hoµng ThiÕt Hån)/#ask_choose_weapon(2)",
		"Kh«ng cã g×/nothing")
end

function ask_choose_weapon(nType)
	if nType == 1 then
		Say("Më Hép Kim Bµi Vinh Dù cã thÓ nhËn ®­îc vò khÝ Hiªn Viªn, b¹n muèn nhËn <color=yellow>vò khÝ Hiªn Viªn<color>?",
			2,
			"§ång ý/choose_weapon",
			"§Ó ta suy nghÜ/nothing")
	elseif nType == 2 then
		Say("Më Hép Kim Bµi Vinh Dù cã thÓ nhËn ®­îc vò khÝ Hiªn Viªn, b¹n x¸c nhËn <color=yellow>kh«ng muèn nhËn vò khÝ Hiªn Viªn<color>?",
			2,
			"§ång ý/#confirm_open(3)",
			"§Ó ta suy nghÜ/nothing")		
	end
end

function choose_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		Say("Më Hép Kim Bµi Vinh Dù cã thÓ nhËn ®­îc vò khÝ Hoµng §Õ, nÕu më ra vò khÝ Hoµng §Õ, b¹n h·y chän lo¹i vò khÝ b¹n muèn",
			3,
			"Ta muèn lÊy Hiªn Viªn To¸i Vò §ao /#want_weapon(1)",
			"Ta muèn lÊy Hiªn Viªn To¸i Vò §ao/#want_weapon(2)",
			"T¹m thêi kh«ng më r­¬ng /nothing")	
	else
		confirm_open(0);
	end	
end

function want_weapon(nType)
	if nType == 1 then
		Say("NÕu më ra Hoµng §Õ vò khÝ, b¹n chän Hiªn Viªn To¸i Vò §ao, b¹n x¸c nhËn kh«ng? ",
			2,
			"§ång ý/#confirm_open(1)",
			"Ta chän nhÇm råi./choose_weapon");
	elseif nType == 2 then
		Say("NÕu më ra Hoµng §Õ vò khÝ ,b¹n chän Hiªn Viªn To¸i Vò C«n, b¹n x¸c nhËn kh«ng? ",
			2,
			"§ång ý/#confirm_open(2)",
			"Ta chän nhÇm råi./choose_weapon");	
	end	
end

function confirm_open(nType)
	if GetItemCount(2,0,1075) < 1 then
		Talk(1,"","Më Hép Kim Bµi Vinh Dù ph¶i cã Ch×a Khãa Vµng Vinh Dù, b¹n kh«ng cã Ch×a Khãa Vµng Vinh Dù µ!");
		return
	else 
		if Zgc_pub_goods_add_chk(5,50) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
			return
		end	
		if DelItem(2,0,1079,1) == 1 and DelItem(2,0,1075,1) == 1 then
			AddItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],300);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tItemInfo[19][1].."300 thÎ!");
			
			local nRandOne = random(1,1000000);
			local nTimes = GetTask(TASK_USE_JIN_BOX);
			local nProbOne = tBoxProb[4][1]*(1+nTimes*BOX_PROB_INCREASE);
			local nProbTwo = tBoxProb[4][2];
			local nRetCode = 0;	
			
			if nRandOne <= nProbOne then --»ñµÃ¼«Æ·ÎïÆ·
				local nRandThree = random(1,100);
				if nRandThree <= 20 then
					local nRoute = GetPlayerRoute();
					local nRandRing = random(1,getn(tbHuangDiRing1[nRoute]));
					nRetCode = AddItem(tbHuangDiRing1[nRoute][nRandRing][2],tbHuangDiRing1[nRoute][nRandRing][3],tbHuangDiRing1[nRoute][nRandRing][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						SetTask(TASK_USE_JIN_BOX,0);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing1[nRoute][nRandRing][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing1[nRoute][nRandRing][1].."!");
						WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing1[nRoute][nRandRing][1]);
					else
						WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing1[nRoute][nRandRing][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
					end	
				elseif nRandThree <= 40 then
					local nRoute = GetPlayerRoute();
					local nRandRing = random(1,getn(tbHuangDiRing2[nRoute]));
					nRetCode = AddItem(tbHuangDiRing2[nRoute][nRandRing][2],tbHuangDiRing2[nRoute][nRandRing][3],tbHuangDiRing2[nRoute][nRandRing][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						SetTask(TASK_USE_JIN_BOX,0);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing2[nRoute][nRandRing][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing2[nRoute][nRandRing][1].."!");
						WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing2[nRoute][nRandRing][1]);
					else
						WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tbHuangDiRing2[nRoute][nRandRing][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
					end							
				elseif nRandThree <= 60 then --»ÆµÛÎäÆ÷
					if nType ~= 3 then
						local nRoute = GetPlayerRoute();
						if nRoute == 2 then
							nRetCode = AddItem(tHuangDiWeapon[nRoute][nType][2],tHuangDiWeapon[nRoute][nType][3],tHuangDiWeapon[nRoute][nType][4],1,1,-1,-1,-1,-1,-1,-1);
							if nRetCode == 1 then
								SetTask(TASK_USE_JIN_BOX,0);
								Msg2Player("Chóc mõng b¹n nhËn ®­îc trang bÞ Hoµng §Õ "..tHuangDiWeapon[nRoute][nType][1]);
								Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tHuangDiWeapon[nRoute][nType][1].."!");
								WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tHuangDiWeapon[nRoute][nType][1]);
							else
								WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tHuangDiWeapon[nRoute][nType][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
							end	
						else
							local nRandwp = random(1,getn(tHuangDiWeapon[nRoute]));
							nRetCode = AddItem(tHuangDiWeapon[nRoute][nRandwp][2],tHuangDiWeapon[nRoute][nRandwp][3],tHuangDiWeapon[nRoute][nRandwp][4],1,1,-1,-1,-1,-1,-1,-1);
							if nRetCode == 1 then
								SetTask(TASK_USE_JIN_BOX,0);
								Msg2Player("Chóc mõng b¹n nhËn ®­îc trang bÞ Hoµng §Õ "..tHuangDiWeapon[nRoute][nRandwp][1]);
								Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tHuangDiWeapon[nRoute][nRandwp][1].."!");
								WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tHuangDiWeapon[nRoute][nRandwp][1]);
							else
								WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc trang bÞ Hoµng §Õ"..tHuangDiWeapon[nRoute][nRandwp][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
							end					
						end	
					else
						nRetCode = AddItem(tItemInfo[25][2],tItemInfo[25][3],tItemInfo[25][4],1);
						if nRetCode == 1 then
							SetTask(TASK_USE_JIN_BOX,0);
							Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 "..tItemInfo[25][1]);
							Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[25][1]);
							WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[25][1]);
						else
							WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[25][1].." thÊt b¹i, ký hiÖu:"..nRetCode);
						end
					end			
				else  --Ñ×»ÆÌú»ê
					nRetCode = AddItem(tItemInfo[25][2],tItemInfo[25][3],tItemInfo[25][4],1);
					if nRetCode == 1 then
						SetTask(TASK_USE_JIN_BOX,0);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 "..tItemInfo[25][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[25][1]);
						WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[25][1]);
					else
						WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[25][1].." thÊt b¹i, ký hiÖu:"..nRetCode);
					end										
				end						
			else --»ñµÃ³£¹æ½±Àø
				local nRandTwo = random(1,1000);
				if nRandTwo <= tBoxChangGui[4][1] then
					lspf_AddLingShiInBottle(7,3);
					Msg2Player("B¹n nhËn ®­îc 3 viªn Linh th¹ch cÊp 7, nã ë trong Tô Linh ®Ønh.");
					SetTask(TASK_USE_JIN_BOX,GetTask(TASK_USE_JIN_BOX)+1);
					local nProbShow = format("%.4f",(200000/10000)*GetTask(TASK_USE_JIN_BOX)*BOX_PROB_INCREASE);
					Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_JIN_BOX).." lÇn më Hép Kim Bµi Vinh Dù, tû lÖ nhËn ®­îc cùc phÈm (Hiªn Viªn chiÕn, Hiªn Viªn ®Êu, vò khÝ Hiªn Viªn, Viªm Hoµng ThiÕt Hån) t¨ng cao<color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");					
				elseif nRandTwo <= tBoxChangGui[4][2] then
					nRetCode = AddItem(tItemInfo[31][2],tItemInfo[31][3],tItemInfo[31][4],1);
					if nRetCode == 1 then
						Msg2Player("B¹n nhËn ®­îc 1 quyÓn "..tItemInfo[31][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 quyÓn "..tItemInfo[31][1]);
						SetTask(TASK_USE_JIN_BOX,GetTask(TASK_USE_JIN_BOX)+1);
						local nProbShow = format("%.4f",(200000/10000)*GetTask(TASK_USE_JIN_BOX)*BOX_PROB_INCREASE);
						Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_JIN_BOX).." lÇn më Hép Kim Bµi Vinh Dù, tû lÖ nhËn ®­îc cùc phÈm (Hiªn Viªn chiÕn, Hiªn Viªn ®Êu, vò khÝ Hiªn Viªn, Viªm Hoµng ThiÕt Hån) t¨ng cao<color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");											
					else
						WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[31][1].." thÊt b¹i, ký hiÖu:"..nRetCode)
					end		
				else
					if IB_VERSION == 1 then --Ãâ·ÑÇø
						nRetCode = AddItem(tItemInfo[38][2],tItemInfo[38][3],tItemInfo[38][4],1);
						if nRetCode == 1 then
							Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[38][1]);
							Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[38][1]);
							SetTask(TASK_USE_JIN_BOX,GetTask(TASK_USE_JIN_BOX)+1);
							local nProbShow = format("%.4f",(200000/10000)*GetTask(TASK_USE_JIN_BOX)*BOX_PROB_INCREASE);
							Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_JIN_BOX).." lÇn më Hép Kim Bµi Vinh Dù, tû lÖ nhËn ®­îc cùc phÈm (Hiªn Viªn chiÕn, Hiªn Viªn ®Êu, vò khÝ Hiªn Viªn, Viªm Hoµng ThiÕt Hån) t¨ng cao<color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");								
						else
							WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[38][1].." thÊt b¹i, ký hiÖu:"..nRetCode)
						end
					else  --ÊÕ·ÑÇø
						nRetCode = AddItem(tItemInfo[39][2],tItemInfo[39][3],tItemInfo[39][4],1);
						if nRetCode == 1 then
							Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[39][1]);
							Msg2Global("Ng­êi ch¬i"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[39][1]);
							SetTask(TASK_USE_JIN_BOX,GetTask(TASK_USE_JIN_BOX)+1);
							local nProbShow = format("%.4f",(200000/10000)*GetTask(TASK_USE_JIN_BOX)*BOX_PROB_INCREASE);
							Talk(1,"","§©y lµ lÇn thø "..GetTask(TASK_USE_JIN_BOX).." lÇn më Hép Kim Bµi Vinh Dù, tû lÖ nhËn ®­îc cùc phÈm (Hiªn Viªn chiÕn, Hiªn Viªn ®Êu, vò khÝ Hiªn Viªn, Viªm Hoµng ThiÕt Hån) t¨ng cao<color=yellow>"..nProbShow.." %<color>. Khi nhËn ®­îc cùc phÈm, sè lÇn tÝnh x¸c suÊt sÏ ®­îc tÝnh l¹i tõ ®Çu.");								
						else
							WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Më Hép Kim Bµi Vinh Dù nhËn ®­îc 1 "..tItemInfo[39][1].." thÊt b¹i, ký hiÖu:"..nRetCode)
						end						
					end	
				end					
			end
		end
	end
end
