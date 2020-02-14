--《八卦宝典》脚本
--by vivi
--08/10/2007

Include("\\script\\task\\lingshi_task.lua")

--套装衣服table
tTaoZhuang = {
	{"Ngi m筺h","Kh玭","Kh秏","礽","Ly","T╪g S鴆 m筺h v? G﹏ c鑤","80 tr? xu鑞g"},                                 
	{"T鑓 K輈h","Kh秏","礽","Ly","C蕁","T╪gS鴆 m筺h v? Th﹏ ph竝","80 tr? xu鑞g"},                                 
	{"Ki誱 kh?","礽","Ly","C蕁","C祅","T╪g N閕 c玭g v? linh ho箃","80 tr? xu鑞g"},                                 
	{"чng ph?","Ly","C蕁","C祅","Kh玭","T╪g linh ho箃 v? l鵦 lng","80 tr? xu鑞g"},                                 
	{"Th輈h kh竎h","C蕁","C祅","Kh玭","Kh秏","T╪g th﹏ ph竝 v? linh ho箃","80 tr? xu鑞g"},                                 
	{"Phong T鑓","Ly","礽","Kh秏","C蕁","T╪g N閕 c玭g v? Th﹏ ph竝","80 tr? xu鑞g"},
	{"Ph鬰 Long","C祅","Kh玭","Kh秏","礽","T╪g N閕 c玭g v? G﹏ c鑤","80 tr? xu鑞g"},                                 
	{"Huy襫 Kh﹗","Ch蕁","C祅","C蕁","Ly","T╪g ph遪g ng? v? c玭g k輈h N閕, ngo筰 c玭g","80 tr? xu鑞g"},                                 
	{"M穘h h?","Kh玭","T鑞","Kh秏","礽","S竧 thng t╪g ","80 tr? xu鑞g"},                                 
	{"Tng Phng","C祅","Kh秏","Ch蕁","礽","T╪g Sinh l鵦 v? N閕 l鵦","80 tr? xu鑞g"},                                 
	{"Giao Long","Kh秏","C蕁","Ly","T鑞","T╪g Sinh l鵦 v? N閕 l鵦","80 tr? xu鑞g"},                                 
	{"Uy phong","Ch蕁","Ch蕁","Kh玭","C祅","C玭g k輈h + ","80 tr? xu鑞g"},                                 
	{"Hi謕 s?","C蕁","Kh秏","T鑞","T鑞","T╪g Sinh l鵦","80 tr? xu鑞g"},      	
	{"Ti襪 long","C祅","Kh玭","Kh秏","礽","T╪g Sinh l鵦","80 ho芻 80 tr? l猲"},
	{"H鏽 n","Kh玭","Kh秏","礽","Ly","T╪g S鴆 m筺h v? G﹏ c鑤","80 ho芻 80 tr? l猲"},
	{"Ly H醓","Kh秏","礽","Ly","C蕁","T╪gS鴆 m筺h v? Th﹏ ph竝","80 ho芻 80 tr? l猲"},
	{"Huy襫 B╪g","礽","Ly","C蕁","C祅","T╪g N閕 c玭g v? linh ho箃","80 ho芻 80 tr? l猲"},
	{"Huy襫 Ho祅g","Ly","C蕁","C祅","Kh玭","T╪g linh ho箃 v? l鵦 lng","80 ho芻 80 tr? l猲"},
	{"C玭 B籲g","C蕁","C祅","Kh玭","Kh秏","T╪g th﹏ ph竝 v? linh ho箃","80 ho芻 80 tr? l猲"},
	{"Kh竛g Long","Ly","礽","Kh秏","C蕁","T╪g N閕 c玭g v? Th﹏ ph竝","80 ho芻 80 tr? l猲"},
	{"Ni誸 B祅","C祅","Kh玭","Kh秏","礽","T╪g N閕 c玭g v? G﹏ c鑤","80 ho芻 80 tr? l猲"},
	{"Huy襫 V?","Ch蕁","C祅","C蕁","Ly","T╪g ph遪g ng? v? c玭g k輈h N閕, ngo筰 c玭g","80 ho芻 80 tr? l猲"},
	{"H? tr緉g","Kh玭","T鑞","Kh秏","礽","S竧 thng t╪g ","80 ho芻 80 tr? l猲"},
	{"Chu Tc","C祅","Kh秏","Ch蕁","礽","T╪g Sinh l鵦 v? N閕 l鵦","80 ho芻 80 tr? l猲"},
	{"Thanh Long","Kh秏","C蕁","Ly","T鑞","T╪g Sinh l鵦 v? N閕 l鵦","80 ho芻 80 tr? l猲"},
	{"V? Song","Ch蕁","Ch蕁","Kh玭","C祅","C玭g k輈h + ","80 ho芻 80 tr? l猲"},
	{"Qu鑓 S?","C蕁","Kh秏","T鑞","T鑞","T╪g Sinh l鵦","80 ho芻 80 tr? l猲"}                          
	}	
	
