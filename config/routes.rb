Rails.application.routes.draw do

    root to: 'home#index'

    get  'home/geth_is_not_running'  => 'home#geth_is_not_running'

    get  'page/wallets/index'            => 'page#wallets'
    get  'page/wallets/new'              => 'page#wallets_new'
    post 'page/wallets/new'              => 'page#wallets_new_post'
    get  'page/wallets/send_money'       => 'page#wallets_send_money'
    post 'page/wallets/send_money_post'  => 'page#wallets_send_money_post'
    get  'page/get_param/index'          => 'page#get_param_index'

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
