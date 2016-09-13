Rails.application.routes.draw do
    
    root to: 'home#index'

    post 'home/geth_run' => 'home#geth_run'

    get 'page/wallets'
    post 'page/run_command' => 'page#run_command'
    
    get 'contracts/index'      => 'contracts#index'
    get 'contracts/:id'        => 'contracts#show'
    get 'contracts/:id/action' => 'contracts#action_id'
    
    
    namespace :adm do
        resources :contracts
    end
    
end
