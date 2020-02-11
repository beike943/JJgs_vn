-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±ÈÎÎñNPC÷¼÷ÃÍõ½â³ý·âÓ¡ºÍËÀÍöScript
-- By StarryNight
-- 2007/08/07 PM 11:05

-- ======================================================
-- ÒýÓÃ¾çÇéÈÎÎñÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

	if GetTask(TASK_XB_ID_02) == 8 then
		local strSay = {
			"¸i….dµ…..§au qu¸!!&@%!#%......!? (Theo thÇn chó mµ C«n L«n m«n nh©n ®Ò cËp, cã thÓ sÏ gi¶i trõ phong Ên nµy)",
				KULOUWANG_CURSE[1].."/#Confirm_Curse(1)",
				KULOUWANG_CURSE[2].."/#Confirm_Curse(2)",
				KULOUWANG_CURSE[3].."/#Confirm_Curse(3)",
				"Rêi khái/Cancel_Curse"
				}
		SelectSay(strSay);			
	else
		local strTalk = {
			"¸i….dµ….§au qu¸!! &@%!#%....!",
			}
		TalkEx("",strTalk);
	end	
end;

--ÖäÓïÈ·ÈÏ
function Confirm_Curse(index)

local nCruseIndex = GetTask(KULOUWANG_CURSE_ID);
local nNpcIndex = GetTargetNpc();

	if nNpcIndex == nil then
		return
	end

	--ÖäÓïÕýÈ·
	if nCruseIndex == index then
		ChangeNpcToFight(nNpcIndex);
		TaskTip("Gi¶i trõ phong Ên cña C« L©u v­¬ng thµnh c«ng, mau tiªu diÖt nã.");
		Msg2Player("Gi¶i trõ phong Ên cña C« L©u v­¬ng thµnh c«ng, mau tiªu diÖt nã.");
	else
		local strTalk = {
			"¸i….dµ….§au qu¸!! &@%!#%....!",
			"H×nh nh­ kh«ng cã hiÖu qu¶ g×, lÏ nµo lµ thÇn chó sai? VÒ hái C«n L«n m«n nh©n ®i."
			}
		TalkEx("",strTalk);
	end
end

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIdx = 0;
		
	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	nNpcIdx = CreateNpc("C« L©u v­¬ng", "C« L©u v­¬ng", 329,1620,3354);
	SetNpcScript(nNpcIdx, "\\script\\ÖÐÔ­¶þÇø\\ÌìÊ¦ÃØ¾³\\npc\\÷¼÷ÃÍõ.lua");
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_02) == 8 then
			DelItem(2,0,758,1);--Õ¶Ñý·û
			AddItem(2,0,717,1,1);--·Ç³£µÀ·û
			SetTask(TASK_XB_ID_02,9);
			SetTask(KULOUWANG_CURSE_ID,0);--Çå¿Õ÷¼÷ÃÍõÖäÓï
			TaskTip("GiÕt C« L©u v­¬ng thµnh c«ng, mau nãi cho ®Ö tö C«n L«n biÕt.");
			Msg2Player("GiÕt C« L©u v­¬ng thµnh c«ng, mau nãi cho ®Ö tö C«n L«n biÕt.");
		end;
  else
		for i=1,nMemCount do
			PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_02) == 8 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
      	DelItem(2,0,758,1);--Õ¶Ñý·û
				AddItem(2,0,717,1,1);--·Ç³£µÀ·û
				SetTask(TASK_XB_ID_02,9);
				SetTask(KULOUWANG_CURSE_ID,0);--Çå¿Õ÷¼÷ÃÍõÖäÓï
				TaskTip("GiÕt C« L©u v­¬ng thµnh c«ng, mau nãi cho ®Ö tö C«n L«n biÕt.");
				Msg2Player("GiÕt C« L©u v­¬ng thµnh c«ng, mau nãi cho ®Ö tö C«n L«n biÕt.");
      end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end

function Cancel_Curse()

end