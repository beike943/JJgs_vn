--file name:qiaonv_npc.lua
--author:yanjun
--create date:2006-6-26
--describe:06ÄêÆßÏ¦»î¶¯ÇÉÅ®NPC½Å±¾
Include("\\script\\online\\qixi06\\qixi06_head.lua");

function main()
	local nMapID = GetWorldPos();
	local nDate = tonumber(date("%y%m%d"));
	if nMapID == 100 or nMapID == 200 or nMapID == 300 then
		local selTab = {
				"Ta muèn nhËn Tinh Tinh §Şa §å/get_atlas",
				"Ta muèn vµo d¶i Ng©n Hµ/go_to_galaxy",
				"Ta muèn l·nh Hång bao/get_award",
				"Ta muèn t×m hiÓu ho¹t ®éng/know_detail",
				"Ta chØ ®Õn xem/nothing",
				}
		if GetTask(TASK_PLANTSTAR_DATE) ~= nDate then
			tremove(selTab,3);
		end;
		--Say("<color=green>ÇÉÅ®<color>£ºÊ±ÖµÆßÔÂ³õÆßÈµÇÅ»á£¬¸ÕºÃÒ»¶ÎÒøºÓ»¯ÎªÁ÷ĞÇÓê×¹ÂäÈË¼ä£¬ÕæÊÇÃÀÃî°¡¡£",getn(selTab),selTab);
	else	--ÔÚÒøºÓµØÍ¼
		local selTab = {
				"PhiÒn X¶o N÷ ®­a ta vÒ/leave_galaxy",
				"Ta ®îi thªm mét l¸t/nothing",
				}
		Say("Vµo ngµy 7 th¸ng 7 cÇu ¤ Th­íc b¾c sang võa lóc d¶i Ng©n Hµ hãa thµnh trËn m­a sao b¨ng r¬i xuèng nh©n gian, thËt lµ mét c¶nh t­îng tuyÖt ®Ñp!",getn(selTab),selTab);
	end;
end;

function get_award()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_PLANTSTAR_DATE) ~= nDate then
		return 0;
	end;
	if GetTask(TASK_QIAONV_AWARD_DATE) >= nDate then
		Talk(1,"","Xin lçi! H«m nay b¹n ®· nhËn phÇn th­ëng nµy råi");
		return 0;
	end;
	Talk(1,"","Chót quµ män, xin h·y nhËn lÊy.");
	SetTask(TASK_QIAONV_AWARD_DATE,nDate);
	ModifyGoldenExp(300000);
	Msg2Player("B¹n nhËn ®­îc 300000 ®iÓm søc kháe");
	ModifyReputation(10,0);
end;

function know_star_count()
	local nMapID = GetWorldPos()
	Talk(1,"main","D¶i Ng©n Hµ hiÖn cã <color=yellow>"..GetMapTaskTemp(nMapID,4).."<color> ng«i sao. ChØ cÇn sè l­îng ng«i sao ®¹t <color=yellow>"..REQUIRE_STAR_COUNT.."<color> ng«i, Ng­u Lang vµ Chøc N÷ cã thÓ gÆp nhau ë d¶i Ng©n Hµ, mäi ng­êi h·y cè g¾ng th¾p s¸ng cµng nhiÒu ng«i sao!");
end;

function get_atlas()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_GOTATLAS_DATE) >= nDate then
		Talk(1,"","H«m nay b¹n ®· nhËn"..t7XiItem["atlas"][1].."1 lÇn råi.");
		return 0;
	end;
	SetTask(TASK_GOTATLAS_DATE,nDate);
	local nRetCode = AddItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],1);
	ModifyGoldenExp(100000);
	Msg2Player("B¹n nhËn ®­îc 100000 ®iÓm søc kháe");
	ModifyReputation(5,0);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 quyÓn "..t7XiItem["atlas"][1]);
	else
		WriteLog("[Lçi ho¹t ®éng ThÊt TŞch]:"..GetName().."Lçi khi nhËn Tinh Tinh §Şa §å, trŞ quay l¹i chØ lÖnh AddItem:"..nRetCode);
	end;
