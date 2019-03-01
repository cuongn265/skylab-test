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

    def question2(array_1, array_2)
      sorted_array_1 = question1(array_1)
      sorted_array_2 = question1(array_2)

      common_elements = []
      i = 0
      j = 0

      while (i < sorted_array_1.length && j < sorted_array_2.length)
        if (sorted_array_1[i] == sorted_array_2[j])
          common_elements << sorted_array_1[i]
          i += 1
          j += 1
        elsif (sorted_array_1[i] > sorted_array_2[j])
          j += 1
        else
          i += 1
        end
      end

      common_elements
    end

    def question3(string)
      hash = {}
      array = string.split('')

      array.each do |element|
        hash[element] ||= 0
        hash[element] += 1
      end

      array.each do |element|
        return element if hash[element] == 1
      end
    end

    def swap(a, b, array)
      temp = array[a]
      array[a] = array[b]
      array[b] = temp
      array
    end
  end
end
