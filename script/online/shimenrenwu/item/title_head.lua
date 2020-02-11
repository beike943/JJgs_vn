tTitle = {	--³ÆºÅÃû×Ö£¬³ÆºÅ´óÀà£¬³ÆºÅÐ¡Àà£¬ÎïÆ·±àºÅ1£¬ÎïÆ·±àºÅ2£¬ÎïÆ·±àºÅ3
	[2] = {{"Hµnh gi¶",6,1,2,1,395},{"Hçn Nguyªn T¨ng",6,2,2,1,396}},
	[3] = {{"Khæ Hµnh T¨ng",8,1,2,1,399},{"ThiÒn Tu T¨ng",8,2,2,1,400}},
	[4] = {{"Sa Di",7,1,2,1,397},{"§Êu T¨ng",7,2,2,1,398}},
	[6] = {{"Trang Kh¸ch",9,1,2,1,401},{"Hé VÖ",9,2,2,1,402}},
	[8] = {{"Thanh T©m Sø",10,1,2,1,403},{"Vò Y Sø",10,2,2,1,404}},
	[9] = {{"T­ Khóc Sø",11,1,2,1,405},{"Ph¹n ¢m Sø",11,2,2,1,406}},
	[11] = {{"ChÊp B¸t §Ö Tö",12,1,2,1,407},{"Trõ Gian §Ö Tö",12,2,2,1,408}},
	[12] = {{"ChÊp Bæng §Ö Tö",13,1,2,1,409},{"Trõng ¸c §Ö Tö",13,2,2,1,410}},
	[14] = {{"Thanh Tu ®¹o nh©n",14,1,2,1,411},{"NhËp Quan ®¹o nh©n",14,2,2,1,412}},
	[15] = {{"Thanh Phong ®¹o nh©n",15,1,2,1,413},{"S¬n D­¬ng ®¹o nh©n",15,2,2,1,414}},
	[17] = {{"Khinh kþ binh",16,1,2,1,415},{"HiÖu óy",16,2,2,1,416}},
	[18] = {{"Xuyªn D­¬ng Thñ",17,1,2,1,417},{"§« óy",17,2,2,1,418}},
	[20] = {{"§o¹t Ph¸ch T¶n Nh©n",18,1,2,1,419},{"Th«i MÖnh T¶n Nh©n",18,2,2,1,420}},
	[21] = {{"§éc Tµm T¶n Nh©n",19,1,2,1,421},{"Thùc T©m T¶n Nh©n",19,2,2,1,422}},
}

function Use_Title(nRoute,nTitleLevel)	--µÚÒ»¸ö²ÎÊýÊÇÔÊÐíÊ¹ÓÃ¸ÃÎïÆ·µÄÂ·Ïß£¬µÚ¶þ¸ö²ÎÊýÊÇ³ÆºÅµÄµÈ¼¶
	if GetPlayerRoute() ~= nRoute then
		Talk(1,"","B¹n kh«ng thÓ sö dông vËt phÈm l­u ph¸i kh¸c");
		return 0;
	end;
	local selTab = {
			"§ång ý/#Confirm("..nTitleLevel..")",
			"§Ó ta suy nghÜ l¹i/nothing",
			}
	Say("Sö dông vËt phÈm nµy cã thÓ thay ®æi danh hiÖu s­ m«n cña b¹n, b¹n x¸c nhËn muèn sö dông?",getn(selTab),selTab);
end;

function Remove_Other_Title()
	for i=6,19 do	--Ôö¼ÓÐÂµÄÂ·ÏßÊ±Õâ¸öÒªÐÞ¸Ä
		for j=1,2 do	--Ôö¼ÓÐÂµÄ³ÆºÅÊ±Õâ¸öÒªÐÞ¸Ä
			RemoveTitle(i,j);
		end;
	end;
end;

function Confirm(nTitleLevel)
	local nRoute = GetPlayerRoute();
	local nGenreIndex = nTitleLevel;
	Remove_Other_Title();
	if DelItem(tTitle[nRoute][nTitleLevel][4],tTitle[nRoute][nTitleLevel][5],tTitle[nRoute][nTitleLevel][6],1) == 1 then
		if AddTitle(tTitle[nRoute][nTitleLevel][2],tTitle[nRoute][nTitleLevel][3]) == 1 then
			SetCurTitle(tTitle[nRoute][nTitleLevel][2],tTitle[nRoute][nTitleLevel][3]);
			Msg2Player("B¹n nhËn ®­îc danh hiÖu"..tTitle[nRoute][nTitleLevel][1].."{X­ng hiÖu}");
		end;
	end;
end;

function nothing()

end;