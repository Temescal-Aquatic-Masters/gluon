# Looking up individual members if they aren't registered with TEME

# user_url = http://www.usms.org/reg/members/?FirstName=Vince&LastName=Nibler&LMSCAbbr=

# browser = Watir::Browser.new
# browser.goto(user_url)


# The long way there
# browser.text_field(name: 'FirstName').set 'Vince'
# browser.text_field(name: 'LastName').set 'Nibler'
# browser.button(type: 'submit', value: 'Search Members').click



# return

# TEME list
year = Date.current.year
usms_url = "http://www.usms.org/reg/members/club.php?ClubAbbr=TEME&RegYear=#{year}"
file = "/Users/vince/Downloads/USMSMembers_#{year}.csv"

File.delete(file) if File.exists?(file)

browser = Watir::Browser.new
browser.goto(usms_url)
browser.div(text: 'CSV').click
sleep 5

while File.exists?("#{file}.crdownload") do
  sleep 5
  puts '.'
end

browser.close

csv_text = File.read(file)
csv = CSV.parse(csv_text, headers: true)
csv.select{|row| Date.parse(row['Reg. Date']) > 7.days.ago}.each do |row|
  Usms.update(row)
  p row.to_hash
end

#File.delete(file) if File.exists?(file)
