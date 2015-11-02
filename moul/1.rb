live_loop :pipi do
  play 70
  sleep 1
  play 75
  sleep 1
  play 70
  sleep 1
  play 63
  sleep 1
end

live_loop :caca do
  sample :drum_heavy_kick
  sleep 0.5
end

live_loop :prout do
  sleep 0.25
  sample :drum_snare_hard
  sleep 0.25
end
