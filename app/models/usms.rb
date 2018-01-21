class Usms < ActiveRecord::Base
  self.table_name = 'usms'
  attr_accessible :usms_reg, :usms_id, :"First Name", :"MI", :"Last Name", :"WO Group", :"USMS Number", :"Reg. Date"


  belongs_to :swimmer, primary_key: :usms_id, foreign_key: :usms_id

  def name
    [self['First Name'],self['Last Name']].reject(&:blank?).join(' ')
  end

  def self.defaults
    all.each do |swimmer|
      swimmer.defaults
    end
  end

  def defaults
    update_attribute(:usms_reg, Date.parse(self['Reg. Date']))
    update_attribute(:usms_id, self['USMS Number'][5..-1].upcase)
  end

  def self.update(row)
    us = Usms.where('USMS Number': row['USMS Number']).first
    if !us
      us = Usms.create(row.to_hash)
      us.defaults
    end
  end

  def self.match
    to_match = where(year: 2018).select do |us|
      us.swimmer.nil?
    end
    to_match.each do |us|
      swimmer = Swimmer.where('First name': us['First Name'], 'Last name': us['Last Name']).first
      # update swimmer if matched
    end
  end
end