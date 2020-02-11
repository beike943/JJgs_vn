--Ê¥»ð´«µÝ»î¶¯»ð¾æÌ¨NPC
--by vivi
--2008/06/02

Include("\\script\\online\\aoyun08\\aoyun_head.lua")
Include("\\script\\lib\\lingshi_head.lua")

function main()
	if GetGlbValue(GLB_AOYUN_TIME_STATE) ~= 0 then  --»î¶¯ÆÚ¼äÄÚ
		if GetTask(TASK_AOYUN_FINAL_AWARD) ~= 0 then --Èç¹ûÒÑ¾­»ñÈ¡¹ý×îÖÕ½±Àø£¬²»ÄñËû
			return
		end
		if GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) ~= 0 then --ËûÊÇ»ð¾æÊÖ
			local sNpcName = GetTargetNpcName();
			local nHisNum = GetTask(TASK_AOYUN_HUOJU_NUM); --»ð¾æÊÖ±àºÅ
--			if GetTrigger(TRIGER_AOYUN_TIME_ID) == 0 then   --´´½¨Ò»¸öÊ±¼ä´¥·¢Æ÷£¬ÔÚÒ»¶ÎÊ±¼äÄÚ¸øÓè¾­Ñé½±Àø			
--				if CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID) == 0 then
--					WriteLog("[Ê¥»ð´«µÝ»î¶¯]:Íæ¼Ò"..GetName().."»ð¾æÌ¨´¥·¢Æ÷CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID)Ê§°Ü£¬TIME_TABLE_IDÖµ:"..TIME_TABLE_ID.."TRIGER_AOYUN_TIME_ID:"..TRIGER_AOYUN_TIME_ID);
--					return 0;	--´´½¨Ê§°Ü
--				end;					
--			end
			--¼ÓÈë·þ×°ÅÐ¶Ï
			local nIndex = GetPlayerEquipIndex(10); --»ñÈ¡Íâ×°ÒÂ·þË÷Òý
			local nId1,nId2,nId3 = GetPlayerEquipInfo(10); --»ñÈ¡Íâ×°ÒÂ·þid
			local nBody = GetBody();
			if nId1 ~= 0 or nId2 ~= 105 or nId3 ~= (44+nBody) then
				Talk(1,"","<color=green>§µi ®uèc<color>: Tham gia ho¹t ®éng r­íc Th¸nh Háa cÇn mang <color=yellow>§ång phôc ng­êi r­íc ®uèc<color>, nhËn t¹i §¹i sø r­íc Th¸nh Háa.");
				return			
			end			
			if tHuojuName[nHisNum][1] ~= sNpcName and tHuojuName[nHisNum][2] ~= sNpcName then
				if (GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM)) > nHisNum then	
					Talk(1,"","<color=green>§µi ®uèc<color>: Th¸nh Háa ®ang chuyÓn tíi tr­íc, xin vÒ §µi ®uèc chØ ®Þnh chê phÇn th­ëng sau cïng.");
					return
				else 				
					Talk(1,"","<color=green>§µi ®uèc<color>: B¹n ph¶i tõ <color=yellow>"..tHuojuName[nHisNum][1].."<color> nhËn Th¸nh Háa, chuyÓn ®Õn <color=yellow>"..tHuojuName[nHisNum][2].."<color>, <color=yellow>tr­íc khi Th¸nh Háa §µi bèc ch¸y<color> chuyÓn ®Õn "..tHuojuName[nHisNum][2]..", nÕu kh«ng ®Õn ®óng giê sÏ kh«ng ®­îc phÇn th­ëng.");
					return
				end
			elseif tHuojuName[nHisNum][1] == sNpcName then
				if (GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM)) < nHisNum then
					Talk(1,"","<color=green>§µi ®uèc<color>: §õng véi, vÉn ch­a chuyÓn ®Õn ®©y mµ.");
					return
				elseif (GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM)) > nHisNum then	
					Talk(1,"","<color=green>§µi ®uèc<color>: Th¸nh Háa ®ang chuyÓn tíi tr­íc, xin vÒ §µi ®uèc chØ ®Þnh chê phÇn th­ëng sau cïng.");
					return
				end 
				if GetTask(TASK_AOYUN_GET_SHENGHUO) ~= 0 then
					Talk(1,"","<color=green>§µi ®uèc<color>: B¹n ®· nhËn ®­îc måi löa, mau chuyÓn ®Õn <color=yellow>"..tHuojuName[nHisNum][2].."<color> ®i! <color=yellow>Tr­íc khi Th¸nh Háa §µi bèc ch¸y<color> chuyÓn ®Õn "..tHuojuName[nHisNum][2]..", nÕu kh«ng ®Õn ®óng giê sÏ kh«ng ®­îc phÇn th­ëng.");
					return
				end
				SetTask(TASK_AOYUN_GET_SHENGHUO,GetTime());
				Talk(1,"","<color=green>§µi ®uèc<color>: B¹n tõ "..tHuojuName[nHisNum][1].." nhËn måi löa, "..tHuojuName[nHisNum][1].." vµ ®uèc trong tay th¾p lªn Th¸nh Háa. Mau chuyÓn ®Õn <color=yellow>"..tHuojuName[nHisNum][2].."<color> ®i! <color=yellow>Tr­íc khi Th¸nh Háa §µi bèc ch¸y<color> chuyÓn ®Õn "..tHuojuName[nHisNum][2]..", nÕu kh«ng ®Õn ®óng giê sÏ kh«ng ®­îc phÇn th­ëng.");
			elseif tHuojuName[nHisNum][2] == sNpcName then
				if GetTask(TASK_AOYUN_GET_SHENGHUO) == 0 then
					Talk(1,"","<color=green>§µi ®uèc<color>: B¹n ph¶i cã Th¸nh Háa tr­íc vµ <color=yellow>tr­íc khi Th¸nh Háa §µi bèc ch¸y<color> chuyÓn ®Õn ®©y.");
					return
				end
				if GetTask(TASK_AOYUN_DIAN_SHENGHUO) == 0 and GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM) > nHisNum then
