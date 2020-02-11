--ÖØÑô½Ú¾Õ»¨¸â
--by vivi
--2007/10/16

Include("\\script\\lib\\globalfunctions.lua");

--ÈÎÎñ±äÁ¿
TASK_JHG_NUM = 2318; --Ê¹ÓÃ´ÎÊý£¬×î¶à5´Î

IB_VERSION = 1;

function OnUse()
	if GetTask(TASK_JHG_NUM) == 5 then
		Talk(1,"","Xin lçi, b¹n ®· sö dông 5 lÇn vËt phÈm, kh«ng thÓ sö dông ®­îc n÷a. ");
		return
	end
	local szExp = "";
	local nLevel = GetLevel();
	if IB_VERSION == 1 then
		szExp = "NhËn ®­îc <color=yellow>"..floor(1000000*(nLevel^3)/(80^3)).." kinh nghiÖm <color>. ";
	else
		szExp = "NhËn ®­îc <color=yellow>"..floor(1500000*(nLevel^3)/(80^3)).."Kinh nghiÖm kháe m¹nh <color>, ChuyÓn <color=yellow> "..floor(2500000*(nLevel^3)/(80^3)).." ®iÓm <color>. ";
	end;	
	Say("Sö dông Cóc Hoa Cao, b¹n cã thÓ "..szExp.."Sö dông chø?",
		2,
		"§ång ý/give_exp",
		"Hñy bá/nothing")
end

function give_exp()
	if DelItem(2,0,550,1) == 1 then
		local nLevel = GetLevel();
		local nExp = 0;
		local nGoldenExp = 0;
		local nAddGoldenExp = 0;
		if IB_VERSION == 1 then
			nExp = floor(1000000*(nLevel^3)/(80^3));
			ModifyExp(nExp);
			Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		else
			nAddGoldenExp = floor(1500000*(nLevel^3)/(80^3));
			ModifyGoldenExp(nAddGoldenExp);
			Msg2Player("B¹n nhËn ®­îc "..nAddGoldenExp.." ®iÓm kinh nghiÖm søc kháe");
			nGoldenExp = floor(2500000*(nLevel^3)/(80^3));
			nExp = gf_GoldenExp2Exp(nGoldenExp);
		end;
		WriteLog("[Ho¹t ®éng mõng tiÕt Trïng D­¬ng]:"..GetName().."nhËn ®­îc 1 lÇn th­ëng:"..nExp.." ®iÓm kinh nghiÖm");
		SetTask(TASK_JHG_NUM,GetTask(TASK_JHG_NUM)+1);
	end
end