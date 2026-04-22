# lib/ui/ghost_window.rb
class GhostWindow
  def self.draw(pdf, state)
    w = pdf.bounds.width
    h = pdf.bounds.height

    x = 30 + rand(-2..2)
    y = h - 120 + rand(-2..2)

    pdf.stroke_rectangle [x, y], 140, 80

    status =
      if state.phase <= 10
        "SYNC"
      elsif state.phase <= 20
        "RUNNING"
      else
        ["ERR", "DESYNC", "NULL"].sample
      end

    pdf.draw_text "PROCESS", at: [x + 5, y - 15], size: 7
    pdf.draw_text "STATUS: #{status}", at: [x + 5, y - 30], size: 7
    pdf.draw_text "NODE: #{rand(1..9)}", at: [x + 5, y - 45], size: 7
  end
end
