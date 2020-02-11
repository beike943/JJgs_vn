--∏˙ÀÊ”–¿ÒnpcΩ≈±æ
--by vivi
--09/10/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function main()
	local sNpcName = "";
	local nMapId = GetWorldPos();
	for i=1,getn(tNewCehua) do
		if tonumber(nMapId) == tNewCehua[i][4] then
			sNpcName = tNewCehua[i][2];
			break
		end
	end
	local nActionIdx = GetMapTaskTemp(nMapId,2);
	Talk(1,"","<color=green>"..sNpcName.."<color>: H∑y lµm theo ÆÈng t∏c <color=yellow>"..tActionIndex[nActionIdx-4][1].."<color> cÒa ta, tr™n c p <color=yellow>30<color> mÌi Æ≠Óc nhÀn th≠Îng. ChÛ ˝, bπn ph∂i c„ chÁ Æ” ph«n th≠Îng. ");
	local nNpcIdx = GetMapTaskTemp(nMapId,1);
	local nTime = GetTime()-GetMapTaskTemp(nMapId,3);
	if nTime > 60 then --º‰∏Ù“ª∑÷÷”Àµ“ª¥Œ
		NpcChat(nNpcIdx,"M‰i ng≠Íi h∑y lµm theo h≠Ìng d…n cÒa ta"..tActionIndex[nActionIdx-4][1].." sœ c„ ph«n th≠Îng nhÀn th≠Îng.");
		SetMapTaskTemp(nMapId,3,GetTime());
	end
end