tTiandi = {
	{"Thi猲 мa Ti襪 Long","C祅","Kh玭","Kh秏","礽","T╪g Sinh l鵦","T╪g Sinh l鵦"," t? 119 tr? l猲"},
	{"Tr阨 t h鏽 n","Kh玭","Kh秏","礽","Ly","T╪g S鴆 m筺h v? G﹏ c鑤","N﹏g cao gi韎 h筺 n閕 l鵦 v? sinh m謓h"," t? 119 tr? l猲"},
	{"Thi猲 мa Ly H醓","Kh秏","礽","Ly","C蕁","T╪gS鴆 m筺h v? Th﹏ ph竝","N﹏g cao gi韎 h筺 n閕 l鵦 v? sinh m謓h"," t? 119 tr? l猲"},
	{"Thi猲 мa Huy襫 B╪g","礽","Ly","C蕁","C祅","T╪g N閕 c玭g v? linh ho箃","N﹏g cao gi韎 h筺 n閕 l鵦 v? sinh m謓h"," t? 119 tr? l猲"},
	{"Thi猲 мa Huy襫 Ho祅g","Ly","C蕁","C祅","Kh玭","T╪g linh ho箃 v? l鵦 lng","N﹏g cao gi韎 h筺 n閕 l鵦 v? sinh m謓h"," t? 119 tr? l猲"},
	{"Thi猲 мa C玭 B籲g","C蕁","C祅","Kh玭","Kh秏","T╪g th﹏ ph竝 v? linh ho箃","N﹏g cao gi韎 h筺 n閕 l鵦 v? sinh m謓h"," t? 119 tr? l猲"},
	{"Thi猲 мa Kh竛g Long","Ly","礽","Kh秏","C蕁","T╪g N閕 c玭g v? Th﹏ ph竝","N﹏g cao gi韎 h筺 n閕 l鵦 v? sinh m謓h"," t? 119 tr? l猲"},
	{"Thi猲 мa Ni誸 B祅","C祅","Kh玭","Kh秏","礽","T╪g N閕 c玭g v? G﹏ c鑤","N﹏g cao gi韎 h筺 n閕 l鵦 v? sinh m謓h"," t? 119 tr? l猲"},
	{"Trng Sinh Huy襫 V?","Ch蕁","C祅","C蕁","Ly","T╪g ph遪g ng? v? c玭g k輈h N閕, ngo筰 c玭g","T╪g Sinh l鵦"," t? 119 tr? l猲"},
	{"Hung Tinh B筩h H?","Kh玭","T鑞","Kh秏","礽","S竧 thng t╪g ","T╪g Sinh l鵦"," t? 119 tr? l猲"},
	{"Chu Tc B蕋 Di謙","C祅","Kh秏","Ch蕁","礽","T╪g Sinh l鵦 v? N閕 l鵦","T╪g Sinh l鵦"," t? 119 tr? l猲"},
	{"T筰 Thi猲 Thanh Long","Kh秏","C蕁","Ly","T鑞","T╪g Sinh l鵦 v? N閕 l鵦","T╪g Sinh l鵦"," t? 119 tr? l猲"},
	{"Thi猲 H? V? мch","Ch蕁","Ch蕁","Kh玭","C祅","C玭g k輈h + ","T╪g Sinh l鵦"," t? 119 tr? l猲"},
	{"Thi猲 Chi Qu鑓 S?","C蕁","Kh秏","T鑞","T鑞","T╪g Sinh l鵦","N﹏g cao gi韎 h筺 n閕 l鵦 v? sinh m謓h"," t? 119 tr? l猲"} 
	};	
	
