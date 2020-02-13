Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\vng\\config\\newserver.lua");
---------------------------------------------------------
--	帮会介绍人
--	帮会的接口人 - Jeep tag
---------------------------------------------------------

function main()
--	Talk(1,"","Ta 產ng trong giai 畂筺 ngh? ng琲, ngi h穣 quay l筰 sau nh?.")
--	do	return	end
	local nDate = tonumber(date("%Y%m%d"))
	if tbGioiHanBangHoi[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanBangHoi[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"","现在还没到开放的时候，请稍后再来！");	
			do	return	end
		end
	end
	local bWantCreateTong = GetTask(297)
	local bWantDestoryTong = GetTask(295)
	
	local bIsTongMember = IsTongMember()	-- 是帮会成员的话，就把建立帮会的条件干掉，不让他搞了！！！
	if (bIsTongMember == 1) then
		bWantCreateTong = 0;
		SetTask(297, 0)
	end
	
	-- <bWantDestoryTong == 1>表示玩家已经到帮会介绍人处申请解散帮会，来这里申请
	-- <bWantDestoryTong == 2>表示玩家已经在这里申请过解散帮会，又来骚扰金山掌门人了
	-- <bWantDestoryTong == 3>表示金山掌门人已经答应了解散帮会的申请
	
	-- <bWantCreateTong == 1>表示玩家已经到帮会介绍人处申请建立帮会，来这里申请
	-- <bWantCreateTong == 2>表示玩家已经获得了金山掌门人的认可，得到了(会盟令牌)
	
-- 解散帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------
	if ((bWantDestoryTong == 1) or (bWantDestoryTong == 2)) then	-- 已经申请了解散帮会，但是还没有得到金山掌门人的最后确认
		Say("已申请解散帮会，请等待金山掌门人的同意后即可解散帮会。", 0)
		return
	end
	
	if (bWantDestoryTong == 3) then		-- 金山掌门人已经同意了解散帮会呢
		SetTask(295, 0)
		SetTask(296, 0)
		SetTask(297, 0)
		Talk(1,"","金山掌门人已经同意了，帮会正式解散！今后大家各走各家，各找各妈。")
		DestroyTong()
		return
	end
	
-- 解散帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------

-- 建立帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------	
	if (bWantCreateTong == 1) then		-- 已经申请了建立帮会，还没有得到掌门人的最后同意
		Talk(1,"","建立帮会的请求已经提交，请等待金山掌门人的同意。")
		return
	end
	
	if (bWantCreateTong == 2) then		-- 已经搞到了会盟令牌
		Say("很好！金山掌门人那老头子终于同意了，你现在已经拥有了一个帮会。",
		    1,
		    "麻烦你了，能帮我建立一个帮会吗？/create_tong_formally")
		return
	end
-- 建立帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------


	--闲聊
	Say("找我有什么事吗？",
	    6,
	    "建立帮会需要什么条件?/introduce_about_create_tong",
	    "是不是高级别的帮会可以获得特别的奖励？/introduce_about_population",
	    "我想要建立一个帮会，然后召集天下英雄加入！/apply_create_tong_normal",
	    "我想升级我们帮会的实力/apply_level_up_tong",
	    "我想解散这个帮会，归隐山林。/apply_destroy_tong_normal",
	    "没什么，只是随便看看。/chat_xxx")
end;



-- 真的可以建立帮会了，收了钱，有令牌就马上帮你办手续
function create_tong_formally()
	local bCardIsExist = GetItemCount(2,0,125)  -- 是否有会盟令牌
	if (bCardIsExist < 1) then
		Say("准备好<color=yellow>建立<color>帮会了吗？", 0)
		return
	end
        if GetItemCount(2, 0, 555) < 1 then
            Say("<color=green>帮派介绍人<color>:建立帮会<color=yellow>需要<color>, 有会盟令牌。", 0);
            return
        end

	local nMoney = GetCash()	--获得身上的钱
	if (nMoney < 5000000) then	-- 够钱
		Talk(1,"","<color=green>帮派介绍人<color>:建立帮会需要花费500金币，有钱再来没钱走开！")
		return
	end
        if GetReputation() < 1000 then
            Say("<color=green>帮派介绍人<color>:建立帮会还需要<color=yellow>1000<color>,点声望", 0);
            return
        end
	
	CreateTongDialog()
end;

-- 介绍建立帮会所需要的条件
function introduce_about_create_tong()
	Talk(1,"","<color=green>帮派介绍人<color>: 襲 ki謓 l藀 bang c莕 nh﹏ v藅 <color=yellow>c蕄 50<color> tr? l猲 v? ph秈 mang <color=yellow>500 v祅g <color> v韎 <color=yellow>Minh H閕 L謓h B礽<color> v?<color=yellow>c祅 kh玭 ph?<color>")
end;

-- 介绍帮会人气排名的作用
function introduce_about_population()
	Talk(1,"","B籲g h鱱 qu? nhi猲 b総 tin nhanh nh箉. M鏸 ng祔 ch髇g ta u ph竔 c竎 truy襫 nh﹏ n緈 b総 t譶h h譶h nh﹏ kh? c馻 m鏸 bang h閕. N誹 s? huynh  trong bang c祅g nhi襲, v? ngh? cao cng ho芻 th阨 gian g緉 b? trong bang d礽 u c? c鑞g hi課 l韓 cho nh﹏ kh? c馻 bang h閕. C竎 h筺g u trong b秐g x誴 h筺g nh﹏ kh? bang h閕 u nh薾 頲 ph莕 thng c bi謙 c馻 Minh Ch? Kim S琻!")
end;

-- 想要尝试建立帮会
function apply_create_tong_normal()
	local bIsTongMember = IsTongMember()
	if (bIsTongMember == 1) then
		Talk(1,"","帮会成员不得与朝廷作对")
		return
	end

	local nCurPlayerLevel = GetLevel()
	if (nCurPlayerLevel < 50) then
		Talk(1,"","你还太年轻了，50级后再来找我吧!")
	else
		SetTask(297, 1)
		Talk(1,"","要建立帮会必须得到<color=yellow>金山掌门人<color>的同意，去襄阳找找他吧！")
	end
end;

-- 申请解散帮会，之后就被打发到金山掌门人那里去了
function apply_destroy_tong_normal()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","你又不是帮主，瞎搅和什么呢？")
		return
	end
	
	SetTask(295, 1)
	Talk(1,"","申请解散帮会的请求已经提交，请等待金山掌门人的最后同意！")
end;

-- 正宗闲聊，不用花钱，包你满意
function chat_xxx()
	Talk(1,"","谢谢你的关心!但是最近工作太忙了，等有空的时候再和你聊天。")
end;

-- 申请升级帮会等级
function apply_level_up_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","你没有这个权力，只有帮主才可以升级帮会。")
		return
	end
	
	local nTongLevel = GetTongLevel()
	if (nTongLevel >= 5) then		-- 帮会现在只能升级到 5 级，以后的要等帮会建设功能出了再向上面升级
		Talk(1,"","帮会现在只能升级到5级。因为建设功能暂时还不开放，如果你想要继续升级，请等待金山的消息。
")
		return
	end
	
	if (nTongLevel == 0) then		-- 临时帮会，直接打发走，TMD！！
		Talk(1,"","临时帮会，人数未凑齐无法建立正式帮会，拜拜您嘞！")
		return
	end
	
	-- 以下开始是1-4级帮会的升级功能，我是想要每一级别讲的话都不同啦
	local strTalk = {
			"Bang h閕 hi謓 t筰 c馻 b籲g h鱱 ch? l? bang h閕 c蕄 th蕄! C莕 t╪g c蕄 bang h閕  ph竧 dng danh ti課g trong giang h?, c? th? thu nh薾 頲 nhi襲 huynh . Bang h閕 khi t╪g c蕄 c? th? m? r閚g quy m? nh璶g c莕 b? ra <color=yellow>170 ti襫 v祅g<color>. B籲g h鱱 b籲g l遪g giao n筽 ti襫 t╪g c蕄 kh玭g?",
			"Bang h閕 c馻 ngi tr? tr猲 giang h?  l﹗ nh璶g c莕 t╪g c蕄 n <color=yellow>bang h閕 c蕄 3<color> v? 頲 tri襲 nh th鮝 nh薾  ti謓 tri謚 t藀 huynh  c馻 qu? bang khi Qu鑓 gia h鱱 s?. C莕 n閜 <color=yellow>400 ti襫 v祅g<color> ng k? v韎 tri襲 nh, bang ch? c? mang  ti襫 kh玭g?",
			"Bu鎖 u x﹜ d鵱g bang h閕, c莕 ph秈 v? thi猲 h? b? t竛h. N筺 d﹏ ? Giang T﹏ th玭 tr玦 d箃 kh緋 n琲. Minh Ch? Kim S琻 產ng d鑓 s鴆 tr? gi髉 h?,  n l骳 ch髇g ta ph秈 g鉷 s鴆. в t╪g c蕄 bang h閕 m譶h, h穣 quy猲 g鉷 ch髏 ti襫 c鴘  b? t竛h. Theo quy m? c馻 bang h閕, c莕 quy猲 g鉷 <color=yellow>800 ti襫 v祅g<color>!",
			"Bang h閕 c馻 ngi tuy ph竧 tri觧 nhanh ch鉵g nh璶g c莕 th╪g l猲 <color=yellow>bang h閕 c蕄 5<color> nh璶g ngi hi謓 ch璦  danh ti課g giang h?. H穣 tri謚 t藀 i h閕 v? l﹎ li猲 minh, m阨 bang ch? c馻 c竎 bang h閕 l韓 v? anh h飊g h祇 ki謙 c飊g tham gia  n﹏g cao danh ti課g v? ph竧 dng th? l鵦 c馻 bang h閕 nh璶g c莕 ti猽 t鑞 n <color=yellow>1400 ti襫 v祅g<color>. Ngi th蕐 th? n祇?",
			}
	
	Say(strTalk[nTongLevel], 
	    2,
	    "很不错!你说得有道理!我把钱给你，剩下的我们自己来处理。/agree_add_tong_level",
	    "这可不是一笔小钱，我得回去和我的兄弟们商量一下。/disagree_add_tong_level")
end;

function agree_add_tong_level()
	local nNeedMoney = {1700000, 4000000, 8000000, 14000000}
		
	local nCurTongLevel = GetTongLevel()
	local nCurHaveMoney = GetCash()
	
	if (nCurHaveMoney < nNeedMoney[nCurTongLevel]) then		-- 钱不够，格老子的骗人！！
		Say("你没有带足够的钱，等你钱够了，我们再谈。", 0)
		return
	end
	
	Pay(nNeedMoney[nCurTongLevel])
	AddTongLevel()
	Talk(1,"","大吉大利，恭喜你的帮会升级成功了！")
end;

function disagree_add_tong_level()
	Talk(1,"","太好了！你一定会感兴趣的，等你决定的时候可以回来找我。")
end;

