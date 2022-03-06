class ReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def create
    @report = current_user.reports.new(report_params)

    if @report.save
      redirect_to @report
    else
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])

    if @report.update(report_params)
      redirect_to @report
    else
      render :edit
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    redirect_to root_path
  end

  private
  def report_params
    params.require(:report).permit(:title, :description, :grade)
  end
end
