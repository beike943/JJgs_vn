Include("\\script\\½á»é\\marriage_head.lua");

COST_BLESS 		= 18			--×£¸£ËùÐè¼ÛÇ®£¨18½ð£©

	
CALLBACK_FILE	= "\\script\\½á»é\\npc\\Ï²Äï.lua"		-- »Øµ÷ÎÄ¼þÃû

this_date 		= 0		-- ÈÕÆÚ
this_period 	= 0		-- Ê±¶Î
this_bridegroom = ""	-- ÐÂÀÉ
this_bride		= ""	-- ÐÂÄï
g_inited = 0;

g_InfoHeader = "<color=green>Hû N­¬ng<color>:";

function main()
	if (this_date ~= curr_date() or this_period ~= curr_period()) or g_inited == 0 then
		init()
		return
	end
	-- ²»Í¬Éí·ÝµÄÈË¿´µ½µÄ¶Ô»°²»Í¬
	local caption = g_InfoHeader.."§õng qu¸ lo l¾ng, mäi viÖc ®· cã Hû n­¬ng ®©y lo liÖu"
	local name = GetName()
	local selTab = {};
	local selCount = 0;
	if (is_compere() == 1 or is_field_owner() == 1) then
		selCount = selCount + 1;
		selTab[selCount] = "Ta muèn cö hµnh h«n lÔ/have_wedding";
		selCount = selCount + 1;
		selTab[selCount] = "Ta muèn bµy tiÖc r­îu/feast";
	end;
	if is_field_owner() ~= 1 then
		selCount = selCount + 1;
		selTab[selCount] = "Ta muèn chóc mõng t©n lang, t©n n­¬ng!/#bless(1)";	
	end;
	if is_field_owner() == 1 then
		selCount = selCount + 1;
		if GetFightState() == 1 then
			selTab[selCount] = "HiÖn kh«ng muèn xuÊt chiªu/changefightstate";
		else
			selTab[selCount] = "Kh¸ch ®Õn ®«ng qu¸/changefightstate";
		end;
	end;
	if is_field_owner() ~= 1 then
		selCount = selCount + 1;
		selTab[selCount] = "Hång bao tÆng cho ®«i uyªn ­¬ng/give_present";	
	end;
	if is_field_owner() == 1 then
		selCount = selCount + 1;
		selTab[selCount] = "§a t¹ Hû n­¬ng ®· thay ta nhËn Hång bao, b©y giê cã thÓ cho ta xin l¹i./get_present";	
	end;
	selCount = selCount + 1;
	selTab[selCount] = "Kh«ng cã viÖc g×/cancel";
	Say(caption,getn(selTab),selTab);
end
--ÊÇ²»ÊÇ³¡µØµÄÖ÷ÈË
function is_field_owner()
	local name = GetName()
	if name == GetMissionS(MS_BRIDEGROOM) or name == GetMissionS(MS_BRIDE) then
		return 1;
	else
		return 0;
	end;
end;

function give_present()
	local selTab = {
			"TÆng "..ITEM_HONGBAO[1][4].."1/#give_present_confirm(1)",
			"TÆng "..ITEM_HONGBAO[2][4].."1/#give_present_confirm(2)",
			"TÆng "..ITEM_HONGBAO[3][4].."1/#give_present_confirm(3)",
			"§Ó ta xem/cancel",
			}
	Say(g_InfoHeader.."Kh«ng biÕt ®¹i hiÖp muèn tÆng lo¹i Hång bao nµo?",getn(selTab),selTab);
end;

