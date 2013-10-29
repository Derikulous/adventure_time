class ReportCardsController < ApplicationController
  before_action :set_report_card, only: [:show, :edit, :update, :destroy]

  # GET /report_cards
  # GET /report_cards.json
  def index
    @report_cards = ReportCard.all
  end

  # GET /report_cards/1
  # GET /report_cards/1.json
  def show
  end

  # GET /report_cards/new
  def new
    @report_card = ReportCard.new
  end

  # GET /report_cards/1/edit
  def edit
  end

  # POST /report_cards
  # POST /report_cards.json
  def create
    @report_card = ReportCard.new(report_card_params)

    respond_to do |format|
      if @report_card.save
        format.html { redirect_to @report_card, notice: 'Report card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @report_card }
      else
        format.html { render action: 'new' }
        format.json { render json: @report_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_cards/1
  # PATCH/PUT /report_cards/1.json
  def update
    respond_to do |format|
      if @report_card.update(report_card_params)
        format.html { redirect_to @report_card, notice: 'Report card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @report_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_cards/1
  # DELETE /report_cards/1.json
  def destroy
    @report_card.destroy
    respond_to do |format|
      format.html { redirect_to report_cards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_card
      @report_card = ReportCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_card_params
      params.require(:report_card).permit(:test_id, :user_id, :grade, :name, :finished, :current_question)
    end
end
