require 'date'
require 'mongo'
require 'uri'

accounts = (2000_0000_000...2000_1000_000).lazy
names    = ("aaaaa".."zzzzz").lazy
balances = (1..9999).lazy.to_a

begin
(Date.new(2013, 03, 01)..Date.today).each do |date|
  @balance = balances.shuffle
  @folder = date.strftime("%d-%m-%Y")
  names.rewind

  accounts.each do |acc|
    @hash = {:account => acc, :name => names.next, :balance => @balance.sample}

  end
end

rescue Exception => e
  puts e.message
end

