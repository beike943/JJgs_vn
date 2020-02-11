--ÌìÑÄº£½ÇµÄNPC
--by vivi
--09/26/2007

Include("\\script\\online\\abluemoon\\abluemoon_head.lua")

tDiaTab = {
	[1] = {100,"Kinh nghiÖm dåi dµo, Thiªn th¹ch chÊt ®Çy r­¬ng.","Kh«ng cã g× Êm ¸p h¬n t×nh b»ng h÷u, huynh muéi trong bang ph¸i khiÕn b¹n ph¶i tr©n träng. ","Khi b¹n bŞ tæn th­¬ng th× huynh tû muéi lµ ng­êi an ñi b¹n, khi b¹n vui ®ã lµ ng­êi cïng chia sÎ niÒm vui víi b¹n.","Chóc c¸c huynh tû muéi trong bang ph¸i lu«n vui vÎ, b×nh an.","Chóc c¸c huynh tû muéi trong bang ph¸i lu«n kháe m¹nh, tÊn tµi tÊn léc.","Bang héi lµ m¸i nhµ Êm ¸p, mau ®Õn ®©y cïng gãp søc x©y dùng."},
	[2] = {100,"Chóc huynh ®Ö vui vÎ! V¹n ®iÒu may m¾n!","Chóc h¶o huynh ®Ö tÊn tµi tÊn léc; t×nh c¶m nh­ ı; vËn vËn hanh th«ng.","Ta chóc ng­¬i m¹nh kháe, tiÒn v« nh­ n­íc.","Ta chóc ng­¬i gÆp nhiÒu ®iÒu tèt, tiÒn v« ®Çy tói, phiÒn n·o tr«i nhanh! H·y nhËn lêi chóc thËt lßng cña ta.","NÕu cã tiÒn lµ sai lÇm, chóc ng­¬i tõ sai lÇm nµy tiÕp sai lÇm kh¸c."},
	[3] = {100,"Tho¶i m¸i trong 1 gi©y, vui vÎ trong 1 ngµy, h¹nh phóc trong 1 n¨m, m¹nh kháe m·i m·i!","Ng­¬i ph­¬ng xa cã kháe m¹nh kh«ng? Trong t­ t­ëng, m·i kh«ng thay ®æi lµ t×nh yªu cña ta dµnh cho ng­¬i! ThËt lßng muèn ng­¬i vui vÎ mçi ngµy!","H¶o h÷u, chóc ng­¬i nh­ ı c¸t t­êng, ngµy cµng xinh ®Ñp!","Chóc ng­¬i lu«n vui vÎ, giÊc m¬ trë thµnh sù thËt----v¹n sù nh­ ı!","ThËt lßng chóc ng­¬i vui vÎ, v¹n sù viªn m·n, lu«n në nô c­êi."},
	[4] = {200,"Chóc ng­¬i lu«n vui vÎ, ®Æc biÖt trong ngµy h«m nay, chóc sinh nhËt vui vÎ!","TÆng ng­¬i ly n­íc Ğp tinh chÕ, trong ®ã cã 100cc lµ v¹n sù thµnh c«ng, 200cc lµ ngµy ngµy vui vÎ, 300cc lµ søc sèng dåi dµo, chóc sinh nhËt vui vÎ.","V× sù cã mÆt cña ng­¬i, ngµy h«m nay trë thµnh ngµy t­¬i ®Ñp, thÕ giíi nµy cã thªm nhiÒu mµu s¾c. Chóc sinh nhËt vui vÎ!","Chóc sinh nhËt vui vÎ!","Tõ tr­íc giê ta muèn nãi víi ng­¬i, nh­ng khæ nçi kh«ng cã c¬ héi, h«m nay ta lÊy hÕt can ®¶m ®Ó nãi...Sinh nhËt vui vÎ!","Chóc ng­¬i h«m nay ngÈng lªn nh×n thÊy thÇn Cupid, ra cöa gÆp ®¹i mü nh©n, cói xuèng nhÆt ®­îc tiÒn, vÒ nhµ ®¹p ph©n chã! Ha ha!","Chóc ng­¬i: Phóc nh­ §«ng H¶i, Thä tû Nam S¬n.","H«m nay lµ sinh nhËt cña ng­¬i, tõ ph­¬ng xa ta chóc ng­¬i sinh nhËt vui vÎ!"},
	[5] = {400,"Mçi ngµy tÆng ng­¬i 999 ®ãa hång, mçi ngµy gëi ng­¬i 999 l¸ th­, cã 999 kiÕp sau ta còng muèn ë bªn ng­¬i, vµ nãi 999 c©u ta yªu ng­¬i, ta kh«ng nghÜ r»ng tr¸i tim ng­¬i kh«ng rung ®éng.","BÊt kÓ trêi m­a hay trêi n¾ng, cã thÓ nh×n thÊy mét ngµy th× h«m ®ã trêi rÊt m¸t mÎ; bÊt kÓ h«m qua, h«m nay hay ngµy mai, cã thÓ cïng ë bªn nhau mét ngµy th× h«m ®ã lµ mét ngµy tuyÖt vêi.","Hoa hång lµ t×nh yªu cña ta, kÑo lµ h­¬ng vŞ cña ta, sao lµ m¾t cña ta, ¸nh tr¨ng lµ linh hån cña ta, ®Òu tÆng cho ng­¬i----b¸u vËt trong lßng ta.","GÆp ®­îc ng­¬i lµ mét h­ëng thô, nghÜ vÒ ng­¬i cã mét c¶m nhËn, m¬ thÊy ng­¬i lµ mét h¹nh phóc, sèng trän ®êi bªn ng­¬i lµ mét h¹nh phóc lín lao.","Chóc céng chóc lµ v« sè lêi chóc, chóc trõ chóc lµ khëi ®Çu cña chóc, chóc nh©n chóc lµ v« h¹n lêi chóc ®Ñp ®Ï, chóc chia chóc lµ lêi chóc s©u nÆng, kh«ng cã mãn quµ nµo quı h¬n nh÷ng lêi chóc! "},
	[6] = {300,{"Trung thu ®Õn råi, chóc ng­¬i t©m t×nh tho¶i m¸i! MÆt t­¬i nh­ hoa! NguyÖn väng nh­ ı, Trung thu vui vÎ!","NguyÖt L­îng Thè nãi, vµo tèi 15 th¸ng 8 c« ta sÏ cho ¸nh tr¨ng ®Ñp, gëi chóc phóc cña ng­¬i ®Õn c« Êy, viÕt vµo tim cña c« Êy.","Giã m¸t mang chóc phóc cña ta, tr¨ng thanh mang chµo hái cña ta, tÆng ng­¬i mét lµn giã m¸t, mét ¸nh tr¨ng thanh, phong nguyÖt v« biªn, nh©n gian h÷u t×nh, Trung thu vui vÎ!","Trung thu ®Õn råi, tÆng ng­¬i b¸nh. Líp thø nhÊt: quan t©m! Líp thø hai: ch¨m sãc! Líp thø ba: l·ng m¹n! Líp thø t­: Êm ¸p! Líp gi÷a: ngät ngµo! Chóc ng­¬i ngµy ngµy vui vÎ!","Nghe~NghÜ ®Õn~Mong, Nãi ®­îc~Lµm ®­îc~NhËn ®­îc, Thêi gian ®Õn~mäi lêi chóc phóc ta dµnh cho ng­¬i, Trung thu vui vÎ!","§ªm tr¨ng s¸ng, d­íi ¸nh tr¨ng, ta nguyÖn 3 ®iÒu: ®iÒu thø nhÊt méng ®Ñp nh­ tr¨ng, ®iÒu thø hai ngµy ngµy ngät ngµo h¬n b¸nh trung thu, ®iÒu thø ba khu«n mÆt ®Ñp nh­ tiªn trong tr¨ng.","Tr¨ng thanh giã m¸t gëi t©m t­! §Ó ¸nh tr¨ng mang lêi chóc cña ta gëi ®Õn ng­¬i; ®Ó nçi nhí hãa thµnh lµn giã, h«n nhÑ lªn mÆt ng­¬i!"},{"S¸ng lÔ Quèc Kh¸nh khi ng­¬i vµo game, cã thÓ nh×n thÊy c©u chóc cña ta dµnh cho ng­¬i, hy väng ®ãa hoa hång trong lßng ®ñ mang l¹i may m¾n vµ h¹nh phóc cho ng­¬i! Quèc Kh¸nh vui vÎ!","Ng­¬i lµ socola cña ta, nh×n thÊy vÎ ®Ñp cña ng­¬i, ta rÊt nhí ng­¬i, Quèc Kh¸nh vui vÎ, hy väng ®­îc lµm quen víi ng­¬i!","Vµo ngµy lÔ Quèc Kh¸nh ta chóc ng­¬i tµi léc dåi dµo, mËp nh­ heo, m¹nh kháe, t×nh c¶m ngät ngµo, gÆp nhiÒu may m¾n, sù nghiÖp hanh th«ng, cµng ngµy cµng ph¸t triÓn.","Trong ngµy lÔ Quèc Kh¸nh ta cÇu h«n víi ng­¬i, ng­¬i ®ång ı kh«ng? Ta muèn ng­¬i trë thµnh ng­êi h¹nh phóc thø hai trªn toµn thÕ giíi! T¹i sao l¹i lµ thø hai? V× kÕt h«n víi ng­¬i, ta trë thµnh ng­êi h¹nh phóc nhÊt trªn thÕ giíi!","Chóc 7 ngµy trong lÔ Quèc Kh¸nh, 168 giê vui vÎ, 10080 phót h¹nh phóc, 604800 gi©y ngät ngµo!","Chóc lÔ Quèc Kh¸nh trµn ngËp niÒm vui, ®ªm n»m méng ngät ngµo! GiÊc m¬ thµnh sù thËt, h¹nh phóc ngËp trµn!"},
				{"¸nh s¸ng ®ªm Gi¸ng Sinh chiÕu trªn nÒn v¶i tr¾ng, phñ lªn ng­¬i t©m t×nh cña ta, Gi¸ng Sinh vui vÎ!","TuyÕt r¬i, tiÕng tuÇn léc phi, ®ªm b×nh an ngät ngµo ®· tíi, Gi¸ng Sinh vui vÎ!","Trong ®ªm tèi ®Ñp ®Ï nµy, chóc ®ªm Gi¸ng Sinh trµn ngËp tiÕng c­êi vµ kh«ng khİ t­ng bõng lu«n ë bªn ng­¬i.","Giã mang tiÕng chu«ng cña ng­êi say, mang h¹nh phóc Êm ¸p ®Õn thiªn ®­êng cña ng­¬i, Gi¸ng Sinh vui vÎ!","Trong thêi kh¾c nµy ta cã mét t©m t­, nhê m©y mang lêi chóc cña ta ®i, Gi¸ng Sinh vui vÎ!"},{"Mong r»ng hoa tuyÕt sÏ mang lêi chóc cña ta ®Õn bªn ng­¬i, chóc ng­¬i n¨m míi nh­ ı!!","N¨m míi ph¸t tµi, v¹n sù nh­ ı.","N¨m míi vui vÎ, tÊn tµi tÊn léc, c¶ nhµ ®oµn viªn.","Nhê m©y mang lêi chóc cña ta vµo giÊc méng cña ng­¬i, chóc ng­¬i n¨m míi h¹nh phóc!","Chóc lµ mét t©m nguyÖn, chø kh«ng ph¶i lêi ph©n bua. Chóc ng­¬i n¨m míi vui vÎ!","ThËt lßng chóc ng­¬i n¨m míi vui vÎ.!"}}
	}

