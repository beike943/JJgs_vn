--¶şÊ®ÖÜÄêÇì±¦Ïä
--by vivi
--2008/11/05

Include("\\script\\online\\qixi08\\function.lua");

g_szBoxInfo = "<color=green>B¶o r­¬ng kû niÖm<color>: ";

tBoxGiveItem = {
	--Ë÷ÒıÎªIB_VERSION£¬0ÎªÊÕ·ÑÇø£¬1ÎªÃâ·ÑÇø
	[0] = {{"NguyÖt Hoa ",2,1,2002,1},{"NguyÖt Hoa ",2,1,2002,5},{"N÷ Oa Tinh Th¹ch",2,1,504,1}},    
	[1] = {{"M¶nh Thiªn th¹ch",2,2,7,3},{"M¶nh Thiªn th¹ch",2,2,7,15},{"Thiªn Th¹ch Tinh Th¹ch",2,1,1009,10}}
};

function OnUse()
	local nDate = tonumber(date("%Y%m%d"));
	local nYear3,nMonth3,nDay3 = QX08_GetDate(g_nAwardEndDate);
	local strtab = {
				"Ta dïng ch×a khãa ®ång kû niÖm më r­¬ng/#use_key_open(1)",
				"Ta dïng ch×a khãa b¹c kû niÖm më r­¬ng/#use_key_open(2)",
				"Ta dïng ch×a khãa vµng kû niÖm më r­¬ng/#use_key_open(3)",
				"Ta muèn dïng 6 ch×a khãa vµng kû niÖm më r­¬ng ®Ó cã Thiªn Qu¸i Th¹ch/use_manykey_open",
				"Ta muèn dïng 6 ch×a khãa vµng më r­¬ng ®Ó cã ngùa di chuyÓn 120%/use_manykey_6",
				"Ta muèn dïng 10 ch×a khãa vµng më r­¬ng ®Ó cã Huy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy/use_manykey_10",
				"Më r­¬ng cã thÓ nhËn ®­îc nh÷ng vËt phÈm nµo/know_20box_award",
				"Sau nµy h½n më/nothing"
				};
	if nDate <= g_nAwardEndDate then
		tinsert(strtab,1,"Ta kh«ng dïng bÊt cø vËt phÈm nµo ®Ó më r­¬ng (chØ nhËn ®­îc phÇn th­ëng kinh nghiÖm)/ask_give_exp");
		Say(g_szBoxInfo.."Tr­íc "..nYear3.."niªn"..nMonth3.."NguyÖt"..nDay3.." më r­¬ng, tû lÖ cã ®­îc cùc phÈm cßn tïy thuéc vµo ng­¬i dïng vËt g× ®Ó më r­¬ng.",getn(strtab),strtab);
	else
		Say(g_szBoxInfo.."Thêi gian ho¹t ®éng ®· hÕt, hÖ thèng sÏ kh«ng thu l¹i r­¬ng. NÕu b¹n kh«ng cã ch×a khãa, ®Ó kh«ng mÊt thêi gian cña m×nh, cã thÓ t×m bÊt kú npc mua b¸n nµo ®ã ®Ó b¸n.",getn(strtab),strtab);
	end
end

