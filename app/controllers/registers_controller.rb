class RegistersController < ApplicationController

	def new
	@register=Register.new 
	end

    def create
    @register=Register.new(register_params)
    if @register.save
    redirect_to @register
else
	render 'new'
    end
    end

    def show

    end


     private
    def register_params
      params.require(:register).permit(:firstname, :lastname, :phone , :email , :password, :confirm_password)
    end
end