tDiaTab2 = {
 [1] = {"TiÒn v« nh­ n­íc","T×nh c¶m Êm ¸p","Huynh ®Ö tû muéi","Chóc tr­êng cöu","Chóc xinh ®Ñp","M¸i nhµ bang héi"},
 [2] = {"Chóc vui vÎ","Tµi léc bèn mïa","M·i m·i cña b¹n","10 t©m 10 ı","TiÒn v« nh­ n­íc"},
 [3] = {"Vui vÎ h¹nh phóc","T­ t­ëng xa réng","Duyªn phËn tr­êng cöu","Méng ®Ñp thµnh sù thËt","Chóc lu«n në nô c­êi"},
 [4] = {"Mét ngµy ®Æc biÖt","N­íc Ğp sinh nhËt","VÎ ®Ñp trêi cho","Heo! Vui vÎ nhĞ","Chóc c« ®éng","Chóc may m¾n","Chóc hµi h­íc","Chóc dµi"},
 [5] = {"Tr­êng cöu","Mçi 1 ngµy","B¶o vËt trong tay","§Ñp m·i bªn nhau","Hµng v¹n lêi chóc"},
 [6] = {{"Hoa t­¬i ®ua në","Thá vµ ¸nh tr¨ng","Phong nguyÖt v« biªn","B¸nh chóc phóc","C­êi ngät ngµo","T©m nguyÖn d­íi tr¨ng","Giã m¸t qua mÆt"},{"Ng«n ng÷ hoa hång","Socola ®Ëu","Chóc phóc v« biªn","CÇu h«n h¹nh phóc","Thêi kh¾c","Méng ®Ñp thµnh sù thËt"},{"T©m t×nh vui vÎ","Ngät ngµo b×nh an","TiÕng c­êi rén rµng","Chóc Êm ¸p","Nçi nhí ngËp trµn"},{"N¨m míi nh­ ı","V¹n sù nh­ ı","V¹n lîi chóc","Vui vÎ h¹nh phóc","Ngµn lêi muèn nãi","Ch©n thµnh chóc phóc"}}
 }