--					SetTask(TASK_AOYUN_HUOJU_IDX,GetTargetNpc());  --´æÈënpcË÷Òý£¬ÖÁÉÙ¸øËû¾­Ñé°É
					Talk(1,"","<color=green>§µi ®uèc<color>: ThËt ®¸ng tiÕc, <color=yellow>tr­íc khi Th¸nh Háa §µi bèc ch¸y<color> ch­a chuyÓn Th¸nh Háa ®Õn ®©y, xin ë ®©y chê §µi ®uèc thÞnh thÕ th¾p s¸ng ®Ó nhËn phÇn th­ëng cuèi cïng.");
					return
				end
				if GetTask(TASK_AOYUN_DIAN_SHENGHUO) == 0 then  --Ã»ÓÐÁìÈ¡¹ý
					SetTask(TASK_AOYUN_DIAN_SHENGHUO,1);
--					SetGlbValue(GLB_AOYUN_HUOJUTAI_NUM,nHisNum); --ÓÃÍæ¼Ò±àºÅ±ê¼Ç£¬±íÊ¾¶ÔÓ¦µÄ¸ÃºÅ»ð¾æÌ¨ÒÑ¾­µãÈ¼
--					SetTask(TASK_AOYUN_HUOJU_IDX,GetTargetNpc());
					local nNpcNum = GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM); --µÚ¼¸ºÅÌ¨µãÈ¼
					local nNpcIdx = GetGlbValue(GLB_AOYUN_NPC_YI+nNpcNum);
					local nNpcName = GetNpcName(nNpcIdx);	
					if tHuojuName[nHisNum][2] == nNpcName then
						if nNpcNum == 0 then
							SetCurrentNpcSFX(nNpcIdx,910,2,1);--µãÈ¼	
						elseif nNpcNum == 30 then
							SetCurrentNpcSFX(nNpcIdx,913,2,1);--µãÈ¼
						elseif nNpcNum < 30 then
							SetCurrentNpcSFX(nNpcIdx,909,2,1);--µãÈ¼
						end
					end			
					--¸øÓè½±Àø
					local nLv = GetLevel();
					local nExp = floor((nLv^3)*15);
					if nLv ~= 99 then
						ModifyExp(nExp);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
					else
						lspf_AddLingShiInBottle(7,1);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh th¹ch cÊp 7, ®· bá vµo trong Tô Linh ®Ønh.");
					end
					if nHisNum ~= 30 then
						Talk(1,"","<color=green>§µi ®uèc<color>: B¹n ®· chuyÓn thµnh c«ng Th¸nh Háa, xin ë ®©y cæ vò vµ chê ®îi ®Ó nhËn phÇn th­ëng cña m×nh.");
					else
						Talk(1,"","<color=green>§µi ®uèc thÞnh thÕ<color>: B¹n th¾p thµnh c«ng §µi ®uèc thÞnh thÕ! Th¸nh Háa ch¸y bõng lªn råi!");
					end
				else	
					if GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM) < 31 then   --Í¨¹ýrelayÉèÖÃ·þÎñÆ÷±äÁ¿Îª31
						Talk(1,"","<color=green>§µi ®uèc<color>: B¹n ®· th¾p Th¸nh Háa, xin ë t¹i chç chë ®îi §µi Th¸nh Háa ThÞnh ThÕ ®­îc thÊp s¸ng ®Ó nhËn th­ëng.");
					else
						--ÁìÈ¡×îÖÕ½±Àø
						if GetTask(TASK_AOYUN_FINAL_AWARD) == 0 then
							--É¾³ý·þ×°
							if DelItemByIndex(nIndex,-1) == 1 then	
								SetTask(TASK_AOYUN_FINAL_AWARD,1);
								local nLv = GetLevel();
								local nExp = floor((nLv^3)*10);
								if nLv ~= 99 then
									ModifyExp(nExp);
									Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
								else
									local nRand = random(1,100);
									if nRand <= 80 then
										lspf_AddLingShiInBottle(6,1);
										Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh th¹ch cÊp 6, ®· bá vµo trong Tô Linh ®Ønh.");
									else
										lspf_AddLingShiInBottle(7,1);
										Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh th¹ch cÊp 7, ®· bá vµo trong Tô Linh ®Ønh.");									
									end
								end
							else
								Talk(1,"","<color=green>§µi ®uèc<color>: B¹ng ch­a trang bÞ §ång phôc ng­êi r­íc ®uèc.");
							end							
						end
					end
				end
			end
		elseif GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) == 0 then  --ËûÊÇÖúÍþÕß
			local sNpcName = GetTargetNpcName();
			local nZwNum = GetTask(TASK_AOYUN_ZHUWEI_NUM); --ÖúÍþÕß±àºÅ		
			if GetTrigger(TRIGER_AOYUN_TIME_ID) == 0 then   --´´½¨Ò»¸öÊ±¼ä´¥·¢Æ÷£¬ÔÚÒ»¶ÎÊ±¼äÄÚ¸øÓè¾­Ñé½±Àø
				local nTriIdx = CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID);
				if nTriIdx == 0 then
					WriteLog("[Ho¹t ®éng r­íc Th¸nh Háa]: Ng­êi ch¬i "..GetName().."Trigger §µi ®uèc CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID) thÊt b¹i, trÞ TIME_TABLE_ID:"..TIME_TABLE_ID.."TRIGER_AOYUN_TIME_ID:"..TRIGER_AOYUN_TIME_ID);
					return 0;	--´´½¨Ê§°Ü
				else
					ContinueTimer(nTriIdx);
				end;					
			end				
			if tHuojuName[nZwNum][1] ~= sNpcName then
				Talk(1,"","<color=green>§µi ®uèc<color>: B¹n kh«ng ph¶i cæ vò ë §µi ®uèc nµy, h·y ®Õn "..tHuojuName[nZwNum][1]);
			else
				if GetTask(TASK_AOYUN_ZHUWEI_LABA) == 0 then	
					if Zgc_pub_goods_add_chk(1,1) ~= 1 then
						return
					end
					SetTask(TASK_AOYUN_ZHUWEI_LABA,1);
					SetTask(TASK_AOYUN_HUOJU_IDX,GetTargetNpc());
					AddItem(2,1,3378,1); --ÖúÍþÀ®°È
				else
					if GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM) < 31 then   --Í¨¹ýrelayÉèÖÃ·þÎñÆ÷±äÁ¿Îª31
						Talk(1,"","<color=green>§µi ®uèc<color>: H·y ë t¹i chç reo hß cæ vò.");
					else
						--ÁìÈ¡×îÖÕ½±Àø
						if GetTask(TASK_AOYUN_FINAL_AWARD) == 0 then
							SetTask(TASK_AOYUN_FINAL_AWARD,1);
							local nLv = GetLevel();
							local nExp = floor((nLv^3)*5);
							if nLv ~= 99 then
								ModifyExp(nExp);
								Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
							else
								lspf_AddLingShiInBottle(6,1);
								Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh th¹ch cÊp 6, ®· bá vµo trong Tô Linh ®Ønh.");
							end							
						end
					end
				end					
			end
		end
	else  --ÈÕ³£»î¶¯
		if get_aoyun_state() == 0 then
			Talk(1,"","<color=green>§µi ®uèc<color>: Ho¹t ®éng vÉn ch­a b¾t ®Çu.");
		elseif get_aoyun_state() == 2 then
			Talk(1,"","<color=green>§µi ®uèc<color>: Ho¹t ®éng ®· kÕt thóc.");
		else
			--·þ×°¼ì²â
			local nIndex = GetPlayerEquipIndex(10); --»ñÈ¡Íâ×°ÒÂ·þË÷Òý
			local nId1,nId2,nId3 = GetPlayerEquipInfo(10); --»ñÈ¡Íâ×°ÒÂ·þid
			local nDate = tonumber(date("%Y%m%d"));
			local nBody = GetBody();
			if nId1 ~= 0 or nId2 ~= 105 or nId3 ~= (40+nBody) then
				Talk(1,"","<color=green>§µi ®uèc<color>: Tham gia ho¹t ®éng ®¹i héi tû vâ mõng Th¸nh Háa cÇn mang <color=yellow>§ång phôc r­íc ®uèc<color>, cã thÓ mua t¹i t¹p hãa.");
				return
			else
				if GetTask(TASK_AOYUN_HUOJU_DATE) >= nDate then
					Talk(1,"","<color=green>§µi ®uèc<color>: H«m nay b¹n ®· ch¹y ®ãn ho¹t ®éng ®¹i héi tû vâ mõng Th¸nh Háa, mçi ngµy chØ cã thÓ ch¹y 1 lÇn.");
					return
				else
					if GetTask(TASK_AOYUN_TEMP_NUM) >= 32 or GetTask(TASK_AOYUN_TEMP_NUM) == 0 then
						SetTask(TASK_AOYUN_TEMP_NUM,1);
					end
					local sNpcName = GetTargetNpcName();
					local nHisNum = GetTask(TASK_AOYUN_TEMP_NUM);	
					if tHuojuName[nHisNum][1] ~= sNpcName then
						Talk(1,"","<color=green>§µi ®uèc<color>: B¹n ®ang th¾p kh«ng ®óng §µi ®uèc, cÇn th¾p lµ "..tHuojuName[nHisNum][1]);
						return
					else
						if nHisNum < 32 then
							SetTask(TASK_AOYUN_TEMP_NUM,nHisNum+1);
							if GetTask(TASK_AOYUN_TEMP_NUM) ~= 32 then	
								Talk(1,"","<color=green>§µi ®uèc<color>: B¹n th¾p §µi ®uèc thµnh c«ng, ®Õn "..tHuojuName[nHisNum+1][1].."!");
							else
								if DelItemByIndex(nIndex,-1) == 1 then
									SetTask(TASK_AOYUN_HUOJU_DATE,nDate);
									local nLv = GetLevel();
									local nExp = floor((nLv^3)*5);
									if nLv ~= 99 then
										ModifyExp(nExp);
										Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
									else
										local nRand = random(1,100);
										if nRand <= 85 then
											lspf_AddLingShiInBottle(5,1);
											Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh th¹ch cÊp 5, ®· bá vµo trong Tô Linh §Ønh.");
										elseif nRand <= 95 then
											lspf_AddLingShiInBottle(6,1);
											Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh th¹ch cÊp 6, ®· bá vµo trong Tô Linh ®Ønh.");
										else
											lspf_AddLingShiInBottle(7,1);
											Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh th¹ch cÊp 7, ®· bá vµo trong Tô Linh ®Ønh.");									
										end
									end
								else
									Talk(1,"","<color=green>§µi ®uèc<color>: B¹n ch­a trang bÞ <color=yellow>§ång phôc r­íc ®uèc<color>.");
								end
							end
						end
					end 	 
				end
			end
		end
	end	
