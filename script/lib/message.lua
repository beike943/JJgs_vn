-- message.lua
-- by windle

Include("\\script\\class\\mem.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_PlayerTalkTmp = {}
gf_warning = print

tTalkMsg = {}
nTalkMsg = 1;
PAGE_SIZE = 450;

function procTalk(s)
	if strsub(s,1,2) == "\\p" then
		nTalkMsg = nTalkMsg + 1;
		s = strsub(s, 3);
	end
	if strlen(s) > PAGE_SIZE then
		--gf_warning("[WARNING] [suTalk.lua#11] [overflow] str="..s);
		local oldmsg = tTalkMsg[nTalkMsg] or "";
		if strlen(oldmsg) > 0 then
			nTalkMsg = nTalkMsg + 1;
		end
		tTalkMsg[nTalkMsg] = s.."\n";
		return
	end
	local oldmsg = tTalkMsg[nTalkMsg] or "";
	if strlen(oldmsg) + strlen(s) > PAGE_SIZE then
		nTalkMsg = nTalkMsg + 1;
		tTalkMsg[nTalkMsg] = s.."\n";
	else
		tTalkMsg[nTalkMsg] = oldmsg..s.."\n";
	end
end

-- suTalk: ×Ô¶¯·ÖÒ³talk
--	szCallback: »Øµ÷
--	szTalk: ×Ö·û´®, Ö»½ÓÊÜµ¥×Ö·û´®
function suTalk(szCallback, szTalk, bForce)
	if not bForce and strlen(szTalk) < PAGE_SIZE then
		Talk(1, szCallback, szTalk);
		return
	end
	tTalkMsg = {}
	nTalkMsg = 1;

	szTalk = gsub(szTalk, "\\p", "\n\\p");
	gsub(szTalk, "(%C+)", procTalk);

--	print(Val2Str(tTalkMsg))
	g_PlayerTalkTmp[GetName()] = {
		msg = tTalkMsg,
		cb = szCallback,
	}
	suTalkCB();
end

function suTalkCB(nPage)
	nPage = nPage or 1;
	tMsg = g_PlayerTalkTmp[GetName()];
	if not tMsg then
		gf_warning("[WARNING] [suTalkCB] [date error] [role:"..GetName().."]");
		return
	end
	local szCB = tMsg.cb;
	if getn(tMsg.msg) > nPage then
		szCB = format("#suTalkCB(%d)",nPage+1);
	else
		g_PlayerTalkTmp[GetName()] = nil;
	end
	Talk(1, szCB, tMsg.msg[nPage]);
end

-- suSay: ×Ô¶¯·ÖÒ³say, Ç°ÃæÒ³Ö»ÓĞÉÏ/ÏÂÑ¡Ïî,×îºóÒ³ÓĞ×Ô¶¨Ñ¡Ïî
--	²ÎÊıÓëSayÒ»Ñù
function suSay(szMsg, n, ...)
	if strlen(szMsg) < PAGE_SIZE then
		Say(szMsg, n, gf_UnPack(arg))
		return
	end
	tTalkMsg = {}
	nTalkMsg = 1;

	szMsg = gsub(szMsg, "\\p", "\n\\p");
	gsub(szMsg, "(%C+)", procTalk);

	if type(arg[1]) == "table" then
		arg = arg[1];
	end
	g_PlayerTalkTmp[GetName()] = {
		msg = tTalkMsg,
		sel = arg,
	}
	suSayCB();
end

function suSayCB(nPage)
	nPage = nPage or 1;
	tMsg = g_PlayerTalkTmp[GetName()];
	if not tMsg then
		gf_warning("[WARNING] [suSayCB] [date error] [role:"..GetName().."]");
		return
	end
	local tArg = new(tMsg.sel);
	if getn(tMsg.msg) > nPage then
		tArg = { format("Trang kÕ/#suSayCB(%d)", nPage+1)};
		tinsert(tArg,"KÕt thóc ®èi tho¹i/nothing")
	end
	if nPage > 1 then
		tinsert(tArg, 1, format("Trang tr­íc/#suSayCB(%d)", nPage-1));
	end

	Say(tMsg.msg[nPage], getn(tArg), tArg);
end
