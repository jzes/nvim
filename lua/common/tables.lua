local tables = {}

function tables.toLowerKeys(tbl)
    local resultTbl = {}
    for k, v in pairs(tbl) do
        if type(k) == "string" then
            resultTbl[string.lower(k)] = v
        else
            resultTbl[k] = v
        end
    end
    return resultTbl
end

return tables