end;

function go_to_galaxy()
	SetLogoutRV(1);	--ÉèÎª³ÇÊĞÖØÉúµã
	SetFightState(0);	--ºÍÆ½×´Ì¬
	local nMapID = GetWorldPos();
	CleanInteractive();
	NewWorld(965+floor(nMapID/100),1628,3298);
end;

function know_detail()
	Talk(3,"know_detail_1","Ho¹t ®éng lÇn nµy chia lµm 4 phÇn. <enter><color=yellow>PhÇn 1: Mçi tèi cã thÓ ®Õn Thµnh §«, BiÖn Kinh, TuyÒn Ch©u<color> t×m <color=yellow>X¶o N÷<color> gÇn D· TÈu nhËn <color=yellow>1 Tinh Tinh §Şa §å<color>. Sö dông Tinh Tinh §¹i §å cã thÓ nhËn ®­îc täa ®é, ®Õn täa ®é chØ ®Şnh cña ®Şa ®å chØ ®Şnh sö dông Tinh Tinh §Şa §å cã thÓ nhËn ®­îc ng«i <color=yellow>Sao b¨ng<color>",
					"<color=yellow><enter>PhÇn 2 Th¾p s¸ng ng«i sao: <color><enter> Sau khi ng­êi ch¬i nhËn ®­îc Sao b¨ng cã thÓ t×m <color=yellow>X¶o N÷<color> ®Ó vµo d¶i Ng©n Hµ, trong d¶i Ng©n Hµ sö dông Sao b¨ng sÏ xuÊt hiÖn 1 ng«i sao.",
					"<color=yellow><enter>PhÇn 3 Ng­u Lang, Chøc N÷ t­¬ng ngé: Sau khi <color><enter>sè l­îng ng«i sao<color=yellow> trªn <color>d¶i Ng©n Hµ ®¹t ®Õn <color=yellow>"..REQUIRE_STAR_COUNT.."<color> ng«i, Ng­u Lang, Chøc N÷ sÏ gÆp nhau lóc <color=yellow>9 giê tèi<color>, Ng­u Lang, Chøc N÷ sÏ bªn nhau trong <color=yellow>15 phót<color>.");
end;

function know_detail_1()
	Talk(3,"main","<color=yellow><enter>PhÇn 4 §æi phÇn th­ëng: <color><enter>Ng­êi ch¬i ch­a nhËn phÇn th­ëng h«m ®ã vµ th¾p s¸ng c¸c ng«i sao cã thÓ ®èi tho¹i víi <color=yellow>Ng­u Lang hoÆc Chøc N÷<color> nhËn phÇn th­ëng. Ng­êi ch¬i ®· th¾p s¸ng sao cña h«m ®ã cã thÓ ®Õn gÆp <color=yellow>X¶o N÷<color> nhËn 1 phÇn th­ëng nhá.",
					"Thêi gian ho¹t ®éng lµ tõ <color=yellow>28/7 ®Õn 6/8 (bao gåm c¶ 2 ngµy nµy)<color>.",
					"Chó ı: T×m h¶o h÷u cïng tham gia tæ ®éi sÏ cã ®iÒu bÊt ngê x¶y ra!");
end;

function leave_galaxy()
	local nMapID = GetWorldPos();
	SetLogoutRV(0);
	if nMapID == 966 then
		NewWorld(100,1445,2950);
	elseif nMapID == 967 then
		NewWorld(200,1412,2853);
	elseif nMapID == 968 then
		NewWorld(300,1776,3541);
	else
		--Msg2Player("ÏµÍ³³ö´í£¬Çë½ØÍ¼ºóµ½ÂÛÌ³ÁªÏµGM£¬Ğ»Ğ»ÄúµÄºÏ×÷¡£");
		WriteLog("[Lçi ho¹t ®éng ThÊt TŞch]:"..GetName().."Lóc rêi khái map d¶i Ng©n Hµ, IP map nhËn ®­îc sai, trŞ sè lµ:"..nMapID);
		NewWorld(100,1445,2950);	--Ä¬ÈÏ´«»ØÈªÖİ
	end;
