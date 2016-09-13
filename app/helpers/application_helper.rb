module ApplicationHelper

    def eth_datadir
        @keluar = ''
        @anu = ''
        @grep = %x[pgrep -lf geth]
        @arr = @grep.split('--')
        @arr.each do |x|
            if x[0..6] == 'datadir'
                @anu = x.rstrip
            end
        end

        if @anu == ''
            @keluar = "BERIKAN NILAI DEFAULT DARI GETH"
        else
            @keluar = @anu.split(" ")[1]
        end

        @keluar
    end

    def eth_getBalance(theAddress)
        `curl -X POST --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["#{theAddress}","latest"],"id":74}' localhost:8545`
    end
end
