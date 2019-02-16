--[[
    Copyright 2019 Matix8981 <biuro@devlogic.pl> <mateusz8981@gmail.com>
]]

function ReadFile(path)
    local file = fileOpen(path)
    if not file then
        return false
    end
    local count = fileGetSize(file)
    local data = fileRead(file, count)
    fileClose(file)
    return data
end

local Variables = fromJSON(ReadFile("variables.json"))

function GetVariable(table, row)
    if table == nil and row == nil then
        return Variables
    elseif row == nil then
        return Variables[table]
    else
        return Variables[table][row]
    end
end