--ÌìÃÅÓ¢ĞÛÈ¯
Include("\\script\\lib\\globalfunctions.lua")

g_COLLECT_COAT_ID = 1;

function OnUse()
	Say("Sö dông 30 [PhiÕu Thiªn M«n anh hïng] cã thÓ nhËn ®­îc 1 bé Thiªn M«n ngo¹i trang vÜnh viÔn, sö dông kh«ng?",
		2,
		"\n sö dông/confirm_use",
		"\n kh«ng cã g×/gf_DoNothing")
end

function confirm_use()
	if GetItemCount(2,95,691) < 30 then
		Talk(1,"","C¸c h¹ mang theo [PhiÕu Thiªn M«n anh hïng] kh«ng ®ñ 30");
		return 0;
	end
	local tIndex = {115,116,117};
	local bCheck = 0;
	for i=1,getn(tIndex) do
		if GetPlayerCollectionData(g_COLLECT_COAT_ID, tIndex[i]) ~= 1 then
			bCheck = 1;
			break
		end
	end

	if bCheck ~= 1 then
		Talk(1, "", "C¸c h¹ ®· cã ngo¹i trang nµy råi.");
		return 0;
	end	
	if DelItem(2,95,691,30) == 1 then
		for i=1,getn(tIndex) do
			if SetPlayerCollectionData(g_COLLECT_COAT_ID, tIndex[i], 1) ~= 1 then
				WriteLog(format("[PhiÕu Thiªn M«n anh hïng] [SetPlayerCollectionData] [Failed] [Acc: %s] [Role: %s] [Collection: %d, %d]", GetAccount(), GetName(), g_COLLECT_COAT_ID, tIndex[i]));
			end
		end		
		Talk(1,"","Gia t¨ng thµnh c«ng, h·y kiÓm tra t¹, <color=yellow>“Hép Ngù Huyªn Thiªn BiÕn”<color>.");
	end
end