require 'date'
require 'csv'

accounts = (2000_0000_000...2000_1000_000).lazy
names    = ("aaaaa".."zzzzz").lazy
balances = (1..9999).lazy.to_a
begin
(Date.new(2013, 03, 01)..Date.today).each do |date|
  balance = balances.shuffle
  folder = date.strftime("%d-%m-%Y")
  names.rewind
  CSV.open("#{folder}.csv", "w") do |f|
    accounts.each do |acc|
      f << [acc, names.next, balance.sample]
    end
  end
end

rescue Exception => e
  puts e.message
end

