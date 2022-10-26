require 'rails_helper'

it {should validate_presence_of(:username)}
it {should validate_presence_of(:password_digest)}
it {should validate_length_of(:password).is_at_least(6)} 
