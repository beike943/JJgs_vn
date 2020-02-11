--File name:emissary_npc.lua 
--Describe:Èı½ÚÁ¬¹ı£¬ÖÜÄêÇìÊ¹
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
Include("\\script\\class\\ktabfile.lua")

tabLVEXP = new(KTabFile, "\\settings\\uplevel.txt");

function main()
	local nDate = tonumber(date("%y%m%d"));
	if nDate < 080911 then
		Talk(1,"","<color=green>Niªn sø<color>: Ho¹t ®éng sÏ b¾t ®Çu vµo 11-9, vŞ  "..tSexName[GetSex()].."®Õn lóc ®ã nhí ®Õn ®©y.");
		return 0;
	end;
	if GetLevel() < 30 then
		Talk(1,"","§¼ng cÊp cña ng­¬i qu¸ thÊp, kh«ng thÓ tham gia ho¹t ®éng nµy, luyÖn ®Õn cÊp <color=yellow>30 <color> quay l¹i gÆp ta nhĞ!");
		return 0;
	end;
	local selTab = {
				"NhËn nguyªn liÖu lµm b¸nh/want_mooncake_resource",
				"NhËn ®­îc B¸nh Trung Thu Tinh Mü/want_mooncake",
				"B¸nh Trung Thu, lÊy ®¹o cô ®æi phÇn th­ëng /want_reward",
--				"ÁìÈ¡Á½ÖÜÄêÀñÆ·/want_anniversary",
				"Ta muèn nhËn b¸nh trung thu/require_mooncake",
				"Mua vËt phÈm lÔ mõng/buy_things",
				"NhËn h­íng dÉn ho¹t ®éng/get_intro_book",
				"Xem néi dung ho¹t ®éng./know_detail",
				"[-KÕt thóc ®èi tho¹i-]/nothing",
				}
	if nDate > 081012 then
		Talk(1,"","Ho¹t ®éng lÇn nµy ®· kÕt thóc, c¶m ¬n b¹n ®· tham gia!");
		return 0;
	end;
	if nDate > 081007 then
		tremove(selTab,1);
		tremove(selTab,1);
	end;
	Say("<color=green>Niªn sø<color>: JX2 trßn 3 n¨m còng võa dŞp tÕt Trung Thu, chóc c¸c vŞ giang hå n÷ hiÖp ¨n tÕt vui vÎ!",getn(selTab),selTab);
end;

function want_reward()
	local selTab = {
				"Ta muèn dïng thÎ kû niÖm ®æi lÊy phÇn th­ëng /use_card",
				"Ta muèn dïng B¸nh Trung Thu ®æi B¶o r­¬ng/use_mooncake",
				"Xem thuéc tİnh trang søc Vinh Dù, Huy Hoµng (kh«ng mua ®­îc)/ring_Sale",
				"[-ThuyÕt minh-]/know_reward",
				"[-Quay l¹i ®èi tho¹i-]/main",
				"[-KÕt thóc ®èi tho¹i-]/nothing",
				}
	Say("B¹n dïng vËt phÈm nµo ®æi phÇn th­ëng?",getn(selTab),selTab);
end;

function use_card()
	local selTab = {
				"§æi  10 thÎ kû niÖm JX2 trßn 3 n¨m lÊy 1 Bång Lai tiªn lé/#ask_is_use_card(10)",
				"§æi  20 thÎ kû niÖm JX2 trßn 3 n¨m lÊy phÇn th­ëng kinh nghiÖm/#ask_is_use_card(20)",
				"§æi  40 thÎ kû niÖm JX2 trßn 3 n¨m lÊy phÇn th­ëng kinh nghiÖm/#ask_is_use_card(40)",
				"§æi  100 thÎ kû niÖm JX2 trßn 3 n¨m lÊy 1 Hép Ng©n Bµi Vinh Dù/#ask_is_use_card(100)",
				"§æi  500 thÎ kû niÖm JX2 trßn 3 n¨m lÊy 1 Ch×a Khãa B¹c Vinh Dù/#ask_is_use_card(500)",
				"Trang kÕ/use_card_page_2",
				"Ta kh«ng muèn ®æi n÷a./nothing",
				}
	local nCount = GetItemCount(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4]);
	Say("HiÖn b¹n cã <color=yellow>"..nCount.."<color>ThÎ kû niÖm JX2 trßn 3 n¨m, tïy theo sè l­îng <color=red>thÎ kû niÖm JX2 trßn 3 n¨m<color> cña b¹n, b¹n cã thÓ ®æi phÇn th­ëng sau ®©y: ",getn(selTab),selTab);
end;

function use_card_page_2()
	local selTab = {
				"§æi 1000 thÎ kû niÖm JX2 trßn 3 n¨m lÊy Hép Kim Bµi Vinh Dù/#ask_is_use_card(1000)",
				"§æi 2000 thÎ kû niÖm JX2 trßn 3 n¨m lÊy trang søc Huy Hoµng Chi Thñy/#ask_is_use_card(2000)",
				"§æi 3000 thÎ kû niÖm JX2 trßn 3 n¨m lÊy 1 trang søc Vinh Dù Chi Thñy/#ask_is_use_card(3000)",
				"§æi 6000 thÎ kû niÖm JX2 trßn 3 n¨m lÊy 1 trong 3 mãn Hoµng §Õ/use_card_exchange_equip",
				"Trang tr­íc/use_card",
				"Ta kh«ng muèn ®æi n÷a./nothing",
				}
	local nCount = GetItemCount(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4]);
	Say("HiÖn b¹n cã <color=yellow>"..nCount.."<color>ThÎ kû niÖm JX2 trßn 3 n¨m, tïy theo sè l­îng <color=red>thÎ kû niÖm JX2 trßn 3 n¨m<color> cña b¹n, b¹n cã thÓ ®æi phÇn th­ëng sau ®©y: ",getn(selTab),selTab);

end;

