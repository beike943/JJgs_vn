
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ½ÌÓıÈÎÎñ
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask_head.lua")
Include("\\script\\task\\world\\task_award.lua")

-- ½ÌÓıÈÎÎñ±Ø´æÔÚµÄÆß¸öÑ¡Ïî
strTeachSelect = {

		"Thao t¸c c¬ b¶n/Teach_Basic",
		"T¨ng cÊp nh©n vËt/Teach_Level",
		"Ph©n phèi ®iÓm tiÒm n¨ng/Teach_Point",
		"KiÕm tiÒn/Teach_Earn",
		"Gia nhËp m«n ph¸i/Teach_Faction",
		"HiÖn cã thÓ lµm /Teach_Something",
		"Ta ®· hiÓu råi/Teach_002"
		

}

-- µÚÒ»´Î½øÈëÓÎÏ·ÊÀ½çÊ±µÄ¶Ô»°
function Teach_001()
	if GetAntiEnthrallmentStatus() == 2 then
		return
	end
	local strMain = {
	
		"Hoan nghªnh ®Õn víi thÕ giíi <color=yellow>Vâ L©m 2<color>! Ta chuyªn h­íng dÉn t©n thñ! Tr«ng b¹n trÎ thËt lµ ®¸ng yªu!",
		"¤ng thËt lµ tèt qu¸!/Teach_001_Okay",
		"C¸i g× ta còng hiÓu hÕt råi!/Teach_003"
		
	}
	Say(strMain[1],2,strMain[2],strMain[3]);
	return

end


function Teach_001_Okay()

	local strMain = {
	
		"Tèt qu¸! T©n thñ nh­ ta cßn nhiÒu thø ph¶i häc hái.",
	
	}
	Say(strMain[1],7,strTeachSelect[1],strTeachSelect[2],strTeachSelect[3],strTeachSelect[4],strTeachSelect[5],strTeachSelect[6],strTeachSelect[7]);
	return

end


-- Íæ¼ÒÑ¡ÁËÍêÈ«ÌıÃ÷°×ºÍÑ¡ÔñÏ£Íû¡°Ñ§ÓĞËù³É¡±Ö®ºó
function Teach_002()
	
	if (TE_GetTeachState()==1) then -- Èç¹ûÍæ¼ÒÊÇµÚÒ»´Î½øÈëÓÎÏ·À´Ìı½²½â
		Teach_003()
	else -- Èç¹ûÊÇÒÔºó»ØÀ´ÔÙÌı½²½â
		Say("Xem ng­¬i t­ chÊt còng kh«ng tÖ, sau nµy cã g× kh«ng râ cø ®Õn t×m ta. Ta cã thÓ gióp ng­¬i ®¶ th«ng kinh m¹ch <color=red>TÈy ®iÓm tiÒm n¨ng<color>.", 0);
	end
	 
	return
	
end


-- Íæ¼ÒÑ¡ÔñÁËÃ»¿ÕÌıÄã†ªËôÖ®ºó
function Teach_003()
	Say("Sau nµy mçi khi t¨ng  cÊp nhí quay l¹i gÆp ta nhËn <color=yellow>NhiÖm vô<color>, häc mét vµi kinh nghiÖm giang hå, cho ®Õn lóc ®¹t cÊp 10 gia nhËp m«n ph¸i. ThÕ nµo h¶?",2,"Tèt qu¸! §a t¹ tiÒn bèi!/Teach_005","Ta kh«ng høng thó!/Teach_004");
end


-- ÈÃÍæ¼Ò¾õµÃºó»ÚµÄÊ±ºò£¬¿ÉÒÔÖØĞÂÑ¡Ôñ
function Teach_004()

--	LearnSkill("Çá¹¦")
--	LearnSkill("´ò×ø")
--	TE_SetTeachState(25) -- ÉèÖÃÈÎÎñ±äÁ¿Îª 25£¬Ö±½ÓÍê³É½ÌÓıÈÎÎñ
--	SetTask(805,1);
--	Msg2Player("ÄãÑ§»áÁËÇá¹¦£¡");
--	Msg2Player("ÄãÑ§»áÁË´ò×ø£¡");
--	Msg2Player("ÄãµÃµ½ÁËÒ»¸ö´¢ÎïÏä£¡");
	Say("Tr­íc khi gia nhËp m«n ph¸i ®iÒu g× kh«ng hiÓu cø ®Õn t×m ta, céng sai <color=red>®iÓm tiÒm n¨ng<color> cã thÓ tÈy l¹i, l·o lu«n s½n sµng hç trî.",0);
	TE_SetTeachState(25) -- ÉèÖÃÈÎÎñ±äÁ¿Îª 25£¬Ö±½ÓÍê³É½ÌÓıÈÎÎñ
	SetTask(807,0);	--¹Ø±ÕĞÂÊÖÈÎÎñ
end

function acc_task()
	i=GetTask(807)
	if i==1 then
		Say("Kh«ng ph¶i ng­¬i ®ang lµm nhiÖm vô sao?",0);
	else
		TE_SetTeachState(1)  --ĞÂÊÖÈÎÎñ±äÁ¿
		SetTask(807,1);		--¿ª·ÅĞÂÊÖÈÎÎñ	
		TE_SetTeachPro(2)	--¶Ô»°Íê³É
		Talk(1,"TE_SetTeachAdd","Khæ ¶i v« biªn, quay ®Çu lµ bê, cuèi cïng ng­¬i ®· hiÓu ra ı tèt cña ta. ChØ cÇn h¬n cÊp 2 cã thÓ ®Õn t×m ta nhËn 8 nhiÖm vô, nhanh ch©n lªn!");
                if GetAntiEnthrallmentStatus() == 1 then
                    ModifyExp(5)
                elseif GetAntiEnthrallmentStatus() == 2 then

                else
                    ModifyExp(10)
                end
	end
end;


function Teach_005()
 	-- TEACH_SEASONNPC_ID Ó¦Îª 2
 	
	Talk(3,"TE_SetTeachAdd","Ng­¬i b¶n lÜnh h¬n ng­êi! D­íi cÊp 10 mçi khi <color=yellow>t¨ng cÊp<color> nhí ®Õn t×m ta nhËn nhiÖm vô.","Ngoµi ra, ta cßn gióp ng­¬i <color=red>TÈy ®iÓm tiÒm n¨ng<color>, giê ng­¬i cã thÓ an t©m céng ®iÓm.","NhÊn <color=yellow><F3><color> më trang bŞ nh©n vËt, dïng <color=yellow>§iÓm kinh nghiÖm<color> ®Ó t¨ng cÊp.");
	if GetAntiEnthrallmentStatus() == 1 then
            Earn(10)
	    ModifyExp(5)
        elseif GetAntiEnthrallmentStatus() == 2 then

        else
            Earn(20)
            GivePlayerExp(SKeyXinShou,"yeshou1")
        end

	SetTask(807,1);	--¿ª·ÅĞÂÊÖÈÎÎñ
	Msg2Player("T©n thñ th«n mçi khi t¨ng cÊp nhí t×m D· TÈu nhËn nhiÖm vô T©n thñ!");
	TE_SetTeachPro(2)
end


-- Íæ¼ÒµÈ¼¶µ½ÁËµÚ¶ş¼¶µÄÊ±ºòÇ°À´¶Ô»°
function Teach_Level02()
local strMain =  "Ng­¬i lÇn l­ît ®èi tho¹i víi <color=yellow>Chñ tiÖm vò khİ<color>, <color=yellow>Chñ tiÖm phôc trang<color>, <color=yellow>Chñ tiÖm t¹p hãa<color> vµ <color=yellow>Chñ d­îc ®iÕm<color> trong thµnh. NÕu gÆp vÊn ®Ò g× cã thÓ nhÊn <color=yellow><F11><color> t×m hiÓu thªm nhiÖm vô."
	Say(strMain,1,"BiÕt råi!/TE_SetTeachAdd"); -- TEACH_SEASONNPC_ID Ó¦Îª 3
	Msg2Player("NhËn nhiÖm vô ®i t×m chñ tiÖm vò khİ!");
	TE_SetTeachPro(1)

end


-- Íæ¼ÒÔÚµÈ¼¶¶şÊ±ÓëÎäÆ÷µêÀÏ°åµÄ¶Ô»°
function Teach_Level02_01()

	local strMain = {
	
		"Ng­¬i chİnh lµ ng­êi mµ D· TÈu nh¾c ®Õn ­? LÇn sau ®i ®­êng nhí nhÊn <color=yellow><R><color> ®Ó ®i cho nhanh. ë ®©y cã mét sè binh khİ kh«ng biÕt ng­¬i cã thİch kh«ng?",
		"Thanh kiÕm nµy tuyÖt qu¸!",
		"NhÊn <color=yellow><F4><color> më tói hµnh trang, <color=yellow><F3><color> më trang bŞ nh©n vËt, dïng chuét tr¸i ®Æt vËt phÈm vµo « t­¬ng øng ®Ó sö dông.",
	}
	
	TE_Talk(getn(strMain),"Teach_Level02_01_01",strMain);
end


function Teach_Level02_01_01()
	Say("Cã muèn ta giíi thiÖu ®Õn c¸c tiÖm kh¸c trong th«n nµy kh«ng?",2,"C¶m phiÒn tiÒn bèi!/acc_wuqi","Kh«ng cÇn ®©u!/rej_wuqi");
end

function acc_wuqi()
local strMain = {
	"N¬i ®©y cã <color=yellow>TiÖm vò khİ<color>, <color=yellow>TiÖm trang phôc<color>, <color=yellow>T¹p hãa<color>, <color=yellow>D­îc ®iÕm<color>, Töu lÇu, Kim hoµn, tiÒn trang. <color=yellow>TiÖm vò khİ<color>, <color=yellow>tiÖm trang phôc<color> b¸n trang bŞ c¬ b¶n d­íi cÊp 4. <color=yellow>D­îc ®iÕm<color> b¸n d­îc liÖu d­íi cÊp 2. <color=yellow>T¹p hãa<color> b¸n c¸c lo¹i bïa chó, vËt dông, ngoµi ra cßn tu söa vµ gi¸m ®Şnh vËt phÈm. <color=yellow>TiÒn trang<color> cã thÓ ®æi ng©n phiÕu. Xem trªn b¶n ®å nhá sÏ thÊy dÔ dµng.",
	"Còng gièng nh­ tiÒn bèi ®©y µ?",
	"Trong trß ch¬i cßn mét sè nh©n vËt cung cÊp c¸c chøc n¨ng ®Æc biÖt nh­: D· TÈu, Gi¸m §Şnh s­, Sø gi¶ m«n ph¸i, Sø gi¶ Bang ph¸i, ng­êi ®Êu gi¸, ng­êi vÊn ®¸p…",
	}
	TE_Talk(getn(strMain),"acc_wuqi_01",strMain);
end;


function acc_wuqi_01()
local strMain = {
	"Nh÷ng ng­êi nµy lµm g×?",
	"<color=yellow>D· TÈu<color> h­íng dÉn cho T©n thñ, <color=yellow>Sø gi¶ m«n ph¸i<color> gióp ng­êi ch¬i dÔ dµng gia nhËp m«n c¸c m«n ph¸i, <color=yellow>Sø gi¶ Bang ph¸i<color> gióp ng­êi ch¬i kiÕn lËp, gia nhËp, rêi khái bang ph¸i, <color=yellow>Ng­êi ®Êu gi¸<color> thu mét sè phİ nhÊt ®Şnh gióp ng­êi ch¬i b¸n vËt phÈm, <color=yellow>ng­êi vÊn ®¸p<color> thu thËp tin tøc ng­êi ch¬i trªn m¹ng, gióp gi¶i ®¸p mäi th¾c m¾c.",
	"Ta hiÓu råi!"
	}
	TE_Talk(getn(strMain),"rej_wuqi",strMain);
end;





function rej_wuqi()
	local strMain = {
		"Ta kh«ng cßn g× ®Ó nãi, ng­¬i mau t×m chñ tiÖm trang phôc ®i!",
	}
	TE_Talk(getn(strMain),"Teach_Level02_02",strMain);
end

-- Íæ¼ÒÓëÎäÆ÷µêÀÏ°å¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿²¢ÇÒµÃµ½ÎäÆ÷
function Teach_Level02_02()
        if GetAntiEnthrallmentStatus() == 1 then
            AddItem(0,2,14,1)
	    Msg2Player("B¹n nhËn ®­îc 1 c©y HiÖp ThiÕu kiÕm!");
        elseif GetAntiEnthrallmentStatus() == 2 then

        else
	    
        end

        Msg2Player("§Õn gÆp chñ tiÖm trang phôc!");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 4