function main()
	local strtab = {"Ta muèn göi Chóc phóc bang héi [Tèn ®iÓm thi "..tDiaTab[1][1].." ®iÓm]/#fasong_zhufu(1)",
		"Ta muèn göi Chóc phóc huynh ®Ö [Tèn ®iÓm thi "..tDiaTab[2][1].." ®iÓm]/#fasong_zhufu(2)",
		"Ta muèn göi Chóc phóc b»ng h÷u [Tèn ®iÓm thi "..tDiaTab[3][1].." ®iÓm]/#fasong_zhufu(3)",
		"Ta muèn göi Chóc mõng sinh nhËt [Tèn ®iÓm thi "..tDiaTab[4][1].." ®iÓm]/#fasong_zhufu(4)",
		"Ta muèn göi Chóc phóc ng­êi yªu [Tèn ®iÓm thi "..tDiaTab[5][1].." ®iÓm]/#fasong_zhufu(5)",
		"Ta muèn göi Chóc mõng lÔ héi [Tèn ®iÓm thi "..tDiaTab[6][1].." ®iÓm]/#fasong_zhufu(6)",
		"Ta muèn ®æi 2 phÇn Sao cÇu nguyÖn [Tèn ®iÓm thi 200 ®iÓm]/change_star",
		"Ta muèn xem thµnh tİch thi/abluemoon_jifen",
		"Ta muèn vÒ thµnh T­¬ng D­¬ng/back_xiangyang",
		"Kh«ng sao, ta sÏ ng¾m c¶nh/nothing"
		}
	Say("<color=green>Thè TiÓu Nha<color>: Ng­¬i muèn göi lêi chóc lo¹i nµo? Chó ı, ph¶i lµ ®éi tr­ëng míi cã thÓ göi lêi chóc.",
		getn(strtab),
		strtab)
