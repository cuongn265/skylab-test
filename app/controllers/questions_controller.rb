class QuestionsController < ApplicationController
  def question1
    array = [9, 1, 8, 2, 7, 3, 6, 4, 5, 10, 13]

    @ascending = AnswerService.question1(array, ascending: true)
    @descending = AnswerService.question1(array, ascending: false)
  end

end
