function getbrightness --wraps='brightnessctl -m | cut -d, -f4' --description 'alias getbrightness=brightnessctl -m | cut -d, -f4'
  brightnessctl -m | cut -d, -f4 $argv
        
end
