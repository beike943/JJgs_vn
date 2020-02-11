--Î÷±±Ö÷ÏßÈÎÎñ×°±¸½±Àø½Å±¾
--by vivi
--08/14/2007

--Ç°ÆÚ½±Àøµ÷ÓÃÏà¹Øº¯Êý£º´«Èë²ÎÊýÎª²ß»®ÎÄµµÖÐ¶ÔÓ¦±àºÅ
--Ã±×Ó¡¢¿ã×Ó¡¢ÒÂ·þ£ºgive_zb_award(nId)
--Ê×ÊÎ£ºgive_ss_award(nId)
--ÎäÆ÷£ºgive_wp_award(nId)
--×îÖÕ¶Ò»»½±Àø£¨²»ÓÃ´«Èë²ÎÊý£©£ºfinal_award()

--ÈÎÎñ±äÁ¿
TASK_GET_AWARD = 2037; --¼ÇÂ¼ÁìÈ¡½±Àø³É¹¦Óë·ñµÄ±êÖ¾£¬1±íÊ¾³É¹¦£¬0±íÊ¾Ê§°Ü

--Ç°ÆÚ×°±¸½±Àøtable ¿ã×Ó ÒÂ·þ Ã±×Ó
tZbAward = {
	[26]={[1]={"ChØ TrÇn Trang",0,101,2600},
				[2]={"ChØ TrÇn Trang",0,101,2601},
				[3]={"ChØ TrÇn Trang",0,101,2602},
				[4]={"ChØ TrÇn Trang",0,101,2603}},
	[34]={[1]={"Thõa ¶nh Y",0,100,2604},
				[2]={"Thõa ¶nh Y",0,100,2605},
				[3]={"Thõa ¶nh Y",0,100,2606},
				[4]={"Thõa ¶nh Y",0,100,2607}},
	[44]={[1]={"Khinh V©n Thóc",0,103,2608},
				[2]={"Khinh V©n Thóc",0,103,2609},
				[3]={"Khinh V©n Thóc",0,103,2610},
				[4]={"Khinh V©n Thóc",0,103,2611}}  
	}	

--Ç°ÆÚÊ×ÊÎ½±Àø
tSsAward = {
	[59]={"§»ng Giao BÝch",0,102,2612},
	[64]={"Khëi Ph­îng Ngäc",0,102,2613}
}

--×°±¸±àºÅ£¬¶ÔÓ¦ÉÏÃæÁ½¸ö±í£¬ºóÁ½¸öÎªÎäÆ÷±àºÅ
tZbId = {26,34,44,59,64,11,49}

--Ç°ÆÚÎäÆ÷½±Àø ¶ÔÓ¦½±Àø±àºÅÎª11	
tWqAwardOne = {
	[2]={"Ph¸ Phong §ao",0,3,2510},
	[3]={"PhÇn Phong Tr­îng",0,8,2510},
	[4]={"TËt Phong Thñ",0,0,2510},
	[6]={"Èn Phong Ch©m",0,1,2510},
	[8]={"Håi Phong KiÕm",0,2,2510},
	[9]={"UÈn Phong CÇm",0,10,2510},
	[11]={"LiÖt Phong Thñ",0,0,2511},
	[12]={"Ph¸n Phong C«n",0,5,2510},
	[14]={"L­u Phong KiÕm",0,2,2511},
	[15]={"TiÖt Phong Bót",0,9,2510},
	[17]={"§o·n Phong Th­¬ng",0,6,2510},
	[18]={"TËp Phong Cung",0,4,2510},
	[20]={"Minh Phong NhÉn",0,7,2510},
	[21]={"Dùc Phong Tr¶o",0,11,2510}
	}

--Ð¡°×randomÓÃ	
tRanAwardOne = {
	[1]={"Ph¸ Phong §ao",0,3,2510},
	[2]={"PhÇn Phong Tr­îng",0,8,2510},
	[3]={"TËt Phong Thñ",0,0,2510},
	[4]={"Èn Phong Ch©m",0,1,2510},
	[5]={"Håi Phong KiÕm",0,2,2510},
	[6]={"UÈn Phong CÇm",0,10,2510},
	[7]={"LiÖt Phong Thñ",0,0,2511},
	[8]={"Ph¸n Phong C«n",0,5,2510},
	[9]={"L­u Phong KiÕm",0,2,2511},
	[10]={"TiÖt Phong Bót",0,9,2510},
	[11]={"§o·n Phong Th­¬ng",0,6,2510},
	[12]={"TËp Phong Cung",0,4,2510},
	[13]={"Minh Phong NhÉn",0,7,2510},
	[14]={"Dùc Phong Tr¶o",0,11,2510}
	}

