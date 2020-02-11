Include("\\script\\task\\killer_hall\\killer_hall_head.lua");
tNormalBook = 
{
	[1] = {"Ngò Quû MËt tÞch",0,107,63},
	[2] = {"Thiªn Hµ MËt tÞch",0,107,64},
	[3] = {"Tö Hµ MËt tÞch",0,107,65},
	[4] = {"Tu La MËt tÞch",0,107,60},
	[5] = {"Chiªm Y Phæ",0,107,66},
	[6] = {"Kim ThiÒn Phæ",0,107,59},
}
tSpecialBook = 
{
	[1] = {"Kim Cang Phôc Ma kinh",0,107,1},	
	[2] = {"Kim Cang Phôc Ma T©m Ph¸p",0,107,2},
	[3] = {"TiÒm Long MËt tÞch",0,107,3},	
	[4] = {"TiÒm Long T©m Ph¸p",0,107,4},	
	[5] = {"V« TrÇn MËt tÞch",0,107,5},	
	[6] = {"V« TrÇn T©m Ph¸p",0,107,6},	
	[7] = {"Thiªn La MËt TÞch",0,107,7},	
	[8] = {"Thiªn La T©m Ph¸p",0,107,8},	
	[9] = {"Nh­ ý MËt TÞch",0,107,9},	
	[10] = {"Nh­ ý T©m Ph¸p",0,107,10},
	[11] = {"BÝch H¶i Phæ",0,107,11},
	[12] = {"BÝch H¶i T©m Ph¸p",0,107,12},
	[13] = {"Hçn §én MËt tÞch",0,107,13},
	[14] = {"Hçn §én T©m Ph¸p",0,107,14},
	[15] = {"Quý Thiªn MËt tÞch",0,107,15},
	[16] = {"Quý Thiªn T©m Ph¸p",0,107,16},
	[17] = {"HuyÒn ¶nh MËt tÞch",0,107,17},
	[18] = {"HuyÒn ¶nh T©m Ph¸p",0,107,18},
	[19] = {"Qu©n Tö MËt tÞch",0,107,19},
	[20] = {"Qu©n Tö T©m Ph¸p",0,107,20},
	[21] = {"TrÊn Qu©n MËt tÞch",0,107,21},
	[22] = {"TrÊn Qu©n T©m Ph¸p",0,107,22},
	[23] = {"Xuyªn V©n MËt tÞch",0,107,23},
	[24] = {"Xuyªn V©n T©m Ph¸p",0,107,24},
	[25] = {"U Minh Quû Lôc",0,107,25},
	[26] = {"U Minh T©m Ph¸p",0,107,26},
	[27] = {"Linh Cæ MËt tÞch",0,107,27},
	[28] = {"Linh Cæ T©m Ph¸p",0,107,28},
}

NEED_FRAG_COUNT = 10;	--ËùÐèËéÆ¬ÊýÁ¿

function OnUse()
	local selTab = {
			"Ta ph¶i thö míi ®­îc/use",
			"Sau nµy h·y nãi/nothing",
			}
	Say("Ng­¬i cã muèn thö ghÐp mÊy m¶nh rêi nµy l¹i kh«ng?",getn(selTab),selTab);
end;

function use()
	if GetItemCount(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4]) >= NEED_FRAG_COUNT then
		if gf_JudgeRoomWeight(1,20) ~= 1 then
			Talk(1,"","Kho¶ng trèng trong hµnh trang cña b¹n kh«ng ®ñ.");
			return 0;
		end;
		if DelItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],NEED_FRAG_COUNT) == 1 then
			local nRand = random(1,100);
			local nRetCode = 0;
			if nRand <= 99 then	--99%¸ÅÂÊ»ñµÃÆÕÍ¨ÃØ¼®
				nRand = random(1,getn(tNormalBook));
				nRetCode = AddItem(tNormalBook[nRand][2],tNormalBook[nRand][3],tNormalBook[nRand][4],1);
				if nRetCode == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 quyÓn mËt tÞch"..tNormalBook[nRand][1]);
					WriteLog("[S¸t Thñ §­êng]::"..GetName().."S¾p xÕp l¹i nh÷ng trang rêi nhËn 1 quyÓn mËt tÞch"..tNormalBook[nRand][1]);
				else
					WriteLog("[S¸t Thñ §­êng b¸o lçi]:"..GetName().."S¾p xÕp l¹i m¶nh rêi, nhËn ®­îc mét quyÓn mËt tÞch, nRetCode:"..nRetCode);
				end;
			else	--1%¸ÅÂÊ»ñµÃÊ¦ÃÅÃØ¼®
				nRand = random(1,getn(tSpecialBook));
				nRetCode = AddItem(tSpecialBook[nRand][2],tSpecialBook[nRand][3],tSpecialBook[nRand][4],1);
				if nRetCode == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 quyÓn mËt tÞch s­ m«n"..tSpecialBook[nRand][1]);
					WriteLog("[S¸t Thñ §­êng]::"..GetName().."S¾p xÕp l¹i m¶nh rêi nhËn ®­îc 1 quyÓn mËt tÞch s­ m«n:"..tSpecialBook[nRand][1]);
				else
					WriteLog("[S¸t Thñ §­êng b¸o lçi]:"..GetName().."S¾p xÕp l¹i m¶nh rêi nhËn ®­îc 1 quyÓn mËt tÞch s­ m«n, nRetCode:"..nRetCode);
				end;			
			end;
		end;
	else
		Talk(1,"","Nh÷ng trang mËt tÞch rêi nµy còng cã thÓ s¾p xÕp l¹i thµnh mét quyÓn, Ýt nhÊt còng cßn"..NEED_FRAG_COUNT.."Trang");
	end;
end;

function nothing()

end;