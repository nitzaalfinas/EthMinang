class HomeController < ApplicationController

	layout 'blank'

    def index
    	#redirect_to '/contracts/index'
		#system('ruby /Volumes/NZCARD/sites_ruby/EthMinang/jalan.rb')

		# Delete entire data
		ActiveRecord::Base.connection.execute("delete from geth_options")
		ActiveRecord::Base.connection.execute("vacuum")

		# Insert new one
        @grep = %x[pgrep -lf geth]
        @arr = @grep.split('--')
        @arr.each do |x|
			@str = x.rstrip # remove trailing space
			@keyval = @str.split(" ")

			@gop = GethOption.new
			@gop.key = @keyval[0]
			if @keyval.size > 1
				@gop.value = @keyval[1]
			end
			@gop.save
        end
    end

	def geth_is_not_running
	end

end
