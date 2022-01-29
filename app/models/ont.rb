class Ont < ApplicationRecord

    def self.addOnuInTable(c,t)
        ont=0
        number = Ont.find_by_sql("SELECT count FROM onts WHERE team =  '#{t}'" )
        number.each do |num|
        ont+=num.count
    end

allOnt=0
adminNumber = Ont.find_by_sql("SELECT count FROM onts WHERE team =  'admin@ukr.net'" )
adminNumber.each do |num|
allOnt+=num.count
end
if t!='admin@ukr.net'
allOnt = allOnt.to_i-c.to_i
end
countNew = c.to_i + ont.to_i


Ont.find_by_sql(
"UPDATE `onts` SET count = #{allOnt}  WHERE team = 'admin@ukr.net' ;"
)

Ont.find_by_sql(
"UPDATE `onts` SET count = #{countNew}  WHERE team = '#{t}' ;"
)


end

def self.closeWork(t)

ont=0
number = Ont.find_by_sql("SELECT count FROM onts WHERE team =  '#{t}'" )
number.each do |num|
ont+=num.count
end

countNew = ont.to_i - 1

Ont.find_by_sql(
"UPDATE `onts` SET count = #{countNew}  WHERE team = '#{t}' ;"
)


end

end