function give_present_confirm(nType)
	if GetMissionV(MV_FIELD_STATE) == MS_STATE_COMPLETE then
		Talk(1,"",g_InfoHeader.."Ng­¬i ®· cã lßng, nh­ng tiÕc lµ h«n lÔ ®· kÕt thóc, hay lµ tËn tay trao cho hä vËy nhÐ!");
		return 0;
	end;
	if DelItem(ITEM_HONGBAO[nType][1],ITEM_HONGBAO[nType][2],ITEM_HONGBAO[nType][3],1) == 1 then
		Say(g_InfoHeader.."§a t¹ ®¹i hiÖp, ta sÏ chuyÓn cho hä.",0);
		Msg2MSAll(MISSION_ID,GetName().."Göi cho ®«i uyªn ­¬ng"..ITEM_HONGBAO[nType][4].."1");
		local nCurrHongBao = GetMissionV(MV_DAHONGBAO_COUNT+nType-1);
		SetMissionV(MV_DAHONGBAO_COUNT+nType-1,nCurrHongBao+1)
		WriteLog("[KÕt h«n]:"..GetName().."Hång bao, lo¹i:"..nType);
	else
		Talk(1,"",g_InfoHeader.."Ng­¬i kh«ng mang theo"..ITEM_HONGBAO[nType][4].."? Hay lµ bÊt cÈn lµm r¬i ®©u råi?");
	end;
end;

function get_present()
	if GetSex() == 2 then
		Talk(1,"",g_InfoHeader.."T©n n­¬ng mang nhiÒu hång bao nh­ vËy kh«ng an toµn, hay lµ ®îi t©n lang ®Õn");
		return 0;
	end;
	local selTab = {
			"§ång ý/get_present_confirm",
			"Ta sÏ l·nh sau vËy!/cancel",
			}
	local nDaHongBao = GetMissionV(MV_DAHONGBAO_COUNT);
	local nZhongHongBao = GetMissionV(MV_ZHONGHONGBAO_COUNT);
	local nXiaoHongBao = GetMissionV(MV_XIAOHONGBAO_COUNT);
	local sString = "";
	if nDaHongBao > 0 then
		sString = sString..nDaHongBao.." §¹i hång bao Hoµng Kim,"
	end;
	if nZhongHongBao > 0 then
		sString = sString..nZhongHongBao.." §¹i hång bao Tö Kim,"
	end;
	if nXiaoHongBao > 0 then
		sString = sString..nXiaoHongBao.." Hång bao,"
	end;
	if sString == "" then
		Talk(1,"main",g_InfoHeader.."VÉn ch­a nhËn ®­îc Hång bao.");
		return 0;
	end;
	Say(g_InfoHeader.."TÊt c¶ sè Hång bao ®Òu ë ®©y, cã tÊt c¶"..sString.."Ng­¬i lÊy hÕt sè Hång bao chø?",getn(selTab),selTab);
end;

function get_present_confirm()
	if gf_JudgeRoomWeight(4,5) == 0 then
		Talk(1,"",g_InfoHeader.."Kho¶ng trèng trong hµnh trang kh«ng ®ñ!");
		return 0;
	end;
	local nDaHongBao = GetMissionV(MV_DAHONGBAO_COUNT);
	local nZhongHongBao = GetMissionV(MV_ZHONGHONGBAO_COUNT);
	local nXiaoHongBao = GetMissionV(MV_XIAOHONGBAO_COUNT);
	SetMissionV(MV_DAHONGBAO_COUNT,0);
	SetMissionV(MV_ZHONGHONGBAO_COUNT,0);
	SetMissionV(MV_XIAOHONGBAO_COUNT,0);
	if nDaHongBao > 0 then
		AddItem(ITEM_HONGBAO[1][1],ITEM_HONGBAO[1][2],ITEM_HONGBAO[1][3],nDaHongBao);
		WriteLog("[KÕt h«n]:"..GetName().."NhËn ®­îc"..nDaHongBao.." §¹i hång bao Hoµng Kim");
		Msg2Player("B¹n nhËn ®­îc "..nDaHongBao.."c¸i"..ITEM_HONGBAO[1][4]);
	end;
	if nZhongHongBao > 0 then
		AddItem(ITEM_HONGBAO[2][1],ITEM_HONGBAO[2][2],ITEM_HONGBAO[2][3],nZhongHongBao);
		WriteLog("[KÕt h«n]:"..GetName().."NhËn ®­îc"..nZhongHongBao.." §¹i hång bao Tö Kim");
		Msg2Player("B¹n nhËn ®­îc "..nZhongHongBao.."c¸i"..ITEM_HONGBAO[2][4]);
	end;
	if nXiaoHongBao > 0 then
		AddItem(ITEM_HONGBAO[3][1],ITEM_HONGBAO[3][2],ITEM_HONGBAO[3][3],nXiaoHongBao);
		WriteLog("[KÕt h«n]:"..GetName().."NhËn ®­îc"..nXiaoHongBao.." TiÓu hång bao");
		Msg2Player("B¹n nhËn ®­îc "..nXiaoHongBao.."c¸i"..ITEM_HONGBAO[3][4]);
	end;
