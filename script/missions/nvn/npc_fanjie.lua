----------------------------------------
-- e:\src\lua\jx2_script_dbg\chaoschoice\temp_talk_.lua
-- auto create by temp_talk
-- 07/12/11 15:38:55
----------------------------------------

Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\talktmp.lua");
--Include("\\script\\lib\\xoyobi.lua");
--Include("\\script\\task\\global_task\\gtask_data.lua");
--Include("\\script\\misc\\globalflag.lua")

TMAIN = {}
SAY_1 = {}
SAY_2 = {}
SAY_3 = {}
SAY_3_1 = {}
SAY_4 = {}
SAY_4_1 = {}
SAY_4_2 = {}
SAY_4_3 = {}
SAY_5 = {}

tGtNpcMain:get_main_table("Ph¹m Th­")
g_NpcName = "<color=green> Vâ L©m Minh Ph¹m Th­ <color>:"
TMAIN.msg = g_NpcName.."Vâ L©m Minh Gi¸o Tr­êng nhËn ®­îc chiÕu thŞ cña triÒu ®×nh, ®· giao viÖc nµy cho §Æc Sø §¹i Héi TØ Vâ t¹i BiÖn Kinh chñ tr×.";
TMAIN.sel = 
{
--	{"½øÈëĞ£³¡", SAY_1, }, 
--	{"ÈÕ³£ÈÎÎñ", SAY_2, }, 
--	{"ÔöÖµ·şÎñ", SAY_3, }, 
--	{"Ğ£³¡½éÉÜ", SAY_4, }, 
	{"Vâ L©m Minh Håi Qui", SAY_5, },
	{"KÕt thóc", "nothing", }, };
SAY_1.msg = g_NpcName.."Sau khi vµo Vâ L©m Minh Gi¸o Tr­êng, nh÷ng vËt phÈm kh«ng hîp víi tiªu chuÈn ta sÏ b¶o qu¶n gióp ng­¬i, sau khi quay l¹i ta sÏ tr¶ l¹i, ta kh«ng ph¶i tªn trém ®©u! TiÒn cña Vâ L©m Minh duy nhÊt chØ cã TiÒn Tiªu Dao mµ th«i.";
SAY_1.sel = 
{
	{"Vµo ®Êu tr­êng TØ Vâ", "enterNvn", },
	{"§æi TiÒn Tiªu Dao (vËt phÈm mua ®Ó dïng t¹i liªn ®Êu)", "tmz_Change_Xoyo_Gold", }, 
	{"§æi Ngäc Tiªu Dao( phôc vô cho viÖc t¨ng trŞ gi¸ t¹i liªn ®Êu)", "tmz_Change_Xoyo_Yu", }, 
	{"trë l¹i", TMAIN, }, 
	{"KÕt thóc ®èi tho¹i", "nothing", }, };
SAY_2.msg = g_NpcName.."§¹i hiÖp t¹i ®Êu tr­êng tØ thİ cã vui hay kh«ng?";
SAY_2.sel = 
{
	{"Khëi ®éng - giµnh chiÕn th¾ng 5 lÇn th«ng qua "gia nhËp nhanh" më ®Êu tr­êng Vâ L©m Minh, sÏ nhËn ®­îc phÇn th­ëng.", "#task(1)", }, 
	{"TiÓu thİ th©n thñ - giµnh chiÕn th¾ng 5 lÇn th«ng qua "gia nhËp nhanh" më ®Êu tr­êng Vâ L©m Minh, sÏ nhËn ®­îc phÇn th­ëng.", "#task(2)", }, 
	{"Phong cuång vâ gi¶ - giµnh chiÕn th¾ng 10 lÇn th«ng qua "gia nhËp nhanh" më ®Êu tr­êng Vâ L©m Minh, sÏ nhËn ®­îc phÇn th­ëng.", "#task(3)", }, 
	{"trë l¹i", TMAIN, }, 
	{"KÕt thóc ®èi tho¹i", "nothing", }, };
		
g_tStatValueStr = {
	"jiaochang_reshen",			--¼ÇÂ¼Íæ¼ÒÁìÈ¡ÈÈÉíÈÎÎñµÄ´ÎÊı
	"jiaochang_xiaoshi",		--¼ÇÂ¼Íæ¼ÒÁìÈ¡Ğ¡ÊÔÉíÊÖÈÎÎñµÄ´ÎÊı
	"jiaochang_fengkuang",	--¼ÇÂ¼Íæ¼ÒÁì·è¿ñµÄÎäÕßÈÎÎñµÄ´ÎÊı
}
	
