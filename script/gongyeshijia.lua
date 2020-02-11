--¹«Ò±ÊÀ¼Ònpc½Å±¾
--by vivi
--08/13/2007

Include("\\script\\task\\lingshi_task.lua")

--npc£¬¶ÔÓ¦ÑïÖÝ¡¢ÏåÑô¡¢´óÀí
tNpcName = {"C«ng D· khÝ ","C«ng D· binh ","C«ng D· cô "}

function main()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[2];		
	end
	if BigGetItemCount(2,0,1022) < 1 and Zgc_pub_goods_add_chk(1,1) == 1 then
		AddItem(2,0,1022,1,1);
	end
	local strtab = {
		"Ta muèn hîp thµnh trang bÞ B¸t qu¸i/hecheng_bagua",
		"Ta muèn gì bé trang bÞ B¸t qu¸i/chongzu_bagua",
		"Ta muèn nhËn Linh Th¹ch/chouqu_lingshi",
--		"Ta muèn hîp thµnh Linh Th¹ch/hecheng_lingshi",
--		"NhËn ®­îc Nguyªn Th¹ch, Linh Th¹ch vµ Linh Th¹ch phèi ph­¬ng/ziyuanhuode",
--		"ThuyÕt minh hîp thµnh bé B¸t Qu¸i/detail_bagua",
		"L·nh 'b¶o ®iÓn B¸t Qu¸i'/bagua_baodian"
		}
	--if GetTask(TASK_LINGSHI_ID) == 1 or GetTask(TASK_LINGSHI_ID) == 4 or GetTask(TASK_LINGSHI_ID) == 5 or GetTask(TASK_LINGSHI_ID) == 7 then
		--tinsert(strtab,"TiÕp tôc nhiÖm vô häc tËp Linh Th¹ch B¸t Qu¸i/new_task");
	--end
		tinsert(strtab,"Kh«ng cÇn ®©u/nothing");
	Say("<color=green>"..sNowNpc.."<color>: chÝnh lµ ta "..sNowNpc.."Ta cßn cã hai huynh ®Ö, "..sXiongDi..", lµ truyÒn nh©n cña C«ng trÞ thÕ gia, ta vµ l·o L­u ë T­¬ng D­¬ng ®· nghiªn cøu chÕ t¹o thµnh c«ng Linh Th¹ch truyÒn thuyÕt vµ bé trang bÞ B¸t Qu¸i thÇn kú. Ngoµi ra cßn chÕ ra chøc n¨ng <color=red>B¸t Qu¸i lÊy Linh Th¹ch<color>. Kh«ng tin , h·y nhÊn chän <color=green>LÊy Linh Th¹ch<color> xem thö tin tøc!",
		getn(strtab),
		strtab)
end

function hecheng_bagua()
	BaguaCompose(); --ºÏ³É°ËØÔÌ××°½çÃæ
end

function chongzu_bagua()
	--BaguaDepose(); --ÖØÖý°ËØÔÌ××°½çÃæ
	--Talk(1,"","°ËØÔ´òÉ¢ÎÒÒÑ¾­È«È¨½»Óë<color=yellow>ÏåÑôµÄÁõÌú½³µÜ×Ó<color>ÁË£¬ÄãÈ¥ÏåÑôÕÒËû°É¡£");
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[2];		
	end
	Say("<color=green>"..sNowNpc.."<color>: Xin chó ý! cÇn ph¶i n¹p vµo <color=red> 10000 l­îng gi¸ trÞ <color> míi cã thÓ ®¶m b¶o khi t¸ch ra trang bÞ cña b¹n kh«ng biÕn mÊt.",
		2,
		"Më giao diÖn ®óc/dasan_bagua_item",
		"Kh«ng cã g×/nothing")
end

function dasan_bagua_item()
	BaguaDepose(); --ÖØÖý°ËØÔÌ××°½çÃæ
end

function chouqu_lingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[2];		
	end
	--TransformAttr(); --³éÈ¡ÁéÊ¯
	Say("<color=green>"..sNowNpc.."<color>: Trang bÞ B¸t Qu¸i còng cã thÓ lÊy ®­îc Linh Th¹ch. B»ng h÷u cã muèn t×m hiÓu huyÒn c¬ nµy kh«ng?",2,
	"Muèn chø!/how_chouqu",
	"Khái ®i! Ta hiÓu råi/chouqu_lingstone")