end;
--×ª»»×´Ì¬
function changefightstate()
	local tMsg = {"H«m nay lµ ngµy ®¹i hû cña 2 vÞ, h·y h­ëng h¹nh phóc, xin ®õng ®éng thñ.",
				"Kh«ng hæ lµ giang hå n÷ nhi, cho c¸c vÞ quan kh¸ch nµy thÊy tµi vâ nghÖ ®i",
				}
	SetFightState(1-GetFightState());
	Say(g_InfoHeader..tMsg[GetFightState()+1],0);
end

function init()
	local mapid, x, y = GetWorldPos()
	local param2 = encode_param2(curr_period(), map_field2type[mapid])
	ApplyRelayShareData(KEY_WEDDING, curr_date(), param2, CALLBACK_FILE, "hook_recvsubs")
	WriteLog("[KÕt h«n]: Hû n­¬ng s©n khÊu kÕt h«n, tham sè 1:"..curr_date()..", tham sè 2:"..param2);
end

-- »Øµ÷º¯Êý£º¶ÁÈ¡³¡µØÔ¤¶©ÐÅÏ¢
function hook_recvsubs(key, param1, param2, count)
	-- ¸Ã³¡µØ¸ÃÊ±¶Î¿ÕÏÐ
	if (count ~= 0) then
		this_date = param1
		local this_period, type = decode_param2(param2)	
		local wife, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_WIFE)
		local role, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_ROLE)
		
		SetMissionS(MS_BRIDEGROOM,role)
		SetMissionS(MS_BRIDE,wife)
		this_bridegroom = role;
		this_bride = wife;
	end
	this_date = curr_date()
	this_period = curr_period()
	g_inited = 1;
	map_talk = {
		{
			"§«i phu thª b­íc vµo s¶nh ®­êng, kh«ng khÝ t­ng bõng h¼n lªn.",
			"H«m nay lµ ngµy ®¹i hû cña ®«i t©n n­¬ng vµ t©n lang! §a t¹ c¸c vÞ ®· ®Õn chóc mõng."
		},
		{
			"T©n n­¬ng s¾p lªn kiÖu hoa, h·y ®èt ph¸o lªn!",
			"§éi kh¨n ®á~®èt ph¸o!"
		},
		{
			"T©n n­¬ng vµ t©n lang ®ãn kh¸ch, buæi tiÖc s¾p b¾t ®Çu!",
			"Mêi c¸c vÞ vµo bµn nhËp tiÖc!"
		},
		{
			"T©n lang vµ t©n n­¬ng s¾p b¸i thiªn ®Þa, chuÈn bÞ ph¸o vµ lÔ hoa",
			"Xin c¸c vÞ quan kh¸ch chuÈn bÞ ph¸o vµ lÔ hoa chóc phóc cho ®«i t©n t©n lang vµ t©n n­¬ng!"
		},
		{
			"Mêi quan kh¸ch ¨n kÑo mõng!",
			"Chóc cho t©n lang vµ t©n n­¬ng ®Çu b¹c r¨ng long. Chóc cho nh÷ng ng­êi ch­a yªu gÆp ®­îc ng­êi trong méng!"
		},
		{
			"Lóc nµy c¸c vÞ quan kh¸ch cã thÓ göi quµ tÆng cho t©n phu thª!",
			"Quµ lín, quµ nhá còng ®Òu lµ lßng thµnh c¶. Xin ®a t¹ c¸c vÞ ®· ®Õn dù!"
		},
		{
			"H«n lÔ kÕt thóc! T©n lang vµ t©n n­¬ng chuÈn bÞ ®éng phßng!",
			"T©n lang, t©n n­¬ng vµo phßng hoa chóc~"
		},
	}
	main()
	WriteLog("[KÕt h«n]: S©n khÊu kÕt h«n kÕt thóc, tham sè 1:"..param1..", tham sè 2:"..param2);
