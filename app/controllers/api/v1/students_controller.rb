module Api
    module V1
        class StudentsController < ApplicationController
            def index

            # @students = Student.all
            # render json: @students
                    # or
            render json: Student.all
        
            end
        
            def show
            
                # @student = Student.find(params[:id])
                render json: Student.find(params[:id])

            end

            def create

                @student = Student.new(student_params)
            
                if @student.save
            
                render json: @student, status: :created
            
                else
            
                render json: @student.errors, status: :unprocessable_entity
            
                end
            
            end
            def update

                @student = Student.find(params[:id])
            
                if @student.update(student_params)
            
                head :no_content
            
                else
            
                render json: @student.errors, status: :unprocessable_entity
            
                end
            
            end
            def destroy

                @student = Student.find(params[:id])
            
                if @student.destroy
            
                head :no_content
            
                else
            
                render json: @student.errors, status: :unprocessable_entity
            
                end
            
            end
            private
            def student_params

                params.permit(:studentname, :section)

            end
        end
    end
end