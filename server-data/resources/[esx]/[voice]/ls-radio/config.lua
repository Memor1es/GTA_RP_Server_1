Config = {}

Config.RestrictedChannels = 10 -- channels that are encrypted (EMS, Fire and police can be included there) if we give eg 10, channels from 1 - 10 will be encrypted
Config.enableCmd = true --  /radio command should be active or not (if not you have to carry the item "radio") true / false

Config.messages = {

  ['not_on_radio'] = '不在無線電頻道裡',
  ['on_radio'] = '進入無線電頻道: <b>',
  ['joined_to_radio'] = '進入頻道: <b>',
  ['restricted_channel_error'] = '無法進入加密頻道!',
  ['you_on_radio'] = '已經加入頻道: <b>',
  ['you_leave'] = '離開頻道: <b>'

}
