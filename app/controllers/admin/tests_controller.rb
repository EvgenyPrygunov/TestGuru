class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = current_user.author_tests.build
  end

  def edit; end

  def create
    @test = current_user.author_tests.build(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('admin.tests.create.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: t('admin.tests.update.success')
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

end
