--date:2007-3-6
--author:yanjun
--describe:this script will be executed while player kill a npc monster!
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");

BOX_LIFE_TIME = 2*60*60;	--Ïä×ÓÉú´æÊ±¼ä2Ð¡Ê±

function OnDeath(npcIndex)
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_STARTED then
		return 0;
	end;
	SetNpcLifeTime(npcIndex,0);
	SetNpcScript(npcIndex,"");
	local sNpcName = GetNpcName(npcIndex);
	if sNpcName == tNpcInfo[NPC_TYPE_XIANGZHU][2] then
		process_boss_xiangzhu_death(npcIndex);
	elseif sNpcName == tNpcInfo[NPC_TYPE_FUTANGZHU][2] then
		process_boss_futangzhu_death(npcIndex);
	elseif sNpcName == tNpcInfo[NPC_TYPE_LIDAZUI][2] then
		process_boss_lidazui_death(npcIndex);
	elseif sNpcName == tNpcInfo[NPC_TYPE_KILLER][2] then
		process_killer_death(npcIndex);
	else
		WriteLog("[S¸t Thñ §­êng lÇm lçi]: File gèc l­u tªn NPC tö vong bÞ sai, tªn bÞ sai lµ:"..tostring(sNpcName));
	end;
end;

function process_boss_xiangzhu_death(nNpcIdx)
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	local nBoxNpcIdx = CreateNpc("R­¬ng tiÒn","H­¬ng chñ B¶o r­¬ng",nMapID,nMapX,nMapY);
	SetNpcScript(nBoxNpcIdx,"\\script\\task\\killer_hall\\box_npc.lua");
	SetNpcLifeTime(nBoxNpcIdx,BOX_LIFE_TIME);	
	local nKillerIdx = 0;
	local sKillerModel,sKillerName,nLifeTime = tNpcInfo[NPC_TYPE_KILLER][1],tNpcInfo[NPC_TYPE_KILLER][2],tNpcInfo[NPC_TYPE_KILLER][3];
	for i=1,XIANGZHU_KILLER_COUNT do
		nKillerIdx = CreateNpc(sKillerModel,sKillerName,nMapID,nMapX,nMapY,-1,1,1,XIANGZHU_KILLER_COUNT*10)
		SetNpcDeathScript(nKillerIdx,"\\script\\task\\killer_hall\\npc_death.lua")
		SetNpcLifeTime(nKillerIdx,nLifeTime);
	end
end;

function process_boss_futangzhu_death(nNpcIdx)
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx)
	local nBoxNpcIdx = CreateNpc("R­¬ng tiÒn","Phã §­êng Chñ B¶o R­¬ng",nMapID,nMapX,nMapY);
	SetNpcScript(nBoxNpcIdx,"\\script\\task\\killer_hall\\box_npc.lua");
	SetNpcLifeTime(nBoxNpcIdx,BOX_LIFE_TIME);
	local nKillerIdx = 0;
	local sKillerModel,sKillerName,nLifeTime = tNpcInfo[NPC_TYPE_KILLER][1],tNpcInfo[NPC_TYPE_KILLER][2],tNpcInfo[NPC_TYPE_KILLER][3];
	for i=1,FUTANGZHU_KILLER_COUNT do
		nKillerIdx = CreateNpc(sKillerModel,sKillerName,nMapID,nMapX,nMapY,-1,1,1,FUTANGZHU_KILLER_COUNT*10)
		SetNpcDeathScript(nKillerIdx,"\\script\\task\\killer_hall\\npc_death.lua")
		SetNpcLifeTime(nKillerIdx,nLifeTime);
	end
end;

function process_boss_lidazui_death(nNpcIdx)
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx)
	local nBoxNpcIdx = CreateNpc("R­¬ng tiÒn","Lý §¹i Chñy B¶o R­¬ng",nMapID,nMapX,nMapY);
	SetNpcScript(nBoxNpcIdx,"\\script\\task\\killer_hall\\box_npc.lua");
	SetNpcLifeTime(nBoxNpcIdx,BOX_LIFE_TIME);
	local nKillerIdx = 0;
	local sKillerModel,sKillerName,nLifeTime = tNpcInfo[NPC_TYPE_KILLER][1],tNpcInfo[NPC_TYPE_KILLER][2],tNpcInfo[NPC_TYPE_KILLER][3];
	for i=1,LIDAZUI_KILLER_COUNT do
		nKillerIdx = CreateNpc(sKillerModel,sKillerName,nMapID,nMapX,nMapY,-1,1,1,LIDAZUI_KILLER_COUNT*10)
		SetNpcDeathScript(nKillerIdx,"\\script\\task\\killer_hall\\npc_death.lua")
		SetNpcLifeTime(nKillerIdx,nLifeTime);
	end
end;

function process_killer_death(nNpcIdx)
	local nRand = random(1,100);
	ModifyExp(10000);
	if nRand <= 5 then	--%5
		KH_Add_Random_Mystic_Thing(1);	--ÉñÃØÎïÆ·
	end;
	nRand = random(1,100);
	if nRand <= 2 then	--%2
		nRand = random(1,100);
		if nRand <= 30 then
			if AddItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],1) == 1 then--ÃØ¼®ËéÆ¬
				Msg2Player("B¹n ®­îc 1 "..tItemInfo[2][1]);
				WriteLog("[S¸t Thñ §­êng]:"..GetName().."NhËn ®­îc"..tItemInfo[2][1]);
			end;
		end
	end;
end;