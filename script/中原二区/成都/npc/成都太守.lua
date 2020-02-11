--ÎÄ¼þËµÃ÷
--Óë³É¶¼Ì«ÊØ¶Ô»°µÄ½Å±¾
--created by lizhi
--2005-8-12 15:11

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_³É¶¼\\task_main.lua");

function main()
    local nStep = GetTask(TASK_CD_THREE);
    
    if nStep == 2 then
        task_three_02_01();
        return
    elseif nStep == 3 then
        task_three_03_01();
        return
    end;

	i=random(1,4)

	if i==1 then 
		Talk(1,"","Tõ thêi nhµ TÇn Lý B¨ng kiÕn ®« Giang YÓn, lóc ®ã Thµnh §« lµ vïng ®Êt trï phó b¹t ngµn, lµ kho l­¬ng thùc c¶ thiªn h¹. Nh­ng hiÖn nay mïa mµng thÊt b¸t, ta th©n lµ Th¸i Thó thËt hæ thÑn víi b¸ t¸nh lª d©n!")
	elseif i==2 then
		Talk(1,"","Tõ khi B¶n ®å S¬n Hµ X· T¾c bÞ vì ra thµnh m¶nh, quû qu¸i Phong §« t¸c yªu t¸c qu¸i, may nhê c¸c n÷ hiÖp Nga My x¶ th©n liÒu m¹ng, Thµnh §« míi kh«ng bÞ hoang phÕ!")
	elseif i==3 then
		Talk(1,"","Thêi cuéc biÕn lo¹n, hy väng sím cã ch©n anh hïng ®Ó b×nh æn thiªn h¹ cøu n¹n b¸ t¸nh!")
	else
		Talk(1,"","Con ®­êng phÝa §«ng Thµnh §« ®· bÞ phong táa, b¸ t¸nh ra ngoµi thµnh h·y cÈn thËn!")
	end

end;