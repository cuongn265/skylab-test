class AnswerService
  class << self
    def question1(ascending: true)
      array = [9, 1, 8, 2, 7, 3, 6, 4, 5, 10, 13]
      sorted = false
      comparison_operator = ascending ? :> : :<

      while (!sorted)
        sorted = true

        (0..array.length - 2).each do |index|
          if (array[index].send(comparison_operator, array[index +1]))
            array = swap(index, index +1, array)
            sorted = false
          end
        end
      end

      array
    end

    def swap(a, b, array)
      temp = array[a]
      array[a] = array[b]
      array[b] = temp
      array
    end
  end
end
