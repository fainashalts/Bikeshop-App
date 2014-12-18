class Motorcycle
  include Mongoid::Document
  field :name
  field :brand
  field :speed, type: Float
end