function use_key_open(nType)
	local strtab = {
	      "Ngùa di chuyÓn 120%, ®é bÒn 200 ®iÓm (D­¬ng M«n ®­îc chiÕn m· di chuyÓn 35%, ®é bÒn 1000 ®iÓm)/#ask_open_box("..nType..",1)",
	      "MËt tŞch cao cÊp S­ M«n (ng­êi ch­a gia nhËp l­u ph¸i sÏ nhËn ®­îc 1 quyÓn mËt tŞch ngÉu nhiªn)/#ask_open_box("..nType..",2)",
	      "100 triÖu kinh nghiÖm (l­u ı, khi kinh nghiÖm cña b¹n ®¹t ®Õn 2 tû, th× phÇn d­ ra sÏ bŞ mÊt, mçi tuÈn chØ cã thÓ ®æi thµnh c«ng 1 lÇn)/#ask_open_box("..nType..",3)",
	      "Thiªn Qu¸i Th¹ch (dïng th¨ng cÊp trang bŞ Viªm §Õ, trang bŞ t­íng qu©n, trang bŞ nguyªn so¸i, vµ trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh trang bŞ Thiªn Qu¸i)/#ask_open_box("..nType..",4)",
	      "Ta chän nhÇm råi./OnUse",
	      "Sau nµy h½n më/nothing"
				};
	if IB_VERSION == 1 then
		tinsert(strtab,5,"§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch (c­êng hãa vËt phÈm, ®é c­êng hãa ®Õn cÊp 7 th× kh«ng thÓ c­êng hãa n÷a)/#ask_open_box("..nType..",5)");
	else
		tinsert(strtab,5,"Thiªn Th¹ch Linh Th¹ch (c­êng hãa trang bŞ trùc tiÕp ®Õn cÊp 7)/#ask_open_box("..nType..",5)");
	end
	tinsert(strtab,6," Huy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy/#ask_open_box("..nType..",6)")
	Say(g_szBoxInfo.."B¹n sö dông "..tItemName[nType+6][1].."Më r­¬ng, h·y chän phÇn th­ëng mµ b¹n muèn cã, nÕu lÇn nµy kh«ng ®­îc th× b¹n cã thÓ nhËn ®­îc "..tBoxGiveItem[IB_VERSION][nType][1]..tBoxGiveItem[IB_VERSION][nType][5]..".",getn(strtab),strtab);
end

