-- =========================================================
-- File: 神行宝典的脚本
-- Name: shenxingbaodian.lua
-- ID:   0, 200, 39
-- Desc: 使用后去到指定地点，同时消耗一定的耐久度
-- Creator: Tony(Jizheng)
-- Date: Nov 30th, 2006
-- =========================================================


--这是一个描述神行宝典所能到达的地点的数据结构
--可以很方便地根据这个结构来算出到达某一目的所要进行的神行宝典操作顺序，如第一页对话选第几项，第二页对话选第几项，etc
TB_DES_INFO = 
--目的地，目的地描述，消耗耐久，到目的地后地战斗状态
{
	[1] = 	--我想去练级地图
	{
		[0] = "练级地图",
		[1] = {21,"二龙山",3,1},
		[2] = {22,"剑门关",3,1},
		[3] = {24,"苗岭",3,1},
		[4] = {30,"杏花村",3,1},
		[5] = {31,"入门迷宫 1",3,1},
		[6] = {32,"入门迷宫 2",3,1},
		[7] = {33,"野猪林",3,1},
		[8] = {34,"龙泉村",3,1},
		[9] = {35,"暮雪山庄",3,1},
		[10] = {36,"乌蒙部",3,1},
		[11] = {37,"云梦泽",3,1},
		[12] = {38,"灵宝山",3,1},
		[13] = {39,"江津村",4,1},
		[14] = {40,"武陵山",3,1},
		[15] = {41,"武陵山角",3,1},
		[16] = {42,"清溪洞",3,1},
		[17] = {43,"少林密室-1",3,1},
		[18] = {44,"少林密室-2",3,1},
		[19] = {45,"祥云洞",3,1},
		[20] = {46,"阳中洞-1",3,1},
		[21] = {47,"阳中洞-2",4,1},
		[22] = {48,"阳中洞-3",5,1},
		[23] = {49,"冰心洞-1",4,1},
		[24] = {50,"冰心洞-2",5,1},
		[25] = {51,"竹丝洞-1",3,1},
		[26] = {52,"竹丝洞-2",4,1},
		[27] = {53,"七星洞-1",3,1},
		[28] = {54,"七星洞-2",4,1},
		[29] = {55,"雁门关",3,1},
		[30] = {56,"剑阁蜀道",3,1},
		[31] = {57,"点苍山",3,1},
		[32] = {58,"武夷山",3,1},
		[33] = {59,"伏牛山",3,1},
		[34] = {60,"梁山泊",3,1},
		[35] = {61,"两水洞-1",4,1},
		[36] = {62,"两水洞-2",5,1},
		[37] = {63,"金光洞",3,1},
		[38] = {64,"青城山",3,1},
		[39] = {65,"封魔洞-1",4,1},
		[40] = {66,"封魔洞-2",5,1},
		[41] = {67,"燕子洞-1",3,1},
		[42] = {68,"燕子洞-2",4,1},
		[43] = {69,"黑风洞",3,1},
		[44] = {70,"龙虎洞-1",3,1},
		[45] = {71,"龙虎洞-2",4,1},
		[46] = {72,"凤眼洞",3,1},
		[47] = {73,"白水洞-1",3,1},
		[48] = {74,"白水洞-2",4,1},
		[49] = {75,"东海海滨-1",3,1},
		[50] = {76,"东海海滨-2",4,1},
		[51] = {77,"龙眼洞-1",6,1},
		[52] = {78,"龙眼洞-2",7,1},
		[53] = {79,"天师洞-1",5,1},
		[54] = {80,"天师洞-2",6,1},
		[55] = {81,"丰都",6,1},
		[56] = {82,"大草原-1",3,1},
		[57] = {83,"大草原-2",4,1},
		[58] = {84,"王旗部落",4,1},
		[59] = {85,"桃花岛",5,1},
		[60] = {86,"Qu?M玭 H錳 Lang",7,1},
		[61] = {87,"清音洞-1",5,1},
		[62] = {88,"清音洞-2",6,1},
		[63] = {89,"西双版纳北部",5,1},
		[64] = {90,"西双版纳南部",6,1},
		[65] = {91,"千寻塔-1",6,1},
		[66] = {92,"千寻塔-2",7,1},
		[67] = {93,"千寻塔-3",8,1},
		[68] = {94,"王母洞-1",6,1},
		[69] = {95,"王母洞-2",7,1},
		[70] = {96,"王母洞-3",8,1},
		[71] = {98,"Thi猲 s?b?c秐h",8,1},
		[72] = {99,"B綾 Ph鬾g Tng",4,1},
		[73] = {100,"凤翔府南",4,1},
		[74] = {101,"龙门镇",5,1},
		[75] = {102,"光明顶",7,1},
		[76] = {103,"秦始皇陵",8,1},
		[77] = {104,"秦始皇陵-1",9,1},
		[78] = {105,"秦始皇陵-2",10,1},
		[79] = {106,"古阳洞-1",8,1},
		[80] = {107,"古阳洞-2",9,1},
		[81] = {108,"药王谷",9,1},
		[82] = {109,"药王洞",10,1},
		[83] = {110,"沙漠迷宫",10,1},
		[84] = {111,"???",4,1},
	},
	[2] = 	--我想去门派地图
	{
		[0] = "门派地图",
		[1] = {"NewWorld(204,1599,3182)","少林",5,0,1},
		[2] = {"NewWorld(312,1825,3323)","武当",5,0,1},
		[3] = {"NewWorld(209,1547,3183)","丐帮",5,0,1},
		[4] = {"NewWorld(303,1645,3159)","峨嵋",5,0,1},
		[5] = {"NewWorld(305,1598,2824)","唐门",5,0,1},
		[6] = {"NewWorld(219,1538,3151)","天波杨府",5,0,1},
		[7] = {"NewWorld(407,1609,3193)","五毒教",5,0,1},
		[8] = {"NewWorld(509,1424,3444)","昆仑",5,0,1},
		[9] = {"NewWorld(404,1484,2828)","翠烟",5,0,1},
	},
	[3] = 	--我想去功能NPC处
	{
		[0] = "功能NPC",
		[1] = 
		{
			[0] = "汴京",
			[1] = {"NewWorld(200,1488,2953)","物品保管人 东",5,0},
			[2] = {"NewWorld(200,1296,2990)","物品保管人 南",5,0},
			[3] = {"NewWorld(200,1272,2774)","物品保管人 西",5,0},
			[4] = {"NewWorld(200,1183,2826)","野叟",5,0},
			[5] = {"NewWorld(200,1169,2845)","出生点",5,0},
			[6] = {"NewWorld(200,1360,2925)","商会老板",5,0},
			[7] = {"NewWorld(200,1439,2956)","Thng nh﹏ T﹜ V鵦",5,0},
			[8] = {"NewWorld(200,1482,2764)","礼官",5,0},
			[9] = {"NewWorld(200,1392,2659)","捕头",5,0},
			[10] = {"NewWorld(200,1150,2850)","神游真人",5,0},
			[11] = {"NewWorld(200,1228,2761)","藏剑使者",5,0},
			[12] = {"NewWorld(200,1379,2870)","周末活动大使",5,0},
			[13] = {"NewWorld(200,1401,2663)","赵普",5,0},
			[14] = {"NewWorld(200,1392,2817)","比武大会",5,0},
		},
		[2] = 
		{
			[0] = "成都",
			[1] = {"NewWorld(300,1682,3652)","物品保管人 南",5,0},
			[2] = {"NewWorld(300,1693,3460)","物品保管人 西",5,0},
			[3] = {"NewWorld(300,1925,3473)","物品保管人 北",5,0},
			[4] = {"NewWorld(300,1634,3549)","野叟",5,0},
			[5] = {"NewWorld(300,1653,3559)","武师",5,0},
			[6] = {"NewWorld(300,1897,3492)","商会老板",5,0},
			[7] = {"NewWorld(300,1794,3608)","Thng nh﹏ T﹜ V鵦",5,0},
			[8] = {"NewWorld(300,1787,3497)","礼官",5,0},
			[9] = {"NewWorld(300,1779,3473)","捕头",5,0},
			[10] = {"NewWorld(300,1974,3552)","神游真人",5,0},
			[11] = {"NewWorld(300,1776,3701)","藏剑使者",5,0},
			[12] = {"NewWorld(300,1742,3549)","攻城大使",5,0},
			[13] = {"NewWorld(300,1728,3536)","城市管理者",5,0},
			[14] = {"NewWorld(300,1822,3378)","镖师",5,0},
			[15] = {"NewWorld(300,1840,3570)","擂台",5,0},
			[16] = {"NewWorld(300,1959,3545)","周善人",5,0},
		},
		[3] = 
		{
			[0] = "泉州",
			[1] = {"NewWorld(100,1554,3075)","物品保管人 东",5,0},
			[2] = {"NewWorld(100,1387,2902)","物品保管人 西",5,0},
			[3] = {"NewWorld(100,1518,2869)","物品保管人 北",5,0},
			[4] = {"NewWorld(100,1447,2800)","野叟",5,0},
			[5] = {"NewWorld(100,1459,2811)","出生点",5,0},
			[6] = {"NewWorld(100,1537,2933)","商会老板",5,0},
			[7] = {"NewWorld(100,1499,3059)","大街上...",5,0},
			[8] = {"NewWorld(100,1512,2990)","礼官",5,0},
			[9] = {"NewWorld(100,1519,2988)","捕头",5,0},
			[10] = {"NewWorld(100,1381,2857)","神游真人",5,0},
			[11] = {"NewWorld(100,1509,3107)","藏剑使者",5,0},
		},
		[4] = 
		{
			[0] = "扬州",
			[1] = {"NewWorld(150,1757,3178)","物品保管人 东",5,0},
			[2] = {"NewWorld(150,1614,3173)","物品保管人 南",5,0},
			[3] = {"NewWorld(150,1633,3052)","物品保管人 西",5,0},
			[4] = {"NewWorld(150,1727,3073)","物品保管人 北",5,0},
			[5] = {"NewWorld(150,1680,3118)","市中心",5,0},
			[6] = {"NewWorld(150,1635,3139)","商会老板",5,0},
			[7] = {"NewWorld(150,1653,3109)","河边",5,0},
			[8] = {"NewWorld(150,1738,3158)","捕头",5,0},
			[9] = {"NewWorld(150,1744,3121)","藏剑使者",5,0},
			[10] = {"NewWorld(150,1713,3137)","周末活动大使",5,0},
			[11] = {"NewWorld(150,1680,3161)","市中心",5,0},
			[12] = {"NewWorld(150,1650,3174)","紫光阁",5,0},
			[13] = {"NewWorld(150,1600,3136)","媒婆",5,0},
			[14] = {"NewWorld(150,1588,3143)","巧女",5,0},
			[15] = {"NewWorld(150,1711,3046)","婚姻场地使者",5,0},
			[16] = {"NewWorld(150,1701,3170)","市中心",5,0},
		},
		[5] = 
		{
			[0] = "襄阳",
			[1] = {"NewWorld(350,1387,3065)","物品保管人 南",5,0},
			[2] = {"NewWorld(350,1359,2869)","物品保管人 西",5,0},
			[3] = {"NewWorld(350,1532,2861)","物品保管人 北",5,0},
			[4] = {"NewWorld(350,1436,2808)","天门阵",5,0},
			[5] = {"NewWorld(350,1455,2924)","商会老板",5,0},
			[6] = {"NewWorld(350,1497,2882)","Thng nh﹏ T﹜ V鵦",5,0},
			[7] = {"NewWorld(350,1506,2997)","捕头",5,0},
			[8] = {"NewWorld(350,1394,2850)","藏剑使者",5,0},
			[9] = {"NewWorld(350,1452,2968)","周末活动大使",5,0},
			[10] = {"NewWorld(350,1503,3023)","帮会狱卒",5,0},
			[11] = {"NewWorld(350,1415,2930)","刘铁匠",5,0},
			[12] = {"NewWorld(350,1345,2924)","莫三",5,0},
			[13] = {"NewWorld(350,1433,2769)","金山掌门",5,0},
		},
		[6] = 
		{
			[0] = "大理",
			[1] = {"NewWorld(400,1528,3111)","物品保管人 东",5,0},
			[2] = {"NewWorld(400,1455,3070)","物品保管人 南",5,0},
			[3] = {"NewWorld(400,1553,2912)","物品保管人 北",5,0},
			[4] = {"NewWorld(400,1485,3018)","市中心",5,0},
			[5] = {"NewWorld(400,1486,2924)","商会老板",5,0},
			[6] = {"NewWorld(400,1428,3005)","刘典",5,0},
			[7] = {"NewWorld(400,1506,2847)","礼官",5,0},
		},
		[7] = 
		{
			[0] = "凤翔",
			[1] = {"NewWorld(500,1795,3216)","物品保管人 东",5,0},		
			[2] = {"NewWorld(500,1656,3215)","物品保管人 南",5,0},
			[3] = {"NewWorld(500,1677,3095)","物品保管人 西",5,0},
			[4] = {"NewWorld(500,1827,3049)","物品保管人 北",5,0},
			[5] = {"NewWorld(500,1771,3186)","商会老板",5,0},
			[6] = {"NewWorld(500,1893,3113)","捕头",5,0},
			[7] = {"NewWorld(500,1762,3127)","市中心",5,0},
			[8] = {"NewWorld(500,1640,3183)","一个老道不知道干啥",5,0},
		},		
	},
	[4] = 	--我想去生活采集技能师傅处
	{
		[0] = "生活采集技能师傅",
		[1] = {"NewWorld(300,1836,3430)","成都 代矿工 挖矿",3,0},
		[2] = {"NewWorld(300,1848,3493)","成都 黄大婶 抽丝",3,0},
		[3] = {"NewWorld(200,1220,2909)","汴京 刘一斧 伐木",3,0},
		[4] = {"NewWorld(200,1347,3029)","汴京 张猎户 制皮",3,0},
		[5] = {"NewWorld(100,1393,2969)","泉州 莫君道长 集灵",3,0},
		[6] = {"NewWorld(100,1555,2961)","泉州 林药师 采药",3,0},
		[7] = {"NewWorld(100,1603,2968)","泉州 李丰收 收耕",3,0},
	},
	[5] = 	--我想游戏功能地图
	{
		[0] = "游戏功能地图",
		[1] = 
			{
				[0] = "杀手堂",
				[1] = {97,"杀手堂",10,1},
			},
		[2] = 
			{
				[0] = "师门密室",
				[1] = {"NewWorld(204,1644,3270)","少林师门密室",5,0},
				[2] = {"NewWorld(305,1674,2936)","唐门..",5,0},
				[3] = {"NewWorld(303,1715,3059)","峨眉..",5,0},
				[4] = {"NewWorld(209,1530,3209)","丐帮..",5,0},
				[5] = {"NewWorld(312,1871,3276)","武当..",5,0},
				[6] = {"NewWorld(219,1542,2939)","杨门",5,0},
				[7] = {"NewWorld(407,1572,3160)","五毒教..",5,0},
				[8] = {"NewWorld(509,1539,3230)","昆仑..",5,0},
				[9] = {"NewWorld(404,1539,2698)","翠烟",5,0},
		},
		[3] = 
			{
				[0] = "战场",
				[1] = {"NewWorld(200,1291,2873)","雁门关战场 宋",5,0},
				[2] = {"NewWorld(200,1301,2793)","雁门关战场 辽",5,0},
				[3] = {"NewWorld(500,1830,3144)","玉门关小战场",5,0},
				[4] = {"NewWorld(500,1710,3238)","玉门关小战场",5,0},
				[5] = {"NewWorld(808,1645,3180)","雁门关报名点 辽",5,0},
				[6] = {"NewWorld(808,1735,3074)","雁门关报名点 宋",5,0},
				[7] = {"NewWorld(806,1643,3180)","玉门关报名点 辽",5,0},
				[8] = {"NewWorld(806,1733,3073)","玉门关报名点 宋",5,0},
			},
		[4] =
			{ 
				[0] = "西域探秘",
				[1] = {"NewWorld(500,1762,3147)","西域探秘",5,0},
				[2] = {"NewWorld(512,2052,3416)","古阳洞 昆仑弟子",10,1},
				[3] = {"NewWorld(513,1595,3190)","皇陵墓室一层",10,1},
				[4] = {"NewWorld(510,1574,2867)","药王洞 药室看守人",10,1},
				[5] = {"NewWorld(514,1725,2873)","皇陵墓室二层",10,1},
				[6] = {"NewWorld(506,1316,2726)","沙漠迷宫",10,1},
				[7] = {"NewWorld(506,1544,2668)","沙漠迷宫 五行阵使)",10,1},
				[8] = {"NewWorld(507,1651,3304)","Ti觰 Nh?(y課 ti謈 Long M玭)",5,1},
			},
		[5] = 
			{
				[0] = "华山论剑",
				[1] = {"NewWorld(502,1637,3237)","华山",4,0},
				[2] = {"NewWorld(6016,1499,3094)","凌花谷",4,1},
				[3] = {"NewWorld(6024,1652,3093)","铁掌山庄",4,1},
				[4] = {"NewWorld(6025,1699,3397)","藏剑阁",4,1},
			},
	},
}