--八卦的组成
tGuaWei = {--卦位 三灵石奇偶 总数奇偶
	{"C祅","L?","L?","L?","L?"},
	{"Kh玭","Ch絥","Ch絥","Ch絥","Ch絥"},
	{"Ly","L?","Ch絥","L?","Ch絥"},
	{"Kh秏","Ch絥","L?","Ch絥","L?"},	
	{"Ch蕁","L?","Ch絥","Ch絥","L?"},
	{"T鑞","Ch絥","L?","L?","Ch絥"},
	{"C蕁","Ch絥","Ch絥","L?","L?"},
	{"礽","L?","L?","Ch絥","Ch絥"}
	}

function OnUse()
	local strtab = {
		"如何制作八卦首饰/how_make_bagua",
		"怎么得到灵石/how_get_lingshi",
		"如何激活八卦装备？/how_jihuo_bagua",
		"如何获得资源/ziyuanhuode",
		"打造卦位/dazao_guawei",
		"咨询八卦套装的要求bagua_taozhuang_yaoqiu",
--		"Nh﹏ v藅 li猲 quan n h? th鑞g B竧 Qu竔/bagua_chuansong"
		}
--	if GetTask(TASK_LINGSHI_ID) == 8 or (GetTask(TASK_LINGSHI_ID) == 0 and GetLevel() > 20) then
--		tinsert(strtab,"Ta mu鑞 m? ra nhi謒 ra h? th鑞g B竧 Qu竔 Linh Th筩h/talk_III");
--	end
		tinsert(strtab,"我还没想清楚/nothing");
	Say("你想学习哪方面的知识?",
		getn(strtab),
		strtab)
end

function how_make_bagua()
	Talk(1,"how_make_bagua2","Ch? t筼 trang b? ch? t筼 B竧 Qu? c? 3 bc\n Bc 1, ph秈 c? trang b? c? b秐 c? linh kh? tr阨 t, b筺 c? th? t筼 ra trang b? n祔 qua k? n╪g s鑞g. M鏸 trang b? u c? 1 <color=red>gi韎 h筺 gi? tr? linh kh? v? 萵 S?<color> gi韎 h筺 gi? tr? linh kh? s? quy誸 nh 璾 甶觤 c馻 linh th筩h c? th? kh秏 n筸 v? B竧 Qu竔 Qu竔 V? s? xu蕋 hi謓 trong tng lai, c遪 萵 s? s? quy誸 nh s? lng linh th筩h c? th? kh秏 n筸, n誹 mu鑞 l祄 ra trang b? B竧 Qu竔, b総 bu閏 ph秈 c? 3 thu閏 t輓h 萵. Mu鑞 l祄 ra m閠 b? trang b? c? gi? tr? linh kh? cao, ph秈 th猰 nhi襲 v藅 ph萴 c? gi? tr? trong l骳 c, t鎛g gi? tr? v藅 ph萴 c祅g cao, t? l? trang b? gi韎 h筺 c馻 gi? tr? linh th筩h t筼 ra c祅g l韓.");
end

