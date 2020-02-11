--File name:	lanhua_boss.lua
--Describe:		À¼»¨BOSS¡¢Ó¢×ÓBOSSËÀÍö½Å±¾
--Create Date:	2009-3-25 15:51
--Author:		chenbenqian

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 0)
	SetNpcScript(nNpcIndex, "")
end
