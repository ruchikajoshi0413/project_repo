class StudentsController < InheritedResources::Base

  private

    def student_params
      params.require(:student).permit(:studentname, :section)
    end

end
