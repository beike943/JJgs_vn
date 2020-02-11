--ÕÙ»ØÀÏÍæ¼Ò»î¶¯
--by vivi
--2008/07/07

--ÈÎÎñ±äÁ¿
TASK_GET_OLD = 916;      --ÊÇ·ñÁìÈ¡ÁËÀÏÍæ¼Ò½±Àø ´æÈëÁìÈ¡ÈÕÆÚ
TASK_KILL_PLAYER = 917;  --É±ËÀ±ğµÄÃÅÅÉµÄÍæ¼Ò´ÎÊı
TASK_KILLED_NUM = 918;   --±»±ğµÄÃÅÅÉÍæ¼ÒÉ±ËÀµÄ´ÎÊı
TASK_EXP_DATE = 919;     --³ÆºÅ¸ø¾­ÑéµÄÈÕÆÚ Ã¿Ìì¸üĞÂ
TASK_EXP_NUM = 920;      --³ÆºÅ¸ø¾­ÑéµÄ´ÎÊı£¬1¸öĞ¡Ê±£¬¸ø60´Î
TASK_KILL_DATE = 921;    --¼ÇÂ¼Õù°ÔÕ½µÄÉ±ÈËÈÕÆÚ
TASK_AWARD_NUM = 922;    --¼ÇÂ¼µÚ¼¸´ÎÁìÈ¡½±Àø
TASK_AWARD_WEEK = 923;   --¼ÇÂ¼ÁìÈ¡½±ÀøµÄÖÜµÄĞòÊı
TASK_MENPAI_AWARD = 924; --¼ÇÂ¼ÁìÈ¡ÃÅÅÉ½±ÀøÖÜµÄĞòÊı 
TASK_TIANDI_CHOUJIANG = 925; --ÊÇ·ñ³é¹ı½±

--´¥·¢Æ÷ID
CALLBACK_TIME_ID = 51;
CALLBACK_TRIGGER_ID = 2022;

--É±ÊÖÎäÆ÷
tShashou = {
	[0] = {{0,3,63,3,85,5,95,4,63},{0,8,96,3,86,5,98,4,64},{0,0,13,3,86,5,98,4,64},{0,1,52,3,85,5,96,4,63},{0,2,26,6,42,5,98,2,99},{0,10,74,3,86,5,98,4,64},{0,0,13,3,85,5,95,4,63},{0,5,39,3,85,5,95,4,63},{0,2,26,3,86,5,98,4,64},{0,9,85,3,85,5,97,4,63},{0,6,107,3,85,5,95,4,63},{0,4,118,3,85,5,96,4,63},{0,7,11,3,85,5,96,4,63},{0,11,11,3,86,5,98,4,64}},
	[1] = {{0,3,63,3,85,5,95,4,63},{0,8,96,3,86,5,98,4,64},{0,0,13,3,86,5,98,4,64}},
	[2] = {{0,3,63,3,85,5,95,4,63}},
	[3] = {{0,8,96,3,86,5,98,4,64}},
	[4] = {{0,0,13,3,86,5,98,4,64}},
	[5] = {{0,1,52,3,85,5,96,4,63}},
	[6] = {{0,1,52,3,85,5,96,4,63}},
	[7] = {{0,2,26,6,42,5,98,2,99},{0,10,74,3,86,5,98,4,64}},
	[8] = {{0,2,26,6,42,5,98,2,99}},
	[9] = {{0,10,74,3,86,5,98,4,64}},
	[10] = {{0,0,13,3,85,5,95,4,63},{0,5,39,3,85,5,95,4,63}},
	[11] = {{0,0,13,3,85,5,95,4,63}},
	[12] = {{0,5,39,3,85,5,95,4,63}},
	[13] = {{0,2,26,3,86,5,98,4,64},{0,9,85,3,85,5,97,4,63}},
	[14] = {{0,2,26,3,86,5,98,4,64}},
	[15] = {{0,9,85,3,85,5,97,4,63}},
	[16] = {{0,6,107,3,85,5,95,4,63},{0,4,118,3,85,5,96,4,63}},
	[17] = {{0,6,107,3,85,5,95,4,63}},
	[18] = {{0,4,118,3,85,5,96,4,63}},
	[19] = {{0,7,11,3,85,5,96,4,63},{0,11,11,3,86,5,98,4,64}},
	[20] = {{0,7,11,3,85,5,96,4,63}},
	[21] = {{0,11,11,3,86,5,98,4,64}}
};

--Ñ×µÛ×°±¸
tYandi = {
	{"Viªm §Õ kh«i",0,103,8000},
	{"Viªm §Õ gi¸p",0,100,8000},
	{"Viªm §Õ trang",0,101,8000}
};

tXuanyuanZhan = 
{
	[0] = {{"Hiªn Viªn ChiÕn",0,102,8801},{"Hiªn Viªn ChiÕn",0,102,8803},{"Hiªn Viªn ChiÕn",0,102,8805},{"Hiªn Viªn ChiÕn",0,102,8807},{"Hiªn Viªn ChiÕn",0,102,8809},{"Hiªn Viªn ChiÕn",0,102,8811},{"Hiªn Viªn ChiÕn",0,102,8813},{"Hiªn Viªn ChiÕn",0,102,8815},{"Hiªn Viªn ChiÕn",0,102,8817},{"Hiªn Viªn ChiÕn",0,102,8819},{"Hiªn Viªn ChiÕn",0,102,8821},{"Hiªn Viªn ChiÕn",0,102,8823},{"Hiªn Viªn ChiÕn",0,102,8825},{"Hiªn Viªn ChiÕn",0,102,8827}},
	[1] = {{"Hiªn Viªn ChiÕn",0,102,8801},{"Hiªn Viªn ChiÕn",0,102,8803},{"Hiªn Viªn ChiÕn",0,102,8805}},
	[2] = {{"Hiªn Viªn ChiÕn",0,102,8801}},
	[3] = {{"Hiªn Viªn ChiÕn",0,102,8803}},
	[4] = {{"Hiªn Viªn ChiÕn",0,102,8805}},
	[5] = {{"Hiªn Viªn ChiÕn",0,102,8807}},
	[6] = {{"Hiªn Viªn ChiÕn",0,102,8807}},
	[7] = {{"Hiªn Viªn ChiÕn",0,102,8809},{"Hiªn Viªn ChiÕn",0,102,8811}},
	[8] = {{"Hiªn Viªn ChiÕn",0,102,8809}},
	[9] = {{"Hiªn Viªn ChiÕn",0,102,8811}},
	[10] = {{"Hiªn Viªn ChiÕn",0,102,8813},{"Hiªn Viªn ChiÕn",0,102,8815}},
	[11] = {{"Hiªn Viªn ChiÕn",0,102,8813}},
	[12] = {{"Hiªn Viªn ChiÕn",0,102,8815}},
	[13] = {{"Hiªn Viªn ChiÕn",0,102,8817},{"Hiªn Viªn ChiÕn",0,102,8819}},
	[14] = {{"Hiªn Viªn ChiÕn",0,102,8817}},
	[15] = {{"Hiªn Viªn ChiÕn",0,102,8819}},
	[16] = {{"Hiªn Viªn ChiÕn",0,102,8821},{"Hiªn Viªn ChiÕn",0,102,8823}},
	[17] = {{"Hiªn Viªn ChiÕn",0,102,8821}},
	[18] = {{"Hiªn Viªn ChiÕn",0,102,8823}},
	[19] = {{"Hiªn Viªn ChiÕn",0,102,8825},{"Hiªn Viªn ChiÕn",0,102,8827}},
	[20] = {{"Hiªn Viªn ChiÕn",0,102,8825}},
	[21] = {{"Hiªn Viªn ChiÕn",0,102,8827}},
}
	
