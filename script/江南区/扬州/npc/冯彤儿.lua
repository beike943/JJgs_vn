--·ëÍ®¶ù
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	--»î¶¯µÄ
	local tSay = {};
	--¸±»î¶¯
	local tActivityID = {116};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
	end
	if getn(tSay) > 0 then
		tinsert(tSay, "Ra khái/nothing")
		Say("<color=green>Phïng §ång Nhi<color>: Ng­¬i cã nh×n thÊy ®oµn ng­êi ngùa ngoµi thµnh kh«ng? Ng­êi dÉn ®Çu tªn L«i Th¾ng, ng­¬i ®· nh×n thÊy ch­a?", getn(tSay), tSay);
		return 
	end
	-------
	 
  local nStep = GetTask(TASK_YZ_ONE);
  if nStep == 1 then
      task_01_00();
  elseif nStep == 2 then
      local szTalk = {
          "Ta kh«ng sao ®©u. <sex> ®õng qu¸ lo l¾ng cho ta!"
      }
      TalkEx("", szTalk);
  else
      Talk(1,"","<color=green>Phïng §ång Nhi<color>: Ng­¬i cã nh×n thÊy ®oµn ng­êi ngùa ngoµi thµnh kh«ng? Ng­êi dÉn ®Çu tªn L«i Th¾ng, ng­¬i ®· nh×n thÊy ch­a?");
  end;
end;

function task_01_00()
    local szTalk = {
        "VÞ ®©y lµ Phïng §ång Nhi? Ta ®· mang ®Õn mét tin kh«ng vui…….",
        "Ng­¬i cø nãi! Ta Ýt nhiÒu ®· ®o¸n ®­îc chuyÖn bÊt h¹nh!",
        "L«i Th¾ng ®· bÞ h·m h¹i trªn ®­êng ®Õn D­¬ng Ch©u... L«i huynh ®· ra ®i m·i m·i …T¹i h¹ nh×n thÊy trªn ng­êi L«i huynh cã bøc phong th­. Hy väng cã ®­îc chót t©m nguyÖn cuèi cïng, huynh Êy göi l¹i cho c« n­¬ng!",
        "Ta vµ chµng s¾p nªn nghÜa phu thª...nµo ngê....Chµng tõng nãi víi ta…Tr­íc kia, chµng lµ ng­êi cña Xi Háa gi¸o, ®· h·m h¹i nhiÒu ng­êi nªn trong lßng kh«ng yªn, e r»ng sau nµy cßn ¶nh h­ëng ®Õn con c¸i. Chµng ®· quyÕt ®Þnh rêi khái giang hå, cïng vî con sèng cuéc ®êi Èn dËt, vui thó ®iÒn viªn!"
    };
    TalkEx("task_01_00_00", szTalk);
end;

function task_01_00_00()
    local szTalk = {
        "V× vËy míi nªn cí sù ®au lßng?",
        "§óng! MÊy ngµy tr­íc, thuéc h¹ cña chµng míi mang tíi mét mãn ®å rÊt quan träng. Chµng cßn biÕt H¹ HÇu CÇm lµ ng­êi liªn l¹c cña Tr­êng Ca M«n nªn quyÕt ®Þnh mang vËt quan träng nµy ®Õn cho nµng. Cã lÏ chµng ®· ®o¸n ®­îc nh÷ng nguy hiÓm trªn ®­êng ®i nªn ®· ®Ó ta tù m×nh ®Õn D­¬ng Ch©u? ThËt bÊt h¹nh cho ®êi ta....",
        "C« n­¬ng h·y yªn t©m! T¹i h¹ nhÊt ®Þnh sÏ t×m ra hung thñ!",
        "Bá ®i! T×m lµm g×? B¸o thï ­? PhËn liÔu yÕu nh­ ta th× b¸o thï g× chø! NÕu cã b¸o thï, chµng còng kh«ng sèng l¹i ®­îc, l¹i g©y thªm thï hËn chÊt chång! Th«i th×…",
        "C« n­¬ng nghÜ ®­îc nh­ vËy, t¹i h¹ c¶m thÊy yªn lßng. C« n­¬ng h·y b×nh t©m, nÐn ®au th­¬ng ®Ó sèng nh÷ng ngµy vui vÎ sau nµy!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    DelItem(2,0,101,1);
    SetTask(TASK_YZ_ONE, 2);
    GivePlayerAward("Level_31", "easy", "head", "Level_31");
	GivePlayerExp(SkeyYZxiahouqin,"zuihoudeyuqishu")		--×îºóµÄÓëÆÞÊé
end;