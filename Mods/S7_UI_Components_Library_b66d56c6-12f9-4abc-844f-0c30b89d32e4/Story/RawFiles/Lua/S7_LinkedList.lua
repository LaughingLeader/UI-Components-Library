--  ===========
--  LINKED LIST
--  ===========

List = {}
List.__index = List

setmetatable(List, { __call = function(_, ...)
    local t = setmetatable({ length = 0 }, List)
    for _, v in ipairs{...} do t:push(v) end
    return t
end })

--  CLEAR
--  -----

function List:clear()
    self.length = 0
    self.first = nil
    self.last = nil
end

--  UNSHIFT
--  -------

function List:unshift(element)
    if self.first then
        self.first._prev = element
        element._next = self.first
        self.first = element
    else
        self.first = element
        self.last = element
    end
    self.length = self.length + 1
end

--  SHIFT
--  -----

function List:shift()
    if not self.first then return end

    local element = self.first
    if element._next then
        element._next._prev = nil
        self.first = element._next
        element._next = nil
    else
        self.first = nil
        self.last = nil
    end
    self.length = self.length - 1
    return element
end

--  PUSH
--  ----

function List:push(element)
    if self.last then
        self.last._next = element
        element._prev = self.last
        self.last = element
    else
        self.first = element
        self.last = element
    end
    self.length = self.length + 1
end

--  POP
--  ---

function List:pop()
    if not self.last then return end

    local element = self.last
    if element._prev then
        element._prev._next = nil
        self.last = element._prev
        element._prev = nil
    else
        self.first = nil
        self.last = nil
    end
    self.length = self.length - 1
    return element
end

--  INSERT
--  ------

function List:insert(element, at)
    if at then
        if at._next then
            at._next._prev = element
            element.next = at._next
        else
            self.last = element
        end

        element._prev = at
        at._next = element
        self.length = self.length + 1

    elseif not self.first then
        self.first = element
        self.last = element
    end
end

--  REMOVE
--  ------

function List:remove(element)
    if element._next then
        if element._prev then
            element._next._prev = element._prev
            element._prev._next = element._next
        else
            element._next._prev = nil
            self.first = element._next
        end
    elseif element._prev then
        element._prev._next = nil
        self.last = element._prev
    else
        self.first = nil
        self.last = nil
    end

    element._next = nil
    element._prev = nil
    self.length = self.length - 1
end


--  ITERATE
--  -------

local function iterate(self, current)
    if not current then
      current = self.first
    elseif current then
      current = current._next
    end

    return current
  end

  function List:iterate()
    return iterate, self, nil
  end