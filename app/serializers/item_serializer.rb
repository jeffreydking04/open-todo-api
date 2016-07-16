class ItemSerializer < ActiveModel::Serializer
  attributes :item

  def item
    object.item
  end
end