end

-- »ñÈ¡»éÀñ³¡µØÉÏÐÂ»é·ò¸¾µÄÃû×Ö
function get_couple()
	return GetMissionS(MS_BRIDEGROOM), GetMissionS(MS_BRIDE)
end


function have_wedding()
	Say(g_InfoHeader.."Theo ng­êi x­a nghi thøc h«n lÔ gåm c¸c b­íc sau:",
		8,
		"Nghinh th©n/#wedding_process(1)",
		"Tam s¸t/#wedding_process(2)",
		"§éi kh¨n/#wedding_process(3)",
		"b¸i thiªn ®Þa/#wedding_process(4)",
		"Th¸o kh¨n/#wedding_process(5)",
		"TÆng vµng/#wedding_process(6)",
		"§éng phßng/#wedding_process(7)",
		"ThuyÕt minh/wedding_process_info",
		"Trang tr­íc./main")
end

function wedding_process(step)
	Say(g_InfoHeader..map_talk[step][1],
		2,
		format("§ång ý/#confirm(%d)", step),
		"Hñy bá/cancel")
end

function confirm(step)
	if step == 4 then	--°ÝÌìµØ
		SetMissionV(MV_CAN_MARRY,1);	--¿ÉÒÔ½á»éÁË
	end;
	Msg2MSAll(MISSION_ID,map_talk[step][2])
end

--»éÀñÁ÷³ÌËµÃ÷
function wedding_process_info()

local Talk_str = {
	g_InfoHeader.."<color=yellow>Nghinh th©n<color> §ãn kh¸ch vµo s©n khÊu kÕt h«n, b»ng h÷u cã thÓ ®Õn <color=yellow>DÞch vô h«n nh©n<color> mua <color=yellow>LÔ hoa<color>cho kh«ng khÝ thªm phÇn høng khëi.",
	g_InfoHeader.."<color=yellow>Tam s¸t<color> gåm Thanh d­¬ng, ¤ kª vµ Thanh ng­u. T­¬ng truyÒn chóng th­êng c¶n ®­êng kh«ng cho ng­êi míi vµo nhµ, v× vËy ph¶i <color=yellow>®èt ph¸o<color> ®Ó xua ®uæi chóng",
	g_InfoHeader.."<color=yellow>§éi kh¨n<color> T©n n­¬ng ®éi kh¨n ®á t­îng tr­ng cho gi÷a 2 ng­êi ®· cã mèi d©y liªn kÕt kh«ng thÓ l×a xa.",
	g_InfoHeader.."<color=yellow>B¸i thiªn ®Þa<color> §Ó t¹ ¬n trêi ®Êt. §«i t©n lang, t©n n­¬ng tõ nay sÏ sèng ®Õn ®Çu b¹c r¨ng long, con ch¸u ®Çy ®µn.",
	g_InfoHeader.."<color=yellow>Th¸o kh¨n<color> T­îng tr­ng cho t©n phu thª sÏ sím sinh quý tö, cuéc sèng h¹nh phóc, con c¸i thµnh ®¹t.",
	g_InfoHeader.."<color=yellow>TÆng tiÒn vµng<color>, th­êng ®­îc ®Ó vµo hång bao, mong muèn cho ®«i phu thª cã cuéc sèng sung tóc. Hång bao cã tÓh mua ë <color=yellow>DÞch vô h«n nh©n<color>",
	g_InfoHeader.."<color=yellow>§éng phßng<color> nghi thøc sau cïng trong h«n lÔ.",	
	}
	
	Talk(getn(Talk_str),"",Talk_str);

