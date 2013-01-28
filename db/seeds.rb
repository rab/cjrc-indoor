# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Race.create([
             { position:  1, start_at: '2013-02-03 08:20 -0500' },
             { position:  2, start_at: '2013-02-03 08:28 -0500' },
             { position:  3, start_at: '2013-02-03 08:36 -0500' },
             { position:  4, start_at: '2013-02-03 08:44 -0500' },
             { position:  5, start_at: '2013-02-03 08:52 -0500' },
             { position:  6, start_at: '2013-02-03 09:00 -0500' },
             { position:  7, start_at: '2013-02-03 09:08 -0500' },
             { position:  8, start_at: '2013-02-03 09:16 -0500' },
             { position:  9, start_at: '2013-02-03 09:24 -0500' },
             { position: 10, start_at: '2013-02-03 09:32 -0500' },
             { position: 11, start_at: '2013-02-03 09:40 -0500' },
             { position: 12, start_at: '2013-02-03 09:48 -0500' },
             { position: 13, start_at: '2013-02-03 09:56 -0500' },
             { position: 14, start_at: '2013-02-03 10:04 -0500' },
             { position: 15, start_at: '2013-02-03 10:12 -0500' },
             { position: 16, start_at: '2013-02-03 10:20 -0500' },
             { position: 17, start_at: '2013-02-03 10:28 -0500' },
             { position: 18, start_at: '2013-02-03 10:36 -0500' },
             { position: 19, start_at: '2013-02-03 10:44 -0500' },
             { position: 20, start_at: '2013-02-03 10:52 -0500' },
             { position: 21, start_at: '2013-02-03 11:10 -0500' },
             { position: 22, start_at: '2013-02-03 11:18 -0500' },
             { position: 23, start_at: '2013-02-03 11:26 -0500' },
             { position: 24, start_at: '2013-02-03 11:39 -0500' },
             { position: 25, start_at: '2013-02-03 11:47 -0500' },
             { position: 26, start_at: '2013-02-03 11:55 -0500' },
             { position: 27, start_at: '2013-02-03 12:03 -0500' },
             { position: 28, start_at: '2013-02-03 12:11 -0500' },
             { position: 29, start_at: '2013-02-03 13:19 -0500' },
             { position: 30, start_at: '2013-02-03 13:11 -0500' },
             { position: 31, start_at: '2013-02-03 13:35 -0500' },
             { position: 32, start_at: '2013-02-03 13:47 -0500' },
             { position: 33, start_at: '2013-02-03 14:11 -0500' },
             { position: 34, start_at: '2013-02-03 14:03 -0500' },
             { position: 35, start_at: '2013-02-03 14:27 -0500' },
             # { position: 36, start_at: '2013-02-03 13:56 -0500' },
             # { position: 37, start_at: '2013-02-03 14:00 -0500' },
             # { position: 38, start_at: '2013-02-03 14:04 -0500' },
             # { position: 39, start_at: '2013-02-03 14:08 -0500' },
             # { position: 40, start_at: '2013-02-03 14:12 -0500' },
            ])
Event.create([
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

              {number: 20, name: "Open Fun Row",               group: 'Open Fun Row'},  # 500m
              {number: 21, name: "High School Fours",          group: 'HS Fours'},      # 500m
              {number: 22, name: "College Fours",              group: 'College Fours'}, # 500m
             ])
