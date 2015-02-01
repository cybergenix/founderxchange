class PostingsController < ApplicationController
  before_action :set_posting, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @postings = Posting.all
    respond_with(@postings)
  end

  def show
    respond_with(@posting)
  end

  def new
    @posting = Posting.new
    respond_with(@posting)
  end

  def edit
  end

  def create
    @posting = Posting.new(posting_params)
    @posting.save
    respond_with(@posting)
  end

  def update
    @posting.update(posting_params)
    respond_with(@posting)
  end

  def destroy
    @posting.destroy
    respond_with(@posting)
  end

  private
    def set_posting
      @posting = Posting.find(params[:id])
    end

    def posting_params
      params.require(:posting).permit(:job_type, :title, :compensation, :location, :pitch)
    end
end
