Rails.application.routes.draw do
  with_options controller: :questions do
    get 'question1/answer', action: :question1
    get 'question2/answer', action: :question2
    get 'question3/answer', action: :question3
    get 'question4/answer', action: :question4
    get 'question5/answer', action: :question5
    get 'question6/answer', action: :question6
  end
end
