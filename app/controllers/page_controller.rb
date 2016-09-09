class PageController < ApplicationController
    
    def wallets
    	@keys = Dir.entries("/Users/nitzaalfinas/Library/Ethereum/testnet/keystore")
    end

    def run_command
        exec(params['command'])
        render inline: 'success'
    end
    
end
