--file name:award_npc.lua
--author:yanjun(yim)
--create date:2006-7-8
--describe:°ä½±ÈË
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
function handinhand_main()
	if Is_HandInHand_Open() == 0 then
		Talk(1,"main","Ho¹t ®éng cóp thÕ giíi ®· kÕt thóc, c¸m ¬n mäi ng­êi ®· tham gia.");
		return 0;
	end;
	local selTab = {
				"Ta muèn ®æi/ask_for_award",
				"Xem néi dung ho¹t ®éng./know_detail",
				"LÔ bao kû niÖm cóp thÕ giíi/know_present_bag",
				"NhËn h­íng dÉn ho¹t ®éng/get_intro_book",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	Say("Ho¹t ®éng cóp thÕ giíi ®· b¾t ®Çu, mäi ng­êi h·y cïng nhau tham gia.",getn(selTab),selTab);
end;

function know_present_bag()
	Talk(1,"main","Më lÔ bao kû niÖm cóp thÕ giíi cã kh¶ n¨ng nhËn ®­îc c¸c vËt phÈm sau: 1% ®iÓm kinh nghiÖm (İt h¬n 500000 tİnh lµ 500000), nhËn ®­îc 4% ®iÓm kinh nghiÖm theo tû lÖ nhÊt ®Şnh (İt h¬n 2 triÖu tİnh 2 triÖu), 32 phÇn T©y B¾c Väng,");
end;

function ask_for_award()
	if GetTime() - GetTask(TASK_GOTAWARD_TIME) <= GET_AWARD_INTERVAL then
		Talk(1,"handinhand_main","Xin lçi! Thêi gian ®æi phÇn th­ëng gi÷a mçi lÇn c¸ch nhau <color=yellow>1 giê<color>.");
		return 0;
	end;
	local selTab = {
				"Ta ®· thu thËp ®ñ thÎ cña 1 b¶ng/#want_award1(1)",
				"Ta ®· thu thËp ®ñ thÎ 4 ®éi m¹nh/want_award2",
				"Ta ®· thu thËp ®ñ thÎ cña 32 ®éi/want_award3",
				"B¹n nhËn ®­îc thÎ §¹i Trung Hoa/want_award4",
				"\nQuay l¹i/handinhand_main",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	Say("Ng­êi ®· thu thËp ®­îc lo¹i thÎ nµo? Kh¸ch quan muèn dïng thÎ ®æi phÇn th­ëng nµo?",getn(selTab),selTab);
end;

function know_detail()
	Talk(4,"handinhand_main","Hai vŞ kh¸c giíi chØ cÇn t¹o tæ ®éi cã thÓ n¾m tay cïng c­ìi thó, sau <color=yellow>5 phót<color> sÏ xuÊt hiÖn khung ®èi tho¹i, yªu cÇu mçi bªn chØ cÇn chän 1 nhãm m×nh thİch.",
							"Sau khi chän, ng­êi ch¬i sÏ nhËn ®­îc 1 tÊm thÎ ngÉu nhiªn, tû lÖ thµnh c«ng dùa theo ®¼ng cÊp 2 ng­êi ch¬i céng l¹i chia cho 100, nÕu h¬n 100% sÏ lÊy kÕt qu¶ ®ã.",
							"Ng­êi ch¬i cã thÓ dïng thÎ m×nh cã ®Õn ®©y ®æi phÇn th­ëng t­¬ng øng.",
							"Th«ng tin chi tiÕt xin tham kh¶o trang chñ cña VLTK2.");
end;

function get_intro_book()
	if GetItemCount(tItemOther["intro_book"][2],tItemOther["intro_book"][3],tItemOther["intro_book"][4]) >=1 then
		Talk(1,"handinhand_main","Kh«ng ph¶i ®¹i hiÖp ®· cã 1 quyÓn"..tItemOther["intro_book"][1].."?");
		return 0;
	end;
	if AddItem(tItemOther["intro_book"][2],tItemOther["intro_book"][3],tItemOther["intro_book"][4],1) == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 quyÓn"..tItemOther["intro_book"][1]);
	end;
end;

tGroupName = {"B¶ng A","B¶ng B","B¶ng C","B¶ng D","B¶ng E","B¶ng F","B¶ng G","B¶ng H"};
--»»È¡Ğ¡×é¿¨Æ¬½±Àø
function want_award1(nPageNum)
	if GetTask(TASK_GOTGROUP_AWARD) >= 30 then
		Talk(1,"handinhand_main","§¹i hiÖp ®· ®æi 30 lÇn phÇn th­ëng nµy, kh«ng thÓ tiÕp tôc ®æi n÷a.");
		return 0;
	end;
	local selTab = {};
	selTab[1] = "Dïng thÎ"..tGroupName[(nPageNum-1)*4+1].."§æi phÇn th­ëng/#give_award1_confirm("..((nPageNum-1)*4+1)..")";
	selTab[2] = "Dïng thÎ"..tGroupName[(nPageNum-1)*4+2].."§æi phÇn th­ëng/#give_award1_confirm("..((nPageNum-1)*4+2)..")";
	selTab[3] = "Dïng thÎ"..tGroupName[(nPageNum-1)*4+3].."§æi phÇn th­ëng/#give_award1_confirm("..((nPageNum-1)*4+3)..")";
	selTab[4] = "Dïng thÎ"..tGroupName[(nPageNum-1)*4+4].."§æi phÇn th­ëng/#give_award1_confirm("..((nPageNum-1)*4+4)..")";
	selTab[5] = "Trang tr­íc/#want_award1("..(nPageNum-1)..")";
	selTab[6] = "Trang sau/#want_award1("..(nPageNum+1)..")";
	selTab[7] = "§æi phÇn th­ëng kh¸c/ask_for_award";
	selTab[8] = "Quay l¹i ®èi tho¹i chİnh./handinhand_main";
	selTab[9] = "KÕt thóc ®èi tho¹i/nothing";
	if nPageNum == 1 then
		tremove(selTab,5);
	end;
	if nPageNum == 2 then
		tremove(selTab,6);
	end;
	Say("§¹i hiÖp dïng thÎ nµo ®Ó ®æi phÇn th­ëng?",getn(selTab),selTab);
end;

function give_award1_confirm(nGroup)
	local selTab = {
				"§óng vËy!/#give_award1("..nGroup..")",
				"Ta suy nghÜ l¹i!/#want_award1(1)",
				}
	Say("PhÇn th­ëng lµ <color=yellow>1 lÔ bao kû niÖm cóp thÕ giíi<color>. Xin x¸c nhËn hµnh trang vµ søc lùc cßn ®ñ ®Ó tr¸nh tæn thÊt ®¸ng tiÕc.B¹n x¸c nhËn muèn ®æi thÎ cña vßng b¶ng lÊy phÇn th­ëng?",getn(selTab),selTab);
end;

function give_award1(nGroup)
	if have_group_card(nGroup) == 1 then
		local nRetCode = 0;
		delete_group_card(nGroup);
		nRetCode = AddItem(tItemOther["present_bag"][2],tItemOther["present_bag"][3],tItemOther["present_bag"][4],1);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 "..tItemOther["present_bag"][1]);
			WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]"..GetName().."§æi thÎ vßng b¶ng lÊy phÇn th­ëng, nhËn ®­îc 1"..tItemOther["present_bag"][1]);
		else
			WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]"..GetName().."§æi thÎ vßng b¶ng lÊy phÇn th­ëng, nhËn ®­îc 1"..tItemOther["present_bag"][1].."h bŞ lçi, trŞ quay l¹i AddItem:"..nRetCode);
		end;
		SetTask(TASK_GOTGROUP_AWARD,GetTask(TASK_GOTGROUP_AWARD)+1);
		SetTask(TASK_GOTAWARD_TIME,GetTime());
	end;
