--Create Date:2008-1-14 11:27
--Author:yanjun
--Description:Trapµã½Å±¾
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_nFieldDirection = 2;

function main()
	if SubWorldIdx2ID(SubWorld) ~= 6028 then
		BWT_ProcessTrap(g_nFieldDirection);
	end
end;