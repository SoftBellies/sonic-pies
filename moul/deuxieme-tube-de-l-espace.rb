use_bpm 60

num_octaves = 3

chords = [
  chord(:b1, :major, num_octaves: num_octaves),
  chord(:d2, :major, num_octaves: num_octaves),
  chord(:g2, :major, num_octaves: num_octaves),
  chord(:e2, :major, num_octaves: num_octaves)
].ring

chords_len = 1.0 * chords.length

# slide effect from MXS <3
define :slide do |line, ticker|
  n = ticker
  if n >= line.to_a.length
    return line.last
  end
  return line[n]
end

live_loop :arpeg do
  use_synth :pretty_bell
  use_synth_defaults cutoff: slide(line(80, 100, steps: 16), tick(:arpeg_cutoff)), release: 0.25, decay_level: 1, env_curve: 2

  repeat_time = 32.0
  sleep_time = chords_len / repeat_time

  base_chord = chords.ring.tick(:bassline_note)

  with_fx :bitcrusher, mix: slide(line(0, 1, steps: 16), tick(:arpeg_bitcrusher)) do
    with_fx :panslicer do
      repeat_time.times do
        play base_chord.choose
        sleep sleep_time
      end
    end
  end
end

live_loop :ambient do
  base_chord = chords.ring.tick(:ambient_note)
  base_ambient = base_chord[0]
  use_synth :fm
  use_synth_defaults release: 0, sustain: 4, noise: 3, ring: 0.5, amp: slide(line(0.5, 1, steps: 16), tick(:ambiant_amp))
  play base_ambient
  sleep chords_len
end