end

function how_chouqu()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[2];		
	end
	Talk(1,"chouqu_lingstone","<color=green>"..sNowNpc.."<color>: ChØ cÇn <color=red>trang bÞ ®· kh¶m qua Linh Th¹ch<color> lµ cã thÓ lÊy ®­îc Linh Th¹ch ra, Trang bÞ B¸t Qu¸i th× kh«ng thÓ! ChØ cÇn dïng <color=green>Thiªn C¬ toµn<color> lµ cã thÓ lÊy, nh­ng chÝ lÊy ®­îc <color=red>1 Linh Th¹ch<color> ra. LÊy ra xong <color=green>trang bÞ sÏ mÊt<color>. Linh Th¹ch nÕu bÞ lÊy ra nhiÒu lÇn cã thÓ biÕn tÝnh, <color=red>trÞ Linh khÝ cã thÓ thay ®æi<color> nh­ng <color=green>Thuéc tÝnh ¢m d­¬ng<color> th× vÉn gi÷ nguyªn. Thiªn C¬ toµn cã thÓ xem ë <color=yellow>Ngù C¸c<color>!")
end

function chouqu_lingstone()
	TransformAttr()
end

function hecheng_lingshi()
	ComposeLingShi();--ºÏ³ÉÁéÊ¯
end

function ziyuanhuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[2];		
	end
	Say("<color=green>"..sNowNpc.."<color>: Xin h·y xem kü c¸c ph­¬ng ph¸p cã ®­îc nh÷ng vËt phÈm liªn quan Linh Th¹ch!",
	5,
	"NhËn ®­îc Nguyªn Th¹ch/yuanshihuode",
	"NhËn ®­îc Linh Th¹ch/lingshihuode",
	"Hîp thµnh Linh Th¹ch/hechenglingshi",
	"BiÕt ®­îc c¸ch phèi hîp Linh Th¹ch /lingshipeifanghuode",
	"§Õn hái th¨m th«i mµ!/SayHello"
	)
end

function yuanshihuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>: Cã thÓ ®Õn <color=red>Chñ tiÖm T¹p hãa<color> ®Ó mua <color=red>Nguyªn Th¹ch<color>. CÇn chó ý, Nguyªn Th¹ch kh¸c nhau cã vÞ trÝ thuéc tÝnh Linh khÝ t­¬ng øng kh¸c nhau, Nguyªn Th¹ch kh«ng cïng ®¼ng cÊp lÊy ®­îc thuéc tÝnh tèi cao kh¸c nhau, nªn xem tr­íc thuyÕt minh cã liªn quan ®Õn Nguyªn Th¹ch råi h·y rót.")
end

function lingshihuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>Ngoµi dïng Nguyªn Th¹ch ®Ó rót Linh khÝ trang bÞ ra, nghe nãi hai n­íc Tèng Liªu ®Ó cæ vò t­íng sü, phµm ai tham gia <color=red>chiÕn tr­êng Nh¹n M«n quan<color> ®Òu ®­îc th­ëng <color=red>Linh Th¹ch<color>, nh­ng muèn cã ®­îc Linh Th¹ch ph¶i xem xÐt c«ng tr¹ng vµ biÓu hiÖn cña hä. TruyÒn r»ng bän s¸t thñ rÊt høng thó víi Linh Th¹ch, c¸c anh hïng khi gÆp bän <color=red>s¸t thñ<color> cÇn l­u t©m xem chóng cã mang theo Linh Th¹ch nµy kh«ng.")
end

function hechenglingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>: Linh Th¹ch nµy thÕ gian rÊt hiÕm thÊy. C¸c vÞ tiÒn nh©n ®· v« cïng khæ cùc nghiªn cøu ra <color=red>Linh Th¹ch phèi ph­¬ng<color>, chØ cÇn <color=red>Linh Th¹ch phèi ph­¬ng<color> vµ <color=red>Linh Th¹ch<color> cïng ®Æt trªn cét hîp thµnh Linh Th¹ch ®Ó t¹o ra <color=red>Linh Th¹ch theo phèi ph­¬ng<color>. Kh«ng thªm phèi ph­¬ng, tïy ý kÕp hîp Linh Th¹ch tuy cã thÓ hîp thµnh, nh­ng thµnh c«ng hay kh«ng cßn do Trêi ®Þnh.")
end

function lingshipeifanghuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." vµ"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>: Linh Th¹ch phèi ph­¬ng tõ Th­îng cæ l­u truyÒn ®Õn nay kh«ng nhiÒu...Ng­¬i cèng hiÕn cho m«n ph¸i, hoµn thµnh <color=red>nhiÖm vô s­ m«n<color> mçi ngµy, tin r»ng ch­ëng m«n sÏ hiÓu ®­îc sù nç lùc cña ng­¬i. C¸c s¸t thñ cao cÊp trong <color=red>S¸t thñ ®­êng<color> ®Òu cã mang theo phèi ph­¬ng, nh­ng cã lÊy ®­îc hay kh«ng cßn ph¶i xem vËn khÝ cña ng­¬i n÷a!")
end

function detail_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end
	local strtab = {
		"Lµm sao chÕ t¹o trang bÞ B¸t Qu¸i?/how_make_bagua",
		"Lµm sao nhËn ®­îc Linh Th¹ch/how_get_lingshi",
		"Lµm sao kÝch ho¹t bé B¸t Qu¸i/how_jihuo_bagua",
		"T¹m thêi ch­a nghÜ ra g×!/nothing"	
		}
	Say("<color=green>"..sNowNpc.."<color>: B¸t Qu¸i t­îng tr­ng cho 8 thÕ lùc tù nhiªn thiªn, ®Þa, l«i, phong, thñy, háa, s¬n, tr¹ch. Thiªn ®Þa v¹n vËt, kh«ng cã vËt nµo kh«ng ®Þnh ©m d­¬ng, kh«ng ph©n B¸t Qu¸i. NÕu ng­¬i cã trang bÞ cã n¨ng lùc B¸t Qu¸i, ta cã thÓ gióp kÝch ho¹t n¨ng l­îng B¸t Qu¸i.",
		getn(strtab),
		strtab);	
end

function how_make_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_make_bagua2","<color=green>"..sNowNpc.."<color> Muèn chÕ t¹o trang bÞ B¸t Qu¸i kh«ng dÔ ®©u\nMét, ph¶i cã trang bÞ c¬ b¶n cã Thiªn ®Þa linh khÝ, ng­¬i cã thÓ chÕ t¹o trang bÞ nµy nhê kü n¨ng sèng. Mçi trang bÞ cã mét <color=red>giíi h¹n trÞ Linh khÝ vµ sè lç<color>, giíi h¹n trÞ Linh khÝ quyÕt ®Þnh ®é bÒn cña Linh Th¹ch ®­îc kh¶m vµ Qu¸i vÞ B¸t Qu¸i sÏ xuÊt hiÖn, sè lç quyÕt ®Þnh sè l­îng Linh Th¹ch ®­îc kh¶m, nÕu muèn t¹o trang bÞ B¸t Qu¸i, cÇn cã 3 lç. Muèn t¹o mét trang bÞ cã giíi h¹n trÞ Linh khÝ cao, ph¶i thªm nhiÒu vËt phÈm <color=red>gi¸ trÞ<color>, tæng gi¸ trÞ vËt phÈm cµng cao, tû lÖ t¹o thµnh trang bÞ cã trÞ Linh khÝ cµng cao.");
end

function how_make_bagua2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_make_bagua3","<color=green>"..sNowNpc.."<color>Hai, lµm xong trang bÞ c¬ b¶n, b¾t ®Çu kh¶m Linh Th¹ch. Trªn mçi Linh Th¹ch ®Òu cã trÞ Linh khÝ, trÞ sè Linh khÝ lµ <color=red>lÎ<color> th× Linh Th¹ch <color=red>D­¬ng<color>, trÞ sè lµ <color=red>ch½n<color>, th× Linh Th¹ch <color=red>©m<color>. Toµn bé TrÞ Linh khÝ cña Linh Th¹ch kh¶m trªn mét trang bÞ c¬ b¶n, kh«ng ®­îc v­ît qu¸ giíi h¹n Linh khÝ cña trang bÞ ®ã. Khi <color=red>TrÞ linh khÝ Linh Th¹ch<color> võa <color=red>b»ng<color> <color=red>giíi h¹n trÞ Linh khÝ cña trang bÞ<color>, trang bÞ nµy sÏ hîp thµnh mét <color=red>Trang bÞ B¸t Qu¸i ch­a kÝch ho¹t<color>, trang bÞ mçi b¸t vÞ cô thÓ cÇn t¹o ra sao. Xin xem 'B¸t Qu¸i B¶o §iÓn'");
end