function task(n)
	local nTaskId = 992 + n - 1;
	if GetTask(3458 + n - 1) ~= 0 then
		return Talk(1, "", g_NpcName.."H«m nay ng­¬i ®· nhËn phÇn th­ëng nµy");
	end

	if tGtTaskManage:IsGetGTaskID(nTaskId) == 0 then
		local nCanGet = tGtTask:IsTaskCanGet(nTaskId)
		if nCanGet ~= 1 then
			return Talk(1,  "",  "Ng­¬i kh«ng thÓ nhËn nhiÖm vô nµy");
		else
			OpenGTask(nTaskId)
			AddStatValue(g_tStatValueStr[n], 1);
		end
	else
		local nCanOver = tGtTask:IsTaskCanOver(nTaskId)
		if nCanOver ~= 1 then
			return Talk(1, "", g_NpcName.."Ng­¬i vÉn ch­a hoµn thµnh nhiÖm vô nµy");
		else
			FinishGTask(nTaskId)
		end
	end
end

SAY_3.msg = g_NpcName.."§Ó tr¸nh t×nh tr¹ng kh«ng tu©n thñ trËt tù trong ®Êu tr­êng, tr­ëng l·o ®Æc biÖt giao cho nh÷ng ®¹i hiÖp lËp kú c«ng lÖnh bµi";
SAY_3.sel = 
{
	{"LÖnh bµi g× chø", SAY_3_1, }, 
--	{"ÎÒÒª»ñµÃÁîÅÆ£¨ÏûºÄ20Ã¶åĞÒ£Óñ£©", "exchangeToken", }, 
	{"trë l¹i", TMAIN, }, 
	{"KÕt thóc", "nothing", }, };
SAY_3_1.msg = g_NpcName.."LÖnh bµi cã thÓ tr¸nh t×nh tr¹ng trong ®Êu tr­êng Vâ L©m Minh bŞ tïy tiÖn mêi rêi khái ®éi, nã cã t¸c dông trong vßng 1 th¸ng";
SAY_3_1.sel = 
{
	{"trë l¹i", SAY_3, }, };
SAY_4.msg = g_NpcName.."§Êu tr­êng Vâ L©m Minh lµ do Tr­ëng L·o Vâ L©m Minh B¸ch HiÓu Sinh liªn hîp v¨n sö, thiÕu d­¬ng, cïng nhau tæ chøc TØ Vâ. Sau ®ã lµ ®Ó ®èi kh¸ng Thiªn Minh Gi¸o. ";
SAY_4.sel = 
{
	{"Giíi thiÖu gi¸o tr­êng", SAY_4_1, }, 
	{"Giíi thiÖu ®iÓm tİch lòy", SAY_4_2, }, 
--	{"½±Àø½éÉÜ", SAY_4_3, }, 
	{"trë l¹i", TMAIN, }, 
	{"KÕt thóc", "nothing", }, };
SAY_4_1.msg = "Thêi gian Vâ L©m Minh Gi¸o Tr­êng më lµ mçi ngµy vµo lóc 18:00 - 24:00. C¸c ®¹i hiÖp cã thÓ trong kho¶ng thêi gian nµy, do tiÓu n÷ dÉn vµo. Sau ®ã cã thÓ gia nhËp vµo phßng liªn quan tiÕn hµnh giao tranh. n\ HiÖn t¹i lµ m« h×nh tæ ®éi Vâ L©m Minh, chia thµnh 2 ng­êi tæ ®éi vµ 3 ng­êi tæ ®éi giao tranh.";
SAY_4_1.sel = 
{
	{"trë l¹i", SAY_4, }, };
SAY_4_2.msg = "ThiÕu hiÖp giao tranh trong Vâ L©m Minh Gi¸o Tr­êng cã thÓ nhËn ®­îc ®iÓm tİch lòy, khi ®iÓm tİch lòy ®¹t ®Õn møc nhÊt ®Şnh, sÏ n©ng lªn ®Õn møc kh¸c vµ nhËn ®­îc danh hiÖu t­¬ng øng. Danh hiÖu cã thÓ t¨ng thªm cho thuéc tİnh vÜnh viÔn, t­¬ng øng nh­ sau: \n NhÊt Vâ Gi¶    0           Lôc Vâ Th¸nh    18000\n NhŞ Vâ SÜ    2000        ThÊt Vâ Hoµng    22000\n Tam Vâ S­    6000        B¸t Vâ Quû    28000\n Tø Vâ HiÖp    10000       Cöu Vâ T«n    35000\n Ngò Vâ T«ng    14000       Vâ Th¸nh        60000";
SAY_4_2.sel = 
{
	{"trë l¹i", SAY_4, }, };