end

function OnTimer()
	if GetGlbValue(GLB_AOYUN_TIME_STATE) ~= 0 then
		local nLv = GetLevel();
		if GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) ~= 0 then  --»ð¾æÊÖ½±Àø
			--¼ÓÈë¾àÀëÅÐ¶Ï
			local nNpcIdx = GetTask(TASK_AOYUN_HUOJU_IDX);
			local nNpcId,nNpcX,nNpcY = GetNpcWorldPos(nNpcIdx);
			local nMapId,nPlayerX,nPlayerY = GetWorldPos();	
			local nDistance = floor(sqrt((nPlayerX-nNpcX)^2+(nPlayerY-nNpcY)^2));
			if nDistance < 40 then
				if nLv ~= 99 then
					local nExp = floor((nLv^2)*10);
					ModifyExp(nExp);
				else
					local nRand = random(1,100);
					if nRand <= 20 then
						aoyun_baoshi_prob();
					end
				end
			end
		elseif GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) == 0 then  --ÖúÍþÕß½±Àø
			local nNpcIdx = GetTask(TASK_AOYUN_HUOJU_IDX);
			local nNpcId,nNpcX,nNpcY = GetNpcWorldPos(nNpcIdx);
			local nMapId,nPlayerX,nPlayerY = GetWorldPos();	
			local nDistance = floor(sqrt((nPlayerX-nNpcX)^2+(nPlayerY-nNpcY)^2));
			if nDistance < 40 then			
				if nLv ~= 99 then
					local nExp = floor((nLv^2)*6);
					ModifyExp(nExp);
				else
					local nRand = random(1,100);
					if nRand <= 20 then
						aoyun_baoshi_prob();
					end
				end	
			end		
		end
	else
		if GetTask(547) ~= 0 and GetTrigger(TRIGER_AOYUN_TIME_ID) ~= 0 then
			RemoveTrigger(GetTrigger(TRIGER_AOYUN_TIME_ID));  --É¾³ý´¥·¢Æ÷
		end
	end 
end