function ask_is_use_card(nCount)
	local tCardInfo = {
						 [10] = "1 Bång Lai tiªn lé",
						 [20] = "PhËn th­ëng kinh nghiÖm",
						 [40] = "PhËn th­ëng kinh nghiÖm",	
						 [100] = "Hép Ng©n Bµi Vinh Dù",	
						 [500] = "Ch×a Khãa B¹c Vinh Dù",	
						 [1000] = "Hép Kim Bµi Vinh Dù",				
						 [2000] = "Trang søc Huy Hoµng Chi Thñy",	
						 [3000] = "Trang søc Vinh Dù"
							};
	Say("<color=green>Niªn sø<color>: B¹n muèn sö dông <color=yellow>"..nCount.."<color> thÎ kû niÖm JX2 trßn 3 n¨m ®æi <color=yellow>"..tCardInfo[nCount].."<color> chø?",
			2,
			"Ta muèn ®æi/#use_card_confirm("..nCount..")",
			"Ta chän nhÇm råi./use_card");						
end

function use_card_confirm(nCount)
	if nCount ~= 1 and nCount ~= 20 and nCount ~= 40 then
		if gf_JudgeRoomWeight(2,100,".") == 0 then
			return 0;
		end;
	end;
	local nChangeTimes = 0;
	local nRetCode = 0;
	if nCount == 20 then
		nChangeTimes = GetTask(TASK_USE_CARD_20);
		if nChangeTimes >= 60 then
			Talk(1,"","C¸c h¹ kh«ng thÓ ®æi phÇn th­ëng nµy n÷a! ");
			return 0;
		end;
	end		
	if nCount == 40 then
		nChangeTimes = GetTask(TASK_USE_CARD_40);
		if nChangeTimes >= 20 then
			Talk(1,"","C¸c h¹ kh«ng thÓ ®æi phÇn th­ëng nµy n÷a! ");
			return 0;
		end;	
	end
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],nCount) == 1 then
		local nLevel = GetLevel();
		local nExp = 0;
--		if nCount == 1 then
--			nExp = floor(80000*(nLevel^3)/(80^3));
--			nChangeTimes = GetTask(TASK_USE_CARD_1);
--			if nChangeTimes >= 600 then
--				Talk(1,"","<color=green>ÖÜÄêÇìÊ¹<color>£ºÄã²»ÄÜÔÙ»»È¡´Ë½±ÀøÁË£¡");
--				return 0;
--			end;
--			ModifyExp(nExp);
--			Msg2Player("Äã»ñµÃ"..nExp.."µã¾­Ñé½±Àø");
--			SetTask(TASK_USE_CARD_1,nChangeTimes+1);
--			Say("ÇëÄú×¢Òâ£ºÄú»¹¿ÉÒÔ»»È¡<color=yellow>"..(599-nChangeTimes).."<color>´Î¸Ã½±Àø¡£",0);
		if nCount == 10 then
			AddItem(tItemInfo[24][2],tItemInfo[24][3],tItemInfo[24][4],1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[24][1]);
		elseif nCount == 20 then
			nExp = floor(800000*(nLevel^3)/(80^3));
			nChangeTimes = GetTask(TASK_USE_CARD_20);
			if nChangeTimes >= 60 then
				Talk(1,"","C¸c h¹ kh«ng thÓ ®æi phÇn th­ëng nµy n÷a! ");
				return 0;
			end;
			ModifyExp(nExp);
			Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
			SetTask(TASK_USE_CARD_20,nChangeTimes+1);	
			Talk(1,"use_card","<color=green>Niªn sø<color>: B¹n cßn cã thÓ ®æi <color=yellow>"..(59-nChangeTimes).."<color> phÇn th­ëng. ");
		elseif nCount == 40 then
			nExp = floor(3000000*(nLevel^3)/(80^3));
			nChangeTimes = GetTask(TASK_USE_CARD_40);
			if nChangeTimes >= 20 then
				Talk(1,"","C¸c h¹ kh«ng thÓ ®æi phÇn th­ëng nµy n÷a! ");
				return 0;
			end;
			ModifyExp(nExp);
			Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");		
			SetTask(TASK_USE_CARD_40,nChangeTimes+1);
			Talk(1,"use_card","<color=green>Niªn sø<color>: B¹n cßn cã thÓ ®æi <color=yellow>"..(19-nChangeTimes).."<color> phÇn th­ëng. ");
		elseif nCount == 100 then
			nRetCode = AddItem(tItemInfo[17][2],tItemInfo[17][3],tItemInfo[17][4],1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[17][1]);		
		elseif nCount == 500 then
			nRetCode = AddItem(tItemInfo[22][2],tItemInfo[22][3],tItemInfo[22][4],1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[22][1]);
		elseif nCount == 1000 then
			nRetCode = AddItem(tItemInfo[18][2],tItemInfo[18][3],tItemInfo[18][4],1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[18][1]);		
		elseif nCount == 2000 then
			--»Ô»Í
			nRetCode = AddItem(0,102,8840,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc trang søc Huy Hoµng Chi Thñy");
			Talk(1,"","<color=green>Niªn sø<color>: Chóc mõng b¹n nhËn ®­îc trang søc Huy Hoµng Chi Thñy, b¹n cã thÓ ®Õn T­¬ng D­¬ng t×m <color=yellow>®Ö tö thî rÌn L­u<color> ®Ó th¨ng cÊp hiÖu qu¶.");
			Msg2Global(GetName().."Sö dông "..nCount.."ThÎ kû niÖm ®æi trang søc Huy Hoµng Chi Thñy");
		elseif nCount == 3000 then
			--ÈÙÒ«	
			nRetCode = AddItem(0,102,8841,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc trang søc Vinh Dù");
			Talk(1,"","<color=green>Niªn sø<color>: Chóc mõng b¹n nhËn ®­îc trang søc Vinh Dù, b¹n cã thÓ ®Õn T­¬ng D­¬ng t×m <color=yellow>®Ö tö thî rÌn L­u<color> ®Ó th¨ng cÊp hiÖu qu¶");
			Msg2Global(GetName().."Sö dông "..nCount.."ThÎ kû niÖm ®æi trang søc Vinh Dù.");				
		end;
		if nRetCode == 1 then
			WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."Sö dông "..nCount.."ThÎ kû niÖm ®æi phÇn th­ëng.");
		else
			WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Sö dông "..nCount.."§æi thÎ kû niÖm ®æi thÊt b¹i, vŞ trİ thÊt b¹i: "..nRetCode);
		end
	else
		Talk(1,"use_card","<color=green>Niªn sø<color>: Xin lçi! Sè l­îng thÎ kû niÖm JX2 trßn 3 n¨m cña b¹n kh«ng ®ñ.");
	end;
end;

function use_card_exchange_exp()
	local nTimes = 0;
	local nX = 100;
	local nLevel = GetLevel();
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],1000) == 1 then
		nTimes = GetTask(TASK_USE_CARD_1000)+1;
		if nTimes > 10 then
			nX = max(20,100-(nTimes-10)*5);
		end;
		nExp = floor((nX/100)*(90000000*nLevel^3)/(80^3));
		SetTask(TASK_USE_CARD_1000,nTimes);
		ModifyExp(nExp);
		Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		Talk(1,"","§©y lµ lÇn thø <color=yellow>"..nTimes.."<color> thay ®æi phÇn th­ëng kinh nghiÖm. <color=yellow>10<color> lÇn ®Çu sÏ kh«ng bŞ suy gi¶m, nh­ng tõ lÇn thø 11 trë ®i phÇn th­ëng sÏ bŞ suy gi¶m <color=yellow>5%<color>, tèi ®a <color=yellow>20%<color>. ");
		WriteLog("[07 Tam tiÕt liªn th«ng]:"..GetName().."thø"..nTimes.." lÇn dïng 1000 thÎ kû niÖm ®æi ®­îc "..nExp.." ®iÓm kinh nghiÖm");
	else
		Talk(1,"use_card","<color=green>Niªn sø<color>: Xin lçi! Sè l­îng thÎ kû niÖm JX2 trßn 3 n¨m cña b¹n kh«ng ®ñ.");
	end;
