class PersonalsController < ApplicationController
  def new
    @personal = Account.new
  end
end