SAY_4_3.msg = "Khi ®¹i hiÖp t¨ng møc trong Vâ L©m Minh Gi¸o Tr­êng, sÏ ®­îc chóng t«i tÆng lÔ vËt, nh­ sau\n NhÊt Vâ Gi¶    Danh hiÖu gi¸o tr­êng        Lôc Vâ Th¸nh    MËt tŞch L¨ng Ba\n NhŞ Vâ SÜ    Thiªn BiÕn Ph¹m Thiªn QuyÓn      ThÊt Vâ Hoµng    MËt TŞch Tiªu Dao\n tam Vâ S­    Nh©n S©m Ngµn N¨m      B¸t Vâ Quû    MËt tŞch m«n ph¸i t­¬ng øng\n Tø Vâ HiÖp    TÈy Tñy Linh §¬n        Cöu Vâ T«n    ChÊn ph¸i tµn quyÓn §Şa HuyÒn Kim LÖnh\n Ngò Vâ T«ng    B¸t B¶o TÈy Tñy Tiªn §¬n      Vâ Th¸nh      MËt tŞch cao cÊp\n Vâ L©m Minh cßn cung cÊp cho ng­êi ch¬i sù tİch cùc vµ cæ vò.";
SAY_4_3.sel = 
{
	{"trë l¹i", SAY_4, }, };

--SAY_5.msg = g_NpcName.."ÎäÁÖÃË·¶½ã£º×ğ¾´µÄÏÀÊ¿£¬ÓÉÓÚ¸÷Î»ÔÚÎäÁÖÃËĞ£³¡¿ª·ÅÆÚ¼äµÄÓÅÒì±íÏÖ£¬ÏÖ½«°´ÕÕ35»ı·Ö¶Ò»»1½ğ×ÓµÄ±ÈÀı½øĞĞ½±Àø£¬²¢Çå¿Õ»ı·ÖÓë³ÆºÅ¡£";
SAY_5.msg = g_NpcName.."§¹i hiÖp, qua th­¬ng l­îng víi Tr­ëng l·o Vâ L©m Minh, quy ®æi nh­ sau: \n1?mçi ng­êi 50 §Êu Ph¸ch LÖnh (khãa) \n2?c¨n cø vµo ®iÓm tİch lòy Vâ L©m Minh Gi¸o Tr­êng nhËn ®­îc danh hiÖu vÜnh viÔn \n    1      Vâ L©m Minh Vâ Gi¶      18000  Vâ L©m Minh Vâ Linh \n    2000   Vâ L©m Minh Vâ SÜ      22000  Vâ L©m Minh Vâ Hoµng\n    6000   Vâ L©m Minh Vâ S­      28000  Vâ L©m Minh Vâ Quû\n    10000  Vâ L©m Minh Vâ HiÖp      35000  Vâ L©m Minh Vâ T«n\n    14000  Vâ L©m Minh Vâ T«ng      60000  Vâ L©m Minh Vâ Th¸nh";
SAY_5.sel = 
{
	{"Ta muèn nhËn quy ®æi", "exchangeScore", },
	{"trë l¹i", TMAIN, }, };

function main()
	return;
	local m = GetWorldPos();
	local sel = {};
	if m == 8000 then
		sel = {             
			--"\n»ØÎäÁÖÃË/#ChangeGroupWorld(425,1762,3157)",
			"\·µ»Øãê¾©/#ChangeGroupWorld(200,1391,2820)",
			"\nKÕt thóc ®èi tho¹i/nothing",
		}
		Say("<color=green>Giang Nam nhÊt k× Mai Ph¹m Th­<color>: ha ha, §Æc Sø §¹i Héi TØ Vâ ®ang bËn viÖc triÒu ®×nh, ta ®µnh ph¶i thay mÆt chñ tr× lÇn ®¹i héi nµy råi.",
			getn(sel), sel);
	else
		temp_Talk(TMAIN);
	end
end

function enterNvn()
	if gf_CheckPlayerRoute() ~= 1 then
		return Talk(1, "", "H·y gia nhËp m«n ph¸i tr­íc råi h·y ®Õn tham gia tØ vâ");
	elseif GetLevel() < 70 then
		return Talk(1, "", "§¼ng cÊp kh«ng ®ñ 70 kh«ng thÓ tham gia tØ vâ");
	end
	local nHour = tonumber(date("%H"));
	if nHour < 18 or nHour > 23 then
		return Talk(1, "", "§Êu tr­êng më vµo lóc 18:00 - 23:00");
	end
	SetTask(TASKID_NEED_SYNC_REALM_DATA, 1);
	ChangeGroupWorld(8000,1600,3200,1);	
