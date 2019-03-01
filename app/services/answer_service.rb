class AnswerService
  class << self
    def question1(input_array, ascending: true)
      array = input_array.dup
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
