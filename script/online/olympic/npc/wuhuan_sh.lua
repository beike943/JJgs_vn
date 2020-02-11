Include("\\script\\online\\olympic\\oly_head.lua")

function main()
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	if oly_IsActivityOpen() ~= 1 then
		return 0;
	end
	local tbSay = {
		"Th¾p s¸ng b»ng 5 lo¹i Th¸nh Háa/free_fire",
		"Th¾p s¸ng b»ng Ngò Th¸i Th¸nh Háa/ib_fire",
		"\n rót lui/do_nothing",
	}
	local sTitle = "Ngò th¸i Th¸nh Háa : C¸c h¹ ®· th¾p s¸ng céng dån %d lÇn , th¾p s¸ng thªm  %d lÇn n÷a sÏ nhËn ®­îc %s gi¶i th­ëng";
	local nCount = gf_GetMyTaskByte(VET_OLY_TASK2,1,2);
	local nIndex = oly_GetCountStep(nCount);
	sTitle = format(sTitle,nCount,OLY_ACCUMULATE_FIRE_AWARD_TABLE[nIndex][1]-nCount,OLY_ACCUMULATE_FIRE_AWARD_TABLE[nIndex][4]);
	Say(sTitle,getn(tbSay),tbSay);
end

function free_fire()
	if gf_GetTaskBit(VET_OLY_TASK3,6) ~= 0 then
		--Talk(1,"","Ã¿¸ö³ÇÊÐµÄ°ÂÔËÊ¥»ðÌ³Ò»ÌìÖ»ÄÜµãÈ¼1´Î");
		Talk(1,"","Th¸nh Háa §µn cña mçi thµnh 1 ngµy chØ ®­îc ®iÓm háa 1 lÇn");
		return 0;
	end
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
  		return 0;
	end
	--µÀ¾ßÆëÈ«
	local tempTb = "Kh«ng ®ñ vËt phÈm th¾p s¸ng ch­a thµnh c«ng: \n";
	local nFlag = 0;
	for i=1,getn(Flame_Table) do
		if GetItemCount(Flame_Table[i][1],Flame_Table[i][2],Flame_Table[i][3]) < 1 then
		 tempTb = tempTb..Flame_Table[i][5].." ";
		 nFlag = 1;
		end
	end
	if nFlag == 1 then
		Talk(1,"",tempTb);
		return 0;
	end	
	--É¾³ýµÀ¾ß
	nFlag = 0;
	for i=1,getn(Flame_Table) do
		if DelItem(Flame_Table[i][1],Flame_Table[i][2],Flame_Table[i][3],1) ~= 1 then
			nFlag = 1;
		end
	end
	if nFlag == 1 then
		return -1;
	end
	--±ê¼ÇÖÃ1
	gf_SetTaskBit(VET_OLY_TASK3,6,1,TASK_ACCESS_CODE_OLYMPIC);
	SetCurrentNpcSFX(GetTargetNpc(),975,2,0,3);
	--µ±ÈÕµã»ð´ÎÊý
	if gf_GetTaskByte(VET_OLY_TASK,1) < 6 then
		gf_SetTaskByte(VET_OLY_TASK,1,gf_GetTaskByte(VET_OLY_TASK,1) + 1,TASK_ACCESS_CODE_OLYMPIC);
	end
	--ÀÛ¼Æµã»ð´ÎÊý
	oly_Accumulate_FireNum();
	--¸ø½±Àø2
	oly_GiveAward2();
end

function ib_fire()
	AskClientForNumber("ib_fire_Rec",1,min(OLY_IB_FIRE_MAX_NUM,GetItemCount(2,1,30402)),"H·y  nhËp sè lÇn th¾p s¸ng vµo :");
end

function ib_fire_Rec(nNum)
	if not nNum or nNum <= 0 then
		return
	end
	SetCurrentNpcSFX(GetTargetNpc(),975,2,0,3);
	for i=1,nNum do
		if ib_fire_do() ~= 1 then
			break;
		end
	end
end

function ib_fire_do()
	if gf_Judge_Room_Weight(2,1,"") ~= 1 then
  		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
  		return 0;
	end
	if GetItemCount(2,1,30402) < 1 then
		Talk(1,"","Ngò Th¸i Th¸nh Háa kh«ng ®ñ, kh«ng thÓ th¾p s¸ng Th¸nh Háa §µn.");
		return 0;
	end
	if DelItem(2,1,30402,1) ~= 1 then
		return -1;
	end
	--µ±ÈÕµã»ð´ÎÊý
	if gf_GetTaskByte(VET_OLY_TASK,1) < 6 then
		gf_SetTaskByte(VET_OLY_TASK,1,gf_GetTaskByte(VET_OLY_TASK,1) + 1,TASK_ACCESS_CODE_OLYMPIC);
	end
	--ÀÛ¼Æµã»ð´ÎÊý
	oly_Accumulate_FireNum();
	--¸ø½±Àø3
	oly_GiveAward3();
	return 1;
end