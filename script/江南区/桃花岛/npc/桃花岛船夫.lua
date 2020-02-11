---ÌÒ»¨µº´¬·ò.lua---
function main()
	Say("Kh¸ch quan cã muèn rêi khái ®¶o?",2,"Rêi khái §µo Hoa ®¶o (10 l­îng)/likaitaohuadao","Muèn ë l¹i ®¶o/no");
end;
function likaitaohuadao()
	n=moneygo()
	if n==0 then 
		Talk(1,"","Cã tiÒn nhí quay l¹i nhĞ!")
	else 
		NewWorld(104,1568,2975);
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

function no()
end;