end;

function know_time()
	local sTimeLeft = "";
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"));
	sTimeLeft = nHour.." giê "..nMin.." Phót "
	Talk(1,"main","Thêi gian hiÖn t¹i lµ <color=yellow>"..sTimeLeft.."<color>. Vµo kho¶ng <color=yellow>21 giê<color> mçi tèi Ng­u Lang vµ Chøc N÷ sÏ gÆp nhau, mäi ng­êi h·y nhí râ thêi gian.");
end;

function get_award_by_atlas()
	local nAtlasCount = GetItemCount(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4])
	if nAtlasCount <= 0 then
		Talk(1,"","B¹n kh«ng cã Tinh Tinh §Şa §å?");
		return 0;
	end;
	local selTab = {
				"Ta muèn ®æi ngay/#get_award_confirm(1,"..nAtlasCount..")",
				"Sau nµy h·y ®æi/nothign",
				}
	Say("B¹n cã tæng céng <color=yellow>"..nAtlasCount.."<color> c¸i"..t7XiItem["atlas"][1]..", cã thÓ ®æi lÊy <color=yellow>"..(20*nAtlasCount).."<color> v¹n ®iÓm søc kháe vµ <color=yellow>"..(5*nAtlasCount).."<color> ®iÓm danh väng. B¹n muèn ®æi lÊy phÇn th­ëng?",getn(selTab),selTab)
end;

function get_award_by_star()
	local nStarCount = GetItemCount(t7XiItem["star"][2],t7XiItem["star"][3],t7XiItem["star"][4])
	if nStarCount <= 0 then
		Talk(1,"","B¹n kh«ng cã ng«i sao?");
		return 0;
	end;
	local selTab = {
				"Ta muèn ®æi ngay/#get_award_confirm(2,"..nStarCount..")",
				"Sau nµy h·y ®æi/nothign",
				}
	Say("B¹n cã tæng céng <color=yellow>"..nStarCount.."<color> c¸i"..t7XiItem["star"][1]..", cã thÓ ®æi lÊy <color=yellow>"..(30*nStarCount).."<color> v¹n ®iÓm søc kháe vµ <color=yellow>"..(5*nStarCount).."<color> ®iÓm danh väng. B¹n x¸c nhËn muèn §æi phÇn th­ëng?",getn(selTab),selTab)			
end;

function get_award_confirm(nType,nCount)
	if nType == 1 then
		if DelItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],nCount) == 1 then
			ModifyGoldenExp(200000*nCount);
			Msg2Player("B¹n nhËn ®­îc "..(20*nCount).."v¹n ®iÓm kinh nghiÖm.");
			ModifyReputation(5*nCount,0);
			WriteLog("[Ho¹t ®éng ThÊt TŞch]:"..GetName().."Dïng thÎ"..nCount.."tÊm Tinh Tinh §Şa §å ®æi ®­îc phÇn th­ëng.");
		end;
	else
		if DelItem(t7XiItem["star"][2],t7XiItem["star"][3],t7XiItem["star"][4],nCount) == 1 then
			ModifyGoldenExp(300000*nCount);
			Msg2Player("B¹n nhËn ®­îc "..(30*nCount).."v¹n ®iÓm kinh nghiÖm.");
			ModifyReputation(5*nCount,0);
			WriteLog("[Ho¹t ®éng ThÊt TŞch]:"..GetName().."Dïng thÎ"..nCount.."tÊm Tinh Tinh ®æi ®­îc phÇn th­ëng.");
		end;
	end;
end;
