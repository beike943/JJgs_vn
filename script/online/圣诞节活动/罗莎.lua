Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2011_12\\qingrenjie\\sale_chocolate.lua")
Include("\\script\\online_activites\\201202\\zengsongpifeng\\send_pifeng.lua")
Include("\\script\\online_activites\\201211\\jixiang_ruyi.lua")

function main()
	if gf_CheckEventDateEx(53) == 1 then
		Say("#<color=green>Lasa<color>: b¸n Socola lÔ t×nh nh©n",2,"Ta ®Õn mua Socola lÔ t×nh nh©n/buy_chocolate","Ta chØ ghÐ ch¬i/do_nothing");
		return 1;
	end
	if gf_CheckEventDateEx(57) == 1 then
		Say("<color=green>Lasa<color>:tÆng Hoµng Kim Phi Phong cho tÊt c¶ n÷ sinh trong thµnh (<color=green>®· sö dông phÇn th­ëng cuèi cña event 8 thang 3 sÏ nhËn ®­îc phÇn th­ëng cuçi phong phó h¬n<color>)",2,"Mêi SaSa thay ta tÆng Phi Phong cho c¸c chÞ em phô n÷ trong thµnh (tiªu hao 8 Phi Phong Hoµng Kim + 3 vµng)/deal_send","Ta chØ ghÐ ch¬i/do_nothing")
		return 1;
	end
	if gf_CheckEventDateEx(VET_ACTIVITY_JIXIANG_RUYI) == 1 then
		Say("<color=green>La Sa<color>: Gi¸ng sinh vui vÎ!", getn(TABLE_JIXIANG_RUYI), TABLE_JIXIANG_RUYI);
		return 1;
	end
	Say("<color=green>La Sa<color>: ThËt ra hä tiÕng hoa cña ta lµ hä T­ëng, nghe hay kh«ng?",0)
end

function do_nothing()
end