class Track < ApplicationRecord
    validates :title, :ord, :album_id, presence: true
    validates :track_type, inclusion: %w(regular bonus)
    
    belongs_to :album

    has_one :band, 
    through: :album, 
    source: :band, 
    dependent: :destroy


end
