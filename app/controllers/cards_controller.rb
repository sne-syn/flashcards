class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = CreateCardService.call(card_params)
    p card_params

    if @card.errors.empty?
      redirect_to cards_path, notice: t('flash.success_create_message')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path, notice: t('flash.success_update_message')
    else
      render :edit
    end
  end

  def destroy
    @card.destroy

    redirect_to cards_path, notice: t('flash.success_delete_message')
  end

  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
end
