class PageController < ApplicationController

    include ApplicationHelper

    before_action :geth_is_running_or_no

    def wallets
        @rpc = `curl -X POST --data '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}' localhost:8545`
        @keys = JSON.parse(@rpc)
    end

    def wallets_new
    end

    def wallets_new_post
        @password = params[:password]
        if @password != params[:password_confirmation]
            flash[:notice] = "Password confirmation didn't match"
            render 'wallets_new'
        else
            @rpcstr = `curl -X POST --data '{"jsonrpc":"2.0","method":"personal_newAccount","params":["#{@password}"],"id":1}' localhost:8545`
            flash[:info] = @rpcstr
            redirect_to action: 'wallets'
        end
    end

    def wallets_send_money
        @from_address = params[:from_address]
        @ether_balance = params[:ether_balance]
    end

    def wallets_send_money_post
        @from   = params[:_from]
        @to     = params[:_to]
        @amount = params[:_amount]
        @password = params[:_password]

        # UNLOCK
        # https://github.com/ethereum/go-ethereum/wiki/Management-APIs#personal_unlockaccount
        puts 'curl -X POST --data \'{"jsonrpc":"2.0","method":"personal_unlockAccount","params":["'+ @from+'", "'+@password+'", 30 ],"id":1}\' localhost:8545'
        @unlock = 'curl -X POST --data \'{"jsonrpc":"2.0","method":"personal_unlockAccount","params":["'+ @from+'", "'+@password+'", 30 ],"id":1}\' localhost:8545'
        @rpc_unlock = %x[#{@unlock}]

        puts 'curl -X POST --data \'{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{ "from": "'+ @from+'", "to": "'+@to+'", "value": "'+@amount+'" }],"id":2}\' localhost:8545'
        @send = 'curl -X POST --data \'{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{ "from": "'+ @from+'", "to": "'+@to+'", "value": "'+@amount+'" }],"id":2}\' localhost:8545'

        #@rpc = `curl -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{ "from": "#{@from}", "to", "#{@to}", "value": "#{@amount}" }],"id":1}' localhost:8545`

        @rpc_send = %x[#{@send}]

        puts @rpc_send

        #@keys = JSON.parse(@rpc)
        #render json: @keys
    end

=begin
    def run_command
        exec(params['command'])
        render inline: 'success'
    end
=end


    def get_param_index
        @grep = %x[pgrep -lf geth]
        @arr = @grep.split('--')
        @arr.each do |data|
            #puts data.rtrim
        end
    end

end
