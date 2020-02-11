Include("\\script\\online\\viet_event\\200908\\quockhanh\\quockhanh_head.lua")

function main()
	if CheckEventDate() == 1 then
		Say("<color=green>Bµ x· thî rÌn L­u:<color> D¹o nµy ta thÌm ¨n kÑo nh­ng l·o L­u l¹i bËn bÞu c«ng viÖc, kh«ng biÕt cã ai mang kÑo cho ta ¨n hay kh«ng ?",
				2,
				"§æi kÑo lÊy phÇn th­ëng. (33 KÑo SÇu Riªng + 33 KÑo M·ng CÇu + 33 KÑo Nho)/trade_candy",
				"Ta chØ ghÐ ngang!/end_dialogover");
	else
		Say("Ho¹t ®éng ®· kÕt thóc!",0)
	end
end

function trade_candy()
	if GetLevel() < 73 then
		Say("<color=green>Bµ x· thî rÌn L­u:<color> Ng­¬i ch­a tíi cÊp 73, kh«ng ®­îc phÐp ®æi", 0);
		return 0;
	end
	
	if GetItemCount(2, 1, 30103) < 33 then
		Say("<color=green>Bµ x· thî rÌn L­u:<color> Sè kÑo M·ng CÇu ng­¬i mang theo kh«ng ®ñ", 0);
		return 0;
	end
	
	if GetItemCount(2, 1, 30104) < 33 then
		Say("<color=green>Bµ x· thî rÌn L­u:<color> Sè kÑo SÇu Riªng ng­¬i mang theo kh«ng ®ñ", 0);
		return 0;
	end
	
	if GetItemCount(2, 1, 30102) < 33 then
		Say("<color=green>Bµ x· thî rÌn L­u:<color> Sè kÑo Nho ng­¬i mang theo kh«ng ®ñ", 0);
		return 0;
	end
	
	if GetTask(INDEPENDENCE_DATE_TASKID) >= tonumber(date("%y%m%d")) then
		Say("<color=green>Bµ x· thî rÌn L­u:<color> Ngµy h«m nay ng­¬i ®· ®æi mét lÇn råi, ngµy mai h·y quay l¹i.", 0);
		return 0;
	end
	
	nType = 1;
	nRand = random(1, 100);
	if  nRand <= 60 then
		nType = 1;
	elseif nRand > 60 and nRand <= 85 then
		nType = 2;
	elseif nRand > 85 then
		nType = 3;
	end
	
	if gf_Judge_Room_Weight(tIndependenceItem[nType][3], tIndependenceItem[nType][4], "Bµ x· Thî rÌn L­u") == 0 then		
		Msg2Player("B¹n ch­a ®ñ ®iÒu kiÖn ®æi phÇn th­ëng")
		return 0;
	end
	
	if DelItem(2, 1, 30103, 33) == 1 and DelItem(2, 1, 30104, 33) == 1 and DelItem(2, 1, 30102, 33) == 1 then
		ModifyExp(14000000);
		
		nRetCodeAll = 1;
		for i = 1, tIndependenceItem[nType][2][4] do
			local nRetCode, nItem = AddItem(tIndependenceItem[nType][2][1], tIndependenceItem[nType][2][2], tIndependenceItem[nType][2][3], 1);
			if nRetCode == 1 then
				if tIndependenceItem[nType][5] ~= 0 then
					SetItemExpireTime(nItem, tIndependenceItem[nType][5]*24*60*60)
				end
			else
				nRetCodeAll = 0;
			end
		end
		
		if nRetCodeAll == 1 then
			Say("<color=green>Bµ x· thî rÌn L­u:<color> Chóc mõng ng­¬i ®· nhËn ®­îc "..tIndependenceItem[nType][2][4].." "..tIndependenceItem[nType][1],0);
			Msg2Player("B¹n nhËn ®­îc "..tIndependenceItem[nType][2][4].." "..tIndependenceItem[nType][1]);
			WriteLogEx("Hoat dong thang 8","Quoc Khanh",tIndependenceItem[nType][2][4],tIndependenceItem[nType][1]);
			SetTask(INDEPENDENCE_DATE_TASKID, tonumber(date("%y%m%d")));
		else
			WriteLogEx("Hoat dong thang 8","AddItem thÊt b¹i",tIndependenceItem[nType][2][4],tIndependenceItem[nType][1]);
		end
	end
end