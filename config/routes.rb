Rails.application.routes.draw do

    root to: 'home#index'

    post 'home/geth_run' => 'home#geth_run'

    get  'page/wallets/index'   => 'page#wallets'
    get  'page/wallets/new'     => 'page#wallets_new'
    post 'page/wallets/new'     => 'page#wallets_new_post'
    #post 'page/run_command'   => 'page#run_command'
    get  'page/get_param/index' => 'page#get_param_index'

    get 'contracts/index'      => 'contracts#index'
    get 'contracts/:id'        => 'contracts#show'
    get 'contracts/:id/action' => 'contracts#action_id'


    namespace :adm do
        resources :contracts

        resources :config do
            collection do
                get 'save'
            end
        end
    end

end
