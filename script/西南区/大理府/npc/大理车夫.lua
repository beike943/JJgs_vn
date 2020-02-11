
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀí³µ·ò½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================
Include("\\script\\lib\\transport_head.lua")

function main()

	local szTransportPrice = ""

	if GetLevel() >= 15 and GetLevel() < 73 then
		szTransportPrice = tTransportPrice[6][1]
	elseif GetLevel() >= 73 and GetLevel() < 80 then
		szTransportPrice = tTransportPrice[7][1]
	elseif GetLevel() >= 80 and GetLevel() < 90 then
		szTransportPrice = tTransportPrice[8][1]
	elseif GetLevel() >= 90 then
		szTransportPrice = tTransportPrice[9][1]
	end

	if GetLevel() < 15 then
		Say("Ta sÏ ®­a ®i miÔn phÝ cho t©n thñ d­íi <color=yellow>cÊp 15<color>, xin hái kh¸ch quan muèn ®i ®©u?",
		4,
		"Thµnh §«/chengdu",
		"TuyÒn Ch©u/quanzhou",
		"BiÖn Kinh/bianjing",
		"Kh«ng ®i ®©u c¶/no")
	else
		Say("Lé phÝ chØ cã <color=yellow>"..szTransportPrice.." l­îng<color> th«i, ng­¬i muèn ®i ®©u?",
		7,
		"Thµnh §« ("..szTransportPrice.." l­îng)/chengdu",
		"TuyÒn Ch©u ("..szTransportPrice.." l­îng)/quanzhou",
		"BiÖn Kinh ("..szTransportPrice.." l­îng b¹c)/bianjing",
		"T­¬ng D­¬ng ("..szTransportPrice.." l­îng)/xiangyang",
		"D­¬ng Ch©u ("..szTransportPrice.." l­îng)/yangzhou",
		"Phông T­êng ("..szTransportPrice.." l­îng b¹c)/fengxiang",
		"Kh«ng ®i ®©u c¶/no")
	return
	end	
end

function moneygo()

	local nTransportPrice = 0
	if GetLevel() >= 15 and GetLevel() < 73 then
		nTransportPrice = tTransportPrice[6][2]
	elseif GetLevel() >= 73 and GetLevel() < 80 then
		nTransportPrice = tTransportPrice[7][2]
	elseif GetLevel() >= 80 and GetLevel() < 90 then
		nTransportPrice = tTransportPrice[8][2]
	elseif GetLevel() >= 90 then
		nTransportPrice = tTransportPrice[9][2]
	end
	
	if GetLevel() <15 then 
		return 1
	elseif GetCash() >=nTransportPrice then
		PrePay(nTransportPrice)
		return 1
	else
		return 0
	end
end;



function bianjing()
	n=moneygo()
	if n==0 then 
		Talk(1,"","Cã tiÒn th× h·y ngåi xe!")
	else 
		CleanInteractive();	--½â³ýÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(200, 1501 ,2978)
		elseif i==2 then
			NewWorld(200, 1267,2970)
		else  
			NewWorld(200, 1249 ,2732)
		end
		SetFightState(0); --»»³ÇÉèÖÃÆäÕ½¶·×´Ì¬ÎªºÍÆ½Ä£Ê½ added by vivi 2008-06-03
	end
end

function chengdu()
	n=moneygo()
	if n==0 then 
		Talk(1,"","Cã tiÒn th× h·y ngåi xe!")
	else 
		CleanInteractive();	--½â³ýÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
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
		SetFightState(0); --»»³ÇÉèÖÃÆäÕ½¶·×´Ì¬ÎªºÍÆ½Ä£Ê½ added by vivi 2008-06-03
	end
end




function quanzhou()
	n=moneygo()
	if n==0 then 
		Talk(1,"","Cã tiÒn th× h·y ngåi xe!")
	else 
		CleanInteractive();	--½â³ýÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
		i=random(1,3)
		if i==1 then
			NewWorld(100, 1521 ,2870)
		elseif i==2 then
			NewWorld(100, 1386 ,2905)
		else 
			NewWorld(100, 1555 ,3080)
		end
		SetFightState(0); --»»³ÇÉèÖÃÆäÕ½¶·×´Ì¬ÎªºÍÆ½Ä£Ê½ added by vivi 2008-06-03
	end
end


function xiangyang()
	n=moneygo()
	if n==0 then 
		Talk(1,"","Cã tiÒn th× h·y ngåi xe!")
	else 
		CleanInteractive();	--½â³ýÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
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
		SetFightState(0); --»»³ÇÉèÖÃÆäÕ½¶·×´Ì¬ÎªºÍÆ½Ä£Ê½ added by vivi 2008-06-03
	end
end

function yangzhou()
	n=moneygo()
	if n==0 then 
		Talk(1,"","Cã tiÒn th× h·y ngåi xe!")
	else 
		CleanInteractive();	--½â³ýÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(150, 1724 ,3075)
		elseif i==2 then
			NewWorld(150, 1630 ,3050)
		elseif i==3 then
			NewWorld(150, 1615 ,3175)			
		else 
			NewWorld(150, 1757 ,3179)
		end
		SetFightState(0); --»»³ÇÉèÖÃÆäÕ½¶·×´Ì¬ÎªºÍÆ½Ä£Ê½ added by vivi 2008-06-03
	end
end

function dali()
	n=moneygo()
	if n==0 then 
		Talk(1,"","Cã tiÒn th× h·y ngåi xe!")
	else 
		CleanInteractive();	--½â³ýÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
		i=random(1,3)
		if i==1 then
			NewWorld(400, 1567 ,3117)
		elseif i==2 then
			NewWorld(400, 1434 ,3109)
		else
			NewWorld(400, 1579 ,2883)
		end
		SetFightState(0); --»»³ÇÉèÖÃÆäÕ½¶·×´Ì¬ÎªºÍÆ½Ä£Ê½ added by vivi 2008-06-03
	end
end;

function fengxiang()
	n=moneygo()
	if n==0 then 
		Talk(1,"","Cã tiÒn th× h·y ngåi xe!")
	else 
		CleanInteractive();	--½â³ýÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(500, 1846 ,3043)
		elseif i==2 then
			NewWorld(500, 1800 ,3229)
		elseif i==3 then
			NewWorld(500, 1659 ,3090)
		else
			NewWorld(500, 1664 ,3226)
		end
		SetFightState(0); --»»³ÇÉèÖÃÆäÕ½¶·×´Ì¬ÎªºÍÆ½Ä£Ê½ added by vivi 2008-06-03
	end
end;

function no()
end;