--Ç°ÆÚÎäÆ÷½±Àø ¶ÔÓ¦½±Àø±àºÅÎª49	
tWqAwardTwo = {
	[2]={"§»ng Tinh §ao",0,3,2520},
	[3]={"Lam Tinh Tr­îng",0,8,2520},
	[4]={"ChÊn Tinh Thñ",0,0,2520},
	[6]={"HÊp Tinh Ch©m",0,1,2520},
	[8]={"Tô Tinh KiÕm",0,2,2520},
	[9]={"Th¸i Tinh CÇm",0,10,2520},
	[11]={"TiÕu Tinh Thñ",0,0,2521},
	[12]={"BiÕn Tinh C«n",0,5,2520},
	[14]={"Phi Tinh KiÕm",0,2,2521},
	[15]={"ChuyÓn Tinh Bót",0,9,2520},
	[17]={"§Þnh Tinh Th­¬ng",0,6,2520},
	[18]={"T­êng Tinh Cung",0,4,2520},
	[20]={"Ma Tinh NhÉn",0,7,2520},
	[21]={"Hèi Tinh Tr¶o",0,11,2520}}

--Ð¡°×randomÓÃ
tRanAwardTwo = {
	[1]={"§»ng Tinh §ao",0,3,2520},
	[2]={"Lam Tinh Tr­îng",0,8,2520},
	[3]={"ChÊn Tinh Thñ",0,0,2520},
	[4]={"HÊp Tinh Ch©m",0,1,2520},
	[5]={"Tô Tinh KiÕm",0,2,2520},
	[6]={"Th¸i Tinh CÇm",0,10,2520},
	[7]={"TiÕu Tinh Thñ",0,0,2521},
	[8]={"BiÕn Tinh C«n",0,5,2520},
	[9]={"Phi Tinh KiÕm",0,2,2521},
	[10]={"ChuyÓn Tinh Bót",0,9,2520},
	[11]={"§Þnh Tinh Th­¬ng",0,6,2520},
	[12]={"T­êng Tinh Cung",0,4,2520},
	[13]={"Ma Tinh NhÉn",0,7,2520},
	[14]={"Hèi Tinh Tr¶o",0,11,2520}}

--×îÖÕ×°±¸½±Àø£¬Ã±×Ó£¬¿ã×Ó£¬ÒÂ·þ
tFinalZb = {
	[2]={[1]={"TuyÖt V©n",0,103,2615},
			 [2]={"TuyÖt V©n",0,103,2616},
			 [3]={"TuyÖt V©n",0,103,2617},
			 [4]={"TuyÖt V©n",0,103,2618}},
	[3]={[1]={"Phï Dao",0,101,2619},
			 [2]={"Phï Dao",0,101,2620},
			 [3]={"Phï Dao",0,101,2621},
			 [4]={"Phï Dao",0,101,2622}},
	[4]={[1]={"Ngù Phong",0,100,2623},
			 [2]={"Ngù Phong",0,100,2624},
			 [3]={"Ngù Phong",0,100,2625},
			 [4]={"Ngù Phong",0,100,2626}}	
	}
	
--Ã±×Ó¿ã×ÓÊôÐÔÒ»£¬ÊôÐÔÃû ÊôÐÔµÈ¼¶ Ä§·¨id
tMzAttriOne = {
	[2]={"Ph¸t huy tèc ®é 15%",2,276},
	[3]={"Sinh mÖnh tèi ®a 12%",4,253}
	}

--ÒÂ·þÊôÐÔÒ»
tYfAttriOne = {
	{"Ngo¹i phßng gi¶m 7%, ngo¹i c«ng t¨ng 14%",3,294},
	{"Néi phßng gi¶m 7%, néi c«ng t¨ng 14%",3,442},
	{"S¸t th­¬ng +80",6,331}
	}

--×°±¸ÊôÐÔ¶þ£¨Ã±×Ó¿ã×ÓÒÂ·þ£©
tAttriTwo = {
	{"Søc m¹nh 25 ®iÓm",5,246},
	{"Linh ho¹t 25 ®iÓm",5,248},
	{"Th©n ph¸p 25 ®iÓm",5,247},
	{"Néi c«ng 25 ®iÓm",5,249},
	{"G©n cèt 25 ®iÓm",5,245}
	}	
	
