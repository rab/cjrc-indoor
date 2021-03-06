class EventsController < ApplicationController

  def seed
    @seeds = Event.seed_all

    @races = Race.all.to_a

    @seeds.each do |group,flights|
      group

      flights.each.with_index(1) do |flight, number|
        "#{number.ordinalize} Flight"

        race = @races.shift

        flight.each.each.with_index(1) do |rower, erg|
          race.assignments.create({ entry_id: rower && rower.id,
                                    erg: erg,
                                  })
        end

        race_file = RaceFile.new(race)
        race_file.to_file
      end
    end

  end

  # GET /events
  # GET /events.json
  def index
    # @events = Event.joins('LEFT OUTER JOIN entries ON entries.event_id = events.id').
    #   select('events.*, count(entries.id) AS entries_count').group('events.id').order('number, name').all
    @events = Event.includes(:entries).order('number, name').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: "Event #{@event} was successfully created." }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
end
