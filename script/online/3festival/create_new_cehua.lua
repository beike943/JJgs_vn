--´´½¨3¸öĞÂ²ß»®½Å±¾
--by vivi
--09/11/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function main()
	if Get_3festival_State() == 1 then
		local nNpcIndex = 0;
		local tCehuaId = {};	
		for i=1,getn(tNewCehua) do
			if SubWorldID2Idx(tNewCehua[i][4]) ~= -1 then
				tinsert(tCehuaId,tNewCehua[i]);
			end
		end
		if getn(tCehuaId) == 0 then
			return
		end
		for i=1,getn(tCehuaId) do
			local nRand = random(1,getn(tCehuaId[i][5]));
			nNpcIndex = CreateNpc(tCehuaId[i][1],tCehuaId[i][2],tCehuaId[i][4],tCehuaId[i][5][nRand],tCehuaId[i][6][nRand]);
			SetNpcScript(nNpcIndex,"\\script\\online\\3festival\\gensuiyouli_npc.lua");
			SetMapTaskTemp(tCehuaId[i][4],1,nNpcIndex); 
			local nRanIndex = random(1,getn(tActionIndex)); 
			local nActionIndex = tActionIndex[nRanIndex][2];
			SetMapTaskTemp(tCehuaId[i][4],2,nActionIndex);
			SetMapTaskTemp(tCehuaId[i][4],3,GetTime());
			NpcChat(nNpcIndex,"Mäi ng­êi h·y lµm theo lêi t«i lµm ®éng t¸c <color=yellow>"..tActionIndex[nRanIndex][1].."<color>, sÏ cã phÇn th­ëng");
			SetNpcLifeTime(nNpcIndex,NEW_CEHUA_LIFETIME);
			Msg2Global("Giang Hå ThiÖn Nh©n "..tCehuaId[i][2].." ®· xuÊt hiÖn"..tCehuaId[i][3]..", mäi ng­êi h·y mau ®Õn trß chuyÖn ®i! SÏ cã quµ ®Êy…");
			--AddGlobalNews("½­ºşÉÆÈË"..tCehuaId[i][2].."³öÏÖÔÚÁË"..tCehuaId[i][3].."£¬´ó¼Ò¿ìÈ¥°¡£¡¸úËûÁÄÁÄÌì£¬ÓĞ½±ÀøµÄÅ¶");		
		end
	end		
end