ESX = nil
local savedNotes = {
  
}

TriggerEvent('server:LoadsNote')
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--#Delete comments to use from inventory
-- ESX.RegisterUsableItem('notepad', function(source)
--   local _source  = source
--   local xPlayer   = ESX.GetPlayerFromId(_source)
--   TriggerClientEvent('lkrp_notepad:note', _source)
--   TriggerClientEvent('lkrp_notepad:OpenNotepadGui', _source)
-- end)

TriggerEvent('es:addCommand', 'notes', function(source, args, user)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local item    = xPlayer.getInventoryItem('notepad').count
if item > 0 then
    TriggerClientEvent('lkrp_notepad:note', _source)
    TriggerClientEvent('lkrp_notepad:OpenNotepadGui', _source)
    TriggerEvent('server:LoadsNote',_source)
else
     TriggerClientEvent('esx:showNotification', _source, '你沒有筆記本')
end
    
end, {help = "Open notepad if you have it!"})

RegisterCommand('notes', function(source, args, rawCommand)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local item    = xPlayer.getInventoryItem('notepad').count
  if item > 0 then
      TriggerClientEvent('lkrp_notepad:note', _source)
      TriggerClientEvent('lkrp_notepad:OpenNotepadGui', _source)
      TriggerEvent('server:LoadsNote',_source)
  else
      TriggerClientEvent('esx:showNotification', _source, '你沒有筆記本')
  end

end)



RegisterNetEvent("server:LoadsNote")
AddEventHandler("server:LoadsNote", function()

  local _source = source
  
  --print('load')
  MySQL.ready(function()
  
    MySQL.Async.fetchAll('SELECT * FROM note', {}, function(result)
    
    
      for i=1, #result, 1 do
        local have = false
        local import = {
        ["id"] = result[i].id ,
        ["text"] = "".. result[i].text .."",
        ["x"] = result[i].x,
        ["y"] = result[i].y,
        ["z"] = result[i].z,
        }
        for j=1, #savedNotes , 1 do
          if savedNotes[j].id == import.id then
            have = true
          end
        end
        
        if not have then
          table.insert(savedNotes, import)
          
        end
        
      end
    
    end)
  
  end)

   TriggerClientEvent('lkrp_notepad:updateNotes', _source, savedNotes)
end)

RegisterNetEvent("server:newNote")
AddEventHandler("server:newNote", function(text, x, y, z)

  local _source = source
      --local import = {
      --  ["text"] = ""..text.."",
      --  ["x"] = x,
      --  ["y"] = y,
      --  ["z"] = z,
      --}
    
    MySQL.Async.execute('INSERT INTO note (text , x ,y ,z) VALUES (@text , @x , @y ,@z)',
      {
        ['@text'] = ""..text.."",
        ['@x']          = x,
        ['@y']          = y,
        ['@z']          = z
      })
      --table.insert(savedNotes, import)
      TriggerEvent("server:LoadsNote",_source)
end)

RegisterNetEvent("server:updateNote")
AddEventHandler("server:updateNote", function(noteID, text)
  
  local _source = source
  savedNotes[noteID]["text"]=text
  TriggerEvent("server:LoadsNote",_source)
end)

RegisterNetEvent("server:destroyNote")
AddEventHandler("server:destroyNote", function(noteID)
  --table.remove(savedNotes, noteID)
 -- print('destroy' .. noteID)
  local _source = source
  MySQL.Async.execute('delete from note where id = @id ', {
        ['@id']      = noteID
  })
      
  savedNotes = {}
  TriggerEvent("server:LoadsNote",_source)
end)