FLIGHTPOSTASKID_BEGIN = 90
FLIGHTPOSTASKID_1 = 90
FLIGHTPOSTASKID_2 = 91
FLIGHTPOSTASKID_3 = 92
FLIGHTPOSTASKID_4 = 93
FLIGHTPOSTASKID_5 = 94
FLIGHTPOSTASKID_END = 94

Tb_map_caiji = {704,705,706,707,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,6024,6025}
-- 使用物品的时候，默认的入口函数
function OnUse(nIdx)
--	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
--		Talk(1,"","在战斗状态下，要先设置为练功模式才能使用神行宝典。");
--		return 0;
--	end;
	local nMapID = GetWorldPos()
	local caji_map_chk_flag = 0
	for i = 1, getn(Tb_map_caiji) do
		if nMapID == Tb_map_caiji[i] then
			caji_map_chk_flag = 1
			break
		end
	end
	if nMapID == 606 or nMapID == 101 or (nMapID >= 700 and caji_map_chk_flag == 0) then
		Talk(1,"","这个地图不能使用神行");
		return 0;
	end;
	local nScrollIndex = tonumber(nIdx)		-- 被使用的神行宝典的Index
	
	local nleft = AbradeItem(nScrollIndex, 0)
	if (nleft == 0) then
		Say("耐久为0!", 0)
		DelItemByIndex(nScrollIndex, 0)					-- 耐久为0要删除掉物品
	end
	local selTab = {};
	tinsert(selTab,"最近去过的地方/#flight_recently("..nScrollIndex..")");
	for i=1,getn(TB_DES_INFO) do
		tinsert(selTab,"我想去 "..format(TB_DES_INFO[i][0].."/#list_destination(%d,%d)",nScrollIndex,i));
	end;
	tinsert(selTab,"哪也不去！/cancel_dialog");
	Say("骚年想去哪?",getn(selTab),selTab);
