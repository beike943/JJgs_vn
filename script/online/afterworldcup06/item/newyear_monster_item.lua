Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
function OnUse()
	local nMapID = GetWorldPos()
	if nMapID >= 700 then
		Talk(1,"","Khu vùc hiÖn t¹i kh«ng thÓ dïng TiÓu Niªn Thó phï");
		return 0;
	end;
	local selTab = {
				"§óng vËy!/confirm",
				"Sau nµy sö dông tiÕp/nothing",
				}
	Say("B¹n x¸c nhËn muèn dïng TiÓu Niªn Thó Phï? Sau khi nhÊn x¸c nhËn B¸ch BiÕn TiÓu ThÇn Th«ng hoÆc TiÓu Niªn Thó cña b¹n sÏ mÊt ®i.",getn(selTab),selTab);
end;

function confirm()
	KillFollower();
	AskClientForString("create_pet","",1,14,"Xin nhËp tªn cña nã vµo:");
end;

function create_pet(sName)
	if DelItem(tItemOther["monster_card"][2],tItemOther["monster_card"][3],tItemOther["monster_card"][4],1) == 1 then
		SetTask(TASK_GOTPET_TIME,GetTime());
		SummonNpc("TiÓu Kú L©n",sName);
		Say("Thêi gian tån t¹i cña thó c­ng lµ 30 ngµy (bao gåm thêi gian rêi m¹ng), xin h·y yªu th­¬ng chóng!",0);
	end;
end;

function nothing()

end;