# esx_gym

### Discord

[Discord](https://discord.gg/yHytSHx)

### Requirements

- es_extended
- mysql-async
- cron

### Features

- Workouts: Yoga, Crunches, Situps, Pushups, Weights, Chins/pull-ups
- Configurable membership price and expiration (in days) with automatic expiration
- Configurable cooldown between workouts

### WIP

- Increase the player inventory max weight using the new ESX inventory system
- Decrease the player inventory on death
- i18n

## Download & Installation

### Using Git

```
cd resources
git clone https://github.com/esx-scripts/esx_gym [esx]/esx_gym
```

### Manually

- Download https://github.com/esx-scripts/esx_gym/archive/master.zip
- Put it in the `[esx]` directory

## Installation

- Import `esx_gym.sql` in your database
- Add esx_gym to your `server.cfg`:

```
start esx_gym
```

# Legal

### License

Copyright (C) 2019 ESX Scripts

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
