DP = {}

DP.Expressions = {
   ["生氣"] = {"Expression", "mood_angry_1"},
   ["喝醉"] = {"Expression", "mood_drunk_1"},
   ["說不出話來"] = {"Expression", "pose_injured_1"},
   ["觸電"] = {"Expression", "electrocuted_1"},
   ["火爆"] = {"Expression", "effort_1"},
   ["火爆2"] = {"Expression", "mood_drivefast_1"},
   ["火爆3"] = {"Expression", "pose_angry_1"},
   ["開心"] = {"Expression", "mood_happy_1"},
   ["受傷"] = {"Expression", "mood_injured_1"},
   ["快樂"] = {"Expression", "mood_dancing_low_1"},
   ["呼吸"] = {"Expression", "smoking_hold_1"},
   ["不眨眼睛"] = {"Expression", "pose_normal_1"},
   ["睜一隻眼閉一隻眼"] = {"Expression", "pose_aiming_1"},
   ["驚嚇"] = {"Expression", "shocked_1"},
   ["驚嚇2"] = {"Expression", "shocked_2"},
   ["想睡覺"] = {"Expression", "mood_sleeping_1"},
   ["想睡覺2"] = {"Expression", "dead_1"},
   ["想睡覺3"] = {"Expression", "dead_2"},
   ["俏皮"] = {"Expression", "mood_smug_1"},
   ["懷疑"] = {"Expression", "mood_aiming_1"},
   ["緊張"] = {"Expression", "mood_stressed_1"},
   ["慍怒"] = {"Expression", "mood_sulk_1"},
   ["奇怪"] = {"Expression", "effort_2"},
   ["奇怪2"] = {"Expression", "effort_3"},
}

DP.Walks = {
  ["外國人"] = {"move_m@alien"},
  ["裝甲機器人"] = {"anim_group_move_ballistic"},
  ["自大"] = {"move_f@arrogant@a"},
  ["勇敢"] = {"move_m@brave"},
  ["漫不經心"] = {"move_m@casual@a"},
  ["漫不經心2"] = {"move_m@casual@b"},
  ["漫不經心3"] = {"move_m@casual@c"},
  ["漫不經心4"] = {"move_m@casual@d"},
  ["漫不經心5"] = {"move_m@casual@e"},
  ["漫不經心6"] = {"move_m@casual@f"},
  ["時髦"] = {"move_f@chichi"},
  ["自信"] = {"move_m@confident"},
  ["小偷"] = {"move_m@business@a"},
  ["小偷2"] = {"move_m@business@b"},
  ["小偷3"] = {"move_m@business@c"},
  ["女生"] = {"move_f@multiplayer"},
  ["男生"] = {"move_m@multiplayer"},
  ["喝醉"] = {"move_m@drunk@a"},
  ["喝醉2"] = {"move_m@drunk@slightlydrunk"},
  ["喝醉3"] = {"move_m@buzzed"},
  ["喝醉4"] = {"move_m@drunk@verydrunk"},
  ["女子"] = {"move_f@femme@"},
  ["著火"] = {"move_characters@franklin@fire"},
  ["著火2"] = {"move_characters@michael@fire"},
  ["著火3"] = {"move_m@fire"},
  ["逃跑"] = {"move_f@flee@a"},
  ["富蘭克林"] = {"move_p_m_one"},
  ["痞子"] = {"move_m@gangster@generic"},
  ["痞子2"] = {"move_m@gangster@ng"},
  ["痞子3"] = {"move_m@gangster@var_e"},
  ["痞子4"] = {"move_m@gangster@var_f"},
  ["痞子5"] = {"move_m@gangster@var_i"},
  ["律動"] = {"anim@move_m@grooving@"},
  ["警惕"] = {"move_m@prison_gaurd"},
  ["上銬"] = {"move_m@prisoner_cuffed"},
  ["跟蹤"] = {"move_f@heels@c"},
  ["跟蹤2"] = {"move_f@heels@d"},
  ["登山"] = {"move_m@hiking"},
  ["時尚"] = {"move_m@hipster@a"},
  ["遊民"] = {"move_m@hobo@a"},
  ["急忙"] = {"move_f@hurry@a"},
  ["看門"] = {"move_p_m_zero_janitor"},
  ["看門2"] = {"move_p_m_zero_slow"},
  ["慢跑"] = {"move_m@jog@"},
  ["勒馬爾"] = {"anim_group_move_lemar_alley"},
  ["萊斯特"] = {"move_heist_lester"},
  ["萊斯特2"] = {"move_lester_caneup"},
  ["食人族"] = {"move_f@maneater"},
  ["麥可"] = {"move_ped_bucket"},
  ["錢"] = {"move_m@money"},
  ["肌肉"] = {"move_m@muscle@a"},
  ["推"] = {"move_m@posh@"},
  ["推2"] = {"move_f@posh@"},
  ["快走"] = {"move_m@quick"},
  ["跑步"] = {"female_fast_runner"},
  ["難過"] = {"move_m@sad@a"},
  ["野蠻"] = {"move_m@sassy"},
  ["野蠻2"] = {"move_f@sassy"},
  ["害怕"] = {"move_f@scared"},
  ["性感"] = {"move_f@sexy@a"},
  ["陰涼"] = {"move_m@shadyped@a"},
  ["慢走"] = {"move_characters@jimmy@slow@"},
  ["闊氣"] = {"move_m@swagger"},
  ["強硬"] = {"move_m@tough_guy@"},
  ["強硬2"] = {"move_f@tough_guy@"},
  ["垃圾"] = {"clipset@move@trash_fast_turn"},
  ["垃圾2"] = {"missfbi4prepp1_garbageman"},
  ["崔佛"] = {"move_p_m_two"},
  ["寬"] = {"move_m@bag"},
  -- I cant get these to work for some reason, if anyone knows a fix lmk
  --["Caution"] = {"move_m@caution"},
  --["Chubby"] = {"anim@move_m@chubby@a"},
  --["Crazy"] = {"move_m@crazy"},
  --["Joy"] = {"move_m@joy@a"},
  --["Power"] = {"move_m@power"},
  --["Sad2"] = {"anim@move_m@depression@a"},
  --["Sad3"] = {"move_m@depression@b"},
  --["Sad4"] = {"move_m@depression@d"},
  --["Wading"] = {"move_m@wading"},
}