end;

function use_card_exchange_equip()
	local selTab = {
			"Ta muèn thay ®æi Hiªn Viªn vò khİ /#use_card_exchange_equip_confirm(1)",
			"Ta muèn thay ®æi Hiªn Viªn ChiÕn/#use_card_exchange_equip_confirm(2)",
			"Ta muèn thay ®æi Hiªn Viªn §Êu /#use_card_exchange_equip_confirm(3)",
			"Ta muèn ®æi thø kh¸c /use_card",
			"§Ó ta xem/nothing",
			}
	Say("<color=green>Niªn sø<color>: B¹n muèn ®æi trang bŞ nµo sau ®©y? <color=red>Chó ı: Ng­êi ch­a vµo l­u ph¸i chØ nhËn ®­îc 1 vò khİ hoÆc trang søc ngÉu nhiªn.<color>",getn(selTab),selTab);
end;

function use_card_exchange_equip_confirm(nType)
	if GetItemCount(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4]) < 6000 then
		Talk(1,"use_card","<color=green>Niªn sø<color>: Xin lçi! Sè l­îng thÎ kû niÖm JX2 trßn 3 n¨m cña b¹n kh«ng ®ñ.");
		return 0;
	end;
	local selTab = {
			"§ång ı/#get_emperor_equip("..nType..")",
			"Kh«ng,Ta muèn ®æi thø kh¸c c¬/use_card_exchange_equip",
			"Ta suy nghÜ mét chót /nothing",
			}
	local tbItemName = {"Hiªn Viªn vò khİ","Hiªn Viªn ChiÕn","Hiªn Viªn §Êu"};
	Say("B¹n x¸c nh©n muèn ®æi <color=yellow>"..tbItemName[nType].."<color> chø?",getn(selTab),selTab);		
end;