end;

function list_destination(nScrollIndex,...)
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nArgSize = arg.n;
	local szCmdStr = "";
	if type(tbDes[1][1]) == "table" then	--还得深入一层
		local selTab = {};
		for i=1,getn(tbDes) do
			arg[nArgSize+1] = i;
			arg.n = nArgSize+1;
			szCmdStr = tbDes[i][0]..get_cmd_string("list_destination",nScrollIndex,gf_UnPack(arg));
			tinsert(selTab,szCmdStr);
		end;
		tinsert(selTab,"回到顶层/#OnUse("..nScrollIndex..")")
		tinsert(selTab,"哪也不去了/cancel_dialog");
		Say("骚年想去哪?",getn(selTab),selTab);
	else
		list_page(1,nScrollIndex,gf_UnPack(arg))
	end;
end;

function gf_UnPack(tbTable,nStartIdx,nEndIdx)
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],gf_UnPack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;

MAX_SEL_PER_PAGE = 7;	--一页最多可显示数量

function list_page(nPageNum,nScrollIndex,...)
	local tbDesTab = get_destination_list(nScrollIndex,gf_UnPack(arg));
	local nRecordCount = getn(tbDesTab);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbDesTab[i]);
	end;
	local szCmdStr = "";
	if nPageNum ~= 1 then
		szCmdStr = "上一页"..get_cmd_string("list_page",nPageNum-1,nScrollIndex,gf_UnPack(arg));
		tinsert(selTab,szCmdStr);
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		szCmdStr = "下一页"..get_cmd_string("list_page",nPageNum+1,nScrollIndex,gf_UnPack(arg));
		tinsert(selTab,szCmdStr);	
	end;
	tinsert(selTab,"回到顶层对话/#OnUse("..nScrollIndex..")")
	tinsert(selTab,"哪也不去了/cancel_dialog");
	local nMaxPage = ceil(getn(tbDesTab)/MAX_SEL_PER_PAGE);
	Say("Ngi mu鑞 n n琲 n祇? Hi謓 l?trang <color=yellow>"..nPageNum.."<color>, t鎛g c閚g <color=yellow>"..nMaxPage.."<color> trang.",getn(selTab),selTab);
