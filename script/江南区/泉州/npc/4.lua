--ÈÎÎñ  
--µØµã£ºãê¾© ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ£¬·ÖÖ§½áµã1
--²ß»®£º·®ÍòËÉ  2004.02.28

function main()
	UWorld1402 = GetTask(1402)
	UWorld1401 = GetTask(1401)
if ( UWorld1401 == 25 and UWorld1402 == 0  )  then
		Talk(2,"","Bé ®Çu ®¹i nh©n! T¹i h¹ nghe nãi cã mét ®¸m ng­êi mÆc quan phôc trµ trén vµo thiªn lao gi¶i cøu tï nh©n!","Cã chuyÖn nh­ vËy sao? Ph¶n råi! §a t¹ ®· b¸o tin! §©y chót t¹ lÔ xin h·y nhËn lÊy!")
    SetTask(1402,5)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("Bİ mËt b¸o quan phñ chuyÖn c­íp ngôc!")
    Msg2Player("Bİ mËt b¸o quan phñ chuyÖn c­íp ngôc!")
else
		Talk(1,"","Nha m«n lµ n¬i cÊm ®Şa! H¸ ®Ó cho ng­¬i tù tiÖn x«ng vµo sao?")
end
end;