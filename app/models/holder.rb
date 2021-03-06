class Holder < ActiveRecord::Base

  has_many :manages
  has_many :users, through: :manages
  has_many :areas, through: :positions
  has_many :positions, dependent: :delete_all

  accepts_nested_attributes_for :positions, reject_if: :all_blank, allow_destroy: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validate :must_have_position, on: :update

  scope :by_name, (lambda do |name|
    condition = ["((first_name || ' ' || last_name) ILIKE :name) or (last_name ILIKE :name) or (first_name ILIKE :name)", name: "%#{name}%"]
    where(condition).includes(positions: [:titular_events, :participants_events])
  end)

  def full_name
    (self.first_name.to_s.delete(',')+' '+self.last_name.to_s.delete(',')).mb_chars.to_s
  end

  def full_name_comma
    (self.last_name.to_s.delete(',')+', '+self.first_name.to_s.delete(',')).mb_chars.to_s
  end

  def current_position
    self.positions.current.first
  end

  def size_current_position
    self.positions.current.size
  end

  def self.managed_by (user_id)
    joins(:manages).where("manages.user_id" => user_id)
  end

  def self.create_from_uweb(data)
    holder = Holder.find_or_initialize_by(user_key: data['CLAVE_IND'])
    holder.first_name = data["NOMBRE_USUARIO"].strip
    holder.last_name = data["APELLIDO1_USUARIO"].strip
    holder.last_name += ' ' + data["APELLIDO2_USUARIO"].strip if data["APELLIDO2_USUARIO"].present?
    holder
  end

  private

    def must_have_position
      if positions.empty? or positions.all? {|child| child.marked_for_destruction? }
        errors.add(:base, I18n.translate('backend.must_have_position'))
      end
    end

end
