-- ¶ÁÈëËæ»úÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\random\\task_head.lua");

function OnUse()
	-- Èç¹û»¹Ã»ÓĞÈëÃÅÅÉ¾Í²»´¥·¢ÁË
	if GetPlayerFaction()==0 then
		
		Msg2Player("B¹n ch­a gia nhËp m«n ph¸i, kh«ng thÓ nhËn nhiÖm vô ngÉu nhiªn!");
		return
	
	end;
	
	CreateTask();
	RandomTaskTip("B¹n nhËn ®­îc 1 nhiÖm vô ngÉu nhiªn!");
	
end;
