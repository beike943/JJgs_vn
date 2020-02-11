Include("\\script\\½á»é\\marriage_head.lua");

MAX_USE = 10;

function OnUse(nItemIdx)
	if in_fields() ~= 1 then
		Talk(1,"","ë khu vùc kÕt h«n míi dïng ®­îc kÑo mõng.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_EAT_XITANG_DATE) < nDate then
		SetTask(TASK_EAT_XITANG_COUNT,0);
		SetTask(TASK_EAT_XITANG_DATE,nDate);
	end;
	local selTab = {
				format("§ång ý/#eat(%d)",nItemIdx),
				"Hñy bá",
				}
	local nLevel = GetLevel();
	local nExp = nLevel^2*15;
	local nLeft = MAX_USE - GetTask(TASK_EAT_XITANG_COUNT);
	if nLeft <= 0 then
		Talk(1,"","H«m nay b¹n ®· dïng <color=yellow>"..MAX_USE.."<color> viªn kÑo mõng, xin ®Ó lÇn sau dïng tiÕp!");
		return 0;
	end;
	Say("§¼ng cÊp hiÖn t¹i cã thÓ nhËn ®­îc <color=yellow>"..nExp.."<color> ®iÓm kinh nghiÖm. H«m nay b¹n cßn dïng ®­îc <color=yellow>"..nLeft.."<color> viªn kÑo mõng, muèn dïng kh«ng?",getn(selTab),selTab);
end;

function eat(nItemIdx) 
	local nEatedCount = GetTask(TASK_EAT_XITANG_COUNT)
	if nEatedCount >= MAX_USE then
		Talk(1,"","H«m nay b¹n ®· dïng <color=yellow>"..MAX_USE.."<color> viªn kÑo mõng, xin ®Ó lÇn sau dïng tiÕp!");
		return 0;
	end;
	local nLevel = GetLevel();
	local nExp = nLevel^2*15;
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyExp(nExp);
		SetTask(TASK_EAT_XITANG_COUNT,nEatedCount+1);
		WriteLog("[KÕt h«n]:"..GetName().."Sö dông 1 viªn kÑo mõng, t¨ng"..nExp.." ®iÓm kinh nghiÖm")
	end;
end;