end;

function get_destination_list(nScrollIndex,...)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		Talk(1,"","Tr筺g th竔 hi謓 t筰 kh玭g th?s?d鬾g th莕 h祅h.")
		return 0
	end
	local tSelTab = {};
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nArgSize = arg.n;
	local szCmdStr = "";
	for i=1,getn(tbDes) do
		arg[nArgSize+1] = i;
		arg.n = nArgSize+1;
		szCmdStr = tbDes[i][2].."(消耗"..tbDes[i][3].." 耐久)"..get_cmd_string("go_to_destination",nScrollIndex,gf_UnPack(arg));
		tinsert(tSelTab,szCmdStr);
	end;
	return tSelTab;
end;

function go_to_destination(nScrollIndex,...)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		Talk(1,"","Tr筺g th竔 hi謓 t筰 kh玭g th?s?d鬾g th莕 h祅h.")
		return 0
	end
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nCost = tbDes[3];
	local nFightState = tbDes[4];
	CleanInteractive();
	if type(tbDes[1]) == "string" then
		dostring(tbDes[1]);
		AbradeItem(nScrollIndex, nCost);
		SetFightState(nFightState);
	elseif type(tbDes[1]) == "number" then
		AbradeItem(nScrollIndex, nCost);
		UseFlightList(tbDes[1],nScrollIndex,nCost);
	end;
	set_recently_pos(arg)
	Msg2Player("消耗 "..nCost.." 耐久");