--×îÖÕÊ×ÊÎ½±Àø
tFinalSs = {"Hoan L¨ng B¶o Ngäc",0,102,2614}

--Ê×ÊÎÊôÐÔ ÊôÐÔÒ»Ãû µÈ¼¶ id ÊôÐÔ¶þÃû µÈ¼¶ id
tSsAttri = {
	{"Søc m¹nh 30 ®iÓm",6,246,"TÊt c¶ thuéc tÝnh t¨ng 15 ®iÓm",3,329},
	{"Linh ho¹t 30 ®iÓm",6,248,"TÊt c¶ thuéc tÝnh t¨ng 15 ®iÓm",3,329},
	{"Th©n ph¸p 30 ®iÓm",6,247,"TÊt c¶ thuéc tÝnh t¨ng 15 ®iÓm",3,329},
	{"Néi c«ng 30 ®iÓm",6,249,"TÊt c¶ thuéc tÝnh t¨ng 15 ®iÓm",3,329},
	{"G©n cèt 30 ®iÓm",6,245,"TÊt c¶ thuéc tÝnh t¨ng 15 ®iÓm",3,329}
	}
	
--×îÖÕÎäÆ÷½±Àø
tFinalWp = {
	[2]={"Hoµn ¶nh §ao",0,3,2530},
	[3]={"Lu©n ¶nh Tr­îng",0,8,2530},
	[4]={"HuyÒn ¶nh Thñ",0,0,2530},
	[6]={"Du ¶nh Ch©m",0,1,2530},
	[8]={"Linh ¶nh KiÕm",0,2,2530},
	[9]={"BÝch ¶nh CÇm",0,10,2530},
	[11]={"B«n ¶nh Thñ",0,0,2531},
	[12]={"Ph¸ ¶nh C«n",0,5,2530},
	[14]={"DËt ¶nh KiÕm",0,2,2531},
	[15]={"Phong ¶nh Bót",0,9,2530},
	[17]={"Ngù ¶nh Th­¬ng",0,6,2530},
	[18]={"Hång ¶nh Cung",0,4,2530},
	[20]={"U ¶nh NhÉn",0,7,2530},
	[21]={"Thùc ¶nh Tr¶o",0,11,2530}
	}


--×îÖÕÎäÆ÷random
tFinalRand = {
	[1]={"Hoµn ¶nh §ao",0,3,2530},
	[2]={"Lu©n ¶nh Tr­îng",0,8,2530},
	[3]={"HuyÒn ¶nh Thñ",0,0,2530},
	[4]={"Du ¶nh Ch©m",0,1,2530},
	[5]={"Linh ¶nh KiÕm",0,2,2530},
	[6]={"BÝch ¶nh CÇm",0,10,2530},
	[7]={"B«n ¶nh Thñ",0,0,2531},
	[8]={"Ph¸ ¶nh C«n",0,5,2530},
	[9]={"DËt ¶nh KiÕm",0,2,2531},
	[10]={"Phong ¶nh Bót",0,9,2530},
	[11]={"Ngù ¶nh Th­¬ng",0,6,2530},
	[12]={"Hång ¶nh Cung",0,4,2530},
	[13]={"U ¶nh NhÉn",0,7,2530},
	[14]={"Thùc ¶nh Tr¶o",0,11,2530}
	}

--ÎäÆ÷ÊôÐÔÒ»
tWpAttriOne = {
	{"Ngo¹i c«ng 8%",4,85},
	{"Néi c«ng 8%",4,86},
	{"S¸t th­¬ng+100",2,268}
	}

--ÎäÆ÷ÊôÐÔ¶þ
tWpAttriTwo = {
	{"Søc m¹nh 25 ®iÓm",5,246},
	{"Linh ho¹t 25 ®iÓm",5,248},
	{"Th©n ph¸p 25 ®iÓm",5,247},
	{"Néi c«ng 25 ®iÓm",5,249},
	{"G©n cèt 25 ®iÓm",5,245}
	}
	
--ÎäÆ÷ÊôÐÔÈý
tWpAttriThree = {"TÊt c¶ thuéc tÝnh t¨ng 5 ®iÓm",1,329}	
	