tXuanyuanDou = 
{
	[0] = {{"Hiªn Viªn §Êu",0,102,8802},{"Hiªn Viªn §Êu",0,102,8804},{"Hiªn Viªn §Êu",0,102,8806},{"Hiªn Viªn §Êu",0,102,8808},{"Hiªn Viªn §Êu",0,102,8810},{"Hiªn Viªn §Êu",0,102,8812},{"Hiªn Viªn §Êu",0,102,8814},{"Hiªn Viªn §Êu",0,102,8816},{"Hiªn Viªn §Êu",0,102,8818},{"Hiªn Viªn §Êu",0,102,8820},{"Hiªn Viªn §Êu",0,102,8822},{"Hiªn Viªn §Êu",0,102,8824},{"Hiªn Viªn §Êu",0,102,8826},{"Hiªn Viªn §Êu",0,102,8828}},
	[1] = {{"Hiªn Viªn §Êu",0,102,8802},{"Hiªn Viªn §Êu",0,102,8804},{"Hiªn Viªn §Êu",0,102,8806}},
	[2] = {{"Hiªn Viªn §Êu",0,102,8802}},
	[3] = {{"Hiªn Viªn §Êu",0,102,8804}},
	[4] = {{"Hiªn Viªn §Êu",0,102,8806}},
	[5] = {{"Hiªn Viªn §Êu",0,102,8808}},
	[6] = {{"Hiªn Viªn §Êu",0,102,8808}},
	[7] = {{"Hiªn Viªn §Êu",0,102,8810},{"Hiªn Viªn §Êu",0,102,8812}},
	[8] = {{"Hiªn Viªn §Êu",0,102,8810}},
	[9] = {{"Hiªn Viªn §Êu",0,102,8812}},
	[10] = {{"Hiªn Viªn §Êu",0,102,8814},{"Hiªn Viªn §Êu",0,102,8816}},
	[11] = {{"Hiªn Viªn §Êu",0,102,8814}},
	[12] = {{"Hiªn Viªn §Êu",0,102,8816}},
	[13] = {{"Hiªn Viªn §Êu",0,102,8818},{"Hiªn Viªn §Êu",0,102,8820}},
	[14] = {{"Hiªn Viªn §Êu",0,102,8818}},
	[15] = {{"Hiªn Viªn §Êu",0,102,8820}},
	[16] = {{"Hiªn Viªn §Êu",0,102,8822},{"Hiªn Viªn §Êu",0,102,8824}},
	[17] = {{"Hiªn Viªn §Êu",0,102,8822}},
	[18] = {{"Hiªn Viªn §Êu",0,102,8824}},
	[19] = {{"Hiªn Viªn §Êu",0,102,8826},{"Hiªn Viªn §Êu",0,102,8828}},
	[20] = {{"Hiªn Viªn §Êu",0,102,8826}},
	[21] = {{"Hiªn Viªn §Êu",0,102,8828}},
}

tHuangDiWeapon = 
{
	[0] = {{"Hiªn Viªn To¸i Vò §ao",0,3,8801},{"Hiªn Viªn To¸i Vò C«n",0,5,8802},{"Hiªn Viªn Cöu Nh­ Tr­îng",0,8,8803},{"Hiªn Viªn H¹o Nhiªn Thñ",0,0,8804},{"Hiªn Viªn Giíi Tö Kim",0,1,8805},{"Hiªn Viªn Tö Tinh KiÕm",0,2,8806},{"Hiªn Viªn Phông Hoµng CÇm",0,10,8807},{"Hiªn Viªn Ngò Nh¹c Thñ",0,0,8808},{"Hiªn Viªn Ph¸ Thiªn C«n",0,5,8809},{"Hiªn Viªn Hång Qu©n KiÕm",0,2,8810},{"Hiªn Viªn Sinh Tö Bót",0,9,8811},{"Hiªn Viªn Ph¸ Qu©n Th­¬ng",0,6,8812},{"Hiªn Viªn Khai Thiªn Cung",0,4,8813},{"Hiªn Viªn ¢m D­¬ng NhÉn",0,7,8814},{"Hiªn Viªn U Minh Tr¶o",0,11,8815}},
	[1] = {{"Hiªn Viªn To¸i Vò §ao",0,3,8801},{"Hiªn Viªn To¸i Vò C«n",0,5,8802},{"Hiªn Viªn Cöu Nh­ Tr­îng",0,8,8803},{"Hiªn Viªn H¹o Nhiªn Thñ",0,0,8804}},
	[2] = {{"Hiªn Viªn To¸i Vò §ao",0,3,8801},{"Hiªn Viªn To¸i Vò C«n",0,5,8802}},
	[3] = {{"Hiªn Viªn Cöu Nh­ Tr­îng",0,8,8803}},
	[4] = {{"Hiªn Viªn H¹o Nhiªn Thñ",0,0,8804}},
	[5] = {{"Hiªn Viªn Giíi Tö Kim",0,1,8805}},
	[6] = {{"Hiªn Viªn Giíi Tö Kim",0,1,8805}},
	[7] = {{"Hiªn Viªn Tö Tinh KiÕm",0,2,8806},{"Hiªn Viªn Phông Hoµng CÇm",0,10,8807}},
	[8] = {{"Hiªn Viªn Tö Tinh KiÕm",0,2,8806}},
	[9] = {{"Hiªn Viªn Phông Hoµng CÇm",0,10,8807}},
	[10] = {{"Hiªn Viªn Ngò Nh¹c Thñ",0,0,8808},{"Hiªn Viªn Ph¸ Thiªn C«n",0,5,8809}},
	[11] = {{"Hiªn Viªn Ngò Nh¹c Thñ",0,0,8808}},
	[12] = {{"Hiªn Viªn Ph¸ Thiªn C«n",0,5,8809}},
	[13] = {{"Hiªn Viªn Hång Qu©n KiÕm",0,2,8810},{"Hiªn Viªn Sinh Tö Bót",0,9,8811}},
	[14] = {{"Hiªn Viªn Hång Qu©n KiÕm",0,2,8810}},
	[15] = {{"Hiªn Viªn Sinh Tö Bót",0,9,8811}},
	[16] = {{"Hiªn Viªn Ph¸ Qu©n Th­¬ng",0,6,8812},{"Hiªn Viªn Khai Thiªn Cung",0,4,8813}},
	[17] = {{"Hiªn Viªn Ph¸ Qu©n Th­¬ng",0,6,8812}},
	[18] = {{"Hiªn Viªn Khai Thiªn Cung",0,4,8813}},
	[19] = {{"Hiªn Viªn ¢m D­¬ng NhÉn",0,7,8814},{"Hiªn Viªn U Minh Tr¶o",0,11,8815}},
	[20] = {{"Hiªn Viªn ¢m D­¬ng NhÉn",0,7,8814}},
	[21] = {{"Hiªn Viªn U Minh Tr¶o",0,11,8815}},
}

