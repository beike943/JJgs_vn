--filename:danianshou_death.lua
--create date:2006-01-11
--author:yanjun
--describe:´óÄêÊŞËÀÍö½Å±¾
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 30)
	SetNpcScript(npcIndex,"");
	local MapID,MapX,MapY = GetNpcWorldPos(npcIndex)
	for i=1,XIAONIANSHOU_COUNT do
		xnsIndex = CreateNpc("TiÓu Niªn Thó","TiÓu Niªn Thó",MapID,MapX,MapY,-1,1,1,2000)
		SetNpcScript(xnsIndex,"\\script\\online\\´º½Ú»î¶¯\\xiaonianshou_death.lua")
		SetNpcLifeTime(xnsIndex,3600);	--Ö»´æÔÚÒ»Ğ¡Ê±
	end
end