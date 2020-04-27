class ItemSerializer < ActiveModel::Serializer
  attribute :name, key: :Item_name
  attribute :description, key: :Item_description
  
end