function get_emperor_equip(nType)
	if gf_JudgeRoomWeight(1,100,".") == 0 then
		return 0;
	end;
	local tbItemName = {"Hiªn Viªn vò khİ","Hiªn Viªn ChiÕn","Hiªn Viªn §Êu"};
	local nRoute = GetPlayerRoute();
	local nRetCode = 0;
	local nRand = 0;
	if nType == 1 then
		select_emperor_weapon();
		return 0;
	end;
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],6000) ~= 1 then
		Talk(1,"use_card","<color=green>Niªn sø<color>: Xin lçi! Sè l­îng thÎ kû niÖm JX2 trßn 3 n¨m cña b¹n kh«ng ®ñ.");
		return 0;
	end;
	if nType == 2 then
		nRand = random(1,getn(tbHuangDiRing1[nRoute]));
		nRetCode = AddItem(tbHuangDiRing1[nRoute][nRand][2],tbHuangDiRing1[nRoute][nRand][3],tbHuangDiRing1[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
	elseif nType == 3 then
		nRand = random(1,getn(tbHuangDiRing2[nRoute]));
		nRetCode = AddItem(tbHuangDiRing2[nRoute][nRand][2],tbHuangDiRing2[nRoute][nRand][3],tbHuangDiRing2[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
	end;
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc "..tbItemName[nType]);
		WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."§· dïng thÎ kû niÖm ®æi."..tbItemName[nType]);
	else
		WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Dïng thÎ kû niÖm ®æi."..tbItemName[nType].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
	end;
end;

function select_emperor_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		local selTab = {
					"Ta muèn Hiªn Viªn To¸i Vò §ao/#give_emperor_weapon(2,1)",
					"Ta muèn Hiªn Viªn To¸i Vò C«n/#give_emperor_weapon(2,2)",
					"§Ó ta xem/nothing",
					}
		Say("B¹n chän nh÷ng vò khİ g× sau ®©y?",getn(selTab),selTab);
	else
		local nIdx = random(1,getn(tHuangDiWeapon[nRoute]));
		give_emperor_weapon(nRoute,nIdx);
	end;
end;

function give_emperor_weapon(nRoute,nIdx)
	if gf_JudgeRoomWeight(1,100,".") == 0 then
		return 0;
	end;
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],6000) ~= 1 then
		Talk(1,"use_card","<color=green>Niªn sø<color>: Xin lçi! Sè l­îng thÎ kû niÖm JX2 trßn 3 n¨m cña b¹n kh«ng ®ñ.");
		return 0;
	end;
	local nRetCode = AddItem(tHuangDiWeapon[nRoute][nIdx][2],tHuangDiWeapon[nRoute][nIdx][3],tHuangDiWeapon[nRoute][nIdx][4],1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc "..tHuangDiWeapon[nRoute][nIdx][1]);
		WriteLog("[08 Tam tiÕt liªn th«ng]:"..GetName().."§· dïng thÎ kû niÖm ®æi."..tHuangDiWeapon[nRoute][nIdx][1]);
	else
		WriteLog("[Lçi 08 Tam tiÕt liªn th«ng]:"..GetName().."Dïng thÎ kû niÖm ®æi."..tHuangDiWeapon[nRoute][nIdx][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
	end;
end;

function use_mooncake()
	local selTab = {
				"Ta muèn dïng ThŞnh ThÕ Kim Mai Hµn H­¬ng NguyÖt ®æi phÇn th­ëng /#use_mooncake_confirm(1)",
				"Ta muèn dïng ThŞnh ThÕ B¹ch Ngäc Song Hoµng NguyÖt ®æi phÇn th­ëng /#use_mooncake_confirm(2)",
				"Ta muèn dïng ThŞnh ThÕ Kú H­¬ng Ngò Nh©n NguyÖt ®æi phÇn th­ëng /#use_mooncake_confirm(3)",
				"Ta muèn dïng ThŞnh ThÕ B¸ch Hoa ThËp CÈm NguyÖt ®æi phÇn th­ëng /#use_mooncake_confirm(4)",
				"Ta muèn dïng ThŞnh ThÕ ThÊt Tinh B¹n Qu©n NguyÖt ®æi phÇn th­ëng /#use_mooncake_confirm(5)",
				"Ta muèn dïng ThŞnh ThÕ Th­êng Nga Thñy Tinh NguyÖt ®æi phÇn th­ëng /#use_mooncake_confirm(6)",
				"Ta muèn biÕt lo¹i B¸nh Trung Thu nµy cã thÓ ®æi ®­îc phÇn th­ëng g× /know_mookcake_use",
				"Ta ®Ó dµnh ¨n vËy./nothing",
				}
	Say("N¨m nay chóng ta h·y dung b¶o hép cña Vâ L©m Minh chñ ph¸t lµm gi¶i th­ëng cho ng­êi lµm b¸nh trung thu ngon nhÊt, ®Ó xem hä cã lµm ra nh÷ng lo¹i B¸nh Trung Thu nµy kh«ng:",getn(selTab),selTab);
end;

function know_mookcake_use()
	Talk(1,"use_mooncake","<color=green>Niªn sø<color>:\nThŞnh ThÕ Mai Hµn H­¬ng NguyÖt cã thÓ ®æi: 100 ®iÓm danh väng vµ 1 Hép Ngäc Bµi Huy Hoµng\nThŞnh ThÕ B¹ch Ngäc Song Hoµng NguyÖt ®æi: 5-20 ®iÓm tİch lòy Tö Quang C¸c vµ 1 Hép §ång Bµi Huy Hoµng\nThŞnh ThÕ Kú H­¬ng Ngò Nh©n NguyÖt ®æi: 10-30 ®iÓm cèng hiÕn s­ m«n vµ 1 Hép §ång Bµi Huy Hoµng\nThŞnh ThÕ B¸ch Hoa ThËp CÈm NguyÖt ®æi: 20-40 ®iÓm tİch lòy chiÕn tr­êng vµ 1 Hép §ång Bµi Huy Hoµng\nThŞnh ThÕ ThÊt Tinh B¹n Qu©n NguyÖt ®æi: ®iÓm kinh nghiÖm. Mçi lÇn nép 1 c¸i cã thÓ nhËn 1 Hép Ng©n Bµi Vinh Dù\nThŞnh ThÕ Th­êng Nga Thñy Tinh NguyÖt ®æi: ®iÓm kinh nghiÖm. Mçi lÇn nép 10 c¸i cã thÓ nhËn 1 Hép Kim Bµi Vinh Dù\n<color=red>Chó ı: Ng­êi ch­a vµo m«n ph¸i kh«ng nhËn ®­îc ®iÓm cèng hiÕn s­ m«n vµ ®iÓm tİch lòy chiÕn tr­êng.<color>");
end;

function use_mooncake_confirm(nType)
	if gf_JudgeRoomWeight(2,60,".") == 0 then
		return 0;
	end;
	local nPoint = 0;
	local nTimes = 0;
	local nLevel = GetLevel();
	local nExp = 0;
	local nX = 100;
	local nRoute = GetPlayerRoute();
	local nNums = 0;
	if DelItem(tMoonCake[10+nType][2],tMoonCake[10+nType][3],tMoonCake[10+nType][4],1) == 1 then
		if nType == 1 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),1);
			if nNums >= 100 then
				Talk(1,"","<color=green>Niªn sø<color>: Mçi ng­êi tèi ®a cã thÓ ®æi b¸nh trung thu nµy 100 lÇn, b¹n ®· ®æi 100 lÇn råi, kh«ng thÓ ®æi tiÕp.");
				return
			end
			ModifyReputation(100,0);
			AddItem(tItemInfo[15][2],tItemInfo[15][3],tItemInfo[15][4],1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[15][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),1,nNums+1));
			Talk(1,"use_mooncake","<color=green>Niªn sø<color>: B¹n ®· ®æi <color=yellow>"..(nNums+1).." lÇn<color> ThŞnh ThÕ Mai Hµn H­¬ng NguyÖt, b¹n cßn ®æi ®­îc <color=yellow>"..(99-nNums).." lÇn<color>.");
		elseif nType == 2 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),2);
			if nNums >= 100 then
				Talk(1,"","<color=green>Niªn sø<color>: Mçi ng­êi tèi ®a cã thÓ ®æi b¸nh trung thu nµy 100 lÇn, b¹n ®· ®æi 100 lÇn råi, kh«ng thÓ ®æi tiÕp.");
				return
			end		
			nPoint = random(5,20);
			SetTask(652,GetTask(652)+nPoint);
			Msg2Player("B¹n nhËn ®­îc "..nPoint.." ®iÓm tİch lòy Tö Quang C¸c ");
			AddItem(tItemInfo[16][2],tItemInfo[16][3],tItemInfo[16][4],1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[16][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),2,nNums+1));
			Talk(1,"use_mooncake","<color=green>Niªn sø<color>: B¹n ®· ®æi <color=yellow>"..(nNums+1).." lÇn<color> ThŞnh ThÕ B¹ch Ngäc Song Hoµng NguyÖt, b¹n cßn ®æi ®­îc <color=yellow>"..(99-nNums).." lÇn<color>.");			
		elseif nType == 3 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),3);
			if nNums >= 100 then
				Talk(1,"","<color=green>Niªn sø<color>: Mçi ng­êi tèi ®a cã thÓ ®æi b¸nh trung thu nµy 100 lÇn, b¹n ®· ®æi 100 lÇn råi, kh«ng thÓ ®æi tiÕp.");
				return
			end		
			if nRoute ~= 0 then
				nPoint = random(10,30);
				SetTask(336,GetTask(336)+nPoint);
				Msg2Player("B¹n nhËn ®­îc "..nPoint.." ®iÓm cèng hiÕn S­ M«n ");
			else
				--nExp = floor(100000*(nLevel^3)/(80^3));
				--ModifyExp(nExp);
				--Msg2Player("Äã»ñµÃ"..nExp.."µã¾­Ñé");
			end;
			AddItem(tItemInfo[16][2],tItemInfo[16][3],tItemInfo[16][4],1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[16][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),3,nNums+1));
			Talk(1,"use_mooncake","<color=green>Niªn sø<color>: B¹n ®· ®æi <color=yellow>"..(nNums+1).." lÇn<color> ThŞnh ThÕ Kú H­¬ng Ngò Nh©n NguyÖt, b¹n cßn ®æi ®­îc <color=yellow>"..(99-nNums).." lÇn<color>.");						
		elseif nType == 4 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),4);
			if nNums >= 100 then
				Talk(1,"","<color=green>Niªn sø<color>: Mçi ng­êi tèi ®a cã thÓ ®æi b¸nh trung thu nµy 100 lÇn, b¹n ®· ®æi 100 lÇn råi, kh«ng thÓ ®æi tiÕp.");
				return
			end				
			if nRoute ~= 0 then
				nPoint = random(20,40);
				SetTask(707,GetTask(707)+nPoint);
				Msg2Player("B¹n nhËn ®­îc "..nPoint.." ®iÓm tİch lòy chiÕn tr­êng");
			else
				--nExp = floor(100000*(nLevel^3)/(80^3));
				--ModifyExp(nExp);
				--Msg2Player("Äã»ñµÃ"..nExp.."µã¾­Ñé");
			end;
			AddItem(tItemInfo[16][2],tItemInfo[16][3],tItemInfo[16][4],1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[16][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),4,nNums+1));
			Talk(1,"use_mooncake","<color=green>Niªn sø<color>: B¹n ®· ®æi <color=yellow>"..(nNums+1).." lÇn<color> ThŞnh ThÕ B¸ch Hoa ThËp CÈm NguyÖt, b¹n cßn ®æi ®­îc <color=yellow>"..(99-nNums).." lÇn<color>.");			
		elseif nType == 5 then
			nTimes = GetTask(TASK_QIXING_EXCHANGE)+1;
			if nTimes > 10 then
				nX = max(20,100-(nTimes-10)*5);
			end;
			if nLevel ~= 99 then	
				nExp = floor((nX/100)*(1500000*nLevel^3)/(80^3));
				ModifyExp(nExp);
				Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
			else
				AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],30);
				Msg2Player("B¹n nhËn ®­îc 30 quyÓn "..tItemInfo[27][1]);
			end
