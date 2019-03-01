Rails.application.routes.draw do
  namespace :api do
    resources :event_logs, only: :create
  end

  with_options controller: :questions do
    get 'question1/answer', action: :question1
    get 'question2/answer', action: :question2
    get 'question3/answer', action: :question3
    get 'question4/answer', action: :question4
    get 'question5/answer', action: :question5
  end
end
