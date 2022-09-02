class Admin::NewsController < Admin::BaseController
  before_action :set_news, only: %i[edit update destroy]

  def index
    @news = News.order(created_at: :desc)
  end

  def new
    @admin_news = News.new
  end

  def edit; end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to admin_news_index_path, success: t('defaults.message.created', item: News.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @admin_news.update(news_params)
      redirect_to admin_news_index_path, success: t('defaults.message.updated', item: News.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: News.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @admin_news.destroy!
    redirect_to admin_news_index_path, success: t('defaults.message.deleted', item: News.model_name.human), status: :see_other
  end

  private

  def set_news
    @admin_news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :note_url)
  end
end
