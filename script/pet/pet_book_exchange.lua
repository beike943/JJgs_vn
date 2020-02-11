Include ("\\Script\\lib\\globalfunctions.lua")

--Ìá½»ÃØ¼®¶Ò»»³èÎïÊé
N_PUTINITEMPARAM = 177156
N_MAX_SUMMIT_ITEM_COUNT = 5
N_NEED_MONEY = 100000
STR_PLEASE_SUMMIT_BOOK = "H·y giao mËt tÞch"
STR_SUMMIT_DESC = "X¸c ®Þnh dïng 5 MËt TÞch S­ M«n cao cÊp cïng 10 vµng ®æi kü n¨ng b¹n ®ång hµnh kh«ng?"
SZ_THIS_SCRIPT = "\\script\\pet\\pet_book_exchange.lua"
MAX_RATE = 10000

--t_item_list = {}
t_book_award=
{
    --{1,400,"ÕæÆø»¤Ìå1¼¶",{2,150,1,1},0,0},
    {1,500,"Ch©n khÝ hé thÓ CÊp 2",{2,150,2,1},0,0},
    {1,333,"Ch©n khÝ hé thÓ CÊp 3",{2,150,3,1},0,0},
    {1,167,"Ch©n khÝ hé thÓ CÊp 4",{2,150,4,1},0,0},
    --{1,400,"ÒæÊÙÑÓÑô1¼¶",{2,150,5,1},0,0},
    {1,500,"Ých Thä Diªn D­¬ng CÊp 2",{2,150,6,1},0,0},
    {1,333,"Ých Thä Diªn D­¬ng CÊp 3",{2,150,7,1},0,0},
    {1,167,"Ých Thä Diªn D­¬ng CÊp 4",{2,150,8,1},0,0},
    --{1,400,"Ç¿Éí°ÔÌå1¼¶",{2,150,9,1},0,0},
    {1,500,"C­êng Th©n B¸ ThÓ CÊp 2",{2,150,10,1},0,0},
    {1,333,"C­êng Th©n B¸ ThÓ CÊp 3",{2,150,11,1},0,0},
    {1,167,"C­êng Th©n B¸ ThÓ CÊp 4",{2,150,12,1},0,0},
    --{1,120,"Òõ·çÊ´¹Ç1¼¶",{2,150,13,1},0,0},
    {1,150 ,"¢m Phong Thùc Cèt CÊp 2",{2,150,14,1},0,0},
    {1,100 ,"¢m Phong Thùc Cèt CÊp 3",{2,150,15,1},0,0},
    {1,50 ,"¢m Phong Thùc Cèt CÊp 4",{2,150,16,1},0,0},
    --{1,20 ,"ÐþÎäÎÞË«1¼¶",{2,150,17,1},0,0},
    {1,25 ,"HuyÒn Vò V« Song CÊp 2",{2,150,18,1},0,0},
    {1,17 ,"HuyÒn Vò V« Song CÊp 3",{2,150,19,1},0,0},
    {1,8  ,"HuyÒn Vò V« Song CÊp 4",{2,150,20,1},0,0},
    --{1,200,"ÎåÐÐÎÞÏà1¼¶",{2,150,21,1},0,0},
    {1,250,"V« Hµnh V« T­¬ng CÊp 2",{2,150,22,1},0,0},
    {1,170,"V« Hµnh V« T­¬ng CÊp 3",{2,150,23,1},0,0},
    {1,80 ,"V« Hµnh V« T­¬ng CÊp 4",{2,150,24,1},0,0},
    --{1,400,"½ðÁé¸½Ìå1¼¶",{2,150,25,1},0,0},
    {1,500,"Kim Linh Phô ThÓ CÊp 2",{2,150,26,1},0,0},
    {1,333,"Kim Linh Phô ThÓ CÊp 3",{2,150,27,1},0,0},
    {1,167,"Kim Linh Phô ThÓ CÊp 4",{2,150,28,1},0,0},
    --{1,320,"Ä¾Áé¸½Ìå1¼¶",{2,150,29,1},0,0},
    {1,400,"Méc Linh Phô ThÓ CÊp 2",{2,150,30,1},0,0},
    {1,270,"Méc Linh Phô ThÓ CÊp 3",{2,150,31,1},0,0},
    {1,130 ,"Méc Linh Phô ThÓ CÊp 4",{2,150,32,1},0,0},
    --{1,400,"Ë®Áé¸½Ìå1¼¶",{2,150,33,1},0,0},
    {1,500,"Thuû Linh Phô ThÓ CÊp 2",{2,150,34,1},0,0},
    {1,333,"Thuû Linh Phô ThÓ CÊp 3",{2,150,35,1},0,0},
    {1,167,"Thuû Linh Phô ThÓ CÊp 4",{2,150,36,1},0,0},
    --{1,160,"»ðÁé¸½Ìå1¼¶",{2,150,37,1},0,0},
    {1,200,"Ho¶ Linh Phô ThÓ CÊp 2",{2,150,38,1},0,0},
    {1,133 ,"Ho¶ Linh Phô ThÓ CÊp 3",{2,150,39,1},0,0},
    {1,67 ,"Ho¶ Linh Phô ThÓ CÊp 4",{2,150,40,1},0,0},
    --{1,400,"ÍÁÁé¸½Ìå1¼¶",{2,150,41,1},0,0},
    {1,500,"Thæ Linh Phô ThÓ CÊp 2",{2,150,42,1},0,0},
    {1,333,"Thæ Linh Phô ThÓ CÊp 3",{2,150,43,1},0,0},
    {1,167,"Thæ Linh Phô ThÓ CÊp 4",{2,150,44,1},0,0},
    --{1,320,"ÆÆ¿ÕÕ¶Ó°1¼¶",{2,150,45,1},0,0},
    {1,400,"Ph¸ Kh«ng Tr¶m ¶nh CÊp 2",{2,150,46,1},0,0},
    {1,270,"Ph¸ Kh«ng Tr¶m ¶nh CÊp 3",{2,150,47,1},0,0},
    {1,130 ,"Ph¸ Kh«ng Tr¶m ¶nh CÊp 4",{2,150,48,1},0,0},
    --{1,320,"ÉËº¦¼ÓÉî1¼¶",{2,150,49,1},0,0},
    {1,400,"S¸t th­¬ng gia n©ng cÊp 2",{2,150,50,1},0,0},
    {1,270,"S¸t th­¬ng gia n©ng cÊp 3",{2,150,51,1},0,0},
    {1,130 ,"S¸t th­¬ng gia n©ng cÊp 4",{2,150,52,1},0,0},
    --{1,20 ,"ÇáÁéÑ¸¼²1¼¶",{2,150,53,1},0,0},
    {1,25 ,"Khinh Linh TÊn TËt  CÊp 2",{2,150,54,1},0,0},
    {1,17 ,"Khinh Linh TÊn TËt  CÊp 3",{2,150,55,1},0,0},
    {1,8  ,"Khinh Linh TÊn TËt  CÊp 4",{2,150,56,1},0,0},
    --{1,120,"ÎÞÐÎÖ®¹Æ1¼¶",{2,150,57,1},0,0},
    {1,150 ,"V« H×nh Chi Cæ CÊp 2",{2,150,58,1},0,0},
    {1,100 ,"V« H×nh Chi Cæ CÊp 3",{2,150,59,1},0,0},
    {1,50 ,"V« H×nh Chi Cæ CÊp 4",{2,150,60,1},0,0},
}


