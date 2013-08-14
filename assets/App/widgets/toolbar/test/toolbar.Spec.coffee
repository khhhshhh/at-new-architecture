define (require)->

	describe 'This is a test', ()->

		it ' is a dog', ()->
			expect(true).toBeTruthy() 

		it ' underscore', ()->	
			expect(_).toBeObject()