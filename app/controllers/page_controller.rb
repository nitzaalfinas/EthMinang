class PageController < ApplicationController

    include ApplicationHelper

    def wallets
    	@keys = Dir.entries(eth_keystore_dir)
    end

    def wallets_new
    end

    def wallets_new_post

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
