Include("\\script\\newbattles\\sign_up_npc.lua");

--g_sNpcName = "TriÖu Diªn Niªn";
g_sNpcName = "TiÓu Ph­¬ng";
g_nNpcCamp = SONG_ID;

function main()
		if random(1,50) == 1 then
			NpcChat(GetTargetNpc(),"§Ó khİch lÖ t­íng sÜ §¹i Tèng ta anh dòng giÕt giÆc, nh÷ng ai tham gia trËn ®¸nh Nh¹n m«n quan ®Òu ®­îc nhËn Linh Th¹ch!");
		end;
	battle_main();
end;