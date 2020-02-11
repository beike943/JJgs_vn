--±øÂíÖ¸»ÓÊ¹
--created by lizhi
--2005-9-10 11:38

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_main.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");
--201403»î¶¯
Include("\\script\\online_activites\\2014_03\\task_camp.lua")

function main()
	--»î¶¯
--	if WN_201403_CampTask_DealTask() == 1 then
--		return
--	end
	-------
  local szTalk = {
      "Oa KhÊu ®ét nhiªn xua qu©n tÊn c«ng Trung Nguyªn, ai nÊy ®Òu c¨m phÉn!"
  };
  local szSay = {
		"Oa KhÊu ®ét nhiªn xua qu©n tÊn c«ng Trung Nguyªn, ai nÊy ®Òu c¨m phÉn!",
		"NhËn ®­îc b¶o vËt §¹i Tèng/GetCallBossItem"
  };
	if CheckTime(6) == 0 and CheckTime(0) == 0 then	--Ö»ÓĞĞÇÆÚÁù£¬ĞÇÆÚÌì²ÅÄÜÍê³ÉÔËËÍ»õÎïµÄÈÎÎñ
		TalkEx("", szTalk);
		return
	end;

  if GetTask(TASK_GQ_DELIVER) ~= 0 then
      receive_goods();
      return
  end;
  
  if GetTask(TASK_GQ_KILLWK_START) == 1 then
      local szSay = {
          "§a t¹ <sex> gióp chuyÓn vËt phÈm! Nh­ng hiÖn Oa KhÊu xua qu©n tiÕn vµo H¶i T©n, kh«ng biÕt <sex>gióp ®uæi lò giÆc ®i ®­îc kh«ng?",
          "Quèc gia l©m nguy sao cã thÓ ®øng nh×n/kill_enemy",
          "Ta ®ang bËn!/end_say"
      };
      SelectSay(szSay);
      return
  end;
	if QueryTimes() > 0 and (CheckTime(6) == 1 or CheckTime(5) == 1 or CheckTime(0) == 1)then
		SelectSay(szSay);
    else
    	TalkEx("", szTalk);
    end;
end;
