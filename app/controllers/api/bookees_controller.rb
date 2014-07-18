class Api::BookeesController < ApplicationController
respond_to :json

inherit_resources
actions :index,:show

end
