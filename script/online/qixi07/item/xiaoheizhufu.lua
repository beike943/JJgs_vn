--08Èý°Ë½ÚÐ¡ºÚÖí·û½Å±¾
--by vivi
--2008/03/03

TASK_SANBA_PETTIME = 2407; --¸ú³èÊ±¼ä

function OnUse()
	local nMapID = GetWorldPos()
	if nMapID >= 700 then
		Talk(1,"","N¬i nµy hiÖn kh«ng thÓ sö dông TiÓu h¾c tr­ phï");
		return 0;
	end;
	local selTab = {
				"§óng vËy!/confirm",
				"Sau nµy sö dông tiÕp/nothing",
				}
	Say("Muèn sö dông TiÓu h¾c tr­ phï kh«ng? Sau khi x¸c nhËn, b¹n sÏ mÊt thó nu«i hiÖn t¹i.",getn(selTab),selTab);
end;

function confirm()
	KillFollower();
	AskClientForString("create_pet","",1,14,"Xin nhËp tªn cña nã vµo:");
end;

function create_pet(sName)
	local nSex = GetSex();
	local sPetName = "";
	if nSex == 1 then
		sPetName = "TiÓu H¾c tr­ (mÑ)";
	else
		sPetName = "TiÓu H¾c tr­ (bè)";
	end
		
	if DelItem(2,0,619,1) == 1 then
		SetTask(TASK_SANBA_PETTIME,GetTime());
		SummonNpc(sPetName,sName);
		Say("Thêi gian tån t¹i cña thó c­ng lµ 24 giê (bao gåm thêi gian rêi m¹ng), xin h·y yªu th­¬ng chóng!",0);
	end;
end;

function nothing()

end;