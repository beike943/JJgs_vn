--=============================================
--create by baiyun 2010.1.12
--describe:Ô½ÄÏ°æ2010Äê1ÔÂ´º½Ú»î¶¯ ÐÒÔËºì°ü½Å±¾
--=============================================

Include("\\script\\online_activites\\2010_01\\activites_01\\head.lua");

function OnUse(nItemIdx)
	if GetLevel() < 73 then
		Talk(1,"","§¼ng cÊp 73 trë lªn míi sö dông ®­îc vËt phÈm nµy!")
		return 0;
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","V« m«n ph¸i kh«ng thÓ sö dông vËt phÈm nµy!")
		return 0;
	end	

    	SetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX, nItemIdx);
    	DoWait(16, 17, 10);
end