end

g_tNvnRankAward = {
	[1 ] = {},
	[2 ] = {"Thiªn BiÕn Ph¹m Thiªn QuyÓn", {g,d,p,1,4}},
	[3 ] = {
		{"Nh©n S©m v¹n n¨m", {g,d,p,1,4}},
		{"ThÇn hµnh b¶o ®iÓn", {g,d,p,1,4}},
	},
	[4 ] = {
		{"TÈy Tñy ®¬n", {g,d,p,5,4}},
		{"TÈy Tñy linh ®¬n", {g,d,p,1,4}},
	},
	[5 ] = {"B¸t B¶o TÈy Tñy Tiªn §¬n", {g,d,p,1,4}},
	[6 ] = {"L¨ng Ba MËt TŞch", {g,d,p,1,4}},
	[7 ] = {"MËt TŞch Tiªu Dao", {g,d,p,1,4}},
	[8 ] = {"MËt tŞch m«n ph¸i", {g,d,p,1,4}},
	[9 ] = {"§Şa HuyÒn Kim LÖnh", {g,d,p,1,4}}, 
	[10] = {"MËt tŞch cao cÊp ngÉu nhiªn", {g,d,p,1,4}}, 
}

function giveRandAward()
	local rankAward = GetTask(TASKID_NVN_RANK_AWARD);
	local nRank = GetTask(TASKID_NVN_RANK);
	if GetBit(rankAward, nRank) == 1 then return end
	rankAward = SetBit(rankAward, nRank, 1);
	local tAward = g_tNvnRankAward[nRank];
	SetTask(TASKID_NVN_RANK_AWARD, rankAward);
	if not tAward or getn(tAward) == 0 then return end
	
end

function tmz_Change_Xoyo_Gold()
	local strtab = {
		"Dïng vµng ®æi Xu Tiªu Dao (1 vµng ®æi 100 Xu Tiªu Dao)/tmz_Use_JXB",
		"trë l¹i/main",
		"KÕt thóc ®èi tho¹i/nothing",
	};
	Say(g_NpcName,--.."¿ç·şºó³ı<color=yellow>åĞÒ£±Ò<color>ÒÔÍâµÄ»õ±Ò¶¼½«ÎŞ·¨Ê¹ÓÃ£¬ÎÒ¿ÉÒÔ½«<color=yellow>½ğ×Ó<color>¶Ò»»³É¿ç·ş»õ±ÒåĞÒ£±Ò¡£ÉÙÏÀÏÖÔÚÓµÓĞåĞÒ£±Ò"..GetXYB().."Ã¶£¬ÒÔºó²éÑ¯¿ÉÍ¨¹ıF2½çÃæ¡££¨¿ÉÎª¸ºÊı£©",
		getn(strtab),
		strtab)
end

function tmz_Use_JXB()
	local nJxb = floor(GetCash()/10000);
	AskClientForNumber("tmz_Use_JXB_Confirm",1,nJxb*100,"§«i bao nhiªu Xu Tiªu Dao?");
end

function tmz_Use_JXB_Confirm(nCount)
--	local nJxb = floor(GetCash()/10000);
--	if nJxb < nCount/100 then
--		Talk(1,"",g_NpcName.."ÄãÉíÉÏ²»¹»½ğ×Ó¶Ò»»"..nCount.."åĞÒ£±Ò¡£");
--		return 0;
--	end
--	if Pay(nCount/100*10000) == 1 then
--		EarnXYB(nCount);
----		Msg2Player("Äã»ñµÃ"..nCount.."åĞÒ£±Ò¡£");
--	end
end

function tmz_Change_Xoyo_Yu()
--	Say(g_NpcName.."ÄãÈ·¶¨Ê¹ÓÃ1¸ö[ºÍÊÏèµ]¶Ò»»100åĞÒ£ÓñÂğ£¿",
--		2,
--		"\nÈ·¶¨/tmz_Change_Yu_Confirm",
--		"\n·µ»Ø/main")
end

function tmz_Change_Yu_Confirm()
	if GetItemCount(2,1,1001) < 1 then
		Talk(1,"",g_NpcName.."C¸c h¹ kh«ng mang theo Hßa ThŞ Bİch.");
		return 0;
	end
	if DelItem(2,1,1001,1) == 1 then
		EarnXYY(100);
	end
