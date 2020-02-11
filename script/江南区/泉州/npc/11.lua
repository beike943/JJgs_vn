--ÈÎÎñ
--µØµã£ºÑãÃÅ¹Ø  ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ½áµã8
--²ß»®£º·®ÍòËÉ  2004.03.


function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 70 )  then
	Talk(9,"","Xin hái tiªn sinh cã ph¶i lµ Hµn Trİ Nh­îng?","Lµ ta ®©y! Ng­¬i t×m ta cã chuyÖn g× kh«ng?","Cuèi cïng còng gÆp ®­îc l·o råi. Ta chİnh lµ hËu nh©n cña cõu nh©n l·o ®©y. Nay ph¶i phôc mÖnh ®Õn Liªu Quèc, nghe nãi l·o cã ng­êi quen bªn ®ã, cã cÇn nh¾n nhñ g× kh«ng ta chuyÓn lêi gióp.","B¹n trÎ lµ hËu bèi cña ai trong th©n téc ta? Cã thÓ nãi râ chót kh«ng?","L·o quªn råi sao? L·o cßn nî ng­êi ®ã <color=yellow>1 nh¸t ®ao<color>!...","Ta nhí råi. C©u chuyÖn <color=yelow>1 nh¸t ®ao<color> sau nµy ta sÏ kÓ ng­¬i nghe. Ng­êi quen Liªu Quèc chİnh lµ l·o phu. Qu¶ thËt n¨m x­a ta cã mét hång nhan tri kû ng­êi KhiÕt ®an. Ta vµ nµng gÆp nhau ë Nh¹n M«n quan, råi KhiÕt §an ®em qu©n ®¸nh Trung Nguyªn. Ng­êi H¸n nãi nµng lµ cÈu KhiÕt §an, chöi vµ ®¸nh ®Ëp nµng. Ta còng mang tiÕng lµ gian tÕ. Nh÷ng ngµy ®ã, chóng ta ®· tr¶i qua mu«n vµn khæ së!","Sau ®ã thÕ nµo?","Sau nµy nµng quay vÒ cè h­¬ng…NÕu cã gÆp nµng, h·y nãi r»ng ta giíi thiÖu ng­¬i tíi, cã chuyÖn g× nµng sÏ gióp ng­¬i lo liÖu! Tªn nµng lµ <color=red>Tiªu YÕn YÕn<color>. Ng­¬i còng cã thÓ t×m <color=red>Hµn §øc Nh­îng<color>, em trai ta!","Xin c¸o tõ!")
    SetTask(1401,75)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("§Õn ®¹i th¶o nguyªn ngoµi Nh¹n M«n quan t×m Tiªu YÕn YÕn vµ Hµn §øc Nh­îng.")
    Msg2Player("§Õn ®¹i th¶o nguyªn ngoµi Nh¹n M«n quan t×m Tiªu YÕn YÕn vµ Hµn §øc Nh­îng.")
	
elseif ( UWorld1401  == 75  )then
	Talk(1,"","H·y ®Õn Liªu Quèc t×m <color=red>Tiªu YÕn YÕn<color> hoÆc <color=red>Hµn §øc Nh­îng<color>!")
else
	Talk(1,"","Ngµy th¸ng an h­ëng tuæi giµ, qu¶ thËt thanh tŞnh!")
end
end;
