# system_state.rb
class SystemState
  attr_reader :phase
  attr_accessor :seed, :frame, :mem, :cpu, :sig, :entropy

  def initialize(seed)
    @seed = seed
    @frame = 0
    @phase = 1

    # initial system values (fixed starting point)
    @mem = 40.0
    @cpu = 20.0
    @sig = 500.0
    @entropy = 0.01
  end

  def tick
    @frame += 1

    # DRIFT (no phases, only slow mutation)
    @mem += rand(-1.5..2.0)
    @cpu += rand(-2.0..2.5)
    @sig += rand(-10..10)
    @entropy += rand(0.0..0.02)

    # soft boundaries (NOT resets, just resistance)
    @mem = [[@mem, 0].max, 100].min
    @cpu = [[@cpu, 0].max, 100].min
  end
end
