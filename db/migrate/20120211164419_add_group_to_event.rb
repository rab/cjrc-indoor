class AddGroupToEvent < ActiveRecord::Migration
  class Event < ActiveRecord::Base; end
  def down
    remove_column :events, :group
  end
  def up
    add_column :events, :group, :string
    Event.reset_column_information
    say_with_time 'Update Events with group' do
      [
       {number:  1, name: "Novice High School Boys",    group: 'Novice Male'},
       {number:  1, name: "Novice High School Men",     group: 'Novice Male'},
       {number:  2, name: "Novice High School Girls",   group: 'Novice Female'},
       {number:  2, name: "Novice High School Women",   group: 'Novice Female'},
       {number:  3, name: "Masters Men (age 30-39)",    group: 'Open Male'},
       {number:  4, name: "Masters Women (age 30-39)",  group: 'Open Female'},
       {number:  5, name: "Senior Men (age 40-49)",     group: 'Open Male'},
       {number:  6, name: "Senior Women (age 40-49)",   group: 'Open Female'},
       {number:  7, name: "Veteran Men (age 50+)",      group: 'Open Male'},
       {number:  8, name: "Veteran Women (age 50+)",    group: 'Open Female'},
       {number:  9, name: "Open Men",                   group: 'Open Male'},
       {number: 10, name: "Open Women",                 group: 'Open Female'},
       {number: 11, name: "High School Varsity Boys",   group: 'Varsity Male'},
       {number: 11, name: "High School Varsity Men",    group: 'Varsity Male'},
       {number: 12, name: "High School Varsity Girls",  group: 'Varsity Female'},
       {number: 12, name: "High School Varsity Women",  group: 'Varsity Female'},
       {number: 13, name: "College Coxswain Men",       group: 'Coxswain Male'},
       {number: 13, name: "High School Coxswain Boys",  group: 'Coxswain Male'},
       {number: 14, name: "College Coxswain Women",     group: 'Coxswain Female'},
       {number: 14, name: "High School Coxswain Girls", group: 'Coxswain Female'},
       {number: 15, name: "Jrow Boys",                  group: 'Jrow'},
       {number: 15, name: "Jrow Girls",                 group: 'Jrow'},
       {number: 16, name: "Novice College Men",         group: 'College Novice Male'},
       {number: 17, name: "Novice College Women",       group: 'College Novice Female'},
       {number: 18, name: "College Men",                group: 'College Male'},
       {number: 19, name: "College Women",              group: 'College Female'},
      ].each do |hsh|
        if (e = Event.find_by_number_and_name(hsh[:number], hsh[:name]))
          e.update_attribute(:group, hsh[:group])
        end
      end
    end
  end
end
