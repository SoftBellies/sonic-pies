use_bpm 60

chords = [
  chord(:b1, :major, num_octaves: 3),
  chord(:d2, :major, num_octaves: 3),
  chord(:g2, :major, num_octaves: 3),
  chord(:e2, :major, num_octaves: 3)
].ring

define :slide do |line, ticker|
  n = ticker
  if n >= line.to_a.length
    return line.last
  end
  return line[n]
end

live_loop :chords do
  use_synth :pretty_bell
  use_synth_defaults cutoff: slide(line(80, 100, steps: 16), tick(:bassline_cutoff)), release: 0.25

  sleep = 0.25/2
  repeat = 32

  base_chord = chords.ring.tick(:bassline_note)

  with_fx :panslicer do
    repeat.times do
      play base_chord.choose
      sleep sleep
    end
  end
end

live_loop :ambient do
  base_chord = chords.ring.tick(:bassline_note)
  base_ambient = base_chord[0]
  use_synth :fm
  use_synth_defaults release: 0, sustain: 4, noise: 3, ring: 0.5, amp: slide(line(0.2, 0.6, steps: 16), tick(:amp_ambient))
  play base_ambient
  sleep 4
end
