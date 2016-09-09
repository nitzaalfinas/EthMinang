Rails.application.routes.draw do
    
    root to: 'home#index'

    get 'page/wallets'
    post 'page/run_command' => 'page#run_command'
    
    get 'contracts/index'      => 'contracts#index'
    get 'contracts/:id'        => 'contracts#show'
    get 'contracts/:id/action' => 'contracts#action_id'
    
    
    namespace :adm do
        resources :contracts
    end
    
end