--			if mod(nTimes,5) == 0 then
				AddItem(tItemInfo[17][2],tItemInfo[17][3],tItemInfo[17][4],1);
				Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[17][1]);
--				Msg2Global(GetName().."Ê¹ÓÃÊ¢ÊÀÆßĞÇ°é¾ıÔÂ»»È¡µ½ÁË1¸ö"..tItemInfo[17][1]);
--				WriteLog("[08Èı½ÚÁ¬¹ı]"..GetName().."ÓÃÊ¢ÊÀÆßĞÇ°é¾ıÔÂ»»È¡ÁË1¸ö"..tItemInfo[17][1]);
--			end;
			Msg2Player("§©y lµ lÇn thø "..nTimes.." lÇn dïng ThŞnh ThÕ ThÊt Tinh B¹n Qu©n NguyÖt ®æi th­ëng ");
			SetTask(TASK_QIXING_EXCHANGE,nTimes);
		elseif nType == 6 then
			nTimes = GetTask(TASK_CHANGE_EXCHANGE)+1;
			if nTimes > 10 then
				nX = max(20,100-(nTimes-10)*5);
			end;
			if nLevel ~= 99 then	
				nExp = floor((nX/100)*(3000000*nLevel^3)/(80^3));
				ModifyExp(nExp);
				Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
			else
				AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],60);
				Msg2Player("B¹n nhËn ®­îc 60 quyÓn "..tItemInfo[27][1]);			
			end
			if mod(nTimes,10) == 0 then
				AddItem(tItemInfo[18][2],tItemInfo[18][3],tItemInfo[18][4],1);
				Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[18][1]);
				Msg2Global(GetName().." lÇn dïng ThŞnh ThÕ Th­êng Nga Thñy Tinh NguyÖt ®æi 1"..tItemInfo[18][1]);
				WriteLog("[08 Tam tiÕt liªn th«ng]"..GetName().." dïng ThŞnh ThÕ Th­êng Nga Thñy Tinh NguyÖt ®æi 1"..tItemInfo[18][1]);
			end;
			SetTask(TASK_CHANGE_EXCHANGE,nTimes);
			Msg2Player("§©y lµ lÇn thø "..nTimes.." lÇn dïng ThŞnh ThÕ Th­êng Nga Thñy Tinh NguyÖt ®æi th­ëng ");
		end;
		WriteLog("[08 Tam tiÕt liªn th«ng]"..GetName().."§· dïng B¸nh Trung Thu ®æi phÇn th­ëng, c¸c lo¹i b¸nh Trung Thu:"..nType);
	else
		Talk(1,"use_mooncake","B¹n kh«ng cã <color=yellow>"..tMoonCake[10+nType][1].."<color> µ!!");
	end;
