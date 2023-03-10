class PurchaseOrder < ApplicationRecord
    attr_accessor :price
    has_and_belongs_to_many :order_items
    has_and_belongs_to_many :items
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    def as_indexed_json(options={})
    PurchaseOrderDenormalizer.new(self).to_hash
    end

    settings index: { number_of_shards: 1 } do
        mappings dynamic: 'false' do
            indexes :id, type: 'uuid'
            indexes :order_items, type: 'nested' do
                indexes :item_id, type: 'integer'
                indexes :quantity, type: 'integer'
                indexes :price, type: 'float'
                indexes :skus
                indexes :item_ids, type: :long
                indexes :platform_fee, type: :float
            end
        end
    end
end
