Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
function OnUse(nIndex)
	if tGtTask:check_cur_task(79) ~= 1 then
		return 0;
	end
	local nMap,nX,nY = GetWorldPos();
	if nMap ~= 414 then
		Talk(1,"","§¹o cô chØ dïng trong Phông Nh·n §éng.");
		return 0;
	end
	if GetMapTaskTemp(512,Map_Glb_Valve11) > 6 then
		Talk(1,"","TriÖu håi Th­¬ng ¦ng thÊt b¹i, h·y chê chót råi thö l¹i hoÆc thö t×m n¬i kh¸c trªn b¶n ®å.");
		return 0;
	end
	if GetItemCount(2,0,30023) < 9 then
		Talk(1,"","Long Vò B¹ch §Çu §iªu trong hµnh trang kh«ng ®ñ 9 phÇn, kh«ng t×m thÊy Th­¬ng ¦ng.")
		return 0;
	end
	if GetItemCount(2,0,30046) < 1 then
		Talk(1,"","Hµnh trang kh«ng cã Chiªu ¦ng Phiªn, h·y hñy bá b¾t ®Çu nhËn nhiÖm vô l¹i.");
		return 0;
	end
	if GetItemCount(2,0,30048) >= 1 then
		return 0;
	end
	--if DelItem(2,0,30023,GetItemCount(2,0,30023)) == 1 then
	local nNpcIndex = CreateNpc("Th­¬ng ¦ng","Th­¬ng ¦ng",GetWorldPos());
	SetNpcDeathScript(nNpcIndex,"\\script\\task\\npc\\²ÔÓ¥Death.lua");
	SetMapTaskTemp(512,Map_Glb_Valve11,GetMapTaskTemp(512,Map_Glb_Valve11)+1);
	SetItemUseLapse(nIndex,18*60*3);
	--end
end