function how_make_bagua2()
	Talk(1,"how_make_bagua3","<color=green>B竧 Qu竔 B秓 觧<color> Bc 2, l祄 xong trang b? c? b秐 r錳, m韎 b総 u kh秏 n筸 linh th筩h. Tr猲 m鏸 linh th筩h u c? 1 甶觤 linh kh?, n誹 tr? s? 甶觤 linh kh? l? s? l?, linh th筩h l? Dng, tr? s? linh kh? l? ch絥 s蟣? ﹎. To祅 b? tr? linh kh? <color=red>c馻 linh th筩h<color> kh秏 tr猲 trang b? c? b秐 <color=red>kh玭g vt qu?<color> <color=red>gi韎 h筺 甶觤 linh th筩h<color>c馻 trang b? c? b秐 n祔. L骳 甶觤 linh kh? v? linh th筩h c馻 b? trang b? c? b秐 n祔 <color=red>b籲g v韎<color> gi韎 h筺 甶觤 linh kh?, s? tr? th祅h trang b? B竧 Qu竔 ch璦 k輈h ho箃. N誹 mu鑞 xem c竎h t筼 qu竔 v? tr猲 trang b? c? th? xem th猰 trong <color=red>m鬰 th? 6<color=red>.");
end

function how_make_bagua3()
	Talk(1,"OnUse","<color=green>B竧 Qu竔 B秓 觧<color> Bc 3, sau khi  c? trang b? B竧 Qu竔 ch璦 k輈h ho箃, v蒼 ch璦 th蕐 頲 trang b? B竧 Qu竔 k輈h ho箃, mu鑞 tham gia k輈h ho箃 trang b? B竧 Qu竔 ph秈 <color=red>k輈h ho箃<color> thu閏 t輍h. Mang trang b? B竧 Qu竔  k輈h ho箃, t韎 c竎 th祅h ph? t譵 <color=red>Th莕 Du Ch﹏ Nh﹏<color>  nh? k輈h ho箃, nh璶g ph秈 ti猽 hao Th竔 H? B竧 Qu竔 B礽. Trang b? B竧 Qu竔 sau khi  k輈h ho箃 c? th? mang n C玭g D? Th? Gia <color=red> h頿 th祅h b? trang b? B竧 Qu竔<color>!");
end

function how_get_lingshi()
	Talk(1,"how_get_lingshi2","<color=green>B竧 Qu竔 B秓 觧<color> Bc 1, mu鑞 c? 頲 linh th筩h, ph秈 c? nguy猲 th筩h v? trang b? c? hi謚 qu?. Nguy猲 th筩h c? th? t竎h ra l蕐 thu閏 t輓h tr猲 trang b?, sau khi t竎h th祅h c玭g, nguy猲 th筩h n祔 s? bi課 th祅h linh th筩h tng 鴑g. Nguy猲 th筩h c? t竎 d鬾g cao th蕄 kh竎 nhau, ph﹏ th祅h 7 c蕄, n誹 ng c蕄 nguy猲 th筩h kh玭g , c騨g kh玭g th? h蕄 thu thu閏 t輓h c蕄 cao c馻 trang b? 甶 k蘭. Nguy猲 th筩h ph﹏ th祅h <color=red>Thi猲, мa, Nh﹏<color>, ph﹏ bi謙 d鵤 tr猲 c竎 thu閏 t輓h <color=red> 1, 2, 3<color> tng 鴑g tr猲 trang b?. Mu鑞 t竎h 頲 thu閏 t輓h n祇 th? ph秈 s? d鬾g lo筰 nguy猲 th筩h .");
end

function how_get_lingshi2()
	Talk(1,"OnUse","<color>: Hai, trang b? c? thu閏 t輓h linh kh? cao c蕄 r蕋 輙, mu鑞 nh薾 頲 Linh Th筩h cao c蕄, c遪 m閠 c竎h kh竎, t? m譶h<color=red>h頿 th祅h Linh Th筩h<color>, bi課 nhi襲 Linh Th筩h th祅h m閠 Linh Th筩h, n誹 nhi襲 Linh Th筩h c飊g lo筰, kh? n╪g h頿 th祅h Linh Th筩h s? cao. Th阨 chi課 Thng c? Phong Th莕 c? truy襫 l筰 phng ph竝 ph鑙 h頿 h頿 th祅h Linh th筩h, n誹 l蕐 頲 phng ph竝 ph鑙 h頿 n祔, l祄 theo ghi ch衟, b? sung Linh Th筩h tng 鴑g, c? th? h頿 th祅h Linh Th筩h, nh璶g ch璦 C竎 ngi th祅h c玭g...");