end

function FinishGTask(nTaskID)
	--print("in finish")
	if nTaskID == 0 or nTaskID == nil then
		nTaskID = GetTask(3401);
		if nTaskID == 0 then
			return 5
		end
	end
	
	--manageÖĞÊÇ·ñ½ÓÁË
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 3
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	
	--Ìõ¼ş¼ì²â
	local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	if nCanOver ~= 1 then
		return 2
	end
	
	--½áÊøÇ°¶¯×÷£º²ß»®Éè¶¨£¬É¾³ı£¬¶Ô»°
	if tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10]) == nil then
		return 4;
	end
	--tGtTask:SpeakFinish(nTaskID, 1);
	
	--½áÊø¶¯×÷
	--ÌØĞ§
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	--manage´¦Àí
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--¸øÓë½±Àø
	tGtTask:DoPrize(nTaskID)	
	
	--°ïËûµãÒ»ÏÂ¾Í¿ÉÒÔµÃµ½ÏÂÒ»²½ÈÎÎñ
--	tGtNpcMain:npc_main(tGtNpcInfo[nTaskID].to_npc)
	
	--print("succ")
	return 1
end

g_tNvnRankTitle = {
    {1    , 67, 1, "Vâ L©m Minh Vâ Gi¶",},
    {2000 , 67, 2, "Vâ L©m Minh Vâ SÜ",},
    {6000 , 67, 3, "Vâ L©m Minh Vâ S­",},
    {10000, 67, 4, "Vâ L©m Minh Vâ HiÖp",},
    {14000, 67, 5, "Vâ L©m Minh Vâ T«ng",},
    {18000, 67, 6, "Vâ L©m Minh Vâ Linh",},
    {22000, 67, 7, "Vâ L©m Minh Vâ Hoµng",},
    {28000, 67, 8, "Vâ L©m Minh Vâ Quû",},
    {35000, 67, 9, "Vâ L©m Minh Vâ T«n",},
    {60000, 67, 10, "Vâ L©m Minh Vâ Th¸nh",},
}

function exchangeScore(bSure)
	if gf_CheckGlbFlag(GF_NVN_FEEDBACK) ~= 1 then
		if gf_CheckGlbFlag(GF_NVN_FEEDBACK_2) ~= 1 then
			return Talk(1, "", "Ng­¬i ®· nhËn ®iÓm tİch lòy quy ®æi Vâ L©m Minh råi!");			
		end
		if gf_AddGlbFlag(GF_NVN_FEEDBACK_2) ~= 1 then return end
		gf_SetLogCaption(format("[NVN ®æi ®iÓm tİch lòy 2]"));
		gf_AddItemEx({2,95,1511,1,4}, "§Êu Ph¸ch LÖnh", 45);
		gf_SetLogCaption("");
		return Talk(1, "", "§iÓm tİch lòy Vâ L©m Minh cña ng­¬i ®· ®æi hoµn tÊt, ®a t¹ !");
	end
	if gf_JudgeRoomWeight(1,1,"") ~= 1 then return end
	
	local nScore = GetTask(TASKID_NVN_SCORE);
	if nScore <= 0 then
		return Talk(1, "", "§iÓm tİch lòy Vâ L©m Minh cña ng­¬i lµ 0, kh«ng thÓ nhËn!");
	end
	if gf_AddGlbFlag(GF_NVN_FEEDBACK) ~= 1 then return end
	if gf_AddGlbFlag(GF_NVN_FEEDBACK_2) ~= 1 then return end
	gf_SetLogCaption(format("[NVN ®æi ®iÓm tİch lòy] [%d]", nScore));
	for i = getn(g_tNvnRankTitle), 1, -1 do
		if nScore >= g_tNvnRankTitle[i][1] then
			AddTitle(g_tNvnRankTitle[i][2], g_tNvnRankTitle[i][3]);
			Msg2Player(format("Chóc mõng ng­¬i nhËn ®­îc [%s] danh hiÖu", g_tNvnRankTitle[i][4]));
			gf_AddItemEx({2,95,1511,1,4}, "§Êu Ph¸ch LÖnh", 50);
			break;
		end
	end
	gf_SetLogCaption("");
	Talk(1, "", g_NpcName.."§iÓm tİch lòy Vâ L©m Minh cña ng­¬i ®· ®æi hoµn tÊt, ®a t¹ !");
end
