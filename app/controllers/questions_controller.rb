class QuestionsController < ApplicationController
  def question1
    @ascending = AnswerService.question1(ascending: true)
    @descending = AnswerService.question1(ascending: false)
  end
end