--Ç°ÆÚ½±Àø×°±¸ Ã±×Ó¡¢¿ã×Ó¡¢ÒÂ·þ
function give_zb_award(nId)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
		return
	end	
	local sBody = GetBody();
	local add_flog = AddItem(tZbAward[nId][sBody][2],tZbAward[nId][sBody][3],tZbAward[nId][sBody][4],1,1,-1,-1,-1,-1,-1,-1);
	if add_flog == 1 then
		Msg2Player("Chóc mõng b¹n ®· nhËn ®­îc 1 "..tZbAward[nId][sBody][1]);
		SetTask(TASK_GET_AWARD,1);
	else
		WriteLog("NhiÖm vô T©y B¾c: Ng­êi ch¬i"..GetName().."Thu trang bÞ thÊt b¹i, ký hiÖu thÊt b¹i:"..add_flog);
	end	
end	

--Ç°ÆÚ½±Àø×°±¸ Ê×ÊÎ
function give_ss_award(nId)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
		return
	end
	local add_flog = AddItem(tSsAward[nId][2],tSsAward[nId][3],tSsAward[nId][4],1,1,-1,-1,-1,-1,-1,-1);
	if add_flog == 1 then
		Msg2Player("Chóc mõng b¹n ®· nhËn ®­îc 1 "..tSsAward[nId][1]);
		SetTask(TASK_GET_AWARD,1);
	else
		WriteLog("NhiÖm vô T©y B¾c: Ng­êi ch¬i"..GetName().."Thu trang søc thÊt b¹i, ký hiÖu thÊt b¹i:"..add_flog);
	end
end

--Ç°ÆÚ½±Àø×°±¸ ÎäÆ÷
function give_wp_award(nId)
	local nRoute = GetPlayerRoute();
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		Say("<color=green>KhÊu ChuÈn<color>: Do b¹n ch­a chän ®­êng tu luyÖn vâ c«ng, nªn tÆng b¹n mét mãn vò khÝ ngÉu nhiªn, ®ång ý chø?",
			2,
			"§ång ý/#confirm_wp_award("..nId..")",
			"Sau khi ta b¸i s­ sÏ ®Õn l·nh th­ëng/nothing")
	else
		confirm_wp_award(nId);
	end
end

function confirm_wp_award(nId)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
		return
	end	
	local nRoute = GetPlayerRoute()
	local tAward = {};
	local tRand = {};
	if nId == tZbId[6] then
		tAward = tWqAwardOne;
		tRand = tRanAwardOne;
	elseif nId == tZbId[7] then
		tAward = tWqAwardTwo;
		tRand = tRanAwardTwo;
	end
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		local n = random(1,getn(tRand));
		local add_flog = AddItem(tRand[n][2],tRand[n][3],tRand[n][4],1,1,-1,-1,-1,-1,-1,-1);
		if add_flog == 1 then
		 Msg2Player("Chóc mõng b¹n ®· nhËn ®­îc 1 "..tRand[n][1]);
		 SetTask(TASK_GET_AWARD,1);
		else
		 WriteLog("NhiÖm vô T©y B¾c: Ng­êi ch¬i"..GetName().."Thu vò khÝ thÊt b¹i, ký hiÖu thÊt b¹i: "..add_flog);
		end
	else
		local add_flog = AddItem(tAward[nRoute][2],tAward[nRoute][3],tAward[nRoute][4],1,1,-1,-1,-1,-1,-1,-1);
		if add_flog == 1 then
			Msg2Player("Chóc mõng b¹n ®· nhËn ®­îc 1 "..tAward[nRoute][1]);
			SetTask(TASK_GET_AWARD,1);
		else
			WriteLog("NhiÖm vô T©y B¾c: Ng­êi ch¬i"..GetName().."Thu vò khÝ thÊt b¹i, ký hiÖu thÊt b¹i: "..add_flog);
		end
	end 
end

--×îÖÕ½±Àø¶Ò»»º¯Êý
function final_award()
	local strtab = {
		"Trang søc/#confirm_choose(1)",
		"M·o/#confirm_choose(2)",
		"QuÇn /#confirm_choose(3)",
		"Y phôc/#confirm_choose(4)",
		"Vò khÝ/#confirm_choose(5)",
		"Sau nµy ®æi l¹i/nothing"
		}
	Say("<color=green>KhÊu ChuÈn<color>: H·y chän lo¹i h×nh trang bÞ b¹n muèn ®æi?",
		getn(strtab),
		strtab)	
end

function confirm_choose(nId)
	local tZb = {"Trang søc","M·o","QuÇn ","Y phôc","Vò khÝ"};
	local nRoute = GetPlayerRoute();
	if nId == 5 then
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
			Say("<color=green>KhÊu ChuÈn<color>: Do b¹n ch­a chän ®­êng tu luyÖn vâ c«ng, nªn tÆng b¹n mét mãn vò khÝ ngÉu nhiªn, ®ång ý chø?",
				2,
				"§ång ý/#give_final_award("..nId..")",
				"Ta chän nhÇm råi, chän l¹i/final_award");
		end
	end		
	Say("<color=green>KhÊu ChuÈn<color>: B¹n chän trang bÞ muèn ®æi lµ "..tZb[nId]..". §æi chø?",
		2,
		"§ång ý/#give_final_award("..nId..")",
		"Ta chän nhÇm råi, chän l¹i/final_award");
