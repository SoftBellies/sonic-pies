live_loop :pipi do
  play :As4
  sleep 1
  play :Ds5
  sleep 1
  play :As4
  sleep 1
  play :Ds4
  sleep 1
end

live_loop :caca do
  sample :drum_heavy_kick
  sleep 0.5
end

live_loop :prout do
  stop
  sleep 0.25
  sample :drum_snare_hard
  sleep 0.10
  sample :drum_snare_hard
  sleep 0.25 + 0.15
  sample :drum_snare_hard
  sleep 0.25
end
