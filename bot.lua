local discordia = require('discordia')
local client = discordia.Client()
local prefix = 's!'

local open = io.open

local function read_file(path)
    local file = open(path, "rb")
    if not file then return nil end
    local content = file:read "*a"
    file:close()
    return content
end
client:on('messageCreate', function(message) 
	if message.content == prefix..'ping' then
		message.channel:send('pong')
	end
end)

local token = read_file('./token.txt')
client:run("Bot "..token)
