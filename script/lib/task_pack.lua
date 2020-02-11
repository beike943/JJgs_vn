
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÈÎÎñÏµÍ³²âÊÔ°ü¹üÎÄ¼ş
-- Edited by peres
-- 2005/05/07 PM 19:55

-- µÈ´ıÍíÉÏ£¬Ó­½Ó°×Ìì
-- °×Ìì´òÉ¨£¬ÍíÉÏÆíµ»
-- ÄãÌ«·³Ïù£¬Ñ°ÕÒ·³ÄÕ
-- ÌìÑÄº£½Ç£¬ĞÄÑªÀ´³±
-- ÓĞÈËÔÚÂğ£¬ÓĞË­À´ÕÒ
-- ÎÒËµÄãºÃ£¬ÄãËµ´òÈÅ
-- ²»Íí²»Ôç£¬Ç§ÀïÌöÌö

-- ======================================================

-- ¶ÁÈëÈÎÎñÒıÇæÍ·ÎÄ¼ş
Include("\\script\\lib\\task_main.lua");

MAIN_TITLE = "<color=green>D­íi ®©y lµ nh÷ng sù kiÖn b¹n ®· tr¶i qua. H·y chän sù kiÖn b¹n muèn xem!<color>"
MAIN_EXIT = "Tho¸t/pack_exit"
MAIN_BACK = "Quay l¹i/main"

function main()

local i=0;
local aryTotalEvent = CTask:EnumTotalEvent();
local aryLiveEvent = {}
local nEventID = 0;
local strShowText = "";

	for i=1, getn(aryTotalEvent) do
		nEventID = aryTotalEvent[i][1];
		if aryTotalEvent[i][2]==1 then
			strShowText = CTask:GetEventText(nEventID).."/#showlist("..nEventID..")";
			rawset(aryLiveEvent,
					getn(aryLiveEvent)+1,
					strShowText);
		end;
	end;
	
	tinsert(aryLiveEvent,1,MAIN_TITLE);
	tinsert(aryLiveEvent,getn(aryLiveEvent)+1,MAIN_EXIT);
	
	CTask:SayEx(aryLiveEvent);
	
end;


function showlist(eventID)

local strMain = "Trong sù kiÖn"..CTask:GetEventText(eventID)..", b¹n cã nh÷ng tr¶i nghiÖm nh­ sau: <enter><enter>";
local aryTask = CTask:EnumEventTask(eventID)
local strTaskText = "";
local strShowText = "";

local strNever = "  <color=red>Ch­a b¾t ®Çu<color>";
local strNow = "  <color=green>§ang tiÕn hµnh<color>";
local strEnd = "  <color=yellow>§· hoµn thµnh<color>";

local strConnect = "";

local i=0;

	for i=1, getn(aryTask) do
		strTaskText = CTask:GetTaskTipText(aryTask[i][1]);
		
		if aryTask[i][2]==0 then strConnect = strNever end;
		if aryTask[i][2]==1 then strConnect = strNow end;
		if aryTask[i][2]==2 then strConnect = strEnd end;
		
		strShowText = strShowText..strTaskText..strConnect.."<enter>";
		
	end;
	
	Say(strMain..strShowText,2,MAIN_BACK,MAIN_EXIT);
	
end;


function pack_exit()

end;