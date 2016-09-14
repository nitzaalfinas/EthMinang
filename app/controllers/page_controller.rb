class PageController < ApplicationController

    include ApplicationHelper

    def wallets
        @rpc = `curl -X POST --data '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}' localhost:8545`
        @keys = JSON.parse(@rpc)
    end

    def wallets_new
    end

    def wallets_new_post
    end

    def wallets_send_money
        @from_address = params[:from_address]
    end

    def run_command
        exec(params['command'])
        render inline: 'success'
    end


    def get_param_index
        @grep = %x[pgrep -lf geth]
        @arr = @grep.split('--')
        @arr.each do |data|
            #puts data.rtrim
        end
    end

end
