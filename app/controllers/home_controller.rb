class HomeController < ApplicationController

	layout 'blank'
    
    def index
    	redirect_to '/contracts/index'
    end

    def geth_run
    	#system(params[:geth_command])
    end
    
    
end