end

function fasong_zhufu(nType)
	if GetTeamSize() ~= 2 then
		Talk(1,"","<color=green>Thè TiÓu Nha<color>: CÇn <color=yellow>2 ng­êi<color> tæ ®éi míi cã thÓ göi lêi chóc.");
		return
	end		
	if GetName() ~= GetCaptainName() then
		Talk(1,"","<color=green>Thè TiÓu Nha<color>: ChØ cã ®éi tr­ëng míi cã thÓ göi lêi chóc!");
		return
	end
	if GetTask(ABLUEMOON_JIFEN) < tDiaTab[nType][1] then
		Talk(1,"","<color=green>Thè TiÓu Nha<color>: Kh«ng ®ñ ®iÓm tİch lòy!");
		return
	end
	if nType == 1 then --°ïÅÉÅĞ¶Ï
		local nOldPlayerIdx = PlayerIndex;  --±£´æ¶Ó³¤µÄË÷Òı
		if GetTeamMember(0) == GetTeamMember(1) then
			PlayerIndex = GetTeamMember(2);   --¶ÓÓÑµÄË÷Òı
			if IsTongMember() == 0 then
				PlayerIndex = nOldPlayerIdx;
				Talk(1,"","<color=green>Thè TiÓu Nha<color>: §ång ®éi ch­a vµo bang.");
				return
			end
		elseif GetTeamMember(0) == GetTeamMember(2) then
			PlayerIndex = GetTeamMember(1);
			if IsTongMember() == 0 then
				PlayerIndex = nOldPlayerIdx;
				Talk(1,"","<color=green>Thè TiÓu Nha<color>: §ång ®éi ch­a vµo bang.");
				return
			end
		end
		PlayerIndex = nOldPlayerIdx;
	end			
	local strtab = {};
	if nType ~= 6 then
		for i=1,getn(tDiaTab2[nType]) do
			tinsert(strtab,tDiaTab2[nType][i].."/#fasong_detail("..nType..","..i..")");
		end
		tinsert(strtab,"Ta chän nhÇm råi./main")
		Say("<color=green>Thè TiÓu Nha<color>: Xin chän lêi chóc muèn göi",
			getn(strtab),
			strtab)
	else
		Say("<color=green>Thè TiÓu Nha<color>: Muèn göi lêi chóc lÔ héi nµo?",
			5,
			"Trung thu/#choose_jieri(1)",
			"Quèc kh¸nh/#choose_jieri(2)",
			"Gi¸ng sinh/#choose_jieri(3)",
			"N¨m míi/#choose_jieri(4)",
			"Ta chän nhÇm råi./main")
	end
