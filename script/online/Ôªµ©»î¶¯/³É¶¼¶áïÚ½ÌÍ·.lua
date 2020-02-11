--filename:³É¶¼¶áïÚ½ÌÍ·.lua
--create date:2005-12-21
--author:yanjun
--describe:Ö°ÄÜNPC½Å±¾
Include("\\script\\online\\Ôªµ©»î¶¯\\yuandan_head.lua")

function main()
	SetDeathPunish(0)	--È·±£ÎŞËÀÍö³Í·£
	if GetSex() == 1 then
		str_sex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		str_sex = "C« n­¬ng"
	else
		str_sex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	SelTab = {
		"Ta muèn nép tiªu kú./hand_up",
		"Ta muèn t×m hiÓu ho¹t ®éng Nguyªn §¸n ®o¹t kú./know_detail",
		"Ta chØ muèn hái th¨m./nothing"
		}
	Say("Nguyªn §¸n ®o¹t kú ®· b¾t ®Çu!"..str_sex..", ®©y lµ lóc chøng minh søc m¹nh cña ng­¬i!",3,SelTab)
end

function hand_up()
	KillFollower()
	RemoveTitle(3,3)
	if GetTask(TASK_FLAG_HANDUP) ~= GetCurDate() then
		SetTask(TASK_FLAG_HANDUP,0)	--ĞÂµÄÒ»Ìì£¬ÒÑ¶áÆì±ê¼ÇÇå0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= 0 then
		Say("Ng­¬i ®· ®o¹t kú thµnh c«ng, h«m nay kh«ng thÓ tham gia tiÕp, ngµy mai h·y quay l¹i nhĞ!",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 0 then
		Say("Xin lçi, ng­¬i kh«ng cã tiªu kú!.",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		SetTaskTemp(TASK_FLAG_FOLLOW,0)
		SetTask(TASK_FLAG_HANDUP,GetCurDate())
		SetGlbValue(ID_FLAG_NUMBER_CD,GetGlbValue(ID_FLAG_NUMBER_CD)-1)
		if GetGlbValue(ID_FLAG_NUMBER_CD) < 0 then
			SetGlbValue(ID_FLAG_NUMBER_CD,0)
		end
		local flag_left = GetGlbValue(ID_FLAG_NUMBER_CD)
		if AddItem(0,102,21,1,1,-1,-1,-1,-1,-1,-1) == 1 then
			Say("Hay qu¸!"..str_sex.."Cã thÓ ®o¹t lÊy tiªu kú, thËt kh«ng ph¶i dÔ! §©y lµ phÇn th­ëng cña b¹n!",0)
			Msg2Player("B¹n nhËn ®­îc 1 t­íng qu©n giíi chØ!")
		end
		if GetGlbValue(ID_FLAG_NUMBER_CD) == 0 then
			AddGlobalNews("5 tiªu kú ë Nam Thµnh §« ®· bŞ lÊy hÕt, ho¹t ®éng ë khu vùc nµy ®· kÕt thóc.")
			Msg2SubWorld("5 tiªu kú ë Nam Thµnh §« ®· bŞ lÊy hÕt, ho¹t ®éng ë khu vùc nµy ®· kÕt thóc.")
			return 0
		end
		Msg2SubWorld("Nam Thµnh §« cßn l¹i"..flag_left.."tiªu kú.")
	end
end

function nothing()

end

function know_detail()
	Talk(7,"","<color=red>21h vµ 23h mçi tèi tõ 31/12/2005 ®Õn 05/01/2006<color> ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u mçi n¬i sÏ xuÊt hiÖn 5 tiªu kú.","Sau khi nhÊp chuét vµo tiªu kú, tiªu kú sÏ ®i theo b¹n.","Khi mang tiªu kú, nÕu chÕt, ®æi b¶n ®å, rít m¹ng, ®Òu sÏ lµm mÊt tiªu kú, ng­êi ch¬i kh¸c cã thÓ tranh ®o¹t.","Mang tiªu kú vÒ gÆp §o¹t kú gi¸o ®Çu cïng b¶n ®å sÏ nhËn ®­îc phÇn th­ëng.","Ng­êi ch¬i tiÕn vµo b¶n ®å ®o¹t kú, vµ ng­êi ch¬i ®­îc tiªu kú ®Òu kh«ng cã sù trõng ph¹t PK.","§¼ng cÊp yªu cÇu: <color=red>tõ cÊp 10 trë lªn<color>.","PhÇn th­ëng: <color=yellow>T­íng qu©n giíi chØ<color>, néi c«ng t¨ng 4%, ngo¹i c«ng t¨ng 4%.")
end
