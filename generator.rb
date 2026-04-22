# lib/generator.rb
class Generator
  def draw_elements(pdf, state, width, height)
    srand(state.seed + state.frame)

    state.frame.times do
      grid = 10

      if state.frame <= 10
        margin = (1 - state.frame / 10.0) * (width / 2)
      else
        margin = 20
      end

      x = rand(margin..(width - margin))
      y = rand(margin..(height - margin))

      x = (x / grid).floor * grid
      y = (y / grid).floor * grid

      x += rand(-2..2)
      y += rand(-2..2)

      size =
        if state.phase <= 10
          rand(5..10)
        elsif state.phase <= 20
          rand(8..12)
        else
          rand(6..18)
        end

      pdf.fill_color "000000"
      pdf.fill_rectangle [x, y], size, size
    end
  end
end
