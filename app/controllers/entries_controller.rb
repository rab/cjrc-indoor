require 'csv'

class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.order('event_id, score').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new(dob: Date.new(Date.today.year - 18, 1, 1))
    get_events

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
    get_events
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to new_entry_path, notice: "Entry #{@entry} was successfully created." }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { get_events
                      render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find_by_id(params[:id])
    @entry.destroy if @entry

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :ok }
    end
  end

  # POST /entries/import
  def import
    logger.unknown { params.inspect }
    #headings:
    # registered_at,full_name,address,phone,email,score,affiliation,event,lightweight,age,responsible_party,,,waiver_text,registered_on
    csv = params[:data]
    this_year = Date.today.year
    counts = { good: 0, bad: 0 }
    CSV.parse(csv.read, headers: true) do |row|
      attrs = row.to_hash
      event_name = attrs.delete('event')
      full_name = attrs.delete('full_name')
      event = Event.find_by_name event_name
      entry = Entry.new(attrs.select{|k,v| %w[ registered_at address phone email score affiliation
                                               event age responsible_party ].include?(k) }) {|_|
        unless _.score.blank? || (match_data = /(?:(\d+):)?(\d+):(\d+)(?:\.(\d+))?/.match(_.score)).nil?
          hours, minutes, seconds, tenths = match_data.captures
          minutes, seconds, tenths = hours, minutes, seconds if hours.to_i.nonzero?
          _.score = "%2d:%02d.%1d"%[minutes.to_s.to_i(10), seconds.to_s.to_i(10), tenths.to_s.to_i(10)]
        end
        _.first_name, _.last_name = full_name.split
        _.event_id = event.id if event
        _.dob ||= Date.new(this_year - _.age, 1, 1) if _.age.to_i.nonzero?
        _.lightweight = case attrs['lightweight']
                        when /^n/i, 0, '0', false, nil, ''
                          false
                        when /^y/i, 1, '1', true
                          true
                        end
      }
      if entry.save
        counts[:good] += 1
      else
        counts[:bad]  += 1
        logger.error { "Failed: #{entry.errors.full_messages.to_sentence}\n  #{row.inspect}" }
      end
    end
    flash[:notice] = "#{counts[:good]} #{counts[:good] == 1 ? 'entry' : 'entries'} created" if counts[:good].nonzero?
    flash[:error]  = "#{counts[:bad]} #{counts[:bad] == 1 ? 'entry' : 'entries'} had errors" if counts[:bad].nonzero?
    redirect_to entries_path
  end

  private

  def get_events
    @events = Event.as_options
  end
end