end;

--»»È¡4Ç¿¿¨Æ¬½±Àø
function want_award2()
	if GetTask(TASK_GOT4TEAM_AWARD) >= 5 then
		Talk(1,"handinhand_main","B¹n ®· ®æi 5 lÇn phÇn th­ëng nµy, kh«ng thÓ tiÕp tôc ®æi ®­îc.");
		return 0;
	end;
	local selTab = {
				"§óng vËy!/give_award2",
				"Ta suy nghÜ l¹i!/ask_for_award",
				}
	Say("PhÇn th­ëng lµ <color=yellow>4 lÔ bao kû niÖm cóp thÕ giíi<color> vµ <color=yellow>1 TiÓu Niªn Thó Phï<color>. Xin x¸c nhËn hµnh trang vµ søc lùc cßn ®ñ ®Ó tr¸nh tæn thÊt ®¸ng tiÕc. B¹n x¸c nhËn muèn ®æi thÎ 4 ®éi m¹nh lÊy phÇn th­ëng?",getn(selTab),selTab);
end;

function give_award2()
	if have_4team_card() == 1 then
		local nRetCode = 0;
		delete_4team_card();
		nRetCode = AddItem(tItemOther["present_bag"][2],tItemOther["present_bag"][3],tItemOther["present_bag"][4],4);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 4 "..tItemOther["present_bag"][1]);
			WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]"..GetName().."§æi 4 card m¹nh nhÊt lÊy phÇn th­ëng, nhËn ®­îc 4"..tItemOther["present_bag"][1]);
		else
			WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]"..GetName().."§æi 4 card m¹nh nhÊt lÊy phÇn th­ëng, nhËn ®­îc 4"..tItemOther["present_bag"][1].."h bŞ lçi, trŞ quay l¹i AddItem:"..nRetCode);
		end;
		nRetCode = AddItem(tItemOther["monster_card"][2],tItemOther["monster_card"][3],tItemOther["monster_card"][4],1);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 "..tItemOther["monster_card"][1]);
			WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]"..GetName().."§æi 4 card m¹nh nhÊt lÊy phÇn th­ëng, nhËn ®­îc 1"..tItemOther["monster_card"][1]);
		else
			WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]"..GetName().."§æi 4 card m¹nh nhÊt lÊy phÇn th­ëng, nhËn ®­îc"..tItemOther["monster_card"][1].."h bŞ lçi, trŞ quay l¹i AddItem:"..nRetCode);
		end;
		SetTask(TASK_GOT4TEAM_AWARD,GetTask(TASK_GOT4TEAM_AWARD)+1);
		SetTask(TASK_GOTAWARD_TIME,GetTime());
	end;