end

map_bless = {
	"Thiªn T¸c Hîp", 
	"T©m t©m t­¬ng ¸nh",
	"VÜnh KÕt §ång T©m",
	"T­¬ng Th©n T­¬ng ¸i",
	"B¸ch Niªn H¶o Hîp",
	"VÜnh Dôc ¸i Hµ",
	"Giai NgÉu Thiªn Thµnh",
	"B¹ch §Çu Giai L·o", 
	"B¸ch Niªn CÇm S¾t", 
	"B¸ch Niªn Giai L·o",
	"§oµn tô sum vÇy",
	"Phóc Léc Uyªn ¦¬ng",
	"Thiªn duyªn trïng hîp",
	"Mü m·n l­¬ng duyªn",
	"Trai tµi g¸i s¾c",
	"T©m ®Çu ý hîp",
	"Phu x­íng phô tïy",
	"Xøng ®«i võa løa",
	"Hoa th¬m tr¸i ngät",
	"CÊm s¾t hîp minh",
	"T­¬ng kÝnh nh­ t©n",
	"§ång ®øc ®ång t©m", 
	"Nh­ cæ cÊm s¾t",
	"Hoa khai tÞnh ®Õ",
	"§Õ kÕt l­¬ng duyªn",
	"Duyªn ®Ýnh tam sinh",
	"Uyªn uyªn bÝch hîp",
	"V¨n §Þnh C¸t T­êng",
	"Nh©n duyªn t­¬ng phèi", 
	"B¹ch thñ thµnh ­íc",
	"Minh kÕt l­¬ng duyªn"
}

function bless_talk(talk)
	Say(g_InfoHeader.."Cã muèn göi lêi chóc ®Õn ®«i t©n phu thª kh«ng? HÖ thèng sÏ chuyÓn lêi chóc cña b¹n lªn dßng th«ng b¸o. ChØ cÇn tèn <color=red>"..COST_BLESS.."<color> ng©n l­îng. Xin chän c©u chóc",
		getn(talk), talk)
end

STEP_COUNT = 8
function bless(step)
	local talk = {}
	local index = 0
	local from = floor((step - 1) * STEP_COUNT + 1)
	local to = floor(step * STEP_COUNT)
	if (to > getn(map_bless)) then
		to = getn(map_bless)
	end
	
	for i = from, to do
		index = index + 1
		talk[index] = format("%s/#process_bless(%d)", map_bless[i], i)
	end
	if (from ~= 1) then
		index = index + 1
		talk[index] = format("Trang tr­íc/#bless(%d)", floor(step - 1))
	end
	if (to ~= getn(map_bless)) then
		index = index + 1
		talk[index] = format("Trang kÕ/#bless(%d)", floor(step + 1))
	end
	talk[index + 1] = "§Ó ta nghÜ l¹i/cancel"
	
	bless_talk(talk)	
end

function process_bless(index)
	if (Pay(COST_BLESS*10000) ~= 1) then
		Talk(1, "", g_InfoHeader.."Ng­¬i kh«ng ®ñ ng©n l­îng")
		return
	end
	local husband, wife = get_couple()
	Msg2MSAll(MISSION_ID,format("%s chóc %s vµ %s%s",
		GetName(),
		husband,
		wife,
		map_bless[index]))
end

