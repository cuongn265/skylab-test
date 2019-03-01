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

    def question4(string, column: 1, ascending: true)
      array = string.split('')
      sorted_array = question1(array, ascending: ascending)
      hash = {}
      new_array = [[]]
      i = 0

      sorted_array.each_with_index do |el, index|
        new_array[i] ||= []
        new_array[i][0] = el
        new_array[i][1] ||= 1

        if sorted_array[index] == sorted_array[index + 1]
          new_array[i][1] += 1
          i -= 1
        end

        i +=1
      end

      result_array = sort_array_by_column(new_array, column: column, ascending: !ascending)
      result_array.to_h
    end

    def swap(a, b, array)
      temp = array[a]
      array[a] = array[b]
      array[b] = temp
      array
    end

    def sort_array_by_column(input_array, column: 0, ascending: true)
      array = input_array.dup
      sorted = false
      comparison_operator = ascending ? :> : :<

      while (!sorted)
        sorted = true

        (0..array.length - 2).each do |index|
          if (array[index][column].send(comparison_operator, array[index +1][column]))
            array = swap(index, index +1, array)
            sorted = false
          end
        end
      end

      array
    end
  end
end
