--½Å±¾Ãû³Æ£ºµÚÎå¹ØµÄÎåÐÐÌáÊ¾½Å±¾
--½Å±¾¹¦ÄÜ£ºÔÚ´³¹ØÊ±¸ø½øÈëTRAPµãµÄÍæ¼Ò¸øÓè¶ÔÓ¦¶ÔÓ¦µÄÎåÐÐÌáÊ¾ÐÅÏ¢
--¹¦ÄÜ²ß»®£º°¢Îª
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2008-11-07
--ÐÞ¸Ä¼ÇÂ¼£º
Tb_5_element_coordinate = {
	{5,4," Kim "},
	{1,5,"Thñy"},
	{2,1,"Méc"},	
	{3,2,"Háa"},	
	{4,3,"Thæ"},	
}
--¹Ø¿¨½ø¶È´æ·Å
MS_TIMMER_LOOP_ID = 5
--³õÊ¼Î»ÖÃ´æ·Å
Ms_element_gold_seq = 17
--²»Í¬µÄÕóÑÛË³Ðò²»Í¬
trap_seq = 4
function main()
	--·Ï´³¹ØÊ±¼äÖ±½Ó·µ»Ø
	local mission_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
	if mission_loop_num >= 186 or mission_loop_num <= 6 or mission_loop_num == nil then
		return
	end
	--Î»ÖÃÉú³É
	local golden_element_seq = mod(5 + trap_seq - (GetMissionV(Ms_element_gold_seq)),5)
	if golden_element_seq == 0 then
		golden_element_seq = 5
	end
	--ÌáÊ¾
	Msg2Player("B¹n ®· vµo "..Tb_5_element_coordinate[golden_element_seq][3].." t©m trËn, cã thÓ chèng "..Tb_5_element_coordinate[Tb_5_element_coordinate[golden_element_seq][1]][3].."KhiÕn Ngò hµnh lu©n håi-sinh vµ "..Tb_5_element_coordinate[Tb_5_element_coordinate[golden_element_seq][2]][3].."KhiÕn Ngò hµnh lu©n håi-hiÖu qu¶ kh¾c!")
end
