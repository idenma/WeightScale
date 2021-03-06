class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]

  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1
  # GET /tables/1.json
  def show



    dbNames = ["weight","bmi","fat","moisture","muscle","bone","metabolism","visceral_fat"]

     tables = Table.where(user_id: @current_user.id)
     @count = tables.length


    #
    # @compiledTables = {name: "weight", data:tables.weight}
    # @compiledTables.store(name: "bmi", data:tables.bmi)
    # @compiledTables.store(name: "fat", data:tables.fat)
    # @compiledTables.store(name: "moisture", data:tables.moisture)
    # @compiledTables.store(name: "muscle", data:tables.muscle)
    # @compiledTables.store(name: "bone", data:tables.bone)
    # @compiledTables.store(name: "metabolism", data:tables.metabolism)
    # @compiledTables.store(name: "visceral_fat", data:tables.visceral_fat)
    # @compiledTables.store(name: "weight", data:tables.weight)
    #


    dateNotation = "%Y/%m/%d"
    @weight = []

    @bmi = []
    @fat = []
    @moisture = []
    @muscle = []
    @bone = []
    @metabolism = []
    @visceral_fat = []

    @tables = Table.where(user_id: @current_user.id)
    @count = @tables.length
    @tables.each do |table|
        @weight.push([table.created_at.strftime(dateNotation),table.weight])
        @bmi.push([table.created_at.strftime(dateNotation),table.bmi])
        @fat.push([table.created_at.strftime(dateNotation),table.fat])
        @moisture.push([table.created_at.strftime(dateNotation),table.moisture])
        @muscle.push([table.created_at.strftime(dateNotation),table.muscle])
        @bone.push([table.created_at.strftime(dateNotation),table.bone])
        @metabolism.push([table.created_at.strftime(dateNotation),table.metabolism])
        @visceral_fat.push([table.created_at.strftime(dateNotation),table.visceral_fat])
    end
    @weight
  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit
    @table =Table.find(params[:id])
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)
    respond_to do |format|
      if @table.save
        format.html { redirect_to @table, notice: 'Table was successfully created.' }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    @table = Table.find(params[:id])
    respond_to do |format|
      if @table.update_attributes(table_params)
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url, notice: 'Table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
    @tables = Table.where(user_id: current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def table_params
      params.require(:table).permit(:weight, :bmi, :fat, :moisture, :muscle, :bone, :metabolism, :visceral_fat, :created_at, :user_id)
    end
end
