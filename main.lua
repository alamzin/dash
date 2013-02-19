function love.load()
    player = {
        grid_x = 240,
        grid_y = 240,
        act_x = 240,
        act_y = 240,
        speed = 10
    }
        math.randomseed (os.time() )


end


function love.update(dt)
    --player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
    --player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
end





function fill_starmap( x,y )
    -- loads list of stars to star map. BEWARE: doesn't check size of map.
end

function fill_starmap_coords( x,y )
    -- fills starmap with random coords
end

function generate_simple_names ()
	-- generates simple names - vowel+consonant OR consonant + vowel
	local vowels = "aaaeeeeeeoouiiiy"
    local consonants = "bccddfghhjkkllmmnnppqrssttvxz"
end

function populate_system (system)
    local system_name = string.lower(system)
    local alphabet = "abcdefghijklmnopqrstuvwxyz1234567890"
    local vowels = "aaaeeeeeeoouiiiy"
    local consonants = "bccddfghhjkkllmmnnppqrssttvxz"
    local numbers = "1234567890"
    local seed="dsf"
    local gen=""
    local char = 0
    local namelength = math.random(2,112)/2
    local is
    for i=1,namelength do
        char = math.random(1,string.len(vowels))
        gen=gen .. string.sub(vowels,char,char)
          char = math.random(1,string.len(consonants))
          gen = gen .. string.sub(consonants,char,char)
    end
    gen = string.upper(string.sub (gen,1,1)) .. string.sub (gen,2)
    love.graphics.print (gen,0,10)
end

function create_card(card)
    -- add new card to a deck
    local deck_size = #card + 1
    card[deck_size]={}
    card[deck_size].title="null"..deck_size
    card[deck_size].desc = "null"
    card[deck_size].mechanics = "null"


end


function status()
    -- brings status
    local crew = spacenav.crew
    status_message = "Midshipman1 reports, sir. \nToday is the " .. spacenav.turn .. " day since we departed from Earth."
    status_message = status_message .. " Fuel systems are online. We have " .. spacenav.fuel .. " fuel units in our tanks.\n"
    status_message = status_message .. " I recommend to spend no more than " .. tostring(spacenav.fuel*0.4) .. "fuel units before you decide to get back.\n"
    status_message = status_message .. " We're drifting at the " .. spacenav.system .. " system.\n"
    status_message = status_message .. "There are the systems we can visit right now:\n"
    status_message = status_message .. "oxy:"..resources.oxygen.."//".."pop:"..resources.population.."//".."fuel:"..resources.fuel.."\n"
    -- showlanes($spacenav["system"]);
    -- populate_system("Sol")
    return status_message

end



function love.draw()
    local i
    local j
    for i = 1,20 do
        for j = 1,20 do
            love.graphics.setColor (map[i][j].red, map[i][j].green, map[i][j].blue)
            love.graphics.rectangle ("fill", (i-1)*sprite.x_size, j*sprite.y_size,sprite.x_size,sprite.y_size)
    end
    end
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", player.grid_x, player.grid_y, 24, 24)
    love.graphics.setColor(0,0,0)
    love.graphics.print ("@", player.grid_x, player.grid_y)
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("line", 0, 0, 480, 24)
    love.graphics.rectangle("line", 0, 24, 480,480)
    --love.graphics.print( spacenav.navigational_status, 100, 120)
love.graphics.printf( spacenav["starmap"]["x"], 550, 24, 200, "left")
love.graphics.printf( spacenav.google, 550, 48, 200, "left")
love.graphics.printf( spacenav.starmap.z, 550, 72,200,"left")
love.graphics.printf( status(), 550, 96, 200,"left")

end

function love.keypressed(key)
    if key == "up" or key == "w" then
        player.grid_y = player.grid_y - 24
        if player.grid_y<24 then player.grid_y=24 end
    elseif key == "down" or key == "s" then
        player.grid_y = player.grid_y + 24
        if player.grid_y>480 then player.grid_y=480 end
    elseif key == "left" or key == "a" then
        player.grid_x = player.grid_x - 24
        if player.grid_x<0 then player.grid_x=0 end
    elseif key == "right" or key == "d" then
        player.grid_x = player.grid_x + 24
        if player.grid_x>480-24 then player.grid_x=480-24 end
    end
end

-- vars
canvas = love.graphics.newCanvas( )
x_map_size = 7;
y_map_size = 7;

sprite = {
    x_size = 24,
    y_size = 24
}

map ={}

    for i = 1,24 do
        map[i]={}
        for j = 1,24 do
            --map[i][j]={red=math.random(1,255), green=math.random(1,255), blue=math.random(1,255)}
map[i][j]={red=0, green=0, blue=math.random(1,255)}

    end
    end

--planet

spacenav = {}

spacenav["starmap"] = {x = 20}

spacenav["starmap"]["x"] = 10
spacenav["starmap"]["y"] = 5
spacenav.starmap.z = 12

spacenav ["navigational_status"] = "drift"


spacenav["starmap"]["x"] = 10

spacenav.turn  = 1
spacenav.fuel = 1000
spacenav.system = "Sol"
spacenav.google = "Yandex"

-- define main variables
resources = {}
resources.oxygen = 100
resources.population = 100
resources.fuel = 200


cards_in_deck = 38
cards = {}


for i = 1, cards_in_deck do
    create_card(cards)
end

