--ÎäÁÖÃËÌØÊ¹½Å±¾
--by vivi
--09/06/2007
--edit by 2008/08/29

Include("\\script\\online\\3festival\\3festival_head.lua")
	 
function main()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080911 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Ho¹t ®éng ch­a b¾t ®Çu.");
		return
	end
	if nDate > 20081012 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Ho¹t ®éng ®· kÕt thóc. Chóc c¸c ®¹i hiÖp vui vÎ!")
		return		
	end
	local strtab = {
		"Ta muèn nhËn phÇn th­ëng Quèc Kh¸nh h«m nay /get_today_award",
		"Ta muèn nhËn phÇn th­ëng Quèc Kh¸nh/get_yestoday_award",
		"Chµo mõng lÔ Quèc Kh¸nh, phÇn th­ëng nh©n ®«i kinh nghiÖm/about_shuangbei",
		"PhÇn th­ëng Quèc Kh¸nh cã g×?/what_award",
		"PhÇn th­ëng c¸c lo¹i b¶o hép/how_about_box",
		"Ta chØ ®Õn xem thö/nothing"
		}
	Say("<color=green>§Æc sø Vâ L©m<color>: §Ó c¸m ¬n c¸c ®¹i hiÖp ®· cèng hiÕn cho vâ l©m, trong ngµy lÔ Quèc Kh¸nh nµy cã mét sè phÇn th­ëng, c¸c ®¹i hiÖp dõng b­íc ghÐ xem. Ngoµi ra, ta còng rÊt thÝch ¨n b¸nh, trung thu còng ®· ®Õn råi, nÕu ng­¬i cã thÓ mang ®Õn cho ta lo¹i b¸nh mµ ta thÝch, ta sÏ ®a t¹ ng­¬i b»ng b¶o hép.",
		getn(strtab),
		strtab)	
end

function get_today_award()		
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20081007 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Ho¹t ®éng ph¸t quµ ngµy lÔ Quèc Kh¸nh ®· kÕt thóc, nÕu trong thêi gian diÔn ra, kh«ng nhËn ®ñ phÇn th­ëng, cã thÓ nhËn bï th«ng qua <color=yellow>Danh s¸ch Vâ L©m<color>.");
		return
	end
	if GetLevel() < 30 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: §¼ng cÊp cña ng­¬i qu¸ thÊp, ®i hµnh tÈu giang hå luyÖn ®Õn cÊp <color=yellow>30<color> råi ®Õn nhËn.");
		return
	end
	Say("<color=green>§Æc sø Vâ L©m<color>: Tr­íc khi nhËn th­ëng Quèc Kh¸nh ph¶i xem <color=yellow>ThuyÕt minh nhËn th­ëng<color>, ®Õn <color=yellow>Thè TiÓu Nha<color> Thè ®¹i s­ ®o¸n sè kh¸ hay, nÕu <color=yellow>may m¾n<color>, sÏ nhËn ®­îc nhiÒu phÇn th­ëng, kh«ng xem còng kh«ng sao, phÇn th­ëng còng vËy!",
		3,
		"Ta muèn nhËn phÇn th­ëng Quèc Kh¸nh h«m nay /confirm_get_award",
		"ThuyÕt minh nhËn phÇn th­ëng Quèc Kh¸nh /about_this_festival",
		"Ta sÏ ®îi nhËn ®ît sau, giê muèn xem l¹i thuyÕt minh/nothing")
end                                                                                                                                                                                                                

