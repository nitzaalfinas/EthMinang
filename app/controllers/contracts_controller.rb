class ContractsController < ApplicationController
    
    def index
        @contracts = Contract.all
    end
    
    def show
        @contract = Contract.find(params[:id].to_i)
    end
    
    def action_id
        @contract = Contract.find(params[:id].to_i)
        @abi_part = JSON.parse(params[:abi_part])
    end
end