DP.Shared = {
   --[emotename] = {dictionary, animation, displayname, targetemotename, additionalanimationoptions}
   -- you dont have to specify targetemoteanem, if you do dont it will just play the same animation on both.
   -- targetemote is used for animations that have a corresponding animation to the other player.
   ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Handshake 握手", "handshake2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
       SyncOffsetFront = 0.9
   }},
   ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Handshake 握手2", "handshake", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug 抱", "hug2", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.05,
   }},
   ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 抱2", "hug", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.13
   }},
   ["bro"] = {"mp_ped_interaction", "hugs_guy_a", "Bro 兄弟", "bro2", AnimationOptions =
   {
        SyncOffsetFront = 1.14
   }},
   ["bro2"] = {"mp_ped_interaction", "hugs_guy_b", "Bro 兄弟2", "bro", AnimationOptions =
   {
        SyncOffsetFront = 1.14
   }},
   ["give"] = {"mp_common", "givetake1_a", "Give 給", "give2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["give2"] = {"mp_common", "givetake1_b", "Give 給2", "give", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["baseball"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_a", "Baseball 棒球", "baseballthrow"},
   ["baseballthrow"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_b", "Baseball Throw 投球", "baseball"},
   --[[["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Stick Up 舉槍", "stickupscared", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stickupscared"] = {"missminuteman_1ig_2", "handsup_base", "Stickup Scared 害怕", "stickup", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},--]]
   ["punch"] = {"melee@unarmed@streamed_variations", "plyr_takedown_rear_lefthook", "Punch 打", "punched"},
   ["punched"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_cross_r", "Punched 被打", "punch"},
   ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Headbutt 頭槌", "headbutted"},
   ["headbutted"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_headbutt", "Headbutted 被頭槌", "headbutt"},
   ["slap2"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_backslap", "Slap 巴掌2", "slapped2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Slap 巴掌", "slapped", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["slapped"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_slap", "Slapped 被賞巴掌", "slap"},
   ["slapped2"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_backslap", "Slapped 被賞巴掌2", "slap2"},
}

DP.Dances = {
   ["dancef"] = {"anim@amb@nightclub@dancers@solomun_entourage@", "mi_dance_facedj_17_v1_female^1", "Dance 跳舞F", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center", "Dance 跳舞F2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance 跳舞F3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef4"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1", "Dance 跳舞F4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3", "Dance 跳舞F5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance 跳舞F6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center", "Dance Slow 跳舞(慢)2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_down", "Dance Slow 跳舞(慢)3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center", "Dance Slow 跳舞(慢)4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance"] = {"anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5", "Dance 跳舞", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance2"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down", "Dance 跳舞2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance3"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center", "Dance 跳舞3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance4"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", "Dance 跳舞4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceupper"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Dance Upper 跳舞(上半身)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceupper2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Dance Upper 跳舞(上半身)2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceshy"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center", "Dance Shy 跳舞(害羞)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceshy2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Dance Shy 跳舞(害羞)2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "low_center", "Dance Slow 跳舞(慢)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly9"] = {"rcmnigel1bnmt_1b", "dance_loop_tyler", "Dance Silly 跳舞(愚蠢)9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance6"] = {"misschinese2_crystalmazemcs1_cs", "dance_loop_tao", "Dance 跳舞6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance7"] = {"misschinese2_crystalmazemcs1_ig", "dance_loop_tao", "Dance 跳舞7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance8"] = {"missfbi3_sniping", "dance_m_default", "Dance 跳舞8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly"] = {"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag", "Dance Silly 跳舞(愚蠢)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly2"] = {"move_clown@p_m_zero_idles@", "fidget_short_dance", "Dance Silly 跳舞(愚蠢)2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly3"] = {"move_clown@p_m_two_idles@", "fidget_short_dance", "Dance Silly 跳舞(愚蠢)3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly4"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Dance Silly 跳舞(愚蠢)4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly5"] = {"timetable@tracy@ig_5@idle_a", "idle_a", "Dance Silly 跳舞(愚蠢)5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly6"] = {"timetable@tracy@ig_8@idle_b", "idle_d", "Dance Silly 跳舞(愚蠢)6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance9"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Dance 跳舞9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly8"] = {"anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie", "Dance Silly 跳舞(愚蠢)8", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dancesilly7"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Dance Silly 跳舞(愚蠢)7", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dance5"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Dance 跳舞5", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["danceglowstick"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz", "Dance Glowsticks 跳舞(螢光棒)", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceglowstick2"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz", "Dance Glowsticks 跳舞(螢光棒)2", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
   }},
   ["danceglowstick3"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_mi_hi_bellydancer_laz", "Dance Glowsticks 跳舞(螢光棒)3", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
   }},
   ["dancehorse"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_handup_laz", "Dance Horse 跳舞(馬)", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dancehorse2"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_handup_laz", "Dance Horse 跳舞(馬)2", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["dancehorse3"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_hu_shimmy_laz", "Dance Horse 跳舞(馬)3", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
}

DP.Emotes = {
   --[[["drink"] = {"mp_player_inteat@pnq", "loop", "Drink 喝東西", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["beast"] = {"anim@mp_fm_event@intro", "beast_transform", "Beast 野獸", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000,
   }},]]--
   ["chill"] = {"switch@trevor@scares_tramp", "trev_scares_tramp_idle_tramp", "Chill 趴在地上", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cloudgaze"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Cloudgaze 看雲", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   --[[["cloudgaze2"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_guy", "Cloudgaze 看雲2", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["prone"] = {"missfbi3_sniping", "prone_dave", "Prone 趴著", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   --[[["pullover"] = {"misscarsteal3pullover", "pull_over_right", "Pullover 攔車", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},]]--
   --[[["idle"] = {"anim@heists@heist_corona@team_idles@male_a", "idle", "Idle 閒置(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle8"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Idle 閒置8(不能移動)"},]]--
   ["idle9"] = {"friends@fra@ig_1", "base_idle", "Idle 插腰站姿", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   --[[["idle10"] = {"mp_move@prostitute@m@french", "idle", "Idle 閒置10(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["idle11"] = {"random@countrysiderobbery", "idle_a", "Idle 閒置11(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle2"] = {"anim@heists@heist_corona@team_idles@female_a", "idle", "Idle 閒置2(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle3"] = {"anim@heists@humane_labs@finale@strip_club", "ped_b_celebrate_loop", "Idle 閒置3(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle4"] = {"anim@mp_celebration@idles@female", "celebration_idle_f_a", "Idle 閒置4(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle5"] = {"anim@mp_corona_idles@female_b@idle_a", "idle_a", "Idle 閒置5(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle6"] = {"anim@mp_corona_idles@male_c@idle_a", "idle_a", "Idle 閒置6(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle7"] = {"anim@mp_corona_idles@male_d@idle_a", "idle_a", "Idle 閒置7(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["wait3"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Wait 等3(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["idledrunk"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd1", "Idle Drunk 喝醉(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   --[[["idledrunk2"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd2", "Idle Drunk 閒置喝醉2(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idledrunk3"] = {"missarmenian2", "standing_idle_loop_drunk", "Idle Drunk 閒置喝醉3(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["airguitar"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar", "Air Guitar 空氣吉他"},
   --["airsynth"] = {"anim@mp_player_intcelebrationfemale@air_synth", "air_synth", "Air Synth 空氣樂團"},
   ["argue"] = {"misscarsteal4@actor", "actor_berating_loop", "Argue 爭論", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --[[["argue2"] = {"oddjobs@assassinate@vice@hooker", "argue_a", "Argue 爭論2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bartender"] = {"anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender", "Bartender 調酒師", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["blowkiss"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss", "Blow Kiss 飛吻"},]]--
   ["blowkiss2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Blow Kiss 飛吻", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000

   }},
   ["curtsy"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "Curtsy 屈膝禮"},
   ["bringiton"] = {"misscommon@response", "bring_it_on", "Bring It On 來吧", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["comeatmebro"] = {"mini@triathlon", "want_some_of_this", "Come at me bro 衝著我來", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["cop2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Cop 警察2(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cop3"] = {"amb@code_human_police_investigate@idle_a", "idle_b", "Cop 警察3(不能移動)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["crossarms"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Crossarms 抱胸", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms2"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Crossarms 抱胸2", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["crossarms3"] = {"anim@heists@heist_corona@single_team", "single_team_loop_boss", "Crossarms 抱胸3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms4"] = {"random@street_race", "_car_b_lookout", "Crossarms 抱胸4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms5"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Crossarms 抱胸5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["foldarms2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Fold Arms 雙手交叉2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms6"] = {"random@shop_gunstore", "_idle", "Crossarms 抱胸6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["foldarms"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Fold Arms 雙手交叉", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarmsside"] = {"rcmnigel1a_band_groupies", "base_m2", "Crossarms Side 抱胸歪頭", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["damn"] = {"gestures@m@standing@casual", "gesture_damn", "Damn 哎呀!", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["damn2"] = {"anim@am_hold_up@male", "shoplift_mid", "Damn 哎呀2!", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   --[[["pointdown"] = {"gestures@f@standing@casual", "gesture_hand_down", "Point Down 向下指", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},]]--
   ["surrender"] = {"random@arrests@busted", "idle_a", "Surrender 投降", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["facepalm2"] = {"anim@mp_player_intcelebrationfemale@face_palm", "face_palm", "Facepalm 無奈", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm"] = {"random@car_thief@agitated@idle_a", "agitated_idle_a", "Facepalm 捂臉", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm3"] = {"missminuteman_1ig_2", "tasered_2", "Facepalm 捂臉3", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm4"] = {"anim@mp_player_intupperface_palm", "idle_a", "Facepalm 捂臉4", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   --["fallover"] = {"random@drunk_driver_1", "drunk_fall_over", "Fall Over 倒地"},
   ["fallover2"] = {"mp_suicide", "pistol", "Fall Over 舉槍自盡"},
   --["fallover3"] = {"mp_suicide", "pill", "Fall Over 倒地3"},
   ["fallover4"] = {"friends@frf@ig_2", "knockout_plyr", "Fall Over 被打倒"},
   --["fallover5"] = {"anim@gangops@hostage@", "victim_fail", "Fall Over 倒地5"},
   ["fallasleep"] = {"mp_sleep", "sleep_loop", "Fall Asleep 打瞌睡", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["fightme"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "Fight Me 打架熱身"},
   --["fightme2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "Fight Me 打架熱身2"},
   ["finger"] = {"anim@mp_player_intselfiethe_bird", "idle_a", "Finger 中指", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["finger2"] = {"anim@mp_player_intupperfinger", "idle_a_fp", "Finger2 兩隻中指", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --[[["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Handshake 尼哥握手第一式", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Handshake 2 尼哥握手第二式", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["wait4"] = {"amb@world_human_hang_out_street@Female_arm_side@idle_a", "idle_a", "Wait 4 等得不耐煩", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["wait5"] = {"missclothing", "idle_storeclerk", "Wait 5 耐心等待", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait6"] = {"timetable@amanda@ig_2", "ig_2_base_amanda", "Wait 6 等到有點生氣", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait7"] = {"rcmnigel1cnmt_1c", "base", "Wait 7 等待", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait8"] = {"rcmjosh1", "idle", "Wait 8 等到很生氣", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait9"] = {"rcmjosh2", "josh_2_intp1_base", "Wait 9 等到氣到問對方知不知道現在幾點", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait10"] = {"timetable@amanda@ig_3", "ig_3_base_tracy", "Wait 10 等到有點生氣 (二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait11"] = {"misshair_shop@hair_dressers", "keeper_base", "Wait 11 有點娘的等待", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hiking"] = {"move_m@hiking", "idle", "Hiking 雙手握著背帶", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug 擁抱"},
   ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 2 擁抱 (二)"},
   ["hug3"] = {"mp_ped_interaction", "hugs_guy_a", "Hug 3 擁抱 (三)"},--]]
   ["inspect"] = {"random@train_tracks", "idle_e", "Inspect 仔細檢查"},
   --[[["jazzhands"] = {"anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands", "Jazzhands  爵士手指", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 6000,
   }},
   ["jog2"] = {"amb@world_human_jog_standing@male@idle_a", "idle_a", "Jog 2 慢跑 (二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog3"] = {"amb@world_human_jog_standing@female@idle_a", "idle_a", "Jog 3 慢跑 (三)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog4"] = {"amb@world_human_power_walker@female@idle_a", "idle_a", "Jog 4  慢跑 (四)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog5"] = {"move_m@joy@a", "walk", "Jog 5 慢跑 (五)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},--]]
   ["jumpingjacks"] = {"timetable@reunited@ig_2", "jimmy_getknocked", "Jumping Jacks 開合跳", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kneel2"] = {"rcmextreme3", "idle", "Kneel 蹲下", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kneel3"] = {"amb@world_human_bum_wash@male@low@idle_a", "idle_a", "Kneel 3 蹲下(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["knock"] = {"timetable@jimmy@doorknock@", "knockdoor_idle", "Knock 敲門(一)", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["knock2"] = {"missheistfbi3b_ig7", "lift_fibagent_loop", "Knock 2 敲門(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["knucklecrunch"] = {"anim@mp_player_intcelebrationfemale@knuckle_crunch", "knuckle_crunch", "Knuckle Crunch 作勢挑釁", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lapdance"] = {"mp_safehouse", "lap_dance_girl", "Lapdance 脫衣舞"},
   ["lean2"] = {"amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", "Lean 2 斜靠(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean3"] = {"amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", "Lean 3 斜靠(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean4"] = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", "Lean 4 斜靠(四)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean5"] = {"amb@world_human_leaning@male@wall@back@hands_together@idle_b", "idle_b", "Lean 5 斜靠(五)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanflirt"] = {"random@street_race", "_car_a_flirt_girl", "Lean Flirt 彎腰", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar2"] = {"amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", "Lean Bar 2 靠著欄杆(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar3"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_base_laz", "Lean Bar 3 靠著欄杆(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar4"] = {"anim@heists@prison_heist", "ped_b_loop_a", "Lean Bar 4 靠著欄杆(四)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanhigh"] = {"anim@mp_ferris_wheel", "idle_a_player_one", "Lean High 靠著較高欄杆(一)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanhigh2"] = {"anim@mp_ferris_wheel", "idle_a_player_two", "Lean High 2 靠著較高欄杆(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside"] = {"timetable@mime@01_gc", "idle_a", "Leanside 斜靠著欄杆", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside2"] = {"misscarstealfinale", "packer_idle_1_trevor", "Leanside 2 斜靠著欄杆(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside3"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Leanside 3 斜靠著欄杆(三)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside4"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Leanside 4 斜靠著欄杆(四)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["leanside5"] = {"rcmjosh2", "josh_2_intp1_base", "Leanside 5 斜靠著欄杆(五)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["me"] = {"gestures@f@standing@casual", "gesture_me_hard", "Me 指著自己", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   --[[["mechanic"] = {"mini@repair", "fixing_a_ped", "Mechanic 修車姿勢", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mechanic2"] = {"amb@world_human_vehicle_mechanic@male@base", "idle_a", "Mechanic 2 修車姿勢(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mechanic3"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 3 修車姿勢(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mechanic4"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 4 修車姿勢(四)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["medic2"] = {"amb@medic@standing@tendtodead@base", "base", "Medic 2 救護人員姿勢", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["meditate"] = {"rcmcollect_paperleadinout@", "meditiate_idle", "Meditiate 靜坐", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   --[[["meditate2"] = {"rcmepsilonism3", "ep_3_rcm_marnie_meditating", "Meditiate 2 靜坐(二)", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["meditate3"] = {"rcmepsilonism3", "base_loop", "Meditiate 3 靜坐(三)", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["metal"] = {"anim@mp_player_intincarrockstd@ps@", "idle_a", "Metal 搖滾手勢", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},]]--
   ["no"] = {"anim@heists@ornate_bank@chat_manager", "fail", "No 不要", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["no2"] = {"mp_player_int_upper_nod", "mp_player_int_nod_no", "No 2 不要(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nosepick"] = {"anim@mp_player_intcelebrationfemale@nose_pick", "nose_pick", "Nose Pick 挖鼻屎挑釁", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["noway"] = {"gestures@m@standing@casual", "gesture_no_way", "No Way 門都沒有", AnimationOptions =
   {
       EmoteDuration = 1500,
       EmoteMoving = true,
   }},
   ["ok"] = {"anim@mp_player_intselfiedock", "idle_a", "OK 好", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["outofbreath"] = {"re@construction", "out_of_breath", "Out of Breath 很喘", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --[[["pickup"] = {"random@domestic", "pickup_low", "Pickup 撿起來"},
   ["push"] = {"missfinale_c2ig_11", "pushcar_offcliff_f", "Push 推", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["push2"] = {"missfinale_c2ig_11", "pushcar_offcliff_m", "Push 2 推(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["point"] = {"gestures@f@standing@casual", "gesture_point", "Point", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},]]--
   ["pushup"] = {"amb@world_human_push_ups@male@idle_a", "idle_d", "Pushup 伏地挺身", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["countdown"] = {"random@street_race", "grid_girl_race_start", "Countdown 賽車女郎倒數", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --[[["pointright"] = {"mp_gun_shop_tut", "indicate_right", "Point Right 向右邊指", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},]]--
   ["salute"] = {"anim@mp_player_intincarsalutestd@ds@", "idle_a", "Salute 敬禮", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute2"] = {"anim@mp_player_intincarsalutestd@ps@", "idle_a", "Salute 2 左手敬禮", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute3"] = {"anim@mp_player_intuppersalute", "idle_a", "Salute 3 左手敬禮(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["scared"] = {"random@domestic", "f_distressed_loop", "Scared 害怕", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["scared2"] = {"random@homelandsecurity", "knees_loop_girl", "Scared 2 害怕(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["screwyou"] = {"misscommon@response", "screw_you", "Screw You 去你的", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["shakeoff"] = {"move_m@_idles@shake_off", "shakeoff_1", "Shake Off 拍身上的灰塵", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3500,
   }},
   --[[["shot"] = {"random@dealgonewrong", "idle_a", "Shot 中彈", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["sleep"] = {"timetable@tracy@sleep@", "idle_c", "Sleep 睡覺", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["shrug"] = {"gestures@f@standing@casual", "gesture_shrug_hard", "Shrug 聳肩", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["shrug2"] = {"gestures@m@standing@casual", "gesture_shrug_hard", "Shrug 2 聳肩(二)", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["sit"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_idle_nowork", "Sit 坐", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit2"] = {"rcm_barry3", "barry_3_sit_loop", "Sit2 坐(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit3"] = {"amb@world_human_picnic@male@idle_a", "idle_a", "Sit3 坐(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit4"] = {"amb@world_human_picnic@female@idle_a", "idle_a", "Sit4 坐(四)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit5"] = {"anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", "Sit5 坐(五)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit6"] = {"timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", "Sit6 坐(六)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit7"] = {"anim@amb@nightclub@lazlow@lo_alone@", "lowalone_base_laz", "Sit7 坐(七)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit8"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_jimmy", "Sit8 坐(八)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit9"] = {"amb@world_human_stupor@male@idle_a", "idle_a", "Sit9 坐(九)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitlean"] = {"timetable@tracy@ig_14@", "ig_14_base_tracy", "Sit Lean  坐著斜靠", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Sit Sad 沮喪地坐著", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_b", "Sit Scared 害怕的坐著", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared2"] = {"anim@heists@ornate_bank@hostages@ped_c@", "flinch_loop", "Sit Scared 2 害怕的坐著(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared3"] = {"anim@heists@ornate_bank@hostages@ped_e@", "flinch_loop", "Sit Scared 3 害怕的坐著(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitdrunk"] = {"timetable@amanda@drunk@base", "base", "Sit Drunk 醉倒在路邊", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair2"] = {"timetable@ron@ig_5_p3", "ig_5_p3_base", "Sit Chair2 坐椅子(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair3"] = {"timetable@reunited@ig_10", "base_amanda", "Sit Chair3 坐椅子(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair4"] = {"timetable@ron@ig_3_couch", "base", "Sit Chair4 坐椅子(四)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair5"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy", "Sit Chair5 坐椅子(五)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair6"] = {"timetable@maid@couch@", "base", "Sit Chair6 坐椅子(六)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   --[[["sitchairside"] = {"timetable@ron@ron_ig_2_alt1", "ig_2_alt1_base", "Sit Chair Side 坐椅子邊緣", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["situp"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a", "Sit Up 仰臥起坐", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clapangry"] = {"anim@arena@celeb@flat@solo@no_props@", "angry_clap_a_player_a", "Clap Angry 生氣的拍手", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["slowclap3"] = {"anim@mp_player_intupperslow_clap", "idle_a", "Slow Clap 3 很慢的拍手(三)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clap"] = {"amb@world_human_cheering@male_a", "base", "Clap 拍手舉高", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["slowclap"] = {"anim@mp_player_intcelebrationfemale@slow_clap", "slow_clap", "Slow Clap 很慢的拍手", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["slowclap2"] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", "Slow Clap 2 很慢的拍手(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smell"] = {"move_p_m_two_idles@generic", "fidget_sniff_fingers", "Smell 聞", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --[[["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Stick Up 握槍瞄準", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stumble"] = {"misscarsteal4@actor", "stumble", "Stumble 被絆倒", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["stunned"] = {"stungun@standing", "damage", "Stunned 被電到顫抖", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe"] = {"amb@world_human_sunbathe@male@back@base", "base", "Sunbathe 日光浴", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe2"] = {"amb@world_human_sunbathe@female@back@base", "base", "Sunbathe 2 日光浴(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["t"] = {"missfam5_yoga", "a2_pose", "T 擺T", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["t2"] = {"mp_sleep", "bind_pose_180", "T 2 擺T (二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["think5"] = {"mp_cp_welcome_tutthink", "b_think", "Think 5 思考(五)", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["think"] = {"misscarsteal4@aliens", "rehearsal_base_idle_director", "Think 思考", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["think3"] = {"timetable@tracy@ig_8@base", "base", "Think 3 思考(三)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["think2"] = {"missheist_jewelleadinout", "jh_int_outro_loop_a", "Think 2 思考(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["thumbsup3"] = {"anim@mp_player_intincarthumbs_uplow@ds@", "enter", "Thumbs Up 3 比讚(三)", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["thumbsup2"] = {"anim@mp_player_intselfiethumbs_up", "idle_a", "Thumbs Up 2 比讚(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["thumbsup"] = {"anim@mp_player_intupperthumbs_up", "idle_a", "Thumbs Up 比讚", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --[[["type"] = {"anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", "Type 打字", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type2"] = {"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", "Type 2 打字(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type3"] = {"mp_prison_break", "hack_loop", "Type 3 打字(三)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type4"] = {"mp_fbi_heist", "loop", "Type 4 打字(四)", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["warmth"] = {"amb@world_human_stand_fire@male@idle_a", "idle_a", "Warmth 取暖", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave4"] = {"random@mugging5", "001445_01_gangintimidation_1_female_idle_b", "Wave 4 揮手(四)", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["wave2"] = {"anim@mp_player_intcelebrationfemale@wave", "wave", "Wave 2 揮手(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave3"] = {"friends@fra@ig_1", "over_here_idle_a", "Wave 3 揮手(三)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave"] = {"friends@frj@ig_1", "wave_a", "Wave 揮手", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave5"] = {"friends@frj@ig_1", "wave_b", "Wave 5 揮手(五)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave6"] = {"friends@frj@ig_1", "wave_c", "Wave 6 揮手(六)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave7"] = {"friends@frj@ig_1", "wave_d", "Wave 7 揮手(七)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave8"] = {"friends@frj@ig_1", "wave_e", "Wave 8 揮手(八)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave9"] = {"gestures@m@standing@casual", "gesture_hello", "Wave 9 揮手(九)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["whistle"] = {"taxi_hail", "hail_taxi", "Whistle 吹口哨", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   --[[["whistle2"] = {"rcmnigel1c", "hailing_whistle_waive_a", "Whistle 2 吹口哨(二)", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},]]--
   ["yeah"] = {"anim@mp_player_intupperair_shagging", "idle_a", "Yeah 空幹", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lift"] = {"random@hitch_lift", "idle_f", "Lift 路邊攔車", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lol"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_a_player_b", "LOL 大笑", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lol2"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_b", "LOL 2 大笑(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["statue2"] = {"fra_0_int-1", "cs_lamardavis_dual-1", "Statue 2 街頭藝人2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["statue3"] = {"club_intro2-0", "csb_englishdave_dual-0", "Statue 3 街頭藝人3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   --[[["gangsign"] = {"mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a", "Gang Sign 幫派手勢", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gangsign2"] = {"mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b", "Gang Sign 2 幫派手勢(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["passout"] = {"missarmenian2", "drunk_loop", "Passout 晕厥", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout2"] = {"missarmenian2", "corpse_search_exit_ped", "Passout 2 晕厥(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout3"] = {"anim@gangops@morgue@table@", "body_search", "Passout 3 晕厥(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout4"] = {"mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", "Passout 4 晕厥(四)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout5"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "Passout 5 晕厥(五)", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["petting"] = {"creatures@rottweiler@tricks@", "petting_franklin", "Petting 撫摸", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["crawl"] = {"move_injured_ground", "front_loop", "Crawl 爬行", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   --[[["flip2"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Flip 2 後空翻(二)"},
   ["flip"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Flip 後空翻"},
   ["slide"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Slide 滑壘"},
   ["slide2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Slide 2 滑壘(二)"},
   ["slide3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Slide 3 滑壘(三)"},
   ["slugger"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Slugger 打擊出去"},]]--
   ["flipoff"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Flip Off 炫耀中指", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["flipoff2"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Flip Off 2 雙手中指", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["bow"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Bow 鞠躬", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bow2"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Bow 2 鞠躬(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --[[["keyfob"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Key Fob 按車子遙控器", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["golfswing"] = {"rcmnigel1d", "swing_a_mark", "Golf Swing 打高爾夫"},
   ["eat"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat 吃", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},]]--
   ["reaching"] = {"move_m@intimidation@cop@unarmed", "idle", "Reaching 預備拔槍", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait"] = {"random@shop_tattoo", "_idle_a", "Wait 插腰", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --[[["wait2"] = {"missbigscore2aig_3", "wait_for_van_c", "Wait 2 等待(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait12"] = {"rcmjosh1", "idle", "Wait 12 等待(十二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait13"] = {"rcmnigel1a", "base", "Wait 13 等待(十三)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},]]--
   ["lapdance2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Lapdance2 脫衣舞(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lapdance3"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Lapdance 3 脫衣舞(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lapdance3"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Lapdance3 脫衣舞(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk 電臀舞", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   --[[["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Slap 打耳光", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Headbutt 火箭頭槌"},
   ["fishdance"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Fish Dance 跳魚舞", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peace"] = {"mp_player_int_upperpeace_sign", "mp_player_int_peace_sign", "Peace 和平", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},]]--
   ["peace2"] = {"anim@mp_player_intupperpeace", "idle_a", "Peace 比ya", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cpr"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR 心肺復甦術", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   --[[["cpr2"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR 2 心肺復甦術(二)" , AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},]]--
   ["ledge"] = {"missfbi1", "ledge_loop", "Ledge 蹲下張開手臂", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["airplane"] = {"missfbi1", "ledge_loop", "Air Plane 學飛機", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peek"] = {"random@paparazzi@peek", "left_peek_a", "Peek 偷看", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cough"] = {"timetable@gardener@smoking_joint", "idle_cough", "Cough 咳嗽", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stretch"] = {"mini@triathlon", "idle_e", "Stretch 伸展", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch2"] = {"mini@triathlon", "idle_f", "Stretch 2 伸展(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch3"] = {"mini@triathlon", "idle_d", "Stretch 3 伸展(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch4"] = {"rcmfanatic1maryann_stretchidle_b", "idle_e", "Stretch 4 伸展(四)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["celebrate"] = {"rcmfanatic1celebrate", "celebrate", "Celebrate 瘋狂歡呼", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["punching"] = {"rcmextreme2", "loop_punching", "Punching 打拳擊", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["superhero"] = {"rcmbarry", "base", "Superhero 學超人", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["superhero2"] = {"rcmbarry", "base", "Superhero 2 學超人(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --[[["mindcontrol"] = {"rcmbarry", "mind_control_b_loop", "Mind Control 念力", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mindcontrol2"] = {"rcmbarry", "bar_1_attack_idle_aln", "Mind Control 2 念力(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["clown"] = {"rcm_barry2", "clown_idle_0", "Clown 耍白癡", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown2"] = {"rcm_barry2", "clown_idle_1", "Clown 2 耍白癡(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown3"] = {"rcm_barry2", "clown_idle_2", "Clown 3 耍白癡(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown4"] = {"rcm_barry2", "clown_idle_3", "Clown4 耍白癡(四)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clown5"] = {"rcm_barry2", "clown_idle_6", "Clown5 耍白癡(五)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   --[[["tryclothes"] = {"mp_clothing@female@trousers", "try_trousers_neutral_a", "Try Clothes 試衣服", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tryclothes2"] = {"mp_clothing@female@shirt", "try_shirt_positive_a", "Try Clothes 2 試衣服(二)", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tryclothes3"] = {"mp_clothing@female@shoes", "try_shoes_positive_a", "Try Clothes 3 試衣服(三)", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["nervous2"] = {"mp_missheist_countrybank@nervous", "nervous_idle", "Nervous 2 緊張(二)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nervous"] = {"amb@world_human_bum_standing@twitchy@idle_a", "idle_c", "Nervous 緊張", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nervous3"] = {"rcmme_tracey1", "nervous_loop", "Nervous 3 緊張(三)", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --[[["uncuff"] = {"mp_arresting", "a_uncuff", "Uncuff 努力掙脫手銬", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},]]--
   ["namaste"] = {"timetable@amanda@ig_4", "ig_4_base", "Namaste 您好", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --[[["threaten"] = {"random@atmrobberygen", "b_atm_mugging", "Threaten 舉槍威脅", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["radio"] = {"random@arrests", "generic_radio_chatter", "Radio 無線電", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pull"] = {"random@mugging4", "struggle_loop_b_thief", "Pull 拉", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},]]--
   ["bird"] = {"random@peyote@bird", "wakeup", "Bird 學小鳥"},
   ["chicken"] = {"random@peyote@chicken", "wakeup", "Chicken 學雞", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bark"] = {"random@peyote@dog", "wakeup", "Bark 學小狗"},
   --[[["rabbit"] = {"random@peyote@rabbit", "wakeup", "Rabbit 學兔子"},
   ["spiderman"] = {"missexile3", "ex03_train_roof_idle", "Spider-Man 學蜘蛛人", AnimationOptions =
   {
       EmoteLoop = true,
   }},]]--
   ["boi"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "BOI 就是這樣", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 3000,
   }},
   ["adjust"] = {"missmic4", "michael_tux_fidget", "Adjust 裝B", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 4000,
   }},
   ["handsup"] = {"missminuteman_1ig_2", "handsup_base", "Hands Up 舉手投降", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},
   ["pee"] = {"misscarsteal2peeing", "peeing_loop", "Pee 尿尿", AnimationOptions =
   {
       EmoteStuck = true,
       PtfxAsset = "scr_amb_chop",
       PtfxName = "ent_anim_dog_peeing",
       PtfxNoProp = true,
       PtfxPlacement = {-0.05, 0.3, 0.0, 0.0, 90.0, 90.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
       PtfxWait = 3000,
   }},

-----------------------------------------------------------------------------------------------------------
------ These are Scenarios, some of these dont work on women and some other issues, but still good to have.
-----------------------------------------------------------------------------------------------------------

   --[[["atm"] = {"Scenario", "PROP_HUMAN_ATM", "ATM"},]]--
   ["bbq"] = {"MaleScenario", "PROP_HUMAN_BBQ", "BBQ"},
   ["bumbin"] = {"Scenario", "PROP_HUMAN_BUM_BIN", "Bum Bin 拿東西"},
   ["bumsleep"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Bum Sleep 睡覺"},
   --[[["cheer"] = {"Scenario", "WORLD_HUMAN_CHEERING", "Cheer"},
   ["chinup"] = {"Scenario", "PROP_HUMAN_MUSCLE_CHIN_UPS", "Chinup"},
   ["clipboard2"] = {"MaleScenario", "WORLD_HUMAN_CLIPBOARD", "Clipboard 2"},]]--
   ["cop"] = {"Scenario", "WORLD_HUMAN_COP_IDLES", "Cop 警察站姿"},
   ["copbeacon"] = {"MaleScenario", "WORLD_HUMAN_CAR_PARK_ATTENDANT", "Cop Beacon 舒緩交通"},
   --[[["filmshocking"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Film Shocking"},
   ["flex"] = {"Scenario", "WORLD_HUMAN_MUSCLE_FLEX", "Flex"},]]--
   ["guard"] = {"Scenario", "WORLD_HUMAN_GUARD_STAND", "Guard 站姿"},
   ["hammer"] = {"Scenario", "WORLD_HUMAN_HAMMERING", "Hammer 槌子"},
   --[[["hangout"] = {"Scenario", "WORLD_HUMAN_HANG_OUT_STREET", "Hangout"},
   ["impatient"] = {"Scenario", "WORLD_HUMAN_STAND_IMPATIENT", "Impatient"},
   ["janitor"] = {"Scenario", "WORLD_HUMAN_JANITOR", "Janitor"},]]--
   ["jog"] = {"Scenario", "WORLD_HUMAN_JOG_STANDING", "Jog 扭動"},
   --[[["kneel"] = {"Scenario", "CODE_HUMAN_MEDIC_KNEEL", "Kneel"},
   ["leafblower"] = {"MaleScenario", "WORLD_HUMAN_GARDENER_LEAF_BLOWER", "Leafblower"},]]--
   ["lean"] = {"Scenario", "WORLD_HUMAN_LEANING", "Lean"},
   ["leanbar"] = {"Scenario", "PROP_HUMAN_BUM_SHOPPING_CART", "Lean Bar 靠著桌子"},
   ["lookout"] = {"Scenario", "CODE_HUMAN_CROSS_ROAD_WAIT", "Lookout 過馬路"},
   --[[["maid"] = {"Scenario", "WORLD_HUMAN_MAID_CLEAN", "Maid"},
   ["medic"] = {"Scenario", "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Medic"},
   ["musician"] = {"MaleScenario", "WORLD_HUMAN_MUSICIAN", "Musician"},
   ["notepad2"] = {"Scenario", "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Notepad 2"},
   ["parkingmeter"] = {"Scenario", "PROP_HUMAN_PARKING_METER", "Parking Meter"},
   ["party"] = {"Scenario", "WORLD_HUMAN_PARTYING", "Party"},
   ["texting"] = {"Scenario", "WORLD_HUMAN_STAND_MOBILE", "Texting"},
   ["prosthigh"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Prostitue High"},
   ["prostlow"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Prostitue Low"},
   ["puddle"] = {"Scenario", "WORLD_HUMAN_BUM_WASH", "Puddle"},
   ["record"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Record"},
   -- Sitchair is a litte special, since you want the player to be seated correctly.
   -- So we set it as "ScenarioObject" and do TaskStartScenarioAtPosition() instead of "AtPlace"]]--
   ["sitchair"] = {"ScenarioObject", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "Sit Chair 坐椅子"},
   --[[["smoke"] = {"Scenario", "WORLD_HUMAN_SMOKING", "Smoke"},
   ["smokeweed"] = {"MaleScenario", "WORLD_HUMAN_DRUG_DEALER", "Smoke Weed"},]]--
   ["statue"] = {"Scenario", "WORLD_HUMAN_HUMAN_STATUE", "Statue 街頭藝人"},
   ["sunbathe3"] = {"Scenario", "WORLD_HUMAN_SUNBATHE", "Sunbathe 3 日光浴 (三)"},
   ["sunbatheback"] = {"Scenario", "WORLD_HUMAN_SUNBATHE_BACK", "Sunbathe Back 日光浴(躺下)"},
   --[[["weld"] = {"Scenario", "WORLD_HUMAN_WELDING", "Weld"},
   ["windowshop"] = {"Scenario", "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Window Shop"},]]--
   ["yoga"] = {"Scenario", "WORLD_HUMAN_YOGA", "Yoga 瑜珈"},
   -- CASINO DLC EMOTES (STREAMED)
   ["karate"] = {"anim@mp_player_intcelebrationfemale@karate_chops", "karate_chops", "Karate"},
   ["karate2"] = {"anim@mp_player_intcelebrationmale@karate_chops", "karate_chops", "Karate 2"},
   ["cutthroat"] = {"anim@mp_player_intcelebrationmale@cut_throat", "cut_throat", "Cut Throat 恐嚇"},
   ["cutthroat2"] = {"anim@mp_player_intcelebrationfemale@cut_throat", "cut_throat", "Cut Throat 2 恐嚇 (二)"},
   ["mindblown"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "Mind Blown 思想炸裂", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["mindblown2"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "Mind Blown 2 思想炸裂 (二)", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["boxing"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Boxing 拳擊", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   --[[["boxing2"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Boxing 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},]]--
   ["stink"] = {"anim@mp_player_intcelebrationfemale@stinker", "stinker", "Stink 臭", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true
   }},
   --[[["think4"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Think 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},--]]
   ["adjusttie"] = {"clothingtie", "try_tie_positive_a", "Adjust Tie 調整領帶", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000
   }},
}

DP.PropEmotes = {
   ["umbrella"] = {"amb@world_human_drinking@coffee@male@base", "base", "Umbrella 雨傘", AnimationOptions =
   {
       Prop = "p_amb_brolly_01",
       PropBone = 57005,
       PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
       --
       EmoteLoop = true,
       EmoteMoving = true,
   }},

-----------------------------------------------------------------------------------------------------
------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
-----------------------------------------------------------------------------------------------------

   ["notepad"] = {"missheistdockssetup1clipboard@base", "base", "Notepad 記錄板", AnimationOptions =
   {
       Prop = 'prop_notepad_01',
       PropBone = 18905,
       PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
       SecondProp = 'prop_pencil_01',
       SecondPropBone = 58866,
       SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
       -- EmoteLoop is used for emotes that should loop, its as simple as that.
       -- Then EmoteMoving is used for emotes that should only play on the upperbody.
       -- The code then checks both values and sets the MovementType to the correct one
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["box"] = {"anim@heists@box_carry@", "idle", "Box 箱子", AnimationOptions =
   {
       Prop = "hei_prop_heist_box",
       PropBone = 60309,
       PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["rose"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Rose 玫瑰", AnimationOptions =
   {
       Prop = "prop_single_rose",
       PropBone = 18905,
       PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smoke2"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Smoke2 抽菸(二)", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smoke3"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Smoke3 抽菸(三)", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smoke4"] = {"amb@world_human_smoking@female@idle_a", "idle_b", "Smoke4 抽菸(四)", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bong"] = {"anim@safehouse@bong", "bong_stage3", "Bong 呼麻", AnimationOptions =
   {
       Prop = 'hei_heist_sh_bong_01',
       PropBone = 18905,
       PropPlacement = {0.10,-0.25,0.0,95.0,190.0,180.0},
   }},
   ["suitcase"] = {"missheistdocksprep1hold_cellphone", "static", "Suitcase 行李箱", AnimationOptions =
   {
       Prop = "prop_ld_suitcase_01",
       PropBone = 57005,
       PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["suitcase2"] = {"missheistdocksprep1hold_cellphone", "static", "Suitcase2 行李箱(二)", AnimationOptions =
   {
       Prop = "prop_security_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mugshot"] = {"mp_character_creation@customise@male_a", "loop", "Mugshot 布告板", AnimationOptions =
   {
       Prop = 'prop_police_id_board',
       PropBone = 58868,
       PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee 咖啡", AnimationOptions =
   {
       Prop = 'p_amb_coffeecup_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["whiskey"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whiskey 威士忌", AnimationOptions =
   {
       Prop = 'prop_drink_whisky',
       PropBone = 28422,
       PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["beer"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Beer 啤酒", AnimationOptions =
   {
       Prop = 'prop_amb_beer_bottle',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Cup 杯子", AnimationOptions =
   {
       Prop = 'prop_plastic_cup_02',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut 甜甜圈", AnimationOptions =
   {
       Prop = 'prop_amb_donut',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["burger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger 漢堡", AnimationOptions =
   {
       Prop = 'prop_cs_burger_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich 三明治", AnimationOptions =
   {
       Prop = 'prop_sandwich_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["soda"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Soda 蘇打", AnimationOptions =
   {
       Prop = 'prop_ecola_can',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["egobar"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Ego Bar 能量棒", AnimationOptions =
   {
       Prop = 'prop_choc_ego',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
   }},
   ["wine"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Wine 紅酒", AnimationOptions =
   {
       Prop = 'prop_drink_redwine',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["flute"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Flute 香檳杯", AnimationOptions =
   {
       Prop = 'prop_champ_flute',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["champagne"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Champagne 香檳", AnimationOptions =
   {
       Prop = 'prop_drink_champ',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["cigar"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar 雪茄", AnimationOptions =
   {
       Prop = 'prop_cigar_02',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["cigar2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar2 雪茄(二)", AnimationOptions =
   {
       Prop = 'prop_cigar_01',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["guitar"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar 吉他", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitar2"] = {"switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", "Guitar2 吉他(二)", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitarelectric"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric 電吉他", AnimationOptions =
   {
       Prop = 'prop_el_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitarelectric2"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric2 電吉他(二)", AnimationOptions =
   {
       Prop = 'prop_el_guitar_03',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["book"] = {"cellphone@", "cellphone_text_read_base", "Book 書", AnimationOptions =
   {
       Prop = 'prop_novel_01',
       PropBone = 6286,
       PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["bouquet"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Bouquet 花束", AnimationOptions =
   {
       Prop = 'prop_snow_flower_02',
       PropBone = 24817,
       PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["teddy"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Teddy 泰迪熊", AnimationOptions =
   {
       Prop = 'v_ilev_mr_rasberryclean',
       PropBone = 24817,
       PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["backpack"] = {"move_p_m_zero_rucksack", "idle", "Backpack 背包", AnimationOptions =
   {
       Prop = 'p_michael_backpack_s',
       PropBone = 24818,
       PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["clipboard"] = {"missfam4", "base", "Clipboard 板子", AnimationOptions =
   {
       Prop = 'p_amb_clipboard_01',
       PropBone = 36029,
       PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["map"] = {"amb@world_human_tourist_map@male@base", "base", "Map 地圖", AnimationOptions =
   {
       Prop = 'prop_tourist_map_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["beg"] = {"amb@world_human_bum_freeway@male@base", "base", "Beg 乞討板", AnimationOptions =
   {
       Prop = 'prop_beggers_sign_03',
       PropBone = 58868,
       PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["makeitrain"] = {"anim@mp_player_intupperraining_cash", "idle_a", "Make It Rain 撒錢", AnimationOptions =
   {
       Prop = 'prop_anim_cash_pile_01',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_xs_celebration",
       PtfxName = "scr_xs_money_rain",
       PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['makeitrain'],
       PtfxWait = 500,
   }},
   ["camera"] = {"amb@world_human_paparazzi@male@base", "base", "Camera 相機", AnimationOptions =
   {
       Prop = 'prop_pap_camera_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
       PtfxAsset = "scr_bike_business",
       PtfxName = "scr_bike_cfid_camera_flash",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
       PtfxWait = 200,
   }},
   ["champagnespray"] = {"anim@mp_player_intupperspray_champagne", "idle_a", "Champagne Spray 香檳浴", AnimationOptions =
   {
       Prop = 'ba_prop_battle_champ_open',
       PropBone = 28422,
       PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_ba_club",
       PtfxName = "scr_ba_club_champagne_spray",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       PtfxInfo = Config.Languages[Config.MenuLanguage]['spraychamp'],
       PtfxWait = 500,
   }},
   ["joint"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Joint 菸", AnimationOptions =
   {
       Prop = 'p_cs_joint_02',
       PropBone = 47419,
       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["cig"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cig 菸", AnimationOptions =
   {
       Prop = 'prop_amb_ciggy_01',
       PropBone = 47419,
       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["brief3"] = {"missheistdocksprep1hold_cellphone", "static", "Brief 手提包", AnimationOptions =
   {
       Prop = "prop_ld_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tablet"] = {"amb@world_human_tourist_map@male@base", "base", "Tablet 平板", AnimationOptions =
   {
       Prop = "prop_cs_tablet",
       PropBone = 28422,
       PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tablet2"] = {"amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", "Tablet2 平板(二)", AnimationOptions =
   {
       Prop = "prop_cs_tablet",
       PropBone = 28422,
       PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["phonecall"] = {"cellphone@", "cellphone_call_listen_base", "Phone Call 打電話", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["phone"] = {"cellphone@", "cellphone_text_read_base", "Phone 手機", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clean"] = {"timetable@floyd@clean_kitchen@base", "base", "Clean 擦玻璃", AnimationOptions =
   {
       Prop = "prop_sponge_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clean2"] = {"amb@world_human_maid_clean@", "base", "Clean2 擦玻璃(二)", AnimationOptions =
   {
       Prop = "prop_sponge_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
}