Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if GetItemCount(2, 0, 30065) > 0 and GetTask(3133) == 0 then
		--³ÖÓĞÌìÊ¦·û£¬²¢ÇÒÃ»ÓĞÍê³É¹ıÈÎÎñ
		Talk(1, "", "<color=yellow>Th¹ch Trô: <color> ng­¬i ®· sö dông Thiªn S­ Phó, th¹ch trô nµy ®· ®­îc kŞch ho¹t.");
		SetTask(3133, 1);
		SetCurrentNpcSFX(GetTargetNpc(), 921, 1, 0, 18 *3);
		TaskTip("§· më Th¹ch Trô vµ phong Ên Hå Yªu, vÒ t×m M· BÊt TiÒn");
		Msg2Player("§· më Th¹ch Trô vµ phong Ên Hå Yªu, vÒ t×m M· BÊt TiÒn");
		return 0;
	end
	Talk(1,"","D¸n Thiªn S­ Phï lªn míi cã thÓ kİch ho¹t Th¹ch Trô, më Thiªn Nguyªn Ph¸p TrËn, phong Ên Yªu Hå");
end
