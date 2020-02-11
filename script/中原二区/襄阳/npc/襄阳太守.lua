Include("\\script\\lib\\globalfunctions.lua")
--201403»î¶¯
Include("\\script\\online_activites\\2014_03\\task_camp.lua")

function main()
	local tMsg = {
		"T­¬ng D­¬ng_®«ng nèi s«ng Hoµi, t©y liÒn Thiªn phñ, nam th«ng Miªu LÜnh, b¾c ®Õn BiÖn Kinh. Lµ trung t©m cña thiªn h¹ råi cßn g×.",
		"T­¬ng D­¬ng tuy kh«ng phån vinh b»ng BiÖn Kinh, Thµnh §«, TuyÒn Ch©u nh­ng ë ®©y lóa g¹o ®Çy ¾p, s¶n vËt phong phó, ng­êi d©n chÊt ph¸t. Ta lµm th¸i thó ë ®©y còng qu¸ an nhµn.",
		"Yªn Vò lÇu ë phİa B¾c thµnh th­êng cã nh©n sÜ giang hå ®Õn g©y chuyÖn. Ph¶i cho chóng biÕt T­¬ng D­¬ng cßn cã T­ M· thÕ gia cai qu¶n nÕu kh«ng chóng sÏ lµm lo¹n m·i.",
		"V©n Méng Tr¹ch ë phİa ®«ng qu¸i vËt th­êng xuÊt hiÖn nÕu tiÖn th× PhiÒn b»ng h÷u ®Õn ®ã mét chuyÕn."
	}
	local tSay = {}
	--»î¶¯
  if gf_CheckEventDateEx(WN_201403_CAMPTASK_ID) == 1 then
  	tinsert(tSay, WN_201403_CAMPTASK_TASK);
  end
  --
  tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing")
	Say(tMsg[random(getn(tMsg))], getn(tSay), tSay)
end