end

function fasong_detail(nIndex,nType,nSix)
	if nIndex ~= 6 then
		Say("<color=green>Thè TiÓu Nha<color>: Ng­¬i chän göi ["..tDiaTab2[nIndex][nType].."]£º<color=red>"..tDiaTab[nIndex][nType+1].."<color> ®ång ı kh«ng?",
			2,
			"§óng, ta muèn göi/#confirm_fasong("..nIndex..","..nType..")",
			"Ta muèn chän l¹i/#fasong_zhufu("..nIndex..")")
	else
		Say("<color=green>Thè TiÓu Nha<color>: Ng­¬i chän göi ["..tDiaTab2[nIndex][nType][nSix].."]£º<color=red>"..tDiaTab[nIndex][nType+1][nSix].."<color> ®ång ı kh«ng?",
			2,
			"§óng, ta muèn göi/#confirm_fasong("..nIndex..","..nType..","..nSix..")",
			"Ta muèn chän l¹i/#fasong_zhufu("..nIndex..")")
	end		
end	

function confirm_fasong(nIndex,nType,nSix)
	local nJifen = tDiaTab[nIndex][1];
	local nOldPlayerIdx = PlayerIndex;
	local nOneName = "";
	local nTwoName = "";
	if GetTeamMember(0) == GetTeamMember(1) then
		nOneName = GetName(GetTeamMember(1));
		nTwoName = GetName(GetTeamMember(2));
		if nIndex == 1 then
			PlayerIndex = GetTeamMember(2);
			nTwoName = "[Bang héi]"..GetTongName();
		end
		PlayerIndex = nOldPlayerIdx;
	elseif GetTeamMember(0) == GetTeamMember(2) then
		nOneName = GetName(GetTeamMember(2));
		nTwoName = GetName(GetTeamMember(1));
		if nIndex == 1 then
			PlayerIndex = GetTeamMember(1);
			nTwoName = "[Bang héi]"..GetTongName();
		end
		PlayerIndex = nOldPlayerIdx;
	end		
	jifen_reduce(nJifen)
	Talk(1,"","<color=green>Thè TiÓu Nha<color>: Lêi chóc cña ng­¬i ®· göi. NÕu cã nhiÒu ng­êi cïng göi, xin chê ®îi.")
	if nIndex ~= 6 then
		Msg2Global(nOneName.."as-"..nTwoName.."Nãi: "..tDiaTab[nIndex][nType+1]);
		AddGlobalNews("<color=red>"..nOneName.."<color> nãi víi <color=red>"..nTwoName.."<color>:"..tDiaTab[nIndex][nType+1]);
	else
		Msg2Global(nOneName.."as-"..nTwoName.."Nãi: "..tDiaTab[nIndex][nType+1][nSix]);
		AddGlobalNews("<color=red>"..nOneName.."<color> nãi víi <color=red>"..nTwoName.."<color>:"..tDiaTab[nIndex][nType+1][nSix]);			
	end