function confirm_get_award()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_WULIN_IS_AWARD) >= nDate then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Ng­¬i ®· nhËn phÇn th­ëng h«m nay råi, mai ®Õn xem nhÐ.");
		return			
	end
	if Zgc_pub_goods_add_chk(10,50) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
		return
	end	
	local nTaskLuck = GetTask(ABLUEMOON_LUCK);
	local nLucky = 2;--Î´Ëã¹ý£¬Ä¬ÈÏÒ»°ã
	local nDay = tonumber(date("%y%m%d"));
	if GetTask(ABLUEMOON_LUCK_DATE) == nDay then  --Èç¹ûËã¹ýÁË ¸³Óèµ±Ç°ÔËÊÆ
		nLucky = nTaskLuck;  
	end	
	Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: §©y lµ phÇn th­ëng ngµy h«m nay cña ng­¬i!");
	if nLucky == 1 then --´óÐ× ¶ÔÓ¦tWuLinAward±íÖÐµÄ[1]
		award_detail(1);
		SetTask(TASK_WULIN_IS_AWARD,nDate);	
	elseif nLucky == 7 then --´ó¼ª
		award_detail(3);
		SetTask(TASK_WULIN_IS_AWARD,nDate);
		Msg2Player("H«m nay b¹n thËt may m¾n, nhËn ®­îc rÊt nhiÒu phÇn th­ëng!");
	else
		award_detail(2);
		SetTask(TASK_WULIN_IS_AWARD,nDate);
	end	
end

function get_yestoday_award()
	if GetLevel() < 30 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: §¼ng cÊp cña ng­¬i qu¸ thÊp, ®i hµnh tÈu giang hå luyÖn ®Õn cÊp <color=yellow>30<color> råi ®Õn nhËn.");
		return
	end
	local nDate = floor((GetTime()+28800)/86400);
	local nTime = tonumber(date("%Y%m%d"));
	if nTime > 20081008 then
		nDate = floor((MkTime(2008,10,8)+28800)/86400);
	end	
	local nStartDate = floor((MkTime(2008,9,11)+28800)/86400);
	local nDay = nDate-nStartDate;
	local nNum = nDay - GetTask(TASK_WULIN_AWARD_NUM);
	if nNum <= 0 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: PhÇn th­ëng Quèc Kh¸nh ng­¬i ®· nhËn ®ñ c¶ råi");
		return
	else
		Say("<color=green>§Æc sø Vâ L©m<color>: LÇn ho¹t ®éng nµy ng­¬i ®· nhËn råi<color=yellow>"..GetTask(TASK_WULIN_AWARD_NUM).."<color> lÇn phÇn th­ëng Quèc Kh¸nh, b¹n cßn <color=yellow>"..nNum.."<color> lÇn kh«ng nhËn phÇn th­ëng Quèc Kh¸nh, nhËn bï <color=yellow>1 lÇn<color> ph¶i cã <color=yellow> 1 quyÓn Vâ l©m minh<color>, b¹n x¸c nhËn kh«ng? ",
			2,
			"Ta muèn nhËn/confirm_get_yestoday_award",
			"T¹m thêi kh«ng dïng/nothing")
	end;
end

function confirm_get_yestoday_award()
	if GetItemCount(2,0,1023) < 1 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Ng­¬i kh«ng cã <color=yellow>Danh s¸ch Vâ L©m<color> µ, ng­¬i kh«ng lõa ta chø.");
		return
	end
	if Zgc_pub_goods_add_chk(10,50) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
		return
	end	
	if DelItem(2,0,1023,1) == 1 then
		award_detail(3);
	end		
end

