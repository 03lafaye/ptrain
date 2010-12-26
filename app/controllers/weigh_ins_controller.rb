class WeighInsController < ApplicationController
  # GET /weigh_ins
  # GET /weigh_ins.xml
  def index
    @weigh_ins = WeighIn.paginate :page => params[:page],
        :order => 'end_date desc'

    latest = WeighIn.find(:first, :order => 'end_date desc')

    @current_stats = {
      :weight => latest.weight,
      :bodyfat => latest.abf * 100,
      :waist => latest.waist,
      :vertical => 27 # TODO: Add vertical to the weigh_ins table.
    }

    @goal_stats = { # TODO: Create the goals MVC.
      :weight => 170,
      :bodyfat => 6.0,
      :waist => 29,
      :vertical => 35
    }

    @quote = Quote.find(:first)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @weigh_ins }
    end
  end

  # GET /weigh_ins/1
  # GET /weigh_ins/1.xml
  def show
    redirect_to :action => 'index'
  end

  # GET /weigh_ins/new
  # GET /weigh_ins/new.xml
  def new
    @weigh_in = WeighIn.new(:user_id => @current_user_id)

    # training period begins on the date of last weigh in
    last = @weigh_in.get_last_weigh_in
    @weigh_in.start_date = last.end_date if last

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @weigh_in }
    end
  end

  # GET /weigh_ins/1/edit
  def edit
    @weigh_in = WeighIn.find(params[:id])
  end

  # POST /weigh_ins
  # POST /weigh_ins.xml
  def create
    @weigh_in = WeighIn.new(params[:weigh_in])

    respond_to do |format|
      if @weigh_in.save
        format.html { redirect_to(@weigh_in, :notice => 'Weigh in was successfully created.') }
        format.xml  { render :xml => @weigh_in, :status => :created, :location => @weigh_in }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @weigh_in.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /weigh_ins/1
  # PUT /weigh_ins/1.xml
  def update
    @weigh_in = WeighIn.find(params[:id])

    respond_to do |format|
      if @weigh_in.update_attributes(params[:weigh_in])
        format.html { redirect_to(@weigh_in, :notice => 'Weigh in was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @weigh_in.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /weigh_ins/1
  # DELETE /weigh_ins/1.xml
  def destroy
    @weigh_in = WeighIn.find(params[:id])
    @weigh_in.destroy

    respond_to do |format|
      format.html { redirect_to(weigh_ins_url) }
      format.xml  { head :ok }
    end
  end
end
