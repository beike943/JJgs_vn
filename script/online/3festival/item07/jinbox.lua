--Ê¢ÊÀ½ð±¦Ïä½Å±¾
--by vivi
--09/13/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

--´æ´¢ÁéÊ¯ÈÎÎñ±äÁ¿
SYS_TSK_LINGSHI_ONE = 2321;   --1¼¶ÁéÊ¯µÄÊýÁ¿
SYS_TSK_LINGSHI_TWO = 2322;
SYS_TSK_LINGSHI_THREE = 2323;
SYS_TSK_LINGSHI_FOUR = 2324;
SYS_TSK_LINGSHI_FIVE = 2325;
SYS_TSK_LINGSHI_SIX = 2326;
SYS_TSK_LINGSHI_SEVEN = 2327;  --7¼¶ÁéÊ¯µÄÊýÁ¿

--´æ´¢ÁéÊ¯Åä·½ÈÎÎñ±äÁ¿
SYS_TSK_PEIFANG_ONE = 2328;   --1¼¶Åä·½µÄÊýÁ¿
SYS_TSK_PEIFANG_TWO = 2329;
SYS_TSK_PEIFANG_THREE = 2330;
SYS_TSK_PEIFANG_FOUR = 2331;
SYS_TSK_PEIFANG_FIVE = 2332;
SYS_TSK_PEIFANG_SIX = 2333;
SYS_TSK_PEIFANG_SEVEN = 2334;  --7¼¶Åä·½µÄÊýÁ¿

function OnUse()
	Say("Më r­¬ng vµng ThÞnh ThÕ ph¶i cã ch×a khãa vµng ThÞnh ThÕ, më kh«ng? ",
		2,
		"§ång ý/choose_weapon",
		"Kh«ng cã g×/nothing")
end

function choose_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		Say("Më r­¬ng vµng ThÞnh ThÕ cã thÓ më ra Hoµng §Õ vò khÝ, nÕu më ra Hoµng §Õ vò khÝ. Xin h·y chän c¸c lo¹i vò khÝ sau: ",
			3,
			"Ta muèn lÊy Hiªn Viªn To¸i Vò §ao /#want_weapon(1)",
			"Ta muèn lÊy Hiªn Viªn To¸i Vò §ao/#want_weapon(2)",
			"T¹m thêi kh«ng më r­¬ng /nothing")	
	else
		confirm_open(0);
	end	
end

function want_weapon(nType)
	if nType == 1 then
		Say("NÕu më ra Hoµng §Õ vò khÝ, b¹n chän Hiªn Viªn To¸i Vò §ao, b¹n x¸c nhËn kh«ng? ",
			2,
			"§ång ý/#confirm_open(1)",
			"Ta chän nhÇm råi./choose_weapon");
	elseif nType == 2 then
		Say("NÕu më ra Hoµng §Õ vò khÝ ,b¹n chän Hiªn Viªn To¸i Vò C«n, b¹n x¸c nhËn kh«ng? ",
			2,
			"§ång ý/#confirm_open(2)",
			"Ta chän nhÇm råi./choose_weapon");	
	end	
end