function ask_open_box(nType,nTbIdx)
	local tGiveNameIB = {"Ngùa di chuyÓn 120%, ®é bÒn 200 ®iÓm (D­¬ng M«n ®­îc chiÕn m· di chuyÓn 35%, ®é bÒn 1000 ®iÓm)","MËt tŞch cao cÊp S­ M«n (ng­êi ch­a gia nhËp l­u ph¸i sÏ nhËn ®­îc 1 quyÓn mËt tŞch ngÉu nhiªn)","100 triÖu kinh nghiÖm (l­u ı, khi kinh nghiÖm cña b¹n ®¹t ®Õn 2 tû, th× phÇn d­ ra sÏ bŞ mÊt, mçi tuÈn chØ cã thÓ ®æi thµnh c«ng 1 lÇn)","Thiªn Qu¸i Th¹ch (dïng th¨ng cÊp trang bŞ Viªm §Õ, trang bŞ t­íng qu©n, trang bŞ nguyªn so¸i, vµ trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh trang bŞ Thiªn Qu¸i)","§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch (c­êng hãa vËt phÈm, ®é c­êng hãa ®Õn cÊp 7 th× kh«ng thÓ c­êng hãa n÷a)"," Huy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy"};
	local tGiveName = {"Ngùa di chuyÓn 120%, ®é bÒn 200 ®iÓm (D­¬ng M«n ®­îc chiÕn m· di chuyÓn 35%, ®é bÒn 1000 ®iÓm)","MËt tŞch cao cÊp S­ M«n (ng­êi ch­a gia nhËp l­u ph¸i sÏ nhËn ®­îc 1 quyÓn mËt tŞch ngÉu nhiªn)","100 triÖu kinh nghiÖm (l­u ı, khi kinh nghiÖm cña b¹n ®¹t ®Õn 2 tû, th× phÇn d­ ra sÏ bŞ mÊt, mçi tuÈn chØ cã thÓ ®æi thµnh c«ng 1 lÇn)","Thiªn Qu¸i Th¹ch (dïng th¨ng cÊp trang bŞ Viªm §Õ, trang bŞ t­íng qu©n, trang bŞ nguyªn so¸i, vµ trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh trang bŞ Thiªn Qu¸i)","Thiªn Th¹ch Linh Th¹ch (c­êng hãa trang bŞ trùc tiÕp ®Õn cÊp 7)"," Huy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy"};
	local nWeek = GetWeekSequence(1,0);
	if GetTask(TSK_AOYUN_AWARD_WEEK) < nWeek then
		SetTask(TSK_AOYUN_AWARD_WEEK,nWeek);
		SetTask(TSK_AOYUN_YI_EXP,0);
		SetTask(TSK_AOYUN_EXP_NUM,0);
	end
	if nTbIdx == 3 and GetTask(TSK_AOYUN_YI_EXP) ~= 0 then
		Talk(1,"","100 triÖu kinh nghiÖm mçi tuÇn chØ cã thÓ ®æi thµnh c«ng 1 lÇn, tuÇn nµy b¹n ®· ®æi thµnh c«ng 1 lÇn, tuÇn sau h½n ®Õn.");
		return 0;
	end
	if nTbIdx == 1 then
		local nRoute = GetPlayerRoute();
		if nRoute == 16 or nRoute == 17 or nRoute == 18 then 
			Say(g_szBoxInfo.."B¹n x¸c nhËn dïng "..tItemName[nType+6][1].." më r­¬ng ®Ó cã "..tGiveNameIB[nTbIdx].." chø? H·y chän mµu ngùa.",
				4,
				"ChiÕn M· Nguyªn So¸i cao cÊp (tr¾ng)/#ask_choose_horse("..nType..","..nTbIdx..",3)",
				"ChiÕn M· Nguyªn So¸i cao cÊp (®en)/#ask_choose_horse("..nType..","..nTbIdx..",4)",
				"Ta chän nhÇm råi./#use_key_open("..nType..")",
				"Sau nµy h½n më/nothing")
		else
			Say(g_szBoxInfo.."B¹n x¸c nhËn dïng "..tItemName[nType+6][1].." më r­¬ng ®Ó cã "..tGiveNameIB[nTbIdx].." chø? H·y chän mµu ngùa.",
				4,
				"B¹ch NghÜa (tr¾ng)/#ask_choose_horse("..nType..","..nTbIdx..",1)",
				"HiÖp Dùc (®en)/#ask_choose_horse("..nType..","..nTbIdx..",2)",
				"Ta chän nhÇm råi./#use_key_open("..nType..")",
				"Sau nµy h½n më/nothing")		
		end
	else
		if IB_VERSION == 1 then
			Say(g_szBoxInfo.."B¹n x¸c nhËn dïng "..tItemName[nType+6][1].." më r­¬ng ®Ó cã "..tGiveNameIB[nTbIdx].."?",
				3,
				"§óng, ta muèn më /#confirm_open_box("..nType..","..nTbIdx..",0)",
				"Ta chän nhÇm råi./#use_key_open("..nType..")",
				"Sau nµy h½n më/nothing")	
		else
			Say(g_szBoxInfo.."B¹n x¸c nhËn dïng "..tItemName[nType+6][1].." më r­¬ng ®Ó cã "..tGiveName[nTbIdx].."?",
				3,
				"§óng, ta muèn më /#confirm_open_box("..nType..","..nTbIdx..",0)",
				"Ta chän nhÇm råi./#use_key_open("..nType..")",
				"Sau nµy h½n më/nothing")			
		end		
	end
end

function ask_choose_horse(nType,nTbIdx,nChoose)
	Say(g_szBoxInfo.."B¹n x¸c nhËn dïng "..tItemName[nType+6][1].." më r­¬ng ®Ó cã "..tItemName[nChoose][1].."?",
		3,
		"§­îc/#confirm_open_box("..nType..","..nTbIdx..","..nChoose..")",
		"Ta chän nhÇm råi./#ask_open_box("..nType..","..nTbIdx..")",
		"Sau nµy h½n më/nothing")
end

