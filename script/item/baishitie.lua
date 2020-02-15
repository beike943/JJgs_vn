-- 拜师帖

function OnUse(idx)
	Say("这张拜师帖可以帮助你学习如何拜师",
	5,
	"发布拜师信息bai_shi", 
	"已收到推荐信/thutiencu", 
--	"查看信息/shou_tu",
	"查看信息/see_info2", 
	"我徒弟能不能是个和尚？/renwuchaxun", 
	"没什么/no_say"
	)
end

function bai_shi()
	local tInfo = GetMPBaseInfo()
	if tInfo["ismaster"] ~= 0 then
		Say("你已经成为师父了，不能再发布拜师信息。", 0)
		return
	end
	if tInfo["master"] ~= "" then
		Say("你已经有师父了，不能再发布拜师信息。", 0)
		return
	end
	
	local nTime = CustomDataRead("mp_p_want_take_on_a_master")
	local nNow = GetTime()
	if nTime == nil then
		CustomDataSave("mp_p_want_take_on_a_master", "d", nNow)
	else
		local nDiffTime = 600 - (nNow - nTime)
		if nDiffTime > 0 then		-- 10分钟才能用一次
			local nMin = floor(nDiffTime / 60)
			local nSec = mod(nDiffTime, 60)
			Say("你还需要等待"..nMin.."分钟"..nSec.."后才可以再次发布拜师信息。", 0)
			return
		end
		CustomDataSave("mp_p_want_take_on_a_master", "d", nNow)
	end
	
	Want2TakeOnAMaster()
	Say("     B筺  g鰅 tin b竔 s?, c竎 cao th? l﹏ c薾 u nh薾 頲, n誹 c? ngi mu鑞 thu  , s? ch? ng li謓 h? v韎 b筺. \n <color=yellow>N誹 th蕐 c? ngi n鉯 chuy謓 v韎 b筺, ch? c莕 蕁 Ctrl+chu閠 ph秈 ngay c﹗ n鉯   tr? l阨. <color>\n Tin b竔 s? c? th? duy tr? trong 10 ph髏, c竎 s? ph? v? h鋍 c? th? th蕐 頲 tin b竔 s? c馻 b筺 trong 10 ph髏, trong th阨 gian  b筺 c? th? l祄 v謈 kh竎. <color=yellow>n誹 b筺 l? t﹏ th?,  ngh? b筺 t韎 D? Song g莕 n琲 b筺 xu蕋 th﹏  nh薾 nhi謒 v? c馻 t﹏ th? . <color>\n N誹 sau 10 ph髏 v蒼 ch璦 c? ai nh薾 b筺 l祄  t?, b筺 c? th? g鰅 l筰 tin b竔 s? l莕 n鱝.\n Hi v鋘g b筺 c? th? t譵 頲 s? ph? t礽 c.",1,"уng ?/no_say")
end
function thutiencu()
AddItem(2,1,1200,3)
AddItem(2,1,15,10)
AddItem(2,1,199,1)
AddItem(2,1,30609,1)
AddItem(2,1,585,1)
end

