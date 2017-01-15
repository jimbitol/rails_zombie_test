class Zombie < ApplicationRecord

	validates :name, presence: true
	
	has_one :brain, dependent: :destroy

	before_save :make_rotting , if: :age_changed?
	after_save :decomp_change_notification, if: :age_changed?

	scope :rotting, -> { where(rotting: true) }
	scope :fresh, -> { where("age < 20") }
	scope :recent, -> { where("created_at desc").limit(3) }

	def as_json(options = nil)
		super(options || {include: :brain, except: [:created_at, :updated_at, :id]})
	end

	def make_rotting
		self.rotting = true if age > 20
	end

	private

	def decomp_change_notification
		ZombieMailer.decomp_change(self).deliver if rotting
	end
end
