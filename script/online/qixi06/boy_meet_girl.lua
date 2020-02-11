--file name:boy_meet_girl.lua
--author:yanjun
--create date:2006-6-26
--describe:06ÄêÆßÏ¦»î¶¯£¬Å£ÀÉÖ¯Å®ÏàÓöÊÂ¼þÆô¶¯½Å±¾
Include("\\script\\online\\qixi06\\qixi06_head.lua");

function main()
	if Get_Qixi06_State() == 1 then
		--ÈýÕÅÒøºÓµØÍ¼²»¿É·ÅÍ¬Ò»·þÎñÆ÷
		local nStarCount1 = GetMapTaskTemp(GALAXY_MAP1,4);
		local nStarCount2 = GetMapTaskTemp(GALAXY_MAP2,4);
		local nStarCount3 = GetMapTaskTemp(GALAXY_MAP3,4);
		local nStarCount = 0;
		local nMapID = 0;
		if type(nStarCount1) == "number" then
			nStarCount = nStarCount1;
			nMapID = GALAXY_MAP1;
		elseif type(nStarCount2) == "number" then
			nStarCount = nStarCount2;
			nMapID = GALAXY_MAP2;	
		elseif type(nStarCount3) == "number" then
			nStarCount = nStarCount3;
			nMapID = GALAXY_MAP3;	
		else
			WriteLog("[Lçi ho¹t ®éng ThÊt TÞch]: Trong files gèc boy_meet_girl.lua kh«ng t×m kh«ng thÊy map chÝnh x¸c, cã kh¶ n¨ng m¸y chñ kh«ng cã map Ng©n Hµ.");
			return 0;
		end;
		local nDate = tonumber(date("%y%m%d"));
		if nStarCount >= REQUIRE_STAR_COUNT or nDate == 060728 then
			AddLocalNews("Ng­u Lang vµ Chøc N÷ sÏ gÆp nhau ë d¶i Ng©n Hµ, c¸c b¹n cã thÓ vµo d¶i Ng©n Hµ ®Ó chøng kiÕn thêi kh¾c c¶m ®éng nµy.")
			Msg2SubWorld("Ng­u Lang vµ Chøc N÷ sÏ gÆp nhau ë d¶i Ng©n Hµ, c¸c b¹n cã thÓ vµo d¶i Ng©n Hµ ®Ó chøng kiÕn thêi kh¾c c¶m ®éng nµy.")		
			create_meeting(nMapID);
		else
			AddLocalNews("§¸ng tiÕc h«m nay ¸nh sao ¶m ®¹m, e r»ng sÏ kh«ng thÊy c¶nh Ng­u Lang vµ Chøc N÷ gÆp nhau")
			Msg2SubWorld("§¸ng tiÕc h«m nay ¸nh sao ¶m ®¹m, e r»ng sÏ kh«ng thÊy c¶nh Ng­u Lang vµ Chøc N÷ gÆp nhau")		
		end;
	end;
end;

function create_meeting(nMapID)
	SubWorld = SubWorldID2Idx(nMapID);
	if SubWorld > 0 then
		OpenMission(MISSION_ID);
		WriteLog("[Ho¹t ®éng ThÊt TÞch]: Ng­u Lang ®· gÆp Chøc N÷, ngµy:"..date("%y%m%d"));
	else
		WriteLog("[Lçi ho¹t ®éng ThÊt TÞch]: Trong hµm sè create_meeting, gi¸ trÞ SubWorld sai, gi¸ trÞ sai:"..SubWorld);
	end;
end;