class Swimmer < ActiveRecord::Base
  self.table_name = 'teme'
  attr_accessible :level_changed, :usms_2018, :usms_reg, :usms_id

  has_many :usms, class_name: 'Usms', primary_key: :usms_id, foreign_key: :usms_id

  def self.roster
    swimmers = where('Membership Status': 'Active').
    where( "(`Membership level` = 'Monthly Membership') or 
      (`Membership level` = 'Swim Card' AND
        level_changed > ?)", 90.days.ago).
    order("`Last name`, `First name`")

    swimmers.map do |swimmer|
      "#{swimmer['First name']} #{swimmer['Last name']} (#{swimmer.level}) #{'NO USMS' if !swimmer.usms_2018.present?}".strip
    end
  end

  def self.prompts
    inp = '      <input type="Checkbox" name="name" ONKEYPRESS="return handleEnter(this, event);" VALUE="'

    roster.map do |pr|
      "#{inp}#{pr}\">#{pr}<br />"
    end.join("\r\n")       
  end

  def name
    [self['First name'], self['Last name']].join(' ')
  end

  def level
    self['Membership level'] == 'Monthly Membership' ? 'M' : 
     self['Membership level'] == 'Swim Card' ? 'SC' : '?'
  end

  def self.upd year=2018
    all.each do |swimmer|
      swimmer.upd(year)
    end
  end

  def upd year=2018
    us = usms.where(year: year).first
    
    return false if !us

    update_attributes(usms_2018: us['USMS Number'], usms_reg: us.usms_reg)
  end

  def self.chk year=2018
    all.select do |swimmer|
      swimmer.diff?(year)
    end
  end

  def diff? year=2018
    us = usms.where(year: year).first
    
    return false if !us

    self['First name'] != us['First Name'] ||
    self['Last name'] != us['Last Name']
  end
end