end

function give_final_award(nId)
	local sBody = GetBody();
	local nRoute = GetPlayerRoute();
	--»ñÈ¡³õÆÚ½±ÀøµÄÎäÆ÷id£¬³õÊ¼ÎªÓÐÂ·Ïß½±ÀøµÄÎäÆ÷id
	local nWpOneGenre = 0;
	local nWpOneDetail = 0;
	local nWpOneParticular = 0;
	local nWpTwoGenre = 0;
	local nWpTwoDetail = 0;
	local nWpTwoParticular = 0;
	local nPosOne = 0; --¼ÇÂ¼ÏÂÃæiµÄÎ»ÖÃ
	local nPosTwo = 0; --¼ÇÂ¼ÏÂÃæjµÄÎ»ÖÃ
	if nRoute ~= 0 and nRoute ~= 1 and nRoute ~= 5 and nRoute ~= 7 and nRoute ~= 10 and nRoute ~= 13 and nRoute ~= 16 and nRoute ~= 19 then
		nWpOneGenre = tWqAwardOne[nRoute][2];
		nWpOneDetail = tWqAwardOne[nRoute][3];
		nWpOneParticular = tWqAwardOne[nRoute][4];
		nWpTwoGenre = tWqAwardTwo[nRoute][2];
		nWpTwoDetail = tWqAwardTwo[nRoute][3];
		nWpTwoParticular = tWqAwardTwo[nRoute][4];	
	end
	--Èç¹ûÃ»ÓÐÂ·Ïß£¬±éÀú»ñÈ¡½±ÀøµÄËæ»úÎäÆ÷
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		for i=1,14 do
			if GetItemCount(tRanAwardOne[i][2],tRanAwardOne[i][3],tRanAwardOne[i][4]) == 1 then
				nWpOneGenre = tRanAwardOne[i][2];
				nWpOneDetail = tRanAwardOne[i][3];
				nWpOneParticular = tRanAwardOne[i][4];
				nPosOne = i;
				break
			end
		end
		for j=1,14 do
			if GetItemCount(tRanAwardTwo[j][2],tRanAwardTwo[j][3],tRanAwardTwo[j][4]) == 1 then
				nWpTwoGenre = tRanAwardTwo[j][2];
				nWpTwoDetail = tRanAwardTwo[j][3];
				nWpTwoParticular = tRanAwardTwo[j][4];
				nPosTwo = j;
				break
			end
		end
	end
	local sDia = "";			
	--²»ÔÚÉíÉÏ¶øÔÚÏä×ÓÀï»ò°ÚÌ¯½çÃæÉÏ£¬ÔòÌáÊ¾
	if GetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 0 and BigGetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 1 then 
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then 
			sDia = sDia..tRanAwardOne[nPosOne][1].."\n";
		else
			sDia = sDia..tWqAwardOne[nRoute][1].."\n";
		end
	end
	if GetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 0 and BigGetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 1 then
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
			sDia = sDia..tRanAwardTwo[nPosTwo][1].."\n";
		else
			sDia = sDia..tWqAwardTwo[nRoute][1].."\n";
		end
	end
	if GetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 1 then
		sDia = sDia..tZbAward[tZbId[1]][sBody][1].."\n";
	end
	if GetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 1	then
		sDia = sDia..tZbAward[tZbId[2]][sBody][1].."\n";
	end
	if GetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 1 then
		sDia = sDia..tZbAward[tZbId[3]][sBody][1].."\n";
	end
	if GetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 1 then
		sDia = sDia..tSsAward[tZbId[4]][1].."\n";
	end
	if GetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 1 then
		sDia = sDia..tSsAward[tZbId[5]][1];
	end
	
	if (GetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 0 and BigGetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 1) or (GetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 0 and BigGetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 1) or
	(GetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 1) or (GetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 1) or
	(GetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 1) or (GetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 1) or
	(GetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 1) then
		Talk(1,"","<color=green>KhÊu ChuÈn<color>: B¹n cßn c¸c trang bÞ sau ®Æt trong r­¬ng chøa ®å hoÆc giao diÖn bµy b¸n, h·y ®Ó nã vµo trong hµnh trang.<color=yellow>"..sDia.."<color>");
	else
		if nId == 1 then --Ê×ÊÎ
			local strtab = {};
			for i=1,getn(tSsAttri) do
				tinsert(strtab,tSsAttri[i][1].."/#confirm_shoushi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay lµ th«i, t¹m thêi kh«ng ®æi/nothing");
			Say("<color=green>KhÊu ChuÈn<color>: H·y chän thuéc tÝnh dßng 1 cña trang søc hiÖn t¹i",
					getn(strtab),
					strtab);
		elseif nId == 2 then --Ã±×Ó
			local strtab = {};
			for i=1,getn(tAttriTwo) do
				tinsert(strtab,tAttriTwo[i][1].."/#confirm_maozi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay lµ th«i, t¹m thêi kh«ng ®æi/nothing");
			Say("<color=green>KhÊu ChuÈn<color>: Thuéc tÝnh dßng 1 xuÊt hiÖn trªn nãn<color=yellow>: "..tMzAttriOne[2][1].."<color>. Xin chän thuéc tÝnh thø hai cña nãn",
				getn(strtab),
				strtab);
		elseif nId == 3 then --¿ã×Ó
			local strtab = {};
			for i=1,getn(tAttriTwo) do
				tinsert(strtab,tAttriTwo[i][1].."/#confirm_kuzi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay lµ th«i, t¹m thêi kh«ng ®æi/nothing");
			Say("<color=green>KhÊu ChuÈn<color>: Thuéc tÝnh dßng 1 xuÊt hiÖn trªn quÇn<color=yellow>: "..tMzAttriOne[3][1].."<color>. Xin chän thuéc tÝnh thø hai cña h¹ y",
				getn(strtab),
				strtab);		
		elseif nId == 4 then --ÒÂ·þ
			local strtab = {};
			for i=1,getn(tYfAttriOne) do
				tinsert(strtab,tYfAttriOne[i][1].."/#confirm_yifu("..nId..","..i..")");
			end
				tinsert(strtab,"Hay lµ th«i, t¹m thêi kh«ng ®æi/nothing");
			Say("<color=green>KhÊu ChuÈn<color>: H·y chän thuéc tÝnh dßng 1 xuÊt hiÖn trªn ¸o",
				getn(strtab),
				strtab);
		elseif nId == 5 then --ÎäÆ÷
			local strtab = {};
			for i=1,getn(tWpAttriOne) do
				tinsert(strtab,tWpAttriOne[i][1].."/#confirm_wuqi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay lµ th«i, t¹m thêi kh«ng ®æi/nothing");
			Say("<color=green>KhÊu ChuÈn<color>: H·y chän thuéc tÝnh dßng 1 xuÊt hiÖn trªn ¸o",
				getn(strtab),
				strtab);			
		end	
	end	
