class Author < ActiveRecord::Base
  attr_accessor :author
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password
end