tTiandi = {
	{{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,85},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,86},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,87},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,88}},
	{{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,85},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,86},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,87},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,88}},
	{{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,85},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,86},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,87},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,88}},
	{[0]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43},{"Thiªn §Şa HuyÒn Hoµng Khİ ",0,1,56},{"Thiªn §Şa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Şa HuyÒn Hoµng CÇm",0,10,78},{"Thiªn §Şa HuyÒn Hoµng Bót ",0,9,89},{"Thiªn §Şa HuyÒn Hoµng Tr­îng",0,8,100},{"Thiªn §Şa HuyÒn Hoµng Th­¬ng ",0,6,111},{"Thiªn §Şa HuyÒn Hoµng Cung ",0,4,122},{"Thiªn §Şa HuyÒn Hoµng Tr¶o",0,11,15},{"Thiªn §Şa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [1]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43},{"Thiªn §Şa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Şa HuyÒn Hoµng Tr­îng",0,8,100}},
	 [2]={{"Thiªn §Şa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43}},
	 [3]={{"Thiªn §Şa HuyÒn Hoµng Tr­îng",0,8,100}},
	 [4]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17}},
	 [5]={{"Thiªn §Şa HuyÒn Hoµng Khİ ",0,1,56}},
	 [6]={{"Thiªn §Şa HuyÒn Hoµng Khİ ",0,1,56}},
	 [7]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Şa HuyÒn Hoµng CÇm",0,10,78}},
	 [8]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39}},
	 [9]={{"Thiªn §Şa HuyÒn Hoµng CÇm",0,10,78}},
	 [10]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43}},
	 [11]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17}},
	 [12]={{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43}},
	 [13]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Şa HuyÒn Hoµng Bót ",0,9,89}},
	 [14]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39}},
	 [15]={{"Thiªn §Şa HuyÒn Hoµng Bót ",0,9,89}},
	 [16]={{"Thiªn §Şa HuyÒn Hoµng Th­¬ng ",0,6,111},{"Thiªn §Şa HuyÒn Hoµng Cung ",0,4,122}},
	 [17]={{"Thiªn §Şa HuyÒn Hoµng Th­¬ng ",0,6,111}},
	 [18]={{"Thiªn §Şa HuyÒn Hoµng Cung ",0,4,122}},
	 [19]={{"Thiªn §Şa HuyÒn Hoµng Tr¶o",0,11,15},{"Thiªn §Şa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [20]={{"Thiªn §Şa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [21]={{"Thiªn §Şa HuyÒn Hoµng Tr¶o",0,11,15}}}
	};


--´«ËÍÖÁÕÆÃÅ´¦
tShifu	=	{
		{"ThiÕu L©m",204,1599,3182,"<color=green>HuyÒn Tõ<color>:"},
		{"Vâ §ang",312,1825,3323,"<color=green>Tö H¹c Ch©n Nh©n<color>:"},
		{"Nga My",303,1645,3159,"<color=green>Ch©n Nh­ S­ Th¸i<color>:"},
		{"C¸i Bang",209,1547,3183,"<color=green>Long T¹i Thiªn<color>:"},
		{"§­êng M«n",305,1598,2824,"<color=green>§­êng Së Hång<color>:"},
		{"D­¬ng M«n",219,1538,3151,"<color=green>Xa Th¸i Qu©n<color>:"},
		{"Ngò §éc",407,1609,3193,"<color=green>B¹ch Doanh Doanh<color>:"}
};

--º¯ÊıÃû³Æ£ºÖÜ¼¸¼ÆËãº¯Êı
--¹¦        ÄÜ£º·µ»Ø½ñÌìÊÇĞÇÆÚ¼¸
function Zgc_pub_week_day()
	local num_return = 0
	num_return = floor((GetTime() - 57600)/86400)
	num_return = num_return - (floor(num_return/7) * 7)
	if num_return >= 2 then
		num_return = num_return - 2
	else
		num_return = num_return + 5
	end
	return num_return
end

--ÎäÁÖÕù°ÔÕ½ÈÕÇ°¼ìË÷
function callback_date_check()
	if Zgc_pub_week_day() == 0 then --ĞÇÆÚÌì
		return 1;
	else
		return 0;
	end
end

--Íæ¼Ò´´½¨ÈÕÆÚ
function callback_player_date()
	local nYear,nMonth = GmTime(GetCreateTime()); --Ãâ·ÑÇø¾«È·µ½ÔÂ
	if nYear == 2007 and nMonth <= 6 then
		return 1;
	elseif nYear == 2007 and nMonth <=12 then
		return 2;
	elseif nYear == 2008 and nMonth <= 4 then
		return 3;
	else
		return 0;
	end
end

--¸øÍæ¼Ò³ÆºÅ
function callback_add_title(nType)
	if nType ~= 1 and nType ~= 2 and nType ~= 3 then
		return
	end
	if IsTitleExist(3,nType+4) > 0 then
		return
	end	
	if AddTitle(3, nType+4) > 0 then
		SetCurTitle(3, nType+4)
	end
end

--¸øÓècj×Ï×°ºÍÉ±ÊÖÎäÆ÷ ²ÎÊı±íÊ¾Ç¿»¯¶È
function callback_add_item(nQianghua)
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	AddItem(0,103,90+nBody,1,4,-1,-1,-1,-1,-1,-1,0,nQianghua);
	AddItem(0,100,90+nBody,1,4,-1,-1,-1,-1,-1,-1,0,nQianghua);
	AddItem(0,101,90+nBody,1,4,-1,-1,-1,-1,-1,-1,0,nQianghua);
	AddItem(0,102,36,1,4,-1,-1,-1,-1,-1,-1);
	AddItem(0,102,37,1,4,-1,-1,-1,-1,-1,-1);
	local nRand = random(1,getn(tShashou[nRoute]));
	AddItem(tShashou[nRoute][nRand][1],tShashou[nRoute][nRand][2],tShashou[nRoute][nRand][3],1,4,tShashou[nRoute][nRand][4],tShashou[nRoute][nRand][5],tShashou[nRoute][nRand][6],tShashou[nRoute][nRand][7],tShashou[nRoute][nRand][8],tShashou[nRoute][nRand][9],0,nQianghua);
end

--¶Ôµ±Ç°Íæ¼Ò¿É·ñÕı³£Ìí¼ÓÎïÆ·½øĞĞ¼ì²â 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
		Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
		return 0
	else 
		return 1
	end
end

