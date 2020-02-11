Include("\\script\\lib\\globalfunctions.lua");

function VipCareAward()
-- Award define
	local tbAwards = {
			{item = {2, 1, 30071, 6, 1}, name = "Nh©n s©m v¹n n¨m" },
			{item = {2, 1, 1125, 6, 4}, name = "B¸nh Ýt b¸t b¶o"},
			{item = {2, 1, 9998, 6, 4}, name = "Qu©n C«ng §¹i", expdate = 7*24*3600}
		}
-- condition define
	local nExtPoint = 0
	local nQty = 1
	local nStartDate = 20120420
	local nEndDate = 20120722
	local tbDayOfWeek = {6, "Thø B¶y"}
-- get condition
	local nDate = tonumber(date("%Y%m%d"))
	local nReceiveDate = floor(mod(GetExtPoint(nExtPoint),1000000000)/10)
	local nVipID = 0
	local tbVipList = {
		"0oquangchinhtvxdo0",
		"abcfg20001",
		"arenak55",
		"bexjnh11o2",
		"blackplayzinhvltk2",
		"boycodon9524",
		"brianhuynh99",
		"caicapda69",
		"cancerty119",
		"caothanhhaihcm",
		"caovienduong07",
		"captuong",
		"cavethoiloan14hh",
		"chieubien9990",
		"chip1tuoi2",
		"chungainhung1",
		"cobeanchoikosotontien",
		"daicatunghcm",
		"damviettuy",
		"debleu",
		"dethichthien2014",
		"diablo1hg",
		"dieptruongtho2010",
		"dkienbn",
		"doccosau1977",
		"dohuunghiem2",
		"doibonba83",
		"dungtan011",
		"dungvolabem",
		"duybv1979",
		"duylong91x",
		"duyphamvn2010",
		"duyxitin123",
		"feedingfrenzy1306",
		"gamegroup25",
		"giangnhatthien",
		"giaosi1",
		"girlsolo113",
		"gunsandroses1991",
		"hahathangcoi",
		"happycookie",
		"hemeone5",
		"hiepdg5",
		"hieudcpvp",
		"hieukute1993pandaa",
		"hieungan201119872011",
		"hisumit",
		"hklb12072010",
		"hoadang19862",
		"hoangkim19102010",
		"hungnguyen504",
		"hvan2811",
		"ifishy",
		"imcoolmate",
		"jackalvn2007",
		"kazakima",
		"kelvinluubi",
		"kenyngoc1",
		"kienxuongn01",
		"kiepbui68",
		"kissdo37",
		"kisskiss1101",
		"kiwaxaki3",
		"kuteonline0nlin3",
		"kuti231188",
		"lamlaitudau031189",
		"langtudaohoand9x",
		"lbhk7888",
		"leeaehya01",
		"legiahienyeudau",
		"lethanhtamdaomanhquan",
		"loangianghovltk2",
		"luongnguyengiahuy2709",
		"mac01022512",
		"macthienbinh",
		"mamaychanhoi",
		"mapchua1986",
		"mavuvuong",
		"maxtt1",
		"megai79",
		"minhtamproductions",
		"missellyfei1987",
		"motthoilamlo27",
		"mrkyniem",
		"mrsoai41284",
		"mttaicaobang",
		"mumyeu1987",
		"mypham1405",
		"ngocduonggia",
		"ngocnhu",
		"ngoctt1976",
		"ngoduyphuonghn1617",
		"ngothanhtrungkr",
		"ngudaidocton1325",
		"nguyenbalong2008",
		"nguyentandat0978290392",
		"nhipcaumuaban",
		"nhocvip14",
		"nhonvan",
		"nhoxconvolam1989",
		"nhtl040419",
		"nhucaothang",
		"nhucaothang19923",
		"ninhhiepvillage",
		"owenxddd0919494919",
		"phandinhkhiem0780",
		"quanlyduantp79",
		"quockute2408",
		"quyxam102",
		"radiatingoriental",
		"rose01tc",
		"salemkizz",
		"sangnghi2008",
		"sanhngu1111",
		"soemden007",
		"soibac871",
		"tab1989",
		"takimchi300",
		"tano410",
		"tantriquaidao77",
		"tanxaccavolam12",
		"teacherdang1978",
		"teo0972",
		"thanhanvn0780",
		"thanhbinh16121989",
		"thanhkhietcm7500",
		"thientamthapdaily",
		"thieulamdze75",
		"thu7cooi",
		"thunglao",
		"thuongthuong256",
		"tienhoatb007",
		"timquen86",
		"trangiantuyetmy",
		"tranhoaihan757vn",
		"trucquan2910",
		"tuanlong842000",
		"tuantu0610187",
		"tunx99",
		"tuthanhda0001",
		"tyevil",
		"tyxixon",
		"ututut38",
		"vangphong01234",
		"vantuongchl",
		"vb0513",
		"viaikiemtien",
		"vietcuongkr1",
		"vietnamesehacker",
		"viphklb00021",
		"viphklb0004",
		"vohoangchuong1974",
		"volam144114",
		"volam2029775",
		"volam2192620",
		"volam2202287",
		"volam5820434",
		"vuatocdo892008",
		"vuhoaivan89",
		"vymiracle",
		"vynty2003",
		"wh4th3ph0",
		"xacmuoivn",
		"xuyenanhyeuem",
		"yaphetsasd",
		"zkhoaipro",
		"zz2112zz"}

