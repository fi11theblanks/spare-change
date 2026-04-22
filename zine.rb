REQUIRED_FILES = [
  "./lib/generator.rb",
  "./lib/system_state.rb",
  "./lib/ui/main_window.rb",
  "./lib/ui/metrics.rb",
  "./lib/ui/ghost_window.rb",
  "./lib/ui/logs.rb"
]

missing = REQUIRED_FILES.reject { |f| File.exist?(File.join(__dir__, f)) }

unless missing.empty?
  puts "❌ BOOT FAILED"
  puts "Missing files:"
  missing.each { |f| puts "  - #{f}" }
  exit
end

puts "✔ Boot check passed"
require "prawn"
require_relative "./lib/generator"
require_relative "./lib/system_state"
require_relative "./lib/ui/main_window"
require_relative "./lib/ui/metrics"
require_relative "./lib/ui/ghost_window"
require_relative "./lib/ui/logs"

generator = Generator.new
state = SystemState.new(1337)

frames = 30

frames.times do |i|
  output = File.join(__dir__, "output", "frame_%02d.pdf" % i)

  Prawn::Document.generate(output, page_size: "A4", margin: 0) do |pdf|
    pdf.font "Courier"

    width = pdf.bounds.width
    height = pdf.bounds.height

    generator.draw_elements(pdf, state, width, height)

    MainWindow.draw(pdf, state)
    Metrics.draw(pdf, state)
    GhostWindow.draw(pdf, state)
    Logs.draw(pdf, state)
  end

  state.tick
end
