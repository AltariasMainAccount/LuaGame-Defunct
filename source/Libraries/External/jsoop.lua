local jsoop = {} -- Declare the module array
local env = getfenv() -- get the default environment (default should be 1)

local function deepcopy(tab) -- Allows copying of tables and other variables.
    local var_type = type(tab) -- Check the variable type
    local copy
    if var_type == 'table' then -- If the variable type is a table, copy the 
    -- contents of the table onto the copy variable.
        copy = {}
        for key, val in pairs(tab) do -- using pairs because it does the same as next, tab
            copy[key] = val
        end
    else -- otherwise, copy it as is.
        copy = tab
    end
    return copy
end

function jsoop.Class(new) -- Symbolizes "class new" of JavaScript
    local class = deepcopy(new) -- deepcopy the table that is given as new
    class.new = function(...) -- declare a varargs function "class.new" to act as the constructor
        local o = deepcopy(class) -- deepcopy the class table
        setmetatable(o, {__index = function(self, i) return rawget(self, i) end }) -- setmetatable to object, with an index of self 
        if not o.constructor then -- if there is no constructor function, it will create one.
            o.constructor = (function() end) -- Declare a simple constructor to avoid breaking everything
        end
        o:constructor(...) -- Use the constructor function of the class
        o.constructor = nil -- nullify the constructor so that it can't be used from the object itself
        return o -- Return the object that was created
    end
    return class -- Return the class so that it can be used
end

function jsoop.Extends(new, origin) -- Symbolizes "class new extends origin" of JavaScript
    local class = deepcopy(new) -- deepcopy the table that is given as new
    class.new = function(...) -- declare a varargs function "class.new" to act as the constructor
        local o = deepcopy(class) -- deepcopy the class table
        local extends = origin and origin.new and origin.new(...)
        setmetatable(o, {__index = function(self, i) return extends and rawget(extends, i) end }) -- setmetatable to object, with an index of the extends table
        if not o.constructor then -- if there is no constructor function, it will create one.
            o.constructor = (function() end) -- Declare a simple constructor to avoid breaking everything
        end
        o:constructor(...) -- Use the constructor function of the class
        o.constructor = nil -- nullify the constructor so that it can't be used from the object itself
        return o -- Return the object that was created
    end
    return class -- Return the class so that it can be used
end

-- Set global environment instead of giving the functions to the variable in the other files.
env.Class = jsoop.Class -- can be accessed by simply doing Class({})
env.Extends = jsoop.Extends -- can be accessed by simply doing Extends({}, origintable)

return jsoop -- Return jsoop to register it as a module.