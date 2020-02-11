--=============================================
--create by baiyun 2009.4.12
--describe:Ô½ÄÏ°æ4ÔÂ·Ý½ðÐÇÐÇÒøÐÇÐÇ»î¶¯ ·ÉÑàÏÉ×Ó
--=============================================

Include("\\script\\online\\viet_2009_4\\gsstars\\gsstars_head.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua")

GS_AWARD_PARAM = {
							"D­îc th¶o qu©n dông",
							"Lóa m¹ch qu©n dông",
							"Kho¸ng th¹ch qu©n dông",
							"Linh huyÕt qu©n dông",
							"T¬ t»m qu©n dông",
							"Gç qu©n dông",
							"Thuéc da qu©n dông",
							"Phong lÖnh-trung cÊp",
							"Phong th­ëng lÖnh_Tèng (§« Thèng)",
							"Phong th­ëng lÖnh_Liªu (§« Thèng)",
							"Phong th­ëng lÖnh_Tèng (Tiªn Phong)",
							"Phong th­ëng lÖnh_Liªu (Tiªn Phong)",
							"Qu©n C«ng §¹i",
							"Sæ tay sèng",
							"TÈy Tñy linh ®¬n",
							"B¸t B¶o TÈy Tñy Tiªn §¬n",
							"Phong th­ëng lÖnh_Tèng (T­íng Qu©n)",
							"Phong th­ëng lÖnh_Liªu (T­íng Qu©n)"
};

--------------------------------------
--main()
--Ö÷º¯Êý
--------------------------------------
function main()
	if tonumber(date("%y%m%d%H")) >= 09053124 then
			Talk(1, "", "Thêi gian ho¹t ®éng ®· hÕt.");
			return 0;
	end
	if tonumber(date("%y%m%d%H")) < 09042400 then
		Talk(1, "", "Ho¹t ®éng nµy vÉn ch­a më.");
		return 0;
	end
-----ÅÐ¶ÏµÈ¼¶----------------------------------------------------
	if GetLevel() < GSSTARS_ROLE_LEVEL_LIMIT then
		Talk(1, "", "VÉn ch­a ®¹t ®Õn cÊp <color=yellow>" .. GSSTARS_ROLE_LEVEL_LIMIT .. "<color> cÊp kh«ng thÓ tham dù ho¹t ®éng.");
		return 0;
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ph¶i gia nhËp m«n ph¸i míi cã thÓ tham gia ho¹t ®éng.")
		return 0;
	end
	
-----ÐÇÆÚÒ»ÖÁÐÇÆÚÎå----------------------------------------------
	Say(
		"Phi YÕn Tiªn Tö: Trong kho¶ng thêi gian 24-04-2009 ®Õn 24:00 31-05-2009, c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó n©ng cÊp c¸c Ng«i Sao B¹c thµnh Ng«i Sao Vµng, chi phÝ cho mçi lÇn n©ng cÊp lµ 20 b¹c.",
		7,
		"N©ng cÊp Ng«i Sao B¹c thµnh Ng«i Sao Vµng (CÇn 30 ng«i sao b¹c vµ 20 b¹c)/GSStarsLevelSToG",
		"200" .. "D­îc th¶o qu©n dông" .. "(CÇn 1 Ng«i Sao Vµng)/#GSStarsGetReward(1, 2, 0, 312, 200, 1, 0)",
		"200" .. "Lóa m¹ch qu©n dông" .. "(CÇn 1 Ng«i Sao Vµng)/#GSStarsGetReward(2, 2, 0, 309, 200, 1, 0)",
		"200" .. "Kho¸ng th¹ch qu©n dông" .. "(CÇn 1 Ng«i Sao Vµng)/#GSStarsGetReward(3, 2, 0, 307, 200, 1, 0)",
		"200" .. "Linh huyÕt qu©n dông" .. "(CÇn 1 Ng«i Sao Vµng)/#GSStarsGetReward(4, 2, 0, 313, 200, 1, 0)",
		"Trang kÕ.../Feiyanxianzi_talk_1",
		"T¹i h¹ chØ ghÐ ngang!/GSStarsDoNothing"
	)
