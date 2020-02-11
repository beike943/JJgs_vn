---¶«º£º£±õ2´¬·ò.lua---
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua");
function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>ThuyÒn Phu<color> vÞ %s nµy muèn ®i ®©u?",sName),3,"§­a ta ®i!/taohuadao","§Õn T©y §¶o (miÔn phÝ)/xidao","Kh«ng cÇn ®©u!/no");
end;
function taohuadao()
	n=moneygo()
	if n==0 then 
		Talk(1,"","Cã tiÒn nhí quay l¹i nhÐ!")
	else 
		NewWorld(102,1459,3163);
	end
end

function moneygo()
	if GetCash() >=1000 then
		PrePay(1000)
		return 1
	else
		return 0
	end
end;

function xidao()
	if IsHaveTaskOrCanGet2(60, 62) == 1 then
		NewWorld(6014,1536,3291)
		SetFightState(1)
		return 1;
	end
	Talk(1,"","c¸c h¹ kh«ng thÓ vµo khu vùc nµy.");
end

function no()
end;