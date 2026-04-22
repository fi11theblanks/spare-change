# lib/ui/main_window.rb
class MainWindow
  def self.draw(pdf, state)
    w = pdf.bounds.width
    h = pdf.bounds.height

    pdf.stroke_rectangle [10, h - 10], w - 20, h - 20

    pdf.fill_rectangle [10, h - 10], w - 20, 18
    pdf.fill_color "FFFFFF"
    pdf.draw_text "SYSTEM BOOT", at: [15, h - 23], size: 7
    pdf.fill_color "000000"

    pdf.draw_text "ACTIVE", at: [15, 20], size: 7

    pdf.stroke_rectangle [w - 70, 25], 50, 15
    pdf.draw_text "OK", at: [w - 52, 29], size: 7
  end
end
