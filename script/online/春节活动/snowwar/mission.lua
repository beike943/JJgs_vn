--Create Date:2006年最后一天
--Describe:０７年春节雪仗Mission
--Author:yanjun
Include("\\script\\online\\春节活动\\snowwar\\snowwar_head.lua");

function InitMission()
	SW_InitSnowWar();					--楼主：把这些函数放在head和放这里有什么区别呢？值得思考
end;

function RunMission()
	SW_RunSnowWar();					--2楼：回楼主，好处之一就是这个文件写完后就不用再打开啦，就看头文件就行了
end;

function EndMission()
	SW_EndSnowWar();					--3楼：顶楼上的
end;

function OnLeave(RoleIndex)				--4楼：顶２楼的。楼下保持队形
	PlayerIndex = RoleIndex;
	SW_LeaveSnowWar();
	PlayerIndex = RoleIndex
end;

function JoinMission(RoleIndex,nCamp)	--5楼：版主结贴！
	PlayerIndex = RoleIndex;
	SW_JoinSnowWar();
	PlayerIndex = RoleIndex
end;