Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
function OnUse(nIndex)
	if tGtTask:check_cur_task(78) ~= 1 then
		DelItem(2,0,30044,GetItemCount(2,0,30044));
		DelItem(2,0,30043,GetItemCount(2,0,300043));
		return 0;
	end
	local nMap,nX,nY = GetWorldPos();
	if nMap ~= 512 then
		Talk(1,"","§¹o cô nµy sö dông trong tÇng 2 Cæ D­¬ng §éng.");
		return 0;
	end
	if GetMapTaskTemp(512,Map_Glb_Valve10) > 6 then
		Talk(1,"","Chiªu dô Thanh Long thÊt b¹i, h·y chê chót råi thö l¹i hoÆc thö t×m n¬i kh¸c trªn b¶n ®å.");
		return 0;
	end
	local tSex = gf_GetPlayerSexName();
	if GetItemCount(2,0,30044) < 9 then
		Talk(1,"",tSex.."Thu thËp kh«ng ®ñ 9 c¸i Thanh Long HuyÕt, kh«ng thÓ chiªu dô Thanh Long.");
		return 0;
	end
	if GetItemCount(2,0,30043) < 1 then
		Talk(1,"","Hµnh trang kh«ng cã Hãa Long §Ønh, h·y hñy bá vµ b¾t ®Çu l¹i.");
		return 0;
	end
	if GetItemCount(2,0,30045) < 1 then
	--if DelItem(2,0,30044,GetItemCount(2,0,30044)) == 1 and DelItem(2,0,30043,GetItemCount(2,0,30043)) == 1 then
		local nNpcIndex = CreateNpc("Thanh Long","Thanh Long",GetWorldPos());
		SetNpcDeathScript(nNpcIndex,"\\script\\task\\npc\\ÇàÁúDeath.lua");
		SetMapTaskTemp(512,Map_Glb_Valve10,GetMapTaskTemp(512,Map_Glb_Valve10)+1);
		SetItemUseLapse(nIndex,18*60*3);
	end
end
