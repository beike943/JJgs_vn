--File name:little_boss_npc.lua 
--Describe:Èý½ÚÁ¬¹ý£¬Ð¡BOSS£¨¶Ô»°NPC£©
--Create Date:2006-8-22
--Author:yanjun

Include("\\script\\online\\3festival\\3festival_head.lua")
function main()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	if GetUnitCurStates(nNpcIndex,0) == 1 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	if GetLevel() < 30 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: §¼ng cÊp cña ng­¬i qu¸ thÊp, ta kh«ng thÓ giao b¶o vËt cho ng­¬i. Xung quanh ®©y cã rÊt nhiÒu kÎ gian, h·y ®i d¹y b¶o hä, khi ®¹t cÊp <color=yellow>30<color> h·y ®Õn t×m ta.");
		return 0;
	end;
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	if Get_Distance(nMapX,nMapY) >= 10 then
		Msg2Player("B¹n vµ"..sNpcName.." c¸ch nhau qu¸ xa");
		return 0;
	end;
	if GetTask(TASK_GOT_ITEM_TIME) ~= 0 and GetTime() - GetTask(TASK_GOT_ITEM_TIME) <= 60*60 then	--Èç¹ûÏà¸ôÁ½´ÎµÃµ½ÎïÆ·µÄÊ±¼äÏà²îÐ¡ÓÚ60·ÖÖÓ
		if random(1,50) == 11 then
			Talk(1,"","<color=green>"..sNpcName.."<color>: Cã nhiªu ®ã th«i sao?");
		else
			Talk(1,"","<color=green>"..sNpcName.."<color>: Ng­¬i ®· lÊy 1 b¶o vËt, mçi tiÕng mét ng­êi chØ ®­îc lÊy 1 b¶o vËt mµ th«i.");
		end;
		return 0;
	end;
	
	local nItemID = 0;
	for i=1,getn(tBossInfo) do
		if sNpcName == tBossInfo[i][4] then
			nItemID = i;
			break;
		end;
	end;
	if nItemID == 0 then
		WriteLog("[Lçi Tam tiÕt liªn th«ng]: NhÊp chuét vµo Boss nhá kh«ng t×m thÊy th«ng tin vËt phÈm");
		return 0;
	end;
	setunit_curstates(nNpcIndex,0,1);
	SetNpcLifeTime(nNpcIndex,0);
	SetTask(TASK_GOT_ITEM_TIME,GetTime());
	local nRand = random(1,1000);
	if nRand <= 920 then
		AddItem(tItemInfo[17][2],tItemInfo[17][3],tItemInfo[17][4],1);
		Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[17][1]);
	elseif nRand <= 974 then
		AddItem(tItemInfo[22][2],tItemInfo[22][3],tItemInfo[22][4],1);
		Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[22][1]);
		Msg2Global(GetName().."Tham gia ho¹t ®éng, nhËn ®­îc 1 quyÓn "..tItemInfo[22][1]);
	elseif nRand <= 999 then
		AddItem(tItemInfo[18][2],tItemInfo[18][3],tItemInfo[18][4],1);
		Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[18][1]);
		Msg2Global(GetName().."Tham gia ho¹t ®éng, nhËn ®­îc 1 "..tItemInfo[18][1]);
		WriteLog("[08 Tam tiÕt liªn th«ng]: Ng­êi ch¬i"..GetName().."Tham gia ho¹t ®éng nhËn ®­îc 1 "..tItemInfo[18][1]);
	else
		AddItem(tItemInfo[23][2],tItemInfo[23][3],tItemInfo[23][4],1);
		Msg2Player("B¹n nhËn ®­îc 1 "..tItemInfo[23][1]);
		Msg2Global(GetName().."Tham gia ho¹t ®éng, nhËn ®­îc 1 quyÓn "..tItemInfo[23][1]);
		WriteLog("[08 Tam tiÕt liªn th«ng]: Ng­êi ch¬i"..GetName().."Tham gia ho¹t ®éng nhËn ®­îc 1 "..tItemInfo[23][1]);
	end;
	if random(1,100) == 11 then
		Say("<color=green>"..sNpcName.."<color>: "..tRandString[random(1,getn(tRandString))],0);
	end;
end;

function setunit_curstates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("ThiÕt lËp trÞ sè NPC nhÇm: VÞ trÝ:"..att_seq.."TrÞ:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end

tRandString = {
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"VLTK2 chóc b¹n n¨m míi vui vÎ!",
			"Quèc Kh¸nh vui vÎ!",
			"Trung Thu vui vÎ!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			"Sî qu¸! Sau nµy kh«ng d¸m ®Õn ph¸ n÷a!",
			}