function shou_tu()
	Say("如果你想要一个徒弟，你可以去找<color=yellow>国子监<color>发布信息，需要收费10个银子(20级以上免费), 2,"同意/yes_shou_tu", "取消/no_say")
end

function yes_shou_tu()
	if GetFightState() == 1 then
		Say("只能在城内使用", 0)
		return
	end
	if GetLevel() >= 20 then
		if GetCash() < 1000 then
			Say("你没有足够的银子，不能发布信息。", 0)
			return
		end
		Pay(1000)
	end
	NewWorld(200,1458,2755)
end


function see_info2()
	local tInfo = GetMPBaseInfo()
	Say("你想知道师傅还是徒弟的信息?提醒一下，这个系统有很多操作, 打开<color=yellow>电子邮件界面<color>, 然后右击要操作的人的名字<color=yellow>进入操作界面<color>.",
		3,
		"我想看看我师父的信息/shifu",
		"我想看看我徒弟的信息/tudi",
		"没什么，只是看看。/no_say")
end

function shifu()
	local tInfo = GetMPBaseInfo()
	Say("师傅信息如下，你想知道什么内容？这个系统有很多功能,打开<color=yellow>你的信息界面<color>,然后单击你想要出现的名称<color=yellow>的操作界面<color>.",
		9,
		"怎么收徒弟?/shoutu",
		"收了徒弟之后的任务是什么？/shirenwu",
		"师徒点数/shitudianshu",
		"师德点数/shidedianshu",
		"点击首页/shouyedengji",
		"什么是华鸿？/huahong",
		"师父的奖励能买什么？fenglu",
		"如何结束师徒关系？/shichushi",
		"没什么，只是看看。/no_say"
		)
end
	
function shoutu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"shifu","N誹 b筺 mu鑞 nh薾  t?, ph秈 n <color=yellow>Qu鑓 T? gi竚 <color> ng k?, sau  c? th? m? giao di謓 <color=yellow>'Th玭g Tin S? у'<color> ","Жng k? xong, nh蕁 F3 s? xu蕋 hi謓 <color=yellow>'Trang B? Thu閏 T輓h'<color> Trong giao di謓 s? c? th猰 <color=yellow>'Th玭g Tin S? у<color>, c? th? xem 頲 t譶h h譶h k? nghi謕 th莥 c馻 b筺. N誹 ch鋘 m鬰 di g鉩 tr竔 <color=yellow>'M? ra nh薾  t?'<color>, c? th? th蕐 頲 ngi n祇 ? g莕 c莕 b竔 s?,  t譵 n h?.","N誹 b筺 th蕐 頲 ng c蕄 ngi n祇 th蕄 h琻 m譶h, 蕁 <color=yellow> Ctrl+Chu閠 ph秈<color> v祇 ngi , ch鋘 <color=yellow>'Thu  \'<color>. N誹 ngi  ng ?, s? tr? th祅h <color=green> t? t筸 th阨<color> c馻 b筺.","Khi ng c蕄 <color=green> t? t筸 th阨<color> t t韎 <color=yellow>10<color>, s? tr? th祅h  t? ch輓h th鴆. Ch? c莕 c? ly gi鱝 b筺 v? t?  t? g莕 nhau,  t? <color=yellow>'B竔'<color> 1 l莕, s? th祅h <color=green> t? ch輓h th鴆<color>!")
end
	
function shirenwu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu","Khi  l? s? ph?, m鏸 ng祔 c? th? t韎 <color=yellow> Qu鑓 T? gi竚<color>  truy襫 <color=yellow>Nhi謒 v? S? <color>, t鎛g c閚g c? 7 nhi謒 v?  ch鋘. Sau khi truy襫 nhi謒 v?, l謓h  c? th? nh薾 nhi謒 v? <color=yellow>trong giao di謓 th玭g tin S? у<color>.","K? h筺 sau khi truy襫 l謓h l? <color=yellow>24 ti課g<color>, ngh躠 l? ph秈 ho祅 th祅h xong nhi謒 v? trong v遪g 24 ti課g. уng th阨 ch? 頲 truy襫 1 nhi謒 v? trong v遪g 24 ti課g  m? th玦.","Khi  ho祅 th祅h nhi謒 v?, l謓h  nh薾 頲 ph莕 thng nhi謒 v?, c遪 b筺 l? s? ph?, s? c? 頲 <color=yellow>觤 S? <color>. Nhi謒 v? m? 1  t? ho祅 th祅h trong ng祔 c? th? 甧m cho s? ph? <color=green>10<color>觤 S? . <color=yellow> t? c祅g nhi襲, s? 觤 S?  c馻 b筺 c祅g cao<color>.")
end
	
