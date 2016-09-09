class Adm::ContractsController < ApplicationController
    
    before_action :set_contract, only: [:show, :edit, :update, :destroy]

    # GET /contracts
    def index
        @contracts = Contract.all
    end

    # GET /contracts/1
    def show
    end

    # GET /contracts/new
    def new
        @contract = Contract.new
    end

    # GET /contracts/1/edit
    def edit
    end

    # POST /contracts
    def create
        @contract = Contract.new(contract_params)
        
        if @contract.save
            redirect_to controller: 'adm/contracts', action: 'index', notice: 'Contract was successfully created.'
        else
            render 'adm/new'
        end
    
    end

    # PATCH/PUT /contracts/1
    def update
        
        if @contract.update(contract_params)
            redirect_to controller: 'adm/contracts', action: 'index', notice: 'contract was successfully updated.'
        else
            render 'adm/edit'
        end
    end

    # DELETE /contracts/1
    def destroy
        @contract.destroy
        respond_to do |format|
            format.html { redirect_to contracts_url, notice: 'contract was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_contract
          @contract = Contract.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def contract_params
          params.require(:contract).permit(:name, :abi)
        end
    
end