end

function how_jihuo_bagua()
	Talk(1,"how_jihuo_bagua2","B竧 Qu竔 trong tr阨 t v鑞 c? tng t竎 l蒼 nhau, thi猲 bi課 v筺 h鉧 h鉧, C玭g D? Th? Gia c? i ra s鴆 nghi猲 c鴘?");
end

function how_jihuo_bagua2()
	Talk(1,"how_jihuo_bagua3","Bc 1, ph秈 h頿 th祅h b? trang b? B竧 Qu竔, trc h誸 ph秈 c? <color=red>trang b? B竧 Qu竔 <color> tng 鴑g. Sau khi t藀 h頿 y , n C玭g D? Th? Gia h頿 th祅h. M鏸 b? trang b? B竧 Qu竔 c? tr? Linh kh? kh竎 nhau, hi謚 qu? h頿 th祅h trang b? B竧 Qu竔 c? li猲 quan n <color=red>tr? s? linh kh? k輈h ho箃<color>. N誹tr? linh kh? k輈h ho箃 qu? th蕄, hi謚 qu? sau khi h頿 th祅h s? th蕄. L骳 h頿 th祅h n誹 cho th猰 c竎 v藅 ph萴 <color=red>gi? tr?<color> th? s? gi秏 thi觰 t鎛 th蕋!");
end

function how_jihuo_bagua3()
	Talk(1,"OnUse","Bc 2, n誹 thu閏 t輓h k輈h ho箃 cho trang b? B竧 Qu竔  kh玭g , ph秈 ph鬰 h錳 l筰 tr筺g th竔 ban u. Nh璶g n誹 th蕋 b筰 th? s? <color=red>t鎛 th蕋<color> m閠 s? trang b? trong b? B竧 Qu竔 . N誹 mu鑞 n﹏g cao kh? n╪g th祅h c玭g v? gi秏 b韙 t鎛 th蕋, trong l骳 ph鬰 h錳 l筰 ph秈 th猰 c竎 lo筰 v藅 ph萴 c? gi? tr?");
end

