--[[
    Copyright 2019 Matix8981 <biuro@devlogic.pl> <mateusz8981@gmail.com>
]]

function ReadFile(path)
    local file = fileOpen(path)
    if not file then
        return false
    end
    local data = fileRead(file, fileGetSize(file))
    fileClose(file)
    return data
end

function WriteFile(path, text)
    if fileExists(path) then
        fileDelete(path)
    end
    local file = fileCreate(path)
    local result = fileWrite(text)
    fileClose(file)
    return result
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

function SetVariable(table, row, value)
    if not table then return false end
    if not row or not not Variables[table] then
        Variables[table] = {} -- Czyszczenie tablicy
    else
        if isElement(value) then return false end
        Variables[table][row] = value
    end
    WriteFile("variables.json", toJSON(value))
end