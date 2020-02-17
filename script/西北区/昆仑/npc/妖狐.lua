TB_FOX_DIALOG = {
	"<color=green>妖狐<color>:是谁干的, 我饶不了你!",
	"<color=green>妖狐<color>: 封印越来越强,我动不了了!",
	"<color=green>妖狐<color>: 谁来救我! 我...精疲力尽了...",
}
function main()
	Talk(1,"",TB_FOX_DIALOG[random(getn(TB_FOX_DIALOG))])
end
