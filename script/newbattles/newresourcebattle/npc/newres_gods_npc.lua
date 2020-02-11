-- Created by TuanNA5
-- 31/05/2010
-- Tµi nguyªn chiÕn

function newres_god_talk()
	Say(szNpcName.."ChØ cÇn gi¶i ®­îc c©u ®è cña "..szNextNpc..", ta sÏ lµm b¹n víi ng­¬i! Nh­ng ng­¬i chØ cã thÓ chän 1 trong sè bän ta mµ th«i!",2,"Ta ®ång ı/say_yes","Ta biÕt råi/nothing")
end

function say_yes()
	Talk(1,"",szNpcName.."Ng­¬i ch­a ®ñ ®iÒu kiÖn v­ît qua thö th¸ch nµy!")
end

function nothing()
end