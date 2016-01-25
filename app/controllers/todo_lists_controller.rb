class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
  before_action :hello_stephen, only: [:create, :delete, :show, :edit, :update, :destroy]

# READ REST == GET (SERVE ME A HTML PAGE)
  def index
    @todo_lists = TodoList.all
  end

# READ REST == GET (SERVE ME A HTML PAGE)
  def show
  end

# READ REST == GET (SERVE ME A HTML PAGE)
  def new
    @todo_list = TodoList.new
  end

# READ REST == GET (SERVE ME A HTML PAGE)
  def edit
    # nothing here?
    # Before editing call the set_todo_list method at the bottom of the page
    # def set_todo_list
    #   @todo_list = TodoList.find(params[:id])
    # end
    # because of the following at the top od the page
    # before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
  end

# CREATE REST == POST (SEND ME DATA)
  def create
    @todo_list = TodoList.new(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully created.' }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

# UPDATE  REST == PUT (SEND ME DATA)
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE REST == DELETE (REMOVE ENTRY)
  def destroy
    a
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end

    def hello_stephen
      p "stephen says hi"
    end
end


