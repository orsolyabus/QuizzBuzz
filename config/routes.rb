Rails.application.routes.draw do
  match(
    "/delayed_job",
    to: DelayedJobWeb,
    anchor: false,
    via: [:get, :post]
  )

  resources :users

  resource :sessions, only: [:new, :create, :destroy]

  resources :quizzes do
    resources :questions
    resources :results, only: [:create, :show]
  end

  get("/leaderboard", { to: "home#leaderboard", as: :leaderboard })
  
  get("/users/quizzes/completed", {to: "users#completed_quizzes", as: :completed_quizzes})

  get("/users/:id/created", { to: "users#created_quizzes", as: :created_quizzes})


  root({ to: 'home#index' })
end