function confirm_open_box(nType,nTbIdx,nChoose)
	if GetItemCount(tItemName[nType+6][2],tItemName[nType+6][3],tItemName[nType+6][4]) < 1 then
		Talk(1,"",g_szBoxInfo.."B¹n dïng "..tItemName[nType+6][1].." më R­¬ng kû niÖm 20 n¨m, nh­ng trªn ng­êi b¹n kh«ng cã "..tItemName[nType+6][1].." .");
		return 0
	end
	if gf_Judge_Room_Weight(2,100,g_szBoxInfo) ~= 1 then
		return 0;
	end 
	if DelItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],1) == 1 and DelItem(tItemName[nType+6][2],tItemName[nType+6][3],tItemName[nType+6][4],1) == 1 then
		local tb = {};
		local nAddFlag = 0;
		local nRoute = GetPlayerRoute();
		
		local nRand = random(1,10000);
		if IB_VERSION == 1 then
			tb = tAwardGailvIB;
		else
			tb = tAwardGailv;
		end
		if nRand <= tb[nType][nTbIdx] then
			if nTbIdx == 1 then
				nAddFlag = AddItem(tItemName[nChoose][2],tItemName[nChoose][3],tItemName[nChoose][4],1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tItemName[nChoose][1]);
				if nAddFlag == 1 then
					Msg2Global("§¹i hiÖp"..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[nChoose][1]);
					WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[nChoose][1].." thµnh c«ng ");
				else
					WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[nChoose][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
				end				
			elseif nTbIdx == 2 then
				local nRandMiji = random(1,getn(tGaojiMiji[nRoute]));
				nAddFlag = AddItem(tGaojiMiji[nRoute][nRandMiji][2],tGaojiMiji[nRoute][nRandMiji][3],tGaojiMiji[nRoute][nRandMiji][4],1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tGaojiMiji[nRoute][nRandMiji][1]);
				if nAddFlag == 1 then
					Msg2Global("§¹i hiÖp"..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tGaojiMiji[nRoute][nRandMiji][1]);
					WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tGaojiMiji[nRoute][nRandMiji][1].." thµnh c«ng ");
				else
					WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tGaojiMiji[nRoute][nRandMiji][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
				end				
			elseif nTbIdx == 3 then
				SetTask(TSK_AOYUN_YI_EXP,1);
				ModifyExp(100000000);
				Msg2Player("Chóc mõng b¹n ®· nhËn ®­îc 100 triÖu kinh nghiÖm");
				Msg2Global("§¹i hiÖp"..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].." nhËn ®­îc 100 triÖu kinh nghiÖm.");
				WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Dïng thÎ"..tItemName[nType+6][1].."Më r­¬ng nhËn ®­îc 100 triÖu kinh nghiÖm.");
			elseif nTbIdx == 4 then
				nAddFlag = AddItem(tItemName[5][2],tItemName[5][3],tItemName[5][4],1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tItemName[5][1]);
				if nAddFlag == 1 then
					Msg2Global("§¹i hiÖp"..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[5][1]);
					WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[5][1].." thµnh c«ng ");
				else
					WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[5][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
				end					
			elseif nTbIdx == 5 then
				if IB_VERSION == 1 then
					nAddFlag = AddItem(tItemName[12][2],tItemName[12][3],tItemName[12][4],1);
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tItemName[12][1]);	
					if nAddFlag == 1 then
						Msg2Global("§¹i hiÖp"..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[12][1]);
						WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[12][1].." thµnh c«ng ");
					else
						WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[12][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
					end															
				else
					nAddFlag = AddItem(tItemName[13][2],tItemName[13][3],tItemName[13][4],1);
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tItemName[13][1]);	
					if nAddFlag == 1 then
						Msg2Global("§¹i hiÖp"..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[13][1]);
						WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[13][1].." thµnh c«ng ");
					else
						WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tItemName[13][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
					end										
				end
			elseif nTbIdx == 6 then
				if AddItem(tItemName[16][2],tItemName[16][3],tItemName[16][4],1,1,-1,-1,-1,-1,-1,-1) == 1 then
					nAddFlag = 1;
				end
				if AddItem(tItemName[17][2],tItemName[17][3],tItemName[17][4],1,1,-1,-1,-1,-1,-1,-1) == 1 then
					nAddFlag = 2;
				end
				if nAddFlag == 2 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tItemName[16][1].." vµ"..tItemName[17][1]);
					Msg2Global("§¹i hiÖp"..GetName().."Sö dông "..tItemName[nType+6][1].."B¾t ®Çu"..tItemName[6][1].."NhËn ®­îc"..tItemName[16][1].." vµ"..tItemName[17][1]);
					WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."B¾t ®Çu"..tItemName[6][1].."NhËn ®­îc"..tItemName[16][1].." vµ"..tItemName[17][1]);
				else
					WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."B¾t ®Çu"..tItemName[6][1].."NhËn ®­îc"..tItemName[16][1].." vµ"..tItemName[17][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
				end				
			end
		else
			AddItem(tBoxGiveItem[IB_VERSION][nType][2],tBoxGiveItem[IB_VERSION][nType][3],tBoxGiveItem[IB_VERSION][nType][4],tBoxGiveItem[IB_VERSION][nType][5]);
			Msg2Player("B¹n nhËn ®­îc "..tBoxGiveItem[IB_VERSION][nType][1]..tBoxGiveItem[IB_VERSION][nType][5]..".");
			WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..tItemName[nType+6][1].."Më"..tItemName[6][1].."NhËn ®­îc"..tBoxGiveItem[IB_VERSION][nType][1]..tBoxGiveItem[IB_VERSION][nType][5]..".");
		end
	end
