
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 物品保管人脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- 2005/05/17 PM 16:45

-- ======================================================

ID_ITEMBOX = 805;
function main()
  nLevel = GetLevel()
		if random(1,30) == 1 then
			NpcChat(GetTargetNpc(),"听说最近有人把它研究出来武装八卦，不知道是不是真的！");
		end;
	if (GetTask(ID_ITEMBOX))==0 and  (nLevel>=10)  then
	
		Say("<color=yellow>储物箱<color>是加入江湖必不可少的. 去野外找<color=yellow>灰色的兔子<color> 带回 <color=yellow>10个兔尾<color>! 开启你的储物箱!",
				3,
				"我想开启储物箱/yes_box",
				"不用了/no_box",
				"了解储物箱的好处/intro_box");
		return
	elseif (GetTask(ID_ITEMBOX))==0 and  (nLevel<10)  then
		Say("<color=yellow>储物箱<color>是我们加入江湖的必不可少的。你还没到<color=yellow>10级<color>暂时还不能用！10级来找我！",0)
		return
	elseif GetTask(ID_ITEMBOX)==1 then
		check_box();
		return
 	else
	
		OpenBox()
		EnableBoxLock(1)
		SetPlayerRevivalPos(302)
		
	end;
end;


function yes_box()
	if GetTask(1) < 25 then	
		Talk(1,"","<color=green>Th? kh?<color>: Ho祅 th祅h <color=yellow>nhi謒 v? t﹏ th?<color> r錳 h絥 n t譵 ta.");
		return 0;
	end;
	SetTask(ID_ITEMBOX,1);
	Say("请找寻 <color=yellow>10个灰兔兔尾<color>带回来!",1,"我现在就去!/box_no");
	TaskTip("出城收集10个灰色兔尾开启储物箱!")
end;

function check_box()
	if GetItemCount(2,1,2)<10 then 
	        Say("你还没找到我需要的<color=yellow>10个灰兔兔尾<color> , 我帮不了你!",1,"我现在就去!/box_no")
	else
		DelItem(2,1,2,10)
		SetTask(ID_ITEMBOX,2) --开放储物箱标记
		Say("储物箱已经完成了!请放心使用吧!",1,"很好!非常感谢!/box_no")
		Msg2Player("储物箱完成了!请放心使用!");
	end;
end;

function no_box()
end;

function intro_box()

	Say("可以扩大储物箱存放未使用的贵重物品. 当您在某个城市打开储物箱时,可以随时取出. 此外, 你需要花费<color=yellow>20两<color>使用<color=yellow>箱子锁定功能<color>确保您的储物箱安全.每当你下线时储物箱将 <color=yellow>自动锁定<color> .如果你需要<color=yellow>重置密码<color>,需要支付<color=yellow>额外<color> <color=yellow>2两<color> 金子!",1,"谢谢!/no_box");
end;


