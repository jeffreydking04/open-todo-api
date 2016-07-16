class ItemSerializer < ActiveModel::Serializer
  attributes :id, :item

  def item
    object.item
  end
end
