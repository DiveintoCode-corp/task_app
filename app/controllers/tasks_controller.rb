class TasksController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_task, only: [:show, :edit, :update, :destroy, :assign]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end
  
  def mine
    @tasks = current_user.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    if @task.charge_id != current_user.id
      redirect_to tasks_url, alert: "タスクを編集できません"
    end
  end
  
  def assign
    @task = Task.find(params[:id])
    if @task.charge_id != current_user.id
      redirect_to tasks_url, alert: "タスクを編集できません"
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.auther_id = current_user.id
    @task.charge_id = current_user.id
    
    if @task.save
      redirect_to @task, notice: 'タスクが作成されました'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
     @task = Task.find(params[:id])
    if @task.charge_id != current_user.id
      redirect_to tasks_url, alert: "タスクを編集できません"
    end
    
    if @task.update(task_params)
      redirect_to @task, notice: 'タスクが更新されました'
    else
      render :edit
    end
  end
  
  def assign_update
    @task = Task.find(params[:id])
    if @task.charge_id != current_user.id
      redirect_to tasks_url, alert: "タスクを編集できません"
    end
    
    if @task.update(charge_id: params[:task][:charge_id])
      redirect_to @task, notice: 'タスクが新しくアサインされました'
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
     @task = Task.find(params[:id])
    if @task.charge_id != current_user.id
      redirect_to tasks_url, alert: "タスクを編集できません"
    end
    
    @task.destroy
    redirect_to tasks_url, notice: 'タスクが削除されました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :content, :deadline, :status)
    end
end