end

--------------------------------------
--GSStarsLevelSToG()
--°ÑÒøÐÇÐÇÉý¼¶³É½ðÐÇÐÇ
--------------------------------------
function GSStarsLevelSToG()
-----ÅÐ¶Ï±³°üºÍ¸ºÖØ------------------------
	if gf_Judge_Room_Weight(1, 0, "Xin lçi, ") == 0 then
		return 0
	end
-----Ç®²»¹»--------	
	if GetCash() < GSSTARS_LEVEL_TO_GSTAR_MONEY then
		Talk(1, "", "Ng©n l­îng cña b¹n kh«ng ®ñ!");
		return 0;
	end
-----ÒøÐÇÐÇ²»¹»-------
	if DelItem(2, 1, 30077, GSSTARS_LEVEL_TO_GSTAR_NUM) ~= 1 then
		Say("Nguyªn liÖu mang theo kh«ng ®ñ!", 1, "ThËt ng¹i qu¸! T¹i h¹ sÏ quay l¹i sau./GSStarsDoNothing");
		return 0;
	end
	if Pay(GSSTARS_LEVEL_TO_GSTAR_MONEY) ~= 1 then
		WriteLog("[Ho¹t ®éng ng«i sao vµng ng«i sao b¹c th¸ng 4]:" .. GetName() .. "Chi tr¶".. GSSTARS_LEVEL_TO_GSTAR_MONEY .. " xu thÊt b¹i");
		return 0;
	end
	
	local nRand = 0;
	nRand = random(1, 100);
	if nRand > 0 and nRand <= 80 then --80%µÄ¸ÅÂÊÉý¼¶³É¹¦
		if AddItem(2, 1, 30076, 1) == 1 then
			Msg2Player("Thu ®­îc 1 Ng«i Sao Vµng");			
			WriteLogEx("Hoat dong thang 4","n©ng cÊp",1,"Ng«i Sao Vµng")
		end
	else
		WriteLogEx("Hoat dong thang 4","n©ng cÊp thÊt b¹i",1,"Ng«i Sao Vµng")
		Msg2Player("N©ng cÊp thµnh Ng«i Sao Vµng thÊt b¹i!");
	end
	
	
end

--------------------------------------
--GSStarsGetReward()
--»»È¡½±Àø
--------------------------------------
function GSStarsGetReward(nID, nMainType, nSecondryType, nDetailType, nCount, nGStars, nTimeLimit)
--	if GSStarsGetCurDay() == 0 or GSStarsGetCurDay() == 6 then 
--		Say("Hiªn t¹i ch­a thÓ ®æi Ng«i Sao Vµng", 1, "T¹i h¹ sÏ quay l¹i sau/GSStarsDoNothing");
--		return 0;
--	end
-----ÅÐ¶Ï±³°üºÍ¸ºÖØ------------------------
	if gf_Judge_Room_Weight(1, 200, "Xin lçi, ") == 0 then
		return 0
	end
	
	if nGStars > 0 then
		if DelItem(2, 1, 30076, nGStars) ~= 1 then
			Say("Ng«i Sao Vµng mang theo kh«ng ®ñ!", 1, "ThËt ng¹i qu¸! T¹i h¹ sÏ quay l¹i sau./GSStarsDoNothing");
			return 0;
		end
	end
	local sItemName = GS_AWARD_PARAM[nID];
	local nResult, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount);
	if nResult == 1 then
		if nTimeLimit == 1 then --Èç¹ûÓÐÊ¹ÓÃÆÚÏÞ 7 Ìì
			SetItemExpireTime(nIndex, 7 * 24 * 60 * 60);
		end
		Msg2Player("B¹n nhËn ®­îc ".. nCount .. "c¸i" .. sItemName);
		WriteLogEx("Hoat dong thang 4","Ng«i Sao Vµng",nCount,sItemName)
	end
