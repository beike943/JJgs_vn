--ÊÀ½çÈÎÎñ
--µØµã£ºÏåÑô  ÈÎÎñ£ºÊÕ¼¯Ç¹Í·ºÍµ¶ÇÊ
--²ß»®£º·®ÍòËÉ  2004.01.27

-- ¶ÁÈëÈÎÎñÒıÇæÍ·ÎÄ¼ş
Include("\\script\\lib\\task_main.lua");
Include("\\script\\task\\world\\task_award.lua")

function main()

local strMain_001 = {
	"Ng­¬i ®· nghe qua Thæ PhØ ë Phôc Ng­u S¬n ch­a?",
	"Ta kh«ng quan t©m, chØ cÇn b¸ t¸nh kh«ng sao lµ ®­îc råi!",
	"Nh­ng ta nghe nãi bän chóng ®· ®em b×nh sø cña Th¸i thó ®i råi?",
	"ChuyÖn nµy bİ mËt, nghe nãi chØ cã ch­ëng m«n <color=yellow>Tö H¹c Ch©n Nh©n<color> ë <color=yellow>Vâ §ang ph¸i<color> biÕt th«i.",
	"C¸i b×nh gèm nµy còng cã liªn quan ®Õn Vâ §ang ch­ëng m«n µ?",
	"NÕu vËy th× ph¶i hái Tö H¹c Ch©n Nh©n th«i."
}

	if CTask:IsTaskStart("T×m Tr­¬ng ¶nh_T­¬ng D­¬ng")==1 then
		CTask:TalkEx("task_yes_001", strMain_001);
		return
	end;

	UWorld1510 = GetTask(1510)
	if ( UWorld1510 == 0 and  GetLevel() > 19 )  then
		Say("Së thİch cña ta lµ thu thËp vò khİ, ng­¬i cã thÓ ®Õn Vâ §ang thu thËp cho ta 10 ThiÕt Th­¬ng §Çu vµ bao ®ao kh«ng?",2,"ChuyÖn nhá th«i mµ/yes1510","Ta ®ang bËn l¾m!/no1510")
	elseif ( UWorld1510 == 5 and  GetItemCount(2,1,20) > 9 and GetItemCount(2,1,21) > 9)  then	
		Talk(1,"","TiÓu huynh ®Ö qu¶ nhiªn nãi lµ lµm, cã chót thµnh ı xin nhËn cho!")
		SetTask(1510,10)
		DelItem(2,1,20,10)
		DelItem(2,1,21,10)
		Earn(600)
		GivePlayerExp(SkeyShiJieChongFu,"zhangying")
	  ModifyReputation(8,0)
		    --AddNote("°ïÕÅÓ°ÊÕ¼¯ÎäÆ÷µÄÈÎÎñÍê³É")
		TaskTip("Hoµn thµnh nhiÖm vô gióp Tr­¬ng ¶nh thu thËp vò khİ")
	elseif ( UWorld1510  ==10 )  and  (GetItemCount(2,1,20)<= 9 or GetItemCount(2,1,21)<= 9  )  then
		Talk(1,"","D­íi ch©n nói Vâ §ang cã thÓ t×m ®­îc bao ®ao vµ ThiÕt Th­¬ng §Çu.")
	else
		i=random(1,3)
		if i==1 then 
			Talk(1,"","Kh«ng sai, ta chİnh lµ ®Ö nhÊt thiªn h¹, trªn ®êi nµy kh«ng cã g× lµ ta kh«ng biÕt.")
		elseif i == 2 then  
			Talk(1,"","BÊt luËn lµ tµ ph¸i hay ch¸nh ph¸i, cã vÖic g× kh«ng râ cø ®Õn t×m ta.")
		else
			Talk(1,"","BiÕt nhiÒu qu¸ ®«i lóc còng khæ.")
		end
	end
end;

-- ½ÓÊÜÈÎÎñÈ¥ÕÒ×Ïº×ÕæÈË
function task_yes_001()
	CTask:FinishTask("T×m Tr­¬ng ¶nh_T­¬ng D­¬ng");
	CTask:StartTask("T­¬ng D­¬ng_t×m Tö H¹c Ch©n Nh©n");
	return
end;

function yes1510()
		Talk(1,"","PhiÒn tiÓu huynh ®Ö ®Õn ch©n nói Vâ §ang t×m gióp ta 10 bao ®ao vµ ThiÕt Th­¬ng §Çu.")
		SetTask(1510,5)
		--AddNote("½ÓÊÜ°ïÕÅÓ°ÊÕ¼¯ÎäÆ÷µÄÈÎÎñ")
		TaskTip("NhËn nhiÖm vô thu thËp vò khİ cho Tr­¬ng ¶nh.")
		--ModifyReputation(8,0)
end;

function no1510()
		Talk(1,"","Ta chØ cã lóc r¶nh míi ®éng thñ.")
end;