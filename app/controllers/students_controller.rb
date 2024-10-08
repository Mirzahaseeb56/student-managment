class StudentsController < ApplicationController

    def index
     @students=Student.all
    end

    def new
     @student=Student.new

    end 
    
    def create 
        @student=Student.new(student_params)
        if @student.save 
            flash[:notice]="student created successfully"
            redirect_to students_path
        else
            flash[:alert] = "There was an error creating the student."
            render :new
        end
    end


    def edit
    @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        if @student.update(student_params)
            flash[:notice]='student updated successfully'
            redirect_to students_path
        else 
         flash[:notice]='something wrong'
         render :edit
        end
    end
    def destroy
        @student = Student.find(params[:id]) 
        if @student.destroy
            flash[:notice]= 'student remove successfully'
        else 
            flash[:notice]= 'something  wrong'
        end
    end
    private
    def student_params
        params.require(:student).permit(:firstname, :lastname, :email)
    end
end