end

function ask_give_exp()
	local nExpNum = GetTask(TSK_AOYUN_BOX_NUM);
	if nExpNum >= g_nBoxNum then
		Talk(1,"",g_szBoxInfo.."Mçi ng­êi nhiÒu nhÊt cã thÓ nhËn phÇn th­ëng kinh nghiÖm "..g_nBoxNum.." lÇn, hiÖn giê b¹n ®· nhËn "..g_nBoxNum.." lÇn .");
		return 0;
	end
	local nLv = GetLevel();
	local nExp = nLv^3;
	Say(g_szBoxInfo.."B¹n kh«ng dïng ch×a khãa më r­¬ng, nªn chØ nhËn ®­îc <color=yellow>"..nExp.."<color> kinh nghiÖm, b¹n x¸c nhËn muèn më r­¬ng chø? <color=red>PhÇn th­ëng kinh nghiÖm nµy, mçi ng­êi nhiÒu nhÊt cã thÓ nhËn "..g_nBoxNum.." lÇn, hiÖn giê b¹n ®· nhËn "..nExpNum.." lÇn.<color>",
			3,
			"§­îc, ta muèn ®æi kinh nghiÖm/give_exp_num",
			"Kh«ng, ta nhÇm!/OnUse",
			"Sau nµy h½n më/nothing");
end

function give_exp_num()
	local nExpNum = GetTask(TSK_AOYUN_BOX_NUM);
	if nExpNum >= g_nBoxNum then
		Talk(1,"",g_szBoxInfo.."Mçi ng­êi nhiÒu nhÊt cã thÓ nhËn phÇn th­ëng kinh nghiÖm "..g_nBoxNum.." lÇn, hiÖn giê b¹n ®· nhËn "..g_nBoxNum.." lÇn .");
		return 0;
	end
	local nNum = GetItemCount(tItemName[6][2],tItemName[6][3],tItemName[6][4]);
	local nLimitNum = g_nBoxNum-GetTask(TSK_AOYUN_BOX_NUM);
	AskClientForNumber("confirm_give_exp",1,min(nNum,nLimitNum),"B¹n muèn më mÊy r­¬ng?");
end

function confirm_give_exp(nNum)
	local nExpNum = GetTask(TSK_AOYUN_BOX_NUM);
	if nExpNum >= g_nBoxNum then
		Talk(1,"",g_szBoxInfo.."Mçi ng­êi nhiÒu nhÊt cã thÓ nhËn phÇn th­ëng kinh nghiÖm "..g_nBoxNum.." lÇn, hiÖn giê b¹n ®· nhËn "..g_nBoxNum.." lÇn .");
		return 0;
	end
	local nLv = GetLevel();
	local nExp = (nLv^3)*nNum;	
	if DelItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],nNum) == 1 then
		SetTask(TSK_AOYUN_BOX_NUM,nExpNum+nNum);
		ModifyExp(nExp);
		Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		Talk(1,"","§©y lµ lÇn thø <color=yellow>"..GetTask(TSK_AOYUN_BOX_NUM).."<color> b¹n nhËn phÇn th­ëng kinh nghiÖm, mçi ng­êi cã thÓ nhËn nhiÒu nhÊt "..g_nBoxNum.." lÇn.");
	end