end

function GSStarsDoNothing()
end

function Feiyanxianzi_talk_1()
	Say("", 11, 
			"200" .. "T¬ t»m qu©n dông" .. "(CÇn 1 Ng«i Sao Vµng)/#GSStarsGetReward(5, 2, 0, 311, 200, 1, 0)",
			"200" .. "Gç qu©n dông" .. "(CÇn 1 Ng«i Sao Vµng)/#GSStarsGetReward(6, 2, 0, 308, 200, 1, 0)",
			"200" .. "Thuéc da qu©n dông" .. "(CÇn 1 Ng«i Sao Vµng)/#GSStarsGetReward(7, 2, 0, 310, 200, 1, 0)",
			"§æi thµnh " .. "Phong lÖnh-trung cÊp" .. "(CÇn 50 Ng«i Sao Vµng)/#GSStarsGetReward(8, 2, 1, 1054, 1, 50, 1)",
			"§æi thµnh " .. "Phong th­ëng lÖnh_Tèng (§« Thèng)" .. "(CÇn 100 Ng«i Sao Vµng)/#GSStarsGetReward(9, 2, 1, 9990, 1, 100, 1)",
			"§æi thµnh " .. "Phong th­ëng lÖnh_Liªu (§« Thèng)" .. "(CÇn 100 Ng«i Sao Vµng)/#GSStarsGetReward(10, 2, 1, 9989, 1, 100, 1)",
			"§æi thµnh " .. "Phong th­ëng lÖnh_Tèng (Tiªn Phong)" .. "(CÇn 300 Ng«i Sao Vµng)/#GSStarsGetReward(11, 2, 1, 9986, 1, 300, 1)",
			"§æi thµnh " .. "Phong th­ëng lÖnh_Liªu (Tiªn Phong)" .. "(CÇn 300 Ng«i Sao Vµng)/#GSStarsGetReward(12, 2, 1, 9985, 1, 300, 1)",
			"Trang kÕ.../Feiyanxianzi_talk_2",
			"trë l¹i/main",
			"T¹i h¹ chØ ghÐ ngang!/GSStarsDoNothing"
			);
end

function Feiyanxianzi_talk_2()
	Say("", 8, 
			"§æi thµnh " .. "Qu©n C«ng §¹i" .. "(CÇn 200 Ng«i Sao Vµng)/#GSStarsGetReward(13, 2, 1, 9998, 1, 200, 1)",
			"§æi thµnh " .. "Sæ tay sèng" .. "(CÇn 500 Ng«i Sao Vµng)/#GSStarsGetReward(14, 2, 19, 1, 1, 500, 1)",
			"§æi thµnh " .. "TÈy Tñy linh ®¬n" .. "(CÇn 600 Ng«i Sao Vµng)/#GSStarsGetReward(15, 2, 0, 137, 1, 600, 1)",
			"§æi thµnh " .. "B¸t B¶o TÈy Tñy Tiªn §¬n" .. "(CÇn 800 Ng«i Sao Vµng)/#GSStarsGetReward(16, 2, 0, 138, 1, 800, 1)",
			"§æi thµnh " .. "Phong th­ëng lÖnh_Tèng (T­íng Qu©n)" .. "(CÇn 400 Ng«i Sao Vµng)/#GSStarsGetReward(17, 2, 1, 9984, 1, 400, 1)",
			"§æi thµnh " .. "Phong th­ëng lÖnh_Liªu (T­íng Qu©n)" .. "(CÇn 400 Ng«i Sao Vµng)/#GSStarsGetReward(18, 2, 1, 9983, 1, 400, 1)",
			"trë l¹i/main",
			"T¹i h¹ chØ ghÐ ngang!/GSStarsDoNothing"
			);
end