function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--¼ÆËãÖÜµÄĞòÊı
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--´¦ÀíÊ±²î
	nCurTime = nCurTime - 4*24*3600;	--¶ÔÆëµ½1970Äê1ÔÂ1ÈÕ£¨ĞÇÆÚËÄ£©ºóµÄµÚÒ»¸öÖÜÒ»Áè³¿¡£
	local nWeekSecond = 7*24*3600;	--Ò»ÖÜ¶àÉÙÃë
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--¼ÆËãÆ«ÒÆÊ±¼ä
	local nTotalTime = nCurTime - nOffset;	--¼ÆËãºóµÄ×ÜÊ±¼ä
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--¼ÆËãÖÜµÄĞòÊı
	return nWeekSeq;
end;

function nothing()

end

function callback_talk()
--	local strtab = {
--		"Ta muèn nhËn phÇn th­ëng ng­êi ch¬i cò/get_old_award",
--		"Ta muèn rót th¨m Viªm Hoµng Thiªn §Şa/tiandi_choujiang",
--		"C¸c lo¹i phÇn th­ëng t­¬ng øng víi ng­êi ch¬i cò/about_old_award",
--		"Ta t¹m thêi kh«ng nhËn phÇn th­ëng/nothing"}
--	Say("<color=green>D· TÈu<color>: §· l©u kh«ng gÆp, ta vÉn nhí lÇn ®Çu gÆp ng­¬i, tuy vâ l©m phong ba biÕn ®æi liªn tôc nh­ng l·o ®©y vÉn nhí ng­¬i, ta ®· chuÈn bŞ vµi mãn ®å gi¸p, cã thÓ gióp ng­¬i hµnh hiÖp giang hå! Ta còng ®­îc gäi lµ Èn gi¶ trong giang hå, cã thÓ d¹y cho ng­¬i vµi chiªu!",
--		getn(strtab),
--		strtab)
end

function get_old_award()
	if GetTask(TASK_GET_OLD) ~= 0 then
		Talk(1,"","<color=green>D· TÈu<color>: Mçi nh©n vËt chØ cã thÓ nhËn 1 lÇn phÇn th­ëng ng­êi ch¬i cò.");
		return
	end
	if GetLevel() < 11 then
		Talk(1,"","<color=green>D· TÈu<color>: §¼ng cÊp thÊp qu¸, ®Õn cÊp 11 h·y quay l¹i.");
		return
	end
	local nDate = tonumber(date("%Y%m%d")); 
	local nType = callback_player_date();
	if nType == 1 then
		if Zgc_pub_goods_add_chk(6,500) ~= 1 then
			return
		end		
		SetTask(TASK_GET_OLD,nDate);
		callback_add_item(6);
		callback_add_title(1);
		back_to_shifu();
	elseif nType == 2 then
		if Zgc_pub_goods_add_chk(6,500) ~= 1 then
			return
		end		
		SetTask(TASK_GET_OLD,nDate);
		callback_add_item(4);
		callback_add_title(2);
		back_to_shifu();		
	elseif nType == 3 then
		SetTask(TASK_GET_OLD,nDate);
		callback_add_title(3);
		back_to_shifu();		
	else
		Talk(1,"","<color=green>D· TÈu<color>: Xin lçi, ®å ë ®©y ®Òu chuÈn bŞ cho nh÷ng ng­êi trong giang hå, kh«ng cã ®å ng­¬i dïng ®­îc, nh­ng kh«ng sao, hiÖn Vâ l©m tranh b¸ ®ang tiÕn hµnh, h·y ®Õn s­ phô m«n ph¸i hái thö, ë ®ã cã chuÈn bŞ vµi mãn, nghe nãi trong tranh b¸ cã phÇn th­ëng tİn vËt trang bŞ cao cÊp cña s­ m«n.");
	end
end

function back_to_shifu()
	local nRoute = GetPlayerFaction();
	if nRoute == 0 then
		Talk(1,"","<color=green>D· TÈu<color>: HiÖn §¹i héi tû vâ Thiªn h¹ ®Ö nhÊt ®ang triÖu tËp, mµ Vâ l©m tranh b¸ còng s¾p b¾t ®Çu, nghe nãi lµ cuèi tuÇn gÇn nhÊt, c¸c s­ phô v× mong c¸c ®å ®Ö cã thÓ x­ng hïng trong Vâ l©m tranh b¸ nªn ®· chuÈn bŞ rÊt nhiÒu trang bŞ cao cÊp, mau ®Õn gia nhËp m«n ph¸i mµ ng­¬i ­ng ı nhÊt ®i.");
	else
		Say("<color=green>D· TÈu<color>: HiÖn §¹i héi tû vâ Thiªn h¹ ®Ö nhÊt ®ang triÖu tËp, mµ Vâ l©m tranh b¸ còng s¾p b¾t ®Çu, nghe nãi lµ cuèi tuÇn gÇn nhÊt, c¸c s­ phô v× mong c¸c ®å ®Ö cã thÓ x­ng hïng trong Vâ l©m tranh b¸ nªn ®· chuÈn bŞ rÊt nhiÒu trang bŞ cao cÊp, nghe nãi ®é c­êng hãa toµn bé lµ trang bŞ 10, dïng cho Vâ l©m tranh b¸, mau ®Õn s­ m«n xem thö, hái râ t×nh h×nh!",
			1,
			"BiÕt råi!/nothing")
	end
end

function about_old_award()
	Say("<color=green>D· TÈu<color>: Ng­¬i muèn xem phÇn th­ëng nµo?",
		4,
		"Ta lµ ng­êi ch¬i cò tr­íc th¸ng 7 n¨m 2007/about_2005_award",
		"Ta lµ ng­êi ch¬i cò tr­íc th¸ng 1 n¨m 2008/about_2006_award",
		"Ta lµ ng­êi ch¬i cò tr­íc th¸ng 5 n¨m 2008/about_2007_award",
		"Ta muèn ®i l·nh th­ëng/callback_talk")
end

function about_2005_award()
	Talk(1,"about_2005_award2","<color=green>D· TÈu<color>: Ng­¬i ®· ë trong giang hå l©u vËy, ta ®· chuÈn bŞ cho ng­¬i 1 bé ®Ó hµnh tÈu giang hå, bé nµy do trang chñ Tµng KiÕm s¬n trang tÆng ta, céng thªm mãn vò khİ ta sö dông khi míi gia nhËp giang hå, bé nµy ph©n thµnh\nTrang Chñ M·o tèc ®é ®¸nh 15%, tÊt c¶ n¨ng lùc + 4-7\nTæng Qu¶n Ngo¹i Trang néi ngo¹i c«ng 8%, sinh lùc tèi ®a + 5%, tÊt c¶ n¨ng lùc 4-7\nTæng Qu¶n Khè néi ngo¹i phßng - 5%, néi ngo¹i c«ng + 10%, tÊt c¶ n¨ng lùc 4-7\nTiÓu Th­ Giíi ChØ sinh lùc néi lùc + 8%, tÊt c¶ n¨ng lùc 1-4\nTr­ëng L·o ChØ Hoµn chİnh x¸c + 40-55, nĞ tr¸nh + 30-35, tÊt c¶ n¨ng lùc 9-12")
end