end

function confirm_shoushi(nId,nOne)
	Say("<color=green>KhÊu ChuÈn<color>: B¹n chän thuéc tÝnh dßng 1 xuÊt hiÖn trªn trang søc<color=yellow>: "..tSsAttri[nOne][1].."<color>, thuéc tÝnh cè ®Þnh thø hai lµ: <color=yellow>"..tSsAttri[nOne][4].."<color>, x¸c ®Þnh ch­a?",
		2,
		"§ång ý/#confirm_final("..nId..","..nOne..")",
		"Chän sai råi, ta muèn chän l¹i/give_final_award("..nId..")"
		)	
end

function confirm_maozi(nId,nOne)
	Say("<color=green>KhÊu ChuÈn<color>: B¹n chän thuéc tÝnh dßng 2 xuÊt hiÖn trªn nãn<color=yellow>: "..tAttriTwo[nOne][1].."<color>, x¸c ®Þnh ch­a?",
		2,
		"§ång ý/#confirm_final("..nId..","..nOne..")",
		"Chän sai råi, ta muèn chän l¹i/give_final_award("..nId..")"
		)
end

function confirm_kuzi(nId,nOne)
	Say("<color=green>KhÊu ChuÈn<color>: B¹n chän thuéc tÝnh dßng 2 xuÊt hiÖn trªn quÇn<color=yellow>: "..tAttriTwo[nOne][1].."<color>, x¸c ®Þnh ch­a?",
		2,
		"§ång ý/#confirm_final("..nId..","..nOne..")",
		"Chän sai råi, ta muèn chän l¹i/give_final_award("..nId..")"
		)
end


