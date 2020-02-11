--ÈÎÎñ
--µØµã£º ÈÎÎñ£º
--²ß»®£º·®ÍòËÉ  2004.03.
Include("\\script\\task\\world\\task_award.lua");
--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí************************************
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")
LEV_LEARNRECIPE=1926;
LEVELTASKID49=518					--»¨Áı°ÙÄñÈ¹
TASKID_LIFESKILL_FLG=1932	--49ÈÎÎñ×é¶ÓËæ»úÊı
TASK_GATHER_FLAG=1931 		--ÈÎÎñÎïÆ·²É¼¯±êÊ¾

strName = "";
strTitle = "";
--*****************************************MAINº¯Êı********************************************
function main()
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "

	------------------------------------------¸ãËÀÔ½×Ó¸çµÄÈÎÎñ----------------------------------------
	UWorld1402 = GetTask(1402)	
	if ( UWorld1402 == 80 )  then
		Say("T×m ta cã viÖc g×?",
			2,
			"Ta ®Õn t×m hiÓu t×nh h×nh cña Phong §« Quû Thµnh/WuYue", 
			"Kh«ng cã viÖc g×!/SayHello")
	else
		Say("T×m ta cã viÖc g×?",
			1,
			"Kh«ng cã viÖc g×!/SayHello")
	end
	return
end;


--*******************************************¸ãËÀÔ½×Ó¸çÈÎÎñ²¿·Ö****************************************
function WuYue()
	Talk(7,"","VŞ ®©y lµ V­¬ng CÈn tû tû. GÇn ®©y th¹ch m«n Phong Ma ®éng ®· më vµ Phong §« Quû Thµnh còng t¸i hiÖn nh©n gian. D­¬ng NguyÖt S­ Th¸i b¶o ta nhê ng­êi gióp ®ì.","Cuèi cïng c« ta còng chŞu ®Õn t×m ta","C« ta nãi n¨m x­a lµ do c« Êy kh«ng ph¶i víi ng­êi, mong ng­êi h·y lÊy viÖc cøu sinh linh ®å th¸n lµm träng vµ chØ c¸ch ®uæi bän Quû Thµnh ra khái nh©n gian.","ThËt sù mÊy n¨m nay ta còng kh«ng cã giËn c« ta, chuyªn t©m thanh tu trªn nói. Theo ta tİnh <color=yellow>m¶nh b¶n ®å S¬n Hµ X· T¾c ®· bŞ chia thµnh nhiÒu m¶nh<color>. ChØ dùa vµo søc m¹nh cña yªu qu¸i th× kh«ng thÓ më phong Ên ®­îc. NhÊt ®Şnh lµ cã ng­êi kh¸c gióp søc. Theo ta biÕt chØ cã mét ng­êi cã thÓ cã n¨ng lùc ®ã.","Ng­êi ®ã lµ ai?","Ng­êi ®ã lµ <color=red>Ng« ViÖt L·o Tæ<color> ë <color=red>Thiªn S­ ®éng Thanh Thµnh s¬n<color>, søc m¹nh cña h¾n ngay c¶ Ch­ëng m«n c¸c ph¸i ë Trung Nguyªn liªn thñ còng kh«ng b× ®­îc huèng chi b©y giê h¾n l¹i cã m¶nh b¶n ®å S¬n Hµ X· T¾c trong tay, Phong Ma ®éng nhÊt ®Şnh lµ do h¾n më, víi c«ng lùc ng­¬i hiÖn nay kh«ng ph¶i lµ ®èi thñ cña h¾n, ®Ó ta t×m c¸ch kh¸c.","TiÒn bèi kh¸ch s¸o råi!")
	SetTask(1402,85)
	Earn(1300)
	GivePlayerExp(SkeyFDGC,"fengduguicheng11")		--·á¶¼¹í³Ç11
	ModifyReputation(20,0)
end


--************************************************Í¨ÓÃ´¦Àí**************************************
--¿Õº¯Êı
function SayHello()	
end

