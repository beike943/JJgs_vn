Include("\\script\\lib\\globalfunctions.lua");

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex,0)
	SetNpcScript(npcIndex,"");
	local szLogTitle = "TNC Boss The Gioi"
	gf_EventGiveCustomAward(1, 5000000, 0, szLogTitle)
	local _npcIndex,npcModel,npcName = GetTriggeringUnit()
	
	if npcName == "B¾c Lôc L©m Minh Chñ" then
		local npcIndex = CreateNpc("B¾c Lôc L©m lÖnh","B¾c Lôc L©m lÖnh",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);
	elseif npcName == "Th­¬ng ThÇn Doanh Thiªn" then
		local npcIndex = CreateNpc("Trôc ¶nh Th­¬ng","Trôc ¶nh Th­¬ng",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60)
	elseif npcName == "L·nh H­¬ng L¨ng" then
		local npcIndex = CreateNpc("TuyÖt T×nh Th¹ch","TuyÖt T×nh Th¹ch",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60)
	end
	
	local nRand = random(1, 10000)
	if nRand <= 9693 then
		gf_AddItemEx2({2, 2, 7, 1}, "M¶nh Thiªn th¹ch", szLogTitle, "nhËn")
	elseif nRand <= 9993 then
		gf_AddItemEx2({2, 1, 30071, 1}, "Nh©n S©m V¹n N¨m", szLogTitle, "nhËn")
	else
		gf_AddItemEx2({2, 1, 30130, 1}, "Phi Yªn Th¹ch", szLogTitle, "nhËn")
	end
end