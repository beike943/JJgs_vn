--ÈÎÎñ
--µØµã£ºÑãÃÅ¹Ø  ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ½áµã4
--²ß»®£º·®ÍòËÉ  2004.03.


function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 25 )  then
	Talk(7,"","Nh©n huynh ®©y t­íng m¹o ®­êng ®­êng, ¾t h¼n lµm thèng lÜnh ë ®©y, xin hái cã biÕt <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> ë ®©u kh«ng?","Qu¸ khen, qu¸ khen! Ta ®©y chØ lµ ®éi tr­ëng th«i. <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> chØ cã §¹i nh©n t­íng qu©n míi biÕt ®­îc.","VËy phiÒn ®¹i nh©n bÈm b¸o mét tiÕng, t¹i h¹ cã viÖc gÊp cÇn th­¬ng l­îng víi T­íng qu©n.","Qu©n doanh kh«ng thÓ tïy tiÖn ra vµo, ng­¬i ®îi ë ®©y nhĞ!","Cã c¸ch nµo ®Ó vµo qu©n doanh gÆp t­íng qu©n kh«ng?","Ng­¬i ®Õn <color=red>BiÖn Kinh phñ<color> t×m <color=red>Binh bé ThŞ Lang<color> b¸o danh, nh­ng còng kh«ng ch¾c l¾m.","§a t¹ ®· chØ gi¸o.")

    SetTask(1401,30)
    ----AddItem(0,0,0)
--    Earn(10000)
    ModifyExp(10000)
    AddNote("§Õn BiÖn Kinh b¸o danh.")
    Msg2Player("§Õn BiÖn Kinh b¸o danh.")

elseif ( UWorld1401  == 30  ) then
	Talk(1,"","Ng­¬i ®Õn <color=red>BiÖn Kinh phñ<color> t×m <color=red>Binh bé ThŞ Lang<color> b¸o danh, nh­ng còng kh«ng ch¾c l¾m.")	
	
elseif ( UWorld1401  > 30  ) then
	Talk(1,"","Chøc cao quyÒn träng, quªn mÊt ng­êi huynh ®Ö nµy råi.")
else
	Talk(1,"","Xuşt, ®õng nãi vËy chø!")
end
end;
