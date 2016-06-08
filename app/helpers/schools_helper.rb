module SchoolsHelper
	#This action makes use of if - else blocks to find the fees it would take to send two kids to school
	#There's a lot of if else blocks, and there has to be a way to shorten the length of code later in the future
	#If the no of kids increase,shit's going to get crazy as it is
	def calculate_all_fees
		@school = School.find_by(id: params[:id])
    @first_child_class = params[:class_id]
    @second_child_class = params[:second_id]
		#
	    #first run to see if I can determine someone's school fees estimate for a particular class
    	 if !(@first_child_class == "") && @second_child_class == ""
		    if @first_child_class == "1"
		      @current_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
		    elsif @first_child_class == "2"
		      @current_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
		    elsif @first_child_class == "3"
		      @current_fees = @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
		    elsif @first_child_class == "4"
		       @current_fees = @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
		    elsif @first_child_class == "5"
		       @current_fees =@school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
		    elsif @first_child_class == "6"
		       @current_fees = @school.primary_six + @school.reg_fees + @school.exam_fees
			end

		 elsif @first_child_class == "" && !(@second_child_class == "")
	    	if @second_child_class == "1"
	      		@current_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    	elsif @second_child_class == "2"
	      		@current_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    	elsif @second_child_class == "3"
	      		@current_fees = @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    	elsif @second_child_class == "4"
	       		@current_fees = @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    	elsif @second_child_class == "5"
	       		@current_fees =@school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    	elsif @second_child_class == "6"
	       		@current_fees = @school.primary_six + @school.reg_fees + @school.exam_fees
		    	#check
		    end

	    elsif !(@first_child_class == "") && !(@second_child_class == "")
	    	if (@first_child_class == "1") && (@second_child_class == "1")
	    		@first_child_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "1") && (@second_child_class == "2")
	    		@first_child_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "1") && (@second_child_class == "3")
	    		@first_child_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "1") && (@second_child_class == "4")
	    		@first_child_fees =	@school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "1") && (@second_child_class == "5")
	    		@first_child_fees =	@school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "1") && (@second_child_class == "6")
	    		@first_child_fees =	@school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "2") && (@second_child_class == "1")
	    		@first_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "2") && (@second_child_class == "2")
	    		@first_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "2") && (@second_child_class == "3")
	    		@first_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "2") && (@second_child_class == "4")
	    		@first_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "2") && (@second_child_class == "5")
	    		@first_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees	
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "2") && (@second_child_class == "6")
				@first_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_six + @school.reg_fees + @school.exam_fees	
	    		@current_fees = @first_child_fees + @second_child_fees
	    			
	    	elsif (@first_child_class == "3") && (@second_child_class == "1")
	    		@first_child_fees =   @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "3") && (@second_child_class == "2")
				@first_child_fees =   @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "3") && (@second_child_class == "3")
	    		@first_child_fees =   @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "3") && (@second_child_class == "4")
				@first_child_fees =   @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "3") && (@second_child_class == "5")
				@first_child_fees =   @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "3") && (@second_child_class == "6")
				@first_child_fees =   @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees
	    			
	    	elsif (@first_child_class == "4") && (@second_child_class == "1")
	    		@first_child_fees =   @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "4") && (@second_child_class == "2")
				@first_child_fees =   @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees
	    		
	    	elsif (@first_child_class == "4") && (@second_child_class == "3")
	    		@first_child_fees =   @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees
	    		
	    	elsif (@first_child_class == "4") && (@second_child_class == "4")
	    		@first_child_fees =   @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees
	    		
	    	elsif (@first_child_class == "4") && (@second_child_class == "5")
	  			@first_child_fees =   @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "4") && (@second_child_class == "6")
	    		@first_child_fees =   @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees
	    			
	    	elsif (@first_child_class == "5") && (@second_child_class == "1")
	    		@first_child_fees =   @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "5") && (@second_child_class == "2")
				@first_child_fees =   @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees
	    			
	    	elsif (@first_child_class == "5") && (@second_child_class == "3")
	    		@first_child_fees =   @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees
	    		
	    	elsif (@first_child_class == "5") && (@second_child_class == "4")
	    		@first_child_fees =   @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees
	    		
	    	elsif (@first_child_class == "5") && (@second_child_class == "5")
	    		@first_child_fees =   @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees
	    	
	    	elsif (@first_child_class == "5") && (@second_child_class == "6")
	    		@first_child_fees =   @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@second_child_fees = @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees
	    	

	    	elsif (@first_child_class == "6") && (@second_child_class == "1")
	    		@first_child_fees =   @school.primary_six + @school.reg_fees + @school.exam_fees
	  	  		@second_child_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

			elsif (@first_child_class == "6") && (@second_child_class == "2")
	    		@first_child_fees =   @school.primary_six + @school.reg_fees + @school.exam_fees
	  	  		@second_child_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "6") && (@second_child_class == "3")
	    		@first_child_fees =   @school.primary_six + @school.reg_fees + @school.exam_fees
	  	  		@second_child_fees = @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees
			
			elsif (@first_child_class == "6") && (@second_child_class == "4")
	    		@first_child_fees =   @school.primary_six + @school.reg_fees + @school.exam_fees
	  	  		@second_child_fees = @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "6") && (@second_child_class == "5")
	    		@first_child_fees =   @school.primary_six + @school.reg_fees + @school.exam_fees
	  	  		@second_child_fees = @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	elsif (@first_child_class == "6") && (@second_child_class == "6")
	    		@first_child_fees =   @school.primary_six + @school.reg_fees + @school.exam_fees
	  	  		@second_child_fees = @school.primary_six + @school.reg_fees + @school.exam_fees
	    		@current_fees = @first_child_fees + @second_child_fees

	    	else
	    		@current_fees = 0
	    	end#end of combo segon.lection, return current_fees after this
	  		#@current_fees = @first_child_fees + @second_child_fees
	    else
	    	#notice: 'No class was selected for either child. Please pick a child'
	    end	
		            
	   # render gon.'check'
	end
end
