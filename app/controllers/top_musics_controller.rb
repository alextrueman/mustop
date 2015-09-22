class TopMusicsController < ApplicationController
  before_action :set_top_music, only: [:show, :edit, :update, :destroy]

  # GET /top_musics
  # GET /top_musics.json
  def index
    @top_musics = TopMusic.all
  end

  # GET /top_musics/1
  # GET /top_musics/1.json
  def show
  end

  # GET /top_musics/new
  def new
    @top_music = TopMusic.new
  end

  # GET /top_musics/1/edit
  def edit
  end

  # POST /top_musics
  # POST /top_musics.json
  def create
    @top_music = TopMusic.new(top_music_params)

    respond_to do |format|
      if @top_music.save
        format.html { redirect_to @top_music, notice: 'Top music was successfully created.' }
        format.json { render :show, status: :created, location: @top_music }
      else
        format.html { render :new }
        format.json { render json: @top_music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /top_musics/1
  # PATCH/PUT /top_musics/1.json
  def update
    respond_to do |format|
      if @top_music.update(top_music_params)
        format.html { redirect_to @top_music, notice: 'Top music was successfully updated.' }
        format.json { render :show, status: :ok, location: @top_music }
      else
        format.html { render :edit }
        format.json { render json: @top_music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /top_musics/1
  # DELETE /top_musics/1.json
  def destroy
    @top_music.destroy
    respond_to do |format|
      format.html { redirect_to top_musics_url, notice: 'Top music was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top_music
      @top_music = TopMusic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top_music_params
      params.require(:top_music).permit(:name, :picture, :title)
    end
end