end;

function know_reward()
	Talk(3,"want_reward","<color=green>Niªn sø<color>: Mçi ngµy vµo 16:30, 19:30, 21:45 7 Boss lín sÏ xuÊt hiÖn bªn ngoµi 3 thµnh lín Phông T­êng, TuyÒn Ch©u, Thµnh §«, ®¸nh b¹i Boss cã thÓ gäi ra TiÓu qu¸i, nhÊn vµo TiÓu qu¸i nhËn ®­îc B¶o hép hoÆc Ch×a khãa (mçi ng­êi mçi giê chØ cã thÓ nhÊn 1 lÇn).","<color=green>Niªn sø<color>: TÕt Trung Thu l¹i ®Õn, n¨m nay ngoµi viÖc lµm c¸c b¸nh trung thu ®Ó th­ëng thøc cßn cã thÓ ®Õn chç ta §æi c¸c lo¹i b¶o hép cña Vâ l©m minh chñ ph¸t. Muèn biÕt b¶o hép cã c«ng dông g× h·y ®Õn gÆp §Æc sø Vâ L©m.","<color=green>Niªn sø<color>: Trong b¶o hép cã thÎ kû niÖm JX2 trßn 3 n¨m, ta muèn thu thËp c¸c thÎ nµy, nÕu ng­¬i t×m ®­îc ®em ®Õn chç ta ®Ó ®æi th­ëng!");
end;