function shitudianshu()
	local tInfo = GetMPBaseInfo()
	Talk(5,"shifu",	"<color=yellow>觤 S? <color> l? ph莕 thng m? s? ph? nh薾 頲 sau khi  t? ho祅 th祅h Nhi謒 v? S? . 1  t? ho祅 th祅h xong nhi謒 v? trong th阨 gian qui nh s? t苙g cho s? ph? <color=green>10<color> 觤 S? . T竎 d鬾g c馻 觤 S?  <color=yellow> chuy觧 th祅h ph莕 thng c馻 s? ph?<color> ho芻 <color=yellow>chuy觧 th祅h 觤 S? c<color>.","S? ph? c? th? n <color=yellow> Qu鑓 T? gi竚 <color> l蕐 觤 S?  chuy觧 th祅h ph莕 thng, <color=yellow>m鏸 甶觤 chuy觧 th祅h 1 ph莕 thng<color>. Chuy觧 th祅h 甶觤 s? ph秈 ti猽 hao <color=yellow>S?  ph? ch?<color> m鏸 l莕 chuy觧 1 甶觤 S?  ph秈 ti猽 hao 1 t? S? у. <color=green>nh璶g c╪ c? ng c蕄 th? nghi謕 cao th蕄 c馻 s? ph? m? tr鵦 ti誴 chuy觧 i 1 b? ph薾 ph莕 thng<color>.","S? ph? c騨g c? th? l蕐 觤 S?  chuy觧 th祅h <color=yellow>觤 S? c<color>, c騨g ph秈 ti猽 hao<color=yellow>S?  ph? ch?<color> m鏸 l莕 chuy觧 1 甶觤 S?  ph秈 m蕋 1 t? s? . Xin l璾 ?, <color=green>L骳 chuy觧 觤 S?  c莕 c? S?  ph? ch?, kh玭g th? c╪ c? ng c蕄 th? nghi謕 c馻 s? ph? m? chuy觧 i<color>.","T? khi t輓h Nhi謒 v? S?  c馻 s? ph? giao cho , <color=green>觤 S?  s? b籲g 0 sau 24 ti課g<color>. Ngh躠 l? 甶觤 s?  t 頲 sau m鏸 nhi謒 v? s? kh玭g l璾 l筰 trong nhi謒 v? l莕 sau.","Ъng c蕄 th? nghi謕 c祅g cao, 甶觤 s?  nh薾 頲 c祅g nhi襲.")
end
	
function shidedianshu()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"觤 S? у l? tr? s? <color=yellow>Th? Nghi謕 Ъng C蕄<color> 頲 x竎 nh, do 觤 S?  c閚g th猰 S?  ph? ch?, 頲 ti課 h祅h chuy觧 i t筰 <color=yellow>Qu鑓 T? gi竚<color>.","觤 S?  m鏸 ng祔 s? gi秏 甶 <color=green>1%<color>.")
end
	
function shouyedengji()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"Th? Nghi謕 Ъng C蕄 th? hi謓 ng c蕄 c馻 b筺 khi l? s? ph?, do s? s? lng 觤 S? c quy誸 nh. <color=yellow>觤 S? c c祅g nhi襲 , th? nghi謕 ng c蕄 c祅g cao, b筺 c? th? thu nh薾  t? c祅g nhi襲 <color>. Hi謓 t筰 c蕄 cao nh蕋 c馻 Th? Nghi謕 Ъng C蕄 l? 10,  t? thu nh薾 c? th? l猲 n 15 ngi.","Di y l? thuy誸 minh c馻 10 Th? Nghi謕 Ъng C蕄 c? b秐: \n\nC蕄 1 觤 S? c <color=yellow>0<color> d蒼 頲 <color=yellow>3<color>  . C蕄 6 觤 S? c <color=yellow>1200<color> d蒼 頲 <color=yellow>8<color>  \nC蕄 2 觤 S? c <color=yellow>100<color> d蒼 頲 <color=yellow>4<color>  . C蕄 7 觤 S? c <color=yellow>1600<color> d蒼 頲 <color=yellow>9<color>  \n C蕄 3 觤 S? c <color=yellow>300<color> d蒼 頲 <color=yellow>5<color>  . C蕄 8 觤 S? c <color=yellow>2000<color> d蒼 頲 <color=yellow>10<color>  \n蔯p 4 觤 S? c <color=yellow>550<color> d蒼 頲 <color=yellow>6<color>  . C蕄 9 觤 S? c <color=yellow>2500<color> d蒼 頲 <color=yellow>12<color>  \nC蕄 5 觤 S? c <color=yellow>850<color> d蒼 頲 <color=yellow>7<color>  . C蕄 10 觤 S? c <color=yellow>3000<color> d蒼 頲 <color=yellow>15<color>  ")
end
	