function confirm_yifu(nId,nOne)
	Say("<color=green>KhÊu ChuÈn<color>: B¹n chän thuéc tÝnh dßng 1 xuÊt hiÖn trªn ¸o<color=yellow>: "..tYfAttriOne[nOne][1].."<color>, x¸c ®Þnh ch­a?",
		2,
		"§ång ý/#choose_yifu_two("..nId..","..nOne..")",
		"Chän sai råi, ta muèn chän l¹i/give_final_award("..nId..")"
		);
end

function choose_yifu_two(nId,nOne)
	local strtab = {};
	for i=1,getn(tAttriTwo) do
		tinsert(strtab,tAttriTwo[i][1].."/#confirm_yifu_two("..nId..","..nOne..","..i..")");
	end
		tinsert(strtab,"Hay lµ th«i, t¹m thêi kh«ng ®æi/nothing");
	Say("<color=green>KhÊu ChuÈn<color>: H·y chän thuéc tÝnh dßng 2 xuÊt hiÖn trªn ¸o",
		getn(strtab),
		strtab);	
end

function confirm_yifu_two(nId,nOne,nTwo)
	Say("<color=green>KhÊu ChuÈn<color>: B¹n chän thuéc tÝnh dßng 2 xuÊt hiÖn trªn ¸o<color=yellow>: "..tAttriTwo[nTwo][1].."<color>, x¸c ®Þnh ch­a?",
		2,
		"§ång ý/#confirm_final("..nId..","..nOne..","..nTwo..")",
		"Chän sai råi, ta muèn chän l¹i/choose_yifu_two("..nId..","..nOne..")"
		);	
end

function confirm_wuqi(nId,nOne)
	Say("<color=green>KhÊu ChuÈn<color>: B¹n chän thuéc tÝnh dßng 1 xuÊt hiÖn trªn vò khÝ<color=yellow>: "..tWpAttriOne[nOne][1].."<color>, x¸c ®Þnh ch­a?",
		2,
		"§ång ý/#choose_wuqi_two("..nId..","..nOne..")",
		"Chän sai råi, ta muèn chän l¹i/give_final_award("..nId..")"
		);	
end

function choose_wuqi_two(nId,nOne)
	local strtab = {};
	for i=1,getn(tWpAttriTwo) do
		tinsert(strtab,tWpAttriTwo[i][1].."/#confirm_wuqi_two("..nId..","..nOne..","..i..")");
	end
		tinsert(strtab,"Hay lµ th«i, t¹m thêi kh«ng ®æi/nothing");
	Say("<color=green>KhÊu ChuÈn<color>: H·y chän thuéc tÝnh dßng 2 xuÊt hiÖn trªn vò khÝ",
		getn(strtab),
		strtab);	
end

function confirm_wuqi_two(nId,nOne,nTwo)
	Say("<color=green>KhÊu ChuÈn<color>: B¹n chän thuéc tÝnh dßng 2 xuÊt hiÖn trªn vò khÝ<color=yellow>: "..tWpAttriTwo[nTwo][1].."<color>, thuéc tÝnh cè ®Þnh thø ba lµ: <color=yellow>"..tWpAttriThree[1].."<color>, x¸c ®Þnh ch­a?",
		2,
		"§ång ý/#confirm_final("..nId..","..nOne..","..nTwo..")",
		"Chän sai råi, ta muèn chän l¹i/choose_wuqi_two("..nId..","..nOne..")"
		);	
end

