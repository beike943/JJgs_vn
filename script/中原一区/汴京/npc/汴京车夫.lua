
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 成都车夫脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

--Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\lib\\transport_head.lua")

function main()

--	local nState = TE_GetTeachState()
--	local nLevel = GetLevel()
	
--	if (nState==8) then
--	
--		task_008();
--		return
		
--	else
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
		Say("车夫: <color=yellow>15级<color>以下的新手，我可以免费送你到其它新手城市。请问你要去那里?",
		3,
		"成都/chengdu",
		"泉州/quanzhou",
		"我哪里都不去/no")
	else
		Say("车夫:我可以快速送你到其它城市，车费 <color=yellow>"..szTransportPrice.."银<color>，请问你要去那里? ",
		7,
		"成都 ("..szTransportPrice.."银)/chengdu",
		"泉州 ("..szTransportPrice.."银)/quanzhou",
		"襄阳 ("..szTransportPrice.."银)/xiangyang",
		"扬州 ("..szTransportPrice.."银)/yangzhou",
		"凤翔 ("..szTransportPrice.."银)/fengxiang",
		"大理("..szTransportPrice.."银)/dali",
		"我哪里都不去/no")
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
		Talk(1,"","把钱放在车里！")
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
		Talk(1,"","把钱放在车里！")
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
		Talk(1,"","把钱放在车里！")
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
		Talk(1,"","把钱放在车里！")
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
		Talk(1,"","把钱放在车里！")
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
		Talk(1,"","把钱放在车里！")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
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
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end;

function dali()
	n=moneygo()
	if n==0 then 
		Talk(1,"","把钱放在车里！")
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