end


-- Íæ¼ÒÓëÎäÆ÷µêÀÏ°å¶Ô»°½áÊøºóÓë·ş×°µêÀÏ°åµÄ¶Ô»°
function Teach_Level02_03()
	local strMain = {
		"TiÖm ta b¸n trang phôc tèt nhÊt vïng nµy cã thÓ gióp ng­¬i t¨ng phßng thñ néi ngo¹i lÉn s¸t th­¬ng. Lùa chän vµi mãn cho m×nh ®i!",
		"Tèt qu¸, tÆng cho ta µ?",
		"D¹o nµy lµm ¨n khÊm kh¸, ng­¬i cã thÓ chän mét trong ba c¸i, cßn l¹i ®Ó ta b¸n cho ng­êi kh¸c.",
		"Nh÷ng thø nµy cã g× kh¸c biÖt kh«ng?"		
	}
	
	TE_Talk(getn(strMain), "Teach_Level02_04", strMain);

end


-- Íæ¼ÒÓëÎäÆ÷µêÀÏ°å¶Ô»°½áÊøºóÓë·ş×°µêÀÏ°åµÄ¶Ô»°
function Teach_Level02_04()

	Say("Søc phßng thñ cña nãn vµ giµy thÊp h¬n trang phôc. Ng­¬i muèn chän lo¹i nµo?",3,"Ta cÇn nãn/Teach_Level02_04_Hat","Ta cÇn trang phôc/Teach_Level02_04_Clothing","Ta cÇn giµy/Teach_Level02_04_Shoes")

end

-- Íæ¼ÒÑ¡ÔñÁËÃ±×Ó
function Teach_Level02_04_Hat()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,103,1,1)
	elseif i==2 then
		AddItem(0,103,19,1)
	elseif i==3 then
		AddItem(0,103,37,1)
	else
		AddItem(0,103,55,1)
	end
    end
		TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 5
		Teach_Level02_05()
end

-- Íæ¼ÒÑ¡ÔñÁËÒÂ·ş
function Teach_Level02_04_Clothing()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,100,1,1)
	elseif i==2 then
		AddItem(0,100,19,1)
	elseif i==3 then
		AddItem(0,100,37,1)
	else
		AddItem(0,100,55,1)
	end
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 5
	Teach_Level02_05()
end

-- Íæ¼ÒÑ¡ÔñÁËĞ¬×Ó
function Teach_Level02_04_Shoes()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,101,1,1)
	elseif i==2 then
		AddItem(0,101,19,1)
	elseif i==3 then
		AddItem(0,101,37,1)
	else
		AddItem(0,101,55,1)
	end
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 5
	Teach_Level02_05()
end


-- Íæ¼ÒÁìÁË¶«Î÷Ö®ºó¼ÌĞøÓë·ş×°µêÀÏ°å¶Ô»°
function Teach_Level02_05()
	
	local strMain = {
		"NhÊn <color=yellow><F4><color> më giao diÖn hµnh trang, <color=yellow><F3><color> më trang bŞ nh©n vËt, dïng chuét tr¸i ®­a trang phôc (nãn, giµy) vµo thanh trang bŞ ®Ó tiÖn sö dông.",

	}
	TE_Talk(getn(strMain), "Teach_Level02_05_01", strMain);
end

function Teach_Level02_05_01()
	Say("VËt phÈm trong game phong phó, ng­¬i muèn t×m hiÓu chóng kh«ng?",2,"C¶m phiÒn tiÒn bèi!/acc_fuzhuang","GhĞ ch¬i th«i!/rej_fuzhuang");
end

function acc_fuzhuang()
local strMain = {
		"VËt phÈm chia lµm 4 lo¹i gåm: <color=yellow>trang bŞ<color>, <color=yellow>vËt phÈm tiªu hao<color>, <color=yellow>vËt phÈm thu thËp<color> vµ <color=yellow>vËt phÈm nhiÖm vô<color>.",
		"<color=yellow>Trang bŞ<color> gåm vò khİ, nãn, trang phôc, giµy, trang søc, trong ®ã vò khİ, nãn, trang phôc, giµy chñ yÕu t¨ng søc ®¸nh, trang søc chñ yÕu t¨ng mét sè thuéc tİnh ®Æc biÖt. Trang bŞ s¬ cÊp cã thÓ mua t¹i tiÖm, cßn trang bŞ cao cÊp ph¶i th«ng qua thuËt ®óc luyÖn trong kü n¨ng sèng míi cã. PhÇn lín trang bŞ ®Òu ph©n biÖt giíi tİnh, ®¼ng cÊp, thÓ h×nh vµ vâ c«ng l­u ph¸i, ngoµi ra thó c­ìi vµ mËt tŞch còng cã thÓ trang bŞ.",
		"<color=yellow>vËt phÈm tiªu hao<color> chñ yÕu gåm d­îc liÖu, thùc phÈm, vµ mét sè nguyªn liÖu cho kü n¨ng sèng, chóng cã thÓ xÕp chång trong thanh vËt phÈm. D­îc liÖu cÊp thÊp cã thÓ mua t¹i tiÖm; nguyªn liÖu cho kü n¨ng sèng th«ng qua ®¸nh qu¸i cã ®­îc hoÆc lµm nhiÖm vô; thùc phÈm vµ d­îc liÖu cao cÊp ph¶i th«ng qua bµo chÕ. Mét nguyªn liÖu cã thÓ n©ng cao ®¼ng cÊp nh­ng cÇn ph¶i chän lùa kü.",
		}		
	TE_Talk(getn(strMain), "acc_fuzhuang_01", strMain);		
end;


function acc_fuzhuang_01()
local strMain = {
		"<color=yellow>vËt phÈm thu thËp<color> chØ nh÷ng vËt phÈm ®Æc biÖt ®¸nh qu¸i r¬i ra. Ng­êi ch¬i cho c¸c tiÖm, Th­¬ng Nh©n thÇn bİ hoÆc dïng lµm nhiÖm vô.",
		"<color=yellow>vËt phÈm nhiÖm vô<color> chñ yÕu chØ nh÷ng vËt phÈm gióp ng­êi ch¬i lµm nhiÖm vô, bªn c¹nh ®ã còng cã mét sè vËt phÈm ®Æc biÖt, kh«ng thÓ vøt bá hoÆc giao dŞch.",
		"VËt phÈm sau khi vøt ra bªn ngoµi, ng­êi ch¬i xung quanh cã thÓ nhÆt lÊy. Ngoµi ra khi rít chóng tån t¹i trong thêi gian nhÊt ®Şnh, qu¸ thêi gian tù ®éng biÕn mÊt.",
		"Chó ı vËt phÈm cã träng l­îng nhÊt ®Şnh, nÕu v­ît qu¸ 50% sÏ ¶nh h­ëng ®Õn tèc ®é håi phôc m¸u, qu¸ 95% kh«ng thÓ chiÕn ®Êu.",
		}		
	TE_Talk(getn(strMain), "rej_fuzhuang", strMain);		
end;


function rej_fuzhuang()
	local strMain = {
		"Ta ®· h­íng dÉn xong, ng­¬i cã thÓ qua chñ tiÖm t¹p hãa thØnh gi¸o.",
	}
	TE_Talk(getn(strMain),"",strMain);
	Msg2Player("§Õn gÆp Chñ T¹p hãa!");
end;



-- Íæ¼ÒÓëÔÓ»õµêÀÏ°åµÄ¶Ô»°
function Teach_Level02_06()
	local strMain = {
		"Kh¸ch quan cÇn g×? Chç ta cã ®Çy ®ñ c¸c mÆt hµng, gåm <color=yellow>vËt phÈm hç trî<color>, <color=yellow>bïa chó<color> vµ <color=yellow>vËt dông h»ng ngµy<color>.",
		"<color=yellow>vËt phÈm hç trî<color> chØ nh÷ng vËt phÈm dïng cho c¸c chiªu thøc vâ c«ng ®Æc biÖt nh­ MÆc Tö kiÕm ph¸p, Th¸i HuyÒn thÇn c«ng; <color=yellow>bïa chó<color> cã gi¸m ®Şnh phï vµ håi thµnh phï; <color=yellow>vËt dông h»ng ngµy<color> chØ vËt phÈm nh­ lß luyÖn ®¬n, kĞo...",
		"Ngoµi nh÷ng vËt phÈm trªn cßn g× n÷a kh«ng?",
	}
	TE_Talk(getn(strMain), "Teach_Level02_06_01", strMain);
end


function Teach_Level02_06_01()
	Say("Ng­¬i ®· hái nh­ vËy th× ta còng giíi thiÖu lu«n vÒ {Trang bŞ b¸t qu¸i}.",2,"Ta thİch quan t©m chuyÖn nµy!/acc_zahuo","C¸i g× ta còng biÕt hÕt råi!/rej_zahuo");
end;

function acc_zahuo()
	local strMain = {
		"Sau nµy sÏ b¾t thÊy <color=yellow>trang bŞ cã 3 thuéc tİnh Èn<color> vµ <color=yellow>Hµo th¹ch<color> tİch tô linh khİ trêi ®Êt. Trang bŞ thuéc tİnh Èn gåm vò khİ, nãn, trang phôc vµ giµy. Hµo th¹ch cã ©m d­¬ng 2 lo¹i. §em 3 viªn hµo th¹ch theo thø tù ©m d­¬ng t×m thî rÌn <color=red>kh¶m n¹m<color> lªn trang bŞ Èn lµ cã thÓ hîp thµnh mét mét mãn trang bŞ mang <color=yellow>thuéc tİnh B¸t qu¸i<color>. Mét sè Hµo th¹ch mang thuéc tİnh phô gióp t¨ng c­êng thªm cho trang bŞ sau khi ®­îc kh¶m n¹m.",	
		"Khi ng­êi ch¬i cã tõ 2 trang bŞ b¸t qu¸i trë lªn chóng sÏ tù kİch ho¹t lÉn nhau tõ ®ã s¶n sinh ra thuéc tİnh phô. Vİ dô Can kiÕm vµ Kh«n m·o kİch ho¹t xong sÏ hiÖn ra mét thuéc tİnh míi trªn mçi trang bŞ. NÕu 4 trang bŞ ®Òu lµ trang bŞ b¸t qu¸i th× cã thÓ kİch ho¹t 12 thuéc tİnh phô.",
		"Hay qu¸! Ngoµi ®¸nh qu¸i ra cßn c¸ch nµo nhËn ®­îc trang bŞ b¸t qu¸i n÷a kh«ng?",
		"Ng­¬i còng cã thÓ häc c¸ch ®óc luyÖn trang bŞ qua <color=yellow>kü n¨ng sèng<color>, thu thËp nguyªn liÖu trong lóc chÕ t¹o trang bŞ thªm hµo th¹ch ©m d­¬ng vµo nÕu thµnh c«ng sÏ nhËn ®­îc trang bŞ b¸t qu¸i. §ång thêi chóng cßn s¶n sinh <color=yellow>thuéc tİnh ngò hµnh<color>. Nh­ng tû lÖ thµnh c«ng rÊt thÊp, İt ng­êi lµm ®­îc trang bŞ nµy.",
	}
	TE_Talk(getn(strMain), "Teach_Level02_06_02", strMain);
end;


function Teach_Level02_06_02()
	local strMain = {
		"Thuéc tİnh ngò hµnh cã t¸c dông g×?",
		"<color=yellow>Thuéc tİnh ngò hµnh<color> chØ vò khİ vµ trang phôc: Vò khİ chØ lùc ®¸nh cña ng­êi ch¬i, trang phôc chØ phßng thñ cña ng­êi ch¬i, vò khİ kh«ng mang thuéc tİnh ngò hµnh, trang phôc ®­îc xem kh«ng thuéc tİnh. Thuéc tİnh ngò hµnh h¬n kh«ng thuéc tİnh lµ 25% cho søc c«ng thñ; Ngò hµnh dùa theo Kim kh¾c Méc, Méc kh¾c Thæ, Thæ kh¾c Thñy, Thñy kh¾c Háa, Háa kh¾c Kim thø tù tİnh thªm 50% cho c«ng thñ; ngoµi ra c«ng thñ nÕu ®ång thuéc tİnh th× søc ®¸nh gi¶m 25%.",
		"Hay qu¸, ta nhÊt ®Şnh häc kü n¨ng chÕ t¹o trang bŞ.",
	}
	TE_Talk(getn(strMain), "rej_zahuo", strMain);
