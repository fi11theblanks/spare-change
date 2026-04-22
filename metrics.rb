# lib/ui/metrics.rb
class Metrics
  def self.draw(pdf, state)
    w = pdf.bounds.width
    h = pdf.bounds.height

    mem = (state.phase * rand(2..5)) % 100
    cpu = (state.phase * rand(3..7)) % 100
    sig = 300 + state.phase * rand(5..15)

    metrics = [
      "MEM: #{mem}%",
      "CPU: #{cpu}%",
      "SIG: #{sig}Hz"
    ]

    y = h - 40

    metrics.each do |m|
      pdf.draw_text m, at: [w - 120, y], size: 7
      y -= 10
    end
  end
end
