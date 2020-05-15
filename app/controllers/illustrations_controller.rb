class IllustrationsController < ApplicationController
    def create
        @event.illustration.attach(params[:illustration])
    end
end
