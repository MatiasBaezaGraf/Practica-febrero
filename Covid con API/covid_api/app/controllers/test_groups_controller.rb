class TestGroupsController < ApplicationController
  before_action :set_test_group, only: [:show, :update, :destroy]

  # GET /test_groups
  def index
    @test_groups = TestGroup.all

    render json: @test_groups
  end

  # GET /test_groups/1
  def show
    render json: @test_group
  end

  # POST /test_groups
  def create
    @test_group = TestGroup.new(test_group_params)

    if @test_group.save
      render json: @test_group, status: :created, location: @test_group
    else
      render json: @test_group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /test_groups/1
  def update
    if @test_group.update(test_group_params)
      render json: @test_group
    else
      render json: @test_group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /test_groups/1
  def destroy
    @test_group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_group
      @test_group = TestGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_group_params
      params.require(:test_group).permit(:name, :max_applicants, :drug_id)
    end
end