-- ¾ÆÏ¯
function feast()
	local selTab = {
				"Xem mãn ¨n trªn bµn thÕ nµo/see_feast",
				"Ta ph¶i gäi thøc ¨n ®·i kh¸ch/add_foods",
				"T¹m thêi kh«ng cÇn/cancel",
				}
	Say(g_InfoHeader.."H«m nay lµ ngµy ®¹i hû, cã bao nhiªu quan kh¸ch ®Õn chóc mõng. H·y træ tµi nÊu n­íng cña b¹n ®·i quan kh¸ch ®i nµo!",getn(selTab),selTab);
end

function see_feast()
	local sFoodString = MR_GetFoodsString(2)
	local selTab = {
			"Gäi thøc ¨n th«i/add_foods",
			"§Ó ta xem/cancel",
			}
	if sFoodString == "" then
		Say(g_InfoHeader.."Trªn bµn tiÖc ®· kh«ng cßn thøc ¨n, gäi thªm thøc ¨n cho kh¸ch chø?",getn(selTab),selTab);
		return 0;
	end;
	Say(g_InfoHeader.."HiÖn vÉn cßn"..sFoodString.."Cã ph¶i gäi thªm thøc ¨n kh«ng?",getn(selTab),selTab				);
end;

function add_foods()
	local selTab = {
			"Kh«ng sao, phiÒn b»ng h÷u qu¸/add_foods_check",
			"§Ó ta nghÜ xem cÇn ph¶i dän mãn g×/cancel",
			}
	Say(g_InfoHeader.."V× ®Ó thuËn tiÖn cho c¸c ng­¬i, ta sÏ <color=yellow>dän tÊt c¶ c¸c mãn ¨n lªn cïng mét lóc<color>. Kh«ng vÊn ®Ò g× chø?",getn(selTab),selTab);
end;

function add_foods_check()
	local sFoodString = MR_GetFoodsString(1);
	if sFoodString == "" then
		Talk(1,"",g_InfoHeader.."Ng­¬i ch­a chuÈn bÞ mãn ¨n µ?");
		return 0;
	end;
	local selTab = {
			"Lµ nh÷ng mãn nµy, dän lªn th«i/add_foods_confirm",
			"Ta suy nghÜ l¹i/cancel",
			}
	Say(g_InfoHeader.."C¸c mãn dän lªn gåm cã:"..sFoodString.."Ng­¬i x¸c nhËn lµ nh÷ng mãn nµy chø?",getn(selTab),selTab);
end;

function add_foods_confirm()
	local nCurrFoodCount = 0;
	local nMSValueID = 0;
	local nTag = 0;
	for i=1,getn(tFoods) do
		nFoodCount = GetItemCount(tFoods[i][1],tFoods[i][2],tFoods[i][3]);
		if nFoodCount > 0 then
			DelItem(tFoods[i][1],tFoods[i][2],tFoods[i][3],nFoodCount);
			nMSValueID = MV_FOOD_BEGIN+i-1;
			if nMSValueID < MV_FOOD_BEGIN or nMSValueID > MV_FOOD_END then
				Talk(1,"",g_InfoHeader.."Xin lçi, cã mét chót s¬ xuÊt, thøc ¨n vÉn ch­a dän lªn.");
				return 0;
			end;
			nCurrFoodCount = GetMissionV(nMSValueID);
			SetMissionV(nMSValueID,nCurrFoodCount+nFoodCount);	
			nTag = 1;
		end;
	end;
	if nTag == 1 then
		Talk(1,"",g_InfoHeader.."Thøc ¨n ®· dän lªn bµn tiÖc råi, mêi quý kh¸ch n©ng ly!");
		Msg2MSAll(MISSION_ID,"Nh÷ng mãn ngon nµy ®Òu do T©n n­¬ng vµ t©n lang tù tay chÕ biÕn, mêi quý kh¸ch th­ëng thøc!");
	end;
end;
