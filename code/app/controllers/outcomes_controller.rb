class OutcomesController < ApplicationController
  # GET /outcomes
  # GET /outcomes.xml
  def index
    @outcomes = Outcome.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @outcomes }
    end
  end


  def update_subcategories
    @category_id = params['category_id']
    @to_model = "outcome"
    
    render :update do |page|
      page.replace_html "subcategory", :partial => 'subcategory_select', 
        :locals => { :category_id => @category_id, :to_model => @to_model }
        
    end
  end

  # GET /outcomes/1
  # GET /outcomes/1.xml
  def show
    @outcome = Outcome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @outcome }
    end
  end

  # GET /outcomes/new
  # GET /outcomes/new.xml
  def new
    @outcome = Outcome.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @outcome }
    end
  end

  # GET /outcomes/1/edit
  def edit
    @outcome = Outcome.find(params[:id])
  end

  # POST /outcomes
  # POST /outcomes.xml
  def create
    @outcome = Outcome.new(params[:outcome])

    respond_to do |format|
      if @outcome.save
        flash[:notice] = 'Outcome was successfully created.'
        format.html { redirect_to(@outcome) }
        format.xml  { render :xml => @outcome, :status => :created, :location => @outcome }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @outcome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /outcomes/1
  # PUT /outcomes/1.xml
  def update
    @outcome = Outcome.find(params[:id])

    respond_to do |format|
      if @outcome.update_attributes(params[:outcome])
        flash[:notice] = 'Outcome was successfully updated.'
        format.html { redirect_to(@outcome) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @outcome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /outcomes/1
  # DELETE /outcomes/1.xml
  def destroy
    @outcome = Outcome.find(params[:id])
    @outcome.destroy

    respond_to do |format|
      format.html { redirect_to(outcomes_url) }
      format.xml  { head :ok }
    end
  end
end