end

function use_manykey_open()
	Say(g_szBoxInfo.."B¹n chän dïng 6 ch×a khãa vµng ®Ó më r­¬ng, b¹n sÏ nhËn ®­îc 1 <color=yellow>Thiªn Qu¸i Th¹ch<color>, b¹n ch¾c ch¾n muèn më chø?",
			3,
			"§­îc/confirm_give_stone",
			"Ta chän nhÇm råi./OnUse",
			"Sau nµy h½n më/nothing")
end

function confirm_give_stone()
	if GetItemCount(tItemName[9][2],tItemName[9][3],tItemName[9][4]) < 6 then
		Talk(1,"",g_szBoxInfo.."B¹n chän dïng 25 "..tItemName[9][1].." më R­¬ng kû niÖm 20 n¨m, nh­ng trªn ng­êi b¹n kh«ng cã 6 "..tItemName[9][1].." .");
		return 0
	end
	if gf_Judge_Room_Weight(1,100,g_szBoxInfo) ~= 1 then
		return 0;
	end  
	if DelItem(tItemName[9][2],tItemName[9][3],tItemName[9][4],6) == 1 and DelItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],1) == 1 then
		local nAddFlag = AddItem(tItemName[5][2],tItemName[5][3],tItemName[5][4],1);
		if nAddFlag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 "..tItemName[5][1]);
			Msg2Global("§¹i hiÖp"..GetName().." dïng 6 "..tItemName[9][1].."B¾t ®Çu"..tItemName[6][1].." ®­îc 1 "..tItemName[5][1]);
			WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().." dïng 6 "..tItemName[9][1].."B¾t ®Çu"..tItemName[6][1].." ®­îc 1 "..tItemName[5][1]);
		else
			WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().." dïng 6 "..tItemName[9][1].."B¾t ®Çu"..tItemName[6][1].." ®­îc 1 "..tItemName[5][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
		end
	end
end

function know_20box_award()
	if IB_VERSION == 1 then
		Talk(2,"OnUse",g_szBoxInfo.."R­¬ng kû niÖm 20 n¨m cã thÓ më ®­îc: \nNgùa di chuyÓn 120%, ®é bÒn 200 ®iÓm (D­¬ng M«n lµ chiÕn m· di chuyÓn 35%, ®é bÒn 1000 ®iÓm)\nMËt tŞch cao cÊp S­ M«n (ng­êi ch¬i ch­a gia nhËp l­u ph¸i sÏ nhËn ®­îc quyÓn mËt tŞch l­u ph¸i ngÉu nhiªn)\n100 triÖu kinh nghiÖm (l­u ı, khi kinh nghiÖm cña b¹n ®¹t ®Õn 2 tû, th× phÇn d­ ra sÏ bŞ mÊt, mçi tuÇn chØ cã thÓ ®æi thµnh c«ng 1 lÇn)\n§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch (c­êng hãa vËt phÈm, khi ®é c­êng hãa lµ 7 th× kh«ng thÓ c­êng hãa n÷a)\nThiªn Qu¸i Th¹ch(dïng th¨ng cÊp trang bŞ Viªm §Õ, trang bŞ t­íng qu©n, trang bŞ nguyªn so¸i vµ ®æi trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh trang bŞ Thiªn Qu¸i)",g_szBoxInfo.."\nM¶nh Thiªn Th¹ch (trang bŞ c­êng hãa cÊp 1-4 tiªu hao vËt phÈm)\nThiªn Th¹ch Tinh Th¹ch (trang bŞ c­êng hãa cÊp 8-15 tiªu hao vËt phÈm)\nKinh nghiÖm lËp ph­¬ng ®¼ng cÊp\nHuy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy\n    PhÇn th­ëng ë trªn, sÏ c¨n cø vµo ch×a khãa dïng ®Ó më b¶o r­¬ng mµ cã tû lÖ kh¸c nhau, tÊt c¶ nh÷ng vËt phÈm ë trªn, trõ <color=yellow>kinh nghiÖm, Thiªn Qu¸i Th¹ch, Huy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy<color>, ®Òu cã thÓ giao dŞch ®­îc, chóc b¹n may m¾n!");
	else
		Talk(2,"OnUse",g_szBoxInfo.."R­¬ng kû niÖm 20 n¨m cã thÓ më ra ®­îc: \nNgùa di chuyÓn 120%, ®é bÒn 200 ®iÓm (D­¬ng M«n lµ chiÕn m· di chuyÓn 35%, ®é bÒn 1000 ®iÓm)\nMËt tŞch cao cÊp S­ M«n (ng­êi ch­a gia nhËp l­u ph¸i sÏ nhËn ®­îc 1 quyÓn mËt tŞch l­u ph¸i ngÉu nhiªn)\n100 triÖu kinh nghiÖm (l­u ı, khi kinh nghiÖm cña b¹n ®¹t ®Õn 2 tû, th× phÇn d­ ra sÏ bŞ mÊt, mçi tuÇn chØ cã thÓ ®æi thµnh c«ng 1 lÇn)\nThiªn Th¹ch Linh Th¹ch (c­êng hãa trang bŞ trùc tiÕp ®Õn cÊp )\nThiªn Qu¸i Th¹ch(dïng th¨ng cÊp trang bŞ Viªm §Õ, trang bŞ t­íng qu©n, trang bŞ nguyªn so¸i vµ ®æi trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh trang bŞ Thiªn Qu¸i)\nNguyÖt Hoa hoÆc N÷ Oa Tinh Th¹ch",g_szBoxInfo.."\nKinh nghiÖm lËp ph­¬ng ®¼ng cÊp\nHuy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy\n    PhÇn th­ëng ë trªn, sÏ c¨n cø vµo ch×a khãa dïng ®Ó më b¶o r­¬ng mµ cã tû lÖ kh¸c nhau, tÊt c¶ nh÷ng vËt phÈm ë trªn, trõ <color=yellow>kinh nghiÖm, Thiªn Qu¸i Th¹ch, Huy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy<color>, ®Òu cã thÓ giao dŞch ®­îc, chóc b¹n may m¾n!");
	end
end

function use_manykey_6()
	Say(g_szBoxInfo.."B¹n chän dïng 6 ch×a khãa vµng më r­¬ng, sÏ nhËn ®­îc <color=yellow>Ngùa di chuyÓn 120%, ®é bÒn 200 ®iÓm (D­¬ng M«n ®­îc chiÕn m· di chuyÓn 35%, ®é bÒn 1000 ®iÓm)<color>, b¹n ch¾c ch¾n muèn më chø?",
			3,
			"§­îc/choose_give_horse",
			"Ta chän nhÇm råi./OnUse",
			"Sau nµy h½n më/nothing")		
end

function choose_give_horse()
	local nRoute = GetPlayerRoute();
	if nRoute == 16 or nRoute == 17 or nRoute == 18 then 
		Say(g_szBoxInfo.."B¹n x¸c nhËn dïng 6 "..tItemName[9][1].." më r­¬ng ®Ó ®­îc ChiÕn M· Nguyªn So¸i cao cÊp chø? H·y chän mµu cho ngùa.",
			4,
			"ChiÕn M· Nguyªn So¸i cao cÊp (tr¾ng)/#ask_give_horse(3)",
			"ChiÕn M· Nguyªn So¸i cao cÊp (®en)/#ask_give_horse(4)",
			"Ta chän nhÇm råi./OnUse",
			"Sau nµy h½n më/nothing")
	else
		Say(g_szBoxInfo.."B¹n x¸c nhËn dïng 6 "..tItemName[9][1].." më r­¬ng ®Ó ®­îc ngùa di chuyÓn 120% chø? H·y chän mµu cho ngùa.",
			4,
			"B¹ch NghÜa (tr¾ng)/#ask_give_horse(1)",
			"HiÖp Dùc (®en)/#ask_give_horse(2)",
			"Ta chän nhÇm råi./OnUse",
			"Sau nµy h½n më/nothing")		
	end	
end

function ask_give_horse(nType)
	Say(g_szBoxInfo.."B¹n x¸c nhËn dïng 6 "..tItemName[9][1].." më r­¬ng ®Ó cã "..tItemName[nType][1].."?",
			3,
			"§­îc/#confirm_give_horse("..nType..")",
			"Ta chän nhÇm råi./choose_give_horse",
			"Sau nµy h½n më/nothing")
end

function confirm_give_horse(nType)
	if GetItemCount(tItemName[9][2],tItemName[9][3],tItemName[9][4]) < 6 then
		Talk(1,"",g_szBoxInfo.."B¹n chän dïng 6 "..tItemName[9][1].." më R­¬ng kû niÖm 20 n¨m, nh­ng trªn ng­êi b¹n kh«ng cã 6 "..tItemName[9][1].." .");
		return 0
	end
	if gf_Judge_Room_Weight(1,100,g_szBoxInfo) ~= 1 then
		return 0;
	end
	if DelItem(tItemName[9][2],tItemName[9][3],tItemName[9][4],6) == 1 and DelItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],1) == 1 then
		local nAddFlag = AddItem(tItemName[nType][2],tItemName[nType][3],tItemName[nType][4],1,1,-1,-1,-1,-1,-1,-1);
		if nAddFlag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1  "..tItemName[nType][1]);
			Msg2Global("§¹i hiÖp"..GetName().." dïng 6 "..tItemName[9][1].."B¾t ®Çu"..tItemName[6][1].."NhËn ®­îc 1 "..tItemName[nType][1]);
			WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().." dïng 6 "..tItemName[9][1].."B¾t ®Çu"..tItemName[6][1].."NhËn ®­îc 1 "..tItemName[nType][1]);
		else
			WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().." dïng 6 "..tItemName[9][1].."B¾t ®Çu"..tItemName[6][1].."NhËn ®­îc 1 "..tItemName[nType][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
		end
	end	
end

function use_manykey_10()
	Say(g_szBoxInfo.."B¹n ®· chän dïng 10 Ch×a khãa vµng kû niÖm ®Ó më b¶o r­¬ng vµ sÏ nhËn ®­îc <color=yellow>Huy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy<color>, muèn më kh«ng?",
			3,
			"§­îc/confirm_give_ring",
			"Ta chän nhÇm råi./OnUse",
			"Sau nµy h½n më/nothing")	
end

function confirm_give_ring()
	if GetItemCount(tItemName[9][2],tItemName[9][3],tItemName[9][4]) < 10 then
		Talk(1,"",g_szBoxInfo.."B¹n chän dïng 10 "..tItemName[9][1].." më R­¬ng kû niÖm 20 n¨m, nh­ng kh«ng mang ®ñ 10 "..tItemName[9][1].." .");
		return 0
	end		
	if gf_Judge_Room_Weight(2,200,g_szBoxInfo) ~= 1 then
		return 0;
	end	
	if DelItem(tItemName[9][2],tItemName[9][3],tItemName[9][4],10) == 1 and DelItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],1) == 1 then	
		local nAddFlag = 0;
		if AddItem(tItemName[16][2],tItemName[16][3],tItemName[16][4],1,1,-1,-1,-1,-1,-1,-1) == 1 then
			nAddFlag = 1;
		end
		if AddItem(tItemName[17][2],tItemName[17][3],tItemName[17][4],1,1,-1,-1,-1,-1,-1,-1) == 1 then
			nAddFlag = 2;
		end
		if nAddFlag == 2 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tItemName[16][1].." vµ"..tItemName[17][1]);
			Msg2Global("§¹i hiÖp"..GetName().."Dïng 10 "..tItemName[9][1].."B¾t ®Çu"..tItemName[6][1].."NhËn ®­îc"..tItemName[16][1].." vµ"..tItemName[17][1]);
			WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Dïng 10 "..tItemName[9][1].."B¾t ®Çu"..tItemName[6][1].."NhËn ®­îc"..tItemName[16][1].." vµ"..tItemName[17][1]);
		else
			WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Dïng 10 "..tItemName[9][1].."B¾t ®Çu"..tItemName[6][1].."NhËn ®­îc"..tItemName[16][1].." vµ"..tItemName[17][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
		end							
	end
end