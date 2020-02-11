--ÈÎÎñ
--µØµã£ºãê¾©¸®  ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ½áµã14
--²ß»®£º·®ÍòËÉ  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
UWorld1401 = GetTask(1401) 
if ( UWorld1401 == 120 )  then
		Talk(6,"say1401_14","<color=green> <color>: vŞ nµy cã ph¶i lµ <color=red>Tiªu Thiªn H÷u<color> ®¹i t­íng qu©n?","Lµ ta ®©y, cã viÖc g× kh«ng?","T¹i h¹ lµ thuéc h¹ cña Môc NghÜa, còng biÕt chót vâ c«ng nªn ®­îc ph¸i ®Õn ®©y gãp chót c«ng søc kiÕn c«ng lËp nghiÖp.","ThËt may, ta ®ang bµy Thiªn M«n trËn ®Ó tÊn c«ng Nh¹n M«n quan, t­íng so¸i l¹i kh«ng ®ñ. Ng­¬i mau vµo <color=red>Thiªn M«n trËn<color> thay ta lÊy thñ cÊp th­îng t­íng qu©n Tèng, ®o¹t <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color>!","T¹i h¹ m¹o muéi hái mét c©u <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> lµ g× vËy?","<color=green> <color>: b¶n ®å<color=yellow>S¬n Hµ X· T¾c<color> nµy lµ minh chøng cho thiªn tö, lµ th¸nh vËt trêi ban, thÇn lùc v« cïng, cã ®­îc nã ®ång nghÜa víi n¾m ®­îc thiªn h¹ trong tay. Vèn lµ vËt gia truyÒn cña hoµng ®Õ triÒu ®¹i Tèng, kh«ng ngê l¹i xuÊt hiÖn t¹i khu vùc Nh¹n M«n Quan. Ta dïng m­êi v¹n tinh bİnh lËp nªn Thiªn M«n ®¹i trËn v©y quanh. ChØ cÇn n¾m ®­îc <color=yellow>b¶n ®å S¬n Hµ X· T¾c <color> trong tay, n­íc ®¹i Liªu ta sÏ n¾m ®­îc thiªn h¹!","§­îc! T¹i h¹ vµo <color=red>Thiªn M«n trËn<color> nhÊt ®Şnh sÏ ®o¹t tÊm<color=red>B¶n ®å S¬n Hµ X· T¾c<color>!")
    
elseif ( UWorld1401  == 125 ) then
		Talk(1,"","ChØ cÇn ng­¬i vµo <color=red>Thiªn M«n trËn<color> lÊy ®­îc tÊm <color=red>B¶n ®å S¬n Hµ X· T¾c<color> ta sÏ träng th­ëng!")
elseif ( UWorld1401  == 130 or UWorld1401  == 135 ) then
		Talk(1,"","Nhê ng­¬i vµo<color=red>Thiªn M«n trËn<color> lÊy <color=red>B¶n ®å S¬n Hµ X· T¾c<color> sao cßn chÇn chê ch­a ®i?")		

else
		Talk(1,"","Trêi sÏ phï hé cho §¹i Liªu ta! Ha ha ha !")
end
end;

function  say1401_14()
		Say("LÊy danh hiÖu phe nµo ®Ó vµo Thiªn M«n trËn ®o¹t <color=red>B¶n ®å S¬n Hµ X· T¾c<color>? ( sau nµy cã thÓ ®æi l¹i)",2,"Tèng TriÒu/yes1401_14","Liªu Quèc/no1401_14")

end;

function  yes1401_14()
		Talk(1,"","Lµm sao ta cã thÓ s¸t h¹i T­íng lÜnh Tèng qu©n? Hay lµ quay vÒ b¸o cho l·o t­íng qu©n <color=red>D­¬ng NghiÖp<color> vËy.")
    SetTask(1401,130)
    ----AddItem(0,0,0)
end;

function  no1401_14()
		Talk(1,"","Th«i ®­îc, qu©n Tèng v« ®¹o nh­ vËy, ta sÏ lÊy danh lµ Liªu quèc t­íng lÜnh vµo Thiªn M«n trËn ®o¹t <color=red>B¶n ®å S¬n Hµ X· T¾c<color>.")
    SetTask(1401,125)
    GivePlayerExp(SkeyTianmenzhen,"xiaotianyou")
    ModifyReputation(25,0)
    --AddNote("ÏÖÔÚ¿ÉÒÔÈ¥ÌìÃÅÕóÒÔÁÉ¹ú½«ÁìµÄÉí·İÈ¡µÃÉ½ºÓÉçğ¢Í¼¡££¨ÒÔºóËæÊ±¶¼¿ÉÒÔÔÚ½øÈëÌìÃÅÕóµÄÊ±ºòÖØĞÂÑ¡Ôñ£©")
    TaskTip("Giê ®Õn Thiªn M«n TrËn ®Ó ®o¹t lÊy b¶n ®å S¬n Hµ X· T¾c, chi b»ng h·y t×m Méc QuÕ Anh th¸m thİnh t×nh h×nh tr­íc.")
    Msg2Player("Giê ®Õn Thiªn M«n TrËn ®Ó ®o¹t lÊy b¶n ®å S¬n Hµ X· T¾c, chi b»ng h·y t×m Méc QuÕ Anh th¸m thİnh t×nh h×nh tr­íc.")
end;

