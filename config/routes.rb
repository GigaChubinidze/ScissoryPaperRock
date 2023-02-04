Rails.application.routes.draw do
  post 'throw' => 'game#throw', as: :throw
  root 'game#new'
end
