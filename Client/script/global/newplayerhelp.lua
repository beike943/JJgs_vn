-- file:rescue.lua
-- by:Xsjcs
-- CreateDate: 2005-4-22
--  GetWorldTempTask(0)  记录时间hour
--  GetWorldTempTask(1)  记录城市领取次数  (这个服务器)
--  GetTask(250)    记录当前人物1小时内是否有领过救济品
--  赈济新手：钦差大臣每1小时出现在三大城市，每次一共发100个救济品。每个20级以下的新手每次只能领取一个。每个大臣处领取没有限制。


function newplayer_help()
	if (GetLevel() >= 20) then 
		Say("钦差大臣：本官到此赈济新人，是奉了圣上钧旨，尔等20级以上的玩家，也宜从旁协助，四处宣扬为上",0)
	else 
		Say("钦差大臣：本官奉圣上钧旨，到此赈济20级以下的新人。经认真核查，你确系一名新人，有领取救济的资格。",3,"大人英明，请这就发送救济品给我吧/present","请大人明示如何领取救济/abouthelpgoods","我不需要领取救济/no")
	end;
end;

function abouthelpgoods()
	Say("钦差大臣：我等同僚三人，奉圣上钧旨，分别驻扎在汴京、成都、泉州三大城市，专门发放物品救济20级以下的新人。每隔1小时发放一次，每次发放100份救济品，早到早得，你多加留意必有收获。",0)
end;



function present()

	local nNowTime = GetWorldTempTask(0)	--服务器全局变量
	local nQuantity = GetWorldTempTask(1) 	--服务器全局变量
	local Utask250 = GetTask(250)	
	local nHour = tonumber( date( "%m%d%H" ) )	--当前时间记录

	if ( nNowTime ~= nHour ) then
		SetWorldTempTask(0,nHour)	--开启时间记录
		SetWorldTempTask(1,0)		--可领取数量清零
		AddLocalNews("* * *皇恩浩荡，特派钦差大臣在三大城市广布钱粮。凡等级在20以下的新人都可以去领取，总量有限，先到先得。* * *")
	end
	nNowTime = GetWorldTempTask(0)
	nQuantity = GetWorldTempTask(1)
	if ( Utask250 ~= nNowTime and nQuantity < 100 ) then
		onTake()
		SetWorldTempTask(1,nQuantity+1)
		SetTask(250,nNowTime)
--		Msg2Player("AddItem 1,total = " ..nQuantity + 1)
	elseif ( Utask250 == nNowTime ) then
		Say("钦差大臣：唉，人心苦不足，你已经领取了一份救济，还是让些机会给别人吧。",0)
	else
		Say("钦查大臣：唉，僧多粥少，救济的钱粮眨眼就被一抢而空，本官也是爱莫能助啊，还是请一个小时后再来试试运气吧",0)
	end		

end