function bagua_taozhuang(nPage)
	local nPageNum = 7;
	local nRemaidNum = getn(tTaoZhuang)-(nPageNum*nPage);
	local tDiaTab = {};
	local num_this_dia = 7;
	if nRemaidNum <= 7 then
		num_this_dia = nRemaidNum;
	end
	for i=1,num_this_dia do
		tinsert(tDiaTab,tTaoZhuang[nPageNum*nPage+i][1].."Trang b?: 觤 linh kh? n "..tTaoZhuang[nPageNum*nPage+i][7].."]["..tTaoZhuang[nPageNum*nPage+i][2]..":"..tTaoZhuang[nPageNum*nPage+i][3]..":"..tTaoZhuang[nPageNum*nPage+i][4]..":"..tTaoZhuang[nPageNum*nPage+i][5].."]["..tTaoZhuang[nPageNum*nPage+i][6].."]/#taozhuang_detail("..nPage..","..(nPageNum*nPage+i)..")");
	end
	if nPage ~= 0 then
		tinsert(tDiaTab,"上一页/#bagua_taozhuang("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum then
		tinsert(tDiaTab,"下一页/#bagua_taozhuang("..(nPage+1)..")");
	end
	tinsert(tDiaTab,"返回/OnUse");
	Say("Trang b? B竧 Qu竔 c?: ",
		getn(tDiaTab),
		tDiaTab)
end	

function taozhuang_detail(nPage,nType)
	Talk(1,"#bagua_taozhuang("..nPage..")","\n<color=red>"..tTaoZhuang[nType][1].."<color>trang b?<color=red>"..tTaoZhuang[nType][2].."<color>Qu竔 u B?+<color=red>"..tTaoZhuang[nType][3].."<color>Qu竔 Y Ph鬰+<color=red>"..tTaoZhuang[nType][4].."<color>Qu竔 H? Trang+<color=red>"..tTaoZhuang[nType][5].."<color>Qu竔 V? Kh?. Ph筸 vi 甶觤 linh kh? c莕 cho m鏸 trang b? l?: <color=red>"..tTaoZhuang[nType][7].."<color>. Thu閏 t輓h k輈h ho箃 l?: <color=red>"..tTaoZhuang[nType][6].."<color>")
end

function dazao_guawei()
	local strtab = {};
	for i=1,getn(tGuaWei) do
		tinsert(strtab,tGuaWei[i][1]..":精神["..tGuaWei[i][5].."] Th? t? 3 kh鎛g linh kh? ["..tGuaWei[i][2].."]["..tGuaWei[i][3].."]["..tGuaWei[i][4].."]/#guawei_detail("..i..")");
	end
	tinsert(strtab,"我已经知道了/OnUse");
	Say("你知道这究竟是什么？",
		getn(strtab),
		strtab);
end

function ziyuanhuode()
	Say("Nh鱪g v藅 li猲 quan v韎 linh th筩h n祔 ph秈 l祄 sao  c?!? Ph秈 t譵 hi觰 cho k?!",
	5,
	"获得原石/yuanshihuode",
	"获得灵石/lingshihuode",
	"合成灵石/hechenglingshi",	
	"灵石配方/lingshipeifanghuode",
	"只是来看看/SayHello"
	)
end

function yuanshihuode()
	Talk(1,"OnUse","B筺 c? th? mua Nguy猲 th筩h<color> ?<color=red>ch? ti謒 t筽 h鉧<color>, c莕 ch? ? l? v? tr? thu閏 t輓h linh kh? tng 鴑g v韎 c竎 linh th筩h kh竎 nhau th? kh玭g gi鑞g nhau, thu閏 t輓h cao nh蕋 c馻 c竎 ng c蕄 nguy猲 th筩h kh竎 nhau 頲 l蕐 ra c騨g kh玭g gi鑞g nhau!")
end

function lingshihuode()
	Talk(1,"OnUse","Ngo礽 d飊g Nguy猲 Th筩h  r髏 Linh kh? trang b? ra, nghe n鉯 hai nc T鑞g Li猽  c? v? tng s?, ph祄 ai tham gia <color=red>chi課 trng Nh筺 M玭 quan<color> u 頲 thng <color=red>Linh Th筩h<color>, nh璶g mu鑞 c? 頲 Linh Th筩h ph秈 xem x衪 c玭g tr筺g v? bi觰 hi謓 c馻 h?. Truy襫 r籲g b鋘 s竧 th? r蕋 h鴑g th? v韎 Linh Th筩h, c竎 anh h飊g khi g苝 b鋘 <color=red>s竧 th?<color> c莕 l璾 t﹎ xem ch髇g c? mang theo Linh Th筩h n祔 kh玭g.")
end

function hechenglingshi()
	Talk(1,"OnUse"," Linh Th筩h n祔 th? gian r蕋 hi誱 th蕐. C竎 v? ti襫 nh﹏  v? c飊g kh? c鵦 nghi猲 c鴘 ra <color=red>Linh Th筩h ph鑙 phng<color>, ch? c莕 <color=red>Linh Th筩h ph鑙 phng<color> v? <color=red>Linh Th筩h<color> c飊g t tr猲 c閠 h頿 th祅h Linh Th筩h  t筼 ra <color=red>Linh Th筩h theo ph鑙 phng<color>. Kh玭g th猰 ph鑙 phng, t飝 ? k誴 h頿 Linh Th筩h tuy c? th? h頿 th祅h, nh璶g th祅h c玭g hay kh玭g c遪 do Tr阨 nh.")
end

function lingshipeifanghuode()
	Talk(1,"OnUse","Linh Th筩h ph鑙 phng t? Thng c? l璾 truy襫 n nay kh玭g nhi襲...Ngi c鑞g hi課 cho m玭 ph竔, ho祅 th祅h <color=red>nhi謒 v? s? m玭<color> m鏸 ng祔, tin r籲g chng m玭 s? hi觰 頲 s? n? l鵦 c馻 ngi. C竎 s竧 th? cao c蕄 trong <color=red>S竧 th? 阯g<color> u c? mang theo ph鑙 phng, nh璶g c? l蕐 頲 hay kh玭g c遪 ph秈 xem v薾 kh? c馻 ngi n鱝!")
end

function guawei_detail(nType)
	if nType > 0 and nType <= getn(tGuaWei) then
		local strtab = {
			"打造卦位/dazao_guawei",
			"离开/nothing"};
		Say("Ch? t筼 1 b? <color=yellow>"..tGuaWei[nType][1].."<color>Qu竔 trang b? c莕 \ntrang b?: gi韎 h筺 甶觤 linh kh? l? <color=yellow>"..tGuaWei[nType][5].."<color>Trang b? s鑌nKh秏 n筸 vi猲 linh th筩h th? 1: 甶觤 linh kh? kh秏 n筸 l? <color=yellow>"..tGuaWei[nType][2].."<color>linh th筩h s鑌nKh秏 n筸 vi猲 linh th筩h th? 2: 甶觤 linh kh? kh秏 n筸 l? <color=yellow>"..tGuaWei[nType][3].."<color>linh th筩h s鑌nkh秏 n筸 vi猲 linh th筩h th? 3: d甶觤 linh kh? kh秏 n筸 l? <color=yellow>"..tGuaWei[nType][4].."<color>linh th筩h s鑌nB竧 Qu竧 trang b? v? 甶觤 linh kh? c馻 linh th筩h ph秈 ph? h頿 tr猲 b秐g ch? d蒼, l骳 甶觤 c馻 3 vi猲 linh th筩h b籲g v韎 gi韎 h筺 甶觤 linh kh? trang b? t鴆 l? h譶h th祅h trang b? b竧 qu竔 ch璦 k輈h ho箃.",
			getn(strtab),
			strtab)
	end
end

function nothing()

end 

function bagua_chuansong()
	local nPos = GetWorldPos();
	if nPos >= 700 then
		Talk(1,"OnUse","该区域目前无法使用此传送功能");
		return
	end
	if GetFightState() == 1 then
		Talk(1,"OnUse","请使用这个在和平地区的传送功能");
		return
	end
	Say("只要花一点钱，我就能把你送到你想去的地方",
	5,
	"工业世家gongyeshijia",
	"制作和打孔/zhizuoxi",
	"神游真人/shenyouzhenren",
	"刘铁匠/liutiejiang",
	"只是看看/SayHello"	
	)
end

function gongyeshijia()
	Say("C竎 truy襫 nh﹏ c馻 C玭g Х Th? Gia ? u c騨g c?. L蕐 v? h頿 th祅h Linh th筩h h? u gi髉 頲. Ta c? th? a n ngi , thu ph? <color=red>20 b筩<color> nh?!.",
	4,
	"公冶兵-襄阳/gongyebing",
	"公冶器-扬州/gongyeqi",
	"公冶具-大理/gongyeju",
	"只是看看/SayHello"	
	)
end

function zhizuoxi()
	Say("我可以送你去这些地方，只要你支付<color=red>101银币<color>就可以",
	7,
	"莫大/moda",
	"莫人/moer",
	"莫三/mosan",
	"锦娘/jinniang",
	"紫鹃姑娘/zijuan",
	"公孙书/mingshifu",
	"只是看看./SayHello"	
	)
end

function shenyouzhenren()
	Say("我可以送你去这些地方，只要你支付<color=red>10银币<color>就可以。",
	4,
	"汴京神游真人/bianjingshenyou",
	"成都神游真人/chengdushenyou",
	"泉州神游真人/quanzhoushenyou",
	"只是看看/SayHello"	
	)
end
	
function liutiejiang()
	Say("我可以送你去这些地方，只要你支付<color=red>20银币<color>.",
	2,
	"刘铁匠/xiangyangliutie",
	"只是看看/SayHello"	
)
end

function moneygo1()
	return	PrePay(2000)
end;

function moneygo2()
	return	PrePay(1000)
end;

function gongyebing()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊！")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		NewWorld(350,1399,2992)
		SetFightState(0);
	end
end

function gongyeqi()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(150,1647,3152)
			SetFightState(0);
	end
end

function gongyeju()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(400,1493,3058)
			SetFightState(0);
	end
end

function xiangyangliutie()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(350,1415,2930)
			SetFightState(0);
	end
end

function moda()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(200,1426,3025)
			SetFightState(0);
	end
end

function moer()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(300,1709,3459)
			SetFightState(0);
	end
end

function mosan()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(350,1345,2929)
			SetFightState(0);
	end
end

function jinniang()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(300,1862,3479)
			SetFightState(0);
	end
end

function zijuan()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(400,1409,2985)
			SetFightState(0);
	end
end

function mingshifu()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(350,1546,2935)
			SetFightState(0);
	end
end
	
function bianjingshenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(200,1151,2855)
			SetFightState(0);
	end
end

function chengdushenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(300,1975,3557)
			SetFightState(0);
	end
end

function quanzhoushenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","看起来你带的钱不够啊")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(100,1379,2860)
			SetFightState(0);
	end
end

function SayHello()

end

function bagua_taozhuang_yaoqiu()
	local strtab = {
		"八卦套装/#bagua_taozhuang(0)",
--		"天地玄黄套装/#tiandi_taozhuang(0)",
		"返回/OnUse"};
	Say("你想看哪个？",
		getn(strtab),
		strtab)
end

function tiandi_taozhuang(nPage)
	local nPageNum = 7;
	local nRemaidNum = getn(tTiandi)-(nPageNum*nPage);
	local tDiaTab = {};
	local num_this_dia = 7;
	if nRemaidNum <= 7 then
		num_this_dia = nRemaidNum;
	end
	for i=1,num_this_dia do
		tinsert(tDiaTab,tTiandi[nPageNum*nPage+i][1].."Trang b?: 觤 linh kh? n "..tTiandi[nPageNum*nPage+i][8].."]["..tTiandi[nPageNum*nPage+i][2]..":"..tTiandi[nPageNum*nPage+i][3]..":"..tTiandi[nPageNum*nPage+i][4]..":"..tTiandi[nPageNum*nPage+i][5].."]/#tiandi_detail("..nPage..","..(nPageNum*nPage+i)..")");
	end
	if nPage ~= 0 then
		tinsert(tDiaTab,"上一页/#tiandi_taozhuang("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum then
		tinsert(tDiaTab,"下一页/#tiandi_taozhuang("..(nPage+1)..")");
	end
	tinsert(tDiaTab,"返回/OnUse");
	Say("Trang b? Thi猲 мa Huy襫 ho祅g bao g錷 thu閏 t輓h trang b? Ph? th玭g B竧 Qu竔.",
		getn(tDiaTab),
		tDiaTab)
end	

function tiandi_detail(nPage,nType)
	Talk(1,"#tiandi_taozhuang("..nPage..")","\n<color=red>"..tTiandi[nType][1].."<color>trang b?<color=red>"..tTiandi[nType][2].."<color>Qu竔 u B?+<color=red>"..tTiandi[nType][3].."<color>Qu竔 Y Ph鬰+<color=red>"..tTiandi[nType][4].."<color>Qu竔 H? Trang+<color=red>"..tTiandi[nType][5].."<color>Qu竔 V? Kh?. Ph筸 vi 甶觤 linh kh? c莕 cho m鏸 trang b? l?: <color=red>"..tTiandi[nType][8].."<color>. Thu閏 t輓h k輈h ho箃 l?: <color=red>"..tTiandi[nType][6].."."..tTiandi[nType][7].."<color>.")
end
