class GamesController < InheritedResources::Base
  before_filter :authenticate

  protected

  def begin_of_association_chain
    current_user
  end
end