end

function choose_jieri(nType)
	local strtab = {};
	for i=1,getn(tDiaTab2[6][nType]) do
		tinsert(strtab,tDiaTab2[6][nType][i].."/#fasong_detail(6,"..nType..","..i..")");
	end
	tinsert(strtab,"Ta chän nhÇm råi./main")
	Say("<color=green>Thè TiÓu Nha<color>: Xin chän lêi chóc muèn göi",
		getn(strtab),
		strtab)	
end

--========================================================·µ»Ø»ı·Ö===========================================================
function abluemoon_jifen()
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local nTitleLevel = jifen2level(jifen)
	Say("<color=green>Thè TiÓu Nha<color>: §iÓm tİch lòy cña ng­¬i hiÖn lµ: <color=yellow>"..jifen.."<color> ®iÓm.",0)
	for i = 1,getn(tTitle) do --É¾³ıÔ­ÓĞµÄ³ÆºÅ
		RemoveTitle(50,i)
	end
	if AddTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]) == 1 then
		SetCurTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]);
		Msg2Player("B¹n nhËn ®­îc danh hiÖu"..tTitle[nTitleLevel][3].."{X­ng hiÖu}");
	end;
end

function change_star()
	Say("<color=green>Thè TiÓu Nha<color>: Ng­¬i sÏ tèn <color=yellow>200<color> ®iÓm tİch lòy, NhËn ®­îc 2 Sao cÇu nguyÖn, ®ång ı kh«ng?",
		2,
		"§ång ı/confirm_change_star",
		"Kh«ng, ta nhÇm!/nothing")
end

function confirm_change_star()
	if GetTask(ABLUEMOON_JIFEN) < 200 then
		Talk(1,"","<color=green>Thè TiÓu Nha<color>: Kh«ng ®ñ ®iÓm tİch lòy!")
		return
	end
	jifen_reduce(200)
	AddItem(2,1,1171,2,1);
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 2 Sao cÇu nguyÖn!"); 
end

function back_xiangyang()
	Say("<color=green>Thè TiÓu Nha<color>: Ng­¬i muèn vÒ ch­a?",
		2,
		"§ång ı/confirm_back",
		"Kh«ng, ta nhÇm!/nothing")
end

function confirm_back()
	 CleanInteractive();
   NewWorld(350,1454,2981);
end

function nothing()

end
--¼õÉÙ¿Æ¿¼»ı·ÖÍ³Ò»²Ù×÷
function jifen_reduce(reduce_num)
	SetTask(TaskID_get_elixer_times,(GetTask(TaskID_get_elixer_times) - floor(reduce_num/50)))
	SetTask(ABLUEMOON_JIFEN,GetTask(ABLUEMOON_JIFEN) - reduce_num)
end