end;


function rej_zahuo()
	local strMain = {
		"Chç ta chØ cã 2 tÊm <color=yellow>Gi¸m ®Şnh phï<color> th«i. VËt phÈm ®¸nh qu¸i r¬i ra ®Òu ch­a qua gi¸m ®Şnh. NhÊn <color=yellow><F4><color> më tói hµnh trang, dïng chuét ph¶i nhÊn vµo gi¸m ®Şnh phï sau ®ã ®­a vµo trang bŞ lµ cã thÓ biÕt ®­îc thuéc tİnh cña chóng.",
		"ThÇn kú vËy sao? §a t¹ ®· chØ gi¸o!"
	}
	TE_Talk(getn(strMain), "Teach_Level02_07", strMain);
end;




-- Íæ¼ÒÓëÔÓ»õµêÀÏ°å¶Ô»°½áÊøºóµÃµ½ÎïÆ·²¢¸Ä±äÈÎÎñ±äÁ¿
function Teach_Level02_07()
    if GetAntiEnthrallmentStatus() == 0 then
	AddItem(2,5,1,2)
	Msg2Player("B¹n nhËn ®­îc 2 tÊm Gi¸m ®Şnh phï!")
    elseif GetAntiEnthrallmentStatus() == 1 then

    else
	AddItem(2,5,1,1)
	Msg2Player("B¹n nhËn ®­îc 1 tÊm Gi¸m ®Şnh phï!")
    end
    Msg2Player("§Õn gÆp Chñ D­îc ®iÕm !");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 6
end


-- Íæ¼ÒÓëÒ©µêÀÏ°åµÄ¶Ô»°
function Teach_Level02_08()
	Say("Ng­¬i míi b­íc ch©n ra giang hå còng nªn häc hái mét chót kiÕn thøc vÒ y d­îc.",2,"C¶m phiÒn tiÒn bèi!/acc_yaodian","GhĞ ch¬i th«i!/rej_yaodian");
end


function acc_yaodian()
local strMain = {
	"D­îc liÖu gåm <color=yellow>phôc håi sinh lùc<color>, <color=yellow>phôc håi néi lùc<color>, <color=yellow>trŞ liÖu ngo¹i th­¬ng<color>, <color=yellow>trŞ liÖu néi th­¬ng<color> vµ <color=yellow>trŞ liÖu b¨ng, ®éc<color>; d­îc liÖu håi phôc sinh lùc cã thÓ mua t¹i d­îc ®iÕm, d­îc liÖu håi phôc néi lùc rÊt İt gi¸ l¹i cao, cßn mét sè d­îc liÖu trŞ c¸c triÖu chøng b¨ng, ®éc...th× cµng khã t×m.",
	"D­îc liÖu c¬ b¶n cã thÓ mua t¹i l·o phu, nh÷ng d­îc liÖu cao cÊp ph¶i th«ng qua bµo chÕ cña thÇn y. NÕu ng­¬i cã høng thó, ®¹t cÊp 10 cã thÓ t×m <color=yellow>Du Ph­¬ng ®¹i phu<color> häc thuËt bµo chÕ thuèc.",
			}
	TE_Talk(getn(strMain), "rej_yaodian", strMain);
end;


function rej_yaodian()
	local strMain = {
		"§i l¹i trong giang hå nhí cÈn thËn, nÕu cã bŞ th­¬ng lËp tøc quay l¹i t×m ta. Ta cã 2 b×nh <color=yellow>Kim S¸ng t¸n<color>, h·y mang theo cã lóc h÷u dông.",
	}
	TE_Talk(getn(strMain), "Teach_Level02_09", strMain);
end;


-- Íæ¼ÒÓëÒ©µêÀÏ°å¶Ô»°½áÊøºóµÃµ½ÎïÆ·²¢¸Ä±äÈÎÎñ±äÁ¿
function Teach_Level02_09()
    if GetAntiEnthrallmentStatus() == 0 then
        Earn(100)
	ModifyExp(30)
	AddItem(1,0,2,2)
	Msg2Player("B¹n nhËn ®­îc 2 b×nh d­îc liÖu!");
    elseif GetAntiEnthrallmentStatus() == 1 then
        Earn(50)
	ModifyExp(15)
	AddItem(1,0,2,1)
	Msg2Player("B¹n nhËn ®­îc 1 b×nh d­îc liÖu!");
    elseif GetAntiEnthrallmentStatus() == 2 then
    end

    	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 7
    	Msg2Player("Hoµn thµnh nhiÖm vô th¨m hái, ®Õn cÊp 3 ®i t×m D· TÈu!");
	TE_SetTeachPro(2)
end


-- Íæ¼ÒµÈ¼¶Éıµ½µÚÈı¼¶µÄÊ±ºòÀ´ÓëÒ°ÛÅ¶Ô»°
function Teach_Level03()
	Say("Tr«ng ng­¬i vÊt v¶! NhÊn phİm <color=yellow><R><color> ®Ó ®i cho nhanh. Cã bŞ l¹c ®­êng kh«ng?",2,"Ta l¹c ®­êng råi!/acc_milu","Kh«ng sao!/rej_milu")
end


function acc_milu()
	local strMain = {
		"<color=yellow>B¶n ®å nhá<color> ë gãc ph¶i trªn mµn h×nh. <color=yellow>DÊu chÊm vµng<color> x¸c ®Şnh vŞ trİ ng­¬i ®ang ®øng. NhËp vŞ trİ vµo 2 <color=yellow>Täa ®é<color> X, Y ®Ó x¸c ®Şnh n¬i cÇn ®Õn.",
		"Cã thÓ nhÊn phİm <+> trªn bµn phİm hoÆc dïng chuét ®Ó phãng to, thu nhá b¶n ®å<color>",
	}
	TE_Talk(getn(strMain), "rej_milu", strMain);
end;


function rej_milu()
	local strMain = {
		"Sau nµy cã g× kh«ng râ cã thÓ ®Õn gÆp ta hoÆc nhÊn <color=yellow><F11><color> ®Ó xem h­íng dÉn.",
		"HiÓu råi, ®a t¹ ®· chØ gi¸o!",
		"Víi c«ng lùc cña ng­¬i hiÖn giê ra ngoµi rÊt nguy hiÓm! Nªn ®Õn <color=yellow>Vâ s­<color> häc vµi chiªu phßng th©n. Tr­íc khi ®Õn ®ã nhí t×m mét miÕng <color=yellow>ThŞt thá<color> cho «ng ta.",
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain);  -- TEACH_SEASONNPC_ID Ó¦Îª 8
	Msg2Player("NhËn nhiÖm vô ®i t×m mét miÕng thŞt thá cho vâ s­.");
	TE_SetTeachPro(1)
end;




-- Íæ¼ÒÓëÎäÊ¦µÄ¶Ô»°
function Teach_Level03_01()
	local strMain = {
		"D· tÈu b¶o ta ®Õn t×m «ng häc mét vµi mãn vâ.",
		"§­îc th«i, tr­íc tiªn ta sÏ d¹y ng­¬i <color=yellow>ngåi thiÒn<color=>.",
		"Ngåi thiÒn……®Ó lµm g×? Ta chØ muèn häc vâ.",
		"Ng­¬i ®õng xem th­êng ngåi thiÒn, nã cã thÓ gióp ng­¬i håi phôc sinh lùc vµ néi lùc.",
		"Ngåi b»ng c¸ch nµo vËy?",
		"NhÊn phİm <color=yellow><V><color> ngåi xuèng khİ huyÕt sÏ tõ tõ håi phôc.",
		"HiÓu råi!",		
		}
	TE_Talk(getn(strMain), "Teach_Level03_01_01", strMain);
end


function Teach_Level03_01_01()

	Say("§Ó ta chØ ng­¬i mét vµi c¸ch ®Ó chiÕn ®Êu.",2,"Tèt qu¸, phiÒn «ng chØ gi¸o./acc_killnpc","Th«i ®Ó ta tù t×m hiÓu/rej_killnpc")
end

function acc_killnpc()
	local strMain = {
		"ChiÕn ®Êu víi qu¸i gióp ng­êi ch¬i lµm nhiÖm vôt¨ng <color=yellow>®iÓm kinh nghiÖm<color>. Cã hai c¸ch <color=yellow>chiÕn ®Êu th­êng<color> vµ <color=yellow>PK<color>!",
		"PK lµ g×?",
		"ChiÕn ®Êu PK ta sÏ nãi sau, giê ta muèn nh¾c ®Õn chiÕn ®Êu th­êng gi÷a ng­êi ch¬i víi NPC (qu¸i), ng­¬i cã thÓ ra ngoµi thµnh nhÊp chuét vµo qu¸i mµ ng­¬i muèn ®¸nh. NÕu gia nhËp m«n ph¸i häc ®­îc c¸c chiªu thøc th× uy lùc ®¸nh qu¸i sÏ t¨ng gÊp béi.",
	}
	TE_Talk(getn(strMain), "acc_killnpc_01", strMain);
end;


function acc_killnpc_01()
	local strMain = {
		"NÕu h¹ ®­îc qu¸i ng­¬i sÏ nhËn ®­îc ®iÓm kinh nghiÖm hoÆc vËt phÈm; cßn nÕu bŞ qu¸i h¹ sÏ bŞ tæn thÊt 1% kinh nghiÖm hiÖn t¹i, 5% ng©n l­îng vµ mét sè ®iÓm danh väng.",
		"NÕu ®¸nh qu¸i cÇn chó ı ®Õn ®iÒu g×?",
		"Khi ®¸nh qu¸i cÇn ®Ó ı ®Õn thanh m¸u mµu xanh trªn ®Çu, nhÊn <color=yellow><F8><color> ®Ó t¾t më, khi thanh mµu xanh chuyÓn qua mµu vµng cho thÊy tİnh mÖnh ng­¬i gÆp nguy hiÓm. Ngoµi ra ta cÇn ®Ò phßng c¸c qu¸i ë xa ngoµi thµnh hay trong c¸c mª cung.",
		"¤ng cã thÓ kÓ cho ta nghe c¸c NPC (qu¸i) m¹nh kh«ng?"
	}
	TE_Talk(getn(strMain), "rej_killnpc", strMain);
end;




function rej_killnpc()
	local strMain = {
		"NPC chñ yÕu c¸c ®éng vËt, mét sè cao thñ m«n ph¸i...Ph­¬ng thøc chiÕn ®Êu cña chóng ph©n biÖt <color=yellow>tÊn c«ng bŞ ®éng<color>, <color=yellow>tÊn c«ng chñ ®éng<color>, <color=yellow>tÊn c«ng nh×n râ<color>, <color=yellow>bao v©y<color>, <color=yellow>®¸nh lĞn<color>, trong ®ã tÊn c«ng chñ ®éng lµ lîi h¹i nhÊt.",
		"TÊn c«ng bŞ ®éng lµ ta ®¸nh chóng míi ®¸nh tr¶, bao v©y vµ ®¸nh lĞn còng dÔ hiÓu, vËy cßn tÊn c«ng nh×n râ lµ sao?",
		"Mét sè cao thñ néi c«ng tr­íc khi xuÊt chiªu ®Òu ph¶i qua qu¸ tr×nh vËn khİ, bªn c¹nh ®ã c¸c NPC nhanh nhÑn quan s¸t ®¸nh tr¶ ®èi ph­¬ng tr­íc.",
		"TÊt c¶ NPC ®Òu cã <color=yellow>thuéc tİnh ngò hµnh<color>, hiÓu ®­îc tİnh t­¬ng sinh t­¬ng kh¾c mµ chän vò khİ thİch hîp sÏ gióp ta dÔ dµng ®¸nh chóng.",
	}
	TE_Talk(getn(strMain), "rej_killnpc_01", strMain);
end;


function rej_killnpc_01()
	local strMain = {
		"Trang bŞ vµ vò khİ thuéc tİnh ngò hµnh quan träng ®Õn vËy sao!",
		"Còng kh«ng h¼n lµ vËy nh­ng ph¶i ®Ò phßng NPC <color=yellow>thuéc tİnh ©m<color>, chóng kh«ng sî vò khİ th­êng, vò khİ ngò hµnh, vâ c«ng th«ng th­êng rÊt khã h¹ gôc chóng.",
		"Sao nhiÒu vËy? Ta nªn tr¸nh NPC nµo ®©y?",
		}
	TE_Talk(getn(strMain), "rej_killnpc_02", strMain);
