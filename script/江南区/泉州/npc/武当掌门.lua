--ĞÂÊÖÖ¸Òı
--lijinyong

function main()
	if (GetLevel() < 10) then
		Say("Chµo mõng b¹n trÎ tham gia thÕ giíi Vâ L©m TruyÒn Kú 2! Ta cã thÓ gióp g× ®©y?",3,"Ta muèn t×m hiÓu kiÕn thøc m«n ph¸i./introfaction","Ta muèn nghe truyÒn thuyÕt Vâ §ang./introwudang","Sao ng­¬i mÖt mái thÕ! §õng qu¸ c¨ng th¼ng!/no")
	else
		Say("Ta cã thÓ gióp g× cho ng­¬i?",4,"Ta muèn t×m hiÓu kiÕn thøc m«n ph¸i./introfaction","Ta muèn nghe truyÒn thuyÕt Vâ §ang./introwudang","Ta muèn gia nhËp Vâ §ang./interwudang","§ïa chót th«i!/no")
	end
end;

function introfaction()
	Say("HiÖn tæng céng trªn giang hå cã cöu ®¹i m«n ph¸i nh­ Vâ §ang, ThiÕu L©m, Nga My, C¸i Bang, §­êng M«n...C¸c m«n ph¸i cßn l¹i ®Òu cã së tr­êng riªng. B»ng h÷u theo ®iÒu kiÖn cña m×nh cã thÓ nç lùc phÊn ®Êu, ®Õn cÊp 10 cã thÓ ®Õn c¸c ®¹i m«n ph¸i t×m hiÓu râ ®Æc s¾c cña mçi m«n ph¸i. H·y lµm ®óng lêi ta truyÒn d¹y, nhÊt ®Şnh sÏ m· ®¸o thµnh c«ng!")
end;


function introwudang()
	Say("Tõ khi tæ s­ §¹o NhÊt ch©n nh©n s¸ng lËp Vâ §ang ®Õn nay ®· h¬n 400 n¨m. Tr¶i qua thêi gian, c¸c ®êi tæ s­ dµy c«ng x©y dùng m«n ph¸i, ®Ö tö ®oµn kÕt mét lßng, ®Õn nay Vâ §ang ®· trë thµnh mét cao m«n ®¹i ph¸i trong giang hå. B»ng h÷u r¶nh rçi ®İch th©n lªn Vâ §ang t×m hiÓu!")
end;

function interwudang()
	if (GetPlayerFaction() > 0) then
		Say("Ng­¬i muèn ®ïa g× ®©y? Ch¼ng ph¶i ng­¬i ®· gia nhËp m«n ph¸i råi sao?")
	else
		Say("XĞt thÊy ng­¬i cã thµnh t©m, ta thu nhËn ng­¬i lµm ®Ö tö Vâ §ang ®êi thø 18. Tõ nay ph¶i ch¨m chØ tu luyÖn, ®õng lµm mÊt thanh danh s­ m«n!")
		SetPlayerFaction=2
		AddGlobalNews("Tin tøc liªn quan: Ng­êi ch¬i",GetName().." ®· gia nhËp Vâ §ang.")
	end;
end;

function no()
end;		