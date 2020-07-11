Config = {}

Config.Healing = 3 -- // If this is 0, then its disabled.. Default: 3.. That means, if a person lies in a bed, then he will get 1 health every 3 seconds.
Config.Cooldown = 2 -- // If this is 0, then its disabled.. Default: 2.. That means, if a player goes and stand up, then he need to wait 2 seconds, before he can lay/sit again! [VERY RECOMMENDED]

Config.objects = {
	Object = nil, ObjectVertX = nil, ObjectVertY = nil, ObjectVertZ = nil, ObjectDir = nil, isBed = nil, -- // Please don't change this line!;)
	ButtonToSitOnChair = 23, -- // Default: G -- // https://docs.fivem.net/game-references/controls/
	ButtonToLayOnBed = 23, -- // Default: E -- // https://docs.fivem.net/game-references/controls/
	ButtonToStandUp = 38, -- // Default: F -- // https://docs.fivem.net/game-references/controls/
	SitAnimation = {anim='PROP_HUMAN_SEAT_CHAIR_MP_PLAYER'},
	BedBackAnimation = {dict='anim@gangops@morgue@table@', anim='ko_front'},
	BedStomachAnimation = {anim='WORLD_HUMAN_SUNBATHE'},
	BedSitAnimation = {anim='WORLD_HUMAN_PICNIC'},
	locations = {
		--[1] = {object="v_med_bed2", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=0.0, bed=true},
		[1] = {position = vector3(1768.3,2587.18,45.27), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=0.0, bed=true},
		[2] = {position = vector3(1780.35,2581.52,45.8), verticalOffsetX=0.0, verticalOffsetY=0.5, verticalOffsetZ= 0.5, direction=0.0, bed=false},
	}
}

Config.Text = {
	SitOnChair = '按下 ~INPUT_ARREST~ 來 ~y~坐下',
	SitOnBed = '按下 ~INPUT_ARREST~ 來 ~y~坐在床上',
	LieOnBed = '按下 ~INPUT_ARREST~ 來 ~y~躺在床上',
	SwitchBetween = '~w~ 坐下、趴下、躺下 ~g~用箭頭[向右或向左]來切換',
	Standup = '按下 ~INPUT_CONTEXT~ 來 ~y~站起來'
}
