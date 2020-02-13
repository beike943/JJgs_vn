
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理车夫脚本
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
		Say("我们免费送等级小于 <color=yellow>15级<color>, 的新手玩家",
		3,
		"成都/chengdu",
		"泉州/quanzhou",
		"哥只是看看，哪儿也不想去！/no")
	else
		Say("坐一趟车要花费 <color=yellow>"..szTransportPrice.."金币<color> 你确定要坐吗？",
		7,
		"成都("..szTransportPrice.."金币)/chengdu",
		"泉州 ("..szTransportPrice.."金币)/quanzhou",
		"襄阳("..szTransportPrice.."金币)/xiangyang",
		"扬州("..szTransportPrice.."金币)/yangzhou",
		"凤翔("..szTransportPrice.."金币)/fengxiang",
		"大理("..szTransportPrice.."金币)/dali",
		"哥只是看看，哪儿也不想去！/no")
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
		Talk(1,"","C? ti襫 th? h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(200, 1501 ,2978)
		elseif i==2 then
			NewWorld(200, 1267,2970)
		else  
			NewWorld(200, 1249 ,2732)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end

function chengdu()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C? ti襫 th? h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
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
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end




function quanzhou()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C? ti襫 th? h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,3)
		if i==1 then
			NewWorld(100, 1521 ,2870)
		elseif i==2 then
			NewWorld(100, 1386 ,2905)
		else 
			NewWorld(100, 1555 ,3080)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end


function xiangyang()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C? ti襫 th? h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
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
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end

function yangzhou()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C? ti襫 th? h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
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
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end


function fengxiang()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C? ti襫 th? h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(500, 1383 ,2752)
		elseif i==2 then
			NewWorld(500, 1383 ,2752)
		elseif i==3 then
			NewWorld(500, 1383 ,2752)
		else 
			NewWorld(500, 1383 ,2752)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end

function dali()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C? ti襫 th? h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,3)
		if i==1 then
			NewWorld(400, 1567 ,3117)
		elseif i==2 then
			NewWorld(400, 1434 ,3109)
		else
			NewWorld(400, 1579 ,2883)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end;

function no()
end;


