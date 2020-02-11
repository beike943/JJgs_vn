function main()

local nTalk_str = {
	"H«n lÔ mµ kh«ng cã tiÕng nh¹c cña ta th× thËt lµ buån. Chóc t©n lang t©n n­¬ng tr¨m n¨m h¹nh phóc!",
	"T©n n­¬ng, t©n lang b¸ch niªn giai l·o!",
	"T©n lang vµ t©n n­¬ng VÜnh kÕt ®ång t©m!",
	}

local i = random(1,getn(nTalk_str))

	Talk(1,"",nTalk_str[i])

end