end;
--»»È¡Ì×¿¨½±Àø
function want_award3()
	if GetTask(TASK_GOTALLTEAM_AWARD) ~= 0 then
		Talk(1,"handinhand_main","§¹i hiÖp ®· ®æi 1 lÇn phÇn th­ëng nµy, kh«ng thÓ tiÕp tôc ®æi n÷a.");
		return 0;
	end;
	local selTab = {
				"§óng vËy!/give_award3",
				"Ta suy nghÜ l¹i!/ask_for_award",
				}
	Say("PhÇn th­ëng lµ <color=yellow>10 LÔ bao kû niÖm cóp thÕ giíi<color> vµ <color=yellow>5 TiÕu Niªn Thó ThÇn Phï<color>. Xin x¸c nhËn hµnh trang vµ søc lùc cßn ®ñ ®Ó tr¸nh tæn thÊt ®¸ng tiÕc. B¹n ®ång ı dïng 32 thÎ ®æi phÇn th­ëng?",getn(selTab),selTab);	
end;

function give_award3()
	if have_series_card() == 1 then
		local nRetCode = 0;
		delete_series_card();
		nRetCode = AddItem(tItemOther["present_bag"][2],tItemOther["present_bag"][3],tItemOther["present_bag"][4],10);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 10 "..tItemOther["present_bag"][1]);
			WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]"..GetName().."§æi bé thÎ (32 tÊm) lÊy phÇn th­ëng, nhËn ®­îc 10"..tItemOther["present_bag"][1]);
		else
			WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]"..GetName().."§æi bé thÎ (32 tÊm) lÊy phÇn th­ëng, nhËn ®­îc 10"..tItemOther["present_bag"][1].."h bŞ lçi, trŞ quay l¹i AddItem:"..nRetCode);
		end;
		nRetCode = AddItem(tItemOther["monster_card"][2],tItemOther["monster_card"][3],tItemOther["monster_card"][4],5);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 5 "..tItemOther["monster_card"][1]);
			WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]"..GetName().."§æi bé thÎ (32 tÊm) lÊy phÇn th­ëng, nhËn ®­îc 5"..tItemOther["monster_card"][1]);
		else
			WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]"..GetName().."§æi bé thÎ (32 tÊm) lÊy phÇn th­ëng, nhËn ®­îc"..tItemOther["monster_card"][1].."h bŞ lçi, trŞ quay l¹i AddItem:"..nRetCode);
		end;
		SetTask(TASK_GOTALLTEAM_AWARD,GetTask(TASK_GOTALLTEAM_AWARD)+1);
		SetTask(TASK_GOTAWARD_TIME,GetTime());
	end;	
end;

