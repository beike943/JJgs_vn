--NPCÄ¬ÈÏ¶Ô»°½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	local tbSay = {};
	tinsert(tbSay,"\n t¹i h¹ ®· s¼n sµng khiªu chiÕn §«ng Ph­¬ng BÊt B¹i råi/challenge");
	tinsert(tbSay,"\n chê chót h·y nãi/do_nothing");
	Say("<color=green>D­¬ng Liªn §×nh: <color>§«ng Ph­¬ng gi¸o chñ, thiªn h¹ ®Ö nhÊt.",getn(tbSay),tbSay);
end

function do_nothing()
--do nothing
end

tbTempName = {};

function challenge()
	--ÅĞ¶ÏÊÇ·ñÊÇ¶Ó³¤
	if GetCaptainName() ~= GetName() then
		Talk(1,"","ChØ cã ®éi tr­ëng míi cã thÓ kİch ho¹t BOSS §«ng Ph­¬ng BÊt B¹i")
		return 0;
	end
	--ÅĞ¶ÏÊÇ·ñ½ÓÁË¶«·½²»°ÜÈÎÎñ
	tbTempName = {};
	local msg;
	--¶ÓÎé¼ì²é
	local nSize = GetTeamSize();
	local oldPlayerIndex = PlayerIndex;
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i);
		check_team();
	end
	PlayerIndex = oldPlayerIndex;
	if getn(tbTempName) ~= 0 then
		msg = "<color=red> thµnh viªn ch­a tiÕp nhËn hoÆc ®· hoµn thµnh nhiÖm vô §«ng Ph­¬ng BÊt B¹i: <color>\n";
		for i = 1, getn(tbTempName) do
			msg = msg .. tbTempName[i] .. " ";
		end
		Talk(1,"",msg);
		return 0;
	end	
	Say("\n<color=red> chuÈn bŞ xong ch­a?<color>\n",2,"\n khiªu chiªn §«ng Ph­¬ng BÊt B¹i/start_fight","\n ch­a chuÈn bŞ xong/do_nothing");
end

function start_fight()
	--ÅĞ¶ÏÊÇ·ñµØÍ¼ÉÏÖ»ÓĞÒ»¸ö¶«·½²»°ÜBOSS
	local npcIndex = GetMapTaskTemp(6017,Map_Glb_Valve1);
	if npcIndex ~= 0 then
		if IsNpcDeath(npcIndex) == 0 then
			Talk(1,"","B¶n ®å  chØ cho phĞp 1 §«ng Ph­¬ng BÊt B¹i xuÊt hiÖn, xin h·y chê chót.");
			return 0;
		end
	end
	--print("npcIndex",npcIndex);
	--´´½¨NPC
	local nNpcIdx = CreateNpc("§«ng Ph­¬ng BÊt B¹i","§«ng Ph­¬ng BÊt B¹i",6017,1628,2891);
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\npc\\¶«·½²»°Ü.lua");
	SetNpcLifeTime(nNpcIdx,10*60);
	SetCampToNpc(nNpcIdx,"camp_evil");
	SetCampToPlayer("camp_enemy");
	SetMapTaskTemp(6017,Map_Glb_Valve1,nNpcIdx);
	local nIndexNpc = CreateNpc("NhËm Ng· Hµnh chiÕn ®Êu","NhËm Ng· Hµnh",6017,1628+2,2891+2,0);
	SetNpcLifeTime(nIndexNpc,10*60);
	SetCampToNpc(nIndexNpc,"camp_enemy");
	SetMapTaskTemp(6017,Map_Glb_Valve6,nIndexNpc)
	SetNpcDeathScript(nIndexNpc,"\\script\\task\\global_task\\gtask_npc.lua");
	nIndexNpc = CreateNpc("NhËm Doanh Doanh chiÕn ®Êu","NhËm Doanh Doanh",6017,1628-2,2891+2,0);
	SetNpcLifeTime(nIndexNpc,10*60);
	SetCampToNpc(nIndexNpc,"camp_enemy");
	SetMapTaskTemp(6017,Map_Glb_Valve7,nIndexNpc)
	SetNpcDeathScript(nIndexNpc,"\\script\\task\\global_task\\gtask_npc.lua");
	nIndexNpc = CreateNpc("H­íng VÊn Thiªn chiÕn ®Êu","H­íng VÊn Thiªn",6017,1628+2,2891-2,0);
	SetNpcLifeTime(nIndexNpc,10*60);
	SetCampToNpc(nIndexNpc,"camp_enemy");
	SetMapTaskTemp(6017,Map_Glb_Valve8,nIndexNpc)
	SetNpcDeathScript(nIndexNpc,"\\script\\task\\global_task\\gtask_npc.lua");
	--´´½¨Ê±¼ä¼ÆÊıÆ÷
	SetTaskTemp(250,0);
	CreateTrigger(1,1521,1521*2);
	ContinueTimer(GetTrigger(1521*2));
end


function check_team()
	if tGtTask:check_cur_task(72) ~= 1 then
		tinsert(tbTempName,GetName());
	elseif GetTask(Task_id_014) == 1 then
		tinsert(tbTempName,GetName());
	end
end


function OnTimer()
	--print("GetTaskTemp(250) =",GetTaskTemp(250))
	local npcIndex = GetMapTaskTemp(6017,Map_Glb_Valve1);
	if GetTaskTemp(250) >= 16 or npcIndex == 0 or IsNpcDeath(npcIndex) == 1 then
		RemoveTrigger(GetRunningTrigger());
		SetTaskTemp(250,0);
		--±ê¼ÇÖØÖÃ£¬npcÉ¾³ı
		SetNpcLifeTime(GetMapTaskTemp(6017,Map_Glb_Valve6),0);
		SetNpcLifeTime(GetMapTaskTemp(6017,Map_Glb_Valve7),0);
		SetNpcLifeTime(GetMapTaskTemp(6017,Map_Glb_Valve8),0);
		SetNpcLifeTime(GetMapTaskTemp(6017,Map_Glb_Valve1),0);
		SetMapTaskTemp(6017,Map_Glb_Valve1,0);
		--¶ÓÎé
		local nSize = GetTeamSize();
		local oldPlayerIndex = PlayerIndex;
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			Msg2Player("Khiªu chiÕn thÊt b¹i");
		end
		PlayerIndex = oldPlayerIndex;
	end
	SetTaskTemp(250,GetTaskTemp(250) + 1);
end

function do_nothing()
end