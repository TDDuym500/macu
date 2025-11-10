getgenv().Scr = getgenv().Scr or "Main" -- Main / Katun 

local urls = {
    main = "https://raw.githubusercontent.com/TDDuym500/macu/refs/heads/main/Main.lua",
    katun = "https://raw.githubusercontent.com/TDDuym500/macu/refs/heads/main/Katun.lua"
}

local function safeLoad(url)
    pcall(function()
        loadstring(game:HttpGet(url))()
    end)
end

local scr = tostring(getgenv().Scr):lower()
if urls[scr] then
    safeLoad(urls[scr])
else
    for _, url in pairs(urls) do
        task.spawn(function()
            safeLoad(url)
        end)
    end
end
