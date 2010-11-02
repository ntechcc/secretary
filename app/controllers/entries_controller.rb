class EntriesController < ApplicationController
  
  
    def search
    @entry = Entry.new
    #@q = request.raw_post
    q = request.raw_post.split(/&/)
    #@q = @q.html_safe

    # optionally handle the query however you'd like

    # fetch some results from a database
    #@results = Entry.find(:all, 
    #	:conditions => [ "pointer LIKE ?", "%" + @q +"%"])
    #@results = Entry.limit(5)
    #@results =  Entry.where(:pointer => "Ryan O'Neal")
    #@results = Entry.find_by_sql("SELECT * FROM entries where id = '2'")
    a1 = "%"
    a2 = "%"
    @q = q[0]
    @q = a1 + @q + a2
    #@qfield = q[0]
    #@qtoken = q[1]
    @results = Entry.find(:all, :conditions => [ "Pointer LIKE ?", @q]) 
  end

  
  
  # GET /entries
  # GET /entries.xml
  def index
    @entries = Entry.all
    @entry = Entry.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.xml
  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        #format.html { redirect_to(@entry, :notice => 'Entry was successfully created.') }
	format.html { redirect_to(entries_url) }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to(entries_url, :notice => 'Entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.xml  { head :ok }
    end
  end
end
