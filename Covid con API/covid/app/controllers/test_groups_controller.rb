class TestGroupsController < ApplicationController
  before_action :set_test_group, only: %w[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /test_groups
  # GET /test_groups.json
  def index
    @test_groups = TestGroup.all
  end

  # GET /test_groups/1
  # GET /test_groups/1.json
  def show
    @patients = Patient.all
  end

  # GET /test_groups/new
  def new
    @test_group = TestGroup.new
  end

  # GET /test_groups/1/edit
  def edit
  end

  # POST /test_groups
  # POST /test_groups.json
  def create
    @test_group = TestGroup.new(test_group_params)

    respond_to do |format|
      if @test_group.save
        format.html { redirect_to @test_group, notice: "Test group was successfully created." }
        format.json { render :show, status: :created, location: @test_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_groups/1
  # PATCH/PUT /test_groups/1.json
  def update
    respond_to do |format|
      if @test_group.update(test_group_params)
        format.html { redirect_to @test_group, notice: "Test group was successfully updated." }
        format.json { render :show, status: :ok, location: @test_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_groups/1
  # DELETE /test_groups/1.json
  def destroy
    x = 0
    for c in Patient.all
      if c.test_group == @test_group
        x = x + 1
      end
    end

    if x == 0
      @test_group.destroy
      respond_to do |format|
        format.html { redirect_to test_groups_url, notice: "Test group was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to test_groups_url, notice: "Test group was not destroyed because has patients assigned." }
        format.json { head :no_content }
      end
    end
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