function huahong()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=yellow>Hoa H錸g Qu鑓 T? Gi竚<color>l? tri襲 nh x﹜ d鵱g  khen thng cho v? h鋍. B筺 c? th? k猽 l謓h  n <color=yellow> Qu鑓 T? gi竚<color><color=yellow>mua Hoa H錸g<color>, khi l謓h  ng祔 m閠 trng th祅h, b筺 c? th? nh薾 頲 <color=yellow>b鎛g l閏 tng 鴑g<color>. N誹 l謓h  xu蕋 s? v? t y猽 c莡, b筺 c? th? nh薾 頲 h琻 g蕄 <color=green>6 l莕<color> b鎛g l閏 Hoa H錸g.","Xin l璾 ?, <color=yellow>t? khi b竔 s? tr? th祅h  t? ch輓h th鴆, nh鱪g b鎛g l閏 trc y s? ph? kh玭g nh薾 頲<color>. N誹 nh?  t? c蕄 65 ch輓h th鴆 b竔 s? tr? th祅h  t? ch輓h th鴆, b鎛g l閏 trc c蕄 65 nh? c蕄 30, 40, 50 v? 60, s? ph? s? kh玭g nh薾 頲.","<color=yellow>M鏸 s? ph? ch? nh薾 b鎛g b閏 m? hi謓 t筰  t? ch璦 nh薾<color>. N誹  t? n祇 t 甶襲 ki謓 th? s? ph? trc s? nh薾 b鎛g l閏, s? ph? sau kh玭g nh薾 頲. Sau khi 2 ngi ch琲 k誸 l祄 s?  t筸 th阨, s? ph? c? th? xem 頲 s? ph? trc c馻  t?  nh薾 頲 b鎛g l閏 n祇 tr猲 giao di謓 s?  b籲g c竎h nh蕄 chu閠 ph秈 m鬰 'Tra xem Hoa h錸g'")
end
	
function fenglu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=yellow>B鎛g l閏 Qu鑓 T? gi竚 <color> l? n琲 h錳 b竜 c馻 tri襲 nh v? vi謈 b筺 mua Hoa H錸g b錳 dng  t?, mua nh鱪g v藅 ph萴 qu? hi誱 ? <color=yellow>Qu鑓 T? gi竚<color>.","Hi謓 t筰 ? <color=yellow>Qu鑓 T? gi竚<color> c? b竛 r蕋 nhi襲 v藅 ph萴, b鎛g l閏 Qu鑓 T? gi竚.","Nh薾 b鎛g l閏 Qu鑓 T? gi竚 kh玭g 頲 n <color=yellow> Qu鑓 T? gi竚 <color>, tr鵦 ti誴 l祄 tr猲 <color=yellow>giao di謓 s? <color>. Tr猲 chu閠 ph秈 ch? t猲  t?, ch鋘 Hoa H錸g tr猲 <color=yellow>giao di謓 Hoa H錸g<color>. C? th? tra xem t譶h h譶h trng th祅h c馻  t? tr猲 giao di謓 Hoa H錸g, c? th? <color=yellow>nh薾 b鎛g l閏<color> trong giao di謓 n祔.")
end