function about_2005_award2() --Ãâ·ÑÇø¾­Ñé²»Í¬
	Talk(1,"about_old_award","<color=green>D· TÈu<color>: Bé trang bŞ nµy ta ®· n©ng cÊp ®Õn 6, ngoµi ra ta sÏ trao tÊt c¶ nh÷ng kinh nghiÖm giang hå mµ ta ®· tr¶i qua vµ Vâ l©m b¶o ®iÓn cho ng­¬i. (Danh hiÖu ®Æc biÖt, D· TÈu Vâ l©m b¶o ®iÓn truyÒn nh©n, sau khi më mçi phót t¨ng 0.5% kinh nghiÖm, khi 0.5% kinh nghiÖm lín h¬n 845235, nhËn nhiÒu nhÊt 845235, mçi ngµy t¸c dông 1 giê, sau 15 ngµy sÏ mÊt danh hiÖu)\nSau khi ng­¬i ®· tham gia tÊt c¶ ho¹t ®éng Vâ l©m tranh b¸ th× cã thÓ rót 1 lÇn th¨m ë ®©y, nÕu rót tróng sÏ cã thÓ nhËn ®­îc toµn bé trang bŞ Viªm Hoµng §Õ hoÆc trang bŞ Thiªn §Şa HuyÒn Hoµng, thËm chİ kh«ng rót tróng còng cã thÓ nhËn 2 lÇn vËt phÈm Bång Lai, chóc may m¾n!")
end

function about_2006_award()
	Talk(1,"about_2006_award2","<color=green>D· TÈu<color>: Ng­¬i ®· ë trong giang hå l©u vËy, ta ®· chuÈn bŞ cho ng­¬i 1 bé ®Ó hµnh tÈu giang hå, bé nµy do trang chñ Tµng KiÕm s¬n trang tÆng ta, céng thªm mãn vò khİ ta sö dông khi míi gia nhËp giang hå, bé nµy ph©n thµnh\nTrang Chñ M·o tèc ®é ®¸nh 15%, tÊt c¶ n¨ng lùc + 4-7\nTæng Qu¶n Ngo¹i Trang néi ngo¹i c«ng 8%, sinh lùc tèi ®a + 5%, tÊt c¶ n¨ng lùc 4-7\nTæng Qu¶n Khè néi ngo¹i phßng - 5%, néi ngo¹i c«ng + 10%, tÊt c¶ n¨ng lùc 4-7\nTiÓu Th­ Giíi ChØ sinh lùc néi lùc + 8%, tÊt c¶ n¨ng lùc 1-4\nTr­ëng L·o ChØ Hoµn chİnh x¸c + 40-55, nĞ tr¸nh + 30-35, tÊt c¶ n¨ng lùc 9-12")
end

function about_2006_award2() --Ãâ·ÑÇø¾­Ñé²»Í¬
	Talk(1,"about_old_award","<color=green>D· TÈu<color>: Bé vò khİ nµy ta ®· n©ng cÊp ®Õn 4, ngoµi ra ta sÏ trao tÊt c¶ nh÷ng kinh nghiÖm giang hå mµ ta ®· tr·i qua vµ Vâ l©m mËt t©n cho ng­¬i. (Danh hiÖu ®Æc biÖt, D· TÈu Vâ l©m mËt t©n truyÒn nh©n, sau khi më mçi phót t¨ng 0.4% kinh nghiÖm, khi 0.4% lín h¬n 676188, nhËn nhiÒu nhÊt 676188, mçi ngµy t¸c dông 1 giê, sau 15 ngµy sÏ mÊt danh hiÖu)\nSau khi ng­¬i ®· tham gia tÊt c¶ ho¹t ®éng Vâ l©m tranh b¸ th× cã thÓ rót 1 lÇn th¨m ë ®©y, nÕu rót tróng sÏ cã thÓ nhËn ®­îc toµn bé trang bŞ Viªm Hoµng §Õ hoÆc trang bŞ Thiªn §Şa HuyÒn Hoµng, thËm chİ kh«ng rót tróng còng cã thÓ nhËn 2 lÇn vËt phÈm Bång Lai, chóc may m¾n!")
end

function about_2007_award() --Ãâ·ÑÇø¾­Ñé²»Í¬
	Talk(1,"about_old_award","<color=green>D· TÈu<color>: Ng­¬i ®· trong giang hå l©u nh­ vËy, ta sÏ trao tÊt c¶ nh÷ng kinh nghiÖm giang hå mµ ta ®· tr·i qua vµ Vâ l©m mËt vÊn cho ng­¬i. (Danh hiÖu ®Æc biÖt, D· TÈu Vâ l©m mËt vÊn truyÒn nh©n, sau khi më mçi phót t¨ng 0.3% kinh nghiÖm, khi 0.3% lín h¬n 507141, nhËn nhiÒu nhÊt 507141, mçi ngµy t¸c dông 1 giê, sau 15 ngµy sÏ mÊt danh hiÖu)\nSau khi ng­¬i ®· tham gia tÊt c¶ ho¹t ®éng Vâ l©m tranh b¸ th× cã thÓ rót 1 lÇn th¨m ë ®©y, nÕu rót tróng sÏ cã thÓ nhËn ®­îc toµn bé trang bŞ Viªm Hoµng §Õ hoÆc trang bŞ Thiªn §Şa HuyÒn Hoµng, thËm chİ kh«ng rót tróng còng cã thÓ nhËn 2 lÇn vËt phÈm Bång Lai, chóc may m¾n!")
end

function goto_shifu()
	local nFaction = GetPlayerFaction();
	if nFaction ~= 0 then
		NewWorld(tShifu[nFaction][2],tShifu[nFaction][3],tShifu[nFaction][4]);
	end
end

function restore_all()
	CureWound(2);
	RestoreAll();
end

