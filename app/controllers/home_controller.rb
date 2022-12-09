class HomeController < ApplicationController
    def index
        @indicator = Indicator.all
        render json: @indicator
    end
end