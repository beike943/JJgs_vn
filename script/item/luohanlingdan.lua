--ÂÞººÁéµ¤£ºÔö¼Ó1~5£¥µ±Ç°¾­Ñé£¬×î´ó²»³¬¹ý50Íòµã
function OnUse()

local PlayerExpAdd = floor(random(1,5)*0.01*GetExp());
	
	if PlayerExpAdd == 0 then 
		ModifyExp(1);
		DelItem(2,0,136,1,1);
		Say("B¹n ®· sö dông 1 viªn La H¸n Linh ®¬n, t¨ng thªm <color=yellow>1<color> ®iÓm kinh nghiÖm!",0);
		return 
	elseif PlayerExpAdd<= 500000 then
		ModifyExp(PlayerExpAdd);
		DelItem(2,0,136,1,1);
		Say("B¹n ®· sö dông 1 viªn La H¸n Linh ®¬n, t¨ng thªm <color=yellow>"..PlayerExpAdd.."<color> ®iÓm kinh nghiÖm!",0);
		return 
	else
		ModifyExp(500000);
		DelItem(2,0,136,1,1);
		Say("B¹n ®· sö dông 1 viªn La H¸n Linh ®¬n, t¨ng thªm <color=yellow>500000<color> ®iÓm kinh nghiÖm!",0);
		return
		
	end;
		
end;