--»»È¡´óÁ¦ÉñÏîÁ´
function want_award4()
	if GetTask(TASK_GOTRING_AWARD) ~= 0 then
		Talk(1,"ask_for_award","§¹i hiÖp ®· ®æi 1 lÇn phÇn th­ëng nµy, kh«ng thÓ tiÕp tôc ®æi n÷a.");
		return 0;
	end;
	if GetItemCount(tItemCard[34][2],tItemCard[34][3],tItemCard[34][4]) < 1 then
		Talk(1,"ask_for_award","Xin lçi! §¹i hiÖp cÇn 1 tÊm thÎ §¹i Trung Hoa míi cã thÓ ®æi phÇn th­ëng nµy.")
		return 0;
	end;
	give_award4();
end;

function give_award4()
	local nRetCode = 0;
	if DelItem(tItemCard[34][2],tItemCard[34][3],tItemCard[34][4],1) == 1 then
		nRetCode = AddItem(tItemOther["ring"][2],tItemOther["ring"][3],tItemOther["ring"][4],1,1,-1,-1,-1,-1,-1,-1);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc "..tItemOther["ring"][1]);
			WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]"..GetName().."§æi §¹i Lùc ThÇn H¹ng Liªn, nhËn ®­îc 1 "..tItemOther["ring"][1]);
		else
			WriteLog("[Lçi ho¹t ®éng cóp thÕ giíi]"..GetName().."Khi ®æi §¹i Lùc ThÇn H¹ng Liªn, nhËn ®­îc "..tItemOther["ring"][1].."h bŞ lçi, trŞ quay l¹i AddItem:"..nRetCode)
		end;
		SetTask(TASK_GOTRING_AWARD,GetTask(TASK_GOTRING_AWARD)+1);
		SetTask(TASK_GOTAWARD_TIME,GetTime());
	end;
end;

function have_group_card(nGroup)
	local nSearchFailed = 0;
	local sNeedTeamName = "";
	local sCmdStr = "";
	for i=1,4 do
		local nTeamIndex = (nGroup-1)*4+i;
		if GetItemCount(tItemCard[nTeamIndex][2],tItemCard[nTeamIndex][3],tItemCard[nTeamIndex][4]) < 1 then
			sNeedTeamName = sNeedTeamName..tItemCard[nTeamIndex][1];
			nSearchFailed = 1;
		end;
	end;
	if nGroup > 4 then
		sCmdStr = "#want_award1(2)";
	else
		sCmdStr = "#want_award1(1)";
	end;
	if nSearchFailed == 1 then
		Talk(1,sCmdStr,"§¹i hiÖp thiÕu nh÷ng thÎ sau:"..sNeedTeamName);
		return 0;
	else
		return 1;
	end;
end;

function delete_group_card(nGroup)
	for i=1,4 do
		local nTeamIndex = (nGroup-1)*4+i;
		DelItem(tItemCard[nTeamIndex][2],tItemCard[nTeamIndex][3],tItemCard[nTeamIndex][4],1);
	end;
end;

t4TeamIndex = {1,13,17,25};

function have_4team_card()
	local nSearchFailed = 0;
	local sNeedTeamName = "";
	for i=1,getn(t4TeamIndex) do
		if GetItemCount(tItemCard[t4TeamIndex[i]][2],tItemCard[t4TeamIndex[i]][3],tItemCard[t4TeamIndex[i]][4]) < 1 then
			sNeedTeamName = sNeedTeamName..tItemCard[t4TeamIndex[i]][1];
			nSearchFailed = 1;
		end;
	end;
	if nSearchFailed == 1 then
		Talk(1,"ask_for_award","§¹i hiÖp thiÕu nh÷ng thÎ sau:"..sNeedTeamName);
		return 0;
	else
		return 1;
	end;
end;

function delete_4team_card()
	for i=1,getn(t4TeamIndex) do
		DelItem(tItemCard[t4TeamIndex[i]][2],tItemCard[t4TeamIndex[i]][3],tItemCard[t4TeamIndex[i]][4],1);
	end;
end;

function have_series_card()
	local nSearchFailed = 0;
	local sNeedTeamName = "";
	for i=1,getn(tItemCard)-2 do
		if GetItemCount(tItemCard[i][2],tItemCard[i][3],tItemCard[i][4]) < 1 then
			sNeedTeamName = sNeedTeamName..tItemCard[i][1];
			nSearchFailed = 1;
		end;
	end;
	if nSearchFailed == 1 then
		Talk(1,"ask_for_award","§¹i hiÖp thiÕu nh÷ng thÎ sau:"..sNeedTeamName);
		return 0;
	else
		return 1;
	end;
end;

function delete_series_card()
	for i=1,getn(tItemCard)-2 do
		DelItem(tItemCard[i][2],tItemCard[i][3],tItemCard[i][4],1);
	end;
end;