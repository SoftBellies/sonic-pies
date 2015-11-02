mychords = [
  chord(:C3, :major, num_octaves:5).ring,
  chord(:G3, :minor, num_octaves:4).ring,
  chord(:A3, :minor, num_octaves:4).ring,
  chord(:F3, :major, num_octaves:4).ring,
].ring

i = 0

play_drum = 1
play_bass = 1
play_arp = 1

live_loop :counters do
  i += 1
  sleep 2
end

live_loop :bass do
  use_synth :fm
  stop if play_bass < 1
  sleep 0.25
  use_synth_defaults release: 0.2
  play mychords[i][0] - 12, amp: 2
  sleep 0.25
end

live_loop :arp3 do
  stop if play_arp < 1
  play 60
  use_synth :dsaw
  with_fx :panslicer, mix: 0.5 do
    with_fx :bitcrusher, mix: 0.1 do
      16.times do
        play mychords[i].choose + [12, -12].ring.tick, amp: 0.5, cutoff: line(40, 130, steps: 16 * 64).tick(:arp)
        sleep 0.125
      end
    end
  end
end

live_loop :boomboom do
  stop if play_drum < 1
  sample :drum_heavy_kick, amp: 20
  sleep 0.5
end

live_loop :bimbim do
  stop if play_drum < 1
  7.times do
    sleep 0.5
    sample :drum_snare_hard, amp: 5
    sleep 0.5
  end
  sleep 0.5
  2.times do
    sample :drum_snare_hard, amp: 5
    sleep 0.25
  end
end

live_loop :tchiktchik do
  stop if play_drum < 1
  sleep 0.25
  sample :drum_cymbal_closed, amp: 3
  sleep 0.25
end

live_loop :badaboom do
  stop if play_drum < 1
  sample :bass_dnb_f, amp: 20
  sleep 8
end
