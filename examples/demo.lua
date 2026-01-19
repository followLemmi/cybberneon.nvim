-- cyberneon.nvim theme demo
-- This file demonstrates syntax highlighting with the theme

-- Module definition
local M = {}

-- Constants
local VERSION = "0.1.0"
local MAX_RETRIES = 3
local DEFAULT_TIMEOUT = 5000

-- Configuration table
M.config = {
  enable_diagnostics = true,
  use_treesitter = true,
  colors = {
    background = "#151144",
    foreground = "#00ff92",
  },
}

--- Initialize the module
--- @param opts table|nil Optional configuration
--- @return boolean success
function M.setup(opts)
  opts = opts or {}
  
  -- Merge user options with defaults
  for key, value in pairs(opts) do
    M.config[key] = value
  end
  
  print("Initialized with version: " .. VERSION)
  return true
end

--- Fetch data from an API endpoint
--- @param url string The URL to fetch
--- @param callback function Callback function
local function fetch_data(url, callback)
  -- TODO: Implement actual HTTP request
  local data = {
    status = "success",
    code = 200,
    body = "Hello, World!",
  }
  
  if callback then
    callback(data)
  end
end

--- Process data with error handling
--- @param input table Input data
--- @return table|nil result
--- @return string|nil error
function M.process(input)
  if type(input) ~= "table" then
    return nil, "Input must be a table"
  end
  
  local result = {}
  
  for i = 1, #input do
    local item = input[i]
    
    -- Filter and transform
    if item.active and item.value > 0 then
      table.insert(result, {
        id = item.id or i,
        value = item.value * 2,
        timestamp = os.time(),
      })
    end
  end
  
  return result, nil
end

--- Class example with metatable
local MyClass = {}
MyClass.__index = MyClass

function MyClass.new(name, value)
  local self = setmetatable({}, MyClass)
  self.name = name
  self.value = value or 0
  return self
end

function MyClass:increment()
  self.value = self.value + 1
end

function MyClass:get_info()
  return string.format("%s: %d", self.name, self.value)
end

-- String examples
local messages = {
  greeting = "Hello, cyberpunk world!",
  error = 'Something went wrong',
  template = [[
    This is a multi-line string
    with special characters: \n \t
    and interpolation: ${value}
  ]],
}

-- Regex pattern example
local pattern = "^[a-zA-Z0-9_]+$"

-- Conditional logic
local function check_status(code)
  if code == 200 then
    return "OK"
  elseif code >= 400 and code < 500 then
    return "Client Error"
  elseif code >= 500 then
    return "Server Error"
  else
    return "Unknown"
  end
end

-- Loop examples
for i = 1, 10 do
  if i % 2 == 0 then
    print("Even: " .. i)
  else
    print("Odd: " .. i)
  end
end

-- While loop with break
local count = 0
while count < MAX_RETRIES do
  count = count + 1
  if count == 2 then
    break
  end
end

-- Error handling with pcall
local success, result = pcall(function()
  return M.process({ { active = true, value = 10 } })
end)

if not success then
  error("Failed to process: " .. tostring(result))
end

-- Return the module
return M
