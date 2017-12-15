class GnvlsController < ApplicationController
  before_action :set_gnvl, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /gnvls
  # GET /gnvls.json
  def index
    @gnvls = Gnvl.limit(50).order('name asc')
  end

  # GET /gnvls/1
  # GET /gnvls/1.json
  def show
  end

  def search
    @par = params[:gnvls_name].to_s
    @gnvls = Gnvl.where(' similarity(name,?)>0.3',@par)
    
  end

  def searching
     #params.require(:gnvl).permit(:str)
     @res = "ALL Right"
     @par = params[:str].to_s
     #@res = Gnvl.where(" to_tsvector('russian',name) @@ to_tsquery('russian',?)",@par).limit(10)
     #if not @res.exists?
    #    @res = Gnvl.where(' similarity(name,?)>0.1',@par).limit(10)
     #end
     @res = Gnvl.connection.select_all('select id,name,owner,qntpack, similarity(name,\''+@par+'\')  as range from gnvls group by id,name,owner,qntpack having similarity(name,\''+@par+'\')>0.2 order by range desc limit 10')

     res=[]
     buf={}
     @res.each do |prod|
       buf={}
       buf[:id] = prod["id"]
       buf[:name] = prod["name"]
       buf[:owner] = prod["owner"]
       buf[:qntpack] = prod["qntpack"]
       res.push(buf)
     end

     render json: res
  end

  # GET /gnvls/new
  def new
    @gnvl = Gnvl.new
  end

  # GET /gnvls/1/edit
  def edit
  end

  # POST /gnvls
  # POST /gnvls.json
  def create
    @gnvl = Gnvl.new(gnvl_params)

    respond_to do |format|
      if @gnvl.save
        format.html { redirect_to @gnvl, notice: 'Gnvl was successfully created.' }
        format.json { render :show, status: :created, location: @gnvl }
      else
        format.html { render :new }
        format.json { render json: @gnvl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gnvls/1
  # PATCH/PUT /gnvls/1.json
  def update
    respond_to do |format|
      if @gnvl.update(gnvl_params)
        format.html { redirect_to @gnvl, notice: 'Gnvl was successfully updated.' }
        format.json { render :show, status: :ok, location: @gnvl }
      else
        format.html { render :edit }
        format.json { render json: @gnvl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gnvls/1
  # DELETE /gnvls/1.json
  def destroy
    @gnvl.destroy
    respond_to do |format|
      format.html { redirect_to gnvls_url, notice: 'Gnvl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gnvl
      @gnvl = Gnvl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gnvl_params
      params.require(:gnvl).permit(:gnvls_name,:mnn, :name, :lekform, :owner, :qntpack, :prc_wo_nds, :prc_first_pack, :n_py, :date_reg, :ean13, :atx, :level_nac_opt, :pred_opt_price, :level_nac_rozn, :pred_rozn_price)
    end
end
