--Create Date:2008-1-14 11:27
--Author:yanjun
--Description:Trapµã½Å±¾
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");

function main()
	local nDirection = GetMissionV(MV_FIELD_DIRECTION);
	BWT_ProcessTrap(nDirection);
end