function onTake()

  	i = random(1,54)
	if ( i == 1 ) then
		Earn(10)
		Msg2Player("你从钦差大臣那里领取了10个铜钱的救济！")
	elseif ( i == 2 ) then
		Earn(50)
		Msg2Player("你从钦差大臣那里领取了50个铜钱的救济！")
	elseif ( i == 3 ) then
		Earn(100)
		Msg2Player("你从钦差大臣那里领取了1两银子的救济！")
	elseif ( i == 4 ) then
		Earn(200)
		Msg2Player("你从钦差大臣那里领取了2两银子的救济！")
	elseif ( i == 5 ) then
		AddItem(1,2,1,2)
		Msg2Player("你从钦差大臣那里领取了两份藏红花！")
	elseif ( i == 6 ) then
		AddItem(1,2,2,2)
		Msg2Player("你从钦差大臣那里领取了两份桔梗！")
	elseif ( i == 7 ) then
		AddItem(1,2,3,2)
		Msg2Player("你从钦差大臣那里领取了两份黄连！")
	elseif ( i == 8 ) then
		AddItem(1,2,8,2)
		Msg2Player("你从钦差大臣那里领取了两份巴豆！")
	elseif ( i == 9 ) then
		AddItem(1,2,9,2)
		Msg2Player("你从钦差大臣那里领取了两份蝉蜕！")
	elseif ( i == 10 ) then
		AddItem(2,2,1,2)
		Msg2Player("你从钦差大臣那里领取了两份精铁！")
	elseif ( i == 11 ) then
		AddItem(2,2,2,2)
		Msg2Player("你从钦差大臣那里领取了两份百炼钢！")
	elseif ( i == 12 ) then
		AddItem(1,2,1,2)
		Msg2Player("你从钦差大臣那里领取了两份藏红花！")
	elseif ( i == 13 ) then
		AddItem(2,2,9,2)
		Msg2Player("你从钦差大臣那里领取了两份重木！")
	elseif ( i == 14 ) then
		AddItem(2,2,10,2)
		Msg2Player("你从钦差大臣那里领取了两份铁樟木！")
	elseif ( i == 15 ) then
		AddItem(2,2,15,2)
		Msg2Player("你从钦差大臣那里领取了两份狼皮！")
	elseif ( i == 16 ) then
		AddItem(2,2,16,2)
		Msg2Player("你从钦差大臣那里领取了两份虎皮！")
	elseif ( i == 17 ) then
		AddItem(2,2,21,2)
		Msg2Player("你从钦差大臣那里领取了两份黑锦！")
	elseif ( i == 18 ) then
		AddItem(2,2,22,2)
		Msg2Player("你从钦差大臣那里领取了两份织锦！")
	elseif ( i == 19 ) then
		AddItem(1,3,1,2)
		Msg2Player("你从钦差大臣那里领取了两份兔肉！")
	elseif ( i == 20 ) then
		AddItem(1,3,2,2)
		Msg2Player("你从钦差大臣那里领取了两份鸡肉！")
	elseif ( i == 21 ) then
		AddItem(1,3,9,2)
		Msg2Player("你从钦差大臣那里领取了两份光通麻！")
	elseif ( i == 22 ) then
		AddItem(1,3,10,2)
		Msg2Player("你从钦差大臣那里领取了两份倾篱豆！")
	elseif ( i == 23 ) then
		AddItem(1,0,1,2)
		Msg2Player("你从钦差大臣那里领取了两份绷带！")
	elseif ( i == 24 ) then
		AddItem(1,0,2,2)
		Msg2Player("你从钦差大臣那里领取了两份金创散！")
	elseif ( i == 25 ) then
		AddItem(1,0,3,2)
		Msg2Player("你从钦差大臣那里领取了两份止血散！")
	elseif ( i == 26 ) then
		AddItem(1,0,7,2)
		Msg2Player("你从钦差大臣那里领取了两份小还丹！")
	elseif ( i == 27 ) then
		AddItem(1,0,12,2)
		Msg2Player("你从钦差大臣那里领取了两份清心散！")
	elseif ( i == 28 ) then
		AddItem(1,1,1,2)
		Msg2Player("你从钦差大臣那里领取了两份窝头！")
	elseif ( i == 29 ) then
		AddItem(1,1,2,2)
		Msg2Player("你从钦差大臣那里领取了两份饭团！")
	elseif ( i == 30 ) then
		AddItem(2,5,1,2)
		Msg2Player("你从钦差大臣那里领取了两份鉴定符！")
	elseif ( i == 31 ) then
		AddItem(2,5,2,2)
		Msg2Player("你从钦差大臣那里领取了两份鉴定符！")
	elseif ( i == 32 ) then
		AddItem(2,4,1,1)
		Msg2Player("你从钦差大臣那里领取了一颗阴爻石！")
	elseif ( i == 33 ) then
		AddItem(2,4,8,1)
		Msg2Player("你从钦差大臣那里领取了一颗阳爻石！")
	elseif ( i == 34 ) then
		AddItem(1,5,1,2)
		Msg2Player("你从钦差大臣那里领取了两张汴京土地符！")
	elseif ( i == 35 ) then
		AddItem(1,5,2,2)
		Msg2Player("你从钦差大臣那里领取了两张成都土地符！")
	elseif ( i == 36 ) then
		AddItem(0,107,31,1)
		Msg2Player("你从钦差大臣那里领取了一本长拳谱！")
	elseif ( i == 37 ) then
		AddItem(0,2,14,1)
		Msg2Player("你从钦差大臣那里领取了一柄侠少剑！")
	elseif ( i == 38 ) then
		AddItem(0,2,15,1)
		Msg2Player("你从钦差大臣那里领取了一柄松纹剑！")
	elseif ( i == 39 ) then
		AddItem(0,5,27,1)
		Msg2Player("你从钦差大臣那里领取了一柄侠少棍！")
	elseif ( i == 40 ) then
		AddItem(0,5,28,1)
		Msg2Player("你从钦差大臣那里领取了一柄齐眉棍！")
	elseif ( i == 41 ) then
		AddItem(0,1,40,1)
		Msg2Player("你从钦差大臣那里领取了一柄侠少暗器！")
	elseif ( i == 42 ) then
		AddItem(0,1,41,1)
		Msg2Player("你从钦差大臣那里领取了一堆五光石！")
	elseif ( i == 43 ) then
		AddItem(0,3,53,1)
		Msg2Player("你从钦差大臣那里领取了一柄戒刀！")
	elseif ( i == 44 ) then
		AddItem(0,10,64,1)
		Msg2Player("你从钦差大臣那里领取了一张玉韵琴！")
	elseif ( i == 45 ) then
		AddItem(0,9,75,1)
		Msg2Player("你从钦差大臣那里领取了一支判官笔！")
	elseif ( i == 46 ) then
		AddItem(0,8,86,1)
		Msg2Player("你从钦差大臣那里领取了一柄锡杖！")
	elseif ( i == 47 ) then
		AddItem(0,100,1,1)
		Msg2Player("你从钦差大臣那里领取了一件侠少布衣！")
	elseif ( i == 48 ) then
		AddItem(0,100,2,1)
		Msg2Player("你从钦差大臣那里领取了一件黑皂布衣！")
	elseif ( i == 49 ) then
		AddItem(0,100,19,1)
		Msg2Player("你从钦差大臣那里领取了一件侠少衣！")
	elseif ( i == 50 ) then
		AddItem(0,100,20,1)
		Msg2Player("你从钦差大臣那里领取了一件铁护肩！")
	elseif ( i == 51 ) then
		AddItem(0,100,37,1)
		Msg2Player("你从钦差大臣那里领取了一件彩裳！")
	elseif ( i == 52 ) then
		AddItem(0,100,38,1)
		Msg2Player("你从钦差大臣那里领取了一件紫菱裳！")
	elseif ( i == 53 ) then
		AddItem(0,100,55,1)
		Msg2Player("你从钦差大臣那里领取了一件羽裳！")
	else 
		AddItem(0,100,56,1)
		Msg2Player("你从钦差大臣那里领取了一件红云裳！")
	end
end

function no()
	Say("钦差大臣：少侠这份志气本官十分欣赏，祝你一路顺风！",0)
end