end;

-- 去最近的一些地方
function flight_recently(nScrollIndex)
	local tbPosInfo = {};
	for i=FLIGHTPOSTASKID_BEGIN,FLIGHTPOSTASKID_END do
		tinsert(tbPosInfo,GetTask(i));
	end;
	if GetTask(FLIGHTPOSTASKID_BEGIN) == 0 then
		Talk(1,"#OnUse("..nScrollIndex..")","最近你哪也没去过");
		return 0;
	end;
	local selTab = {};
	local tbDes = {};
	local tbIndex = {};
	for i=1,getn(tbPosInfo) do
		tbIndex = get_pos_index(tbPosInfo[i]);
		local szPlaceHeader = "";
		if getn(tbIndex) >= 2 then	--旧的神行getn(tbIndex) == 1
			tbDes = TB_DES_INFO;
			for j=1,getn(tbIndex) do
				tbDes = tbDes[tbIndex[j]];
				--如果tbDes是nil，那么就有可能是任务变量的值出错了
				if tbDes ~= nil and tbDes[0] ~= nil then
					szPlaceHeader = szPlaceHeader..tbDes[0].."--";
				end;
			end;
			if tbDes ~= nil then	--如果是nil值就跳过
				szCmdStr = szPlaceHeader..tbDes[2].."(消耗"..tbDes[3].." 耐久)"..get_cmd_string("go_to_destination",nScrollIndex,gf_UnPack(tbIndex));
				tinsert(selTab,szCmdStr);
			end;
		end;
	end;
	tinsert(selTab,"回顶层对话/#OnUse("..nScrollIndex..")")
	tinsert(selTab,"哪也不去了/cancel_dialog");
	Say("最近去过的地方:",getn(selTab),selTab);