function shichushi()
	local tInfo = GetMPBaseInfo()
	Say("C? 3 lo筰 ch蕀 d鴗 quan h? th莥 tr?: xu蕋 s?, tr鬰 xu蕋 s? m玭 v? ph秐 b閕 s? m玭.",
		4,
		"怎么出师/shichushi1",
		"如何驱逐师门/shichushi2",
		"背叛师父意味着什么/shichushi3",
		"没什么，只是看看。/no_say"	
		)
end
	
function shichushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(4,"shichushi",	"Khi l謓h  t n<color=green>73<color> c蕄, b筺 c? th? n <color=yellow>Qu鑓 T? gi竚<color> nh薾 nhi謒 v? xu蕋 s?. Nh薾 頲 <color=yellow>'Xu蕋 S? Ti猽'<color>, t? i v韎   ra ngo礽 th祅h, d飊g Xu蕋 S? Ti猽 g鋓 ra <color=yellow>Tu莕 kh秓 Qu鑓 T? gi竚<color>, l? ngi c馻 tri襲 nh ph竔 n  ki觤 tra xu蕋 s?.","Sau khi g鋓 tu莕 kh秓 Qu鑓 T? Gi竚 ra, ph秈 <color=yellow>nh b筰<color> h緉. Xin l璾 ?, <color=green> bc cu鑙 c飊g ph秈 do l謓h  ho祅 th祅h<color>.","Sau khi nh b筰 tu莕 kh秓 Qu鑓 T? Gi竚, b筺 v? nh鉳 l謓h  d飊g ng t竎 <color=yellow>'B竔'<color> ? c? li g莕  xu蕋 s?.","N誹 <color=yellow>Hoa H錸g Qu鑓 T? Gi竚<color> m?  t? b筺 mua khi <color=green>xu蕋 s? 頲100% b鎛g l閏<color>; <color=green>sau 15 ng祔<color>, <color=green>c? th? l筰 nh薾 頲 100% b鎛g l閏<color>; <color=green>h琻 15 ng祔<color>, <color=green>c遪 nh薾 th猰 100% b鎛g l閏<color>, <color=green> t鎛g c閚g l? 300% b鎛g l閏<color>. Xin nh薾 thng tr猲 giao di謓 th玭g tin s? .")
end

function shichushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"shichushi",	"Khi  t? kh玭g t th? <color=yellow>Tr鬰 xu蕋 s? m玭<color>. C竎h tr鬰 xu蕋 s? m玭: trong <color=yellow>giao di謓 s? <color>, ch? v祇 <color=yellow>chu閠 ph秈<color> t猲  t? mu鑞 tr鬰 xu蕋, r錳 tr鬰 xu蕋 ti誴  t? kh竎.","L骳 tr鬰 xu蕋  t? ph秈 ti猽 hao <color=yellow>99 t? s? <color>, ng th阨 kh玭g 頲 nh薾  t? trong v遪g <color=yellow>24 ti課g<color>. \n Tr鬰 xu蕋  t? t筸 th阨 kh玭g c? m苩 h筺 ch? n祔. <color=yellow>е t? ch輓h th鴆 r阨 m筺g t? 7 ng祔 tr? l猲 c騨g kh玭g c? h筺 ch? <color>.","N誹   t? n祔 mua <color=yellow>Hoa H錸g Qu鑓 T? Gi竚<color>, sau khi b? tr鬰 xu蕋<color=green>nh鱪g b鎛g l閏 li猲 quan m?  t?  ch璦 nh薾 s? b? h駓 b?<color>. \n в n b?, <color=green>sau khi b? tr鬰 xu蕋 15 ng祔,  t? n祔 nh薾 頲 80% b鎛g l閏<color>, <color=green>h琻 15 ng祔<color>, <color=green>nh薾 th猰 80% b鎛g l閏<color>, <color=green>t鎛g c閚g 160% b鎛g l閏<color>. Xin l璾 ? ch? 頲 nh薾 trong giao di謓 th玭g tin s? .")
end

function shichushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"shichushi",	"е t? c? th? s? <color=yellow>ph秐 b閕 s? m玭<color>. Xin ch? ? 甶觤 n祔, ph秈 ngh? n c秏 nh薾 c馻  t?.","N誹   t? n祔 mua<color=yellow>Hoa H錸g Qu鑓 T? Gi竚<color>, sau khi ph秐 b閕 s? m玭, <color=green>nh鱪g b鎛g l閏 m?  t? n祔 ch璦 nh薾 s? b? h駓 b?<color>. \n в n b?, <color=green>15 ng祔 sau khi ph秐 b閕 s? m玭 頲 nh薾 100% b鎛g l閏<color>, <color=green>h琻 15 ng祔<color>, <color=green>nh薾 頲 100% b鎛g l閏<color>,<color=green>t鎛g c閚g 200% b鎛g l閏<color>. Ch? 頲 nh薾 trong giao di謓 th玭g tin s? .")
end


function tudi()
	local tInfo = GetMPBaseInfo()
	Say("以下是你想知道的徒弟资料。提醒一下，这个系统有很多操作，<color=yellow>鼠标必须指定菜单上出现的人的名字<color>后<color=yellow>在你的信息界面<color>打开它。",
		5,
		"如何拜师/baishi",
		"师徒后的任务是什么？/turenwu",
		"能得到什么回报？/jiangli",
		"如何结束师徒关系/tuchushi",
		"没什么，只是看看。/no_say")
end

function baishi()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","Ki觤 tra l筰 h祅h trang c馻 b筺, b猲 trong c? 1 t蕀 <color=yellow>thi謕 b竔 s?<color>. nh蕄 chu閠 ph秈  s? d鬾g thi謕 b竔 s?, m韎 g鰅 頲 thi謕 b竔 s?, c竎 s? ph? l﹏ c﹏ u nh薾 頲. <color=green>N誹 ch鋘 ra ngi mu鑞 nh薾 b筺 l祄  t?<color>, ch? c莕 x竎 nh薾 ch鋘 l? tr? th祅h <color=green> t? t筸 th阨<color>. ","Sau khi th祅h  t? t筸 th阨, trong F3 giao di謓 s? c? nhi襲 <color=yellow>giao di謓 th玭g tin s? <color>. Xin ch? ?!","L骳 b筺 t 頲 <color=green> c蕄 10<color>, s? th祅h  t? ch輓h th鴆. C? th?: h頿 th祅h i v韎 s? ph?, sau  d飊g ng t竎 <color=yellow>'B竔'<color> ? c? li g莕 l? tr? th祅h <color=green> t? ch輓h th鴆<color>.","N誹 b筺  ng k? l祄 s? ph? th? kh玭g th? b竔 s? 頲 n鱝.")
end
	
function turenwu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","Sau khi b竔 s?, s? ph? u truy襫 <color=yellow>Nhi謒 v? S? <color> m鏸 ng祔, t鎛g c閚g c? 7 nhi謒 v?  ch鋘. B筺 c? th? trao i v韎 s? ph? v? ch鋘 nhi謒 v? l祄. Sau khi truy襫 l謓h, b筺 c? th? th蕐 頲 c竎 nhi謒 v? trong<color=yellow>giao di謓 th玭g tin s? <color>, sau  ch鋘 <color=yellow>nhi謒 v?<color>.","K? h筺 sau khi truy襫 l謓h l? <color=green>24 ti課g<color>, ph秈 ho祅 th祅h nhi謒 v? trong v遪g 24 ti課g, trong th阨 h筺  kh玭g 頲 giao nhi謒 v? kh竎.","Sau khi ho祅 th祅h nhi謒 v?, b筺 s? nh薾 頲 <color=yellow>khen thng nhi謒 v?<color>. Nhi謒 v? kh玭g gi鑞g nhau, ph莕 thng c騨g kh玭g gi鑞g nhau.","Ch? ?: khi t 頲 <color=green>c蕄 73<color>, ph莕 thng b筺 nh薾 頲 s? gi秏 c遪 m閠 n鯽, khi t n <color=green>c蕄 80<color>, b筺 s? kh玭g c遪 頲 nh薾 thng n鱝.")
end
	
