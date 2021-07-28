class List < ApplicationRecord

def self.changeStatusWork(l)

List.find_by_sql("UPDATE `lists` SET status = 'Виконано' WHERE id = #{l.id};")

end

def self.filterItems(p)
scope :filter_by_team, -> {where( "team = ?", p[:team])}
scope :filter_by_status, -> {where( "status = ?", p[:status])}
scope :filter_by_works, -> {where( "works = ?", p[:works])}
List.filter_by_team.filter_by_status.filter_by_works
end

def self.search(params)
 where("LOWER(team) LIKE ? OR LOWER(tel) LIKE ?  OR LOWER(status) LIKE ?  OR LOWER(works) LIKE ?  OR LOWER(descr) LIKE ?", "%#{params}%","%#{params}%","%#{params}%","%#{params}%","%#{params}%")
end


end
