Rails.application.routes.draw do

  devise_for :users
	resources :pins do
		resources :comments, only: [:create, :destroy]
		member do
			put "like", to: "pins#upvote"
		end
	end
	root "pins#index"

end
