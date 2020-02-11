--¹ÅÌìÃÅ±¦ÏäÎïÆ·½Å±¾
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\task_access_code_def.lua")

--±Ø¶¨²»³öÌìÃÅ½ğÁîµÄ´ÎÊıÏŞÖÆ
N_NEVER_X_AWARD_LIMIT=100

SZ_LOG_TITLE="Cæ Thiªn M«n B¶o R­¬ng"

--ÓÃÀ´±íÊ¾Ëæµ½ÁËÌìÃÅ½ğÁî
GET_TIAMMENJINLING_FLAG=65535

t_special_award = --Èç¹ûÓĞ±Ø³öÔÚÕâ¸ö±íÅäÖÃ
{
	nSaveTaskId = 3080,
	nSaveTaskAccessCode = TASK_ACCESS_CODE_GUTIANMENBAOXIANG,
	nSaveTaskWordIdx = 1,
	nSureAwardCount = 600,
	nAddcounterPerUpdate=1,--Ã¿Ö´ĞĞÒ»´ÎUpdate¼ÆÊıÆ÷Ôö¼ÓÖµ
	t_award =
	{
		{{MA_TianMenJinLing, {}}, 10000},
	},
}

--±íÊ¾Ëæµ½ÁËÌìÃÅ½ğÁî£¬µ«ÊÇ²»¸øÈÎºÎ¶«Î÷
function _PreGetTianMenJinLing()
	local r = GET_TIAMMENJINLING_FLAG;
	return r, r, r, r;
end

--¸ÅÂÊÃ»Âú100% Ê£ÏÂµÄ¸ÅÂÊ¸øÌìÃÅ½ğÁî
t_normal_award=
{
	{{"Qu©n C«ng Huy Hoµng",{2,1,9977,1},30,1, {1, 100}},1},-----------600
	
	{{"H¾c Ngäc §o¹n Tôc Cao",{1,0,6,1},nil,nil, {1, 100}},500},
	{{"Sinh Sinh Hãa T¸n",{1,0,16,1},nil,nil, {1, 100}},500},
	
	{{"Thiªn Th¹ch linh th¹ch",{2,1,1068,1},nil,1, {1, 100}},1},------3000
	
	{{"V¹n VËt Quy Nguyªn §¬n",{1,0,11,1},nil,nil, {1, 100}},500},
	{{"Tói tiÒn",{2,1,30367,1},nil,nil, {1, 100}},500},
	{{"Cöu chuyÓn håi hån ®¬n",{1,0,32,1},nil,nil, {1, 100}},200},
	
	{{"Qu©n C«ng Huy Hoµng",{2,1,9977,1},30,1, {1, 100}},2},-----------600
	
	{{"C©y B¸t Nh· nhá",{2,0,504,1},30,nil, {1, 100}},400},
	{{"M¶nh Thiªn th¹ch",{2,2,7,1},nil,nil, {1, 100}},400},
	
	{{"Qu©n C«ng Huy Hoµng",{2,1,9977,1},30,1, {1, 100}},2},-----------600
	
	{{"Tói tiÒn",{2,1,30367,2},nil,nil, {1, 100}},2500},
	
	{{"Qu©n C«ng Huy Hoµng",{2,1,9977,1},30,1, {1, 100}},2},-----------600
	
	{{"Lôc ThÇn hoµn",{2,1,1064,1},30,nil, {1, 100}},200},
	{{"Tu Ch©n YÕu QuyÕt",{2,0,554,1},30,nil, {1, 100}},200},
	{{"B¹ch C©u Hoµn",{2,1,270,1},30,nil, {1, 100}},200},
	{{"Tam Thanh hoµn",{2,1,1097,1},30,nil, {1, 100}},200},
	
	--ÌìÃÅ½ğÁî5¸öÎ»ÖÃ¿ÉÒÔËæµ½£¬ºÙºÙ,×Ü¸ÅÂÊÎª5
	---±íÊ¾Ëæµ½ÁËÌìÃÅ½ğÁî£¬µ«ÊÇ²»¸øÈÎºÎ¶«Î÷
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"Tói tiÒn",{2,1,30367,3},nil,nil, {1, 100}},1000},
	
	{{"Qu©n C«ng Huy Hoµng",{2,1,9977,1},30,1, {1, 100}},3},-----------600
	
	{{"Tói tiÒn",{2,1,30367,4},nil,nil, {1, 100}},500},
	
	{{"§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch",{2,1,1067,1},nil,1, {1, 100}},1},---------3000
	
	{{"C­êng Lôc ThÇn hoµn",{2,1,1065,1},30,nil, {1, 100}},200},
	{{"C©y B¸t Nh·",{2,0,398,1},30,nil, {1, 100}},100},
	{{"ThÇn N«ng §¬n",{2,1,343,1},30,nil, {1, 100}},100},
	{{"§¹i B¹ch C©u hoµn",{2,1,1007,1},30,nil, {1, 100}},200},
	{{"C­êng Tam Thanh hoµn",{2,1,1098,1},30,nil, {1, 100}},200},
	{{"Tói tiÒn",{2,1,30367,8},nil,nil, {1, 100}},333},
	
	--ÌìÃÅ½ğÁî5¸öÎ»ÖÃ¿ÉÒÔËæµ½£¬ºÙºÙ,×Ü¸ÅÂÊÎª5
	---±íÊ¾Ëæµ½ÁËÌìÃÅ½ğÁî£¬µ«ÊÇ²»¸øÈÎºÎ¶«Î÷
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"Lôc ThÇn Tiªn ®¬n",{2,1,1066,1},30,nil, {1, 100}},100},
	{{"Qu©n C«ng Ch­¬ng",{2,1,9999,1},30,nil, {1, 100}},100},
	{{"§¹i Nh©n s©m",{2,0,553,1},30,nil, {1, 100}},100},
	{{"B¹ch C©u Tiªn ®¬n",{2,1,1008,1},30,nil, {1, 100}},100},
	{{"Tam Thanh Tiªn ®¬n",{2,1,1099,1},30,nil, {1, 100}},100},
	
	--ÌìÃÅ½ğÁî5¸öÎ»ÖÃ¿ÉÒÔËæµ½£¬ºÙºÙ,×Ü¸ÅÂÊÎª5
	---±íÊ¾Ëæµ½ÁËÌìÃÅ½ğÁî£¬µ«ÊÇ²»¸øÈÎºÎ¶«Î÷
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"Qu©n C«ng bµi",{2,1,9997,1},30,nil, {1, 100}},100},
	{{"Tói h¹t gièng",{2,1,30087,1},30,nil, {1, 100}},100},
	{{"Tói tiÒn",{2,1,30367,16},nil,nil, {1, 100}},100},
	
	--ÌìÃÅ½ğÁî5¸öÎ»ÖÃ¿ÉÒÔËæµ½£¬ºÙºÙ,×Ü¸ÅÂÊÎª5
	---±íÊ¾Ëæµ½ÁËÌìÃÅ½ğÁî£¬µ«ÊÇ²»¸øÈÎºÎ¶«Î÷
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"S­ m«n lÖnh kú",{2,1,1017,1},30,nil, {1, 100}},50},
	{{"Tói tiÒn",{2,1,30367,32},nil,nil, {1, 100}},90},
	{{"Tø Linh Quy Nguyªn §¬n",{2,1,30352,1},30,nil, {1, 100}},50},
	{{"Hoµng Kim §¹i Hång Bao (trèng)",{2,1,538,1},30,nil, {1, 100}},10},
	{{"Tö Kim Hång Bao (trèng)",{2,1,536,1},30,nil, {1, 100}},10},
	{{"Qu©n C«ng §¹i",{2,1,9998,1},30,nil, {1, 100}},10},
	
	--ÌìÃÅ½ğÁî5¸öÎ»ÖÃ¿ÉÒÔËæµ½£¬ºÙºÙ,×Ü¸ÅÂÊÎª5
	---±íÊ¾Ëæµ½ÁËÌìÃÅ½ğÁî£¬µ«ÊÇ²»¸øÈÎºÎ¶«Î÷
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"Tói tiÒn",{2,1,30367,40},nil,nil, {1, 100}},10},
	{{"Thiªn Th¹ch Tinh Th¹ch",{2,1,1009,1},nil,nil, {1, 100}},10},
	
	{{"B¹ch Kim §¹i Hång Bao (kh«ng)",{2,1,30228,1},30,nil, {1, 100}},10},--400
}

