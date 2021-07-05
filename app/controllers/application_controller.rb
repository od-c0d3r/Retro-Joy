class ApplicationController < ActionController::Base
    def index
        render html: "Hello, world!"
    end
end