function award_detail(nIndex)
	local nDate = tonumber(date("%Y%m%d"));
	local nlevel = GetLevel();
	local nExpArg = (GetLevel()^3)/(80^3)*10000; --¾­ÑéÏµÊý		
	if nlevel ~= 99 then
		ModifyExp(floor(tWuLinAward[nIndex][1]*nExpArg));
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..floor(tWuLinAward[nIndex][1]*nExpArg).." ®iÓm kinh nghiÖm!");
	else
		if nIndex == 3 then
			AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],40);
			Msg2Player("B¹n nhËn ®­îc 40 cuèn "..tItemInfo[27][1]);
		elseif nIndex == 2 then
			AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],30);
			Msg2Player("B¹n nhËn ®­îc 30 quyÓn "..tItemInfo[27][1]);		
		else
			AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],20);
			Msg2Player("B¹n nhËn ®­îc 20 cuèn"..tItemInfo[27][1]);		
		end
	end
	
	AddItem(tWuLinAward[nIndex][2][2],tWuLinAward[nIndex][2][3],tWuLinAward[nIndex][2][4],tWuLinAward[nIndex][2][5]);
	Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tWuLinAward[nIndex][2][1]..tWuLinAward[nIndex][2][5].."!");
	local nRanOne = random(tWuLinAward[nIndex][3][5],tWuLinAward[nIndex][3][6]);
	AddItem(tWuLinAward[nIndex][3][2],tWuLinAward[nIndex][3][3],tWuLinAward[nIndex][3][4],nRanOne);
	Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tWuLinAward[nIndex][3][1]..nRanOne.."!");

	local nRanTwo = random(1,10000);
	local nRanTotal = 0; --4-9ÖÐ¸ÅÂÊµÄµþ¼Ó
	for i = 4,9 do
		nRanTotal = nRanTotal + tWuLinAward[nIndex][i][6];
		if nRanTwo <= nRanTotal then
			AddItem(tWuLinAward[nIndex][i][2],tWuLinAward[nIndex][i][3],tWuLinAward[nIndex][i][4],tWuLinAward[nIndex][i][5],1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tWuLinAward[nIndex][i][1]..tWuLinAward[nIndex][i][5].."!");
			if i >= 7 then
				Msg2Global("§¹i hiÖp"..GetName().."NhËn phÇn th­ëng kû niÖm"..tWuLinAward[nIndex][i][1]..tWuLinAward[nIndex][i][5].."!");
				WriteLog("[08 Tam tiÕt liªn th«ng]: Ng­êi ch¬i"..GetName().."NhËn phÇn th­ëng kû niÖm"..tWuLinAward[nIndex][i][1]..tWuLinAward[nIndex][i][5].."!");
			end
			break
		end
	end
	SetTask(TASK_WULIN_AWARD_NUM,GetTask(TASK_WULIN_AWARD_NUM)+1);		
end
                                                                                                                                                                                                                    
function what_award()
  Talk(1,"what_award2","<color=green>§Æc sø Vâ L©m<color>: Trong ngµy lÔ nµy, chØ cÇn ng­¬i ®Õn chç ta nhËn phÇn th­ëng, th×\n<color=red>nhËn ®­îc<color>\n<color=yellow> kinh nghiÖm            Dùa vµo ®¼ng cÊp kh¸c nhau mµ thay ®æi (cÊp 99 nhËn ®­îc Thiªn thêi chó gi¶i)\nHép Ngäc Bµi Huy Hoµng   dïng Ch×a Khãa Ngäc Huy Hoµng më nhËn ®­îc phÇn th­ëng\nCh×a Khãa Ngäc Huy Hoµng     dïng ®Ó më Hép Ngäc Bµi Huy Hoµng<color>") 
end

function what_award2()
	Talk(1,"what_award3","<color=green>§Æc sø Vâ L©m<color>:<color=red> nhËn ®­îc <color>\n<color=yellow> Hép §ång Bµi Huy Hoµng     dïng Ch×a Khãa §ång Huy Hoµng më nhËn ®­îc phÇn th­ëng\nHép Ng©n Bµi Vinh Dù     dïng Ch×a Khãa B¹c Vinh Dù më nhËn ®­îc phÇn th­ëng\nHép Kim Bµi Vinh Dù     dïng Ch×a Khãa Vµng Vinh Dù më nhËn ®­îc phÇn th­ëng\nCh×a Khãa §ång Huy Hoµng       dïng ®Ó më Hép §ång Bµi Huy Hoµng\nCh×a Khãa B¹c Vinh Dù       dïng ®Ó më Hép Ng©n Bµi Vinh Dù\nCh×a Khãa Vµng Vinh Dù       dïng ®Ó më Hép Kim Bµi Vinh Dù<color>")
end

function what_award3()
	Talk(1,"main","<color=green>§Æc sø Vâ L©m<color>: NÕu h«m nay ng­¬i ®Õn chç <color=yellow>Thè TiÓu Nha<color> ®o¸n sè gÆp <color=yellow>may m¾n<color>, cã thÓ t¨ng sè l­îng vËt phÈm nhËn ®­îc.")
