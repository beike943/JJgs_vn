--=============================================
--create by baiyun 2009.8.26
--describe:Ô½ÄÏ°æ9ÔÂ·ÝÖÐÇï»î¶¯´´½¨ÎÃ×Ó½Å±¾
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--Ë¢ÐÂÎÃ×ÓµÄ×ø±ê
t_wenzi_sets = {
	[0] = {"T©y BiÖn Kinh", {203, 1522, 3053}},--ÐÇÆÚÈÕ
	[1] = {"B¾c Phông T­êng", {504, 1363, 3081}},--ÐÇÆÚÒ»
	[4] = {"B¾c TuyÒn Ch©u", {108, 1459, 3141}},--ÐÇÆÚËÄ
	[5] = {"T©y Thµnh §«", {301, 1492, 2986}},--ÐÇÆÚÎå
	[6] = {"V©n Méng Tr¹ch", {151, 1545, 3011}},--ÐÇÆÚÁù
};

function main()
	local nDate = tonumber(date("%y%m%d"));
	if nDate > 091108 or nDate < 090918 then
		return 0;
	end
	local nDay = tonumber(date("%w"));
	local nNpcLifeTime = 120 * 60;
	local nNpcIndex = 0;
	if t_wenzi_sets[nDay] ~= nil then
		nNpcIndex = CreateNpc("V¨n Tö V­¬ng", "§¹i v¨n tö", gf_UnPack(t_wenzi_sets[nDay][2]));
		SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\3\\death_wenzi.lua");
		SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
		nNpcIndex = CreateNpc("V¨n Tö V­¬ng", "NhÞ v¨n tö", gf_UnPack(t_wenzi_sets[nDay][2]));
		SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\3\\death_wenzi.lua");
		SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
		nNpcIndex = CreateNpc("V¨n Tö V­¬ng", "Tam v¨n tö", gf_UnPack(t_wenzi_sets[nDay][2]));
		SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\3\\death_wenzi.lua");
		SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
		Msg2Global("Cã ng­êi thÊy ®µn Muçi Tr©u xuÊt hiÖn t¹i "..t_wenzi_sets[nDay][1]..". C¸c h¹ h·y mau mau ®i thu phôc chóng.");
		AddGlobalNews("Cã ng­êi thÊy ®µn Muçi Tr©u xuÊt hiÖn t¹i "..t_wenzi_sets[nDay][1]..". C¸c h¹ h·y mau mau ®i thu phôc chóng.");
	end
end