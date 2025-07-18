pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--starfield
--16.07.2025
--ralf luesebrink
function _init()
     sterne = {}
     maxabstand=80
     pi=3.141
     counter=0
     hyper=8
 end

 function _update()
     --neue sterne spawnen
     local zufalls_winkel = rnd(2 * pi) -- winkel in radiant von 0 bis 2*pi
     add(sterne, stern:new(zufalls_winkel, 10))
     --alle sterne durchlaufen
     for stern in all(sterne) do
         if (stern.abstand>maxabstand) del(sterne,stern)
         stern:update()
         
     end
 end

 function _draw()
      if (counter%hyper==0) cls()
      counter=counter+1 
     for stern in all(sterne) do
         stern:draw()
     end
 end
-->8
-- stern klasse
stern = {}

function stern:new(winkel, abstand)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.winkel = winkel 
    o.abstand = abstand
    o.farbe=flr(rnd(16)) + 1 
    return o
end

function stern:update()
    self.abstand=self.abstand+1
end

function stern:draw()
    local center_x = 64
    local center_y = 64

    local x = center_x + self.abstand * cos(self.winkel)
    local y = center_y + self.abstand * sin(self.winkel)
    --farbe=7
    farbe=flr(rnd(16)) + 1
    --feuerwerk
    --pset(x, y, farbe) 
    --konfetti
    pset(x, y, self.farbe) 
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
