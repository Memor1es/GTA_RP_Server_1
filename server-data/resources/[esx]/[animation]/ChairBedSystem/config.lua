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
		--jail 1f sit face gym
		[1] = {position = vector3(1780.35,2581.52,45.8), verticalOffsetX=-0.4, verticalOffsetY=0.1, verticalOffsetZ= 0.5, direction=34.23, bed=false, coords=true},
		[2] = {position = vector3(1776.49,2577.65,45.8), verticalOffsetX=-0.4, verticalOffsetY=0.1, verticalOffsetZ= 0.5, direction=34.23, bed=false, coords=true},
		[3] = {position = vector3(1776.48,2581.69,45.8), verticalOffsetX=-0.4, verticalOffsetY=0.1, verticalOffsetZ= 0.5, direction=34.23, bed=false, coords=true},
		[4] = {position = vector3(1776.38,2585.19,45.8), verticalOffsetX=-0.4, verticalOffsetY=0.1, verticalOffsetZ= 0.5, direction=34.23, bed=false, coords=true},
		[5] = {position = vector3(1780.26,2585.25,45.8), verticalOffsetX=-0.4, verticalOffsetY=0.1, verticalOffsetZ= 0.5, direction=34.23, bed=false, coords=true},
		[6] = {position = vector3(1783.89,2585.31,45.8), verticalOffsetX=-0.4, verticalOffsetY=0.1, verticalOffsetZ= 0.5, direction=34.23, bed=false, coords=true},
		[7] = {position = vector3(1783.83,2581.6,45.8), verticalOffsetX=-0.4, verticalOffsetY=0.1, verticalOffsetZ= 0.5, direction=34.23, bed=false, coords=true},
		[8] = {position = vector3(1783.94,2577.57,45.8), verticalOffsetX=-0.4, verticalOffsetY=0.1, verticalOffsetZ= 0.5, direction=34.23, bed=false, coords=true},

		--jail bed
		[9] = {position = vector3(1768.3,2587.18,45.27), verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=0.0, bed=true, coords=true},

		--jail 1f sit other side
		[10] = {position = vector3(1775.22,2578.86,45.8), verticalOffsetX=0.4, verticalOffsetY=-0.1, verticalOffsetZ= 0.5, direction=213.3, bed=false, coords=true},
		[11] = {position = vector3(1775.16,2582.95,45.8), verticalOffsetX=0.4, verticalOffsetY=-0.1, verticalOffsetZ= 0.5, direction=213.3, bed=false, coords=true},
		[12] = {position = vector3(1775.24,2586.65,45.8), verticalOffsetX=0.4, verticalOffsetY=-0.1, verticalOffsetZ= 0.5, direction=213.3, bed=false, coords=true},
		[13] = {position = vector3(1779.01,2586.64,45.8), verticalOffsetX=0.4, verticalOffsetY=-0.1, verticalOffsetZ= 0.5, direction=213.3, bed=false, coords=true},
		[14] = {position = vector3(1782.68,2586.66,45.8), verticalOffsetX=0.4, verticalOffsetY=-0.1, verticalOffsetZ= 0.5, direction=213.3, bed=false, coords=true},
		[15] = {position = vector3(1779.09,2582.95,45.8), verticalOffsetX=0.4, verticalOffsetY=-0.1, verticalOffsetZ= 0.5, direction=213.3, bed=false, coords=true},
		[16] = {position = vector3(1782.65,2582.97,45.8), verticalOffsetX=0.4, verticalOffsetY=-0.1, verticalOffsetZ= 0.5, direction=213.3, bed=false, coords=true},
		[17] = {position = vector3(1782.82,2578.98,45.8), verticalOffsetX=0.4, verticalOffsetY=-0.1, verticalOffsetZ= 0.5, direction=213.3, bed=false, coords=true},

	}
}

Config.Text = {
	SitOnChair = '按下 ~INPUT_ARREST~ 來 ~y~坐下',
	SitOnBed = '按下 ~INPUT_ARREST~ 來 ~y~坐在床上',
	LieOnBed = '按下 ~INPUT_ARREST~ 來 ~y~躺在床上',
	SwitchBetween = '~w~ 坐下、趴下、躺下 ~g~用箭頭[向右或向左]來切換',
	Standup = '按下 ~INPUT_CONTEXT~ 來 ~y~站起來'
}
