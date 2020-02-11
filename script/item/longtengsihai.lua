--create date:2007-09-29 9:29
--author:yanjun
--describe:½ðÉ½ÉÏÊÐÁúÌÚËÄº£°ü½Å±¾
Include("\\script\\lib\\globalfunctions.lua");

TSK_USE_DATE = 2358;
g_szItemName = "Tói Long §»ng Tø H¶i";
IB_VERSION = 1;
g_tbSkillID = {820,823,832,835,838,841,871};

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"));
	local nTime = tonumber(date("%H%M"));
	if nDate >= 071009 and nDate <= 071011 and nTime >= 2000 and nTime <= 2200 then
		if nDate > GetTask(TSK_USE_DATE) then
			local szExp = "";
			local nLevel = GetLevel();
			if IB_VERSION == 1 then
				szExp = "<color=yellow>"..floor(5000000*(nLevel^3)/(80^3)).." kinh nghiÖm <color>. ";
			else
				szExp = "ChuyÓn <color=yellow>"..floor(10000000*(nLevel^3)/(80^3)).." ®iÓm <color>. ";
			end;
			local selTab = {
						"§ång ý/#get_reward("..nItemIdx..","..nDate..")",
						"Hñy bá/nothing",
						}
			Say("H«m nay b¹n më ra lÇn ®Çu tiªn <color=yellow>"..g_szItemName.."<color>B¹n nhËn ®­îc 1 ph¸o, 1 Ph¸o hoa mµu cam, 1 Ph¸o hoa mµu xanh, 1 XÝch M¹c Háa DiÖm, 1 Lam M¹c Háa DiÖm, 1 Tranh M¹c Háa DiÖm, 1 ThÇn MËt Yªn Hoa"..szExp.."B¹n muèn më nã ra b©y giê?",getn(selTab),selTab);
		else
			do_fireworks(nItemIdx);
		end;		
	else
		Talk(1,"",g_szItemName.."ChØ <color=yellow>sö dông mçi buæi tèi tõ 20:00 - 22:00, ngµy 9, 10, 11 th¸ng 10 n¨m <color>.");
	end;
end;

function do_fireworks(nItemIdx)
	local nSkill = g_tbSkillID[random(1,getn(g_tbSkillID))];
	if DoFireworks(nSkill,5) == 1 then
		SetItemUseLapse(nItemIdx,30*18);
	end	
end;

function get_reward(nItemIdx,nDate)
	if gf_JudgeRoomWeight(8,20,"") == 1 then
		do_fireworks(nItemIdx);
		SetTask(TSK_USE_DATE,nDate);
		AddItem(2,3,214,1);
		Msg2Player("B¹n nhËn ®­îc 1 ph¸o");
		AddItem(2,1,189,1);
		Msg2Player("B¹n nhËn ®­îc 1 Tranh s¾c Yªn Hoa");
		AddItem(2,1,190,1);
		Msg2Player("B¹n nhËn ®­îc 1 Lam S¾c Yªn Hoa");
		AddItem(2,1,191,1);
		Msg2Player("B¹n nhËn ®­îc 1 XÝch M¹c Háa DiÖm");
		AddItem(2,1,192,1);
		Msg2Player("B¹n nhËn ®­îc 1 Lam M¹c Háa DiÖm");
		AddItem(2,1,193,1);
		Msg2Player("B¹n nhËn ®­îc 1 Tranh M¹c Háa DiÖm");
		AddItem(2,1,194,1);
		Msg2Player("B¹n nhËn ®­îc 1 ThÇn MËt Yªn Hoa");
		local nLevel = GetLevel();
		local nExp = 0;
		local nGoldenExp = 0;
		if IB_VERSION == 1 then
			nExp = floor(5000000*(nLevel^3)/(80^3));
			ModifyExp(nExp);
			Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		else
			nGoldenExp = floor(10000000*(nLevel^3)/(80^3));
			nExp = gf_GoldenExp2Exp(nGoldenExp);
		end;
		WriteLog("[VËt phÈm mõng sinh nhËt Vâ l©m ®· ra lß]:"..GetName().."nhËn ®­îc 1 lÇn th­ëng:"..nExp.." ®iÓm kinh nghiÖm");
	end;
end;