function jiangli()
	local tInfo = GetMPBaseInfo()
	Talk(5,"tudi","L頸 輈h l韓 nh蕋 c馻 b筺 l? c? 頲 s? ph?, s? ph? s? gi髉 輈h r蕋 nhi襲 trong cu閏 i giang h? c馻 b筺, s? , s? huynh, s? mu閕, s? t? u l? nh鱪g ngi b筺 ng h祅h tr猲 giang h? c馻 b筺.","C? th?: ngay khi b筺 tr? th祅h <color=green> t? ch輓h t鴆<color>, b筺 c? th? t韎 <color=yellow>Qu鑓 T? gi竚 <color> nh薾 bao <color=green>'H藆 Sinh Kh? 髖'<color>, y l? qu? g苝 m苩 c馻 s? ph? i v韎 b筺, trang b? b猲 trong u l? nh鱪g m鉵 th鵦 d鬾g i v韎 t﹏ th? l? b筺.","Khi t <color=green>c蕄 45<color>, c? th? t韎 <color=yellow>Qu鑓 T? gi竚<color> nh薾 bao <color=green>'Ti襫 Tr譶h T? C萴'<color>.","Khi t <color=green>c蕄 60<color>, n <color=yellow>Qu鑓 T? gi竚<color> nh薾 bao <color=green>'S? у T譶h Th﹎'<color>.","Khi t <color=green>c蕄 73<color> c? th? xu蕋 s?, b筺 c? th? c飊g s? ph? ho祅 th祅h <color=yellow>nhi謒 v? xu蕋 s?<color>. Sau khi xong nhi謒 v? 頲 nh薾 bao <color=green>'S?  kh? qu猲'<color>, y l? ph莕 thng c馻 s? ph? i v韎 s? trng th祅h c馻 b筺.")
end


function tuchushi()
	local tInfo = GetMPBaseInfo()
	Say("有3种类型的终止关系:出师,开除和背叛。",
	4,
		"怎么出师？/tuchushi1",
		"如何退出师门/tuchushi2",
		"背叛师父意味着什么？/tuchushi3",
		"没什么，只是看看。/no_say"	
		)
end
	
function tuchushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"tuchushi",	"Khi t <color=green>c蕄 73<color>, n <color=yellow>Qu鑓 T? gi竚<color> t譵 s? ph?  nh薾 nhi謒 v? xu蕋 s?. Nh薾 頲 <color=yellow>'Xu蕋 S? Ti猽'<color>, t? i v韎   ra ngo礽 th祅h, d飊g Xu蕋 S? Ti猽 g鋓 ra <color=yellow>Tu莕 kh秓 Qu鑓 T? gi竚<color>, l? ngi c馻 tri襲 nh ph竔 n  ki觤 tra xu蕋 s?.","Sau khi g鋓 tu莕 kh秓 Qu鑓 T? gi竚 ra, ph秈 <color=yellow>nh b筰<color> h緉. Ch? ?<color=green>bc cu鑙 c飊g ph秈 ch輓h b筺 ho祅 th祅h<color>.","Sau khi nh b筰 tu莕 kh秓 Qu鑓 T? gi竚, b筺 v? s? ph? t? i, l祄 ng t竎 <color=yellow>'B竔'<color> s? ph?  xu蕋 s?.")
end

function tuchushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(1,"tuchushi",	"S? ph? c? th?<color=yellow>tr鬰 xu蕋 s? m玭<color>  t?, ph秈 ch? ? u n祔. \n N誹 b? tr鬰 xu蕋 s? m玭, b筺 ph秈 b竔 ngi kh竎 l祄 s? ph?.")
end

function tuchushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"tuchushi",	"N誹 b筺 b蕋 m穘 v韎 s? ph?, c? th?<color=yellow>ph秐 b閕 s? m玭<color>. C竎h l祄: trong <color=yellow>giao di謓 s? <color>, nh蕄 <color=yellow>chu閠 ph秈<color> v祇 t猲 s? ph?  ch鋘 ph秐 b閕 s? m玭.","Ph秐 b閕 s? m玭 ph秈 ti猽 hao<color=yellow>99 s?  ph? ch?<color>, ng th阨 sau khi ph秐 b閕 s? m玭 trong v遪g <color=yellow>24 ti課g<color> kh玭g th? b竔 s?. \n N誹 b筺 l?  t? t筸 th阨, kh玭g c? h筺 ch? n祔. <color=yellow>s? ph? r阨 m筺g t? 7 gnay2 tr? l猲 c騨g kh玭g c? h筺 ch? nh? v藋<color>.")
end



function no_say()
end


	
function renwuchaxun()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"no_say","    Khi tr? th祅h  t? ch輓h th鴆 c馻 ngi kh竎, m鏸 ng祔 u ho祅 th祅h 1 Nhi謒 v? S?  do s? ph? truy襫 <color=yellow> khi sau khi ho祅 th祅h nhi謒 v?, s? nh薾 thng t飝 theo nhi謒 v?, s? ph? 頲 觤 S? . <color>\n M閠 khi  t? t c蕄 73, ph莕 thng gi秏 甶 m閠 n鯽; c蕄 80 s? kh玭g c? thng. \n Nhi謒 v? S?  t鎛g c閚g c? 7 lo筰, m鏸 ng祔 ch鋘 1 trong   giao nhi謒 v?<color=yellow>sau khi b竔 s? d鵤 theo y猽 c莡 v? trao i c馻 b筺 v韎 s? ph?  ch鋘 nhi謒 v?<color>.","Gi韎 th謚 Nhi謒 v? S? : \n1 Ho祅 th祅h 2 l莕 nhi謒 v? S? c蕄 s? m玭 ho芻 20 thng h閕, m鴆  ng g鉷 s? m玭 15 甶觤, <color=white>Danh v鋘g 50 甶觤<color>\n2 Ho祅 th祅h 5 l莕 nhi謒 v? s竧 th? ho芻 20 l莕 thng h閕, danh v鋘g: 50 甶觤\n3 1 l莕 nh tr薾 ho芻 ho祅 th祅h 20 l莕 thng h閕, ghi c玭g 150 m <color=white>kinh nghi謒 (ng c蕄* ng c蕄*110)<color>\n4 T祅g ki誱 2 l莕 ho芻 20 l莕 thng h閕, kinh nghi謒 (ng c蕄*ng c蕄*110)\n5 Th竔 H? qu? 4 ph? qu竔 ho芻 ho祅 th祅h 20 l莕 thng h閕, kinh nghi謒 (ng c蕄*ng c蕄*120)\n6 ch箉 xong 4 l莕 thuy襫 r錸g ho芻 20 l莕 thng h閕, kinh nghi謒 (ng c蕄*ng c蕄*110)\n7 Цnh v? i 1 m譶h: 5 l莕 ho芻 20 l莕 thng h閕, kinh nghi謒 (ng c蕄*ng c蕄*100)\n<color=white>Ch? m祏 tr緉g l? thng cho  t? kh玭g thu閏 m玭 ph竔 n祇, ph莕 thng c馻 m鏸 nhi謒 v? kh玭g gi鑞g nhau<color>.")
end