function tiandi_choujiang()
	local nNum = GetTask(TASK_AWARD_NUM);
	if nNum < 4 then
		Talk(1,"","<color=green>D· TÈu<color>: ChØ cã ng­êi ch¬i tham gia 4 lÇn s¬ cÊp,  M«n ph¸i tranh b¸ b¾t ®Çu tõ 20 th¸ng 7, míi cã thÓ rót th¨m!");
	else
		if GetTask(TASK_TIANDI_CHOUJIANG) ~= 0 then
			Talk(1,"","<color=green>D· TÈu<color>: Ng­¬i ®· rót th­ëng råi.");
			return
		end
		if Zgc_pub_goods_add_chk(6,600) ~= 1 then
			return
		end
		SetTask(TASK_TIANDI_CHOUJIANG,1);
		local nRoute = GetPlayerRoute();
		local nBody = GetBody();
		local nRand = random(1,10000);
		if nRand <= 1 then
			AddItem(tYandi[1][2],tYandi[1][3],tYandi[1][4]+nBody,1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tYandi[2][2],tYandi[2][3],tYandi[2][4]+nBody,1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tYandi[3][2],tYandi[3][3],tYandi[3][4]+nBody,1,1,-1,-1,-1,-1,-1,-1);
			local nRandOne = random(1,getn(tXuanyuanZhan[nRoute]));
			AddItem(tXuanyuanZhan[nRoute][nRandOne][2],tXuanyuanZhan[nRoute][nRandOne][3],tXuanyuanZhan[nRoute][nRandOne][4],1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tXuanyuanDou[nRoute][nRandOne][2],tXuanyuanDou[nRoute][nRandOne][3],tXuanyuanDou[nRoute][nRandOne][4],1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tHuangDiWeapon[nRoute][nRandOne][2],tHuangDiWeapon[nRoute][nRandOne][3],tHuangDiWeapon[nRoute][nRandOne][4],1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 bé trang bŞ Viªm Hoµng!");
			Msg2Global("Ng­êi ch¬i"..GetName().."Tham gia rót th¨m may m¾n Vâ l©m tranh b¸ nhËn ®­îc 1 bé Viªm Hoµng!");
			AddGlobalCountNews("Ng­êi ch¬i"..GetName().."Tham gia rót th¨m may m¾n Vâ l©m tranh b¸ nhËn ®­îc 1 bé Viªm Hoµng!",2);
			WriteLog("[Vâ l©m tranh b¸]: Ng­êi ch¬i"..GetName().."Tham gia rót th¨m may m¾n Vâ l©m tranh b¸ nhËn ®­îc 1 bé Viªm Hoµng!");
		elseif nRand <= 2 then
			AddItem(2,0,1055,1);
			AddItem(2,0,1056,1);
			AddItem(2,0,1057,1);
			AddItem(2,0,1058,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 bé Thiªn §Şa HuyÒn Hoµng!");
			Msg2Global("Ng­êi ch¬i"..GetName().."Tham gia rót th¨m may m¾n Vâ l©m tranh b¸ nhËn ®­îc 1 bé Thiªn §Şa HuyÒn Hoµng!");
			AddGlobalCountNews("Ng­êi ch¬i"..GetName().."Tham gia rót th¨m may m¾n Vâ l©m tranh b¸ nhËn ®­îc 1 bé Thiªn §Şa HuyÒn Hoµng!",2);
			WriteLog("[Vâ l©m tranh b¸]: Ng­êi ch¬i"..GetName().."Tham gia rót th¨m may m¾n Vâ l©m tranh b¸ nhËn ®­îc 1 bé Thiªn §Şa HuyÒn Hoµng!");			
		else
			AddItem(2,0,109,2,4); 
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 2 Bång Lai Tiªn Lé");
			Talk(1,"","<color=green>D· TÈu<color>: Ng­¬i ®· rót 1 lÇn th¨m, xin xem nh¾c nhë hÖ thèng, xem ng­¬i rót ®­îc g×!")
		end
	end
end

--=================== ÎäÁÖÕù°ÔÕ½ ============================
--¸øµÚ3Ì×Ê¦ÃÅ×°±¸
--nRoute£ºÂ·Ïß
--nBody£ºÌåĞÎ
--nGeneration£ºÖ¸Ã÷ÎªµÚ¼¸Ì×
--nSpecFlag£º×¨ÎªÉÙÁÖË×¼ÒÁôµÄÌØÊâ±ê¼Ç¡£0Îª¸øµ¶ºÍ¹÷£¬1¸ø¹÷£¬2¸øµ¶
--ĞÂÓÃº¯ÊıÖ÷ÒªÔ­ÒòÔÚÓÚÕâÀï¸øµÄµÚ3Ì×Ê¦ÃÅÉèÖÃÎª°î¶¨×°±¸£¬¼´AddItemµÚ4¸ö²ÎÊıÌîÎª4¡£
function fe_AddFactionEquipmentTHree(nRoute,nBody,nGeneration,nSpecFlag)
	if callback_date_check() ~= 1 then
		return
	end
	nSpecFlag = nSpecFlag or 0; 
	local nYears,nMonths,nDays = GmTime(GetTime()+28800);
	local nFlag,nIdx = 0,0;
	local nID2,nID3 = 0,0;
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11};
	if nRoute == 8 or nRoute == 9 then	--¶ëáÒÌØÊâ´¦Àí
		nID3 = nRoute*1000+(nGeneration-1)*100+(nBody-2)*10+9;
	else
		nID3 = nRoute*1000+(nGeneration-1)*100+nBody*10+9;
	end;
	nFlag,nIdx = AddItem(0,103,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	nFlag,nIdx = AddItem(0,100,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	nFlag,nIdx = AddItem(0,101,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	nFlag,nIdx = AddItem(0,102,nID3,1,4,-1,-1,-1,-1,-1,-1);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	if nRoute == 2 then	--¸ÃËÀµÄÉÙÁÖË×¼Ò
		if nSpecFlag == 0 or nSpecFlag == 1 then
			nFlag,nIdx = AddItem(0,5,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
		end;
		if nSpecFlag == 0 or nSpecFlag == 2 then
			nFlag,nIdx = AddItem(0,3,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
		end;
	else
		nID2 = tbWeaponID2[nRoute];
		if nID2 ~= nil then
			nFlag,nIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
		end;
	end;
	if nGeneration >= 3 then	--µÚÈıÌ×¿ªÊ¼²ÅÓĞ2¸ö½äÖ¸
		--ÁíÒ»¸ö½äÖ¸		
		if nRoute == 2 or nRoute == 3 or nRoute == 4 then
			nID3 = nRoute*1000+(nGeneration-1)*100+(nBody+2)*10+9;
		elseif nRoute == 8 or nRoute == 9 then	
			nID3 = nRoute*1000+(nGeneration-1)*100+(nBody)*10+9;
		else
			nID3 = nRoute*1000+(nGeneration-1)*100+(nBody+4)*10+9;
		end	
			nFlag,nIdx = AddItem(0,102,nID3,1,4,-1,-1,-1,-1,-1,-1);	
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	end
end;

--¸ù¾İÎïÆ·Ë÷ÒıÉèÖÃÎïÆ·µÄ´æÔÚÊ±¼ä
--Èç¹û²ÎÊıÊıÁ¿Îª2,Ôò¹¦ÄÜÈçSetItemExpireTime
--Èç¹û²ÎÊıÊıÁ¿´óÓÚ2,ÔòÎªÖ±½ÓÉèÖÃÎïÆ·µÄµ½ÆÚÊ±¼ä
function gf_SetItemExpireTime(nItem, ...)
	if nItem == nil or nItem == 0 then
		return 0;
	end
	local nArgSize = getn(arg);
	if nArgSize == 1 then
		SetItemExpireTime(nItem,arg[1]);
		return 0;
	end;
	
	for i=1, 6 do
		arg[i] = arg[i] or 0;
	end;
	local nCurTime = GetTime();
	local nThatTime = MkTime(arg[1],arg[2],arg[3],arg[4],arg[5],arg[6]);
	local nTimePassed = nThatTime - nCurTime;
	if nTimePassed < 0 then
		nTimePassed = 0;
	end;
	SetItemExpireTime(nItem,nTimePassed);
	return nTimePassed;
end;

--º¯ÊıÃû³Æ£ºNPCË÷ÒıÖµÉè¶¨
--¹¦        ÄÜ£ºÖ±½ÓÉè¶¨NPCË÷ÒıÎ»ÖÃµÄÖµ
function gf_SetUnitCurState(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end

function wulin_zhengba()
	Say("Vâ l©m tranh b¸ ch­a b¾t ®Çu!",0)
	do return end
	local strtab = {
		"Ta muèn nhËn trang bŞ chuyªn dông Vâ l©m tranh b¸ (1 bé trang bŞ ®é c­êng hãa 10, chØ dïng trong ngµy Vâ l©m tranh b¸)/get_wulin_zhuangbei", --Ãâ·ÑÇøÎªÇ¿10
		"Ta muèn xem thµnh tİch bæn m«n, nhËn phÇn th­ëng tranh b¸/#get_wulin_award(1)",
		"Ta muèn nhËn phÇn th­ëng m«n ph¸i tuÇn nµy/#get_wulin_award(2)",
		"T×m hiÓu chi tiÕt Vâ l©m tranh b¸/about_wulin_zhengba",
		"Kh«ng vÊn ®Ò g×/nothing"
		}
	local nPos = GetWorldPos();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end
	if nIdx ~= 0 then
		Say(tShifu[nIdx][5].."§¹i héi vâ l©m Thiªn h¹ ®Ö nhÊt s¾p b¾t ®Çu, c¬ héi cho ng­êi ch¬i míi thi ®Êu Vâ l©m tranh b¸ còng s¾p b¾t ®Çu, chñ nhËt mçi tuÇn ®Òu tiÕn hµnh Vâ l©m tranh b¸, néi dung chi tiÕt ta sÏ gi¶i thİch! NÕu bæn m«n ®¹t thµnh qu¶ nhÊt ®Şnh trong Vâ l©m tranh b¸ sÏ cã lîi cho tÊt c¶ ®Ö tö trong m«n ph¸i! <color=yellow>Xin chó ı, tû thİ kh«ng thÓ t¨ng thªm thµnh tİch!<color>",
			getn(strtab),
			strtab)
	end
end

function get_wulin_zhuangbei()
	local nLv = GetLevel();
	local nFaction = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nPos = GetWorldPos();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end	
	if nFaction ~= nIdx then
		Talk(1,"",tShifu[nIdx][5].."Ng­¬i kh«ng ph¶i ®Ö tö bæn m«n");
		return
	end
	if nLv < 70 then	
		Talk(1,"",tShifu[nIdx][5].."Ta còng muèn tÆng ng­¬i, nh­ng ®¼ng cÊp cña ng­¬i qu¸ thÊp, kh«ng thÓ mÆc ®­îc! §Õn cÊp 70 h½n ®Õn t×m ta!");
		return
	end
	if nRoute == 0 or nRoute == 1 or	nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		Talk(1,"",tShifu[nIdx][5].."Ng­¬i ch­a gia nhËp l­u ph¸i, lÊy trang bŞ nµy còng kh«ng dïng ®­îc.");
		return
	end
	if callback_date_check() ~= 1 then
		Talk(1,"",tShifu[nIdx][5].."Vâ l©m tranh b¸ trËn sÏ ®­îc tæ chøc vµo chñ nhËt mçi tuÇn, xin nhËn vµo chñ nhËt.");
		return
	end
	if Zgc_pub_goods_add_chk(6,600) ~= 1 then
		return
	end
	fe_AddFactionEquipmentTHree(nRoute,nBody,3);
end


function get_wulin_award(nType)
	local nFaction = GetPlayerFaction();
	local nPos = GetWorldPos();
	local nLv = GetLevel();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end	
	if nFaction ~= nIdx then
		Talk(1,"",tShifu[nIdx][5].."Ng­¬i kh«ng ph¶i ®Ö tö bæn m«n");
		return
	end	
	local nDate = tonumber(date("%Y%m%d"));
--	if nDate < 20080720 or nDate > 20080816 then
--		Talk(1,"",tShifu[nIdx][5].."ÎäÁÖÕù°ÔÕ½ÔÚ7ÔÂ20ÈÕ£¬7ÔÂ27ÈÕ£¬8ÔÂ3ÈÕ£¬8ÔÂ10ÈÕ¾ÙĞĞ£¬ÇëÔÚÕâ¶ÎÊ±¼äÁìÈ¡¡£");
--		return
--	end
	if nLv < 70 then
		Talk(1,"",tShifu[nIdx][5].."Tham gia Vâ l©m tranh b¸ trËn yªu cÇu cÊp 70 trë lªn");
		return
	end
	local nNpcIdx = GetTargetNpc();
	local nWeek = GetWeekSequence(7,0);
	local nNpcWeek = GetUnitCurStates(nNpcIdx,1);
	local nKillDate = GetTask(TASK_KILL_DATE);
	if nType == 1 then 
		if GetTask(TASK_AWARD_WEEK) == nWeek then
			Talk(1,"",tShifu[nIdx][5].."B¹n ®· nhËn phÇn th­ëng tranh b¸ trËn tuÇn nµy. TuÇn nµy b¹n ®· th¾ng m«n ph¸i kh¸c <color=yellow>"..GetTask(TASK_KILL_PLAYER).."<color> ng­êi.");
			return
		end
		if Zgc_pub_goods_add_chk(1,20) ~= 1 then
			return
		end
		if nNpcWeek ~= nWeek then
			gf_SetUnitCurState(nNpcIdx,1,nWeek);
			gf_SetUnitCurState(nNpcIdx,4,0);
			gf_SetUnitCurState(nNpcIdx,5,0);
		end
		if nKillDate ~= nWeek then
			SetTask(TASK_KILL_DATE,nWeek);
			SetTask(TASK_KILL_PLAYER,0);
			SetTask(TASK_KILLED_NUM,0);
		end
		local nKillNum = GetTask(TASK_KILL_PLAYER);
		local nKilledNum = GetTask(TASK_KILLED_NUM);
		local nExp = floor(nLv^3*10);
		
		if nKilledNum+nKillNum >= 10 then
			SetTask(TASK_AWARD_WEEK,nWeek);
			gf_SetUnitCurState(nNpcIdx,4,(GetUnitCurStates(nNpcIdx,4)+nKillNum));
			if nKillNum >= nKilledNum then
				gf_SetUnitCurState(nNpcIdx,5,(GetUnitCurStates(nNpcIdx,5)+1));
				if nLv ~= 99 then
					ModifyExp(nExp);
					Msg2Player("B¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
					Talk(1,"",tShifu[nIdx][5].."H«m nay b¹n ®· th¾ng m«n ph¸i kh¸c <color=yellow>"..nKillNum.."<color> ng­êi, bæn m«n ®· cã <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> ®Ö tö dµnh th¾ng lîi khi tû vâ víi ®Ö tö m«n ph¸i kh¸c. §Ö tö bæn m«n qu¶ nhiªn tinh anh, ®Ó ta chØ cho ng­¬i mét İt vâ c«ng!");
				else
					AddItem(2,1,3210,20);
					Talk(1,"",tShifu[nIdx][5].."H«m nay b¹n ®· th¾ng m«n ph¸i kh¸c <color=yellow>"..nKillNum.."<color> ng­êi, bæn m«n ®· cã <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> ®Ö tö dµnh th¾ng lîi khi tû vâ víi ®Ö tö m«n ph¸i kh¸c. Vâ c«ng cña ng­¬i ®· tiÕn bé nhiÒu, ta kh«ng cßn g× ®Ó d¹y ng­¬i n÷a, ®©y lµ mét sè kü n¨ng t©m ®¾c cña ta, tÆng cho ng­¬i ®ã!");
				end
			else
				if nLv ~= 99 then
					ModifyExp(nExp);
					Msg2Player("B¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
					Talk(1,"",tShifu[nIdx][5].."H«m nay b¹n ®· th¾ng m«n ph¸i kh¸c <color=yellow>"..nKillNum.."<color> ng­êi, bæn m«n ®· cã <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> ®Ö tö dµnh th¾ng lîi khi tû vâ víi ®Ö tö m«n ph¸i kh¸c. Ng­¬i mÆc dï thÊt thñ h¬i nhiÒu, nh­ng kh«ng nªn n¶n lßng, ta sÏ d¹y cho ng­¬i mét sè vâ c«ng!");
				else
					AddItem(2,1,3210,20);
					Msg2Player("B¹n nhËn ®­îc 20 quyÓn Thiªn Thêi Chó Gi¶i.");
					Talk(1,"",tShifu[nIdx][5].."H«m nay b¹n ®· th¾ng m«n ph¸i kh¸c <color=yellow>"..nKillNum.."<color> ng­êi, bæn m«n ®· cã <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> ®Ö tö dµnh th¾ng lîi khi tû vâ víi ®Ö tö m«n ph¸i kh¸c. Vâ c«ng cña ng­¬i ®· tiÕn bé nhiÒu, ta kh«ng cßn g× ®Ó d¹y ng­¬i n÷a, ®©y lµ mét sè kü n¨ng t©m ®¾c cña ta, tÆng cho ng­¬i ®ã!");
				end
			end
		else
			Talk(1,"",tShifu[nIdx][5].."Bæn m«n ®· cã <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> ®Ö tö dµnh th¾ng lîi khi tû vâ víi ®Ö tö m«n ph¸i kh¸c. BÊt luËn th¾ng thua còng nªn thö søc mét phen! Cø thö xem sao, thö th¸ch vµi lÇn!");
		end
	elseif nType == 2 then
		if GetTask(TASK_MENPAI_AWARD) == nWeek then
			Talk(1,"",tShifu[nIdx][5].."B¹n ®· nhËn phÇn th­ëng m«n ph¸i tuÇn nµy. Bæn m«n ®· cã <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> ®Ö tö dµnh th¾ng lîi khi tû vâ víi ®Ö tö m«n ph¸i kh¸c.");
			return
		end
		if Zgc_pub_goods_add_chk(3,40) ~= 1 then
			return
		end	
		if GetTask(TASK_AWARD_WEEK) ~= nWeek then
			Talk(1,"",tShifu[nIdx][5].."B¹n ph¶i nhËn phÇn th­ëng Vâ l©m tranh b¸ tr­íc sau ®ã míi nhËn phÇn th­ëng m«n ph¸i.");
			return
		end
		if GetUnitCurStates(nNpcIdx,4) >= 100 then
			local tItem = {	
			[1] = {2,0,448,"Phæ HiÒn X¸ Lîi"},	--ÉÙÁÖ
			[2] = {2,0,469,"Thiªn C¬ Méc"},--Îäµ±
			[3] = {2,0,457,"Kim Liªn Hoa"},--¶ëáÒ
			[4] = {2,0,466,"Tö Kim B¸t"},--Ø¤°ï
			[5] = {2,0,454,"Bİ §éc ph­¬ng"},--ÌÆÃÅ	
			[6] = {2,0,477,"Tinh B× TiÔn §¹i"},	--ÑîÃÅ
			[7] = {2,0,484,"RÕt ®éc"},--Îå¶¾
			[8] = {2,0,491,"Mai QuÕ Lé"},--´äÑÌ
			[9] = {2,0,495,"Khu Ma H­¬ng"},--À¥ÂØ
			[10] = {2,0,499,"Th¸nh Háa LÖnh"}--Ã÷½Ì
			};			
			SetTask(TASK_MENPAI_AWARD,nWeek);
			AddItem(2,0,141,2,4);
			AddItem(tItem[nFaction][1],tItem[nFaction][2],tItem[nFaction][3],20);
			Talk(1,"",tShifu[nIdx][5].."Bæn m«n ®· cã <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> ®Ö tö dµnh th¾ng lîi khi tû vâ víi ®Ö tö m«n ph¸i kh¸c. Ch­ëng  m«n rÊt h·nh diÖn, quyÕt ®Şnh cho mçi ®Ö tö 2 Tiªu KiÕp t¸n vµ 20 tİn vËt trang bŞ S­ M«n 4, hy väng mäi ng­êi tiÕp tôc cè g¾ng!");
		else
			Talk(1,"",tShifu[nIdx][5].."MÆc dï ng­¬i ®· cè g¾ng, nh­ng vâ häc bæn m«n nÕu chØ dùa vµo n¨ng lùc c¸ nh©n th× kh«ng ®ñ. Nh÷ng ®Ö tö håi b¸o chiÕn tİch cña m×nh, sÏ ®­îc ch­ëng m«n ban th­ëng!");
		end
	end
end

function about_wulin_zhengba()
	local nPos = GetWorldPos();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end		
	Talk(2,"wulin_zhengba",tShifu[nIdx][5].."§¹i héi tû vâ s¾p b¾t ®Çu, mçi ngµy trong tuÇn b¹n cã thÓ mÆc Th©n Gi¸p Trô ta ban cho ®Ó tû thİ víi c¸c hµo kiÖt kh¸c, ®õng ®Ó hä xem th­êng bæn m«n, Th©n Gi¸p Trô nµy nÕu bŞ h­ cã thÓ t×m ta ®Ó nhËn. Ngoµi ra D· TÈu sÏ gióp mäi ng­êi trŞ th­¬ng trong thêi gian diÔn ra cuéc thi.\n    TÊt c¶ thµnh tİch ë chiÕn tr­êng, ®¹i héi tû vâ vµ PK ngoµi thµnh sÏ ®­îc ®­a vµo thµnh tİch Tranh B¸ trËn! §èi thñ ph¶i lµ ng­êi cña m«n ph¸i kh¸c! (cÊp 60 trë lªn)\n    L­u ı, khi tiÕn hµnh tû thİ kh«ng thÓ t¨ng thµnh tİch!","    §ñ ®iÒu kiÖn, sÏ nhËn ®­îc kinh nghiÖm t­¬ng øng (cÊp 80 lµ 512 v¹n, dao ®éng tïy theo ®¼ng cÊp ng­êi ch¬i), ng­êi ch¬i cÊp 99 cã thÓ nhËn ®­îc 20 quyÓn Thiªn Thêi Chó Gi¶i.\n    §ñ ®iÒu kiÖn nhËn phÇn th­ëng m«n ph¸i, cã thÓ nhËn 2 Tiªu KiÕp t¸n, 20 tİn vËt S­ M«n 4.")
end