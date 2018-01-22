class WeighIn < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :end_date, :weight, :waist
  validates_numericality_of :weight, :waist, :nbf, :abf,
    :chest, :rfarm, :rbicep, :neck, :rcalf, :rupthigh, :cardio,
    :allow_nil => true

  cattr_reader :per_page
  @@per_page = 20

  def self.find_last_weigh_in(params)
    self.find(:first, :order => 'end_date desc',
              :conditions => "user_id = #{:user_id}")
  end

  def get_last_weigh_in
    unless @last
      @last = WeighIn.find_last_weigh_in(:user_id => user_id)
    end
    @last
  end

  def pounds_of_fat
    weight and nbf ? weight * nbf : 0
  end

  def pounds_of_muscle
    weight ? weight - pounds_of_fat : 0
  end

  def lean_muscle_lbs_change
    last = get_last_weigh_in
    last ? pounds_of_muscle - last.pounds_of_muscle : 0
  end

  def fat_lbs_change
    last = get_last_weigh_in
    last ? pounds_of_fat - last.pounds_of_fat : 0
  end

  def body_fat
    nbf
  end

  def to_s
    "\nUser: #{user_id} Date: #{end_date} Weight: #{weight} Waist: #{waist}\n"
  end

  def to_long_s
    to_s +
    "nbf #{body_fat}\n" +
     "pounds_of_fat #{pounds_of_fat}\n" +
     "pounds_of_muscle #{pounds_of_muscle}\n" +
     "fat_lbs_change #{fat_lbs_change}\n" +
     "lean_muscle_lbs_change #{lean_muscle_lbs_change}\n"
  end
end
