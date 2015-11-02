mychords = [
  chord(:C3, :major, num_octaves:5).ring,
  chord(:G3, :minor, num_octaves:4).ring,
  chord(:A3, :minor, num_octaves:4).ring,
  chord(:F3, :major, num_octaves:4).ring,
].ring

i = 0

live_loop :arp3 do
  play 60
  use_synth :blade
  i += 1
  with_fx :panslicer, mix:0 do
    with_fx :bitcrusher, mix:0.5 do
      16.times do
        play mychords[i].choose + [12, -12].ring.tick, amp: 10
        sleep 0.125
      end
    end
  end
end

live_loop :boomboom do
  sample :drum_heavy_kick, amp: 20
  sleep 0.5
end

live_loop :bimbim do
  sleep 0.5
  sample :drum_snare_hard, amp: 20
  sleep 0.5
end

live_loop :tchiktchik do
  sleep 0.25
  sample :drum_cymbal_pedal, amp: 20
  sleep 0.25
end

live_loop :badaboom do
  sample :drum_cymbal_hard, amp: 20
  sleep 4
end