end;
--根据任务变量算出位置的索引
function get_pos_index(nTaskValue)
	local tbRet = {};
	local nIndex1 = mod(nTaskValue,1000);
	local nIndex2 = floor(mod(nTaskValue,100000)/1000);
	local nIndex3 = floor(nTaskValue/100000);
	local tb = {nIndex3,nIndex2,nIndex1};
	for i=1,getn(tb) do
		if tb[i] ~= 0 then
			tinsert(tbRet,tb[i]);
		end;
	end;
	return tbRet;
end;
--计算位置信息值
function generate_pos_index_value(tbPos)
	local nRetValue = 0;
	if getn(tbPos) == 2 then
		nRetValue = tbPos[1]*1000+tbPos[2];
	else
		nRetValue = tbPos[1]*100000+tbPos[2]*1000+tbPos[3];
	end;
	return nRetValue;
end;
-- 设置最近去过的地方
function set_recently_pos(tbPos)
	local nPosTskValue = generate_pos_index_value(tbPos);
	for i=FLIGHTPOSTASKID_BEGIN,FLIGHTPOSTASKID_END do	--向后遍历处理
		if GetTask(i) == nPosTskValue then
			for j=i,FLIGHTPOSTASKID_BEGIN+1,-1 do	--向前遍历处理
				SetTask(j,GetTask(j-1));
			end;
			SetTask(FLIGHTPOSTASKID_BEGIN,nPosTskValue);
			return 1;
		end;
	end;
	for i=FLIGHTPOSTASKID_END,FLIGHTPOSTASKID_BEGIN+1,-1 do	--从后向前遍历
		SetTask(i,GetTask(i-1));
	end;
	SetTask(FLIGHTPOSTASKID_BEGIN,nPosTskValue);
	return 1;
end;

function get_cmd_string(szCallBackFunc,...)
	local szCmdStr = "";
	szCmdStr = "/#"..szCallBackFunc.."(";
	for i=1,getn(arg) do
		szCmdStr = szCmdStr.."%d,"
	end;
	szCmdStr = strsub(szCmdStr,1,strlen(szCmdStr)-1);
	szCmdStr = szCmdStr..")";	--把最后面那个逗号换成右括号
	szCmdStr = format(szCmdStr,gf_UnPack(arg));
	return szCmdStr;
end;

function cancel_dialog()
end;