function how_make_bagua3()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>: Ba, cã trang bÞ B¸t Qu¸i ch­a kÝch ho¹t vÉn kh«ng thÓ tham gia víi trang bÞ B¸t Qu¸i ®· kÝch ho¹t, muèn tham gia kÝch ho¹t Bé B¸t Qu¸i, ph¶i kÝch ho¹t tr­íc thuéc tÝnh B¸t Qu¸i trªn trang bÞ B¸t Qu¸i. Mang theo trang bÞ B¸t Qu¸i muèn kÝch ho¹t,®Õn c¸c thµnh t×m <color=red>ThÇn Du Ch©n Nh©n<color> ®Ó nhê «ng ta kÝch ho¹t, nh­ng ph¶i tiªu hao Th¸i H­ B¸t Qu¸i Bµi t­¬ng øng. Trang bÞ B¸t qu¸i sau khi ®· kÝch ho¹t cã thÓ ®Õn gÆp ta ®Ó tiÕn hµnh hîp thµnh");
end

function how_get_lingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_get_lingshi2","<color=green>"..sNowNpc.."<color>: Cã nhiÒu ®iÒu ph¶i nãi vÒ Linh Th¹ch\nMét, muèn nhËn Linh Th¹ch, ph¶i cã Nguyªn Th¹ch tr­íc vµ c¸c trang bÞ hiÖu qu¶. Nguyªn Th¹ch nµy võa cã thÓ dung n¹p thiªn ®Þa linh khÝ, võa cã thÓ rót thuéc tÝnh trªn trang bÞ, sau khi rót thµnh c«ng, Nguyªn Th¹ch biÕn thµnh Linh Th¹ch t­¬ng øng. Tù Nguyªn Th¹ch còng cã t¸c dông vµ cao thÊp kh¸c nhau, ph©n thµnh 7 cÊp nÕu ®¼ng cÊp Nguyªn Th¹ch kh«ng ®ñ, kh«ng cã c¸ch nµo dung n¹p thuéc tÝnh cao cÊp bæ sung trªn trang bÞ. Nguyªn Th¹ch ph©n thµnh <color=red>Thiªn, §Þa, Nh©n<color>, t­¬ng øng víi 3 vÞ trÝ thuéc tÝnh <color=red>1,2,3<color>. Muèn nhËn ®­îc thuéc tÝnh ë vÞ trÝ nµo ph¶i dïng lo¹i Nguyªn Th¹ch ®ã.");
end

function how_get_lingshi2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>: Hai, trang bÞ cã thuéc tÝnh linh khÝ cao cÊp rÊt Ýt, muèn nhËn ®­îc Linh Th¹ch cao cÊp, cßn mét c¸ch kh¸c, tù m×nh<color=red>hîp thµnh Linh Th¹ch<color>, biÕn nhiÒu Linh Th¹ch thµnh mét Linh Th¹ch, nÕu nhiÒu Linh Th¹ch cïng lo¹i, kh¶ n¨ng hîp thµnh Linh Th¹ch sÏ cao. Thêi chiÕn Th­îng cæ Phong ThÇn cã truyÒn l¹i ph­¬ng ph¸p phèi hîp hîp thµnh Linh th¹ch, nÕu lÊy ®­îc ph­¬ng ph¸p phèi hîp nµy, lµm theo ghi chÐp, bæ sung Linh Th¹ch t­¬ng øng, cã thÓ hîp thµnh Linh Th¹ch, nh­ng ch­a C¸c ng­êi thµnh c«ng...");
end

function how_jihuo_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_jihuo_bagua2","<color=green>"..sNowNpc.."<color>: Ta dµnh t©m huyÕt c¶ ®êi, nghiªn cøu ra bé B¸t Qu¸i biÕn hãa kh«n l­êng, cã muèn t×m hiÓu kh«ng?");
end

