class Equipment < ApplicationRecord
    belongs_to :factory
    has_many :boms
    has_many :spares, through: :boms
    validates :tag_no, presence: true
    validates :tag_no,  uniqueness: true

    scope :search_for_tag, ->(eq,factory_id) { where("tag_no  LIKE '%#{eq}%' AND factory_id = ? " , factory_id )  }
end
