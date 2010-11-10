# coding: utf-8
class FeedbacksController < ApplicationController
  # GET /feedbacks
  def index
    @feedbacks = Feedback.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /feedbacks/1
  def show
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /feedbacks/1/edit
  def edit
    @feedback = Feedback.find(params[:id])
  end

  # POST /feedbacks
  def create
    @feedback = Feedback.new(params[:feedback])

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to(new_feedback_path, :notice => '留言成功.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /feedbacks/1
  def update
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      if @feedback.update_attributes(params[:feedback])
        format.html { redirect_to(@feedback, :notice => 'Feedback was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /feedbacks/1
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to(feedbacks_url) }
    end
  end
end
