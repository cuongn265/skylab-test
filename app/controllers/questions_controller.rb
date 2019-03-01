class QuestionsController < ApplicationController
  def question1
    array = [9, 1, 8, 2, 7, 3, 6, 4, 5, 10, 13]

    @ascending = AnswerService.question1(array, ascending: true)
    @descending = AnswerService.question1(array, ascending: false)
  end

  def question2
    array_1 = [3, 4, 6, 3, 7, 8, 5, 9]
    array_2 = [5, 4, 1, 2, 3]

    @result = AnswerService.question2(array_1, array_2)
  end
end
