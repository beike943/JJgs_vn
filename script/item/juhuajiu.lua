--ÖØÑô½Ú¾Õ»¨¾Æ
--by vivi
--2007/10/16

Include("\\script\\lib\\globalfunctions.lua");

--ÈÎÎñ±äÁ¿
TASK_JHJ_NUM = 2317; --Ê¹ÓÃ´ÎÊý£¬×î¶à5´Î
IB_VERSION = 1;

function OnUse()
	if GetTask(TASK_JHJ_NUM) == 5 then
		Talk(1,"","Xin lçi, b¹n ®· sö dông 5 lÇn vËt phÈm, kh«ng thÓ sö dông ®­îc n÷a. ");
		return
	end
	local szExp = "";
	local nLevel = GetLevel();
	if IB_VERSION == 1 then
		szExp = "NhËn ®­îc <color=yellow>"..floor(3000000*(nLevel^3)/(80^3)).." kinh nghiÖm <color>. ";
	else
		szExp = "ChuyÓn <color=yellow>"..floor(5000000*(nLevel^3)/(80^3)).." ®iÓm <color>. ";
	end;	
	Say("Dïng r­îu hoa cóc, b¹n cã thÓ "..szExp.."Sö dông chø?",
		2,
		"§ång ý/give_exp",
		"Hñy bá/nothing")
end

function give_exp()
	if DelItem(2,0,549,1) == 1 then
		local nLevel = GetLevel();
		local nExp = 0;
		local nGoldenExp = 0;
		if IB_VERSION == 1 then
			nExp = floor(3000000*(nLevel^3)/(80^3));
			ModifyExp(nExp);
			Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		else
			nGoldenExp = floor(5000000*(nLevel^3)/(80^3));
			nExp = gf_GoldenExp2Exp(nGoldenExp);
		end;
		WriteLog("[Ho¹t ®éng mõng tiÕt Trïng D­¬ng]:"..GetName().."nhËn ®­îc 1 lÇn th­ëng:"..nExp.." ®iÓm kinh nghiÖm");
		SetTask(TASK_JHJ_NUM,GetTask(TASK_JHJ_NUM)+1);
	end
end