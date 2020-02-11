Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(10,10) == 0 then
		Talk(1,"","Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0;
	end;
	local nLeftTime = GetItemParam(nItemIdx,0);
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_para = GetTask(TASK_WEDDING_FIELD)
	if nLeftTime > 2 or nLeftTime < 0 then
		Talk(1,"","Sè liÖu b¸o lçi, xin liªn hÖ nhµ cung cÊp!");
		WriteLog("[KÕt h«n b¸o lçi]:"..GetName().."Sö dông bao thiÖp mêi b¸o lçi, nLeftTime:"..nLeftTime);
		return 0;
	end;
	add_invitation(10,task_date,task_para);
	SetItemParam(nItemIdx,0,nLeftTime-1);		
	if nLeftTime == 1 then
		DelItemByIndex(nItemIdx,1);
	else
		Msg2Player("B¹n cßn cã thÓ dïng"..(nLeftTime-1).." lÇn bao thiÖp mêi");
	end;
end;