function confirm_open(nType)
	if GetItemCount(2,0,1019) < 1 then
		Talk(1,"","Më r­¬ng vµng ThÞnh ThÕ ph¶i cã ch×a khãa vµng Giang S¬n, b¹n kh«ng cã ch×a khãa vµng ThÞnh ThÕ!");
		return
	else 
		if Zgc_pub_goods_add_chk(5,35) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
			return
		end	
		if DelItem(2,0,1028,1) == 1 and DelItem(2,0,1019,1) == 1 then
			AddItem(tBoxAward[4][1][2],tBoxAward[4][1][3],tBoxAward[4][1][4],tBoxAward[4][1][5],1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tBoxAward[4][1][1]..tBoxAward[4][1][5].."!");
			local nRandOne = random(1,100)
			if nRandOne <= tBoxAward[4][2][3] then
				local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
															SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}				
				local nLv = random(tBoxAward[4][2][1],tBoxAward[4][2][2]);
				Talk(1,"","Chóc mõng b¹n nhËn ®­îc <color=yellow>"..nLv.."<color> (cÊp) Linh th¹ch <color=yellow>1<color>, b¹n dïng <color=yellow>Tô Linh ®Ønh <color>®Ó lÊy nã ra. Tô Linh ®Ønh cã thÓ ®Õn chç <color=yellow>Vâ L©m Minh TruyÒn Nh©n<color>lÊy.");
				SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])+1);
			else
				local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
															SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
				local nLv = random(tBoxAward[4][2][4],tBoxAward[4][2][5]);
				Talk(1,"","Chóc mõng b¹n nhËn ®­îc <color=yellow>"..nLv.."<color> (cÊp) Linh th¹ch Phèi Ph­¬ng <color=yellow>1<color>, b¹n cã thÓ dïng <color=yellow>Tô Linh ®Ønh <color> lÊy nã ra. Tô Linh ®Ønh cã thÓ ®Õn <color=yellow>Vâ L©m Minh TruyÒn Nh©n<color> ®Ó nhËn.");
				SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])+1);
			end
			local nRandTwo = random(1,10000);
			local nRandThree = random(1,10000);
			if nRandTwo <= tBoxAward[4][3][6] then
				AddItem(tBoxAward[4][3][2],tBoxAward[4][3][3],tBoxAward[4][3][4],tBoxAward[4][3][5],1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tBoxAward[4][3][1]..tBoxAward[4][3][5].."!");
				Msg2Global("Ng­êi ch¬i"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc "..tBoxAward[4][3][1]..tBoxAward[4][3][5].."!");
			end
			if nRandThree <= tBoxAward[4][4][2] then
				local nRoute = GetPlayerRoute();
				local nRand = random(1,getn(tbHuangDiRing1[nRoute]));
				local nRetCode = AddItem(tbHuangDiRing1[nRoute][nRand][2],tbHuangDiRing1[nRoute][nRand][3],tbHuangDiRing1[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
				if nRetCode == 1 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing1[nRoute][nRand][1]);
					Msg2Global("Ng­êi ch¬i"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing1[nRoute][nRand][1].."!");
					WriteLog("[07 Tam tiÕt liªn th«ng]:"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing1[nRoute][nRand][1]);
				else
					WriteLog("[B¸o lçi Tam tiÕt liªn th«ng 07]:"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing1[nRoute][nRand][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
				end	
			elseif nRandThree <= tBoxAward[4][4][4] then
				local nRoute = GetPlayerRoute();
				local nRand = random(1,getn(tbHuangDiRing2[nRoute]));
				local nRetCode = AddItem(tbHuangDiRing2[nRoute][nRand][2],tbHuangDiRing2[nRoute][nRand][3],tbHuangDiRing2[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
				if nRetCode == 1 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing2[nRoute][nRand][1]);
					Msg2Global("Ng­êi ch¬i"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing2[nRoute][nRand][1].."!");
					WriteLog("[07 Tam tiÕt liªn th«ng]:"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing2[nRoute][nRand][1]);
				else
					WriteLog("[B¸o lçi Tam tiÕt liªn th«ng 07]:"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tbHuangDiRing2[nRoute][nRand][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
				end							
			elseif nRandThree <= tBoxAward[4][4][6] then --»ÆµÛÎäÆ÷
				local nRoute = GetPlayerRoute();
				if nRoute == 2 then
					local nRetCode = AddItem(tHuangDiWeapon[nRoute][nType][2],tHuangDiWeapon[nRoute][nType][3],tHuangDiWeapon[nRoute][nType][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						Msg2Player("Chóc mõng b¹n nhËn ®­îc trang bÞ Hoµng §Õ "..tHuangDiWeapon[nRoute][nType][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tHuangDiWeapon[nRoute][nType][1].."!");
						WriteLog("[07 Tam tiÕt liªn th«ng]:"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tHuangDiWeapon[nRoute][nType][1]);
					else
						WriteLog("[B¸o lçi Tam tiÕt liªn th«ng 07]:"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tHuangDiWeapon[nRoute][nType][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
					end	
				else
					local nRand = random(1,getn(tHuangDiWeapon[nRoute]));
					local nRetCode = AddItem(tHuangDiWeapon[nRoute][nRand][2],tHuangDiWeapon[nRoute][nRand][3],tHuangDiWeapon[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						Msg2Player("Chóc mõng b¹n nhËn ®­îc trang bÞ Hoµng §Õ "..tHuangDiWeapon[nRoute][nRand][1]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tHuangDiWeapon[nRoute][nRand][1].."!");
						WriteLog("[07 Tam tiÕt liªn th«ng]:"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tHuangDiWeapon[nRoute][nRand][1]);
					else
						WriteLog("[B¸o lçi Tam tiÕt liªn th«ng 07]:"..GetName().."Më r­¬ng vµng ThÞnh ThÕ nhËn ®­îc trang bÞ Hoµng §Õ "..tHuangDiWeapon[nRoute][nRand][1].."B¸o lçi khi AddItem, nRetCode:"..nRetCode);
					end					
				end				
			end
		end
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
