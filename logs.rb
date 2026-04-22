# lib/ui/logs.rb
class Logs
  def self.draw(pdf, state)
    base_logs = [
      "boot sequence started",
      "checking memory blocks",
      "interface loading",
      "kernel handshake",
      "system stable"
    ]

    corrupted_logs = [
      "ERR::MEM_LEAK",
      "NULL_POINTER",
      "SYS//GLITCH",
      "??UNKNOWN??"
    ]

    log =
      if state.phase <= 20
        base_logs.sample
      else
        corrupted_logs.sample
      end

    pdf.draw_text log, at: [20, 40], size: 7
  end
end
