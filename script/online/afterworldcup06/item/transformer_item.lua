Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
function OnUse()
	local nMapID = GetWorldPos()
	if nMapID >= 700 then
		Talk(1,"","Khu vùc hiÖn t¹i kh«ng thÓ dïng B¸ch BiÕn TiÓu ThÇn Th«ng");
		return 0;
	end;
	local selTab = {
				"§óng vËy!/confirm",
				"Sau nµy sö dông tiÕp/nothing",
				}
	Say("B¹n x¸c nhËn muèn sö dông B¸ch BiÕn TiÓu ThÇn Th«ng? Sau khi nhÊn x¸c nhËn, B¸ch BiÕn TiÓu ThÇn hoÆc TiÓu Niªn Thó cña b¹n sÏ biÕn mÊt.",getn(selTab),selTab);
end;

function confirm()
	KillFollower();
	AskClientForString("create_pet","",1,14,"Xin nhËp tªn cña nã vµo:");
end;

tModelName = {
		"Thá tr¾ng theo sau",
		"M· HÇu theo sau",
		"Heo rõng nhá theo sau",
		"B¹ch §Çu §iªu theo sau",
		"Tö D¹ Hæ theo sau",
		"H¾c Tinh Tinh theo sau",
		"D¹ Xoa Nha theo sau",
		"KiÕm Hån theo sau",
		}

function create_pet(sName)
	if DelItem(tItemOther["transformer_card"][2],tItemOther["transformer_card"][3],tItemOther["transformer_card"][4],1) == 1 then
		SetTask(TASK_GOTPET_TIME,GetTime());
		SummonNpc(tModelName[random(1,getn(tModelName))],sName);
		Say("Thêi gian tån t¹i cña thó c­ng lµ 30 ngµy (bao gåm thêi gian rêi m¹ng), xin h·y yªu th­¬ng chóng!",0);
	end;
end;

function nothing()

end;