function confirm_final(nId,nOne,nTwo)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
		return
	end	
	local sBody = GetBody();
	local nRoute = GetPlayerRoute();
	--»ñÈ¡³õÆÚ½±ÀøµÄÎäÆ÷id£¬³õÊ¼ÎªÓÐÂ·Ïß½±ÀøµÄÎäÆ÷id
	local nWpOneGenre = 0;
	local nWpOneDetail = 0;
	local nWpOneParticular = 0;
	local nWpTwoGenre = 0;
	local nWpTwoDetail = 0;
	local nWpTwoParticular = 0;
	if nRoute ~= 0 and nRoute ~= 1 and nRoute ~= 5 and nRoute ~= 7 and nRoute ~= 10 and nRoute ~= 13 and nRoute ~= 16 and nRoute ~= 19 then
		nWpOneGenre = tWqAwardOne[nRoute][2];
		nWpOneDetail = tWqAwardOne[nRoute][3];
		nWpOneParticular = tWqAwardOne[nRoute][4];
		nWpTwoGenre = tWqAwardTwo[nRoute][2];
		nWpTwoDetail = tWqAwardTwo[nRoute][3];
		nWpTwoParticular = tWqAwardTwo[nRoute][4];	
	end
	--Èç¹ûÃ»ÓÐÂ·Ïß£¬±éÀú»ñÈ¡½±ÀøµÄËæ»úÎäÆ÷
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		for i=1,14 do
			if GetItemCount(tRanAwardOne[i][2],tRanAwardOne[i][3],tRanAwardOne[i][4]) == 1 then
				nWpOneGenre = tRanAwardOne[i][2];
				nWpOneDetail = tRanAwardOne[i][3];
				nWpOneParticular = tRanAwardOne[i][4];
				break
			end
		end
		for j=1,14 do
			if GetItemCount(tRanAwardTwo[j][2],tRanAwardTwo[j][3],tRanAwardTwo[j][4]) == 1 then
				nWpTwoGenre = tRanAwardTwo[j][2];
				nWpTwoDetail = tRanAwardTwo[j][3];
				nWpTwoParticular = tRanAwardTwo[j][4];
				break
			end
		end
	end	
	if GetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 1 then
		DelItem(nWpOneGenre,nWpOneDetail,nWpOneParticular,1);
	end
	if GetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 1 then
		DelItem(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular,1);
	end
	if GetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 1 then
		DelItem(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4],1);
	end
	if GetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 1 then
		DelItem(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4],1);
	end
	if GetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 1 then
		DelItem(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4],1);
	end
	if GetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4]) == 1 then
		DelItem(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4],1);
	end
	if GetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4]) == 1 then
		DelItem(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4],1);
	end			
		local add_flog = 0;
		local sName = "";
		if nId == 1 then --Ê×ÊÎ
			add_flog = AddItem(tFinalSs[2],tFinalSs[3],tFinalSs[4],1,1,tSsAttri[nOne][2],tSsAttri[nOne][3],tSsAttri[nOne][5],tSsAttri[nOne][6]);
			sName = tFinalSs[1];
		elseif nId == 2 then --Ã±×Ó
			add_flog = AddItem(tFinalZb[2][sBody][2],tFinalZb[2][sBody][3],tFinalZb[2][sBody][4],1,1,tMzAttriOne[2][2],tMzAttriOne[2][3],tAttriTwo[nOne][2],tAttriTwo[nOne][3]);
			sName = tFinalZb[2][sBody][1];
		elseif nId == 3 then --¿ã×Ó
			add_flog = AddItem(tFinalZb[3][sBody][2],tFinalZb[3][sBody][3],tFinalZb[3][sBody][4],1,1,tMzAttriOne[3][2],tMzAttriOne[3][3],tAttriTwo[nOne][2],tAttriTwo[nOne][3]);
			sName = tFinalZb[3][sBody][1];
		elseif nId == 4 then --ÒÂ·þ
			add_flog = AddItem(tFinalZb[4][sBody][2],tFinalZb[4][sBody][3],tFinalZb[4][sBody][4],1,1,tYfAttriOne[nOne][2],tYfAttriOne[nOne][3],tAttriTwo[nTwo][2],tAttriTwo[nTwo][3]);
			sName = tFinalZb[4][sBody][1];
		elseif nId == 5 then --ÎäÆ÷
			if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
				local n = random(1,getn(tFinalRand));
				add_flog = AddItem(tFinalRand[n][2],tFinalRand[n][3],tFinalRand[n][4],1,1,tWpAttriOne[nOne][2],tWpAttriOne[nOne][3],tWpAttriTwo[nTwo][2],tWpAttriTwo[nTwo][3],tWpAttriThree[2],tWpAttriThree[3]);
				sName = tFinalRand[n][1];
			else
				add_flog = AddItem(tFinalWp[nRoute][2],tFinalWp[nRoute][3],tFinalWp[nRoute][4],1,1,tWpAttriOne[nOne][2],tWpAttriOne[nOne][3],tWpAttriTwo[nTwo][2],tWpAttriTwo[nTwo][3],tWpAttriThree[2],tWpAttriThree[3]);
				sName = tFinalWp[nRoute][1];
			end 
		end
		if add_flog == 1 then
			Msg2Player("Chóc mõng b¹n, ®· ®æi thµnh c«ng"..sName);
			SetTask(TASK_GET_AWARD,1);
		else
			WriteLog("NhiÖm vô T©y B¾c: Ng­êi ch¬i"..GetName().."Thu trang bÞ sau cïng thÊt b¹i, log: "..add_flog);
		end 
end

function nothing()

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