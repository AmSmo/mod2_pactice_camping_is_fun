class SignupsController < ApplicationController
    before_action :new_signup, only: [:create, :new]

    def new
        if flash[:params]
            @signup.update(flash[:params])
        end
    end

    def create
        @signup.update(signup_params)
        if @signup.valid?
            redirect_to camper_path(@signup.camper)
        else
            flash[:errors] = @signup.errors.full_messages
            flash[:params] = signup_params
            redirect_to new_signup_path
        end
    end

    private

    def new_signup
        @signup = Signup.new
    end

    def signup_params
        params.require(:signup).permit(:camper_id, :activity_id, :time)
    end
end