end	 
   
function how_about_box()
  local strtab = {
  	"Hép Ngäc Bµi Huy Hoµng ®ùng g×/#box_thing(1)",
  	"Hép §ång Bµi Huy Hoµng ®ùng g×/#box_thing(2)",
  	"Hép Ng©n Bµi Huy Hoµng ®ùng g×/#box_thing(3)",
  	"Hép Kim Bµi Huy Hoµng ®ùng g×/#box_thing(4)",
  	"C­êng hãa trang søc Hoµng §Õ Hiªn Viªn vµ Hiªn Viªn §Êu /duihuan",  	
  	"Ta chØ ®Õn xem thö/nothing"
  	}
  Say("<color=green>§Æc sø Vâ L©m<color>: Vâ L©m Minh Chñ ta kh«ng ph¶i lµ ng­êi keo kiÖt, lÔ nµy ®· chuÈn bÞ rÊt nhiÒu b¶o hép, chØ cÇn ng­¬i may m¾n, lµ cã thÓ nhËn ®­îc b¶o hép vµ ch×a khãa, sau khi më sÏ nhËn ®­îc phÇn th­ëng, ng­¬i muèn r­¬ng nµo.",
  	getn(strtab),
  	strtab)	 
end

function box_thing(nType)
	local tBoxName = {"Hép Ngäc Bµi Huy Hoµng","Hép §ång Bµi Huy Hoµng","Hép Ng©n Bµi Vinh Dù","Hép Kim Bµi Vinh Dù"}
	local sDiaOne = "";
	local sDiaTwo = "";
	if IB_VERSION == 1 then
		for i = 1,getn(tAboutBoxIB[nType][1]) do
			sDiaOne = sDiaOne..tAboutBoxIB[nType][1][i].."\n";
		end
		for j=1,getn(tAboutBoxIB[nType][2]) do
			sDiaTwo = sDiaTwo..tAboutBoxIB[nType][2][j].."\n";
		end
	else
		for i = 1,getn(tAboutBox[nType][1]) do
			sDiaOne = sDiaOne..tAboutBox[nType][1][i].."\n";
		end
		for j=1,getn(tAboutBox[nType][2]) do
			sDiaTwo = sDiaTwo..tAboutBox[nType][2][j].."\n";
		end	
	end	
	
	Talk(2,"how_about_box","<color=green>§Æc sø Vâ L©m<color>:"..tBoxName[nType].."_mÆc dï nhiÒu, nh­ng kh«ng nªn xem th­êng "..tBoxName[nType].."Bªn trong Èn chøa linh khÝ Cµn kh«n.".."<color=yellow> sÏ nhËn ®­îc vËt phÈm sau<color>\n"..sDiaOne,"<color=green>§Æc sø Vâ L©m<color>:<color=yellow> SÏ nhËn ®­îc 1 trong c¸c vËt phÈm sau<color>\n"..sDiaTwo);
end
   
function about_this_festival()
	Talk(1,"get_today_award","<color=green>§Æc sø Vâ L©m<color>: Trong thêi gian ho¹t ®éng mçi ngµy cã thÓ nhËn phÇn th­ëng, nh­ng mçi ng­êi mçi ngµy chØ cã thÓ nhËn 1 lÇn.\nMçi ngµy ®Õn chç <color=yellow>Thè TiÓu Nha<color> ®o¸n sè còng hay, nÕu may m¾n, sÏ nhËn ®­îc nhiÒu phÇn th­ëng!")   
end

