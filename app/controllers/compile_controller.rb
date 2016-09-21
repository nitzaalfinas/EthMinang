class CompileController < ApplicationController

    def index
    end

    def this_code
        @run = params[:the_name]
        @rpc = %x[#{@run}]
        puts @rpc
        render inline: @rpc
    end
end
