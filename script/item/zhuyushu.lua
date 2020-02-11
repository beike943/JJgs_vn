--ÖØÑô½ÚÜïÝÇÊø
--by vivi
--2007/10/16

IB_VERSION = 1;

--ÈÎÎñ±äÁ¿
TASK_ZYS_NUM = 2319; --Ê¹ÓÃ´ÎÊý£¬×î¶à5´Î
function OnUse()
	if GetTask(TASK_ZYS_NUM) == 5 then
		Talk(1,"","Xin lçi, b¹n ®· sö dông 5 lÇn vËt phÈm, kh«ng thÓ sö dông ®­îc n÷a. ");
		return
	end
	local szExp = "";
	local nLevel = GetLevel();
	if IB_VERSION == 1 then
		szExp = "NhËn ®­îc <color=yellow>"..floor(1500000*(nLevel^3)/(80^3)).." kinh nghiÖm <color>. ";
	else
		szExp = "NhËn ®­îc <color=yellow>"..floor(2500000*(nLevel^3)/(80^3)).." kinh nghiÖm <color>. ";
	end;	
	Say("Sö dông Bã thï du, b¹n cã thÓ "..szExp.."Sö dông chø?",
		2,
		"§ång ý/give_exp",
		"Hñy bá/nothing")
end

function give_exp()
	if DelItem(2,0,551,1) == 1 then
		local nLevel = GetLevel();
		local nExp = 0;
		if IB_VERSION == 1 then
			nExp = floor(1500000*(nLevel^3)/(80^3));
			ModifyExp(nExp);
			Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		else
			nExp = floor(2500000*(nLevel^3)/(80^3));
			ModifyExp(nExp);
			Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		end;
		WriteLog("[Ho¹t ®éng mõng tiÕt Trïng D­¬ng]:"..GetName().."nhËn ®­îc 1 lÇn th­ëng:"..nExp.." ®iÓm kinh nghiÖm");
		SetTask(TASK_ZYS_NUM,GetTask(TASK_ZYS_NUM)+1);
	end
end