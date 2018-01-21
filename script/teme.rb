load 'script/usms.rb'

Swimmer.upd

Pluot.api_key = 'uksbt8yddgcr0fyr5u24ndn292m6fg'
Pluot.account_id = '63478'

Swimmer.where.not(usms_2018: '').
 where{usms_reg.gt 2.days.ago}.each do |swimmer|
  p swimmer.name

  attrs = swimmer.attributes.select{|k,v|%w(usms_id usms_2018 usms_reg).include? k}
  Pluot.contacts.upd(swimmer['User ID'], attrs)
end

Swimmer.roster