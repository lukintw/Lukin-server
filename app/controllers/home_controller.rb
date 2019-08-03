class HomeController < ApplicationController
    def index
        ActiveRecord::Base.connection.tables.map do |model|
            puts model.capitalize.singularize.camelize
        end
    end
end