function PetBookExchangeMain()
	local szTitle = "Ta ®ang së h÷u mét vµi quyÓn s¸ch kü n¨ng b¹n ®ång hµnh ®ay, chØ cÇn ng­¬i giao cho ta 5 <color=red>MËt tÞch s­ m«n cao cÊp<color> cïng 10 vµng phÝ thñ tôc, ta sÏ ®æi cho ng­¬i mét quyÓn. ThÕ nµo, ®ång ý chø?"
	local tbSay = {}
	tinsert(tbSay, "Ta muèn ®æi /OnExchange")
	tinsert(tbSay, "Th«i, ta kh«ng ®æi/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function OnExchange()
	--PutinItemBox("title", MaxPutinCount, "prompt", "call_back_script", callback_num)
	PutinItemBox(STR_PLEASE_SUMMIT_BOOK, N_MAX_SUMMIT_ITEM_COUNT, STR_SUMMIT_DESC, SZ_THIS_SCRIPT, N_PUTINITEMPARAM)
end

function OnPutinCheck(PutinItemParam, nWorldIdx, nG, nD, nP)
	--local nLevel = GetItemLevel(nWorldIdx)
	local nOk = 0
	if nG == 0 and nD == 107 and (nP >= 166 and nP <= 179) then
		nOk = 1
	end
	
--	if nOK == 1 then
--		t_item_list[getn(t_item_list) + 1] = nWorldIdx
--	else
--		t_item_list = {}
--	end
--	print(format("Put(%d)=%d", nWorldIdx, nOk))
	return nOk
end

function OnPutinComplete(nPutinItemParam)
	local nMoney = GetCash() or 0
	if nMoney < N_NEED_MONEY then
		Talk(1,"",format("Sè vµng hiÖn cã cña ng­¬i kh«ng ®ñ %d vµng!",floor(N_NEED_MONEY/10000)))
		return
	end
	local tbItems = GetPutinItem()
	if getn(tbItems) ~= N_MAX_SUMMIT_ITEM_COUNT then
		Talk(1,"",format("CÇn nép %d quyÓn mËt tÞch s­ m«n cao cÊp!", N_MAX_SUMMIT_ITEM_COUNT))
		return
	end
	Pay(N_NEED_MONEY)
	for i = 1,getn(tbItems) do
		DelItemByIndex(tbItems[i][1], -1)
	end
	gf_EventGiveRandAward(t_book_award, MAX_RATE, 1, "S¸ch kÜ n¨ng b¹n ®ång hµnh", "B¾c §Èu L·o Nh©n trao ®æi")
--	local nRand = random(1,getn(t_book_award))
--	local nIndex = AddItem(unpack(t_book_award[nRand]))
--	WriteLog(format("[Account:%s Role:%s] exchange pet book(nRand=%d)(Index:%d) %s(%d, %d, %d, %d)"
--			, GetAccount(), GetName(), nRand, nIndex, GetItemName(nIndex), t_book_award[nRand][1], t_book_award[nRand][2], t_book_award[nRand][3], t_book_award[nRand][4]
--			, nBookId, nNeedMoney, nRet
--			))
end

function no()
end