function how_jihuo_bagua2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_jihuo_bagua3","<color=green>"..sNowNpc.."<color>: Mét, muèn kÝch ho¹t bé B¸t Qu¸i, ®Çu tiªn ph¶i cã <color=red>trang bÞ B¸t Qu¸i<color> t­¬ng øng víi mçi bé B¸t Qu¸i. Sau khi tËp hîp trang bÞ B¸t Qu¸i t­¬ng øng, cã thÓ hîp thµnh t¹i ®©y. Nh­ng linh khÝ mçi bé trang bÞ B¸t Qu¸i kh¸c nhau, hiÖu qu¶ sau khi kÝch ho¹t vµ <color=red>TrÞ Linh khÝ trang bÞ B¸t Qu¸i<color> tham gia hîp thµnh cã t­¬ng quan, nÕu trÞ linh khÝ trang bÞ B¸t Qu¸i tham gia hîp thµnh qu¸ thÊp, hiÖu qu¶ bé B¸t Qu¸i sÏ thÊp. Bé B¸t Qu¸i nµy khi hîp thµnh do thiªn thêi biÕn hãa, hiÖu qu¶ sÏ kh«ng æn ®Þnh. Muèn cã hiÖu qu¶ tèt nhÊt cÇn thªm c¸c vËt phÈm <color=red>gi¸ trÞ<color>");
end

function how_jihuo_bagua3()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>: Hai, nÕu kh«ng hµi lßng víi thuéc tÝnh kÝch ho¹t bé B¸t Qu¸i, chØ cÇn th¸o rêi bé B¸t Qu¸i t¹o bé míi. Nn­ng nÕu kh«ng th¸o rêi bé B¸t Qu¸i, sÏ tæn thÊt mét sè trang bÞ trong bé B¸t Qu¸i. Muèn n©ng tû lÖ thµnh c«ng vµ h¹ thÊp tæn thÊt, chØ cÇn thªm nhiÒu vËt phÈm <color=red>gi¸ trÞ<color> khi ®óc l¹i, nÕu ®ñ gi¸ trÞ, cã thÓ <color=red>kh«ng hÒ tæn thÊt<color>.");
end

function nothing()

end

function bagua_baodian()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end
	if GetItemCount(2,1,2639) >= 1 then
		Talk(1,"main","<color=green>"..sNowNpc.."<color>: Ch¼ng ph¶i ng­¬i ®· cã mét quyÓn råi sao?");
	elseif AddItem(2,1,2639,1) == 1 then
		Msg2Player("B¹n nhËn ®­îc mér B¸t Qu¸i B¶o ®iÓn");
		Talk(1,"main","<color=green>"..sNowNpc.."<color>: 'B¸t Qu¸i B¶o ®iÓn' nµy ghi chÐp liªn quan ®Õn bé B¸t Qu¸i!");
	end 
end

--º¯ÊýÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êý
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕý³£Ìí¼ÓÎïÆ·½øÐÐ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅÐ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end	