end;

function rej_killnpc_02()
	local strMain = {

		"Chó ı tªn cña NPC, nÕu <color=red>mµu ®á<color> lµ nguy hiÓm. Ngoµi ra mét sè qu¸i Boss cã <color=blue>mµu xanh<color> hoÆc <color=yellow>mµu vµng<color>.",
		"Xin cho hái thªm, ngoµi nh÷ng tæn thÊt khi bŞ qu¸i h¹ gôc cã ¶nh h­ëng ®Õn tİnh m¹ng kh«ng?",
		"SÏ kh«ng cã tö vong, chØ cã bŞ ¶nh h­ëng ®Õn <color=yellow>ngo¹i th­¬ng<color> hoÆc <color=yellow>néi th­¬ng<color>, NÕu bŞ h¹ gôc ng­¬i cã thÓ chän vÒ thµnh hoÆc ®îi Nga My phËt gia ®Õn cøu. NÕu cøu sèng chØ mÊt tiÒn vµ ®iÓm danh väng.",
		"Chñ d­îc ®iÕm cã nãi nÕu bŞ th­¬ng cã thÓ mua mét sè d­îc liÖu quı trŞ, vËy ph¶i mua chóng ë ®©u?",
		"Ng­¬i ®Õn t×m ®ång ®éi ®· häc qua <color=yellow>kü n¨ng luyÖn ®¬n<color> lÊy <color=yellow>th¸nh d­îc<color>, nÕu kh«ng ph¶i qua mét thêi gian dµi míi håi phôc.",
		"Xin ®a t¹ ®· chØ gi¸o!",
		}
	TE_Talk(getn(strMain), "Teach_Level03_02", strMain);
end;


-- Íæ¼ÒÓëÎäÊ¦¶Ô»°½áÊøºóÑ§µ½¼¼ÄÜ²¢¸Ä±äÈÎÎñ±äÁ¿
function Teach_Level03_02()

	if (GetItemCount(1,3,1) >= 1) then
		DelItem(1,3,1,1)
	else
		Say("NÕu cã 1 miÕng <color=yellow>ThŞt thá<color> uèng víi r­îu ®©y th× tuyÖt qu¸!",0);
	end
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(100)
	ModifyExp(50)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(50)
	ModifyExp(25)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end

	Msg2Player("NhiÖm vô hoµn thµnh ®¹t cÊp 4 ®i t×m D· TÈu!");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 9
	TE_SetTeachPro(2)
end


-- Íæ¼Òµ½ÁËµÈ¼¶ 4 Ö®ºóÀ´ÓëÒ°ÛÅµÄ¶Ô»°
function Teach_Level04()

	local strMain = {
		"MÊy ngµy qua cã g× vui kh«ng?",
		"Ch¶ cã g× thó vŞ! Ngoµi ®èi tho¹i vµ ®¸nh qu¸i ra, nÕu cã ai ®ã <color=yellow>t¸n gÉu<color> th× vui biÕt mÊy!",
		}
	TE_Talk(getn(strMain), "teach_chat", strMain); 
end		
		
function teach_chat()
	Say("§­îc! Ta sÏ chØ cho ng­¬i c¸ch t¸n gÉu.",2,"Hay qu¸, xin ng­êi chØ gi¸o!/acc_chat","GhĞ ch¬i th«i!/rej_chat")	
end;		
		
function acc_chat()
local strMain = {
		"NhÊn phİm <color=yellow>Enter<Enter><color> hoÆc chän c¸c nót <color=yellow>tÇn sè<color> gãc tr¸i bªn d­íi mµn h×nh, trong khung t¸n gÉu nhËp tin tøc nhÊn Enter<Enter> ®Ó göi ®i.",
		"Cã nhiÒu tÇn sè t¸n gÉu. <color=yellow>Phô cËn<color> ng­êi ch¬i xung quanh nh×n thÊy; <color=yellow>C«ng céng<color> ng­êi ch¬i toµn m¸y chñ nh×n thÊy; <color=yellow>HÖ thèng<color> hiÓn thŞ tin tøc; <color=yellow>§éi ngò<color> chØ trong ®éi míi thÊy; <color=yellow>M«n ph¸i<color> chØ thuéc cïng m«n ph¸i míi thÊy; <color=yellow>Bang ph¸i<color> chØ ng­êi trong bang míi thÊy.",
		"Sao cã lóc chän tÇn sè råi vÉn kh«ng t¸n gÉu ®­îc?",
		"§Ó ®¶m b¶o chÊt l­îng t¸n gÉu, mçi tÇn sè ®Òu cã h¹n chÕ. TÇn sè m«n ph¸i cÇn ng­êi ch¬i ph¶i gia nhËp m«n ph¸i, gi·n c¸ch 1 phót. TÇn sè c«ng céng ®ßi hái ng­êi ch¬i trªn cÊp 30, gi·n c¸ch 3 phót. TÇn sè bŞ h¹n chÕ sÏ hiÖn <color=red>mµu ®á<color>.",
		"Th× ra lµ nh­ vËy!",
		}
	TE_Talk(getn(strMain), "rej_chat", strMain); 		
end;

function rej_chat()
	Say("Ngoµi t¸n gÈu, ta cßn gióp ng­¬i c¸ch <color=yellow>Giao h¶o b¹n bÌ<color>, cã muèn nghe kh«ng?",2,"Xin ng­êi chØ gi¸o!/acc_friend","C¸i g× ta còng hiÓu hÕt råi!/rej_friend")
end;


function acc_friend()
local strMain = {
		"NÕu muèn h¶o h÷u víi ai chØ cÇn nhÊn phİm<color=yellow><Ctrl><color> + chuét ph¶i chØ lªn ®èi ph­¬ng, chän <color=yellow>H¶o h÷u<color>, lóc nµy hÖ thèng sÏ cã th«ng b¸o cho ®èi ph­¬ng. NÕu ®ång ı tªn ng­êi ®ã sÏ hiÖn trong b¶ng H¶o h÷u cña m×nh. NhÊn <color=yellow><F6><color> kiÓm tra l¹i!",
		"Cßn muèn trë thµnh tri kû hoÆc phu thª th× ph¶i lµm sao?",
		"Sau khi trë thµnh h¶o h÷u sÏ cã thªm <color=yellow>§iÓm th©n thiÖn<color>. Ng­êi ch¬i b×nh th­êng tæ ®éi ®¸nh qu¸i, t¸n gÉu còng ®­îc tİnh ®iÓm th©n thiÖn. Mét sè vËt phÈm ®Æc biÖt nh­ <color=yellow>Hoa hång<color> còng gióp t¨ng th©n thiÖn. NÕu trªn 1000 ®iÓm th©n thiÖn cã thÓ <color=yellow>KÕt NghÜa Kim Lan<color>. Trªn 1500 ®iÓm, hai ng­êi kh¸c giíi cã thÓ ®Õn C« ®¶o t×m NguyÖt L·o kÕt thµnh <color=yellow>Phu thª<color>.",
		"H¶o h÷u, kim lan hoÆc phu thª b×nh th­êng cïng tæ ®éi luyÖn c«ng sÏ ®­îc tİnh thªm kinh nghiÖm.",
		"Th¶o nµo gÇn ®©y cã nhiÒu ng­êi xin ®­îc tæ ®éi.",
	}
	TE_Talk(getn(strMain), "rej_friend", strMain); 
end;

