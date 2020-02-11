tNpcTalk = {
	"Nh×n c¸c g×! Cói ®Çu xuèng!",
	"MÊy tªn kia! H·y chó ı nghe lêi gi¸o huÊn cña tr­ëng gi¸o!",
	"D©n ®¹i Tèng lu«n chŞu sù x©m ph¹m cña ngo¹i téc, ta còng c¶m thÊy ¸p lùc rÊt lín.",
	"L¹i nhí cha mÑ råi ",
	"Tham qu©n kh«ng thÓ x«ng trËn giÕt giÆc, thËt lµ ®¸ng tiÕc!",
	"N­¬ng tö ë nhµ cã nhí ta kh«ng,… ",
	"ChØ cÇn qu©n quan ®ã chÕt trªn chiÕn tr­êng lµ ta cã c¬ héi th¨ng chøc råi!",
	"ThËt muèn vøt bá vò khİ trªn tay, phiªu b¹c giang hå!..",
	"Qu©n Nhi muéi muéi thËt lµ xinh, ha ha!",
	"Bªn kia ®¹i Tèng lµ ®©u thÕ?",
}

function main()
	local nNpcName = GetTargetNpcName();
	if nNpcName == "Gi¸o tr­êng qu©n quan" then
		Talk(1,"","<color=yellow>Gi¸o tr­êng qu©n quan<color>: "..tNpcTalk[random(1,2)]);
	else
		Talk(1,"","<color=yellow>Gi¸o tr­êng qu©n sÜ<color>: "..tNpcTalk[random(3,getn(tNpcTalk))]);
	end
end