-- Check date
	if nDate<nStartDate or nEndDate<nDate then
		Talk(1,"","HiÖn t¹i kh«ng ph¶i thêi gian trao th­ëng, ta kh«ng thÓ tiÕp c¸c h¹")
		return
	end
		
--	Check day of week
--	if tonumber(date("%w")) ~= tonumber(tbDayOfWeek[1]) then
--		Talk(1,"","H«m nay ch­a ®Õn ngµy ph¸t th­ëng, "..tbDayOfWeek[2].." c¸c h¹ h·y quay l¹i nhÐ.")
--		return
--	end
	
-- Check VIP list
	for i=1,getn(tbVipList) do
		if strupper(tbVipList[i])==strupper(GetAccount()) then
			nVipID = i
			break
		end
	end
	if nVipID==0 then
		Talk(1,"","C¸c h¹ kh«ng n»m trong danh s¸ch nhËn th­ëng.")
		return
	end
	
	-- Check hanh trang, suc luc
	if gf_Judge_Room_Weight(18,200)==0 then
		Talk(1,"","Hµnh trang c¸c h¹ kh«ng ®ñ 18 chç trèng hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i hµnh trang.")
		return
	end
	
-- Check receive
	if GetBit(GetExtPoint(nExtPoint),1) == 1 then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng tuÇn nµy, tuÇn sau h·y quay l¹i nhÐ..")
		return
	end
	
-- Receive bonus	
	-- Nhan bach cau tien don
	SetTask(GLB_TASK_BAIJUXIANDAN, GetTask(GLB_TASK_BAIJUXIANDAN) + 6800);
	gf_WriteLogEx("Vipcare", "nhËn", 6800, "B¹ch CÇu Tiªn §¬n");
	
	-- Nhan Tam thanh tien don
	EatSanqin(3, 6800);
	gf_WriteLogEx("Vipcare", "nhËn", 6800, "Tam Thanh Tiªn §¬n");

	-- Nhan Luc than tien don
	EatLiushen(3, 6800);
	gf_WriteLogEx("Vipcare", "nhËn", 6800, "Lôc ThÇn TIªn §¬n");

	-- Nhan item
	for i=1,getn(tbAwards) do
		gf_AddItemEx2(tbAwards[i]["item"], tbAwards[i]["name"], "Vipcare", "nhËn", tbAwards[i]["expdate"])
	end
	
	-- Set ExtPoint
	local nExtValue = GetExtPoint(nExtPoint)
	nExtValue = SetBit(nExtValue,1,1)
	PayExtPoint(nExtPoint, GetExtPoint(nExtPoint))
	AddExtPoint(nExtPoint, nExtValue)
	Msg2Player("C¸c h¹ ®· nhËn ®­îc phÇn th­ëng VIP h«m nay");
	
end