function want_mooncake_resource()
	if gf_JudgeRoomWeight(8,100) == 0 then
		Talk(1,"","B¹n trang bŞ qu¸ nhiÒu, kh«ng thÓ thªm phÇn th­ëng míi vµo.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	local nRetCode = 0;
	if GetItemCount(tMaterial[9][2],tMaterial[9][3],tMaterial[9][4]) == 0 then
		nRetCode = AddItem(tMaterial[9][2],tMaterial[9][3],tMaterial[9][4],1);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 "..tMaterial[9][1]);
		end;
	end;
	if nDate <= GetTask(TASK_GOT_RESOURCE) then
		Talk(1,"main","H«m nay ng­¬i ®· nhËn nguyªn liÖu lµm b¸nh, ngµy mai h·y quay l¹i nhËn tiÕp!");
		return 0;
	end;
	SetTask(TASK_GOT_RESOURCE,nDate);
	nRetCode = AddItem(tMaterial[1][2],tMaterial[1][3],tMaterial[1][4],1); 
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 "..tMaterial[1][1]);
	end;
	nRetCode = AddItem(tMaterial[4][2],tMaterial[4][3],tMaterial[4][4],1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 "..tMaterial[4][1]);
	end;
	nRetCode = AddItem(tMaterial[5][2],tMaterial[5][3],tMaterial[5][4],1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 "..tMaterial[5][1]);
	end;
	nRetCode = AddItem(tMaterial[6][2],tMaterial[6][3],tMaterial[6][4],1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 "..tMaterial[6][1]);
	end;
	nRetCode = AddItem(tMaterial[7][2],tMaterial[7][3],tMaterial[7][4],1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 "..tMaterial[7][1]);
	end;
	nRetCode = AddItem(tMaterial[8][2],tMaterial[8][3],tMaterial[8][4],1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 "..tMaterial[8][1]);
	end;
	Talk(1,"main","§©y lµ nguyªn liÖu lµm b¸nh cña b¹n, hy väng b¹n cã thÓ lµm ra b¸nh Trung Thu h¶o h¹ng!");
end;

function want_mooncake()
	local nDate = tonumber(date("%y%m%d"));
	local nMapID = GetWorldPos();
	local sCityName = "";
	if nMapID == 100 then
		sCityName = "TuyÒn Ch©u";
	elseif nMapID == 200 then
		sCityName = "BiÖn Kinh";
	elseif nMapID == 300 then
		sCityName = "Thµnh §«";
	end;
	local nLv = GetLevel();
	if IB_VERSION ~= 1 then
		if nLv < 60 then
			Talk(1,"","<color=green>Niªn sø<color>: §¼ng cÊp cña b¹n qu¸ thÊp, kh«ng thÓ nhËn b¸nh trung thu, ®¹t  <color=yellow>cÊp 60<color> h·y quay l¹i ®©y.");
			return
		end
	else
		if nLv < 30 then
			Talk(1,"","<color=green>Niªn sø<color>: §¼ng cÊp cña b¹n qu¸ thÊp, kh«ng thÓ nhËn b¸nh trung thu, ®¹t <color=yellow>cÊp 30<color> h·y quay l¹i ®©y.");
			return
		end 
	end
	if GetTask(TASK_GOT_MOONCATE) >= nDate then
		Talk(1,"main","H«m nay b¹n ®· nhËn b¸nh Trung Thu, ngµy mai h·y quay l¹i l·nh tiÕp. Chóc b¹n Trung Thu vui vÎ!");
		return 0;
	end;
	local nCounter = GetMapTaskTemp(nMapID,3);
	if nCounter == 0 then
		Talk(1,"main","B¸nh Trung Thu vÉn ch­a chuÈn bŞ xong,"..tSexName[GetSex()].."Thêi gian ®Õn lÊy B¸nh Trung Thu lµ <color=yellow>11h30, 14h30, 21h00, 23:00<color>, sè l­îng cã h¹n. Xin h·y nhanh ch©n.");
		return 0;
	elseif nCounter == 1 then
		AddGlobalNews(sCityName.."Niªn sø ®· ph¸t xong b¸nh Trung Thu, xin c¸c b¹n lÇn sau tiÕp tôc tİch cùc tham gia.");
		Msg2SubWorld(sCityName.."Niªn sø ®· ph¸t xong b¸nh Trung Thu, xin c¸c b¹n lÇn sau tiÕp tôc tİch cùc tham gia.");
	end;
	SetTask(TASK_GOT_MOONCATE,nDate);
	local nRetCode = AddItem(tMoonCake[17][2],tMoonCake[17][3],tMoonCake[17][4],1);
	if nRetCode == 1 then
		Talk(1,"main","B¸nh Trung Thu nµy tuy ch¼ng cã g× ®Æc biÖt nh­ng h·y coi nh­ lµ mét chót t©m ı cña ta.");
	else
		WriteLog("[Lçi Tam tiÕt liªn th«ng]:"..GetName().."Lçi AddItem khi nhËn b¸nh trung thu, trŞ quay l¹i:"..nRetCode);
	end;
	SetMapTaskTemp(nMapID,3,nCounter-1);
	SetTask(TASK_GOT_MOONCANT_COUNT,GetTask(TASK_GOT_MOONCANT_COUNT)+1);
	if nCounter > 10 and mod(nCounter-1,10) == 0 then
		Msg2SubWorld(sCityName.."Chç Niªn sø cßn "..(10*floor(nCounter/10)).." phÇn b¸nh Trung Thu cã thÓ l·nh.");
	end;
end;

function know_detail()
	local selTab = {
			"NhËn ®­îc b¸nh Trung Thu Mü VŞ/detail_1",
			"NhËn th­ëng Vâ L©m Minh/detail_6",
--			"ÁìÈ¡Á½ÖÜÄê½±Àø/detail_2",
			"B¸nh Trung Thu, lÊy ®¹o cô ®æi phÇn th­ëng /detail_3",
			"Lµm c¸c lo¹i b¸nh Trung Thu/detail_4",
			"§æi thÎ kû niÖm nhËn phÇn th­ëng/detail_5",
			"[-Quay l¹i ®èi tho¹i-]/main",
			"[-KÕt thóc ®èi tho¹i-]/nothing",
			}
	Say("<color=green>H­íng dÉn<color>: B¹n muèn t×m hiÓu ph­¬ng diÖn nµo?",getn(selTab),selTab);
end;

function detail_1()
	Talk(1,"know_detail","<enter>Thêi gian nhËn b¸nh Trung Thu:<color=yellow> Mçi ngµy 4 lÇn 11h30, 14h30, 21h00, 23h00<color>, ng­êi ch¬i cã thÓ gÆp Niªn sø ®Ó lÊy b¸nh, chó ı sè l­îng cã h¹n, ai ®Õn tr­íc sÏ lÊy tr­íc, <color=yellow> chØ ®­îc lÊy 1 lÇn trong ngµy<color>. ");
end;

function detail_2()
	Talk(1,"know_detail","Kim S¬n ch­ëng m«n ®· chuÈn bŞ rÊt nhiÒu phÇn th­ëng cho ng­êi ch¬i cò, b¹n nµo tham gia Vâ L©m 2 vµo 3 thêi ®iÓm kh¸c nhau sÏ cã phÇn th­ëng t­¬ng øng. \nQuy t¾c phÇn th­ëng: \n1, x©y dùng nh©n vËt nhiÒu h¬n 600 ngµy ®­îc tÆng 20 r­¬ng s¾t hoÆc 5 r­¬ng ®ång hoÆc 1 r­¬ng b¹c\n2, x©y dùng nh©n vËt trªn 300 ngµy ®­îc tÆng 10 r­¬ng s¾t hoÆc 2 r­¬ng ®ång \n3, x©y dùng nh©n vËt İt h¬n 100 ngµy ®­îc tÆng 5 r­¬ng s¾t hoÆc 1 r­¬ng ®ång.");
end;

function detail_3()
	Talk(1,"detail_3_ex","<color=green>Niªn sø<color>: Mçi ngµy vµo <color=yellow>16:30, 19:30, 21:45<color> c¸c Boss sÏ xuÊt hiÖn bªn ngoµi <color=yellow>Phông T­êng. TuyÒn Ch©u, Thµnh §«<color>, ®¸nh b¹i c¸c BOSS nµy cã thÓ gäi ra TiÓu qu¸i, nhÊn vµo TiÓu qu¸i nhËn ®­îc c¸c B¶o hép (mçi ng­êi mçi giê chØ cã thÓ nhÊn 1 lÇn), mäi ng­êi ph¶i cã ch×a khãa t­¬ng øng më c¸c b¶o hép ®Ó nhËn phÇn th­ëng.");
end;

function detail_3_ex()
	Talk(1,"know_detail","<color=green>Niªn sø<color>: TÕt Trung Thu l¹i ®Õn, n¨m nay ngoµi viÖc lµm c¸c b¸nh trung thu ®Ó th­ëng thøc cßn cã thÓ ®Õn chç ta §æi c¸c lo¹i b¶o hép cña Vâ l©m minh chñ ph¸t. Muèn biÕt b¶o hép cã c«ng dông g× h·y ®Õn gÆp <color=yellow>§Æc sø Vâ L©m<color>. Ngoµi ra nÕu b¹n nhËn ®­îc thÎ kû niÖm JX2 trßn 3 n¨m cã thÓ ®Õn gÆp Niªn sø ®æi th­ëng.");
end;

function detail_4()
	Talk(1,"detail_4_ex","<color=green>Niªn sø<color>: <enter>C¸ch lµm b¸nh trung thu: <enter>Mçi ngµy ®Õn gÆp Niªn sø nhËn nguyªn liÖu vµ c«ng cô lµm b¸nh, ¨n c¸c b¸nh trung thu sÏ nhËn ®­îc c¸c hiÖu qu¶ ®Æc biÖt.<enter><color=yellow>1. NhËn nguyªn liÖu<color>: Trong thêi gian ho¹t ®éng, mçi ngµy online ®Õn gÆp Niªn sø ®Ó nhËn nguyªn liÖu, ngoµi ra cã thÓ mua thªm c¸c nguyªn liÖu lµm b¸nh t¹i ®©y.<enter><color=yellow>2. NÊu b¸nh<color>: §Çu tiªn, nhÊn chän c«ng cô, sau ®ã bá nguyªn liÖu vµo theo h­íng dÉn, cã thÓ chän bá 1 trong 3 nguyªn liÖu chİnh vµo, sau ®ã chän than hay cñi ®Ó nÊu.");
end;

function detail_4_ex()
	Talk(1,"know_detail","<color=green>H­íng dÉn<color>: Chó ı: <enter>1) NÕu chän than gç th× nhiÖt ®é ban ®Çu lµ 600 ®é, chän cñi th× nhiÖt ®é ban ®Çu lµ 300 ®é. <enter>2)NhiÖt ®é lß sÏ gi¶m kh«ng ngõng gi¶m xuèng. <enter>3)BÊt cø lóc nµo còng cã thÓ thªm nhiªn liÖu vµo lß nh­ng nhiÖt ®é v­ît qu¸ 900 ®é b¸nh sÏ bŞ ch¸y. <enter>4) NhiÖt ®é trong lß n­íng kh«ng thÓ biÕt ®­îc nªn sau khi b¾t ®Çu n­íng b¸nh 3 phót sÏ cã 1 lÇn ®o nhiÖt ®é hiÖn t¹i, nÕu qu¸ 3 phót sau sÏ kh«ng thÓ ®o nhiÖt ®é. <enter><color=yellow>3, lÊy b¸nh<color><enter>1) Thêi gian n­íng b¸nh lµ 5 phót. 5 phót sau nhÊn chuét ph¶i vµo lß n­íng b¸nh ®Ó lÊy b¸nh. <enter>2) Sau khi nhiÖt ®é lß n­íng b¸nh cßn 0 ®é kh«ng thÓ tiÕp tôc thªm nhiªn liÖu vµo.");
end;

function detail_5()
	Talk(2,"know_detail","<color=green>Niªn sø<color>: Më b¶o hép cã thÓ nhËn ®­îc thÎ kû niÖm JX2 trßn 3 n¨m\n  10 thÎ kû niÖm ®æi ®­îc 1 Bång Lai tiªn lé\n  20 thÎ kû niÖm ®æi ®­îc phÇn th­ëng ®iÓm kinh nghiÖm\n  40 thÎ kû niÖm ®æi ®­îc phÇn th­ëng ®iÓm kinh nghiÖm\n  100 kû niÖm cã thÓ ®æi 1 Hép Ng©n Bµi Vinh Dù\n  500 thÎ kû niÖm ®æi 1 Ch×a Khãa B¹c Vinh Dù","<color=green>Niªn sø<color>:\n1000 thÎ kû niÖm ®æi 1 Hép Kim Bµi Vinh Dù\n2000 thÎ kû niÖm ®æi trang søc Huy Hoµng Chi Thñy\n3000 thÎ kû niÖm ®æi trang søc Vinh Dù\n6000 thÎ kû niÖm ®æi 1 trong 3 trang bŞ Hoµng §Õ.");
end;

function detail_6()
	Talk(1,"know_detail","<color=green>Niªn sø<color>:\nTrong thêi gian ho¹t ®éng, mçi ngµy ®Õn gÆp Vâ l©m truyÒn nh©n ®Ó nhËn th­ëng cña Vâ l©m minh chñ, phÇn th­ëng nµy sÏ thay ®æi tïy theo vËn may cña b¹n. Muèn biÕt vËn may h·y ®Õn t×m Thè TiÓu Nha.");
end;


function cancel()
	SetTaskTemp(73,0);
end;

function get_intro_book()
	if GetItemCount(tItemInfo[11][2],tItemInfo[11][3],tItemInfo[11][4]) >=1 then
		Talk(1,"main","<color=green>H­íng dÉn<color>: Kh«ng ph¶i ng­¬i cã 1 quyÓn"..tItemInfo[11][1].."?");
	elseif AddItem(tItemInfo[11][2],tItemInfo[11][3],tItemInfo[11][4],1) == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 quyÓn"..tItemInfo[11][1]);
		Talk(1,"main","§©y lµ s¸ch h­íng dÉn ho¹t ®éng trong n¨m nay, h·y gi÷ kü vµ t×m lêi gi¶i ®¸p cho nh÷ng c©u hái cña b¹n nhĞ!");
	end;
end;

function buy_fireworks()
	Sale(89);
end;

function require_mooncake()
	local nGotTimes = GetTask(TASK_GOT_MOONCANT_COUNT);
	local nPassDay = tonumber(date("%j")) - 255;
	if nPassDay > 27 then
		nPassDay = 27;
	end;	
	local nNum = nPassDay - nGotTimes;	--Èç¹û»î¶¯¿çÄêÁË£¬Õâ¸ö¼ÆËã¾Í²»ºÏÊÊ¡£2008Äê9ÔÂ11ÈÕÊÇ2008ÄêµÄµÚ255Ìì
	if nNum <= 0 then
		Talk(1,"","B¹n ®· nhËn ®ñ sè b¸nh råi.");
		return 0;
	end;
	Say("Ho¹t ®«ng lÇn nµy b¹n ®· thùc hiÖn råi.<color=yellow>"..nGotTimes.."<color> lÇn B¸nh Trung Thu Mü VŞ, b¹n cßn <color=yellow>"..nNum.."<color> b¸nh ch­a nhËn, nhËn<color=yellow>1 lÇn <color>ph¶i cã <color=yellow>danh s¸ch ng­êi ch¬i cò<color>, b¹n x¸c nhËn nhËn kh«ng?",
		2,
		"Ta muèn nhËn/require_mooncake_confirm",
		"T¹m thêi kh«ng dïng/nothing")
end;

function require_mooncake_confirm()
	local nGotTimes = GetTask(TASK_GOT_MOONCANT_COUNT);
	if gf_JudgeRoomWeight(1,10,".") == 0 then
		return 0;
	end;
	if DelItem(2,0,1024,1) == 1 then
		AddItem(tMoonCake[17][2],tMoonCake[17][3],tMoonCake[17][4],1);
		SetTask(TASK_GOT_MOONCANT_COUNT,nGotTimes+1);
		Msg2Player("B¹n nhËn ®­îc 1 "..tMoonCake[17][1]);
	else
		Talk(1,"","Ph¶i cã <color=yellow>Danh s¸ch ng­êi ch¬i cò<color> míi cã thÓ nhËn b¸nh. ");
	end;
end;

function buy_things()
	Sale(89);
end;

function ring_Sale()
	Sale(100,100,1);
end 