function rej_friend()
	local strMain = {
		"§i l¹i trong giang hå ng­¬i cÇn cã thªm nhiÒu h¶o h÷u. LÇn sau nhí cïng ®ång ®éi ®Õn ®©y ta sÏ cã quµ tÆng c¸c ng­¬i.",
		"NhÊt ®Şnh ta sÏ quay l¹i.",
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID Ó¦Îª 10
	Msg2Player("NhËn nhiÖm vô ®­a ®ång ®éi ®Õn gÆp D· TÈu.");
	TE_SetTeachPro(1)
end;



-- Íæ¼ÒÔÙ´Î´øÅóÓÑÀ´ÓëÒ°ÛÅ¶Ô»°
-- ´«Èë²ÎÊı£º1 ÎªÒÑ¾­×é¶Ó  2 Îª»¹Ã»ÓĞ×é¶Ó  3 ÎªÑ¡²»ÖªµÀÔõÃ´×é¶Ô  4 ÎªÑ¡»¹Ã»ÓĞ×é¶Ó
function Teach_Level04_01(nState)
	local strMain = {
		"Cã mãn quµ nhá tÆng c¸c ng­¬i, hy väng hai ng­êi sÏ lµ h¶o h÷u tèt cña nhau.",
		"Muèn g¹t ta ­? <color=yellow>h¶o h÷u<color> cña ng­¬i ®©u?",
		"NhÊn <color=yellow>tæ ®éi<color>, mêi ng­êi kh¸c gia nhËp tæ ®éi sau ®ã ®Õn t×m ta.",
		"NhiÒu ng­êi ®Õn t×m ta råi, ng­¬i cßn kh«ng nhanh ch©n!"
	}
	
	if (nState==1) then
		Talk(1,"Teach_Level04_02",strMain[1]);
	elseif (nState==2) then
		Talk(1,"",strMain[2]);
	elseif (nState==3) then
		Talk(1,"",strMain[3]);
	elseif (nState==4) then
		Talk(1,"",strMain[4]);
	end
	
	return
	
end


-- µ±Íæ¼ÒÒÑ¾­´ø×ÅÅóÓÑ×é¶ÓÀ´ÓëÒ°ÛÅ¶Ô»°Ê±£¬·¢Óè½±Àø²¢¸Ä±äÈÎÎñ±äÁ¿
function Teach_Level04_02()

	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local nBooks = {30,31,32,33,34,35,36} -- Òª·¢¸øÍæ¼ÒµÄÊéµÄËæ»úÊı½áºÏ

	if (nMemCount == 0) then -- Èç¹ûÍæ¼Òµ½ÕâÒ»²½Î´×é¶Ó£¬Ôò·µ»Ø
		return
	else
	    if GetAntiEnthrallmentStatus() == 0 then
		for i=1,nMemCount do
			PlayerIndex = GetTeamMember(i)
			AddItem(0,15,nBooks[random(getn(nBooks))],1)
			Msg2Player("B¹n nhËn ®­îc mét quyÓn mËt tŞch!")
		end
		
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
		Earn(100)
		ModifyExp(80)
            elseif GetAntiEnthrallmentStatus() == 1 then
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
		Earn(50)
		ModifyExp(40)
            elseif GetAntiEnthrallmentStatus() == 2 then
            end


		Msg2Player("Hoµn thµnh nhiÖm vô h¶o h÷u ®Õn cÊp 5 quay l¹i t×m D· TÈu.");
	end
	
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 11
	TE_SetTeachPro(2)
	return

end


-- Íæ¼Òµ½ÁËµÈ¼¶ 5 Ê±Ç°À´ÓëÒ°ÛÅ¶Ô»°
function Teach_Level05()

	local strMain = {	
		"Xem ng­¬i mÖt mái nh­ vËy ch¾c lµ ch­a häc qua <color=yellow>khinh c«ng<color>, lÇn tr­íc vâ s­ ch­a d¹y ng­¬i µ?",
		"ChØ häc täa thiÒn, ch­a häc khinh c«ng.",
		"Ra ngoµi thµnh ®¸nh b¹i mÊy tªn <color=yellow>L­u manh<color> lÊy <color=yellow>5 b×nh Thiªu töu<color> ®­a cho Vâ s­, nhÊt ®Şnh sÏ häc ®­îc Khinh c«ng."	
	}
	
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID Ó¦Îª 12
	Msg2Player("NhËn nhiÖm vô ra ngoµi thµnh t×m 5 b×nh Thiªu töu cho vâ s­!");
	TE_SetTeachPro(1)
	
end


-- Íæ¼Ò´øÁËÉÕ¾ÆÈ¥ÕÒÎäÊ¦Ê±µÄ¶Ô»°
function Teach_Level05_01()
	if (GetItemCount(2,1,12) >= 5) then
		DelItem(2,1,12,5)
		Say("ChØ cã D· TÈu míi hiÓu l·o phu ta! Xem ra ta ph¶i d¹y ng­¬i m«n vâ häc nµy råi! TiÕp theo ta sÏ nãi ng­¬i nghe vÒ PK.",2,"PhiÒn «ng chØ gi¸o!/acc_fight","Kh«ng cÇn ®©u!/rej_fight");
	else
		Say("MÖt qu¸! Ph¶i uèng r­îu th«i! Cã 5 b×nh <color=yellow>Thiªu töu<color> mµ ng­¬i mang còng kh«ng ®ñ µ?.",0);
		return -- Èç¹ûÔÚÕâÀïÃ»ÓĞÉÕ¾ÆµÄ»°ÈÔÈ»·µ»Ø
	end
end

function acc_fight()
	local strMain = {		
		"<color=red>PK<color> chØ chiÕn ®Êu gi÷a ng­êi ch¬i víi nhau, chİnh lµ cõu s¸t trªn giang hå. Ng­êi ch¬i bËt PK trong chiÕn ®Êu khi chÕt sÏ mÊt nhiÒu kinh nghiÖm vµ ng©n l­îng, ®iÓm PK cao khi chÕt cã thÓ r¬i trang bŞ trªn ng­êi; tranh chÊp víi nhau ng­êi ch¬i th­êng dïng PK ®Ó quyÕt ®Şnh th¾ng thua.",
		"VËy ng­êi ch¬i cÊp thÊp trong game dÔ gÆp nguy hiÓm l¾m µ?",
		"Ng­¬i cã thÓ an t©m, hÖ thèng ®· h¹n chÕ c¸c kiÓu PK, b¶o ®¶m an toµn cho ng­êi ch¬i kh¸c.",
		"Xin nãi râ thªm.",
		"Tr­íc tiªn, lµ b¶o vÖ T©n thñ, ng­êi ch¬i ch­a gia nhËp m«n ph¸i mang ch÷ mµu tr¾ng kh«ng thÓ tham gia PK còng kh«ng bŞ ng­êi kh¸c PK. ChØ khi gia nhËp m«n ph¸i míi cã thÓ ®ãng më ®­îc PK.",
		"NÕu ng­êi ch¬i kh«ng bËt PK mµ bŞ ng­êi kh¸c PK th× sao?"	,	
	}
	TE_Talk(getn(strMain), "acc_fight1", strMain);
end;


function acc_fight1()
	local strMain = {
		"Gia nhËp giang hå chuyÖn ®å s¸t nhau lµ kh«ng thÓ tr¸nh khái. Nh÷ng ng­êi cè t×nh PK sÏ bŞ trõng ph¹t.",
		"Trõng ph¹t PK nh­ thÕ nµo?",
		"Trong chiÕn ®Êu chñ ®éng giÕt mét ng­êi ®iÓm PK sÏ t¨ng 1;®iÓm PK cµng cao ng­êi ch¬i cã kh¶ n¨ng rít ®å, mÊt ®iÓm kinh nghiÖm, ng©n l­îng cµng nhiÒu.",
		"VËy PK cã mÊy lo¹i?",		
		"Cã 4 lo¹i PK: LuyÖn c«ng, bang ph¸i chiÕn ®Êu, cõu s¸t vµ giÕt thï.",
		"PK luyÖn c«ng kh«ng g©y s¸t h¹i ®Õn ng­êi ch¬i kh¸c; PK chiÕn ®Êu bang ph¸i kh«ng ¶nh h­ëng nh÷ng ng­êi trong bang kÓ c¶ liªn minh; ®å s¸t ngoµi h¶o h÷u ra cã thÓ tÊn c«ng bÊt kú ai; giÕt thï dïng muèn giÕt mét ai ®ã.",
	}
	TE_Talk(getn(strMain), "acc_fight2", strMain);
end;

function acc_fight2()
	local strMain = {
		"Ng­êi ch¬i bËt chøc n¨ng giÕt thï cã thÓ giÕt bÊt kú ai ngoµi ng­êi ch¬i ch÷ tr¾ng.",
		"Do giÕt thï mang tİnh chÊt c¸ nh©n ¶nh h­ëng rÊt nhiÒu nªn møc trõng ph¹t nÆng h¬n PK: GiÕt 1 ng­êi, PK t¨ng 2 ®iÓm.",
		"NÕu thÊy ®¸nh kh«ng th¾ng ®èi ph­¬ng nªn nhanh chãng chuyÓn sang tr¹ng th¸i chiÕn ®Êu b×nh th­êng, tho¸t khái bŞ trõng ph¹t.",
		"Khi chän mét trong 3 h×nh thøc PK, 3 phót sau míi cã thÓ chuyÓn sang tr¹ng th¸i kh¸c.",
		"Ng­êi ch¬i ®¸nh l«i ®µi, vËn tiªu, c­íp tiªu tİnh PK hay giÕt thï?",			
	}
	TE_Talk(getn(strMain), "acc_fight3", strMain);
end;




function acc_fight3()
	local strMain = {
		"L«i ®µi, c­íp tiªu lµ h×nh thøc chiÕn ®Êu kh¸c gi÷a ng­êi ch¬i. Cã thÓ gäi lµ nhiÖm vô chiÕn.",
		"NhiÖm vô chiÕn, PK vµ giÕt thï kh«ng gièng nhau. H×nh thøc nhiÖm vô kh¸c nhau th× quy ®Şnh PK còng kh¸c nhau.",
		"Ng­êi bŞ ®iÓm PK tèi ®a, khi bŞ ®èi ph­¬ng h¹ gôc ngoµi rít ®å trªn ng­êi ra cßn cã h×nh ph¹t nµo kh¸c n÷a kh«ng? B»ng c¸ch nµo ®Ó gi¶m ®iÓm PK?",
	}
	TE_Talk(getn(strMain), "acc_fight4", strMain);
end;


function acc_fight4()
	local strMain = {
		"Ng­êi ch¬i khi ®iÓm PK= 3 tªn sÏ ®æi mµu ®á, kh«ng thÓ vµo thµnh; ®èi víi nh÷ng ng­êi PK qu¸ cao ®«i lóc quan phñ còng ph¸i cao thñ ®i tÇm n·. NÕu tö vong trong giai ®o¹n nµy b¹n sÏ bŞ nhèt vµo ®¹i lao.",
		"Ng­êi ch¬i trong ®¹i lao hoÆc ë bªn ngoµi ®Òu gi¶m ®­îc PK. Trong lao mçi giê gi¶m ®­îc 1 ®iÓm PK, ngoµi lao 2 giê online gi¶m ®­îc 1 ®iÓm PK. VÒ h×nh ph¹t cã thÓ hái bé ®Çu ë nha m«n.",
	}
	TE_Talk(getn(strMain), "rej_fight", strMain);
end;


function rej_fight()
	local strMain = {
		"B©y giê ta d¹y ng­¬i Khinh c«ng, xem kü nhĞ!",
	}
	TE_Talk(getn(strMain), "Teach_Level05_02", strMain);
end;



-- Íæ¼ÒÓëÎäÊ¦¶Ô»°½áÊøÒÔºóÑ§»áÁËÇá¹¦²¢¸Ä±äÈÎÎñ±äÁ¿
function Teach_Level05_02()
	LearnSkill(20);
	Msg2Player("B¹n häc ®­îc khinh c«ng!");
	Say("Ta ®· d¹y hÕt cho ng­¬i råi, cè g¾ng rÌn luyÖn thªm!",0);
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(120)
        elseif GetAntiEnthrallmentStatus() == 1 then
	    Earn(50)
	    ModifyExp(60)
        elseif GetAntiEnthrallmentStatus() == 2 then
        end

	Msg2Player("Hoµn thµnh nhiÖm vô ®¹t cÊp 6 t×m D· TÈu!");
	
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 13
	TE_SetTeachPro(2)
end


-- Íæ¼ÒµÈ¼¶µ½ÁË 6 ¼¶Ö®ºóÀ´ÓëÒ°ÛÅ¶Ô»°
function Teach_Level06()
	local strMain = {
		"Nghe nãi 10 v¹n Liªu Binh ®ang tiÕn vÒ Nh¹n M«n Quan! H·y mau gióp t×m <color=yellow>Chñ th­¬ng héi<color>, ng­êi chŞu tr¸ch nhiÖm cung cÊp vËt t­ cho qu©n ®éi."
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID Ó¦Îª 14
	Msg2Player("NhËn nhiÖm vô ®i t×m chñ th­¬ng héi!");
	TE_SetTeachPro(1)
	return
end


-- Íæ¼ÒÈ¥ºÍÉÌ»áÀÏ°å¶Ô»°
function Teach_Level06_01()
	local strMain = {
		"RÊt vui khi cã ng­¬i gióp søc, qu©n ®éi hiÖn thiÕu d­îc liÖu, h·y ®i t×m <color=yellow>3 c¸t c¸nh<color> vµ <color=yellow>3 X¹ h­¬ng<color> vÒ ®©y!",
		"C¸t c¸nh cã thÓ ®¸nh thá x¸m ngoµi rõng, X¹ h­¬ng ®¸nh l­u manh r¬i ra hoÆc mua ë chñ d­îc ®iÕm."
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID Ó¦Îª 15
	Msg2Player("Thu thËp 3 c¸t c¸nh vµ 3 X¹ h­¬ng!");
end


-- Íæ¼ÒÕÒÆëÁË½Û¹£ºÍ÷êÏãÖ®ºóÔÙÀ´ÕÒÉÌ»áÀÏ°å
function Teach_Level06_02()
	if (GetItemCount(1,2,2) >= 3) and (GetItemCount(1,2,4) >= 3) then
			DelItem(1,2,2,3)
			DelItem(1,2,4,3)
		Say("VÊt v¶ cho ng­¬i qu¸! Cø ®¸nh qu¸i luyÖn c«ng th× còng buån, cã muèn nghe nhiÖm vô trong trß ch¬i kh«ng?",2,"PhiÒn tiÒn bèi giíi thiÖu mét chót/acc_shanghui","C¸i g× ta còng hiÓu hÕt råi!/rej_shanghui");	
	else
		Say("VÉn ch­a t×m ®ñ vËt liÖu µ?",0);
	end
end

function acc_shanghui()
	local strMain = {
		"HiÖn ng­¬i ®ang lµm nhiÖm vô t©n thñ, nÕu hoµn thµnh cã thÓ nhËn ®­îc phÇn th­ëng ®ång thêi hiÓu ®­îc mét phÇn hÖ thèng nhiÖm vô trong trß ch¬i.",
		"BÊt cø lóc nµo còng cã thÓ ®Õn t×m ta nhËn nhiÖm vô, tïy theo ®¼ng cÊp mµ nhËn nhiÖm vô thu thËp t­¬ng øng, liªn tiÕp hoµn thµnh 10 nhiÖm vô sÏ nhËn ®­îc phÇn th­ëng ®Æc biÖt cña th­¬ng héi.",
		"Thó vô nh­ vËy sao?",
		"§óng vËy! Kú thùc trªn giang hå cßn nhiÒu nh©n vËt giang hå víi nh÷ng c©u chuyÖn truyÒn kú mµ ta ch­a ®­îc biÕt, ng­¬i thö ®èi tho¹i víi hä xem!",
		"Xin h·y nãi nh÷ng nhiÖm vô sau nµy ta ph¶i lµm.",
		"§îi ng­¬i ®¹t cÊp 10, gia nhËp m«n ph¸i, ®Õn lóc ®ã sÏ nhËn ®­îc nhiÖm vô s­ m«n, nhiÖm vô bang héi, nhiÖm vô hoµng kim, nhiÖm vô chung…",
	}
	TE_Talk(getn(strMain), "rej_shanghui", strMain);
end;

function rej_shanghui()
	local strMain = {
		"Tèt qu¸! Nh­ng khi lµm nhiÖm vô th­¬ng héi qu¸ søc søc lùc th× sao?",
		"B«n ba giang hå kh«ng thÓ thiÕu r­¬ng cÊt gi÷ vËt phÈm, <color=yellow>thî méc<color> trong thµnh chuyªn gióp lµm r­¬ng, ta ®· gióp ng­¬i ®­a <color=yellow>3 m¶nh Tinh thiÕt<color>, chØ cÇn tèn thªm mét İt ng©n l­îng lµ cã thÓ sö dông.",
	}
	TE_Talk(getn(strMain), "Teach_Level06_03", strMain);

end;


-- ÔÚÕâÀïÉ¾³ıÉÌ»áÀÏ°åĞèÒªµÄÎïÆ·£¬·¢Óè½±Àø²¢¸Ä±äÈÎÎñ±äÁ¿
function Teach_Level06_03()
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(300)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(150)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 16
	Msg2Player("T×m thî méc lµm r­¬ng chøa ®å!");
	return
end


-- ÓëÄ¾½³µÄ¶Ô»°
function Teach_Level06_04()

	Say("Ng­¬i cÇn ta gióp g×?",2,"PhiÒn tiÒn bèi lµm gióp ta mét c¸i r­¬ng!/Teach_Level06_05","Nh©n tiÖn ghĞ qua th«i./Teach_Exit");

end


-- ÊÇ·ñÒÑ¾­×ö¹ı´¢ÎïÏäµÄ¼ì²â
function Teach_Level06_05()

	local nHaveBox = GetTask(805)
	
	if (nHaveBox==1) then -- Èç¹ûÒÑ¾­ÓĞÁË´¢ÎïÏä
		Say("Ta ®· gióp ng­¬i lµm r­¬ng, quªn råi sao?",0);
	elseif (GetCash(500)>=1) and  (TE_GetTeachState()==17) then  --×öĞÂÊÖÈÎÎñµÄÈËÕÒÆë²ÄÁÏ
		
			Teach_Level06_06() -- ¸øÍæ¼ÒÒ»¸ö´¢ÎïÏä
	elseif (GetCash(500)>=1) and (GetItemCount(2,2,1)>=3) and (GetTask(807)==0) then   --²»×öĞÂÊÖÈÎÎñµÄÈËÕÒÆë²ÄÁÏ
			open_box()  --¸øÍæ¼ÒÒ»¸ö´¢ÎïÏä
	elseif  (TE_GetTeachState() < 15) then
		if GetTask(807)==0 then  
			Say("Ng­¬i ch­a lµm nhiÖm vô T©n thñ, thËt sù muèn lµm r­¬ng ch­a ®å kh«ng?",2,"Ta ®ang cÇn mét c¸i r­¬ng/acc_box","§Ó ta suy nghÜ l¹i/no");
		else
			Say("Ng­¬i hiÖn ®ang lµm nhiÖm vô T©n thñ, r­¬ng ch­a ®å ®Ó sau h·y tİnh!",0);			end
		
	elseif (TE_GetTeachState()==16) then -- Èç¹û¸Õ´ÓÉÌ»áÀÏ°åÄÇÀï¹ıÀ´
		
			-- ËµÍê»°ºó TEACH_SEASONNPC_ID Ó¦Îª 17
			Talk(1,"TE_SetTeachAdd","Chñ th­¬ng héi ®· ®­a ta 3 miÕng s¾t nh­ng lµm r­¬ng cÇn phİ 5 l­îng, ®îi ng­¬i t×m ®ñ råi quay l¹i!");
			Msg2Player("ChuÈn bŞ 5 l­îng lµm r­¬ng chøa ®å");
	elseif  (TE_GetTeachState() == 25 and  GetTask(807)==0  )then
			Say("Ng­¬i ch­a lµm nhiÖm vô T©n thñ, thËt sù muèn lµm r­¬ng kh«ng?",2,"Ta ®ang cÇn mét c¸i r­¬ng/acc_box","§Ó ta suy nghÜ l¹i/no");

	else
		
			Say("NÕu kh«ng cã 3 miÕng s¾t vµ 5 l­îng, ta kh«ng thÓ lµm r­¬ng chøa ®å.",0);
		
	end

end

--Ã»×öĞÂÊÖÈÎÎñÇ¿ÖÆÒªÇó´¢ÎïÏä
function acc_box()
	Talk(1,"","Ng­¬i ra ngoµi thµnh ®¸nh sãi, t×m ®ñ nguyªn liÖu vÒ ®©y ta sÏ gióp ng­¬i lµm mét c¸i r­¬ng.");
end;

--Ã»×öĞÂÊÖÈÎÎñµÄÈË·ÅÆú´¢ÎïÏä
function no()
end;

--¸ø²»×öĞÂÊÖÈÎÎñµÄÍæ¼ÒÒ»¸ö´¢ÎïÏä
function open_box()
	SetTask(805,1) -- ÕâÊÇÒ»¸öÁÙÊ±±äÁ¿£¬´æ´¢Íæ¼ÒÊÇ·ñÒÑ¾­ÓĞ´¢ÎïÏä
	DelItem(2,2,1,3) -- ÔÚÕâÀïÉ¾ÁË¾«Ìú
	Pay(500)
	Say("R­¬ng chøa ®å ®· lµm xong, ta ®Ó ë cç <color=yellow>dŞch tr¹m<color>, ng­¬i cã thÓ ®Õn ®ã cÊt gi÷ vËt phÈm.",0);
end;


-- ÔÚÕâÀï¸ø×öĞÂÊÖÈÎÎñµÄÍæ¼ÒÒ»¸ö´¢ÎïÏä
function Teach_Level06_06()
	SetTask(805,1) -- ÕâÊÇÒ»¸öÁÙÊ±±äÁ¿£¬´æ´¢Íæ¼ÒÊÇ·ñÒÑ¾­ÓĞ´¢ÎïÏä
	Pay(500)
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 18
	Say("R­¬ng chøa ®å ®· lµm xong, ta ®Ó ë <color=yellow>dŞch tr¹m<color>, ng­¬i cã thÓ ®Õn ®ã cÊt gi÷ vËt phÈm. B©y giê ta muèn giíi thiÖu cho ng­¬i vÒ kü n¨ng sèng, cã muèn nghe kh«ng?",2,"C¶m phiÒn tiÒn bèi!/acc_liveskill","Kh«ng cÇn ®©u!/rej_liveskill");
end

function acc_liveskill()
	local strMain = {
		"Kü n¨ng sèng ph©n biÖt cã kü n¨ng gia truyÒn, ®óc binh khİ dµi, ®óc binh khİ ng¾n, ®óc kú m«n binh khİ, chÕ t¹o ¸o gi¸p, luyÖn ®¬n, nÊu n­íng vµ luyÖn bïa.",
		"Kü n¨ng gia truyÒn lµ b¶n lÜnh cña ng­êi ch¬i, cã thÓ kh«ng dïng nguyªn liÖu trùc tiÕp mµ dïng thÓ lùc lµm ra {b¸nh ng«} vµ {B¨ng}.",
		"Kü n¨ng ®óc luyÖn binh khİ dµi, ®óc luyÖn binh khİ ng¾n, ®óc luyÖn kú m«n binh khİ cã thÓ häc t¹i thî rÌn Thµnh §«.",
		"Kü n¨ng chÕ t¹o Hé gi¸p cã thÓ häc t¹i CÈm N­¬ng Thµnh §«. Sau nµy cã thÓ sö dông c¸c lo¹i Chøc cÈm vµ da thó ®Ó may c¸c lo¹i trang vŞ b¶o hé gi¸ trŞ!",
	}
	TE_Talk(getn(strMain), "acc_liveskill_01", strMain);
end;

function acc_liveskill_01()
	local strMain = {
		"Kü n¨ng luyÖn ®¬n häc t¹i Du Ph­¬ng ®¹i phu Thµnh §«. Sau khi häc xong cã thÓ dïng c¸c lo¹i th¶o d­îc chÕ t¹o ra {Linh ®¬n}",			"Kü n¨ng nÊu n­íng häc t¹i ngù trï BiÖn Kinh.",
		"Kü n¨ng luyÖn bïa häc t¹i Du Ph­¬ng ®¹o sÜ BiÖn Kinh. Häc xong ta cã thÓ chÕ t¹o Håi phï, gi¸m ®Şnh phï.",				
		"Sö dông kü n¨ng sèng tèn thÓ lùc nhÊt ®Şnh. Ngoµi kü n¨ng gia truyÒn ra nh÷ng kü n¨ng kh¸c muèn t¨ng cÊp ph¶i qua luyÖn tËp, mçi ng­êi chØ cã thÓ häc 3 kü n¨ng sèng. Muèn xãa bá kü n¨ng ®· häc ph¶i th«ng qua ph­¬ng ph¸p ®Æc biÖt.",
		"L­u ı nh÷ng kü n¨ng ®Òu cã ®¼ng cÊp h¹n chÕ, muèn häc kü n¨ng sèng cao cÊp ta ph¶i gia nhËp bang ph¸i hoÆc ra ngoµi thµnh t×m cao nh©n chØ gi¸o."
	}
	TE_Talk(getn(strMain), "rej_liveskill", strMain);
end;



function rej_liveskill()
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(150)
	ModifyExp(150)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(75)
	ModifyExp(75)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end
	Msg2Player("NhiÖm vô hoµn thµnh ®¹t cÊp 7 t×m D· TÈu!");
	TE_SetTeachPro(2)
	return
end;


-- Íæ¼Òµ½ÁËµÚ 7 ¼¶µÄÊ±ºòÀ´ÓëÒ°ÛÅ¶Ô»°
function Teach_Level07()
	Say("Ng­¬i muèn häc c¸ch kiÕm tiÒn kh«ng?",2,"Nhê tiÒn bèi chØ gi¸o!/acc_getmoney","Kh«ng cÇn ®©u!/rej_getmoney");
end



function acc_getmoney()
	local strMain = {
		"Cã nhiÒu c¸ch ®Ó kiÕm ng©n l­îng, nh­ng ®¬n gi¶n nhÊt lµ ra ngoµi thµnh ®¸nh qu¸i mang vËt phÈm vÒ b¸n hoÆc lµm nhiÖm vô.",
		"§em vËt phÈm ®¸nh qu¸i nhÆt ®­îc vÒ thµnh, nhÊn <F4>, më giao diÖn bµy b¸n, ®Æt vËt phÈm vµo shop, niªm yÕt gi¸ c¶sau ®ã nhÊn *§ång ı* lµ cã thÓ bµy b¸n.",
	}
	TE_Talk(getn(strMain), "acc_getmoney1", strMain);
end;


function acc_getmoney1()
	local strMain = {
		"Bµy b¸n lµ c¸ch ®Ó kiÕm tiÒn nhanh nhÊt nh­ng bÊt tiÖn lµ kh«ng lµm ®­îc nhiÖm vô kh¸c.",
		"Ng­êi ch¬i cã thÓ ®em vËt phÈm ®Õn cho <color=yellow>Ng­êi ®Êu gi¸<color> trong c¸c thµnh ®Ó b¸n ®Êu gi¸. Lóc nµy vËt phÈm cña ng­êi ch¬i sÏ do ng­êi ®Êu gi¸ ®­a ra. NÕu nh­ giao dŞch thµnh c«ng th× tiÒn tù ®éng sÏ chuyÓn vµo r­¬ng ng­êi ch¬i, cßn nÕu thÊt b¹i th× hÖ thèng sÏ tr¶ l¹i vËt phÈm. Tïy theo gi¸ trŞ vËt phÈm b¸n ra mµ tİnh thuÕ. C¸ch b¸n nµy chØ nªn ¸p dông cho nh÷ng vËt phÈm quı, vËt phÈm th­êng nªn bµy b¸n.",
		"VËt phÈm th«ng th­êng ®em <color=yellow>bµy b¸n<color> , vËt phÈm quı th× <color=yellow>®Êu gi¸<color> ®óng kh«ng?",
	}
	TE_Talk(getn(strMain), "rej_getmoney", strMain);
end

function rej_getmoney()
	local strMain = {
		"MÊy h«m tr­íc ta cã tróng mét tÊm <color=yellow>ng©n phiÕu<color> nh­ng ch­a cã thêi gian ®i l·nh, ng­¬i gióp ta ®­îc kh«ng?",
	}
	TE_Talk(getn(strMain), "Teach_Level07_01", strMain);
	Msg2Player("NhËn nhiÖm vô t×m chñ tiÒn trang l·nh ng©n phiÕu!");
end;

-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿
function Teach_Level07_01()

	TE_SetTeachPro(1)
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 19

end


-- ÓëÇ®×¯ÀÏ°åµÄ¶Ô»°
function Teach_Level07_02()

	local strMain = {
		"§©y lµ <color=yellow>Ng©n phiÕu<color> cña D· TÈu, xin nhËn lÊy!",
		"Sao gièng tÊm giÊy vÏ bïa cña mÊy ®¹o sÜ vËy!",
		"Haha! Ng­¬i lÇm to råi! §©y chİnh lµ <color=red>TÊm thÎ giê ch¬i<color>, do <color=yellow>tiÒn trang BiÖn Kinh<color> ph¸t hµnh. Sau khi n¹p thÎ ng­êi ch¬i cã thÓ chän ®æi thµnh giê ch¬i hoÆc ng©n phiÕu, cÇn thiÕt ®Õn tiÒn trang BiÖn Kinh ®æi thµnh giê ch¬i.",
		"§a t¹ ®· chØ gi¸o!",
		"Cho ta göi lêi th¨m hái ®Õn D· TÈu."
	
	}
	if (TE_GetTeachState()==19) then
		TE_Talk(getn(strMain), "Teach_Level07_03", strMain);
		Msg2Player("Mang ng©n phiÕu vÒ cho D· TÈu!");		
	elseif (TE_GetTeachState()==20) and (GetItemCount(2,0,1)==0) then  -- Èç¹ûÍæ¼Ò¶ªÊ§ÁËÈÎÎñµÀ¾ßºóµÄ²¹³¥
                AddItem(2,0,1,1)
		Say("Sao gÊp vËy? Ng©n phiÕu ch­a lÊy ®· véi ®i råi?",0);
		Msg2Player("Mang ng©n phiÕu vÒ cho D· TÈu!");
		return
	end

end


-- ÓëÇ®×¯ÀÏ°å¶Ô»°ºóµÃµ½ÒøÆ±²¢¸Ä±äÈÎÎñ±äÁ¿
function Teach_Level07_03()
    if GetAntiEnthrallmentStatus()~= 2 then
	AddItem(2,0,1,1)
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 20
	
end


-- »ØÀ´ÓëÒ°ÛÅ¶Ô»°
function Teach_Level07_04()
	
	-- TEACH_SEASONNPC_ID Ó¦Îª 21
	TE_SetTeachPro(2)
	Talk(1,"TE_SetTeachAdd","§Õn cÊp tiÕp theo nhí quay l¹i t×m ta!");
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(170)
        elseif GetAntiEnthrallmentStatus() == 1 then
            Earn(50)
	    ModifyExp(85)
        else
        end
	Msg2Player("NhiÖm vô hoµn thµnh ®¹t cÊp 8 quay l¹i t×m D· TÈu!");

end


-- Íæ¼Òµ½ÁË 8 ¼¶ºóÓëÒ°ÛÅµÄ¶Ô»°
function Teach_Level08()
	local strMain = {
		"Ta cã thÓ gióp g× cho ng­¬i?",
		"GÇn ®©y bu«n b¸n còng khÊm kh¸, nh­ng tiÒn mang theo trªn ng­êi kh«ng tiÖn. TiÒn bèi biÕt chç nµo cÊt gi÷ ng©n l­îng kh«ng?",
		"Më r­¬ng chän <color=yellow>Göi tiÒn<color> sau ®ã nhËp sè tiÒn cÇn göi, nhÊn *§ång ı*. T­¬ng tù cho <color=yellow>Rót tiÒn<color>.",
		"Ta ®· thö nh­ng ph¶i nhËp ®Õn 3 ch÷ sè, vËy lµ sao?",
		"H×nh thøc giao dŞch gåm <color=yellow>vµng<color>, <color=yellow>b¹c<color> vµ <color=yellow>tiÒn ®ång<color>, 1 l­îng vµng = 100 l­îng b¹c, 1 l­îng b¹c = 100 tiÒn ®ång. HÖ thèng sÏ tù ®éng ®æi sè tiÒn b¹n cã vÒ sè ®¬n gi¶n nhÊt."
	
	}
	TE_Talk(getn(strMain),"Teach_Level08_01",strMain);

end


-- Ò°ÛÅ¶Ô»°µÄÑ¡Ôñ
function Teach_Level08_01()

	Say("Cßn g× ch­a râ kh«ng?",2,"HiÓu råi!/Teach_Level08_02","Ch­a hiÓu!/Teach_Money");

end


-- ÌıÃ÷°×ÁËÒ°ÛÅµÄ»°ºó¸Ä±äÈÎÎñ±äÁ¿
function Teach_Level08_02()

	local strMain = {	
		"Ch­a hiÓu ®Ó ta nãi l¹i.",
		"Cã khi nµo tiÒn bèi gÆp vÊn ®Ò nan gi¶i kh«ng?",
		"Nh¾c tíi míi nhí, lÇn tr­íc cã ng­êi hái 6 vÊn ®Ò liªn quan ®Õn thËp ®¹i <color=yellow>m«n ph¸i<color>, ta Êp óng tr¶ lêi kh«ng ®­îc. ChuyÖn nµy mµ truyÒn ra ngoµi th× mÊt mÆt qu¸!",
		"TiÒn bèi cÇn ta ®Õn thËp ®¹i m«n ph¶i hái th¨m kh«ng?",
		"Ng­¬i ®i mét chuyÕn gióp ta hái râ c¸c thËp ®¹i m«n ph¸i. Mçi m«n ph¸i ®Òu cã <color=yellow>Sø gi¶ m«n ph¸i<color> ®øng gi÷a qu·ng tr­êng, ®Õn nãi chuyÖn víi lµ ®­îc."
	}
	TE_Talk(getn(strMain),"TE_SetTeachAdd",strMain); -- TEACH_SEASONNPC_ID Ó¦Îª 22
	Msg2Player("NhËn nhiÖm vô ®i t×m hiÓu c¸c m«n ph¸i!");
	TE_SetTeachPro(1)
	

end


-- Íæ¼Ò»ØÀ´»Ø´ğÒ°ÛÅµÄÎÊÌâ
function Teach_Level08_03()

	Say("Ng­¬i hiÓu râ ®Æc s¾c cña thËp ®¹i m«n ph¸i ch­a?",2,"HiÓu råi!/Teach_Qustion_001","Ch­a hiÓu l¾m!/Teach_Exit");
	return

end


-- Èç¹ûÍæ¼ÒÈ«²¿»Ø´ğÕıÈ·ÁËÎÊÌâÔò·¢Óè½±Àø²¢ÇÒ¸Ä±äÈÎÎñ±äÁ¿
function Teach_Level08_04()
	Say("Ng­¬i biÕt g× vÒ SÜ, HiÖp, Èn tam ®¹i l­u ph¸i?",2,"PhiÒn tiÒn bèi gi¶i thİch/acc_route","Ta biÕt råi!/rej_route");
end


function acc_route()
	local strMain = {
	
		"SÜ, HiÖp, Èn thùc tÕ chØ h­íng tu luyÖn cña nh©n vËt. Theo <color=yellow>SÜ<color> cã th©n thÓ c­êng tr¸ng vµ søc m¹nh h¬n ng­êi. Theo <color=yellow>HiÖp<color> søc m¹nh vµ nhanh nhÑn c©n b»ng. Theo <color=yellow>Èn<color> kh«ng quan träng bªn ngoµi, chñ yÕu rÌn luyÖn tinh thÇn.",
		"Ta nªn tu luyÖn h­íng nµo?",
		"Ng­¬i ch­a gia nhËp m«n ph¸i, sao chän ®­îc h­íng ®i, nªn th©n träng khi ®­a ra quyÕt ®Şnh.",
		"TiÒn bèi cã thÓ cho ta biÕt râ h¬n kh«ng?",
	}
	TE_Talk(getn(strMain),"acc_route1",strMain);

end;


function acc_route1()
	local strMain = {
	        "ThËt ra theo h­íng nµo còng cã ­u ®iÓm riªng cña nã, cÇn ph¶i chän lùa s­ phô sau khi gia nhËp m«n ph¸i.",	        
		"NhiÒu m«n ph¸i vµ nhiÒu h­íng tu luyÖn, ta ph¶i lµm sao?",
	        "Tu hµnh tïy mçi ng­êi th«i!",
	        "§a t¹ ®· chØ gi¸o!",	
	}
	TE_Talk(getn(strMain),"rej_route",strMain);

end;



function rej_route()
	Say("Ng­¬i h·y t×m hiÓu kü c¸c m«n ph¸i vµ h­íng ®i cho riªng m×nh. Ta kh«ng cßn g× d¹y ng­¬i, ®¹t cÊp 9 h·y quay l¹i ®©y!",0);
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(200)
        elseif GetAntiEnthrallmentStatus() == 1 then
            Earn(50)
	    ModifyExp(100)
        else
        end
	TE_SetTeachAdd(); -- TEACH_SEASONNPC_ID Ó¦Îª 23
	Msg2Player("NhiÖm vô hoµn thµnh ®¹t cÊp 9 ®Õn t×m D· TÈu!");
	TE_SetTeachPro(2)
end


-- Èç¹ûÍæ¼Òµ½ÁË 9 ¼¶µÄÊ±ºòÔÙÀ´ÕÒÒ°ÛÅ
function Teach_Level09()

	local strMain = {
	
		"Ng­¬i cã biÕt v× sao ta l¹i h­íng dÉn tËn t×nh nh­ vËy kh«ng?",
		"Kh«ng biÕt!",
		"ChuyÖn dµi dßng l¾m, ®îi ng­¬i luyÖn ®Õn <color=yellow>cÊp 10<color> h·y tİnh",
		"……§­îc! Ta sÏ cè g¾ng!"
	
	}
	TE_Talk(getn(strMain),"TE_SetTeachAdd",strMain); -- TEACH_SEASONNPC_ID Ó¦Îª 24
	Msg2Player("NhËn nhiÖm vô ®¹t cÊp 10 chøng minh t­ chÊt cña m×nh!");
	
end


-- Èç¹ûÍæ¼Òµ½ÁË 10 ¼¶µÄÊ±ºòÔÙÀ´ÕÒÒ°ÛÅ
function Teach_Level10()

	local strMain = {
	
		"Qu¶ nhiªn ta nh×n kh«ng lÇm ng­êi.",
		"30 n¨m tr­íc th¸i tæ TriÖu Khu«ng DÉn ®o¹t ®­îc <color=yellow>b¶n ®å S¬n Hµ X· T¾c<color> tõ tay Sµi Vinh, bİ mËt liªn l¹c c¸c m«n ph¸i cïng t×m b¶n ®å kho b¸u bªn trong ®ång thêi ph¸t ®éng binh biÕn TrÊn kiÒu, m­u ®å so¸i vŞ. Kh«ng ai biÕt ®ã chİnh lµ tÊm b¶n ®å cña Thiªn, §Şa, Nh©n <color=yellow>Tam Giíi chÊn phï<color>, long m¹ch cña Trung Nguyªn, b¸u vËt mµ Sµi Vinh ®em tİnh m¹ng ra giµnh lÊy. ViÖc lµm cña th¸i tæ dÉn ®Õn trêi ®Êt c¨m phÉn, trong ngµy ®¹i lÔ tÕ trêi, S¬n Hµ X· T¾c ®ét nhiªn hãa thµnh tro bôi, bay ®i kh¾p n¬i.",
		"Th¸i tæ biÕt m×nh ®· lµm nghŞch ı trêi, ®¶o lén cµn kh«n tam giíi, yªu ma hiÖn thÕ, Trung Nguyªn s¾p l©m vµo ®¹i kiÕp. §Ó söa sai lÇm, mét mÆt chÊn chØnh l¹i c¸c côc diÖn, mÆt kh¸c bè c¸o thiªn h¹, hy väng t×m ®­îc ng­êi kiÕm l¹i nh÷ng m¶nh b¶n ®å S¬n Hµ X· T¾c.",
	}
	TE_Talk(getn(strMain),"Teach_Level10_01",strMain);

end


-- Íæ¼ÒÌıÒ°ÛÅËµÍê¹ÊÊÂºóÁìµ½½±Àø²¢¸Ä±äÈÎÎñ±äÁ¿
function Teach_Level10_01()
	local strMain = {
		"C©u chuyÖn t­ëng chõng ch×m vµo quªn l·ng. §ét nhiªn cã tin Th¸i tæ b¹o bÖnh qua ®êi, ng­êi kÕ vŞ kh«ng ph¶i th¸i tö TriÖu §øc Ph­¬ng mµ lµ Hoµng ®Ö TriÖu Quang NghÜa. Tin ®ån lan truyÒn ra ngoµi, 10 v¹n Liªu qu©n lËp tøc tiÕn s¸t <color=yellow>Nh¹n M«n Quan<color>. Mét sè hµo kiÖt lai lŞch kh«ng râ ®· chiÕm cø <color=yellow>L­¬ng S¬n B¹c<color>. Xung quanh <color=yellow>Thµnh §« phñ<color> xuÊt hiÖn quû qu¸i…NhiÒu sù viÖc cho thÊy cã liªn quan ®Õn tÊm b¶n ®å S¬n Hµ X· T¾c.",
		"T­¬ng lai kh«ng xa, Trung Nguyªn sÏ ph¶i ®èi mÆt víi mét côc diÖn tranh giµnh, tµn s¸t lÉn nhau ®Ó cã ®­îc tÊm b¶n ®å quı gi¸ Êy.",
		"Ta kh«ng thÓ khoanh tay ®øng nh×n, ph¶i t×m c¸ch cøu Trung Nguyªn th«i!",
		"Sè phËn do trêi, ng­¬i ®õng qu¸ lo l¾ng! Giê ®Õn c¸c ®¹i ph¸i chuyªn t©m tu luyÖn, ta sÏ lu«n chØ d¹y thªm cho ng­¬i.",
		"Nhí mét ®iÒu ®õng ng¹i gian nan phİa tr­íc mµ bá gi÷a chõng, ta tin mét ngµy nµo ®ã Trung Nguyªn sÏ ®­îc gi¶i nguy bëi chİnh ng­¬i vµ tªn tuæi ng­¬i sÏ ®­îc l­u danh mu«n thuë!"
	}
	TE_Talk(getn(strMain),"",strMain);
        if GetAntiEnthrallmentStatus() ~= 2 then
	    AddItem(2,4,1,1)
	    AddItem(2,4,8,1)
        end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID Ó¦Îª 25
	TE_SetTeachState(26)  --¹ÊÒâ¶àÉèÒ»½×£¬ÒÔÇø±ğ¹ÊÒâ²»×öÈÎÎñºÍÒÑ¾­×öÍêÈÎÎñµÄÈË
	Msg2Player("NhiÖm vô hoµn thµnh nhËn ®­îc 2 trang bŞ!");
	Msg2Player("Chóc mõng b¹n hoµn thµnh nhiÖm vô h­íng dÉn T©n thñ! Giê cã thÓ gia nhËp thËp ®¹i m«n ph¸i, më ra h­íng ®i cho riªng m×nh.");
end










-- Áù¸öÎÊ´ğÌâµÄÄÚÈİ
function Teach_Qustion_001()
	Say("Giê ta sÏ hái ng­¬i mét vµi vÊn ®Ò, c©u hái 1: HiÖn cã mÊy ®¹i ph¸i thu nhËn ®Ö tö?",4,"ThËp ®¹i m«n ph¸i/Teach_Qustion_Error","B¸t ®¹i m«n ph¸i/Teach_Qustion_Error","Ngò ®¹i m«n ph¸i/Teach_Qustion_002","Tam ®¹i m«n ph¸i/Teach_Qustion_Error");
	return
end

function Teach_Qustion_002()
	Say("Tr¶ lêi tèt l¾m! C©u hái tiÕp theo: KiÕm ph¸p Vâ §ang xuÊt thÇn nhËp quû do ®Ö tö ®¹o gia hay ®Ö tö tôc gia luyÖn?",3,"§¹o gia ®Ö tö/Teach_Qustion_003","Tôc gia ®Ö tö/Teach_Qustion_Error","C¶ hai ®Òu ®óng/Teach_Qustion_Error");
	return
end

function Teach_Qustion_003()
	Say("Kh¸ l¾m! C©u hái 3: §­êng M«n ®­îc xem lµ gia téc m«n ph¸i, vËy ng­êi phô tr¸ch m«n ph¸i lµ ai?",4,"M«n chñ/Teach_Qustion_Error","L·o l·o/Teach_Qustion_004","Ch­ëng m«n/Teach_Qustion_Error","Tæng qu¶n/Teach_Qustion_Error");
	return
end

function Teach_Qustion_004()
	Say("C©u hái tiÕp theo: §Ö tö tôc gia Nga My sö dông binh khİ nµo?",4,"Thİch/Teach_Qustion_Error","KiÕm/Teach_Qustion_Error","CÇm/Teach_Qustion_005","Bót/Teach_Qustion_Error");
	return
end

function Teach_Qustion_005()
	Say("§óng råi! C©u hái 5: Vâ c«ng ThiÕu L©m tinh th©m khã ®o¸n, 72 tuyÖt kü danh chÊn thiªn h¹. VËy ThiÕu L©m cã mÊy h­íng tu luyÖn?",4,"Mét/Teach_Qustion_Error","Hai/Teach_Qustion_Error","Ba/Teach_Qustion_006","Bèn/Teach_Qustion_Error");
	return
end

function Teach_Qustion_006()
	Say("C©u hái cuèi cïng: Nghe nãi ®Ö tö C¸i Bang cã ¤ Y, TŞnh Y, vËy ®Ö tö TŞnh Y tu luyÖn vâ c«ng nµo?",4,"C«n ph¸p/Teach_Qustion_Error","Ch­ëng ph¸p/Teach_Level08_04","ThuÇn d­ìng/Teach_Qustion_Error","BÉy/Teach_Qustion_Error");
	return
end

function Teach_Qustion_Error()
	Say("Nh­ng ta nghe ng­êi ta nãi kh«ng ph¶i nh­ vËy, ng­¬i thö vÒ xem l¹i!",1,"§­îc! §Ó ta xem l¹i!/Teach_Level08_03");
end






-- ·µ»Øµ½°ïÖúÄ¿Â¼
function Teach_Main()

	Say("Ng­¬i muèn t×m hiÓu thªm g× kh«ng?",getn(strTeachSelect),strTeachSelect[1],strTeachSelect[2],strTeachSelect[3],strTeachSelect[4],strTeachSelect[5],strTeachSelect[6],strTeachSelect[7]);
	return

end


-- ½âÊÍÓÎÏ·»ù±¾²Ù×÷
function Teach_Basic()

	local strMain = {
	
		"Dïng chuét chØ vµo bÊt kú n¬i nµo trong b¶n ®å ®Ó di chuyÓn nh©n vËt. NÕu kh«ng x¸c ®Şnh ®­îc vŞ trİ, më <color=yellow>B¶n ®å nhá<color>, dÊu chÊm <color=yellow>vµng<color> bªn trong chØ cho vŞ trİ cña ng­êi ch¬i.",
		"Ra ngoµi thµnh nÕu kh«ng may chØ chuét lªn qu¸i, nh©n vËt sÏ tù ®éng ®¸nh qu¸i liªn tôc, cÇn chó ı!"
	}
	
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return
	
end

-- ½âÊÍÈËÎïµÈ¼¶ÌáÉı
function Teach_Level()

	local strMain = {
	
		"Nh©n vËt dïng <color=yellow>§iÓm kinh nghiÖm<color> ®Ó t¨ng cÊp. NhÊn <color=yellow><F3><color> më Giao diÖn trang bŞ nh©n vËt sÏ thÊy <color=yellow>nót t¨ng cÊp<color>. Khi ®iÓm kinh nghiÖm lín h¬n kinh nghiÖm ®Ó t¨ng cÊp, cã thÓ <color=yellow>t¨ng cÊp nh©n vËt<color>. Sau khi t¨ng cÊp nh©n vËt sÏ cã <color=yellow>§iÓm tiÒm n¨ng<color>. §¼ng cÊp cµng cao ®iÓm tiÒm n¨ng cµng nhiÒu.",
		"Cã nhiÒu c¸ch nhËn <color=yellow>®iÓm kinh nghiÖm<color>, nh­ ®¸nh qu¸i, lµm nhiÖm vô, bÕ quan tu luyÖn thËm chİ truyÒn c«ng...CÇn chó ı kinh nghiÖm hiÖn t¹i ¶nh h­ëng ®¼ng cÊp vµ kü n¨ng nh©n vËt, kh«ng tù ®éng t¨ng cÊp, nhÊn <color=yellow><F3><color> më giao diÖn trang bŞ nh©n vËt vµ tù <color=yellow>t¨ng cÊp<color>. §èi tho¹i víi ta xong sÏ ®­îc İt <color=yellow>kinh nghiÖm<color> ng­¬i cã thÓ dïng chóng thö t¨ng cÊp."
	
	}
	TE_Talk(getn(strMain),"Teach_Main",strMain);
	return

end

-- ½âÊÍÇ±ÄÜµã·ÖÅä
function Teach_Point()

	local strMain = {
	
		"Nh©n vËt cã 5 tiÒm n¨ng: <color=yellow>Søc m¹nh<color>, <color=yellow>Néi c«ng<color>, <color=yellow>G©n cèt<color>, <color=yellow>Th©n ph¸p<color>, <color=yellow>Linh ho¹t<color>.",
		"<color=yellow>Søc m¹nh<color> quyÕt ®Şnh ®¸nh ngo¹i c«ng vµ søc lùc; <color=yellow>Néi c«ng<color> quyÕt ®Şnh néi lùc, ®¸nh néi c«ng vµ phßng thñ néi.",
		"<color=yellow>G©n cèt<color> quyÕt ®Şnh sinh lùc vµ phßng thñ ngo¹i; <color=yellow>Th©n ph¸p<color> quyÕt ®Şnh nĞ tr¸nh, chİnh x¸c vµ tèc ®é ®¸nh; <color=yellow>nh×n râ<color> quyÕt ®Şnh tÊn c«ng chİ m¹ng vµ tù ®éng nĞ tr¸nh, ¶nh h­ëng chİnh x¸c vµ tèc ®é ®¸nh.",
		" LiT©n thñ nªn t¨ng nhiÒu vµo <color=yellow>Søc m¹nh<color> vµ <color=yellow>G©n cèt<color>."
	
	}
	Talk(4,"Teach_Main",strMain[1],strMain[2],strMain[3],strMain[4]);
	return
end


-- ½âÊÍ×¬Ç®
function Teach_Earn()

	local strMain = {
	
		"Cã thÓ ra ngoµi thµnh ®¸nh qu¸i mang vËt phÈm vÒ b¸n cho c¸c chñ tiÖm hoÆc lµm mét vµi nhiÖm vô ®¬n gi¶n. TriÒu ®×nh còng cã ph¸i Kh©m Sai ®¹i thÇn tiÕp tÕ cho T©n thñ, cÇn n¾m b¾t c¬ héi hiÕm cã nµy!",
		"§Õn <color=yellow>cÊp 10<color> cã thÓ mua b¸n, vËn tiªu, t×m kiÕm kho b¸u, ®¸nh l«i ®µi..."
	
	}
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return
end


-- ½âÊÍ¼ÓÈëÃÅÅÉ
function Teach_Faction()

	local strMain = {
	
		"HiÖn c¸c m«n ph¸i ®ang thu nhËn ®Ö tö, ta thÊy ng­¬i t­ chÊt còng kh«ng tÖ, chØ cÇn cè g¾ng luyÖn ®Õn cÊp 10 ®èi tho¹i víi <color=yellow>Sø gi¶ m«n ph¸i<color> lµ cã thÓ gia nhËp.",
		"Mçi m«n ph¸i cã h­íng tu luyÖn kh¸c nhau, cÇn t×m hiÓu kü ®Æc s¾c cña nã."
	
	}
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return	
	
end

-- ½âÊÍµ±Ç°ÄÜ×öµÄÊÂÇé
function Teach_Something()

	local strMain = {
	
		"Ng­êi míi ra giang hå cÇn <color=yellow>Giao l­u<color> nhiÒu víi ng­êi trong thµnh!",
		"Ng­¬i cã thÓ ra ngoµi ®¸nh qu¸i, nh­ng kh«ng nªn ®i qu¸ xa v× n¬i ®ã qu¸i rÊt m¹nh, nÕu lì bŞ th­¬ng vÒ t×m <color=yellow>Chñ d­îc ®iÕm<color> trong thµnh trŞ liÖu.",
		"NÕu ®· chän nhiÖm vô T©n thñ, tõ cÊp 1 ®Õn cÊp 10 cø ®Õn t×m ta nhËn nhiÖm vô hay nhÊn <color=yellow><F11><color> ®Ó xem h­íng dÉn."
	
	}
	Talk(3,"Teach_Main",strMain[1],strMain[2],strMain[3]);
	return
	
end

-- ½âÊÍ½ğ±ÒµÄ¶Ò»»·½·¨
function Teach_Money()

	local strMain = {
	
		"Ba lo¹i tiÒn tÖ gåm <color=yellow>Vµng<color>, <color=yellow>B¹c<color> vµ <color=yellow>§ång<color>, 1 l­îng vµng = 100 l­îng b¹c, 1 l­îng b¹c = 100 §ång.",
		"HÖ thèng sÏ tù ®éng ®æi tiÒn. Khi ng­¬i cã 11111 tiÒn ®ång  t­¬ng øng 1 l­îng vµng 11 l­îng b¹c 11 tiÒn ®ång.",
		"TiÒn göi theo thø tù vµng, b¹c, tiÒn ®ång."
	
	}
	TE_Talk(getn(strMain),"",strMain);

end


function Teach_Exit()

end