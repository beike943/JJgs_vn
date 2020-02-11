--ÉñÃØÖÖ×Ó½Å±¾
--by vivi
--07/26/2007

Include("\\script\\online\\qixi07\\qixi07_head.lua")
	
function OnUse()
	Say("<color=green>H¹t thÇn bİ<color>: B¹n muèn trång h¹t thÇn bİ nµy kh«ng? NÕu kh«ng muèn, cã thÓ trùc tiÕp ®­a cho B¸ch Hoa sø gi¶, nhËn phÇn th­ëng cuèi cïng, nh­ng phÇn th­ëng sÏ rÊt thÊp.",
		2,
		"§­îc/confirm_grow",
		"Kh«ng cÇn/nothing"
		);		
end

function confirm_grow()
	if DelItem(2,0,1154,1) == 1 then      --ÖÖ×Ó
		local add_flog = AddItem(2,0,1155,1); --»¨		
		if add_flog == 1 then
			Msg2Player("NhËn ®­îc Hoa thÇn bİ");
			SetTask(TASK_PLANT_TIME,GetTime()+28800);
			SetTask(TASK_IS_PLANT,1);			
		else
			WriteLog("Ho¹t ®éng ThÊt TŞch: Ng­êi ch¬i"..GetName().."NhËn Hoa thÇn bİ thÊt b¹i, tiªu chİ thÊt b¹i:"..add_flog);
			return
		end
	end
end

function nothing()
end