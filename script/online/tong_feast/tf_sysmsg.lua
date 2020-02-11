Include("\\script\\online\\tong_feast\\tf_head.lua")

function main()
	local today = Date();
	DebugOutput("today:week() =", today:week());
	if today:week() ~= 6 and today:week() ~= 0 then
		return 0;
	end
	DebugOutput("***Tong Feast Reset and Start!***");
	--ÖØÖÃ¹²ÏíÊý¾Ý-----------------------
	DebugOutput("ThiÕt ®Æt l¹i §Çu bÕp bang ")
	local s = SDB(TF_FEAST_CHEF, 0, 0);
	s:delete();
	DebugOutput("ThiÕt ®Æt l¹i sè bµn tiÖc");
	local s1 = SDB(TF_FEAST_CHEF, 0, 2);
	s1:delete(); 
	DebugOutput("ThiÕt ®Æt l¹i ®å ¨n"); 
	local s2 = SDB(TF_FEAST_CHEF, 0, 3);
	s2:delete();
	DebugOutput("ThiÕt ®Æt l¹i sè ng­êi ch¬i");
	local s3 = SDB(TF_FEAST_CHEF, 0, 4);
	s3:delete();
	--------------------------------------
	tf_ClearNpcIndexTime();
	Msg2Global("YÕn tiÖc bang héi ®· më, mêi c¸c anh em trong bang héi m×nh nhanh chãng ®Õn BiÖn Kinh, Thµnh §«, TuyÒn Ch©u t×m ®Çu bÕp bang ph¸i, ®Ó lµm tiÖc héi cña bang!");
	AddLocalCountNews("YÕn tiÖc bang héi ®· më, mêi c¸c anh em trong bang héi m×nh nhanh chãng ®Õn BiÖn Kinh, Thµnh §«, TuyÒn Ch©u t×m ®Çu bÕp bang ph¸i, ®Ó lµm tiÖc héi cña bang!", 2);
end