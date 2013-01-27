class RaceFile
  attr_reader :race
  def initialize(race)
    @race = race
  end

  def to_file(filename=nil)
    filename ||= "Race %02d_%.16s.rac"%[race.position, race.group]
    
    File.open(filename, 'wb') do |f|
      f.write "RACE\r\012"      # file type signature; must be first line of file
      f.write "108\r\012"       # file format ver 108 including class.
      f.write "#{race.boat_type}\r\012" # team configuration (singles=0, doubles=1, fours=2, eights=3)
      f.write "#{race}\r\012" # race name; 16 characters max; see note 1
      f.write "2000\r\012"      # race duration in meters or seconds (see duration type next)
      f.write "0\r\012"         # duration type (distance=0, time=1)
      f.write "0\r\012"         # always zero
      f.write "0\r\012"         # enable stroke data (true=1, false=0)
      f.write "500\r\012"       # splits distance in meters
      f.write "120\r\012"       # splits time seconds
      f.write "#{race.boats}\r\012" # actual # of boats in this race (2-40)
      race.entries.each do |rower|
        f.write "#{rower.name}\r\012" # participant name; ~12 char visible; see note 2
        f.write "#{rower.id}\r\012"   # identifier (bib number)
        f.write "#{nil}\r\012" # class; see note 3; "Event" 4, "Flight" 1 => E4F1
        f.write "USA\r\012" # country code; or {ENG SPA FRE GER ITL DUT SWD DAN FII POR CHI}
        f.write "#{rower.dob && rower.dob.strftime('%d%m%Y')}\r\012" # birthdate; ddmmyyyy (optional)
      end
      f.write "0\r\012"         # EOF
    end
  end
end
