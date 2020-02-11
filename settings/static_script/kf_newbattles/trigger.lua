Include("\\settings\\static_script\\kf_newbattles\\functions.lua");
function OnLogin()
	BT_SetData(PT_BATTLE_TYPE,0);--见注解１
	BT_RestorePlayerState();
end;

--注解1：如果玩家在战场里面，这时因服务器宕机而没有清除PT_BATTLE_TYPE这个变量，那么玩家登陆的
--时候执行BT_RestorePlayerState时，BT_RestorePlayerState根据PT_BATTLE_TYPE来LeaveChannel，结果
--会出现玩家离开一个自己并没有加入的Channel（玩家下线自动离开动态频道），导致ASSERT出现。

--自问：那为什么不用临时变量呢？
--自答：因为已经大量用到这个变量，如果要改的话就要改动很多地方。目前看来没有什么问题啊～