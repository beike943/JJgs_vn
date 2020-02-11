-- ³µ·ò¶Ô»°
function main()
	local nLevel = GetLevel()
	if (nLevel < 10) then
		Say("Ta cã thÓ tøc tèc ®­a ng­¬i ®Õn thµnh kh¸c, ng­¬i muèn ®i ®©u?",3,"BiÖn Kinh/bianjing","Phông T­êng/fengxiang","Kh«ng ®i ®©u c¶/OnCancel")
	else
		Say("Ta cã thÓ tøc tèc ®­a ng­¬i ®Õn thµnh kh¸c, ng­¬i muèn ®i ®©u?",3,"BiÖn Kinh/bianjing","Phông T­êng/fengxiang","Kh«ng ®i ®©u c¶/OnCancel")
	end
	return	
end;


function moneygo()
--	if GetLevel() <10 then 
--		return 1
--	elseif GetCash() >=300 then
--		PrePay(300)
--		return 1
--	else
--		return 0
--	end
	return 1;	--²»ĞèÒªÇ®ÁË
end;


function bianjing()
	n=moneygo()
	if n==0 then 
		Say("Cã tiÒn th× h·y ngåi xe!",0)
	else 
		i=random(1,4)
		if i==1 then
			NewWorld(200, 1501 ,2978)
		elseif i==2 then
			NewWorld(200, 1267,2970)
		else  
			NewWorld(200, 1249 ,2732)
		end
		sl_setrevivalpos(200)
--		UseScrollEnable(1)
	end
end

function chengdu()
	n=moneygo()
	if n==0 then 
		Say("Cã tiÒn th× h·y ngåi xe!",0)
	else 
		i=random(1,3)
--		if i==1 then
--			NewWorld(300, 1896 ,3655)
		if i==2 then
			NewWorld(300, 1677 ,3671)
		elseif i==3 then
			NewWorld(300, 1681 ,3464)
		else 
			NewWorld(300, 1911 ,3442)
		end
		sl_setrevivalpos(300)
--		UseScrollEnable(1)
	end
end




function quanzhou()
	Say("Khu vùc TuyÒn Ch©u t¹m thêi ch­a më. Sau nµy h·y ®Õn nhĞ!",0)
--	n=moneygo()
--	if n==0 then 
--		Say("<color=green>³µ·ò<color>£ºÄãÉíÉÏ´øµÄÂ··Ñ²»¹»£¬ÊÇ²»ÊÇÍüÔÚÎïÆ·±£¹ÜÈËÄÇÀïÄØ£¿",0)
--	else 
--		i=random(1,4)
--		if i==1 then
--			NewWorld(100, 1899 ,3500)
--		elseif i==2 then
--			NewWorld(100, 1521 ,3528)
--		elseif i==3 then
--			NewWorld(100, 1638 ,3217)
--		else 
--			NewWorld(100, 1888 ,3351)
--		end
--		UseScrollEnable(1)
--	end
end


function xiangyang()
	n=moneygo()
	if n==0 then 
		Say("Cã tiÒn th× h·y ngåi xe!",0)
	else 
		i=random(1,4)
		if i==1 then
			NewWorld(350, 1518 ,3050)
		elseif i==2 then
			NewWorld(350, 1362 ,3053)
		elseif i==3 then
			NewWorld(350, 1332 ,2865)
		else 
			NewWorld(350, 1542 ,2865)
		end
		sl_setrevivalpos(350)
--		UseScrollEnable(1)
	end
end

function yangzhou()
	n=moneygo()
	if n==0 then 
		Say("Cã tiÒn th× h·y ngåi xe!",0)
	else 
		i=random(1,4)
		if i==1 then
			NewWorld(150, 1383 ,2752)
		elseif i==2 then
			NewWorld(150, 1383 ,2752)
		elseif i==3 then
			NewWorld(150, 1383 ,2752)
		else 
			NewWorld(150, 1383 ,2752)
		end
		sl_setrevivalpos(150)
--		UseScrollEnable(1)
	end
end


function fengxiang()
	n=moneygo()
	if n==0 then 
		Say("Cã tiÒn th× h·y ngåi xe!",0)
	else 
		i=random(1,4)
		if i==1 then
			NewWorld(500,1846,3062)
		elseif i==2 then
			NewWorld(500,1804,3225)
		elseif i==3 then
			NewWorld(500,1675,3198)
		else 
			NewWorld(500,1668,3096)
		end
--		UseScrollEnable(1)
	end
end

function dali()
	Say("Khu vùc §¹i Lı t¹m thêi ch­a më. Sau nµy h·y ®Õn nhĞ!",0)
--	n=moneygo()
--	if n==0 then 
--		Say("<color=green>³µ·ò<color>£ºÄãÉíÉÏ´øµÄÂ··Ñ²»¹»£¬ÊÇ²»ÊÇÍüÔÚÎïÆ·±£¹ÜÈËÄÇÀïÄØ£¿",0)
--	else 
--		i=random(1,4)
--		if i==1 then
--			NewWorld(400, 1383 ,2752)
--		elseif i==2 then
--			NewWorld(400, 1383 ,2752)
--		elseif i==3 then
--			NewWorld(400, 1383 ,2752)
--		else 
--			NewWorld(400, 1383 ,2752)
--		end
--		UseScrollEnable(1)
--	end
end;

function OnCancel()
end;

function sl_setrevivalpos(mapid)
	SetPlayerRevivalPos(mapid, mapid)
end