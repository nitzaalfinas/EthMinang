module ApplicationHelper

    # To determine the OS type
    def app_os
        Gem::Platform.local.os
    end

    def geth_is_running_or_no
        @grep = %x[pgrep -lf geth]
        if @grep.size == 0
            redirect_to '/home/geth_is_not_running'
        end
    end

    def tesnet_or_real
        @gop = GethOption.where(key: 'testnet').first
        if @gop
            @keluar = 'testnet'
        else
            @keluar = 'real'
        end
    end

    # This function is use to determie the data directory of chain
    # This function is using a command "pgrep -lf" instead of "ps | grep geth"
    def eth_datadir
        @gop = GethOption.where(key: 'datadir').first

        if @gop
            @keluar = @gop.value
        else
            if app_os == 'darwin'
                @keluar = ENV['HOME']+'/Library/Ethereum'
            elsif app_os == 'linux'
                @keluar = ENV['HOME']+'/.ethereum'
            end
        end

        @keluar
    end

    # This function is use to determine where the keystore path is
    def eth_keystore_dir
        @keluar = ''
        if tesnet_or_real == 'testnet'
            @keluar = eth_datadir+'/testnet/keystore'
        else
            @keluar = eth_datadir
        end

        @keluar
    end

    def eth_getBalance(theAddress)
        @res = `curl -X POST --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["#{theAddress}","latest"],"id":74}' localhost:8545`
        @reshash = JSON.parse(@res)
        #@reshash['result']
        @reshash['result'].to_i(16)
    end
end