function new_task()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end
	if GetTask(TASK_LINGSHI_ID) == 1 then
		Say("<color=green>"..sNowNpc.."<color>: ChØ cã Linh Th¹ch th× kh«ng ®­îc, Linh Th¹ch nµy chØ cã kh¶m trªn trang bÞ míi ph¸t huy t¸c dông, trang bÞ Phæ th«ng kh«ng thÓ kh¶m Linh Th¹ch, chØ cã truyÒn tù M¹c §¹i, M¹c NhÞ, M¹c Tam, CÈm Lang, linh khÝ cña Tö Quyªn c« n­¬ng vµ Minh s­ phô míi cã thÓ kh¶m Linh Th¹ch, ng­¬i h·y ®i hái mét trong sè 6 ng­êi hä xem",
			3,
			"Ta ®i t×m s¸u ng­êi hä ®©y!/#goto_zhizao_npc(1)",
			"R¶nh rçi ta sÏ ®i t×m hä sau!/#goto_zhizao_npc(2)",
			"§­îc råi, ta ®· hiÓu!/confirm_cancel");	
	elseif GetTask(TASK_LINGSHI_ID) == 4 then
		Say("<color=green>"..sNowNpc.."<color>: kh«ng ngê ng­¬i ®· ®i ®­îc tíi ®©y råi, sau khi ng­¬i më giao diÖn kÝch ho¹t, nhÊp v« hiÖu qu¶ bé B¸t Qu¸i cÇn kÝch ho¹t, c¨n cø theo b¸t vÞ ®· chØ dÉn mµ s¾p ®Æt lªn trang bÞ B¸t Qu¸i t­¬ng øng. L·o ThÇn Du ®­a ng­¬i 4 trang bÞ B¸t Qu¸i nµy Ýt nhiÒu cã thÓ kÝch ho¹t bé TiÒm Long, tuy bé nµy ®· l©u kh«ng söa ch÷a, hiÖu qu¶ kÝch ho¹t rÊt kÐm, nh­ng ng­¬i cø thö xem. Sau ®ã h·y ®Õn t×m ta.",
			1,
			"§­îc, ®Ó ta thö xem!/try_try");
	elseif GetTask(TASK_LINGSHI_ID) == 5 then
		if GetLevel() < 75 then 
			Talk(1,"","<color=green>"..sNowNpc.."<color>: Thö xong ch­a? §­îc ®ã, cã tiÒn ®å, giê ®· hiÓu hÖ thèng Linh Th¹ch vµ B¸t Qu¸i, nh­ng muèn hiÓu râ h¬n, cÇn xem mËt truyÒn cña 'B¸t Qu¸i b¶o ®iÓn'. Ta vèn ®Þnh cho ng­¬i mét sè ph­¬ng ph¸p phèi hîp Linh Th¹ch, nh­ng ®¼ng cÊp ng­¬i thÊp qu¸ lµm sao dïng ®­îc! §Õn <color=yellow>cÊp 75<color> h·y ®Õn t×m ta.");
		else
			Talk(1,"","<color=green>"..sNowNpc.."<color>: Thö xong ch­a? §­îc ®ã, cã tiÒn ®å, giê ®· hiÓu hÖ thèng Linh Th¹ch vµ B¸t Qu¸i, nh­ng muèn hiÓu râ h¬n, cÇn xem mËt truyÒn cña 'B¸t Qu¸i b¶o ®iÓn'. Ng­¬i ch¹y l©u nh­ vËy, cùc khæ råi, nhËn lÊy Linh Th¹ch phèi ph­¬ng ®i, tuy kh«ng ph¶i thø quý hiÕm g× nh­ng lµ tÊm lßng cña ta.")
			give_final();
		end
	elseif GetTask(TASK_LINGSHI_ID) == 7 then
		Talk(1,"go_id_one","<color=green>"..sNowNpc.."<color>: Rót Linh Th¹ch ch­a? Quang héi Linh Th¹ch hót ch­a ®ñ. Nªn biÕt, Linh Th¹ch nµy thÕ gian rÊt hiÕm, cùc phÈm Linh Th¹ch cµng khã kiÕm, tiÒn nh©n ph¶i tr¶i qua mu«n ngµn khæ cùc, t¹o ra nhiÒu Linh Th¹ch phèi ph­¬ng, chØ cÇn cïng phèi hîp Linh Th¹ch phèi ph­¬ng vµ Linh Th¹ch theo h­íng dÉn lµ cã thÓ hîp thµnh ra Linh Th¹ch. Kh«ng thªm phèi ph­¬ng, tïy ý kÕt hîp Linh Th¹ch. Tuy cã thÓ hîp thµnh, nh­ng thµnh c«ng hay kh«ng lµ do mÖnh Trêi. Ng­¬i thö xem!")	
	end
end

function goto_zhizao_npc(nType)
	SetTask(TASK_LINGSHI_ID,2);
	if nType == 1 then
		local nRand = random(1,6);
		NewWorld(tZhizaoNpc[nRand][1],tZhizaoNpc[nRand][2],tZhizaoNpc[nRand][3]);
	end
end

function try_try()
	SetTask(TASK_LINGSHI_ID,5);
end

--¾­¹ý7ºóÌø»Ø1
function go_id_one()
	for i = 1,5 do
		AddLingShi(343,0,1);
	end
	local add_flog = AddItem(2,21,2325,1,1);
	if add_flog == 1 then
		Msg2Player("B¹n nhËn ®­îc 5 Linh Th¹ch, 1 Linh Th¹ch phèi ph­¬ng");
		SetTask(TASK_LINGSHI_ID,1);
		TaskTip("Thö t¹o ra Linh Th¹ch theo phèi ph­¬ng ghi, sau ®ã t×m truyÒn nh©n C«ng TrÞ ThÕ Gia");
	else
		WriteLog("NhiÖm vô hÖ thèng Linh Th¹ch: ng­êi ch¬i "..GetName().."NhËn Linh Th¹ch vµ Linh Th¹ch phèi ph­¬ng thÊt b¹i. Log: "..add_flog);
	end
end