function duihuan()
	Talk(1,"how_about_box","<color=green>§Æc sø Vâ L©m<color>: Trang søc Hoµng §Õ trong hép vinh dù vµ huy hoµng lµ <color=yellow>Hiªn Viªn ChiÕn<color> vµ <color=yellow>Hiªn viªn §Êu<color>, cã thÓ dïng trang søc Hoµng Kim ®Æc ®Þnh kh¸c c­êng hãa. B¹n cã thÓ ®Õn T­¬ng D­¬ng t×m ®Ö tö cña thî rÌn L­u, dïng Hiªn Viªn ChiÕn vµ Hiªn viªn §Êu hoÆc 2 R­¬ng vµng ThÞnh ThÕ, céng thªm trang søc Hoµng Kim ®Æc ®Þnh, ®æi Hiªn Viªn ChiÕn vµ Hiªn Viªn §Êu cã thuéc tÝnh ®Æc biÖt sau khi c­êng hãa, h¬n n÷a cã thÓ ®em chóng ®i kÝch ho¹t, thuéc tÝnh kÝch ho¹t sÏ kh«ng ¶nh h­ëng.")   
end

function about_shuangbei()
------------------³õÊ¼»¯Â¶Ë®Ð§¹û------------------------
	local tItemInfo =
	{
		{2, 1, 1012, 7200, 150, "Bång Lai Tiªn Thñy",1},
		{2, 0, 109, 7200, 200, "Bång Lai Tiªn Lé",1.5},
		{2, 1, 1013, 7200, 300, "Bång Lai Tiªn §¬n",2},
		{2, 1, 1052, 7200, 120, "Bång Lai Lé Thñy",0},
	}
	for index, value in tItemInfo do
		InitXclSpeed(index, value[5])
	end
----------------------------------------------------------	
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20081001 or nDate > 20081007 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Trong thêi gian lÔ Quèc Kh¸nh (1/10/2008 - 7/10/2008) h·y ®Õn nhËn.");
		return
	end 
	local nTime = tonumber(date("%H"));
	if nTime < 8 or nTime >= 23 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Vµo lóc 8:00 s¸ng - 23:00 tèi ®Õn nhËn.");
		return
	end
	local strtab = {
		"Ta muèn nhËn /get_shuangbei",
		"T¹m thêi kh«ng nhËn/nothing"
		}
	Say("<color=green>§Æc sø Vâ L©m<color>: Trong thêi gian lÔ Quèc Kh¸nh mçi ng­êi mçi ngµy cã thÓ ®Õn chç ta nhËn <color=yellow>B¹ch C©u Hoµn nh©n ®«i hiÖu qu¶ trong 8h, nh©n ®«i kinh nghiÖm trong 4h vµ nh©n ®«i ®é cèng hiÕn s­ m«n nguyªn ngµy<color>,<color=red> chó ý, cã thÓ sÏ ®æi hiÖu qu¶ thêi gian nh©n ®«i cÊp cao hiÖn t¹i cña ng­¬i.<color>",
		getn(strtab),
		strtab)
end

function get_shuangbei()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TASK_WULIN_SHUANGBEI) >= nDate then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Ng­¬i ®· nhËn phÇn th­ëng nh©n ®«i ngµy h«m nay, mçi ng­êi mçi ngµy chØ cã thÓ nhËn 1 lÇn.");
		return
	end
	local nType, nTime, nSpeed = GetExistXclInfo();
	if nTime > 0 then
		if nSpeed > 200 then
			Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: HiÖn giê ng­¬i cã hiÖu qu¶ kinh nghiÖm m¹nh, kh«ng thÓ nhËn.");
			return
		end
	end
	if GetTask(85) == nDate and GetTask(86) == 3 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: HiÖn ng­¬i cã hiÖu qu¶ ®é cèng hiÕn s­ m«n m¹nh, kh«ng thÓ nhËn.");
		return
	end
	SetTask(TASK_WULIN_SHUANGBEI,nDate);
	SetTask(TASK_BAIJU_SB_TIME,480);
	Msg2Player("B¹n nhËn ®­îc B¹ch C©u Hoµn nh©n ®«i hiÖu qu¶ trong 8h, b©y giê cã hiÖu lùc.");
	local nRet = EatXcl(2,14400)
	if nRet == 1 then
		Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ nh©n ®«i kinh nghiÖm");
	end	
	SetTask(85,nDate);
	SetTask(86,2);
	Msg2Player("Trong h«m nay ®é cèng hiÕn s­ m«n b¹n nhËn ®­îc t¨ng 2 lÇn");
end