t_require=
{
	{"Cæ Linh Ngäc",{2,1,30369,1}},
}

function OnUse_Real(nItemIdx)
	local szTitle = format("Më B¶o R­¬ng Cæ Thiªn M«n cÇn tiªu hao thªm Cæ Linh Ngäc x 1, cã muèn më kh«ng? ")
	local strtab = {
			format("\n muèn më/#_ConfirmUse(%d)", nItemIdx),
			"\n rót lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function _ConfirmUse(nItemIdx)
	
	local nNeedRoom = 1
	local nNeedWeight = 100
	if gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,"") ~= 1 then
		Talk(1,"",format("Hµnh trang kh«ng ®ñ « trèng %d hoÆc nh©n vËt kh«ng ®ñ søc lùc.!", nNeedRoom))
		return 0,0,0,-1
	end
	
	if 1 == _MissionAward_CheckCost(t_require, 1) then
		if 1 == DelItemByIndex(nItemIdx, 1) then
			local nAdd = t_special_award.nAddcounterPerUpdate or 1
			local g,d,p,n = MissionAward_UpdateSpecialAward(t_special_award, SZ_LOG_TITLE, nAdd, 1)--±Ø³öÌìÃÅ½ğÁî
			
			local N_MAX_TRY_CNT = 5
			local nTryCnt = 0;
			while not n or n<=0 or _IsTianMenJinLing(g,d,p,n)==1 do
				
				local nCnt,nMax = MissionAward_GetSpecialAwardCounter(t_special_award)
				nTryCnt = nTryCnt + 1
				if nTryCnt > N_MAX_TRY_CNT then
					WriteLog(format("[%s] open [gutianmenbaoxiang][%s], for [%d/%d] times rand, get none item, specitial counter=[%d/%d] ", GetName(), SZ_LOG_TITLE, nTryCnt, N_MAX_TRY_CNT, nCnt,nMax))
					return 0,0,0,-1
				end
				
				g,d,p,n = _MissionAward_RandAward(t_normal_award, SZ_LOG_TITLE)
				
				if _IsTianMenJinLing(g,d,p,n)==1 then
					--1~N_NEVER_X_AWARD_LIMIT±Ø²»³öÌìÃÅ½ğÁîĞèÒª¼ÌĞøÑ­»·ÖØĞÂËæ»ú
					if nCnt and nCnt > N_NEVER_X_AWARD_LIMIT then
    					return MA_SpecialAward(t_special_award, SZ_LOG_TITLE)--Ëæµ½ÁËÌìÃÅ½ğÁî
    				end
				end
			end
			return g,d,p,n
		end
	end
end

function _IsTianMenJinLing(g,d,p,n)
	local r = GET_TIAMMENJINLING_FLAG;
	if g==r and d==r and p==r and n==r then
		return 1
	end
	return 0
end

function nothing()
end
