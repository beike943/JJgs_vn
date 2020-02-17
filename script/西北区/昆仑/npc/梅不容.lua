--脚本功能：少林售卖NPC对应脚本
--功能开发：村长
--开发时间：2011-4-2
--修改记录：
-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

Include("\\script\\faction\\npc\\buy_sell_main.lua")
function main()
	local sDiaHead,tDiaSel = faction_buysell_main(8)
	if getn(tDiaSel) > 0 then
		tinsert(tDiaSel, getn(tDiaSel), "我需要处理其他事情/other_function");
	end
	Say(sDiaHead,getn(tDiaSel),tDiaSel)
end

function other_function()

	--赠送古阳秘洞门票
	if GetBit(GetTask(GIVE_TICKET_STATE),1) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--一般情况下的对话
	strTalk = {
		{"M鋓 v藅 tr猲 i u c? n閕 t﹎, ngi h祅h y sao c? th? i x? thi猲 v? v韎 b謓h nh﹏ kh竎 nhau?"},
		{"b筩h ng鋍 甶猽 lan kim ty s祅g, c? k? th? k誸 m穘 chu ty v鈔g, thu? tri 產ng ni猲 ca v? tr祅g"},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--赠送门票脚本
function give_ticket_01()

local strTalk = {
	"Mai B蕋 Dung: Xin ch祇 <sex>, ta 畂竛 ngi c騨g bi誸 chuy謓 C? Dng Th? b? Phi thng o nh﹏ l頸 d鬾g. Trc y khi n? b? thu ph鬰 甧m l猲 C玭 Lu﹏, S? huynh ni謒 t譶h con th? n祔 b? ngi kh竎 l頸 d鬾g n猲 cho ph衟 ta c鴘 n?  thay i dc l鵦 c馻 H醓 luy謓 kim 產n trong ngi n?.",
	"Ngi ch琲: Th? ra C? Dng Th? sau khi b? thu ph鬰  頲 甧m l猲 C玭 Lu﹏, C玭 Lu﹏ ph竔 v鑞 l? o gia luy謓 產n, dc l鵦 trong ngi C? Dng Th? c? th? h鉧 gi秈?",
	"Mai B蕋 Dung: Ta  chuy觧 i b? ph薾 c馻 C? Dng th? th祅h kim n nh璶g l筰 ph竧 hi謓 n? b? cho ╪ Kim n l﹗ r錳,  nh藀 v祇 m竨 huy誸. C玭 L玭 s琻 ti猲 kh? m筺h nh蕋, C? Dng Th? ? y  h蕄 th? tinh kh? c馻 tr阨 t s? kh玭g b? nhi詍 t? kh?, nh? v藋 c? th? gi髉 n? h鉧 gi秈 dc l鵦. Ch糿g ng? tr阨 ch糿g chi襲 l遪g ngi, C? Dng Th? sau khi l筩 v祇 {T醓 Y猽 Th竝} h藆 s琻 C玭 Lu﹏, C? Dng Th? b鏽g nhi猲 tr? n猲 hung 竎.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"Ngi ch琲: ?? C? Dng Th? d竚 n g﹜ r鑙, l? n祇 C玭 Lu﹏ kh玭g mu鑞 g苝 n筺?",
	"Mai B蕋 Dung: L骳  c竎  t? u ngh? nh? th?, cho d? c? th? t竔 thu ph鬰 C? Dng Th?, ch? s? t鎛 thng nghi猰 tr鋘g, ta nghi猲 c鴘 qua H醓 luy謓 kim 產n c馻 Phi thng o nh﹏, n? 頲 ch? t? {m竨 huy誸 ma},  khi ph竧 t竎 n誹 kh玭g c? m竨 ti 竝 ch?, to祅 th﹏ nh? b? l鯽 thi猽. Nh璶g  t? C玭 L玭 khi mu鑞 ra tay kh綾 ch? th? C? Dng Th? v飊g d藋 tr鑞 tho竧 c騨g kh玭g l祄 b? thng m閠 ai.",
	"Ngi ch琲: Th? ra c遪 x秠 ra nhi襲 chuy謓 nh? v藋, xem ra C? Dng Th? qu? nhi猲 l? linh th?, v藋 n?  ch箉 甶 u m蕋 r錳? C? ph秈 c莕 t筰 h? {thu ph鬰 l莕 n鱝}?",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"Mai B蕋 Dung: Ta lu玭 cho r籲g v筺 v藅 tr猲 i n祔 u c? linh t輓h, n猲 c秏 th蕐 C? Dng Th? l? v? bi誸 琻 C玭 Lu﹏ cho n猲 r竛g ch辵 產u kh? m? tr鑞 tho竧, ta 畂竛 n?  v? C? Dng ng r錳. M芻 d? s? huynh thng tr竎h ta kh玭g bi誸 ph﹏ bi謙 ch輓h t?, c? l骳 c遪 c鴘 c? y猽 ma, nh璶g sinh linh u b譶h ng, ngi h鋍 o sao l筰 c? th? th蕐 ch誸 m? kh玭g c鴘? Cho n猲 ta  ch? {B輈h Di猽 Thanh T﹎ Кn}, ph竧 cho nh﹏ s? v? l﹎. N誹 <sex> c? duy猲 nh薾 頲, hy v鋘g c? th? 甧m thu鑓 n祔 n C? Dng ng m閠 chuy課, cho C? Dng th? u鑞g  gi髉 n? h鉧 gi秈 dc l鵦 trong ngi, 甧m thu鑓 n祔 giao cho е t? C玭 L玭 ? trong ng c? th? 甶 C? Dng m藅 ng. N誹 <sex> nh祅 r鏸 sau n祔 khi t譵 頲 thu鑓 n祔 c? th? 甧m ti誴 cho n? u鑞g, u鑞g l﹗ ng祔 nh蕋 nh c? th? h鉧 gi秈 dc l鵦 trong ngi n?.",
	"Ngi ch琲: Thng  c? c hi誹 sinh, c? nng c? ti課g nh﹏ t? khi課 ngi c秏 k輈h, t筰 h? s? ho祅 th祅h t﹎ nguy謓 c馻 c? nng.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1031,1,1);--得到碧瑶清心丹
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),1,1));
	
end