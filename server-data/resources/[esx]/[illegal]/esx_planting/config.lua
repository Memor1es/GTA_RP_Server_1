Config = {}
Config.Locale = "tc"
--You can add here buttons like inventory menu button. When player click this button, then action will be cancel.
Config.cancel_buttons = {289, 170, 168, 56}
Config.ShowBlips = true

options =
{
  ['seed_weed'] = {
        sprite = 496,
        color = 52,
        object = 'prop_weed_01',
        --object = '452618762',
        end_object = 'prop_weed_02',
        --end_object = '-305885281',
        fail_msg = '不幸的是，你的植物已經枯萎了!',
        success_msg = '恭喜，您已經收穫了植物!',
        start_msg = '開始種植物.',
        success_item = 'weed',
        cops = 0,
        first_step = 2.35,
        steps = 5,
        cords = {
          --{x = -427.05, y = 1575.25, z = 357, distance = 20.25},
          {x = 2213.05, y = 5576.25, z = 53, distance = 10.25}, --大麻點
          --{x = 1198.05, y = -215.25, z = 55, distance = 20.25},
          --{x = 706.05, y = 1269.25, z = 358, distance = 10.25},
        },
        animations_start = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '2500'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim = 'idle_a', timeout = '2500'},
        },
        animations_end = {
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '2500'},
          {lib = 'amb@world_human_cop_idles@male@idle_a', anim ='idle_a', timeout = '2500'},
        },
        animations_step = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '2500'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '5000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '2500'},
        },
        grow = {
          2.24, 1.95, 1.65, 1.45, 1.20, 1.00
        },
        questions = {
            {
                title = '你看到你的植物發芽，你要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 1
            },
            {
                title = '黃點已經出現在我的植物上，你要做什麼？?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 2
            },
            {
                title = '植物的葉子上已經出現了藍色的灰塵，您要做什麼?',
                steps = {
                    {label = '摘個別葉子', value = 1},
                    {label = '在葉子上撒上肥料', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 3
            },
            {
                title = '你的植物出現第一朵花, 您要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '馬上把它們弄壞', value = 2},
                    {label = '給植物施肥', value = 3}
                },
                correct = 1
            },
            --[[{
                title = '給植物澆水後，奇怪的葉子開始出現，你要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 2
            },
            {
                title = '您的工廠幾乎已準備好削減您的工作量?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 1
            },--]]
            {
                title = '你的植物已經可以準備開始收穫?',
                steps = {
                    {label = '用剪刀收集', value = 1, min = 5, max = 25},
                    {label = '用手收集', value = 1, min = 10, max = 15},
                    {label = '用修枝剪剪', value = 1, min = 2, max = 40}
                },
                correct = 1
            },
        },
      },

      ['seed_coke'] = {
        sprite = 478,
        color = 40,
        object = 'prop_weed_01',
        --object = '452618762',
        end_object = 'prop_weed_02',
        --end_object = '-305885281',
        end_object = '-305885281',
        fail_msg = '不幸的是，你的植物已經枯萎了!',
        success_msg = '恭喜，您已經收穫了植物!',
        start_msg = '開始種植物.',
        success_item = 'coke',
        cops = 0,
        first_step = 2.35,
        steps = 5,
        cords = {
          --{x = -427.05, y = 1575.25, z = 357, distance = 20.25},
          {x = 2603.46, y = -341.59, z = 92.56, distance = 10.25}, --大麻點
          --{x = 1198.05, y = -215.25, z = 55, distance = 20.25},
          --{x = 706.05, y = 1269.25, z = 358, distance = 10.25},
        },
        animations_start = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '2500'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim = 'idle_a', timeout = '2500'},
        },
        animations_end = {
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '2500'},
          {lib = 'amb@world_human_cop_idles@male@idle_a', anim ='idle_a', timeout = '2500'},
        },
        animations_step = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '2500'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '5000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '2500'},
        },
        grow = {
          2.24, 1.95, 1.65, 1.45, 1.20, 1.00
        },
        questions = {
            {
                title = '你看到你的植物發芽，你要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 1
            },
            {
                title = '黃點已經出現在我的植物上，你要做什麼？?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 2
            },
            {
                title = '植物的葉子上已經出現了藍色的灰塵，您要做什麼?',
                steps = {
                    {label = '摘個別葉子', value = 1},
                    {label = '在葉子上撒上肥料', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 3
            },
            {
                title = '你的植物出現第一朵花, 您要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '馬上把它們弄壞', value = 2},
                    {label = '給植物施肥', value = 3}
                },
                correct = 1
            },
            --[[{
                title = '給植物澆水後，奇怪的葉子開始出現，你要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 2
            },
            {
                title = '您的工廠幾乎已準備好削減您的工作量?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 1
            },--]]
            {
                title = '你的植物已經可以準備開始收穫?',
                steps = {
                    {label = '用剪刀收集', value = 1, min = 5, max = 25},
                    {label = '用手收集', value = 1, min = 10, max = 15},
                    {label = '用修枝剪剪', value = 1, min = 2, max = 40}
                },
                correct = 1
            },
        },
      },

      ['seed_meth'] = {
        sprite = 499,
        color = 26,
        object = 'prop_weed_01',
        --object = '452618762',
        end_object = 'prop_weed_02',
        --end_object = '-305885281',
        end_object = '-305885281',
        fail_msg = '不幸的是，你的植物已經枯萎了!',
        success_msg = '恭喜，您已經收穫了植物!',
        start_msg = '開始種植物.',
        success_item = 'meth',
        cops = 0,
        first_step = 2.35,
        steps = 5,
        cords = {
          --{x = -427.05, y = 1575.25, z = 357, distance = 20.25},
          {x = 1525.29, y = 1710.02, z = 109.00, distance = 10.25}, 
          --{x = 1198.05, y = -215.25, z = 55, distance = 20.25},
          --{x = 706.05, y = 1269.25, z = 358, distance = 10.25},
        },
        animations_start = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '2500'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim = 'idle_a', timeout = '2500'},
        },
        animations_end = {
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '2500'},
          {lib = 'amb@world_human_cop_idles@male@idle_a', anim ='idle_a', timeout = '2500'},
        },
        animations_step = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '2500'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '5000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '2500'},
        },
        grow = {
          2.24, 1.95, 1.65, 1.45, 1.20, 1.00
        },
        questions = {
            {
                title = '你看到你的植物發芽，你要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 1
            },
            {
                title = '黃點已經出現在我的植物上，你要做什麼？?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 2
            },
            {
                title = '植物的葉子上已經出現了藍色的灰塵，您要做什麼?',
                steps = {
                    {label = '摘個別葉子', value = 1},
                    {label = '在葉子上撒上肥料', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 3
            },
            {
                title = '你的植物出現第一朵花, 您要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '馬上把它們弄壞', value = 2},
                    {label = '給植物施肥', value = 3}
                },
                correct = 1
            },
            --[[{
                title = '給植物澆水後，奇怪的葉子開始出現，你要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 2
            },
            {
                title = '您的工廠幾乎已準備好削減您的工作量?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 1
            },--]]
            {
                title = '你的植物已經可以準備開始收穫?',
                steps = {
                    {label = '用剪刀收集', value = 1, min = 5, max = 25},
                    {label = '用手收集', value = 1, min = 10, max = 15},
                    {label = '用修枝剪剪', value = 1, min = 2, max = 40}
                },
                correct = 1
            },
        },
      },

      ['seed_opium'] = {
        sprite = 51,
        color = 60,
        object = 'prop_weed_01',
        --object = '452618762',
        end_object = 'prop_weed_02',
        --end_object = '-305885281',
        end_object = '-305885281',
        fail_msg = '不幸的是，你的植物已經枯萎了!',
        success_msg = '恭喜，您已經收穫了植物!',
        start_msg = '開始種植物.',
        success_item = 'opium',
        cops = 0,
        first_step = 2.35,
        steps = 5,
        cords = {
          --{x = -427.05, y = 1575.25, z = 357, distance = 20.25},
          {x = 1972.78, y = 3819.39, z = 32.50, distance = 10.25}, 
          --{x = 1198.05, y = -215.25, z = 55, distance = 20.25},
          --{x = 706.05, y = 1269.25, z = 358, distance = 10.25},
        },
        animations_start = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '2500'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim = 'idle_a', timeout = '2500'},
        },
        animations_end = {
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '2500'},
          {lib = 'amb@world_human_cop_idles@male@idle_a', anim ='idle_a', timeout = '2500'},
        },
        animations_step = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '2500'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '5000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '2500'},
        },
        grow = {
          2.24, 1.95, 1.65, 1.45, 1.20, 1.00
        },
        questions = {
            {
                title = '你看到你的植物發芽，你要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 1
            },
            {
                title = '黃點已經出現在我的植物上，你要做什麼？?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 2
            },
            {
                title = '植物的葉子上已經出現了藍色的灰塵，您要做什麼?',
                steps = {
                    {label = '摘個別葉子', value = 1},
                    {label = '在葉子上撒上肥料', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 3
            },
            {
                title = '你的植物出現第一朵花, 您要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '馬上把它們弄壞', value = 2},
                    {label = '給植物施肥', value = 3}
                },
                correct = 1
            },
            --[[{
                title = '給植物澆水後，奇怪的葉子開始出現，你要做什麼?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 2
            },
            {
                title = '您的工廠幾乎已準備好削減您的工作量?',
                steps = {
                    {label = '給植物澆水', value = 1},
                    {label = '給植物施肥', value = 2},
                    {label = '等待', value = 3}
                },
                correct = 1
            },--]]
            {
                title = '你的植物已經可以準備開始收穫?',
                steps = {
                    {label = '用剪刀收集', value = 1, min = 5, max = 25},
                    {label = '用手收集', value = 1, min = 10, max = 15},
                    {label = '用修枝剪剪', value = 1, min = 2, max = 40}
                },
                correct = 1
            },
        },
      },
}
